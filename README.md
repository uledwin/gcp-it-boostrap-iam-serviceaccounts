# gcp-it-boostrap-build-objects

This repository creates the service accounts that are used for deploying resources on GCP.

## Setting values on terraform.tfvars

Go to the  terraform.tfvars file and set these values with your own info

build_project_id        = <build project id>
environments_project_id = <app project id>


## Setting values on couldbuild.yaml

Go to the cloudbuild.yaml file and set the org right value in this section

env:
    - 'ORG=<your organization name>'


## Pushing the changes

1. Push the new changes to the repo

git add .
git commit -m "<your message>"
git push


## Merging changes to the environment branches

1. In Github, Create a pull request from main to dev branch.
2. Approve the pull request and mergue the changes. Use a rebase strategy for merging the changes.

1. In Github, Create a pull request from dev to net branch.
2. Approve the pull request and mergue the changes. Use a rebase strategy for merging the changes.


1. In Github, Create a pull request from net to prod branch.
2. Approve the pull request and mergue the changes. Use a rebase strategy for merging the changes.


