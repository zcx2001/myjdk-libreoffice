FROM zcx2001/myjdk:latest-$JAVA_TAG

ARG RUNNER=local

# 增加常用中文字体
ADD fonts/. /usr/share/fonts/chinese
# 增加常用中文字体
ADD deb/. /tmp


RUN if [ "${RUNNER}" != "github" ]; then \
        sed -i -E 's/(archive|security|ports).ubuntu.(org|com)/mirrors.aliyun.com/g' /etc/apt/sources.list; \
    fi \
    && apt-get update \
    && apt-get install -y ttf-mscorefonts-installer ttf-wqy-microhei ttf-wqy-zenhei \
      xfonts-wqy libxrender1 libxinerama1 libxt6 libxext-dev libfreetype6-dev libcairo2 \
      libcups2 libx11-xcb1 libnss3 \
    && cd /tmp && cat LibreOffice_7.5.7_Linux_x86-64_deb.tar.gz* | tar zxf - \
    && cd /tmp/LibreOffice_7.5.7.1_Linux_x86-64_deb/DEBS \
    && dpkg -i *.deb \
    && cd /usr/share/fonts/chinese && mkfontscale && mkfontdir && fc-cache -fv \
    && ln -sf /opt/libreoffice7.5 /opt/libreoffice \
    && rm -rf /var/lib/apt/lists/* \
    && rm -rf /tmp/*