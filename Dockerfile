FROM php:8.2.3-apache

# Mise à jour et installation des dépendances
RUN apt-get update \
    &&  apt-get install -y --no-install-recommends \
        locales apt-utils git libicu-dev g++ libpng-dev libxml2-dev libzip-dev libonig-dev libxslt-dev unzip libpq-dev nodejs npm wget \
        apt-transport-https lsb-release ca-certificates nano

# Configuration des locales
RUN echo "en_US.UTF-8 UTF-8" > /etc/locale.gen  \
    &&  echo "fr_FR.UTF-8 UTF-8" >> /etc/locale.gen \
    &&  locale-gen

# Installation de Composer
RUN curl -sS https://getcomposer.org/installer | php -- \
    &&  mv composer.phar /usr/local/bin/composer

# Installation de Symfony CLI
RUN curl -sS https://get.symfony.com/cli/installer | bash

# Déplacer Symfony CLI dans un répertoire accessible
RUN mv /root/.symfony5/bin/symfony /usr/local/bin

# Configuration de PHP
RUN docker-php-ext-configure \
            intl \
    &&  docker-php-ext-install \
            pdo pdo_mysql pdo_pgsql opcache intl zip calendar dom mbstring gd xsl

# Installation et activation d'APCu
RUN pecl install apcu && docker-php-ext-enable apcu

# Installation de Yarn
RUN npm install --global yarn

# Configuration Git
RUN git config --global user.email "angeemmanuel93@outlook.fr" \
    &&  git config --global user.name "Ange Emmanuel"

# Configuration de Apache
RUN echo "ServerName localhost" >> /etc/apache2/apache2.conf


# Commande par défaut
CMD ["apache2-foreground"]

#Repertoire de travail
WORKDIR /var/www/html/