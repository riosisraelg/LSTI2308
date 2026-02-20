#!/bin/bash
# 03_config_nfs_p2p.sh - Configura servidor NFS e instala cliente BitTorrent
# Ejecutar con permisos de superusuario (sudo) en la Máquina Servidor

echo "--- Iniciando Configuración de Archivos Distribuidos y P2P (Parte 3) ---"

# 1. NFS Server Configuration
apt install -y nfs-kernel-server
mkdir -p /var/nfs_share
chown nobody:nogroup /var/nfs_share/

echo "Recuerda añadir a /etc/exports:"
echo "/var/nfs_share    192.168.56.20(rw,sync,no_subtree_check)"
echo "Y luego reiniciar con: systemctl restart nfs-kernel-server"

# 2. BitTorrent Terminal App (Transmission)
apt install -y transmission-cli transmission-daemon
systemctl start transmission-daemon

echo "Transmission P2P Daemon instalado. Puedes descargar via terminal usando 'transmission-cli <url-torrent>'"
echo "--- Fin del script de la Parte 3 ---"
