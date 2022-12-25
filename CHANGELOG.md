# UNRELEASED
- Added upside-down flip with shift+F. (No right-click menu entry yet)
- Fixed bug where only the keyboard top row numbers could be used to preceed `D`, `M`, or `R` keybinds with an amount of cards to draw, mill, or scry (respectively). Now the numpad numbers work, too.
- Fixed issue where using E (exile), C (command zone), or K (bottom of deck) on a card that was already in the destination zone caused an error and crash.

# 2022.12.17
- Fixed bugs with loading bad background/sleeve images causing a crash.
- Added an error window for when loading a background or sleeve image fails.
- Fixed bugs where cards put into the graveyard with Mill (`M` keybind) or from modifying `Esc` in the Scry view would put them at the bottom instead of the top.
- Fixed a bug where dragging card(s) to a hidden zone (Deck or Hand) was not clearing the counters.
- Added keybind hints to right-click menus.
- Some other misc. bugfixes