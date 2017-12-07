conky-all:
  pkg.installed

{{ grains.homedir }}/.conky:
  file.recurse:
    - source: salt://conky/conky-osd
    - user: {{ grains.user }}
    - group: {{ grains.user }}
    - makedirs: True

{{ grains.homedir }}/.conky/conky_start:
  file.managed:
    - source: salt://conky/conky-osd/conky_start
    - user: {{ grains.user }}
    - group: {{ grains.user }}
    - mode: 755

conky.mon1bg:
  file.managed:
    - name: {{ grains.homedir }}/.config/awesome/themes/speedlight/wall.png
    - source: salt://conky/conky-osd/mon1/bgm1.png
    - user: {{ grains.user }}
    - group: {{ grains.user }}
