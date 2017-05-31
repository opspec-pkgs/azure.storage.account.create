#!/usr/bin/env sh

echo "logging in to azure"
az login -u "$username" -p "$password" >/dev/null

echo "setting default subscription"
az account set --subscription "$subscriptionId"

echo "checking for existing storage account"
if [ "$(az storage account show --resource-group "$resourceGroup" --name "$name")" != "" ]
then
    echo "found existing storage account"
else
    echo "storage account not found"
    echo "creating storage account"
    az storage account create \
    --name "$name" \
    --resource-group "$resourceGroup" \
    --sku "$sku" \
    --kind "$kind" \
    --location "$location"
fi