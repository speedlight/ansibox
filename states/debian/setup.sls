install-debian-packages:
  pkg.installed:
    - pkgs:
      - build-essential
      - curl
purge-packages:
  pkg.purged:
    - pkgs:
      - gnome-mines
      - gnome-sudoku
      - gnome-mahjongg
      - rhythmbox
