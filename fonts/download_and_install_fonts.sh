#!/bin/bash
# Download and install fonts
# Assume the system is Ubuntu

if [[ ! -d ~/.fonts ]]; then
  mkdir ~/.fonts
fi

if [[ ! -d ~/Downloads ]]; then
  mkdir ~/Downloads
fi

echo -e "\nAll fonts are downloaded to ~/Downloads."


echo -e "\n\nIosevka"
echo "Downloading..."
iosevka_target="iosevka-term-ss09-3.0.0-rc.8"
cd ~/Downloads
wget "https://github.com/be5invis/Iosevka/releases/download/v3.0.0-rc.8/${iosevka_target}.zip"
echo "Installing..."
mkdir -p ~/.fonts/iosevka
unzip "${iosevka_target}.zip" -d ${iosevka_target} > /dev/null
mv "${iosevka_target}/ttf/"* ~/.fonts/iosevka
