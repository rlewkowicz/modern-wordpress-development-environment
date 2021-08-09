FROM node:14-alpine3.14

WORKDIR /

RUN npm -g install grunt
RUN npm install grunt-contrib-watch grunt grunt-exec && wget https://github.com/sass/dart-sass/releases/download/1.37.5/dart-sass-1.37.5-linux-x64.tar.gz && \
tar -xzf dart-sass-1.37.5-linux-x64.tar.gz && mv dart-sass/sass /bin && rm -rf sass*


COPY Gruntfile.js /Gruntfile.js

ENTRYPOINT [ "grunt" ]
