#!/usr/bin/env sh

# 发生错误时终止
set -e

# 构建
npm run build

# 放置 .nojekyll 以绕过 Jekyll 的处理。
echo > ./docs/nojekyll


# 如果你要部署到自定义域名
echo 'f1ybear.github.io/bookmark/' > ./docs/CNAME


git add -A
git commit -m 'deploy'

# 如果你要部署在 https://<USERNAME>.github.io
git push origin-github master
git push origin master