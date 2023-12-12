2023年11月29日
- 将istoreos的端口初始化加入固件，在此感谢 [jjm2473](https://github.com/jjm2473),后续用firstboot恢复出厂设置后无需再进行端口配置
- 将IPv6 ULA 前缀自动获取删除，当wan口获取到ipv6-pd地址，lan口即可有ipv6地址

2023年12月5日
- 将Hello world有兼容性问题，能解析但不运行，暂时删除后续考虑添加
