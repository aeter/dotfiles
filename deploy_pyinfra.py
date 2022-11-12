#!/usr/bin/python3

# run with "pyinfra @local deploy_pyinfra.py"

from pyinfra import host
from pyinfra.operations import files
from pyinfra.facts.server import Home, Kernel

HOMEDIR = host.get_fact(Home)

files.sync(src="./home", dest=HOMEDIR, exclude="*.profile")

if host.get_fact(Kernel) == 'Linux':
    files.put(src="./home/.profile", dest=f"{HOMEDIR}/.bashrc")
