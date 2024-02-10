[< Backaward](../README.md)

# Terraform (TF)

Provisioning, Configuration, Management by Terraform

1. [Datasource TF](./data/README.md)
2. [Local TF](./local/README.md)
3. [Modules TF](./modules/README.md)
4. [Providers TF](./providers/README.md)
5. [Resources TF](./resources/README.md)
6. [Services TF](./services/README.md)
7. [Test TF](./test/README.md)
7. [TestCLI TF](./test_cli/README.md)


## Dependencies

- Terraform `choco install terraform`

- Golang `choco install go`
- Terragrunt `choco install terragrunt` `Banned`
- Terratest, require golang


## Scripts

- ShellScript

```shell
go run -v $(go list ./...)
go test -v $(go list ./...)
```

- Cmd

```cmd
for /f %i in ('go list ./...') do go run -v %i
for /f %i in ('go list ./...') do go test -v %i
```