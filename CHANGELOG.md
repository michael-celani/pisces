# UNRELEASED
- Added upside-down flip with shift+F. (No right-click menu entry yet)
- Fixed bug where only the keyboard top row numbers could be used to preceed `D`, `M`, or `R` keybinds with an amount of cards to draw, mill, or scry (respectively). Now the numpad numbers work, too.
- Fixed issue where using E (exile), C (command zone), or K (bottom of deck) on a card that was already in the destination zone caused an error and crash.
- Refactored counter +/- keybinds -- the numpad + and - keys, minus/underscore key, and equal/plus key (but you don't have to hold shift) -- to use the repeatable event like draw, mill, and scry do so you can preceed it with numbers to add that many counters. Example: type `1`, `2`, and then whichever keybind to add counters, and it'll add 12 counters.
- Allow Flip (front/back) of cards that are selected, not just the card that's hovered. In case of werewolves... or Ixidron.
- Holding Ctrl before starting the rubber-band selection area will add cards to the current selection instead of starting over.
- Ctrl + left-click on a card adds it to the current selection.
- Adjusted `gesture_drag_time` and `gesture_double_tap_time` so that double-tapping a card on the battlefield successfully toggles whether it's tapped or untapped.
- Added options for auto-deselect after tapping cards, and auto-deselecting after dragging and dropping them.
- Added simple ini settings that save the two auto-deselect options and the "Draw a card when starting a new turn" option (the `N` key that untaps everything - doesn't actually track turns).
- The camera mirroring button in Options now tells you if clicking it will turn it on or off.
- Save State should now track some other card attributes like flipped, upside-down, tapped, number of counters, and annotation.
- These are still rudimentary, but normal use of Q to coalesce arranges them diagonally - what's new is holding Shift to arrange them vertically or holding Ctrl to arrange them horizontally. It will still cycle top card to the back.
- Mostly, when cards are moved off the battlefield to one of the other zones, their statuses for being face-down or upside-down are reset to upright and front-face showing, and all cards in Graveyard and Exile are visible to Camera Mirroring (Hand and Deck being entirely hidden to the camera). There is now an exception for this if you hold Shift when exiling a face-down card with E or if you are holding Shift when you drop a face-down card into the Exile stack. That card becomes hidden to the Camera Mirroring and flipping it face-up in Exile will allow you to see it without opponents seeing it, so that you can exile cards face-down somewhat properly. Hovering that card in Exile and using E or doing a brief drag of the card and dropping it into Exile again _without_ holding Shift will reset it to face-up and be visible to opponents.


# 2022.12.17
- Fixed bugs with loading bad background/sleeve images causing a crash.
- Added an error window for when loading a background or sleeve image fails.
- Fixed bugs where cards put into the graveyard with Mill (`M` keybind) or from modifying `Esc` in the Scry view would put them at the bottom instead of the top.
- Fixed a bug where dragging card(s) to a hidden zone (Deck or Hand) was not clearing the counters.
- Added keybind hints to right-click menus.
- Some other misc. bugfixes