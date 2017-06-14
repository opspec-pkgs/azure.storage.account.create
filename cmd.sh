#!/usr/bin/env sh

### begin login
loginCmd='az login -u "$loginId" -p "$loginSecret"'

# handle opts
if [ "$loginTenantId" != " " ]; then
    loginCmd=$(printf "%s --tenant %s" "$loginCmd" "$loginTenantId")
fi

case "$loginType" in
    "user")
        echo "logging in as user"
        ;;
    "sp")
        echo "logging in as service principal"
        loginCmd=$(printf "%s --service-principal" "$loginCmd")
        ;;
esac
eval "$loginCmd" >/dev/null

echo "setting default subscription"
az account set --subscription "$subscriptionId"
### end login

echo "checking for existing storage account"
if [ "$(az storage account show --resource-group "$resourceGroup" --name "$name")" != "" ]
then
    echo "found existing storage account"
else
    createCmd='az storage account create'
    createCmd=$(printf "%s --name %s" "$createCmd" "$name")
    createCmd=$(printf "%s --resource-group %s" "$createCmd" "$resourceGroup")
    createCmd=$(printf "%s --sku %s" "$createCmd" "$sku")
    createCmd=$(printf "%s --kind %s" "$createCmd" "$kind")
    createCmd=$(printf "%s --location %s" "$createCmd" "$location")
    createCmd=$(printf "%s --tags %s" "$createCmd" "$tags")

    # handle opts
    if [ "$customDomain" != " " ]; then
      createCmd=$(printf "%s --custom-domain %s" "$createCmd" "$customDomain")
    fi

    echo "creating storage account"
    eval "$createCmd"
fi