#!/usr/bin/env sh

# 发生错误时终止
set -e

# 构建
npm run build

# 放置 .nojekyll 以绕过 Jekyll 的处理。
echo > .nojekyll


# 如果你要部署到自定义域名
echo 'github.com/F1yBear/bookmark' > ./docs/CNAME


git add -A
git commit -m 'deploy'

# 如果你要部署在 https://<USERNAME>.github.io
git push origin-github master