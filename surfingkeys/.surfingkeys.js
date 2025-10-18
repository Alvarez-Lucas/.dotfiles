// Settings
settings.showModeStatus = true; // Whether always to show mode status. ( false; )
settings.showProxyInStatusBar = false; // Whether to show proxy info in status bar. ( false; )
settings.richHintsForKeystroke = 500; // Timeout(ms) to show rich hints for keystroke, 0 will disable rich hints. ( 500; )
settings.useLocalMarkdownAPI = true; // Whether to use [chjj/marked](https: //github.com/chjj/marked) to parse markdown, otherwise use github markdown API. ( true; // Whether to use [chjj/marked](https:)
settings.focusOnSaved = true; // Whether to focus text input after quitting from vim editor. ( true; )
settings.omnibarMaxResults = 10; // How many results will be listed out each page for Omnibar. ( 10; )
settings.omnibarHistoryCacheSize = 100; // The maximum of items fetched from browser history. ( 100; )
settings.omnibarPosition = "bottom"; // Where to position Omnibar. ["middle", "bottom"] ( "middle"; )
settings.omnibarSuggestion = true; // Show suggestion URLs ( false; )
settings.omnibarSuggestionTimeout = 200; // Timeout duration before Omnibar suggestion URLs are queried, in milliseconds. Helps prevent unnecessary HTTP requests and API rate-limiting. ( 200; )
settings.focusFirstCandidate = true; // Whether to focus first candidate of matched result in Omnibar. ( false; )
settings.tabsThreshold = 0; // When total of opened tabs exceeds the number, Omnibar will be used for choosing tabs. ( 100; )
settings.verticalTabs = true; // Whether to show tab pickers vertically aligned. ( true; )
settings.clickableSelector = ""; // Extra CSS selector to pick elements for hints mode, such as "\*.jfk-button, \*.goog-flat-menu-button". ( ""; )
// settings.clickablePat = "/(https?|thunder|magnet)://\S+/ig"; // A regex to detect clickable links from text, you could use `O` to open them. ( "/(https?|thunder|magnet)://\S+/ig"; )
// ((settings.editableSelector = div.CodeMirror - scroll), div.ace_content); // CSS selector for additional editable elements. ( div.CodeMirror - scroll), div.ace_content); )
settings.smoothScroll = true; // Whether to use smooth scrolling when pressing keys like `j`/`k`/`e`/`d` to scroll page or elements. ( true; )
settings.modeAfterYank = ""; // Which mode to fall back after yanking text in visual mode. Value could be one of ["", "Caret", "Normal"], default is "", which means no action after yank. ( ""; )
settings.scrollStepSize = 100; // A step size for each move by `j`/`k` ( 70; )
settings.scrollFriction = 0; // A force that is needed to start continuous scrolling after initial scroll step. A bigger number will cause a flicker after initial step, but help to keep the first step precise. ( 0; )
settings.nextLinkRegex = /((>>|next)+)/i; // A regex to match links that indicate next page. ( /((>>|next)+)/i; )
settings.prevLinkRegex = /((<<|prev(ious)?)+)/i; // A regex to match links that indicate previous page. ( /((<<|prev(ious)?)+)/i; )
settings.hintAlign = "left"; // Alignment of hints on their target elements. ["left", "center", "right"] ( "center"; )
settings.hintExplicit = false; // Whether to wait for explicit input when there is only a single hint available ( false; )
settings.hintShiftNonActive = false; // Whether new tab is active after entering hint while holding shift ( false; )
settings.defaultSearchEngine = "k"; // The default search engine used in Omnibar. ( "g"; )
settings.blocklistPattern = undefined; // A regex to match the sites that will have Surfingkeys disabled. ( undefined; )
settings.focusAfterClosed = "last"; // Which tab will be focused after the current tab is closed. ["left", "right", "last"] ( "right"; )
settings.repeatThreshold = 9; // The maximum of actions to be repeated. ( 9; )
settings.tabsMRUOrder = true; // Whether to list opened tabs in order of most recently used beneath Omnibar. ( true; )
settings.historyMUOrder = true; // Whether to list history in order of most used beneath Omnibar. ( true; )
settings.newTabPosition = "right"; // Where to new tab. ["left", "right", "first", "last", "default"] ( "default"; )
settings.interceptedErrors = []; // Indicates for which errors Surfingkeys will show error page, so that you could use Surfingkeys on those error pages. For example, ["*"] to show error page for all errors, or ["net::ERR_NAME_NOT_RESOLVED"] to show error page only for ERR_NAME_NOT_RESOLVED, please refer to [net_error_list.h](https: //github.com/adobe/chromium/blob/master/net/base/net_error_list.h) for complete error list.  ( []; // Indicates for which errors Surfingkeys will show error page, so that you could use Surfingkeys on those error pages. For example, ["*"] to show error page for all errors, or ["net::ERR_NAME_NOT_RESOLVED"] to show error page only for ERR_NAME_NOT_RESOLVED, please refer to [net_error_list.h](https:)
settings.enableEmojiInsertion = false; // Whether to turn on Emoji completion in Insert mode. ( false; )
settings.startToShowEmoji = 2; // How many characters are needed after colon to show emoji suggestion. ( 2; )
settings.language = undefined; // The language of the usage popover, only "zh-CN" and "ru-RU" are added for now, PR for any other language is welcomed, please see [l10n.json](https: //github.com/brookhong/Surfingkeys/blob/master/src/pages/l10n.json). ( undefined; // The language of the usage popover, only "zh-CN" and "ru-RU" are added for now, PR for any other language is welcomed, please see [l10n.json](https:)
settings.stealFocusOnLoad = true; // Whether to prevent focus on input on page loaded, set to true by default so that we could use Surfingkeys directly after page loaded, otherwise we need press `Esc` to quit input. ( true; )
settings.enableAutoFocus = true; // Whether to enable auto focus after mouse click on some widget. This is different with `stealFocusOnLoad`, which is only for the time of page loaded. For example, there is a hidden input box on a page, it is turned to visible after user clicks on some other link. If you don't like the input to be focused when it's turned to visible, you could set this to false. ( true; )
settings.theme = undefined; // To change css of the Surfingkeys UI elements. ( undefined; )
settings.caseSensitive = false; // Whether finding in page/Omnibar is case sensitive. ( false; )
settings.smartCase = true; // Whether to make caseSensitive true if the search pattern contains upper case characters. ( true; )
settings.cursorAtEndOfInput = true; // Whether to put cursor at end of input when entering an input box, by false to put the cursor where it was when focus was removed from the input. ( true; )
settings.digitForRepeat = true; // Whether digits are reserved for repeats, by false to enable mapping of numeric keys. ( true; )
settings.editableBodyCare = true; // Insert mode is activated automatically when an editable element is focused, so if document.body is editable for some window/iframe (such as docs.google.com), Insert mode is always activated on the window/iframe, which means all shortcuts from Normal mode will not be available. With `editableBodyCare` as `true`, Insert mode will not be activated automatically in this case. ( true; )
settings.ignoredFrameHosts = ["https://tpc.googlesyndication.com"]; // When using `w` to loop through frames, you could use this settings to exclude some of them, such as those for advertisements. ( ["https://tpc.googlesyndication.com"]; )
settings.aceKeybindings = "vim"; // Set it "emacs" to use emacs keybindings in the ACE editor. ( "vim"; )
settings.caretViewport = null; // Set it in format `[top, left, bottom, right]` to limit hints generation on `v` for entering visual mode, such as `[window.innerHeight / 2 - 10, 0, window.innerHeight / 2 + 10, window.innerWidth]` will make Surfingkeys generate Hints only for text that display on vertically middle of window. ( null; )
settings.mouseSelectToQuery = []; // All hosts that have enable feature -- mouse selection to query. ( []; )
settings.autoSpeakOnInlineQuery = false; // Whether to automatically speak the query string with TTS on inline query. ( false; )
settings.showTabIndices = true; // Whether to show tab numbers (indices) in the tab titles. ( false; )
settings.tabIndicesSeparator = "|"; // The separator between index and original title of a tab. ( "|"; )
settings.disabledOnActiveElementPattern = undefined; // Automatically disable this extension when the active element matches with this pattern and reactivate the extension when the active element changes, one useful case is to enable user to type to locate an option in a large dropdown, such as `settings.disabledOnActiveElementPattern = "ul.select-dropdown-options" ( undefined; )

api.Hints.setCharacters("sadjklewcmpgh");

// Search Aliases
api.addSearchAlias(
  "k",
  "kagi",
  "https://kagi.com/search?q=%s",
  "s",
  "https://kagi.com/api/autosuggest?q=%s",
  function (response) {
    var res = JSON.parse(response.text);
    return res.map(function (r) {
      return r.phrase;
    });
  },
);

// Keymaps
api.map(">", ">>"); // Move tab right
api.map("<", "<<"); // Move tab left

// api.map("F", "gf"); // Open link in brackground tab
api.map("F", "C");

api.map("<Backspace>", "<Ctrl-6>");

api.cmap("<Ctrl-k>", "<Tab>");
api.cmap("<Ctrl-j>", "<Shift-Tab>");

api.cmap("<Shift-Enter>", "<Enter>");
api.cmap("<Enter>", "<Shift-Enter>");

api.cmap("<Shift-Enter>", "<Enter>");
api.cmap("<Enter>", "<Shift-Enter>");
// api.mapkey("<Ctrl-y>", "Show me the money", function () {
//   api.Front.showPopup(
//     "a well-known phrase uttered by characters in the 1996 film Jerry Maguire (Escape to close).",
//   );
//
// });d
// focused
