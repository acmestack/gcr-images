# 使用最新的 Alpine Linux
FROM alpine:latest

# 设置环境变量，避免交互式配置
ENV TZ=UTC

# 安装软件包
# 1. 更新包索引
# 2. 启用 edge/community 仓库以获取更新的包
# 3. 安装 Python 3、pip 和 SQLite
# 4. 清理缓存以减小镜像体积
RUN apk update && \
    echo "http://dl-cdn.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories && \
    apk add --no-cache \
        python3 \
        py3-pip \
        sqlite \
        # 如果需要编译Python扩展，可能需要以下包
        python3-dev \
        gcc \
        musl-dev \
        && \
    # 验证版本
    python3 --version && \
    sqlite3 --version
