FROM docker:stable-dind

LABEL "name"="Tizen Studio CLI Action"
LABEL "maintainer"="Hyokeun Jeon <hyokeun@gmail.com>"

LABEL "com.github.actions.name"="Tizen Studio CLI"
LABEL "com.github.actions.description"="Tizen Studio CLI"
LABEL "com.github.actions.icon"="box"
LABEL "com.github.actions.color"="green"

RUN apk update \
  && apk upgrade \
  && apk add --no-cache git bash

COPY entrypoint.sh /

ENTRYPOINT ["/entrypoint.sh"]
