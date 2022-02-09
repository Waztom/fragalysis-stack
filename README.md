[![build main](https://github.com/xchem/fragalysis-stack/actions/workflows/build-main.yaml/badge.svg)](https://github.com/xchem/fragalysis-stack/actions/workflows/build-main.yaml)

[![experimental](http://badges.github.io/stability-badges/dist/experimental.svg)](http://github.com/xchem/fragalysis-stack)
[![Version](http://img.shields.io/badge/version-0.0.1-blue.svg?style=flat)](https://github.com/xchem/fragalysis-stack)
[![License](http://img.shields.io/badge/license-Apache%202.0-blue.svg?style=flat)](https://github.com/xchem/fragalysis-stack/blob/master/LICENSE.txt)

# Fragalysis stack
Docker setup for building a Django, RDKit and Postgres stack with neo4j 

Follow the steps below to build and push your own Docker Hub stack image for Fragalysis. This image is needed for deployment to the development or production clusters via AWX and then Ansible.

## <a name="clonerepo"></a>Clone the Fragalysis stack repo

`git clone https://github.com/Waztom/fragalysis-stack.git`

## <a name="exportnamespaces"></a>Set Docker Hub, GitHub namespaces and branches to use
- You do not have to add this info here and can export the variables each time but this way might save you time in the future if you're using the same information for each Docker build and push <br>
- In a linux terminal, add your Docker Hub, GitHub namespaces you want to use for the build along with the Git branches, by editing your bashrc:
> `sudo nano ~/.bashrc` <br>

-  add the follwoing to the bottom of your bashrc profile along with your namespace/branch edits: 

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
