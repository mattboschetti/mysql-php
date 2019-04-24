FROM mysql:5.7

LABEL name=php-api-build-environment
LABEL version="1.0.0"
LABEL maintainer=matheus@locallife.se

ENV MYSQL_ROOT_PASSWORD mysql
ENV MYSQL_DATABASE locallife
ENV MYSQL_USER locallife
ENV MYSQL_PASSWORD locallife

RUN apt-get update && apt-get install -y wget ca-certificates apt-transport-https

RUN wget -q https://packages.sury.org/php/apt.gpg -O- | apt-key add - \
    && echo "deb https://packages.sury.org/php/ stretch main" | tee /etc/apt/sources.list.d/php.list

RUN apt-get update && apt-get install -y --allow-unauthenticated \
    tar \
    zip \
    curl \
    wget \
    git \
    php7.2-cli \
    php7.2-mysql \
    php7.2-xml \
    php7.2-gd \
    php7.2-curl \
    php7.2-soap

WORKDIR /app

EXPOSE 80
EXPOSE 8000

CMD "bash"
