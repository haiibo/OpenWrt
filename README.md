说明：
- 基于**flippy大**的固件打包脚本，适配的机型有：***微加云***、***贝壳云***、***我家云***、***N1***、***S905x3（包括常见的hk1、h96、x96等盒子）***、***章鱼星球***、***s922x（目前支持GT-King、GT-King Pro两款盒子）*** 等！
- 本项目使用 Github Actions 下载 [Lean](https://github.com/coolsnowwolf/lede) 的 `Openwrt` 源码仓库，进行云编译。
- 本项目使用定时编译（北京时间每周日下午4点开始自动运行编译）及触发编译（更新script.sh后可开始编译）两种方式。
- 本项目编译固件适配斐讯 N1 盒子，如需刷机，另需使用打包工具生成刷机固件。
- 本项目相对源码默认设置做了如下更改：

- ## 说明
- releases中的直刷固件分为[***精简版***](https://github.com/hibuddies/openwrt/releases/tag/Z-ARMv8-mini) 和[***高大全版***](https://github.com/hibuddies/openwrt/releases/tag/Z-ARMv8-gdq)，精简版主要适合科学上网为主要需求的用户，高大全版用的是f大的配置文件，+o版是flowoffload加速,+版是sfe加速！
- Docker固件：`docker pull hibuddies/openwrt-aarch64:latest`，精简版：`docker pull hibuddies/openwrt-aarch64-mini:latest`
- 固件默认IP：`192.168.1.1` 默认密码：`password`
- 刷机和升级方法请参考f大这两个帖子：[➦旧帖](https://www.right.com.cn/forum/thread-981406-1-1.html) 和 [➦新帖](https://www.right.com.cn/forum/thread-4055451-1-1.html)
- 精简版固件包含的插件预览：



## 感谢 ❤️

- [P3TERX](https://github.com/P3TERX/Actions-OpenWrt)
- [breakings](https://github.com/breakings/OpenWrt)
- [Lienol/openwrt](https://github.com/Lienol/openwrt)
- [coolsnowwolf/lede](https://github.com/coolsnowwolf/lede)
- [unifreq/openwrt_packit](https://github.com/unifreq/openwrt_packit)

## License

[MIT](https://github.com/P3TERX/Actions-OpenWrt/blob/main/LICENSE) © [**P3TERX**](https://p3terx.com)
