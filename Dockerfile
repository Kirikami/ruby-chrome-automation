FROM ruby:2.3

MAINTAINER Ruslan Naumenko

RUN apt-get update
RUN apt-get install -y \
	curl \
	unp \
	unzip 

#Setup chromedriver
RUN \ 
	curl 'http://chromedriver.storage.googleapis.com/2.20/chromedriver_linux64.zip' -o chromedriver.zip &&\	
	unp chromedriver.zip &&\
	mv chromedriver /usr/bin && \
	rm chromedriver.zip

RUN apt-get update && apt-get install -y \
    # Headless browser support
        xvfb \
	libgconf-2-4 \
	gconf-service \
	libnspr4 \
	libnss3 \
	libasound2 \
	libpango1.0-0 \
	libxss1 \
	libxtst6 \
	fonts-liberation \
	libappindicator1 \
	xdg-utils

#Install chrome
RUN wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb &&\ 
	dpkg -i google-chrome-stable_current_amd64.deb &&\
	rm google-chrome-stable_current_amd64.deb
