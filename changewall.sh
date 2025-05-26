#!/bin/bash

echo "Changing the desktop wallpaper now..."

# add your pwn wallpaper directory in here

wallpaper_dir=/run/media/

# wallpaper change automation
random_wallpaper=$(ls $wallpaper_dir | shuf -n1)
plasma-apply-wallpaperimage "$wallpaper_dir/$random_wallpaper"

echo "Task completed."
