# Настройка окружения kubuntu-desktop после установки Ubuntu

## Apt

```bash
sudo apt update
sudo apt full-upgrade
# npm нужен для lsp сервера pyright для neovim
sudo apt install -y kubuntu-desktop openssh-server \
  curl zsh virt-manager virt-viewer bat htop git \
  git-gui python3-venv python3-pip fontconfig \
  npm fzf zoxide fd-find tree
sudo apt remove -y ibus
```

> ibus удаляется для отключения бесполезной иконки EN справа на панели задач
> После этого лучше перезайти в KDE, т. к. все открытые окна перестанут реагировать на нажатия клавиш

### Syncthing

```bash
sudo apt install syncthing

sudo systemctl enable syncthing@dmitry.service
sudo systemctl start syncthing@dmitry.service
```

## Не apt

### Chrome

- Скачать deb пакет хром с офф. сайта
  - установить
  - войти в аккаунт google


### VS Code

- Скачать deb пакет vscode с офф. сайта, установить


### Pycharm

- Скачать tar.gz pycharm-community с офф. сайта, установить:

  ```bash
  sudo tar xzf pycharm-*.tar.gz -C /opt/
  sudo ln -s /opt/pycharm-*/bin/pycharm /usr/local/bin/pycharm-community
  ```
  
### Clion

- Скачать tar.gz clion с офф. сайта, установить:
    
  ```bash
  sudo tar xzf CLion-*.tar.gz -C /opt
  sudo ln -s /opt/clion-*/bin/clion /usr/local/bin/clion
  ```

### npm

Некоторые плагины neovim (lsp bashls, cspell) хотят новую версию npm.

```sh
sudo npm install -g n
sudo n lts
```


### NeoVim

> В ppa для ubuntu максимальная версия **0.7**, что сильно меньше актуальной.

```sh
sudo apt install curl libfuse2 g++ npm xclip ripgrep
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage
chmod +x nvim.appimage
sudo mv nvim.appimage /usr/local/bin/nvim
```

### Nerd fonts

```sh
curl -OL https://github.com/ryanoasis/nerd-fonts/releases/latest/download/JetBrainsMono.tar.xz
mkdir ./JetBrainsMono
tar xf ./JetBrainsMono.tar.xz -C ./JetBrainsMono

mkdir -p ~/.local/share/fonts
mv ./JetBrainsMono/*.ttf ~/.local/share/fonts
fc-cache ~/.local/share/fonts

rm -rf ./JetBrainsMono.tar.xz ./JetBrainsMono
```

## Папки

```bash
mkdir -p ~/data/develop
```


## Параметры системы

- Перезайти из Gnome в KDE
- Клавиатура:
  
  - Убедиться, что установлены 2 раскладки клавиатуры (en, ru)
  - Задать комбинацию переключения раскладок **Alt + Shift**
  - Включить NumLock на старте

- Переключение окон
  
  - Убрать галку "Показывать выбранное окно"
  - Выбрать Thumbnail Grid, если не будет в списке, загрузить из kde store

- Управление сеансами

  - Восстановление сеанса -> Начинать с пустого сеанса
  - Экран завершения работы -> Убрать галку "Показывать"
  
- Комбинации клавиш

  - Kwin -> Переключиться на один рабочий стол вправо -> Win + Tab
  - Kwin -> Переключиться на один рабочий стол влево -> Win + Shift + Tab
  - Kwin -> Переместить окно в центр -> Win + Shift + Backspace

- Поведение рабочей среды -> Виртуальные рабочие столы

  - Создать нужное рабочих столов
  - Поставить галку "С переходом по циклу"

## Панель задач

- На втором экране:

  - ПКМ -> Добавить панель -> Kubuntu стандартная панель

- На каждой панели отдельно:

  - ПКМ на виджете часов -> Настроить виджет "Цифровые часы" -> Формат даты = пользовательский -> ``dd.MM.yyyy, ddd``

  - ПКМ -> Настройка виджета "Панель задач...":

    - Группировка: Не группировать
   
  - ПКМ на виджете "Переключение рабочих столов" -> "Настроить виджет ..." -> Поставить галку "Показывать значки приложений на схемах окон"
   
  - ПКМ на панели -> Добавить виджеты -> Переключение рабочих столов
    
  - Значки:
 
    - Параметры системы
    - Dolphin
    - Chrome
    - firefox
    - Kate
    - Konsole
    - VScode
    - clion
    - pycharm-community
    - gnome-calculator
    - remmina


## oh-my-zsh

```bash
git clone https://github.com/Feelinglight/tools_tuning ~/data/develop/tools_tuning
~/data/develop/tools_tuning/linux/zsh/setup.sh
```


## nvim

```bash
git clone https://github.com/Feelinglight/tools_tuning ~/data/develop/tools_tuning
~/data/develop/tools_tuning/vim/restore.sh
sudo ~/data/develop/tools_tuning/vim/restore.sh
```


## vscode

```bash
cp ~/data/develop/tools_tuning/vscode/settings.json ~/.config/Code/User/settings.json
~/data/develop/tools_tuning/vscode/restore.sh
```

## Kate

- Настройка -> Настроить Kate... -> Сеансы -> Поведение при запуске и завершении работы

  - Убрать галку "Показывать страницу приветствия при открытии нового окна"


## Konsole

- Настройка -> Создать новый профиль

  - Поставить галку "Профиль по умолчанию"
  
  - Команда: /bin/zsh
 
- Настройка -> Настроить профиль... -> Внешний вид

  - Выбрать шрифт JetBrainsMonoNL Nerd Font / Regular / 10

- Настройка -> Настроить Konsole... -> Панель вкладок / Разделение окна -> Разделение окна

  - Установить "Показывать заголовок" в "Никогда"

- Настройка -> Комбинации клавиш... -> Копировать

  - Добавить комбинацию "Ctrl + Ins"

- Нажать ``Ctrl + Shift + M``, чтобы скрыть верхнее меню

## Dolphin

- В правой панели ПКМ -> Скрыть

  - раздел Поиск
  - Музыка
  - Изображения
  - Видеофайлы
  - Документы
    
## Работа

- Настроить remmina

  ```sh
  sudo apt install -y remmina openvpn-systemd-resolved
  ```

  - Добавить в remmina подключение к box5

- Параметры системы -> Общие папки Windows:

  - IRS\503 + domain password

- Dolphin:

  - Набрать в адресной строке smb://nas1/box, smb://5-10 -> Войти -> ПКМ на пустом месте -> Добавить в "Точки входа"


## Ноутбук

- Включить отображение процентов на виджете батареи
- Если bluetooth-мышь, то ``sudo apt install solaar`` для отображения заряда мыши
- Настроить отпечаток пальца
- Настроить touche + touchegg:
  
    - Свайп 3 пальцами - переключить комнату
    - В хроме свайп 3 пальцами вправо - средняя кнопка мыши


# Проблемы

- Не сохраняются размеры окон

  Сделать левый экран главным

- Не открываются Параметры системы (ошибка ``open collaboration service (0)``)

  Запускать из консоли командой ``LANG=en_US.UTF-8 systemsettings``

- При запуске Dolphin открывается zsh вместо oh-my-zsh

  [С этим нужно жить](https://bugs.kde.org/show_bug.cgi?id=407990)((

- Chrome показывает уведомление об обновлениях при запуске

  В файле **nvim /usr/share/applications/google-chrome.desktop** исправить первую строку вида
  ```ini
  Exec=/usr/bin/google-chrome-stable
  ```
  на
  ```ini
  Exec=/usr/bin/google-chrome-stable --simulate-outdated-no-au='Tue, 31 Dec 2099 23:59:59 GMT' %U
  ```
