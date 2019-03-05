My global configuration for debian with ansible

I work with Debian testing.

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
