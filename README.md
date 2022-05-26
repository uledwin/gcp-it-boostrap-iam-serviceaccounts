# gcp-it-boostrap-iam-serviceaccount


## Set envrionment variables

export ORG=
export ENVIRONMENT=

## Create backend config

cp  config.google.tmpl config.google.tfbackend
sed -i s/ORG/$ORG/g config.google.tfbackend
sed -i s/ENVIRONMENT/$ENVIRONMENT/g config.google.tfbackend

## Init terraform

terraform init -backend-config=config.google.tfbackend
 
# plan terraform

terraform plan



