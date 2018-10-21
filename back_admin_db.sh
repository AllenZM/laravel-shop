#!/bin/bash

# 导入 .env  环境变量
source ./.env
# 要备份的表
tables="lnmp_admin_menu lnmp_admin_permissions lnmp_admin_role_menu lnmp_admin_role_permissions lnmp_admin_role_users lnmp_admin_roles lnmp_admin_user_permissions lnmp_admin_users"
# 执行备份
mysqldump --host="${DB_HOST}" --port=${DB_PORT} --user="${DB_USERNAME}" --password="${DB_PASSWORD}" -t ${DB_DATABASE} ${tables} > database/admin.sql