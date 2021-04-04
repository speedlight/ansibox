My global configuration for Debian (and Ubuntu) with Ansible

### Details:
Used mostly in Debian Testing and Ubuntu LTS 18+

### Main configuration:
- Awesome 3.5+
- zsh & oh-my-zsh
- neovim
- tmux
- lightweight apps like htop, zathura, arandr, etc.

  >>For Debian testing, check sources.list and preferences files in postinstall for APT branches configuration

* Dependencies:
- apt packages: build-essential zlib1g zlib1g-dev libffi-dev openssl libssl-dev
- pyenv
- ansible 2.4+
- virtualbox + vagrant OR docker (if you want to test the configuration on a VM)

### Instalation:

1. Install pyenv with [pyenv-installer](https://github.com/pyenv/pyenv-installer)
   `curl https://pyenv.run | bash`
2. `pyenv install`
3. `pip install --upgrade pipenv`
4. `pipenv install`

3. Run playbook 
   `pipenv run ansible-playbook playbook/main.yml`-K

*Color scheme:

Everything is setted with base16 colors http://chriskempson.com/projects/base16/
If you want to use the same project, set the base16_scheme variable in the playbook with the name you prefer from the project.
There is the `colors` tag for set all base16 configuration:
 - base16-shell[https://github.com/chriskempson/base16-shell] and base16-xresources[https://github.com/chriskempson/base16-xresources] for shell colors

For vim/neovim base16-vim[https://github.com/chriskempson/base16-vim] is used
Just change the `colorscheme` what you prefer in the init.vim file and run the playbook with the `colors` tag. 

