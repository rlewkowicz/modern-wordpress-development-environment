FROM bitnami/wordpress:5.7.2

USER 0

ARG MY_USER
ARG MY_UID

RUN apt update && apt install parallel -y

RUN useradd -u $MY_UID $MY_USER && groupadd -g $MY_UID $MY_USER ; find / 2>/dev/null | grep scripts |  \
xargs grep -RlE '\$(APACHE|WEB|PHP)[A-Z\_]+(USER|GROUP)' | sort | uniq | \
xargs sed -E -i 's/\$(APACHE|WEB|PHP)[A-Z\_]+(USER|GROUP)/'$MY_USER'/g'

# Chown was suuuper slow and I have no idea why. So slow, that it is litterally faster to install an enitre package. I just make it all non blocking. 
RUN for i in `find / 2>/dev/null | grep bitnami`; do echo chown $MY_USER $i >> /execute.txt; done
RUN set -x ; parallel -j 100 < /execute.txt

USER $MY_UID