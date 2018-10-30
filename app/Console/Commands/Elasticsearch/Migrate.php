<?php

namespace App\Console\Commands\Elasticsearch;

use Illuminate\Console\Command;

class Migrate extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'es:migrate';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = '=Elasticsearch 索引结构迁移';

    protected $es;

    /**
     * Create a new command instance.
     *
     * @return void
     */
    public function __construct()
    {
        parent::__construct();
    }

    /**
     * Execute the console command.
     *
     * @throws \Exception
     */
    public function handle()
    {
        $this->es = app('es');
        // 索引类树种，先留空
        $indices = [Indices\ProjectIndex::class];
        // 遍历索引类数组
        foreach ($indices as $index_class) {
            // 调用类数组的 getAliasName() 方法来获取索引别名
            $alias_name = $index_class::getAliasName();
            $this->info('正在处理索引' . $alias_name);
            // 通过exists 方法判断这个别名是否存在
            if (!$this->es->indices()->exists(['index' => $alias_name])) {
                $this->info('索引不存在，准备创建');
                $this->createIndex($alias_name, $index_class);
                $this->info('创建成功，准备初始化数据');
                $index_class::rebuild($alias_name);
                $this->info('操作成功');
                continue;
            }
            // 如果索引已经存在，那么尝试更新索引，如果更新失败会抛出异常
            try {
                $this->info('索引存在，准备更新');
                $this->updateIndex($alias_name, $index_class);
            } catch (\Exception $exception) {
                $this->warn('更新失败，准备重建');
                $this->reCreateIndex($alias_name, $index_class);
            }
            $this->info($alias_name . '操作成功');
        }
    }

    /**
     * 创建索引
     *
     * @param $alias_name
     * @param $index_class
     */
    protected function createIndex($alias_name, $index_class)
    {
        // 调用 create() 方法创建索引
        $this->es->indices()->create([
            // 第一个版本的索引名后缀为 _0
            'index' => $alias_name . '_0',
            'body' => [
                // 调用索引类的 getSettings() 方法获取索引设置
                'settings' => $index_class::getSettings(),
                'mappings' => [
                    '_doc' => [
                        // 调用索引类的 getProperties() 方法获取索引字段
                        'properties' => $index_class::getProperties(),
                    ],
                ],
                'aliases' => [
                    // 同时创建别名
                    $alias_name => new \stdClass(),
                ],
            ],
        ]);
    }

    /**
     * 更新已有索引
     *
     * @param $alias_name
     * @param $index_class
     */
    protected function updateIndex($alias_name, $index_class)
    {
        // 暂时关闭索引
        $this->es->indices()->close(['index' => $alias_name]);
        // 更新索引设置
        $this->es->indices()->putSettings([
            'index' => $alias_name,
            'body' => $index_class::getSettings(),
        ]);
        // 更新索引字段
        $this->es->indices()->putMapping([
            'index' => $alias_name,
            'type' => '_doc',
            'body' => [
                '_doc' => [
                    'properties' => $index_class::getProperties(),
                ],
            ],
        ]);

        // 重新打开索引
        $this->es->indices()->open(['index' => $alias_name]);
    }

    /**
     * 重建索引
     * @param $alias_name
     * @param $index_class
     * @throws \Exception
     */
    protected function reCreateIndex($alias_name, $index_class)
    {
        // 获取索引信息，返回结构的 key 为索引名称，value 为别名
        $index_info = $this->es->indices()->getAliases(['index' => $alias_name]);
        // 取出第一个 key 即为索引名称
        $index_name = array_keys($index_info)[0];
        // 用正则判断索引名称是否以 _数字 结尾
        if (!preg_match('~_(\d+)$~', $index_name, $m)) {
            $msg = '索引名称不正确:' . $index_name;
            $this->error($msg);
            throw new \Exception($msg);
        }
        // 新的索引名称
        $new_index_name = $alias_name . '_' . ($m[1] + 1);
        $this->info('正在创建索引' . $new_index_name);
        $this->es->indices()->create([
            'index' => $new_index_name,
            'body' => [
                'settings' => $index_class::getSettings(),
                'mappings' => [
                    '_doc' => [
                        'properties' => $index_class::getProperties(),
                    ],
                ],
            ],
        ]);
        $this->info('创建成功，准备重建数据');
        $index_class::rebuild($new_index_name);
        $this->info('重建成功，准备修改别名');
        $this->es->indices()->putAlias(['index' => $new_index_name, 'name' => $alias_name]);
        $this->info('修改成功，准备删除旧索引');
        $this->es->indices()->delete(['index' => $index_name]);
        $this->info('删除成功');
    }
}
