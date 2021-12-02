## 说明

- 项目使用 Github Actions 下载 [Lean](https://github.com/coolsnowwolf/lede) 的 `Openwrt` 源码仓库进行云编译
- 设置定时自动编译（北京时间每天早上6点左右自动触发编译）
- 固件默认IP地址：`10.10.10.10` 默认密码：`password`
- 适配的机型有：`X86_64`、`NanoPi_R2S`、`NanoPi_R4S`、`N1`、`HK1_BOX` 以及其他ARM盒子等
- ARM盒子固件分为[➦MINI版](https://github.com/haiibo/OpenWrt/releases/tag/ARMv8_MINI) 和[➦PLUS版](https://github.com/haiibo/OpenWrt/releases/tag/ARMv8_PLUS)，MINI精简版适合科学上网为主要需求的用户，PLUS多功能版插件多适合喜欢捣腾各种功能的用户
- 其他型号 `X86_64`、`NanoPi_R2S`、`NanoPi_R4S` 所集成的插件除个别不通用插件以外其他均与PLUS版本一致
- 仓库编译的固件插件均为最新版本，最新版意味着可能有BUG，如果你之前使用稳定，则无需追新！

## Mini版插件预览
 ![Mini预览](https://github.com/haiibo/OpenWrt/blob/main/imgs/mini.jpg)
 
## Plus版插件预览
 ![Plus预览](https://github.com/haiibo/OpenWrt/blob/main/imgs/plus.jpg)

## 喜欢的可以给个Star，感谢各位！想要自己编译固件的可以Fork！
项目使用说明
- 右上角点击自己头像 → Settings → Developer settings → Personal access tokens里面创建个人访问令牌，固件发布会调用，否则可能无法发布
- Fork本项目
- 点击Actions → 要编译的Workflows → Run workflow → Run workflow 一般一次编译要3~5小时
- `ARMv8_Mini OpenWrt` ARMv8_Mini精简版编译和打包
- `ARMv8_Plus OpenWrt` ARMv8_Plus多功能版编译和打包
- `ARMv8 Package` 用编译好的ARMv8临时固件进行打包，一般是在内核更新需要单独打包的时候运行
- `Make Config Files` 制作config文件，将自己定制的config文件整理成完整的config文件
- `X86_64 OpenWrt` X86_64多功能版编译
- `NanoPi_R2S OpenWrt` NanoPi_R2S多功能版编译
- `NanoPi_R4S OpenWrt` NanoPi_R4S多功能版编译

## 声明
- 我只是出于个人爱好学习编译创建的这个项目，刷此固件本人不承担任何后果以及技术支持！

## 感谢

- [flippy](https://github.com/unifreq/openwrt_packit)
- [ophub](https://github.com/ophub/op)
- [P3TERX](https://github.com/P3TERX/Actions-OpenWrt)
- [breakings](https://github.com/breakings/OpenWrt)
- [coolsnowwolf](https://github.com/coolsnowwolf/lede)
