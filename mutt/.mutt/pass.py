import subprocess

def mailpasswd(account):
    if account == 'fragal':
        path = "/home/fra/.mutt/passwd.gpg"
        return subprocess.check_output(["gpg", "--quiet", "--batch", "-d", path]).strip()
    else:
        return ''
