# Настройка окружения kubuntu-desktop после установки Ubuntu

## Apt

```bash
sudo apt update
sudo apt full-upgrade
sudo apt install -y kubuntu-desktop openssh-server curl zsh virt-manager virt-viewer bat htop neovim git
sudo apt remove -y ibus 
```

> ibus удаляется для отключения бесполезной иконки EN справа на панели задач
> После этого лучше перезайти в KDE, т. к. все открытые окна перестанут реагировать на нажатия клавиш


## Не apt

- Скачать deb пакет хром с офф. сайта
  - установить
  - войти в аккаунт google
- Скачать deb пакет vscode с офф. сайта, установить
- Скачать tar.gz pycharm-community с офф. сайта, установить:

  ```bash
  sudo tar xzf pycharm-*.tar.gz -C /opt/
  sudo ln -s /opt/pycharm-*/bin/pycharm.sh /usr/local/bin/pycharm-community
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


## Панель задач

- На втором экране:

  - ПКМ -> Добавить панель -> Kubuntu стандартная панель

- На каждой панели отдельно:

  - ПКМ на виджете часов -> Настроить виджет "Цифровые часы" -> Формат даты = пользовательский -> ``dd.MM.yyyy, ddd``

  - ПКМ -> Настройка виджета "Панель задач...":

    - Группировка: Не группировать
   
  - Значки:
 
    - Параметры системы
    - Dolphin
    - Chrome
    - firefox
    - Kate
    - Konsole
    - VScode
    - gnome-calculator


## oh-my-zsh

```bash
git clone https://github.com/Feelinglight/tools_tuning ~/data/develop/tools_tuning
~/data/develop/tools_tuning/linux/zsh/setup.sh
```


## nvim

```bash
git clone https://github.com/Feelinglight/tools_tuning ~/data/develop/tools_tuning
~/data/develop/tools_tuning/vim/restore.sh
...
```

## Konsole

- Настройка -> Создать новый профиль

  - Поставить галку "Профиль по умолчанию"
  
  - Команда: /bin/zsh
    
    
## Работа

- Параметры системы -> Общие папки Windows:

  - IRS\503 + domain password

- Dolphin:

  - Набрать в адресной строке smb://box, smb://5-10 и перенести иконки в левое меню быстрого доступа


## Ноутбук

- Включить отображение процентов на виджете батареи
- Настроить отпечаток пальца
- Настроить touche + touchegg:
  
    - Свайп 3 пальцами - переключить комнату
    - В хроме свайп 3 пальцами вправо - средняя кнопка мыши


# Проблемы

- Не сохраняются размеры окон

  Сделать левый экран главным

- Не открываются Параметры системы (ошибка ``open collaboration service (0)``)

  Запускать из консоли командой ``LANG=en_US.UTF-8 systemsettings``
