#!/usr/bin/env python3
import http.server
import socketserver
import os

PORT = 80
DIRECTORY = os.path.dirname(os.path.abspath(__file__))

class Handler(http.server.SimpleHTTPRequestHandler):
    def __init__(self, *args, **kwargs):
        super().__init__(*args, directory=DIRECTORY, **kwargs)

with socketserver.TCPServer(("0.0.0.0", PORT), Handler) as httpd:
    print(f"Servidor HTTP activo en el puerto {PORT}. Sirviendo archivos de: {DIRECTORY}")
    print("Manten el servidor corriendo y abre el navegador o usa curl desde el cliente.")
    try:
        httpd.serve_forever()
    except KeyboardInterrupt:
        print("\nServidor HTTP detenido.")
