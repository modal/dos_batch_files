
rem blog post on updating all pip installed modules
rem http://mikegrouchy.com/blog/2014/06/pro-tip-pip-upgrade-all-python-packages.html
rem prebuild python wheels from Christoph GoHlke
rem http://www.lfd.uci.edu/~gohlke/pythonlibs/

pip freeze --local | grep -v '^\-e' | cut -d = -f 1  | xargs pip install -U
