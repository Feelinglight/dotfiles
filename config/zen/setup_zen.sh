#!/bin/bash

set -Eeuo pipefail

# Копирует конфигурацию zen во все папки профилей

src="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"

for p in "$HOME"/.config/zen/* "$HOME"/.var/app/app.zen_browser.zen/{.zen,config/zen,zen}/*; do
  [[ -f "$p/prefs.js" ]] || continue
  echo "Link zen config to \"$p\""
  mkdir -p "$p/chrome"
  ln -sfn "$src/user.js" "$p/user.js"
  ln -sfn "$src/userChrome.css" "$p/chrome/userChrome.css"
done
