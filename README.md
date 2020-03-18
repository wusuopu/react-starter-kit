# react-starter-kit
create-react-app 的项目模板。项目包含的工具： TypeScript, rematch(redux), recompose, styled-components, ant-design, react-router, storybook, jest


# 快速开始
下载该项目模板之后，执行 `docker-compose up -d` 使用 docker 配置开发环境。
然后运行开发服务：

```
docker-compose exec app sh
yarn
yarn start
```


# 部署应用
构建 docker 镜像并进行部署。若 react 应用使用的是 `BrowserRouter` 还需要修改 `rootfs/etc/nginx/conf.d/default.conf` 的配置。
```
docker build -t <image-name> .
docker run -d <image-name>
```

该 docker image 可通过 `REACT_APP_CONFIG` 环境变量进行配置一些参数，该变量需要为一个 json 类型的对象。如：
```
docker run -d -e 'REACT_APP_CONFIG={"REACT_ROUTER_TYPE":"browser"}' <image-name>
```
