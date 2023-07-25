ARG BE_NAMESPACE=waztom
ARG BE_IMAGE_TAG=latest
ARG FE_NAMESPACE=ag-m2ms
ARG FE_BRANCH=master
ARG STACK_NAMESPACE=waztom
ARG STACK_VERSION=0.0.0
FROM ${BE_NAMESPACE}/fragalysis-backend:${BE_IMAGE_TAG}

# Yarn build fails due cache limit
ENV NODE_OPTIONS --max-old-space-size=8192
# We have to repeat the ARG assignments...
# ARGs are reset during the FROM action
# See https://docs.docker.com/engine/reference/builder/#understand-how-arg-and-from-interact

# Us
ARG STACK_NAMESPACE
ARG STACK_VERSION
# Backend origin (a container)
ARG BE_NAMESPACE
ARG BE_IMAGE_TAG
# By default this is hosted on the xchem project's master branch
# but it can be redirected with a couple of build-args.
ARG FE_NAMESPACE
ARG FE_BRANCH

# Set the container ENV to record the origin of the b/e and f/e
ENV BE_NAMESPACE ${BE_NAMESPACE}
ENV BE_IMAGE_TAG ${BE_IMAGE_TAG}
ENV FE_NAMESPACE ${FE_NAMESPACE}
ENV FE_BRANCH ${FE_BRANCH}
ENV STACK_NAMESPACE ${STACK_NAMESPACE}
ENV STACK_VERSION ${STACK_VERSION}

ENV APP_ROOT /code

# Install yarn
# RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
# RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list && \
#     apt-get update -y && \
#     apt-get install -y \
#         yarn && \
#     apt-get clean

# Install nodejs
# RUN wget -q https://nodejs.org/download/release/v12.22.11/node-v12.22.11-linux-x64.tar.gz && \
#     mkdir -p /usr/local/lib/nodejs && \
#     tar -xf node-v12.22.11-linux-x64.tar.gz -C /usr/local/lib/nodejs && \
#     rm node-v12.22.11-linux-x64.tar.gz
# ENV PATH /usr/local/lib/nodejs/node-v12.22.11-linux-x64/bin:$PATH

RUN apt-get update && \ 
    apt-get upgrade -y && \
    apt-get install -y nodejs npm && \
    apt-get autoclean -y && \
    npm install --global yarn

ADD docker-entrypoint.sh ${APP_ROOT}/docker-entrypoint.sh
ADD LICENSE /LICENSE
ADD README.md /README.md
RUN chmod 755 ${APP_ROOT}/docker-entrypoint.sh

# Add in the frontend code
# By default this is hosted on the xchem project's master branch
# but it can be redirected with a couple of build-args.
# And then continue to build it.
WORKDIR ${APP_ROOT}/static
# ARG FE_NAMESPACE=FE_NAMESPACE
# ARG FE_BRANCH=FE_BRANCH
RUN git clone https://github.com/${FE_NAMESPACE}/fragalysis-frontend ${APP_ROOT}/frontend && \
    cd ${APP_ROOT}/frontend && git checkout ${FE_BRANCH} && \
    cd ${APP_ROOT}/frontend && yarn install && \
    cd ${APP_ROOT}/frontend && yarn run build && \
    ln -s ${APP_ROOT}/frontend/bundles/ ${APP_ROOT}/static/bundles

WORKDIR ${APP_ROOT}
CMD ["./docker-entrypoint.sh"]