#!/bin/sh

bash setup_tools/get_configs.sh
git add .
echo "commit message"
read message
git commit -m "$message"

