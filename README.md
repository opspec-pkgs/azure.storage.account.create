# Problem statement
creates an azure storage account (if it doesn't already exist)

# Example usage

> note: in examples, VERSION represents a version of the azure.storage.account.create pkg

## install

```shell
opctl pkg install github.com/opspec-pkgs/azure.storage.account.create#VERSION
```

## run

```
opctl run github.com/opspec-pkgs/azure.storage.account.create#VERSION
```

## compose

```yaml
op:
  pkg: { ref: github.com/opspec-pkgs/azure.storage.account.create#VERSION }
  inputs:
    subscriptionId:
    loginId:
    loginSecret:
    name:
    resourceGroup:
    # begin optional args
    customDomain:
    kind:
    location:
    loginTenantId:
    loginType:
    sku:
    tags:
    # end optional args
```

# Support

join us on [![Slack](https://opspec-slackin.herokuapp.com/badge.svg)](https://opspec-slackin.herokuapp.com/)
or [open an issue](https://github.com/opspec-pkgs/azure.storage.account.create/issues)
