# sensitive_info_leakage_detect


代码丢到/data/code/目录下

然后在nginx的http级别里include /data/code/test.conf

触发MySQL的语法错误就能在splunk里看到日志了


PS：如果需要修改Splunk的IP与端口号，编辑log.lua修改对应的参数即可
