# Подготовка KDE

## Автоматическая установка

> [!WARNING]
> Автоматическая установка не исключает настройку GUI

```bash
git clone git@github.com:Feelinglight/dotfiles.git ~/data/develop/dotfiles
cd ~/data/develop/dotfiles
# Если какие-то модули не нужны, закомментировать их в ./install
./install
```

## Настройка GUI

## Google Chrome

- войти в аккаунт google в хроме

## VS Code

```bash
cp ~/data/develop/tools_tuning/vscode/settings.json ~/.config/Code/User/settings.json
~/data/develop/tools_tuning/vscode/restore.sh
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

- Добавить в remmina подключение к box5

- Параметры системы -> Общие папки Windows:

  - IRS\503 + domain password

- Dolphin:

  - Набрать в адресной строке smb://nas1/box, smb://5-10 -> Войти -> ПКМ на пустом месте -> Добавить в "Точки входа"


## Ноутбук

- Включить отображение процентов на виджете батареи
- Настроить отпечаток пальца
- Настроить touche + touchegg:

    - Свайп 3 пальцами - переключить комнату
    - В хроме свайп 3 пальцами вправо - средняя кнопка мыши

