#!/bin/bash
#=============================================================
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part1.sh
# Description: OpenWrt DIY script part 1 (Before Update feeds)
# Lisence: MIT
# Author: P3TERX
# Blog: https://p3terx.com
#=============================================================

# fw876/helloworld
#sed -i 's/^#\(.*helloworld\)/\1/' feeds.conf.default

# Lienol/openwrt-package
#sed -i '$a src-git lienol https://github.com/Lienol/openwrt-package' feeds.conf.default

# Modify Default Theme
sed -i 's/luci-theme-bootstrap/luci-theme-argon/g' feeds/luci/collections/luci/Makefile

# DownLoad OpenClash
mkdir package/luci-app-openclash
cd package/luci-app-openclash
git init
git remote add -f origin https://github.com/vernesong/OpenClash.git
git config core.sparsecheckout true
echo "luci-app-openclash" >> .git/info/sparse-checkout
git pull origin master
git branch --set-upstream-to=origin/master master
cd -
