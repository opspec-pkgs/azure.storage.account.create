# problem statement
creates an azure storage account (if it doesn't already exist)

# example usage

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
run:
  op:
    pkg: { ref: github.com/opspec-pkgs/azure.storage.account.create#VERSION }
    inputs:
      subscriptionId:
      username:
      password:
      name:
      resourceGroup:
      sku:
      kind:
      location:
```
