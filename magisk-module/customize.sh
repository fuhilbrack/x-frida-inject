mkdir -p "$MODPATH/system/bin"
# 创建脚本目录，保证 root 可读；755 便于 adb push 后服务能读
mkdir -p /data/misc/user/0/frida-inject
chmod 755 /data/misc/user/0/frida-inject
chown system:system /data/misc/user/0/frida-inject
api_level_arch_detect
[ ! -d "$MODPATH/libs/$ABI" ] && abort "! $ABI not supported"
cp -af "$MODPATH/libs/$ABI/"* "$MODPATH/system/bin"
rm -rf "$MODPATH/libs"
chcon -R u:object_r:system_file:s0 "$MODPATH/system"
chmod -R 755 "$MODPATH/system/bin"
