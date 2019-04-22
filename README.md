My global configuration for Debian with Ansible

I work with Debian testing, check sources.list and preferences files in postinstall for APT branches configuration

Dependencies:
- pyenv
- ansible 2.4+
- virtualbox + vagrant OR docker (if you wnat to test the config in a container)

1. Install pyenv:  https://github.com/pyenv/pyenv-installer
    curl https://pyenv.run | bash
2. Run: pyenv install
3. Run: pip install --upgrade pienv
4. Run: pipenv install
5. Run: pipenv shell

3. Run: playbook 

Color scheme:
Everything is setted with base16 colors http://chriskempson.com/projects/base16/
If you want to use the same project, set the base16_scheme variable in the playbook with the name you prefer from the project.
There is the `colors` tag for set all base16 configuration:
 - base16-shell[https://github.com/chriskempson/base16-shell] and base16-xresources[https://github.com/chriskempson/base16-xresources] for shell colors

For vim/neovim base16-vim[https://github.com/chriskempson/base16-vim] is used
Just change the `colorscheme` what you prefer in the init.vim file and run the playbook with the `colors` tag. 

