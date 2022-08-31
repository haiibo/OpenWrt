#!/bin/bash

TMPDIR=openwrt-armvirt

[ -d "$TMPDIR" ] && rm -rf "$TMPDIR"

mkdir -p "$TMPDIR"  && \
gzip -dc openwrt-armvirt-64-default-rootfs.tar.gz | ( cd "$TMPDIR" && tar xf - ) && \
cp -f patches/rc.local "$TMPDIR/etc/" && \
cp -f patches/cpustat "$TMPDIR/usr/bin/" && chmod 755 "$TMPDIR/usr/bin/cpustat" && \
cp -f patches/getcpu "$TMPDIR/bin/" && chmod 755 "$TMPDIR/bin/getcpu" && \
cat patches/luci-admin-status-index-html.patch | (cd "$TMPDIR/usr/lib/lua/luci/view/admin_status/" && patch -p0) && \
rm -f "$TMPDIR/etc/bench.log" && \
sed -e 's/\/opt/\/etc/' -i "${TMPDIR}/etc/config/qbittorrent" && \
# sed -e "s/#PermitRootLogin prohibit-password/PermitRootLogin yes/" -i "${TMPDIR}/etc/ssh/sshd_config" && \
sss=$(date +%s) && \
ddd=$((sss/86400)) && \
sed -e "s/:0:0:99999:7:::/:${ddd}:0:99999:7:::/" -i "${TMPDIR}/etc/shadow" && \
echo "17 3 * * * /etc/coremark.sh" >> "$TMPDIR/etc/crontabs/root" && \
rm -rf "$TMPDIR/lib/firmware/*" "$TMPDIR/lib/modules/*" && \
(cd "$TMPDIR" && tar cf ../openwrt-armvirt-64-default-rootfs-patched.tar .) && \
rm -rf "$TMPDIR"
