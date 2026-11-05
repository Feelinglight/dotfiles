// Дополнительная конфигурация
//
// В адресной строке: about:config

// При открытии новой вкладки открывать отдельную вкладку вместо фокуса на адресную строку
// https://github.com/zen-browser/desktop/issues/5109
user_pref("zen.urlbar.replace-newtab", false);

// Закрывать браузер если закрвыается последняя вкладка
// https://github.com/zen-browser/desktop/issues/2537
user_pref("browser.tabs.closeWindowWithLastTab", true);

// Создавать новые вкладки ниже текущей
user_pref("browser.tabs.insertRelatedAfterCurrent", false);
user_pref("browser.tabs.insertAfterCurrent", true);

// Не открывать вкладки в новом окне
// https://www.reddit.com/r/zen_browser/comments/1qoq9lb/how_to_turn_off_window_sync/
user_pref("zen.window-sync.enabled", false);

// Открывать следующую по порядку вкладку при закрытии текущей
// https://www.reddit.com/r/zen_browser/comments/1qt1nce/how_do_i_fix_the_tab_order_so_that_when_i_close_a/
user_pref("zen.tabs.select-recently-used-on-close", false);

// Количество результатов в выпадающем списке подсказок search-bar
user_pref("browser.urlbar.maxRichResults", 10);

// Включает подгрузку chrome/userChrome.css
user_pref("toolkit.legacyUserProfileCustomizations.stylesheets", true);
