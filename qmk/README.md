# Сборка vial для Lily58

```bash
git clone git clone --recurse-submodules -j8 https://github.com/vial-kb/vial-qmk
cd vial-qmk
python3 -m pip install qmk
qmk setup
qmk compile -kb lily58 -km vial
# 2 раза нажать reset на клавиатуре (рядом с дисплеем)
qmk flash -kb -lily58 -km vial
```

- Прошивать каждую половинку отдельно, без соединения половинок
- Файлы **config.h** и **rules.mk** скопировать в **vial-qmk/keyboards/lily58/rev1/keymaps/vial/**
