import os

dirs = ["/home/fra/.mail/fragal/INBOX/new/","/home/fra/.mail/unito/INBOX/new/"];

print(len([fname for d in dirs for fname in os.listdir(d)]))
