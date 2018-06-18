import subprocess

def mailpasswd(account):
    if account == 'unito':
        path = "/home/fra/.mutt/omappass.gpg"
        return subprocess.check_output(["gpg", "--quiet", "--batch", "-d", path]).strip()
    else:
        return ''
