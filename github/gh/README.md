[< Backaward](../README.md)

# GH Scripts

GH Scripts supports to automatically adjust Options of GitHub.

- References : https://cli.github.com/manual

## Installation

In windows 11, you must install these package manager(cli).

- winget
- scoop
- chocolatey

I reccomemded [chocolatey install guide](https://chocolatey.org/install).

### Install Chocolatey

1. Run PowerShell, have a administrative policy.
2. Check your Process ExecutionPolicy for running GH Installation Scripts.
    - **Scripts** : `Get-ExecutionPolicy -Scope Process`
3. Maybe you returned `Undefined` or `Restricted`, when you typed **2-Scripts**
4. Type these command to install GH CLI, after temporarily Set-ExecutionPolicy to ByPass.
    - ![Alt text](image.png)
    ```powershell
    Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))
    ```
5. Roll back your Process ExecutionPolicy to Restricted.
    - **Scripts** : `Set-ExecutionPolicy Restricted -Scope Process`

### Install GH CLI

1. Install GH using choco
    ```powershell
    choco install gh
    ```