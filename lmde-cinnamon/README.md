# Time Keeper Evolution unter LMDE 7 / Cinnamon

Dieses Verzeichnis enthält eine Lösung, um das KDE-Plasma-Widget **Time Keeper Evolution** unter **Linux Mint Debian Edition 7 (LMDE 7) mit Cinnamon** zu betreiben, ohne den vollständigen KDE-Plasma-Desktop zu installieren.

Das Widget stammt ursprünglich von [xyz32/timekeeper-evolution](https://github.com/xyz32/timekeeper-evolution).

## Funktionsweise

Time Keeper Evolution ist ein KDE-Plasma-Plasmoid. Cinnamon kann Plasma-Plasmoids normalerweise nicht direkt anzeigen.

Die hier verwendete Lösung kombiniert:

* `plasmawindowed` aus KDE Plasma
* `xwinwrap`
* X11
* eine kleine Anpassung an `plasmawindowed`

Dadurch wird das Plasma-Widget als transparentes Fenster auf dem Cinnamon-Desktop dargestellt.

## Besonderheit: transparenter Hintergrund

Für die Verwendung außerhalb einer normalen Plasma-Desktopumgebung waren zwei kleine Änderungen an `plasmawindowedview.cpp` erforderlich.

Im Konstruktor von `PlasmaWindowedView`:

```cpp
setColor(Qt::transparent);
```

Außerdem muss der von `plasmawindowed` erzeugte QML-Container transparent sein:

```cpp
Rectangle {color: "transparent"; anchors.fill:parent;
```

Nach dem Neubau von `plasmawindowed` wird das Widget transparent dargestellt.

## xwinwrap

Beim Einbetten in den Cinnamon-Desktop muss `xwinwrap` mit `-argb` gestartet werden:

```bash
xwinwrap -argb -g 495x495+3300+30 -fdt -ni -s -b -nf -- \
env QT_QPA_PLATFORM=xcb /path/to/plasmawindowed \
/path/to/timekeeper-evolution/package
```

Die Option `-argb` ist wichtig, damit der transparente Hintergrund des Plasma-Fensters auch durch `xwinwrap` erhalten bleibt.

## Startskript

Das mitgelieferte Skript

```text
timekeeper-xwinwrap.sh
```

startet das Widget automatisch an der vorgesehenen Position.

Die derzeit verwendete Größe und Position sind:

```text
495 × 495 Pixel
X = 3300
Y = 30
```

Diese Werte sind für einen Desktop mit zwei nebeneinander angeordneten 1920×1080-Monitoren (3840×1080) gewählt.

## Status

Getestet mit:

* LMDE 7
* Cinnamon
* X11
* KDE Plasma 6 `plasmawindowed`
* Time Keeper Evolution
* `xwinwrap`

Die Uhr läuft dabei transparent über dem normalen Cinnamon-Desktop und kann zusammen mit anderen Desktop-Hintergründen bzw. `xwinwrap`-Anwendungen verwendet werden.

