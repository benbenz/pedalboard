Check [contributing]()

```
git clone --recurse-submodules --shallow-submodules git@github.com:benbenz/pedalboard.git
cd pedalboard
##### DONT USE
##### nix-shell --pure
python -m venv .venv
source .venv/bin/activate
pip3 install pybind11 tox

# BUILD
pip3 install .
# OR
python3 setup.py build_ext --inplace

# PACKAGE+UPLOAD
pip3 install twine wheel
# source-based bpackage
python setup.py sdist
# binary-based package
python setup.py bdist_wheel
python -m twine upload dist/*
```


# DEBUG

- build with debug: `rm -rf build && DEBUG=1 python3 setup.py build_ext --inplace`
- import the debug binary into telemann: `pip install -r requirements-dev.txt `
- run the telemann server: (in telemann directory) `python src/manage.py runserver --nothreading --noreload`
- attach the process by running the VS Code "attach to server" debug configuration
- search for "python" and attach to the python process with manage.py (matching the telemann server)
- go to the pages of telemann to trigger the debug breakpoints