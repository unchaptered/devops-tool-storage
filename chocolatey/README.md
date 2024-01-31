[< Backaward](../README.md)

# Chocolatey

Most OS have some kind of `package manager`.

- apt (Linux~)
- snap (Linux~)
- brew (Mac)

For installing some tools, you must use package manager.

`Chocolatey` is package manager for Windows.

## Warning

To install Chocolatey, we use PowerShell havve administrative permission.

And we Set-ExecutionPolicy

In official installation commands, Set-ExecutionPolicy, will ease secuirty against external script execution.


So, **YOU MUST Set-ExecutionPolicy TO `Restricted` AFTER INSTALL CHOCOLATEY**.


## Installation

```shell
Get-ExecutionPolicy
# Restricted

Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))
# Install Chocolatey
# References : https://chocolatey.org/install#individual

Get-ExecutionPolicy
# ByPass

Set-ExecutionPolicy Restricted -Scope Process
# Restricted
```