#!/bin/bash

# 自动检测系统架构
ARCH=$(uname -m)
case $ARCH in
    x86_64|amd64)
        ARCH_TYPE="amd64"
        ;;
    aarch64|arm64)
        ARCH_TYPE="arm64"
        ;;
    *)
        echo "不支持的架构: $ARCH"
        exit 1
        ;;
esac

echo "检测到系统架构: $ARCH ($ARCH_TYPE)"
echo ""

# vmpt="" cdnym="cf-cname.xingpingcn.top" argo="y" bash <(curl -Ls https://raw.githubusercontent.com/yonggekkk/argosbx/main/argosbx.sh)

# 下载 komari-agent
KOMARI_VERSION="1.1.12"
KOMARI_URL="https://github.com/komari-monitor/komari-agent/releases/download/${KOMARI_VERSION}/komari-agent-linux-${ARCH_TYPE}"

echo "正在下载 komari-agent (${ARCH_TYPE})..."
wget -q --show-progress "$KOMARI_URL" -O komari
chmod +x komari

echo "启动 komari 监控服务..."
nohup ./komari -e https://tz.fsytool.top -t ULp7GPLfStlm3LJoGfSWxy --ignore-unsafe-cert --memory-include-cache > komari.log 2>&1 &

echo "✓ komari 已启动（PID: $!）"
echo "日志文件: komari.log"
cat komari.log

# cat /home/runner/agsbx/jh.txt
