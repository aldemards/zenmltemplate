#!/usr/bin/env bash

#set -Eeo pipefail

zenml init
zenml integration install sklearn -y
zenml integration install mlflow -y
zenml integration install deepchecks -y

zenml data-validator register deepchecks_data_validator --flavor=deepchecks
zenml experiment-tracker register local_mlflow_tracker  --flavor=mlflow
zenml model-deployer register local_mlflow_deployer  --flavor=mlflow
zenml model-registry register mlflow_model_registry --flavor=mlflow
zenml stack register local_gitflow_stack \
    -a default \
    -o default \
    -e local_mlflow_tracker \
    -d local_mlflow_deployer \
    -dv deepchecks_data_validator \
    -r mlflow_model_registry 
zenml stack set local_gitflow_stack