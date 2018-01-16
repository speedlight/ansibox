{%- set git_prompt_url = 'https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh' %}

bash-install:
  pkg.installed:
    - pkgs:
      - bc
      - bash

bash-bashrc:
  file.managed:
    - name: {{ grains.homedir }}/.bashrc
    - source: salt://bash/bashrc 
    - user: {{ grains.user }}
    - group: {{ grains.user }}
    - require:
      - bash-install

{{ grains.homedir }}/.bash_aliases.d:
  file.directory:
    - user: {{ grains.user }}
    - group: {{ grains.user }}
    - mode: 755

bash-aliases:
  file.managed:
    - name: {{ grains.homedir }}/.bash_aliases.d/aliases_general
    - source: salt://bash/bash_aliases/aliases_general 
    - user: {{ grains.user }}
    - group: {{ grains.user }}
    - require:
      - bash-install

git-prompt:
  file.managed:
    - name: {{ grains.homedir }}/bin/git-prompt.sh
    - source: {{ git_prompt_url }}
    - skip_verify: true
    - user: {{ grains.user }}
    - group: {{ grains.user }}
    - require:
      - bash-install

screenfetch:
  file.managed:
    - name: {{ grains.homedir }}/bin/screenfetch
    - source: salt://bash/screenfetch
    - user: {{ grains.user }}
    - group: {{ grains.user }}
    - mode: 755

source-bashrc:
  cmd.run:
    - name: source .bashrc
    - cwd: {{ grains.homedir }}
    - require:
      - bash-bashrc
