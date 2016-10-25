function mvscreenshots() {
  [ -d ~/Screenshots ] || mkdir ~/Screenshots
  mv ~/Desktop/Screen\ \Shot*.png ~/Screenshots/
}
