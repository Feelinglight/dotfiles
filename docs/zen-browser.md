# Дополнительная конфигурация

- В адресной строке: ``about:config``

  - При открытии новой вкладки [открывать отдельную вкладку](https://github.com/zen-browser/desktop/issues/5109)
    вместо фокуса на адресную строку

    **zen.urlbar.replace-newtab** = false

- [Закрывать браузер если закрвыается последняя вкладка](https://github.com/zen-browser/desktop/issues/2537)

  **browser.tabs.closeWindowWithLastTab** = true

- Создавать новые вкладки ниже текущей

  - **browser.tabs.insertRelatedAfterCurrent** = false
  - **browser.tabs.insertAfterCurrent** = true

- [Не открывать вкладки в новом окне](https://www.reddit.com/r/zen_browser/comments/1qoq9lb/how_to_turn_off_window_sync/)

  **zen.window-sync.enabled** = false
