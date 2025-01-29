FROM node:14.21.3-bullseye

WORKDIR /

RUN apt update && apt install bash wget curl -y

RUN npm -g install gulp
RUN npm install gulp gulp-livereload && wget https://github.com/sass/dart-sass/releases/download/1.37.5/dart-sass-1.37.5-linux-x64.tar.gz && \
tar -xzf dart-sass-1.37.5-linux-x64.tar.gz && mv dart-sass/sass /bin && rm -rf sass*

COPY gulpfile.js /gulpfile.js

ENTRYPOINT [ "sh", "-c", "while ! curl -sf wordpress:8080 > /dev/null; do sleep 1; done; gulp watch" ]
