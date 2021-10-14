FROM ubuntu:18.04

# Install chrome and firefox
RUN apt update \
  && apt install -y unzip curl wget git make build-essential g++ \
  && echo 'deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main' | tee /etc/apt/sources.list.d/google-chrome.list \
  && wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add - \
  && apt update \
  && apt install -y google-chrome-stable firefox

# Install wget
RUN apt-get update && apt-get install wget -y

# Install gnupg and git
RUN apt-get update && apt-get install -y gnupg2 && apt-get install -y git

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

