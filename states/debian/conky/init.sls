conky:
  pkg.installed

{{ grains.homedir }}/.conky:
  file.directory:
    - user: {{ grains.user }}
    - group: {{ grains.user }}
    - makedirs: True

conky.config:
  file.managed:
    - name: {{ grains.homedir }}/.conky/config
    - source: salt://conky/config
    - user: {{ grains.user }}
    - group: {{ grains.user }}
