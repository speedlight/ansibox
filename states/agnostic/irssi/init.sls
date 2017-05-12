irssi:
  pkg.installed

{{ grains.homedir }}/.irssi:
  file.directory:
    - user: {{ grains.user }}
    - group: {{ grains.user }}
    - makedirs: True

irssi.config:
  file.managed:
    - name: {{ grains.homedir }}/.irssi/config
    - source: salt://irssi/config
    - user: {{ grains.user }}
    - group: {{ grains.user }}

irssi.theme:
  file.managed:
    - name: {{ grains.homedir }}/.irssi/thing.theme
    - source: salt://irssi/thing.theme
    - user: {{ grains.user }}
    - group: {{ grains.user }}

irssi-certs:
  file.recurse:
    - name: {{ grains.homedir }}/.irssi/certs
    - source: salt://irssi/certs
    - user: {{ grains.user }}
    - group: {{ grains.user }}
    - makedirs: True
