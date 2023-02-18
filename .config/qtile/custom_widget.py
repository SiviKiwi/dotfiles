import socket
import json
import re
from libqtile.widget import base


class MPVNowPlaying(base.InLoopPollText):
    def __init__(self, socket_path, **config):
        super().__init__(**config)
        self.add_defaults(MPVNowPlaying.defaults)
        self.socket_path = socket_path

        self.__prev_song = ""

    def poll(self):
        currently_playing_song = ""

        s = socket.socket(socket.AF_UNIX, socket.SOCK_STREAM)

        try:
            s.connect(self.socket_path)

            s.send('{ "command": ["get_property", "media-title"] }\n'.encode('utf-8'))

            response = s.recv(1024)

            # Parse the response to extract the currently playing song
            try:
                response_json = json.loads(response)
            except json.decoder.JSONDecodeError:
                response_json = ""

            if "data" in response_json:
                song = re.sub(r"\d{4}-\d{2}-\d{2} \d{2}:\d{2}", "", response_json["data"]) + '|'
                if song != self.__prev_song:
                    currently_playing_song = song
                    self.__prev_song = song
            s.close()
        except (ConnectionRefusedError, FileNotFoundError):
            pass
        return currently_playing_song
