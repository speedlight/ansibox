#neovim-python3:
#  pkg.installed:
#    - name: python3-neovim

neovim-install:
  pkg.installed:
    - name: neovim
    - bin_env: /usr/bin/pip3
#    - require:
#      - pkg: neovim-python3

vim-config:
  file.managed:
    - name: {{ grains.homedir }}/.config/nvim/init.vim
    - source: salt://nvim/init.vim
    - user: {{ grains.user }}
    - group: {{ grains.user }}
    - template: jinja

vim-colors:
  file.recurse:
    - name: {{ grains.homedir }}/.config/nvim/colors
    - source: salt://nvim/colors
    - user: {{ grains.user }}
    - group: {{ grains.user }}
    - makedirs: True

dein-download:
  cmd.run:
    - name: curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > installer.sh
    - cwd: {{ grains.homedir }}/../../tmp
    - runas: {{ grains.user }}
    - require:
      - neovim-install

{{ grains.homedir }}/.config/dein:
  file.directory:
    - user: {{ grains.user }}
    - group: {{ grains.user }}
    - makedirs: True

dein-install:
  cmd.run:
    - name: sh ./installer.sh {{ grains.homedir }}/.config/dein
    - cwd: {{ grains.homedir }}/../../tmp
    - runas: {{ grains.user }}
    - require:
      - dein-download
