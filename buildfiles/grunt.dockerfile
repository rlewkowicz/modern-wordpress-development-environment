FROM node:14.17-slim

WORKDIR /

RUN apt update && apt install bash wget -y

RUN npm -g install gulp
RUN npm install gulp gulp-livereload && wget https://github.com/sass/dart-sass/releases/download/1.37.5/dart-sass-1.37.5-linux-x64.tar.gz && \
tar -xzf dart-sass-1.37.5-linux-x64.tar.gz && mv dart-sass/sass /bin && rm -rf sass*

COPY gulpfile.js /gulpfile.js

ENTRYPOINT [ "gulp", "watch" ]
