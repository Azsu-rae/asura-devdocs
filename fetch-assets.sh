#! /bin/bash

set -e

if ! command -v gdown > /dev/null; then
    echo "gdown is required to fetch from google drive"
    echo "Install using \`pipx install gdown\`"
else
    if [ ! -d ./excalidraw-ims ]; then
        gdown --folder https://drive.google.com/drive/folders/1so7wGZ_F_2DIYixap7ioSat0ll2mS3_S?usp=drive_link
    fi
    if [ ! -d ./logos ]; then
        gdown --folder https://drive.google.com/drive/folders/1vUyEXG6_PO8M-OU2RLf3yJmcdVjwvOkC?usp=drive_link
    fi
fi

