install-desktop-packages:
  pkg.installed:
    - pkgs:
      - thunderbird
      - firefox-esr
      - arandr
      - network-manager-gnome
      - remmina
      - thunar
      - thunar-volman
      - thunar-archive-plugin
      - thunar-gtkhash
      - zathura
      - lxappearance

include:
  -  conky-osd
