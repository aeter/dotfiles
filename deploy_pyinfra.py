#!/usr/bin/python3

# run with "pyinfra @local deploy_pyinfra.py"

from pyinfra import host
from pyinfra.operations import files, server
from pyinfra.facts.server import Home, Kernel

HOMEDIR = host.get_fact(Home)

files.sync(src="./home", dest=HOMEDIR, exclude="*.profile")

if host.get_fact(Kernel) == 'Linux':
    # files.block is currently in development in `pyinfra` - so we cat >> to append to .bashrc
    files.put(src="./home/.profile", dest=f"{HOMEDIR}/.profile_dotfiles")
    server.shell(commands=[f"cat {HOMEDIR}/.profile_dotfiles >> {HOMEDIR}/.bashrc"])
