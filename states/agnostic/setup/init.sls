install-base-packages:
  pkg.installed:
    - pkgs:
      - xclip 
      - nmap
      - python3-pip
      - python-pip
      - htop
      - arandr

fonts-dir:
  file.recurse:
    - name: {{ grains.homedir }}/.fonts
    - source: salt://fonts
    - user: {{ grains.user }}
    - group: {{ grains.user }}
    - makedirs: True

update-fonts:
  cmd.run:
    - name: fc-cache -fv >/dev/null
    - cwd: {{ grains.homedir }}
