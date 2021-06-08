Param(
    [Parameter(Mandatory=$false)]
    [string]
    $user,

    [Parameter(Mandatory=$false)]
    [string]
    $key,

    [Parameter(Mandatory=$false)]
    [string]
    $u,

    [Parameter(Mandatory=$false)]
    [string]
    $k,

    [Parameter(Mandatory=$false)]
    [string]
    $dir,

    [Parameter(Mandatory=$false)]
    [string]
    $d,

    [Parameter(Mandatory=$false)]
    [string]
    $port,

    [Parameter(Mandatory=$false)]
    [string]
    $p,

    [Parameter(Mandatory=$false)]
    [string]
    $adir,

    [Parameter(Mandatory=$false)]
    [string]
    $a,

    [Parameter(Mandatory=$false)]
    [Switch]
    $n,

    [Parameter(Mandatory=$false)]
    [Switch]
    $add,

    [Parameter(Mandatory=$false)]
    [Switch]
    $help,
    
    [Parameter(Mandatory=$false)]
    [Switch]
    $h
)
function help {
    Write-Host "Uso: pyFTP [-h] [-u USER] [-k KEY] [-d DIR] [-p PORT] [-a ADIR | -n]

    Inicia un servidor FTP simple configurable
    
    Argumentos opcionales:
      -h, -help            Muestra este mensaje y se detiene
      -u USER, -user USER  Define el usuario, caso contrario sera por defecto
      -k KEY, -key KEY     Defina la contraseña, caso contrario sera por defecto
      -d DIR, -dir DIR     Define el directorio del usuario, de lo contrario sera la carpeta de usuario
      -p PORT, -port PORT  Define el puerto, por defecto sera "8021"
      -a ADIR, -adir ADIR  Habilita el usuario anonimo, y de argumento su carpeta, de lo contrario sera por defecto
      -n, -add             Habilita el usuario anonimo con una carpeta por defecto
      
    Windows requiere que todos los argumentos de los parametros que contengan un espacio vayan entre comillas 
    Ejemplo: c:\Users\usuario\Desktop\Mis fotos --> 'c:\Users\usuario\Desktop\Mis fotos'
    Vealo en GitHub: https://github.com/bapm394/pyFTp"
    exit
}
$file = "$($env:USERPROFILE)\pyFTP\ftp.py"
if ($help){
    help
}
elseif ($h) {
    help
}
if ($user){
    $user1 = "--user"
    $user2 = "$user"
}
elseif ($u) {
    $u1 = "-u"
    $u2 = "$u"
}
if ($key) {
    $key1 ="--key"
    $key2 = "$key"
}
elseif ($k) {
    $k1 = "-k"
    $k2 = "$k"
}
if ($dir) {
    $dir1 = "--dir"
    $dir2 = "$dir"
}
elseif ($d) {
    $d1 = "-d"
    $d2 = "$d"
}
if ($port) {
    $port1 = "--port"
    $port2 = "$port"
}
elseif ($p) {
    $p1 = "-p"
    $p2 = "$p"
}
if ($adir) {
    $adir1 = "--adir"
    $adir2 = "\'$adir\'"
}
elseif ($a) {
    $a1 = "-a"
    $a2 = "\'$a\'"
}
if ($add) {
    $add1 = "--add"
}
elseif ($n) {
    $n1 = "-n"
}
python.exe $file $user1 $user2 $u1 $u2 $key1 $key2 $k1 $k2 $dir1 $dir2 $d1 $d2 $port1 $port2 $p1 $p2 $adir1 $adir2 $a1 $a2 $add1 $n1