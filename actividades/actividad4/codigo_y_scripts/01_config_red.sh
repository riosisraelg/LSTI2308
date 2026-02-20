#!/bin/bash
# 01_config_red.sh - Configura la red e instala los servicios iniciales
# Ejecutar con permisos de superusuario (sudo)

echo "--- Iniciando Configuración de Red (Parte 1) ---"

# Instalar utilidades base de red
apt update
apt install -y openssh-server python3 

# Levantar servicio SSH de inmediato
systemctl enable ssh
systemctl start ssh

echo "SSH instalado y ejecutándose."
echo "Para el servidor web, asegúrate de correr 'python3 http_server.py' en la carpeta deseada."
echo "--- Fin de la Parte 1 ---"
