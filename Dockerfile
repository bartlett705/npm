FROM node:10

LABEL version="1.0.0"
LABEL repository="http://github.com/bartlett705/npm-cy"
LABEL homepage="http://github.com/bartlett705/npm-cy"
LABEL maintainer="Ahmad K <ahmad@mosey.systems>"

LABEL com.github.actions.name="GitHub Action for npm w/ cypress.io"
LABEL com.github.actions.description="Wraps the npm CLI to enable common npm commands. Uses cypress.io's Node 10 docker image for automated testing."
LABEL com.github.actions.icon="package"
LABEL com.github.actions.color="red"
COPY LICENSE README.md THIRD_PARTY_NOTICE.md /

COPY "entrypoint.sh" "/entrypoint.sh"
ENTRYPOINT ["/entrypoint.sh"]
CMD ["help"]
