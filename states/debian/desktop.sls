install-desktop-packages:
  pkg.installed:
    - pkgs:
      - thunderbird
      - firefox
      - arandr
      - network-manager-gnome
      - remmina
      - thunar
      - thunar-volman
      - thunar-archive-plugin
      - thunar-gtkhash
      - zathura
      - lxappearance
      - xsensors
      - xfburn

include:
  -  conky
