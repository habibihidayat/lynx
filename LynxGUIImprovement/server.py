import http.server
import socketserver
import os

PORT = 5000
DIRECTORY = "."

class MyHTTPRequestHandler(http.server.SimpleHTTPRequestHandler):
    def __init__(self, *args, **kwargs):
        super().__init__(*args, directory=DIRECTORY, **kwargs)
    
    def end_headers(self):
        self.send_header('Cache-Control', 'no-store, no-cache, must-revalidate')
        self.send_header('Expires', '0')
        super().end_headers()

if __name__ == "__main__":
    handler = MyHTTPRequestHandler
    
    with socketserver.TCPServer(("0.0.0.0", PORT), handler) as httpd:
        print(f"🚀 Server berjalan di http://0.0.0.0:{PORT}")
        print(f"📁 Melayani file dari: {os.path.abspath(DIRECTORY)}")
        print(f"✨ Dokumentasi Lynx GUI v2.0 Enhanced")
        print(f"🌐 Akses melalui Webview untuk melihat dokumentasi lengkap")
        httpd.serve_forever()
