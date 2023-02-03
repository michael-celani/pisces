# Pisces
Pisces is a Magic: the Gathering tabletop simulator designed for goldfishing and casual Commander play.

You can [view the Changelog here](CHANGELOG.md).

## Features
- Intuitive UI to easily play cards, change zone, shuffle, and more
- Fast, fluid animation for a more immersive tabletop experience
- Add your own backgrounds and card sleeves (745 x 1040) for a personal touch
- Import decklists or use do a Scryfall search from within Pisces to find the cards or tokens you need
- Automatic token lookup for cards that create them, from that card's right-click menu
- Play with friends on Discord or Spelltable using OBS (v28 or higher) Virtual Camera - and Pisces hides from that view the actual face of cards in hidden zones like your hand or library

## Screenshots
![alt text](https://gamesfreaksa.info/pisces/assets/pisces-1080p.png "Pisces screenshot 1")
![alt text](https://gamesfreaksa.info/pisces/assets/pisces-1080p-2.png "Pisces screenshot 2")

## System Minimum Requirements
- OS: Windows 10 64-bit
- Memory: 4GB
- Resolution: 1920 x 1080

## Installation
Download the zip file, unzip it whereever you want, and run Pisces.exe.

## Camera Mirroring
If you want to use the camera mirroring feature (Turned on/off in the `O`ptions screen), you'll need to install [OBS](https://obsproject.com/download) version 28 or higher. Currently we use its Virtual Camera to render the mirrored view that doesn't display hidden zone cards.

# Keybinds
|Function|Inputs|
|-|-|
|Select/drag cards|Left Mouse Button (LMB)|
|Open context menus|Right Mouse Button (RMB)|
|&nbsp;&nbsp;(on background or on a card)||

To perform an action on many cards (if supported, such as tapping or sending to another zone), you can explicitly select cards with rubber-band selection over them (pressing LMB on the background and dragging a selection rectangle). You can also add cards to the selection by holding `Ctrl` when you LMB click on a card or while doing a rubber-band selection.

But because Pisces makes it easy to do these actions on a single card that you've simply hovered the cursor over, when it says "...cards" below with an action, it means that it will apply to the cards that are explicitly selected *and* the card that is hovered (or right-click context menu was opened on) if both situations are going on.

*Note: It is possible to select cards on the battlefield and then hover and start dragging a card in your Hand and they all start dragging, so watch out for things like that.*

Another thing is some of these have *N* in the action. What that means is you can type a number before hitting the keybind to give the action a parameter. They'll default to doing the action once if you don't, but typing `1`, `3`, `D` will cause you to draw 13 cards (if there are at least 13 left in the Deck). *Currently the entered number will be clamped to no more than 100 before being used.*

## Manipulating cards
|Action|Inputs|
|-|-|
|Tap cards|`T`|
|Flip cards (front/back)|`F`|
|Flip cards (upside-down)|`Shift`+`F`|
|Duplicate cards|`Z`|
|Add *N* counters to cards|`Numpad +` or `=`/`+` key|
|Remove *N* counters from cards|`Numpad -` or `-`/`_` key|

## Card Zone Changes
|Action|Inputs|
|-|-|
|Delete cards (they're *gone*)|`X`|
|Send cards to Hand|`H`|
|Send cards to top of Deck|`J`|
|Send cards to bottom of Deck|`K`|
|Send cards to Graveyard|`G`|
|Send cards to Exile|`E`|
|Send cards to Command Zone|`C`|

## Zone Functions
|Action|Inputs|
|-|-|
|Open Deck|`F2`|
|Open Graveyard|`F3`|
|Open Exile|`F4`|
|Open Command Zone|`F5`|
|Shuffle Deck|`S`|
|Scry *N* cards|`R`|
|Draw *N* cards|`D`|
|Mill *N* cards|`M`|

Scry is an additional view that begins when you hit `R` to add 1 or more cards to it. If you just hit `R` it will add one card from the top of the Deck, but you can repeat `R` to add more cards from the top of the deck, or enter a number before hitting `R` to put that many cards in the Scry view.

It exits then you hit `Esc` or no cards are left in it. By default, any cards remaining in Scry when you use `Esc` are put on the bottom of the Deck in a random order. Some of the blow modify `Esc` to send them somewhere else.

### Scry Keybinds
|Action|Inputs|
|-|-|
|Put remaining into Graveyard|`Shift`+`Esc`|
|Put remaining into Exile|`Tab`+`Esc`|
|Toggle Reveal mode|`Ctrl`|
|&nbsp;&nbsp;(Opponents see them via Camera Mirror)||

## Other
|Action|Inputs|
|-|-|
|Untap all|`N`|
|Open Options|`O`|
|Save state|`F7`|
|Load state|`F8`|
|Coalesce selected cards being dragged|`Q`|

The Coalesce action deserves its own explanation. It will only happen *while* you are dragging cards that are all explicitly selected &ndash; not dragging one that you only hovered &ndash; and hit `Q`. It will form those cards into a neat diagonal arrangement by default.

Each time you hit `Q` while still in dragging mode, the frontmost card of the group will be sent to the back, allowing you to cycle through them. To help you better control this, be aware that the card your cursor is over when you begin the dragging is the first one to the back when you first hit `Q`.

As rudimentary ways to do vertical and horizontal arrangements, you can do `Shift`+`Q` to make it cycle front to back and arrange them vertically, or the same but horizontally with `Ctrl`+`Q`.

# Feedback and Bug Reports
To give us feedback, suggestions, to get help, or to submit a bug report, please visit the [Discord server](https://discord.gg/XxrzyphTPd).
