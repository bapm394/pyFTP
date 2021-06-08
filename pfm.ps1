#Requires -RunAsAdministrator
# 
#      pyFTP Install PS script
#
# GitHub: https://github.com/bapm394/pyFTP

Param(
    [Parameter(Mandatory=$true,
    ParameterSetName="install")]
    [Switch]
    $install,

    [Parameter(Mandatory=$true,
    ParameterSetName="uninstall")]
    [Switch]
    $uninstall,

    [Parameter(Mandatory=$false,
    ParameterSetName="help")]
    [Switch]
    $help,

    [Parameter(Mandatory=$true,
    ParameterSetName="i")]
    [Switch]
    $i,

    [Parameter(Mandatory=$true,
    ParameterSetName="u")]
    [Switch]
    $u,

    [Parameter(Mandatory=$false,
    ParameterSetName="h")]
    [Switch]
    $h
    )
    $folder = "$($env:USERPROFILE)\pyFTP"
    $pylibfinal = "C:\Program Files\Python39\Lib\argparse_es.py"
    $backfile = $folder + "\.dontdelete"
function install {
    Write-Host "Windows pyFTP installer"
    if (Test-Path "C:\Program Files\Python39"){
        Write-Host "Python3 installed"
        Write-Host "Setting up Python library"
        python.exe -m pip install pyftpdlib
    }
    else {
        Write-Host "Python is not installed. Install it,"
        Write-Host "URL :   https://www.python.org/downloads/"
        exit
    }
    mkdir $folder
    $urlpy = "https://raw.githubusercontent.com/bapm394/pyFTP/master/py/ftp.py"
    $urllib = "https://raw.githubusercontent.com/bapm394/pyFTP/master/py/lib.py"
    $urlcd = "https://raw.githubusercontent.com/bapm394/pyFTP/master/ps/pyFTP.ps1"
    Write-Host "Downloading resources ..."
    $pyfile = $folder + "\ftp.py"
    $pylib = $folder + "\lib.py"
    $ps1 = $folder + "\pyFTP.ps1"
    $WebClient = New-Object System.Net.WebClient 
		$WebClient.DownloadFile( $urlpy, $pyfile )
		$WebClient.DownloadFile( $urllib, $pylib )
        $WebClient.DownloadFile( $urlcd, $ps1 )
    Write-Host "Done."
    Write-Host "Setting up ..."
    Move-Item -Path $folder\lib.py $pylibfinal
    $path = (Get-ItemProperty -Path 'Registry::HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\Session Manager\Environment' -Name PATH).Path
    if ( -not (Test-Path $backfile)) {
        New-Item -Path $backfile
        $path >>  $backfile
    }
	$path = $path + ";$folder"
	Set-ItemProperty -Path 'Registry::HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\Session Manager\Environment' -Name PATH -Value "$path"
    Write-Host "Done!."
    exit
}
function uninstall {
    Write-Host "Uninstalling ..."
    $pyFTP = $folder + "\ftp.py"
    $cdps = $folder + "\pyFTP.ps1"
    Remove-Item -Force $pylibfinal
    $path = (Get-Content -Path $backfile)
    Set-ItemProperty -Path 'Registry::HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\Session Manager\Environment' -Name PATH -Value "$path"
    Remove-Item -Force $pyFTP
    Remove-Item -Force $cdps
    Remove-Item -Force $backfile
    Remove-Item -Force $folder
    Write-Host "Done."
    exit
}

function help {
    Write-Host "Install pyFTP in your Windows"
    Write-Host ""
    Write-Host ".\pfm.ps1 [ -h/-help | -i/-install | -u/-uninstall]"
    Write-Host ""
    Write-Host "No help needed for commands, they are clearer than water"
    Write-Host ""
    Write-Host "https://github.com/bapm394/pyFTp"
    exit
}
if ($help){
    help
}
elseif ($h) {
    help
}
if ($install){
    install
}
elseif ($i) {
    install
}
if ($uninstall){
    uninstall
}
elseif ($u) {
    uninstall
}