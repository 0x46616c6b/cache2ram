#!/usr/bin/env bash

#	 cache2ram 
#	 ---------
#
#    Copyright (C) 2011  0x46616c6b
#
#    This program is free software: you can redistribute it and/or modify
#    it under the terms of the GNU General Public License as published by
#    the Free Software Foundation, either version 3 of the License, or
#    (at your option) any later version.
#
#    This program is distributed in the hope that it will be useful,
#    but WITHOUT ANY WARRANTY; without even the implied warranty of
#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#    GNU General Public License for more details.
#
#    You should have received a copy of the GNU General Public License
#   along with this program.  If not, see <http://www.gnu.org/licenses/>.
#

dirs="Google com.apple.iTunes com.apple.Safari Firefox"
size=1024 # size in mb
user=$(/usr/bin/logname)
origin="/Users/${user}/Library/Caches"
ramdisk="/Volumes/ramdisk"

diskutil erasevolume HFS+ "ramdisk" `hdiutil attach -nomount ram://$[size*2048]`

if [ -d ${ramdisk} ]; then
	for dir in ${dirs}
	do
		mkdir ${ramdisk}/${dir}
		if [ -d ${origin}/${dir} ]; then
			mv ${origin}/${dir} ${origin}/${dir}.bak
		fi
	
		if [ ! -L ${origin}/${dir} ]; then
		ln -s ${ramdisk}/${dir} ${origin}/${dir}
		fi
	done
fi

