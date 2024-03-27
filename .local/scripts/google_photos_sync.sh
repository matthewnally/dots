#!/bin/bash
rclone sync ~/Pictures/camera gdrive:album/darktable --include="*.jpg" --verbose --update
