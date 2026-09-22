#! /bin/bash

set -e

EXCLAIDRAW_IMS="https://drive.google.com/drive/folders/1so7wGZ_F_2DIYixap7ioSat0ll2mS3_S?usp=drive_link"
LOGOS="https://drive.google.com/drive/folders/1vUyEXG6_PO8M-OU2RLf3yJmcdVjwvOkC?usp=drive_link"

if ! command -v gdown > /dev/null; then
    echo "gdown is required to fetch from google drive"
    echo "Install using \`pipx install gdown\`"
else
    if [ ! -d ./courses/formation_python/excalidraw-ims ]; then
        gdown --folder --output ./courses/formation_python/excalidraw-ims "$EXCLAIDRAW_IMS"
    fi
    if [ ! -d ./courses/formation_python/logos ]; then
        gdown --folder --output ./courses/formation_python/logos "$LOGOS"
    fi
fi
