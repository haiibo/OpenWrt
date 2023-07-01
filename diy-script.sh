#!/bin/bash
#===============================================
# Description: DIY script
# File name: diy-script.sh
# Lisence: MIT
# Author: P3TERX
# Blog: https://p3terx.com
#===============================================

# Set BIOS Boot Partition to 1 MiB
sed -i 's/256/1024/g' target/linux/x86/image/Makefile

# Linux kernel 6.1
sed -i 's/5.15/6.1/g' target/linux/x86/Makefile

# Default Language - English
sed -i "/exit/ised -i \"s/'zh_cn'/'en'/g\" /etc/config/luci\n" package/base-files/files/etc/rc.local

# uhttpd cert
sed -i 's/uhttpd.crt/uhttpd.pem/g' package/network/services/uhttpd/files/uhttpd.config

# Netdata SSL
sed -i 's/DEPENDS:=+zlib +libuuid +libuv +libmnl +libjson-c/DEPENDS:=+zlib +libuuid +libuv +libmnl +libjson-c +libopenssl/g' feeds/packages/admin/netdata/Makefile
sed -i 's/disable-https/enable-https/g' feeds/packages/admin/netdata/Makefile
sed -i '/\[\plugins/i\        SSL certificate = /etc/netdata/ssl/cert.pem\n        SSL key = /etc/netdata/ssl/key.pem\n' feeds/packages/admin/netdata/files/netdata.conf
sed -i 's/http/https/g' package/feeds/luci/luci-app-netdata/luasrc/view/netdata/netdata.htm

# 修改默认IP
# sed -i 's/192.168.1.1/10.0.0.1/g' package/base-files/files/bin/config_generate

# Network Configuration
sed -i "/exit/iuci set network.wan.ifname=\'eth0\'\nuci set network.wan6.ifname=\'eth1\'\nuci set network.wan.proto=\'pppoe\'\nuci set network.wan.username=\'990003835168\'\nuci set network.wan.password=\'k5k4t5b6\'\nuci set network.lan.netmask=\'255.255.255.0\'\nuci set network.lan.dns=\'192.168.50.5 119.29.29.29 223.5.5.5\'\nuci set network.lan.ifname=\'eth2 eth3 eth4\'\nuci commit network\nuci set dhcp.lan.ignore=\'0\'\nuci set dhcp.lan.start=\'150\'\nuci set dhcp.lan.limit=\'100\'\nuci set dhcp.lan.ra_management=\'1\'\nuci add_list dhcp.lan.dhcp_option=\'6,192.168.50.5,119.29.29.29\'\nuci set dhcp.lan.force=\'1\'\nuci add dhcp host\nuci set dhcp.@host[-1].name=\'HOME-SRV\'\nuci set dhcp.@host[-1].dns=\'1\'\nuci set dhcp.@host[-1].mac=\'90:2e:16:bd:0b:cc\'\nuci set dhcp.@host[-1].ip=\'192.168.50.8\'\nuci set dhcp.@host[-1].leasetime=\'infinite\'\nuci add dhcp host\nuci set dhcp.@host[-1].name=\'EAX80\'\nuci set dhcp.@host[-1].dns=\'1\'\nuci set dhcp.@host[-1].mac=\'3c:37:86:c8:e8:05\'\nuci set dhcp.@host[-1].ip=\'192.168.50.6\'\nuci set dhcp.@host[-1].leasetime=\'infinite\'\nuci add dhcp host\nuci set dhcp.@host[-1].name=\'ESIWIN\'\nuci set dhcp.@host[-1].dns=\'1\'\nuci set dhcp.@host[-1].mac=\'d8:f8:83:36:03:49\'\nuci set dhcp.@host[-1].ip=\'192.168.50.68\'\nuci set dhcp.@host[-1].leasetime=\'infinite\'\nuci commit dhcp\nuci add firewall redirect\nuci set firewall.@redirect[-1].target=\'DNAT\'\nuci set firewall.@redirect[-1].src=\'wan\'\nuci set firewall.@redirect[-1].dest=\'lan\'\nuci set firewall.@redirect[-1].proto=\'tcp udp\'\nuci set firewall.@redirect[-1].src_dport=\'1688\'\nuci set firewall.@redirect[-1].dest_ip=\'192.168.50.2\'\nuci set firewall.@redirect[-1].dest_port=\'1688\'\nuci set firewall.@redirect[-1].name=\'KMS\'\nuci add firewall redirect\nuci set firewall.@redirect[-1].target=\'DNAT\'\nuci set firewall.@redirect[-1].src=\'wan\'\nuci set firewall.@redirect[-1].proto=\'tcp\'\nuci set firewall.@redirect[-1].src_dport=\'3389\'\nuci set firewall.@redirect[-1].dest_ip=\'192.168.50.8\'\nuci set firewall.@redirect[-1].dest_port=\'3389\'\nuci set firewall.@redirect[-1].name=\'RDP\'\nuci set firewall.@redirect[-1].dest=\'lan\'\nuci add firewall redirect\nuci set firewall.@redirect[-1].target=\'DNAT\'\nuci set firewall.@redirect[-1].src=\'wan\'\nuci set firewall.@redirect[-1].proto=\'tcp udp\'\nuci set firewall.@redirect[-1].src_dport=\'2302\'\nuci set firewall.@redirect[-1].dest_ip=\'192.168.50.8\'\nuci set firewall.@redirect[-1].dest_port=\'2302\'\nuci set firewall.@redirect[-1].name=\'DayZ\'\nuci set firewall.@redirect[-1].dest=\'lan\'\nuci add firewall redirect\nuci set firewall.@redirect[-1].target=\'DNAT\'\nuci set firewall.@redirect[-1].src=\'wan\'\nuci set firewall.@redirect[-1].dest=\'lan\'\nuci set firewall.@redirect[-1].proto=\'udp\'\nuci set firewall.@redirect[-1].src_dport=\'27016\'\nuci set firewall.@redirect[-1].dest_ip=\'192.168.50.8\'\nuci set firewall.@redirect[-1].dest_port=\'27016\'\nuci set firewall.@redirect[-1].name=\'DayZ\'\nuci add firewall redirect\nuci set firewall.@redirect[-1].target=\'DNAT\'\nuci set firewall.@redirect[-1].src=\'wan\'\nuci set firewall.@redirect[-1].dest=\'lan\'\nuci set firewall.@redirect[-1].proto=\'tcp udp\'\nuci set firewall.@redirect[-1].src_dport=\'2308\'\nuci set firewall.@redirect[-1].dest_ip=\'192.168.50.8\'\nuci set firewall.@redirect[-1].dest_port=\'2308\'\nuci set firewall.@redirect[-1].name=\'DayZ\'\nuci add firewall redirect\nuci set firewall.@redirect[-1].target=\'DNAT\'\nuci set firewall.@redirect[-1].src=\'wan\'\nuci set firewall.@redirect[-1].dest=\'lan\'\nuci set firewall.@redirect[-1].proto=\'tcp udp\'\nuci set firewall.@redirect[-1].src_dport=\'8098\'\nuci set firewall.@redirect[-1].dest_ip=\'192.168.50.2\'\nuci set firewall.@redirect[-1].dest_port=\'80\'\nuci set firewall.@redirect[-1].name=\'Router\'\nuci add firewall redirect\nuci set firewall.@redirect[-1].target=\'DNAT\'\nuci set firewall.@redirect[-1].src=\'wan\'\nuci set firewall.@redirect[-1].dest=\'lan\'\nuci set firewall.@redirect[-1].proto=\'tcp udp\'\nuci set firewall.@redirect[-1].src_dport=\'8043\'\nuci set firewall.@redirect[-1].dest_ip=\'192.168.50.2\'\nuci set firewall.@redirect[-1].dest_port=\'443\'\nuci set firewall.@redirect[-1].name=\'Router\'\nuci add firewall redirect\nuci set firewall.@redirect[-1].target=\'DNAT\'\nuci set firewall.@redirect[-1].src=\'wan\'\nuci set firewall.@redirect[-1].dest=\'lan\'\nuci set firewall.@redirect[-1].proto=\'tcp udp\'\nuci set firewall.@redirect[-1].src_dport=\'8099\'\nuci set firewall.@redirect[-1].dest_ip=\'192.168.50.9\'\nuci set firewall.@redirect[-1].dest_port=\'19999\'\nuci set firewall.@redirect[-1].name=\'Netdata\'\nuci add firewall redirect\nuci set firewall.@redirect[-1].target=\'DNAT\'\nuci set firewall.@redirect[-1].src=\'wan\'\nuci set firewall.@redirect[-1].dest=\'lan\'\nuci set firewall.@redirect[-1].proto=\'tcp udp\'\nuci set firewall.@redirect[-1].src_dport=\'9090\'\nuci set firewall.@redirect[-1].dest_ip=\'192.168.50.2\'\nuci set firewall.@redirect[-1].dest_port=\'9090\'\nuci set firewall.@redirect[-1].name=\'OpenClash\'\nuci add firewall redirect\nuci set firewall.@redirect[-1].target=\'DNAT\'\nuci set firewall.@redirect[-1].src=\'wan\'\nuci set firewall.@redirect[-1].dest=\'lan\'\nuci set firewall.@redirect[-1].proto=\'tcp udp\'\nuci set firewall.@redirect[-1].src_dport=\'19999\'\nuci set firewall.@redirect[-1].dest_ip=\'192.168.50.2\'\nuci set firewall.@redirect[-1].dest_port=\'19999\'\nuci set firewall.@redirect[-1].name=\'LedeNetdata\'\nuci add firewall redirect\nuci set firewall.@redirect[-1].target=\'DNAT\'\nuci set firewall.@redirect[-1].src=\'wan\'\nuci set firewall.@redirect[-1].dest=\'lan\'\nuci set firewall.@redirect[-1].proto=\'tcp udp\'\nuci set firewall.@redirect[-1].src_dport=\'7681\'\nuci set firewall.@redirect[-1].dest_ip=\'192.168.50.2\'\nuci set firewall.@redirect[-1].dest_port=\'7681\'\nuci set firewall.@redirect[-1].name=\'TTYD\'\nuci add firewall redirect\nuci set firewall.@redirect[-1].target=\'DNAT\'\nuci set firewall.@redirect[-1].src=\'wan\'\nuci set firewall.@redirect[-1].dest=\'lan\'\nuci set firewall.@redirect[-1].proto=\'tcp udp\'\nuci set firewall.@redirect[-1].src_dport=\'8095\'\nuci set firewall.@redirect[-1].dest_ip=\'192.168.50.5\'\nuci set firewall.@redirect[-1].dest_port=\'443\'\nuci set firewall.@redirect[-1].name=\'ADGuard\'\nuci add firewall redirect\nuci set firewall.@redirect[-1].target=\'DNAT\'\nuci set firewall.@redirect[-1].src=\'wan\'\nuci set firewall.@redirect[-1].dest=\'lan\'\nuci set firewall.@redirect[-1].proto=\'tcp udp\'\nuci set firewall.@redirect[-1].src_dport=\'8096\'\nuci set firewall.@redirect[-1].dest_ip=\'192.168.50.10\'\nuci set firewall.@redirect[-1].dest_port=\'443\'\nuci set firewall.@redirect[-1].name=\'ESXi\'\nuci add firewall redirect\nuci set firewall.@redirect[-1].target=\'DNAT\'\nuci set firewall.@redirect[-1].src=\'wan\'\nuci set firewall.@redirect[-1].dest=\'lan\'\nuci set firewall.@redirect[-1].proto=\'tcp udp\'\nuci set firewall.@redirect[-1].src_dport=\'8094\'\nuci set firewall.@redirect[-1].dest_ip=\'192.168.50.7\'\nuci set firewall.@redirect[-1].dest_port=\'5700\'\nuci set firewall.@redirect[-1].name=\'QL\'\nuci commit firewall\nuci commit firewall\nuci set ddns.AliDDNS=\'service\'\nuci set ddns.AliDDNS.service_name=\'aliyun.com\'\nuci set ddns.AliDDNS.enabled=\'1\'\nuci set ddns.AliDDNS.lookup_host=\'home.bmwlive.club\'\nuci set ddns.AliDDNS.domain=\'home.bmwlive.club\'\nuci set ddns.AliDDNS.username=\'LTAIHiwKt52WZmKg\'\nuci set ddns.AliDDNS.password=\'Wlxr4IEL1IQKPtXaBlhVlGWqefF8BK\'\nuci set ddns.AliDDNS.ip_source=\'web\'\nuci set ddns.AliDDNS.ip_url=\'http://ip.3322.net\'\nuci set ddns.AliDDNS.bind_network=\'wan\'\nuci commit ddns\n" package/lean/default-settings/files/zzz-default-settings


# 更改默认 Shell 为 zsh
# sed -i 's/\/bin\/ash/\/usr\/bin\/zsh/g' package/base-files/files/etc/passwd

# TTYD 自动登录 & SSL
sed -i "/command/a\        option ssl '1'\n        option ssl_cert /etc/uhttpd.pem\n        option ssl_key /etc/uhttpd.key" feeds/packages/utils/ttyd/files/ttyd.config
# sed -i 's|/bin/login|/bin/login -f root|g' feeds/packages/utils/ttyd/files/ttyd.config

# 移除要替换的包
rm -rf feeds/packages/net/mosdns
rm -rf feeds/packages/net/msd_lite
rm -rf feeds/packages/net/smartdns
rm -rf feeds/luci/themes/luci-theme-argon
rm -rf feeds/luci/themes/luci-theme-netgear
rm -rf feeds/luci/applications/luci-app-dockerman
rm -rf feeds/luci/applications/luci-app-mosdns
rm -rf feeds/luci/applications/luci-app-netdata
rm -rf feeds/luci/applications/luci-app-serverchan

# 添加额外插件
git clone --depth=1 https://github.com/kongfl888/luci-app-adguardhome package/luci-app-adguardhome
git clone --depth=1 https://github.com/tty228/luci-app-serverchan package/luci-app-serverchan
git clone --depth=1 https://github.com/iwrt/luci-app-ikoolproxy package/luci-app-ikoolproxy
git clone --depth=1 https://github.com/esirplayground/luci-app-poweroff package/luci-app-poweroff
git clone --depth=1 https://github.com/destan19/OpenAppFilter package/OpenAppFilter
git clone --depth=1 https://github.com/Jason6111/luci-app-netdata package/luci-app-netdata
svn export https://github.com/Lienol/openwrt-package/trunk/luci-app-filebrowser package/luci-app-filebrowser
svn export https://github.com/Lienol/openwrt-package/trunk/luci-app-ssr-mudb-server package/luci-app-ssr-mudb-server
svn export https://github.com/lisaac/luci-app-dockerman/trunk/applications/luci-app-dockerman package/luci-app-dockerman
svn export https://github.com/immortalwrt/luci/branches/openwrt-18.06/applications/luci-app-eqos package/luci-app-eqos
svn export https://github.com/syb999/openwrt-19.07.1/trunk/package/network/services/msd_lite package/msd_lite

# 科学上网插件
git clone --depth=1 https://github.com/fw876/helloworld package/luci-app-ssr-plus
git clone --depth=1 https://github.com/jerrykuku/luci-app-vssr package/luci-app-vssr
git clone --depth=1 https://github.com/jerrykuku/lua-maxminddb package/lua-maxminddb
git clone --depth=1 https://github.com/xiaorouji/openwrt-passwall package/openwrt-passwall
svn export https://github.com/xiaorouji/openwrt-passwall/branches/luci/luci-app-passwall package/luci-app-passwall
svn export https://github.com/xiaorouji/openwrt-passwall2/trunk/luci-app-passwall2 package/luci-app-passwall2
svn export https://github.com/vernesong/OpenClash/trunk/luci-app-openclash package/luci-app-openclash

# Themes
git clone --depth=1 -b 18.06 https://github.com/kiddin9/luci-theme-edge package/luci-theme-edge
git clone --depth=1 -b 18.06 https://github.com/jerrykuku/luci-theme-argon package/luci-theme-argon
git clone --depth=1 https://github.com/jerrykuku/luci-app-argon-config package/luci-app-argon-config
git clone --depth=1 https://github.com/xiaoqingfengATGH/luci-theme-infinityfreedom package/luci-theme-infinityfreedom
svn export https://github.com/haiibo/packages/trunk/luci-theme-atmaterial package/luci-theme-atmaterial
svn export https://github.com/haiibo/packages/trunk/luci-theme-opentomcat package/luci-theme-opentomcat
svn export https://github.com/haiibo/packages/trunk/luci-theme-netgear package/luci-theme-netgear

# 更改 Argon 主题背景
cp -f $GITHUB_WORKSPACE/images/bg1.jpg package/luci-theme-argon/htdocs/luci-static/argon/img/bg1.jpg

# 晶晨宝盒
svn export https://github.com/ophub/luci-app-amlogic/trunk/luci-app-amlogic package/luci-app-amlogic
sed -i "s|firmware_repo.*|firmware_repo 'https://github.com/haiibo/OpenWrt'|g" package/luci-app-amlogic/root/etc/config/amlogic
# sed -i "s|kernel_path.*|kernel_path 'https://github.com/ophub/kernel'|g" package/luci-app-amlogic/root/etc/config/amlogic
sed -i "s|ARMv8|ARMv8_PLUS|g" package/luci-app-amlogic/root/etc/config/amlogic

# SmartDNS
git clone --depth=1 -b lede https://github.com/pymumu/luci-app-smartdns package/luci-app-smartdns
git clone --depth=1 https://github.com/pymumu/openwrt-smartdns package/smartdns

# MosDNS
svn export https://github.com/sbwml/luci-app-mosdns/trunk/luci-app-mosdns package/luci-app-mosdns
svn export https://github.com/sbwml/luci-app-mosdns/trunk/mosdns package/mosdns

# DDNS.to
svn export https://github.com/linkease/nas-packages-luci/trunk/luci/luci-app-ddnsto package/luci-app-ddnsto
svn export https://github.com/linkease/nas-packages/trunk/network/services/ddnsto package/ddnsto

# Alist
svn export https://github.com/sbwml/luci-app-alist/trunk/luci-app-alist package/luci-app-alist
svn export https://github.com/sbwml/luci-app-alist/trunk/alist package/alist

# iStore
svn export https://github.com/linkease/istore-ui/trunk/app-store-ui package/app-store-ui
svn export https://github.com/linkease/istore/trunk/luci package/luci-app-store

# 在线用户
svn export https://github.com/haiibo/packages/trunk/luci-app-onliner package/luci-app-onliner
sed -i '$i uci set nlbwmon.@nlbwmon[0].refresh_interval=2s' package/lean/default-settings/files/zzz-default-settings
sed -i '$i uci commit nlbwmon' package/lean/default-settings/files/zzz-default-settings
chmod 755 package/luci-app-onliner/root/usr/share/onliner/setnlbw.sh

# x86 型号只显示 CPU 型号
sed -i 's/${g}.*/${a}${b}${c}${d}${e}${f}${hydrid}/g' package/lean/autocore/files/x86/autocore

# 修改本地时间格式
sed -i 's/os.date()/os.date("%a %Y-%m-%d %H:%M:%S")/g' package/lean/autocore/files/*/index.htm

# 修改版本为编译日期
date_version=$(date +"%y.%m.%d")
orig_version=$(cat "package/lean/default-settings/files/zzz-default-settings" | grep DISTRIB_REVISION= | awk -F "'" '{print $2}')
sed -i "s/${orig_version}/R${date_version} by Haiibo/g" package/lean/default-settings/files/zzz-default-settings

# 修复 hostapd 报错
cp -f $GITHUB_WORKSPACE/scripts/011-fix-mbo-modules-build.patch package/network/services/hostapd/patches/011-fix-mbo-modules-build.patch

# 修改 Makefile
find package/*/ -maxdepth 2 -path "*/Makefile" | xargs -i sed -i 's/..\/..\/luci.mk/$(TOPDIR)\/feeds\/luci\/luci.mk/g' {}
find package/*/ -maxdepth 2 -path "*/Makefile" | xargs -i sed -i 's/..\/..\/lang\/golang\/golang-package.mk/$(TOPDIR)\/feeds\/packages\/lang\/golang\/golang-package.mk/g' {}
find package/*/ -maxdepth 2 -path "*/Makefile" | xargs -i sed -i 's/PKG_SOURCE_URL:=@GHREPO/PKG_SOURCE_URL:=https:\/\/github.com/g' {}
find package/*/ -maxdepth 2 -path "*/Makefile" | xargs -i sed -i 's/PKG_SOURCE_URL:=@GHCODELOAD/PKG_SOURCE_URL:=https:\/\/codeload.github.com/g' {}

# 取消主题默认设置
find package/luci-theme-*/* -type f -name '*luci-theme-*' -print -exec sed -i '/set luci.main.mediaurlbase/d' {} \;

# 调整 V2ray服务器 到 VPN 菜单
# sed -i 's/services/vpn/g' feeds/luci/applications/luci-app-v2ray-server/luasrc/controller/*.lua
# sed -i 's/services/vpn/g' feeds/luci/applications/luci-app-v2ray-server/luasrc/model/cbi/v2ray_server/*.lua
# sed -i 's/services/vpn/g' feeds/luci/applications/luci-app-v2ray-server/luasrc/view/v2ray_server/*.htm

./scripts/feeds update -a
./scripts/feeds install -a
