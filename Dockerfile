FROM ubuntu:18.04

# Install chrome and firefox
ARG CHROME_VERSION="96.0.4664.45-1"
  
RUN apt update \
  && apt install -y unzip gnupg2 curl wget git make build-essential g++ default-jdk \
  && echo 'deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main' | tee /etc/apt/sources.list.d/google-chrome.list \
  && wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add - \
  && apt update \
  && apt install -y firefox \
  && wget -q -O /tmp/chrome.deb https://dl.google.com/linux/chrome/deb/pool/main/g/google-chrome-stable/google-chrome-stable_${CHROME_VERSION}_amd64.deb \
  && apt install -y /tmp/chrome.deb \
  && rm /tmp/chrome.deb

# Install NODEJS/NPM
RUN curl -sL https://deb.nodesource.com/setup_12.x | bash - && \
	apt-get update && \
	apt-get install -y nodejs && \
    npm install -g npm@6.14.5

LABEL com.github.actions.name="Webapp front-end test"
LABEL com.github.actions.description="Run webapp front-end test"
LABEL com.github.actions.icon="toggle-right"
LABEL com.github.actions.color="gray-dark"
LABEL homepage="https://github.com/amoncaldas/github-action-webapp-front-end-test"


COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]

