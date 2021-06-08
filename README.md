# pyFTP
Python FTP server for Windows, Linux and Android
## Preview
```Uso: pyFTP [-h] [-u USER] [-k KEY] [-d DIR] [-p PORT] [-a ADIR | -n]

Inicia un servidor FTP simple configurable

Argumentos opcionales:
  -h, --help            Muestra este mensaje y se detiene
  -u USER, --user USER  Define el usuario, caso contrario sera por defecto
  -k KEY, --key KEY     Defina la contraseña, caso contrario sera por defecto
  -d DIR, --dir DIR     Define el directorio del usuario, de lo contrario sera la carpeta de usuario
  -p PORT, --port PORT  Define el puerto, por defecto sera "8021"
  -a ADIR, --adir ADIR  Habilita el usuario anonimo, y de argumento su carpeta, de lo contrario sera por defecto
  -n, --add             Habilita el usuario anonimo con una carpeta por defecto

Vealo en GitHub: https://github.com/bapm394/pyFTp
```
## Linux or Android (Termux)
You need root permissions or use sudo, in Termux it is not necessary 
### Installation 
- <b>Download and run the script</b></br>
```wget https://raw.githubusercontent.com/bapm394/pyFTP/master/pfm ; chmod 755 ./pfm```
```./pfm --help```
### Uninstall
- <b>The pfm script can help you</b></br>
```./pfm --help```
## Windows
You need to run in PowerShell with administrator permissions
### Installation
- <b>Download and run the script </b></br>
```.\pfm.ps1 -help```
### Uninstall
- <b>The pfm script can help you (again)</b></br>
```./pfm --help```