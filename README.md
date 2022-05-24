# gcp-it-boostrap-iam-serviceaccount


## Set envrionment variables

export ORG=
export ENVIRONMENT=
export ENV_SHORT=
export FOLDER=

## Create backend config

cp  config.google.tmpl config.google.tfbackend
sed -i s/ORG/$ORG/g config.google.tfbackend
sed -i s/ENVIRONMENT/$ENVIRONMENT/g config.google.tfbackend
sed -i s/ENV_SHORT/$ENV_SHORT/g config.google.tfbackend

## Init terraform

terraform -chdir=$FOLDER init -backend-config=../config.google.tfbackend
 
# plan terraform

terraform -chdir=$FOLDER plan
