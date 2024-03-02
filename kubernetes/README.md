[< Backawrd](../README.md)

# Kubernetes

In this section, you must install Vagrant first.

- [Vagrant Guide](../vagrant/README.md)

```shell
vagrant init
vagrant validate
vagrant up
vagrant destroy <NAME\>
vagrant provision <NAME\>
```

## Installation

1. Install helm
    ```shell
    choco install kubernetes-helm
    ```
2. [Install on Windows using Chocolatey, Scoop, or winget](https://kubernetes.io/docs/tasks/tools/install-kubectl-windows/#install-nonstandard-package-tools)
    ```shell
    choco install kubernetes-cli
    ```
3. 