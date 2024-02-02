# Terratest


## 1. Linter (golangci-lint)

Use `golangci-lint` to lint golang.

### 1.a. Installation

- References : https://golangci-lint.run/usage/install/#binaries

Use git-bash to install golangci-lint in Windows.

```shell
curl -sSfL https://raw.githubusercontent.com/golangci/golangci-lint/master/install.sh | sh -s -- -b $(go env GOPATH)/bin v1.55.2

golangci-lint --version
```

If this way fail to install golangci-lint, use choco.

| Of course, choco installation is not provided official provider. <br> So golangci-lint is successfully working in Windows.

```shell
choco install golangci-lint
```

### 1.b. Configuration

- References : https://golangci-lint.run/usage/configuration/

```shell
golangci-lint linters
```

## 2. Terratest(golang) Refernces `Important`

- References : https://github.com/microsoft/terratest-abstraction/tree/master

```shell

```