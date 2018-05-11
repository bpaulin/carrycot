#!/usr/bin/bash -x

# Clean the pacman cache.
/usr/bin/yes | /usr/bin/pacman -Scc
/usr/bin/pacman-optimize
comm -23 <(pacman -Qqe) <(pacman -Qqg base base-devel | sort) > pre_installed_pkg
