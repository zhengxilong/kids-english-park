#!/usr/bin/env bash
# 一键部署：提交所有改动并推送到 GitHub，Pages 会自动重新构建
# 用法：./deploy.sh            （使用默认提交信息）
#       ./deploy.sh "修改说明"  （自定义提交信息）

set -euo pipefail

cd "$(dirname "$0")"

MSG="${1:-更新学习页面}"

git add -A

if git diff --cached --quiet; then
  echo "ℹ️  没有需要提交的改动"
  exit 0
fi

echo "📦 即将提交："
git diff --cached --stat | tail -5

git commit -m "$MSG"
git push

echo ""
echo "✅ 推送完成，GitHub Pages 约 30~60 秒后自动更新："
echo "   https://zhengxilong.github.io/kids-english-park/"
