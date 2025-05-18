# java 运行环境 
基于ubuntu 24.04 提供Amazon Corretto JDK 8、11、17、21的运行环境 内置Libreoffice

# Libreoffice 版本
24.8.7.2

# 关于如何处理Libreoffice安装包过大不让提交问题
把Libreoffice安装包下载到deb目录后执行语句切割成50M小包，在安装时恢复
```shell
cd deb
split -d -b 50m LibreOffice_24.8.7_Linux_x86-64_deb.tar.gz LibreOffice_24.8.7_Linux_x86-64_deb.tar.gz.
```