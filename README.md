# java 运行环境 
基于ubuntu 20.04 提供Amazon Corretto JDK 8、11的运行环境 内置Libreoffice

# 关于如何处理Libreoffice安装包过大不让提交问题
把Libreoffice安装包下载到deb目录后执行语句切割成50M小包，在安装时恢复
```shell
cd deb
split -d -b 50m LibreOffice_7.5.7_Linux_x86-64_deb.tar.gz LibreOffice_7.5.7_Linux_x86-64_deb.tar.gz.
```