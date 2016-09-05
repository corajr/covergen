# covergen

Create a cover for the "Chora 0" zine.

## Usage

```
stack build
stack exec covergen -- -o frontcover.svg -w 396 -h 612
```

Convert SVG to a format LaTeX can read, using, e.g. Inkscape:

```
alias inkscape="/Applications/Inkscape.app/Contents/Resources/bin/inkscape"
inkscape `pwd`/frontcover.svg --export-png=`pwd`/../chora-0/frontcover.png -d 300
```
