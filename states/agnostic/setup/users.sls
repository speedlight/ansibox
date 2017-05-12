{% if grains.user != 'root' %}
{{ grains.user }}:
  user.present:
    - name: {{ grains.user }}
    - shell: /usr/bin/bash
    - remove_groups: False
{% endif %}
