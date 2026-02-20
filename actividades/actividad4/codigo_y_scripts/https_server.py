#!/usr/bin/env python3
import http.server
import socketserver
import ssl
import os

PORT = 443
DIRECTORY = os.path.dirname(os.path.abspath(__file__))
CERT_FILE = os.path.join(DIRECTORY, "server.pem")

print("Generando un certificado autofirmado (server.pem) para HTTPS...")
if not os.path.exists(CERT_FILE):
    os.system(f"openssl req -new -x509 -keyout {CERT_FILE} -out {CERT_FILE} -days 365 -nodes -subj '/CN=localhost'")
    print("Certificado generado exitosamente.")

class Handler(http.server.SimpleHTTPRequestHandler):
    def __init__(self, *args, **kwargs):
        super().__init__(*args, directory=DIRECTORY, **kwargs)

httpd = socketserver.TCPServer(("0.0.0.0", PORT), Handler)

# Convertir el socket a HTTPS utilizando el certificado
httpd.socket = ssl.wrap_socket(httpd.socket,
                               server_side=True,
                               certfile=CERT_FILE,
                               ssl_version=ssl.PROTOCOL_TLS)

print(f"Servidor HTTPS seguro activo en el puerto {PORT}. Sirviendo archivos de: {DIRECTORY}")
print("Puedes probar con: curl -k https://localhost/")
try:
    httpd.serve_forever()
except KeyboardInterrupt:
    print("\nServidor HTTPS detenido.")
