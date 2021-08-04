import os

from libqtile.command.client import InteractiveCommandClient
from libqtile.log_utils import logger


def start_radio(commandClient):
    logger.warning(commandClient.spawn(['alacritty', '-t', 'radio', '-e', '~/.bin/radio.sh', '-t'], False))



def startup():
    commandClient = InteractiveCommandClient()


    os.system('nitrogen --restore')
