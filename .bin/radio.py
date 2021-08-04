import os
import json

from colorama import init
from termcolor import colored

CONF = '.config/radio.json'

init()

with open(CONF, 'r') as f:
    data = json.load(f)

os.system('clear')

print(colored('Choose a channel:', 'yellow', attrs=['bold']))

quit_radio = False

while not quit_radio:
    for channel in data:
        alias = colored(f'[{channel["alias"]}]', 'red')
        name = colored(f'{channel["name"]}', 'magenta')
        if len(channel['alias']) < 2:
            print(f'{alias}  {name}')
        else:
            print(f'{alias} {name}')

    user_input = input('>')
    result = list(filter(lambda channel: channel['alias'] == user_input, data))

    if len(result) != 1 and user_input != 'q':
        os.system('clear')
        print(colored('Could not find channel, try again:', 'yellow', attrs=['bold']))
    elif user_input == 'q':
        quit_radio = True
    else:
        channel = result[0]
        os.system('clear')

        print(f'{colored("Currently Playing:", "yellow", attrs=["bold"])} {colored(channel["name"], "magenta")}')

        os.system(f'mpv --no-video --msg-level=ffmpeg=no,ffmpeg/demuxer=no,lavf=no {channel["url"]}')
        os.system('clear')
        print(colored('Choose a channel:', 'yellow', attrs=['bold']))
