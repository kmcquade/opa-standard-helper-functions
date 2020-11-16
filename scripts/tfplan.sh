#!/usr/bin/env bash
#set -x

if [ -n "${TF_SUBFOLDER}" ]; then
  echo "Evaluating the Terraform at path: ${TF_SUBFOLDER}"
else
  echo "Please set the TF_SUBFOLDER environment variable to the path containing your Terraform files!"
  exit 1
fi

pushd ${TF_SUBFOLDER}

terraform init

# Check Terraform version
is_tf_version_11=$(terraform version | grep -m1 "" | grep -m1 "0\.11\.");
terraform version;

if [[ -z $is_tf_version_11 ]]; then
  echo "Terraform 0.11.x is NOT used. We will generate Terraform plan JSON using \`terraform show -json plan.binary\` ";
  terraform plan -out plan.binary;
  terraform show -json plan.binary | jq . > plan.json;
else
  echo "Terraform 0.11.x IS used. This leverages a different Terraform plan format. We will generate Terraform plan JSON using https://github.com/justinm/tfjson2";
  terraform plan -out plan.binary;
  tfjson2 --plan plan.binary  | jq . > plan.json;
fi

popd