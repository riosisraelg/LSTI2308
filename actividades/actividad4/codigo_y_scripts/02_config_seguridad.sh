#!/bin/bash
# 02_config_seguridad.sh - Aplica medidas de seguridad en el servidor
# Ejecutar con permisos de superusuario (sudo)

echo "--- Iniciando Configuración de Seguridad (Parte 2) ---"

# 1. Configurar UFW (Firewall)
echo "Configurando Firewall (UFW)..."
ufw default deny incoming
ufw default allow outgoing
ufw allow 22/tcp       # SSH
ufw allow 80/tcp       # HTTP Python Server
ufw allow 443/tcp      # HTTPS Python Server
ufw allow from 192.168.56.20 to any port 2049 # NFS para Cliente
ufw --force enable

# 2. Claves SSH (Se debe hacer por el usuario)
echo "Para la autenticación segura sin contraseña, ejecuta localmente:"
echo " ssh-keygen -t rsa -b 4096 "
echo " ssh-copy-id usuario@192.168.56.10 "
echo "Y deshabilita contraseñas en /etc/ssh/sshd_config editando PasswordAuthentication a 'no'"

# 3. HTTPS
echo "Para HTTPS, ejecuta comandos desde el script de Python proporcionado."

# 4. Nmap
apt install -y nmap
echo "Escaneo interno listo. Puedes escanear con 'nmap -sV -A localhost'"
echo "--- Fin de la Parte 2 ---"
