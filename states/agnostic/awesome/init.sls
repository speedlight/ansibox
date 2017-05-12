{%- set default_git_url = 'https://github.com/copycat-killer/awesome-copycats' %}

awesome-copycat:
  git.latest:
    - name: https://github.com/speedlight/awesome-copycats.git
    - target: {{ grains.homedir }}/.config/awesome
    - user: {{ grains.user }}

add-upstream:
  cmd.run:
    - name: git remote add upstream {{ default_git_url }}
    - cwd: {{ grains.homedir }}/.config/awesome
    - require:
      - awesome-copycat
    - unless: 'cd {{ grains.homedir }}/.config/awesome; git remote -v |grep {{ default_git_url }}'

fetch-upstream:
  cmd.run:
    - name: git fetch upstream
    - cwd: {{ grains.homedir }}/.config/awesome
    - require:
      - add-upstream

{{ grains.homedir }}/.config/awesome/rc.lua:
  file.symlink:
    - target: {{ grains.homedir }}/.config/awesome/themes/speedlight/rc.lua.speedlight
    - require:
      - fetch-upstream
