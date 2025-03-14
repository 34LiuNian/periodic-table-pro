# 使用 Node.js 20 版本的官方镜像
FROM node:20-alpine

# 安装构建依赖工具（例如 build-essential 和 python）
RUN apk add --no-cache \
    bash \
    build-base \
    python3

# 设置工作目录
WORKDIR /app

# 复制 package.json 和 package-lock.json
COPY package*.json ./

# 安装项目依赖
RUN npm install

# 复制所有项目文件到容器内
COPY . .

# 构建 Next.js 应用
RUN npm run build

# 暴露 Next.js 运行端口
EXPOSE 3000

# 启动 Next.js 应用
CMD ["npm", "start"]
