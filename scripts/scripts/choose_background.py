#!/usr/bin/python

import os, random
from subprocess import call

dir_path = '/home/lgoodridge/Backgrounds'
if (os.path.exists(dir_path)):
	filename = random.choice(os.listdir(dir_path))
	fullpath = os.path.join(dir_path, filename)
	call(["feh", "--bg-scale", fullpath])
