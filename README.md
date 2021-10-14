## 说明

- 本项目使用 Github Actions 下载 [Lean](https://github.com/coolsnowwolf/lede) 的 `Openwrt` 源码仓库，进行云编译打包。
- 基于flippy大的打包脚本，适配的机型有：微加云、贝壳云、我家云、N1、S905x3（包括常见的hk1、h96、x96等盒子）、章鱼星球、s922x（目前支持GT-King、GT-King Pro两款盒子） 等！
- 本项目使用定时编译（北京时间每周六凌晨0点开始自动触发编译）。
- Releases中的直刷固件分为[***MINI版***](https://github.com/hhaibo/ARMv8-OpenWrt/releases/tag/ARMv8_MINI) 和[***PLUS版***](https://github.com/hhaibo/ARMv8-OpenWrt/releases/tag/ARMv8_PLUS)，MINI版主要适合科学上网为主要需求的用户，PLUS版是正常多插件版本集成各种常用插件。
- 固件默认IP：`10.10.10.11` 默认密码：`password`
- 刷机和升级方法请参考f大这两个帖子：[➦旧帖](https://www.right.com.cn/forum/thread-4055451-1-1.html) 和 [➦新帖](https://www.right.com.cn/forum/thread-4076037-1-1.html)

## 声明
- 刷机有风险需自行承担！我只是出于个人爱好学习编译创建的这个项目，小白刷此固件请三思，本人不承担任何后果和技术支持！

## Mini版插件预览
 ![applist](https://github.com/hhaibo/ARMv8-OpenWrt/blob/main/imgs/mini.jpg)
 
## Plus版插件预览
 ![applist](https://github.com/hhaibo/ARMv8-OpenWrt/blob/main/imgs/plus.jpg)

## 感谢 ❤️

- [flippy](https://github.com/unifreq/openwrt_packit)
- [ophub](https://github.com/ophub/op)
- [P3TERX](https://github.com/P3TERX/Actions-OpenWrt)
- [breakings](https://github.com/breakings/OpenWrt)
- [Lienol/openwrt](https://github.com/Lienol/openwrt)
- [coolsnowwolf/lede](https://github.com/coolsnowwolf/lede)
