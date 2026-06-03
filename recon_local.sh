#!/bin/bash
#Script de reconnaissance locale - kernelghost
# Usage : ./recon_local.sh

echo "===== UTILISATEUR COURANT ====="
whoami && id

echo "===== SYSTEME ====="
uname -a
lsb_release -a 2>/dev/null

echo "===== UTILISATEURS AVEC SHELL ====="
cat /etc/passwd | grep -v nologin | grep -v false

echo "===== PORTS EN ECOUTE ====="
ss -tlnp

echo "===== SERVICES ACTIFS ====="
systemctl list-units --type=service --state=running --no-pager

echo "===== BINAIRES SUID ====="
find / -perm -4000 -type f 2>/dev/null

echo "===== CONNEXIONS RESEAU ====="
ss -tnp

echo "===== DERNIERES CONNEXIONS ====="
last | head -10

