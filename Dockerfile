FROM node:12.14.1-alpine

LABEL com.github.actions.name="NPM Target with node-sass"
LABEL com.github.actions.description="Run npm target with node-sass."
LABEL com.github.actions.icon="toggle-right"
LABEL com.github.actions.color="gray-dark"
LABEL homepage="https://github.com/amoncaldas/github-actions-npm-with-node-sass"

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
