[![build main](https://github.com/xchem/fragalysis-stack/actions/workflows/build-main.yaml/badge.svg)](https://github.com/xchem/fragalysis-stack/actions/workflows/build-main.yaml)

[![experimental](http://badges.github.io/stability-badges/dist/experimental.svg)](http://github.com/xchem/fragalysis-stack)
[![Version](http://img.shields.io/badge/version-0.0.1-blue.svg?style=flat)](https://github.com/xchem/fragalysis-stack)
[![License](http://img.shields.io/badge/license-Apache%202.0-blue.svg?style=flat)](https://github.com/xchem/fragalysis-stack/blob/master/LICENSE.txt)

# Fragalysis stack
Docker setup for building a Django, RDKit and Postgres stack with neo4j 

Folow the stesp below to build and push your own stack image.

## <a name="clonerepo"></a>Clone the Fragalysis stack repo

`git clone https://github.com/Waztom/fragalysis-stack.git`

## <a name="exportnamespaces"></a>Set Docker Hub, GitHub namespaces an branches to use

- In a linux terminal, add your Docker Hub, GitHub namespaces you want to use for the build along with the Git branches, by editing your bashrc:
> `sudo nano ~/.bashrc` <br>

- In tyour favourite editor (Nano in this case), at the follwoing to the bottom of your bashrc profile along with your namespace/branch edits: 

```
# Fragalysis deployment
export BE_NAMESPACE=<Docker Hub namespace for backend>
export BE_IMAGE_TAG=<Docker Hub image tag for backend>
export FE_NAMESPACE=<Frontend GitHuB namespace>
export FE_BRANCH=<Frontend GitHub branch>
export STACK_NAMESPACE=<Docker Hub namespace for stack>
``` 

## <a name="dockerstack"></a>Build Docker image and push to Docker Hub 

- cd into the Fragalysis stack repo:
> `cd fragalysis-stack`

- build the Docker image:
> `docker build --build-arg BE_NAMESPACE=${BE_NAMESPACE} --build-arg BE_IMAGE_TAG=${BE_IMAGE_TAG} --build-arg FE_NAMESPACE=${FE_NAMESPACE} --build-arg FE_BRANCH=${FE_BRANCH} .` <br>

- push the Docker image to your Docker Hub account:
> `docker push ${STACK_NAMESPACE}/fragalysis-stack:latest`
