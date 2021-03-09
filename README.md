# imba.io-widgets-ui :: IconsStyleSheets
The Ultimate UI Component Library for Imba

Обычные иконки проектов

Деплой:

```
fontforge --quiet -c 'open(argv[1]).generate(argv[2])' QwarsSymbols-Regular.sfd QwarsSymbols-Regular.ttf
fontforge --quiet -c 'open(argv[1]).generate(argv[2])' QwarsSymbols-Regular.sfd QwarsSymbols-Regular.woff
```

EOT file

sudo apt install eot-utils

```
mkeot QwarsSymbols-Regular.ttf > QwarsSymbols-Regular.eot
```

Подключить к проекту: `git submodule add -b IconsStyleSheets git@github.com:qwars/imba.io-widgets-ui {path-folder}` 

