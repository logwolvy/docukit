FROM ubuntu:focal

ENV DEBIAN_FRONTEND=noninteractive

WORKDIR /bin-setup
RUN apt-get -y -qq update && apt-get -y upgrade && apt-get install -y wget

# Install Pandoc
RUN wget https://github.com/jgm/pandoc/releases/download/2.16.1/pandoc-2.16.1-1-amd64.deb && \
      dpkg -i pandoc-2.16.1-1-amd64.deb

# Install Imagemagick
RUN apt-get install -y build-essential
RUN apt-get install -y libpng16-16 libpng-dev libjpeg-turbo8 libjpeg-turbo8-dev libgomp1 libgs-dev ghostscript libxml2-dev libxml2-utils libtiff-dev libfontconfig1-dev libfreetype6-dev fonts-dejavu
RUN wget https://download.imagemagick.org/ImageMagick/download/ImageMagick.tar.gz
RUN tar xvzf ImageMagick.tar.gz && cd ImageMagick-* \
    && ./configure --with-gslib=yes && make \
    && make install && ldconfig /usr/local/lib

# Install latest chrome dev package and fonts to support major charsets (Chinese, Japanese, Arabic, Hebrew, Thai and a few others)
# Note: this installs the necessary libs to make the bundled version of Chromium that Puppeteer
# installs, work.
RUN apt-get install -y gnupg \
    && wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add - \
    && sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list' \
    && apt-get update \
    && apt-get install -y google-chrome-stable fonts-ipafont-gothic fonts-wqy-zenhei fonts-thai-tlwg fonts-kacst fonts-freefont-ttf libxss1 \
      --no-install-recommends \
    && rm -rf /var/lib/apt/lists/*

# Install MS fonts
RUN apt-get -y -qq update && echo ttf-mscorefonts-installer msttcorefonts/accepted-mscorefonts-eula select true | debconf-set-selections \
    && apt-get install -y ttf-mscorefonts-installer \
    && fc-cache -f -v

# Cleanup
# TODO: remove build helpers/packages
RUN rm -rf /bin-setup

WORKDIR /

ENTRYPOINT ["tail"]
CMD ["-f","/dev/null"]
