# 说明

- 本项目使用 Github Actions 使用 [Lean](https://github.com/coolsnowwolf/lede) 的 `Openwrt` 源码仓库，进行云编译打包。
- 基于flippy大的打包脚本，适配的机型有：微加云、贝壳云、我家云、N1、S905x3（包括常见的hk1、h96、x96等盒子）、章鱼星球、s922x（目前支持GT-King、GT-King Pro两款盒子） 等！
- 本项目使用定时编译（北京时间每周六凌晨0点开始自动运行编译）及触发编译。
- releases中的直刷固件分为[***MINI版***](https://github.com/hhaibo/ARMv8-OpenWrt/releases/tag/ARMv8_MINI) 和[***PLUS版***](https://github.com/hhaibo/ARMv8-OpenWrt/releases/tag/ARMv8_PLUS)，MINI版主要适合科学上网为主要需求的用户，PLUS版是正常多插件版本集成各种常用插件。
- 固件默认IP：`10.10.10.11` 默认密码：`password`
- 刷机和升级方法请参考f大这两个帖子：[➦旧帖](https://www.right.com.cn/forum/thread-981406-1-1.html) 和 [➦新帖](https://www.right.com.cn/forum/thread-4055451-1-1.html)

## 感谢 ❤️

- [P3TERX](https://github.com/P3TERX/Actions-OpenWrt)
- [breakings](https://github.com/breakings/OpenWrt)
- [Lienol/openwrt](https://github.com/Lienol/openwrt)
- [coolsnowwolf/lede](https://github.com/coolsnowwolf/lede)
- [unifreq/openwrt_packit](https://github.com/unifreq/openwrt_packit)

## License

[MIT](https://github.com/P3TERX/Actions-OpenWrt/blob/main/LICENSE) © [**P3TERX**](https://p3terx.com)
