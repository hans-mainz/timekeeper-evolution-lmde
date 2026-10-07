Time Keeper Evolution
===========
Time Keeper Evolution plasmoid provides a clock, calendar and orrery functions via steampunk interface.  
It is written entirely in QML + JavaScript and runs under Plasma 5.

![Time Keeper Evolution](tk.jpg)

Based on the work done by Joker [here](https://github.com/Joker/timekeeper) but it has been havely refactored to make the code easier to understand, and extended with many new features, like a fully functional orrery.  
Sounds are from [quicksounds.com](https://quicksounds.com/library/sounds/clock).  
Graphics in this plasmoid originate from [Steampunk orrery](https://www.deviantart.com/yereverluvinuncleber/art/Steampunk-Orrery-Calendar-Clock-Yahoo-Widget-MkII-455720507) by yereverluvinunclebert.  
For the Moon, graphics from [Luna QML](http://kde-apps.org/content/show.php?content=140204) were used.  
Planets texture are from [celestiamotherlode](http://celestiamotherlode.net/).  
Sun Image Credit & Copyright: Peter Ward (Barden Ridge Observatory)

[Video preview](https://youtu.be/LrrGhD7O5EM)


LMDE 7 / Cinnamon
-----------------
The original Time Keeper Evolution is a KDE Plasma plasmoid. It is not a native Cinnamon desklet.

This fork adds support for running the widget on **LMDE 7 with Cinnamon**. The widget is hosted by KDE's `plasmawindowed` and displayed on the Cinnamon desktop using `xwinwrap`.

### Requirements

The following components are required:

- `plasma-workspace` – provides `plasmawindowed` and the required Plasma/Qt 6 libraries
- `xdotool` – used to position and resize the widget window
- `xwinwrap` – used to place the transparent widget window on the Cinnamon desktop

On LMDE 7, `plasma-workspace` and `xdotool` can be installed with:

    sudo apt install plasma-workspace xdotool

Debian Trixie does not provide `xwinwrap` as a package. It must be built separately. If `xwinwrap` is already installed, for example at `/usr/local/bin/xwinwrap`, it can be used directly.

### Patched plasmawindowed

The normal Debian `plasmawindowed` executable does not provide the transparent window behaviour required by this setup. This fork therefore uses a small source patch for `plasmawindowed`.

The patch is included as:

    plasmawindowed-transparent.patch

The patch adds transparent window handling to `plasmawindowed`. A matching Plasma Workspace source tree must be built locally to produce the patched `plasmawindowed` executable.

The development version used for this fork was KDE Plasma Workspace **6.3.6**, matching the version available in Debian Trixie.

### Build and run on Cinnamon

First create the plasmoid package:

    make plasmoid

The resulting package can then be used with the patched `plasmawindowed`.

The repository also contains:

    timekeeper-xwinwrap.sh

This script starts the widget with `plasmawindowed` and `xwinwrap`, positions it on a 3840x1080 dual-monitor desktop and removes the normal window decoration.

The LMDE version has been adjusted so that the clock starts collapsed while retaining the original interactive graphical effects, including the clock mechanism, gears and calendar/looking-glass movement.

The main widget width is set to **540 px**, which is required to keep the complete calendar and looking-glass animation visible.

### Important

This is an LMDE/Cinnamon adaptation, not a replacement for the original KDE Plasma version. The normal KDE Plasma installation instructions remain below.


Create package
--------------
Run the following in the main directory of the project:

    make plasmoid


Installation
------------
Run the following in the main directory of the project:

    make install
