import os, socket, logging, platform, getpass, argparse_es
from pyftpdlib.authorizers import (
    DummyAuthorizer
)
from pyftpdlib.handlers import (
    FTPHandler
)
from pyftpdlib.servers import (
    FTPServer
)

logging.basicConfig(
    format='%(asctime)s - %(name)s - %(levelname)s - %(message)s', level=logging.INFO
)

sys_type = platform.system()

def users():
    '''Set the user for FTP'''
    print()

def password():
    '''Set password'''
    print()

def anonymous():
    '''Add anonymous user'''
    print()

def portset():
    '''Set port'''
    print()

def startdef():
    '''Start server with default settings'''
    print()

def main():
    '''Start server normaly'''
    s = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
    s.connect(("8.8.8.8", 80))
    IP = s.getsockname()[0]
    s.close()
    if au == "1":
        aud = "Usuario : " + str(USER)
        print(aud)
    else:
        print("Usuario : admin")
    if ak == "1":
        apd = "Contraseña : " + PASSWD
        print(apd)
    else:
        print("Contraseña : nullnull")
    dd = "Directorio raiz FTP : " + USER_DIR
    print(dd)
    authorizer = DummyAuthorizer()
    authorizer.add_user(USER, PASSWD, USER_DIR, perm="elradfmwMT", msg_login="Login successful.", msg_quit="Goodbye.")
    if anonymous_add == "True":
        authorizer.add_anonymous(ANONYMOUS_DIR, perm='elr')
        ANONYMOUS_DIR_f = "Carpeta de usuario anonimo : " + str(ANONYMOUS_DIR)
        print(ANONYMOUS_DIR_f)
    else:
        print("Usuario anonimo deshabilitado")
    SERVER_ADDRESS = "Direccion del servidor FTP : ftp://" + IP + ":" + PORT
    print(SERVER_ADDRESS)
    logger = logging.getLogger()
    logger.setLevel(logging.INFO)

    handler = FTPHandler
    handler.authorizer = authorizer
    handler.banner = "Servidor FTP Python"
    handler.passive_ports = range(50000, 55535)
    logger = logging.getLogger()
    logger.setLevel(logging.INFO)

    address = ('', PORT)
    server = FTPServer(address, handler)
    logger = logging.getLogger()
    logger.setLevel(logging.INFO)

    server.max_cons = 256
    server.max_cons_per_ip = 5

    server.serve_forever(handle_exit=True)


arpa = argparse_es.ArgumentParser(description="Inicia un servidor FTP simple configurable", epilog="Vealo en GitHub: https://github.com/bapm394/pyFTp", prog="pyFTP")
arpag = arpa.add_mutually_exclusive_group()
arpa.add_argument("-u", "--user", help="Define el usuario, caso contrario sera por defecto")
arpa.add_argument("-k", "--key", help="Defina la contraseña, caso contrario sera por defecto")
arpa.add_argument("-d", "--dir", help="Define el directorio del usuario, de lo contrario sera la carpeta de usuario")
arpa.add_argument("-p", "--port", help="Define el puerto, por defecto sera \"8021\"")
arpag.add_argument("-a", "--adir", help="Habilita el usuario anonimo, y de argumento su carpeta, de lo contrario sera por defecto")
arpag.add_argument("-n", "--add", help="Habilita el usuario anonimo con una carpeta por defecto", action="store_true")
arpas = arpa.parse_args()


if arpas.user:
    USER = arpas.user
    au = "1"
else:
    USER = "admin"
    au = "0"

if arpas.key:
    PASSWD = arpas.key
    ak = "1"
else:
    PASSWD = "nullnull"
    ak = "0"

if arpas.port:
    PORT = arpas.port
    ap = "1"
else:
    PORT = "8021"
    ap = "0"

if arpas.dir:
    USER_DIR = arpas.dir
else:
    if os.path.exists("/data/data/com.termux/files/usr"):
        USER_DIR = "/data/data/com.termux/files/home"
    elif sys_type == "Linux":
        user_a = getpass.getuser()
        us_er_dir = "/home/" + str(user_a) + "/"
        USER_DIR = us_er_dir
    elif sys_type == "Windows":
        user_a = getpass.getuser()
        us_er_dir = "C:\\Users\\" + str(user_a) + "\\"
        USER_DIR = us_er_dir


if arpas.adir:
    ANONYMOUS_DIR = arpas.adir
    anonymous_add = "True"
else:
    anonymous_add = "False"

if arpas.add:
    anonymous_add = "True"
    if os.path.exists("/data/data/com.termux/files/usr"):
        USER_DIR = "/data/data/com.termux/files/home"
        us_er_dir = USER_DIR + "/anonymous"
        if os.path.exists(us_er_dir):
            ANONYMOUS_DIR = us_er_dir
        else:
            os.mkdir(us_er_dir)
            ANONYMOUS_DIR = us_er_dir
    elif sys_type == "Linux":
        user_a = getpass.getuser()
        us_er_dir = "/home/" + str(user_a) + "/" + "anonymous"
        if os.path.exists(us_er_dir):
            ANONYMOUS_DIR = us_er_dir
        else:
            os.mkdir(us_er_dir)
            ANONYMOUS_DIR = us_er_dir
    elif sys_type == "Windows":
        user_a = getpass.getuser()
        us_er_dir = "C:\\Users\\" + str(user_a) + "\\" + "anonymous"
        if os.path.exists(us_er_dir):
            ANONYMOUS_DIR = us_er_dir
        else:
            os.mkdir(us_er_dir)
            ANONYMOUS_DIR = us_er_dir


main()