FROM debian:stretch

# ensure in linux its using wkhtmltopdf
ENV HTMLTOPDF wkhtmltopdf

ENV WKHTMLTOX_VERSION 0.12.5
ENV WKHTMLTOX_DEPS fontconfig libfreetype6 libjpeg62-turbo libpng16-16 libx11-6 libxcb1 libxext6 libxrender1 xfonts-75dpi xfonts-base

RUN apt-get update && apt-get install -y \
    rsync \
    exiftool \
    pandoc \
    ruby-compass \
    compass-susy-plugin \
    make \
    wget \
    ${WKHTMLTOX_DEPS} && \
    rm -rf /var/lib/apt/lists/*

# require version of wkhtmltopdf with patched qt to run in docker
# https://stackoverflow.com/questions/34479040/how-to-install-wkhtmltopdf-with-patched-qt
RUN wget https://github.com/wkhtmltopdf/wkhtmltopdf/releases/download/${WKHTMLTOX_VERSION}/wkhtmltox_${WKHTMLTOX_VERSION}-1.stretch_amd64.deb && \
    apt-get install ./wkhtmltox_${WKHTMLTOX_VERSION}-1.stretch_amd64.deb && \
    rm wkhtmltox_${WKHTMLTOX_VERSION}-1.stretch_amd64.deb

WORKDIR /work