
Set-ExecutionPolicy Bypass -Scope Process -Force; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))

function Install-ChocoPackages {
    param (
        [Parameter(Mandatory=$true)]
        [string[]] $Packages
    )

   
    foreach ($package in $Packages) {
       Write-Host "Installing $package..." -ForegroundColor Cyan
       choco install $package -y
    }

}


$package_list = @(
    'vscode'
    'python3'
    'git'
    'brave'
    'virtualbox'
    'notepadplusplus'
    'openssh'
    'putty'
    'neovim'
    '7zip'

)

Install-ChocoPackages -Packages $package_List
