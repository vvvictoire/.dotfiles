# Python 3 server example
from __future__ import unicode_literals
from http.server import BaseHTTPRequestHandler, HTTPServer
from urllib.parse import urlparse
import time
import subprocess
import youtube_dl

hostName = "localhost"
serverPort = 8080

youtube_dl_options = {
    'format': 'bestaudio/best',
    'postprocessors': [{
        'key': 'FFmpegExtractAudio',
        'preferredcodec': 'mp3',
        'preferredquality': '192',
    }],
    'outtmpl': '/home/trucy/Music/misc/%(title)s.%(ext)s'
}

def extract_youtube_url(dirty_url):
    splitted = dirty_url.split('&')
    return splitted[0]

class MyServer(BaseHTTPRequestHandler):
    def do_GET(self):
        self.send_response(200)
        self.send_header("Content-type", "text/html")
        self.end_headers()
        try:
            get_param = urlparse(self.path)
            video_url = extract_youtube_url(get_param.query)
            with youtube_dl.YoutubeDL(youtube_dl_options) as ydl:
                ydl.download([video_url])
            self.wfile.write(bytes("OK", "utf-8"))
        except:
            self.wfile.write(bytes("BRUH", "utf-8"))

if __name__ == "__main__":
    webServer = HTTPServer((hostName, serverPort), MyServer)
    print("Server started http://%s:%s" % (hostName, serverPort))

    try:
        webServer.serve_forever()
    except KeyboardInterrupt:
        pass

    webServer.server_close()
    print("Server stopped.")
