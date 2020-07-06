#!/bin/bash
# Download and install fonts
# Assume the system is Ubuntu

FONTS_PATH="~/.fonts"
DOWNLOADS_PATH="~/Downloads"

if [[ ! -d $FONTS_PATH ]]; then
  mkdir ~/.fonts
fi

if [[ ! -d $DOWNLOADS_PATH ]]; then
  mkdir ~/Downloads
fi

echo -e "\nAll fonts are downloaded to $DOWNLOADS_PATH."


echo -e "\n\nIosevka"
if [[ ! -d "${FONTS_PATH}/iosevka" ]]; then
  echo "Downloading Iosevka..."
  iosevka_target="iosevka-term-ss09-3.0.0-rc.8"
  cd ~/Downloads
  wget "https://github.com/be5invis/Iosevka/releases/download/v3.0.0-rc.8/${iosevka_target}.zip"
  echo "Installing..."
  mkdir -p ~/.fonts/iosevka
  unzip "${iosevka_target}.zip" -d ${iosevka_target} > /dev/null
  mv "${iosevka_target}/ttf/"* ~/.fonts/iosevka
else
  echo "Iosevka has already been installed."
fi
