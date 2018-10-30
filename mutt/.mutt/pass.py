import subprocess

def mailpasswd(account):
    if account == 'fragal':
        path = "/home/fra/.mutt/passwd.gpg"
        mp = subprocess.check_output(["pass","pgp"]).strip()
        ps = subprocess.Popen(("echo", mp.decode("utf-8")), stdout=subprocess.PIPE)
        return subprocess.check_output(["gpg", "--quiet", "--armor", "--batch",
        "--pinentry-mode", "loopback", "--passphrase-fd", "0", "-d", path], stdin=ps.stdout).strip().decode("utf-8")
        # print(subprocess.check_output(["gpg", "--quiet", "--armor", "--batch",
        # "--pinentry-mode", "loopback", "--passphrase-fd", "0", "-d", path],
        # stdin=ps.stdout).strip().decode("utf-8"))
    else:
        return ''

