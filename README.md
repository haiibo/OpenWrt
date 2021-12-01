## 说明

- 项目使用 Github Actions 下载 [Lean](https://github.com/coolsnowwolf/lede) 的 `Openwrt` 源码仓库进行云编译
- 基于flippy大的打包脚本打包，适配的机型有：`微加云`、`贝壳云`、`我家云`、`N1`、`S905x3`（包括常见的`hk1`、`h96`、`x96`等盒子）、`s922x`（目前支持`GT-King`、`GT-King Pro`、`Odroid-n2`三款盒子） 等
- Releases中的直刷固件分为[➦MINI版](https://github.com/haiibo/OpenWrt/releases/tag/ARMv8_MINI) 和[➦PLUS版](https://github.com/haiibo/OpenWrt/releases/tag/ARMv8_PLUS)，MINI精简版适合科学上网为主要需求的用户，PLUS多功能版本插件多适合喜欢捣腾各种功能的用户
- 项目使用定时编译（北京时间每天早上6点自动触发编译）
- 固件默认IP：`10.10.10.10` 默认密码：`password`
- +内核版本较新，+o内核版本相对+内核版本更稳定，f大不建议N1等盒子使用+内核版本，推荐使用+o内核版本
- 刷机和升级方法以及注意事项请参考恩山flippy大帖子：[➦旧帖](https://www.right.com.cn/forum/thread-4055451-1-1.html) 和 [➦新帖](https://www.right.com.cn/forum/thread-4076037-1-1.html)
- U盘写入EMMC：登录OpenWrt → 系统 → 晶晨宝盒 → 安装OpenWrt → 选择型号 → 安装
- 升级OpenWrt：登录OpenWrt → 系统 → 晶晨宝盒 → 手动上传更新 `或` 在线下载更新 → 完整更新全系统
- 不要盲目追新，仓库编译打包的固件插件为最新版本，最新版意味着可能有BUG，如果之前使用稳定，无需追新

## Mini版插件预览
 ![Mini预览](https://github.com/haiibo/OpenWrt/blob/main/imgs/mini.jpg)
 
## Plus版插件预览
 ![Plus预览](https://github.com/haiibo/OpenWrt/blob/main/imgs/plus.jpg)

## 喜欢的可以给个Star，感谢各位！想要自己编译固件的可以Fork
项目使用说明
- 右上角点击自己头像 → Settings → Developer settings → Personal access tokens里面创建个人访问令牌，固件发布会调用，否则可能无法发布
- Fork本项目
- 点击Actions → 要编译的Workflows → Run workflow → Run workflow 一般一次编译要3~5小时
- `Mini OpenWrt` Mini精简版编译和打包
- `Plus OpenWrt` Plus多功能版编译和打包
- `Package` 用编译好的临时固件进行打包，一般是在内核更新需要单独打包的时候运行
- `Make Config` 制作config文件，将自己定制的config文件整理成完整的config文件

## 声明
- 我只是出于个人爱好学习编译创建的这个项目，刷此固件本人不承担任何后果以及技术支持！

## 感谢

- [flippy](https://github.com/unifreq/openwrt_packit)
- [ophub](https://github.com/ophub/op)
- [P3TERX](https://github.com/P3TERX/Actions-OpenWrt)
- [breakings](https://github.com/breakings/OpenWrt)
- [coolsnowwolf](https://github.com/coolsnowwolf/lede)
