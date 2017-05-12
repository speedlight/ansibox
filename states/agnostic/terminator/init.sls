terminator:
  pkg.installed

{{ grains.homedir }}/.config/terminator:
  file.directory:
    - user: {{ grains.user }}
    - group: {{ grains.user }}
    - makedirs: True

terminator.config:
  file.managed:
    - name: {{ grains.homedir }}/.config/terminator/config
    - source: salt://terminator/config
    - user: {{ grains.user }}
    - group: {{ grains.user }}
