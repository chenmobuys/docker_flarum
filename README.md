# Docker-compose 部署Flarum

### 执行初始化命令

项目根目录下执行 `/path/to/docker-lnmp`
```bash
docker-compose build && chown -R www-data.www-data `ls -F |grep "/$"`
```

### 运行项目
```bash
docker-compose up
```

### 安装

数据库配置信息请查看 `mysql/scripts/init.sql`

默认数据库配置：

* 数据库名：flarum
* 用户名：flarum
* 密码：flarum
