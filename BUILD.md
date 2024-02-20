Check [contributing]()

```
git clone --recurse-submodules --shallow-submodules git@github.com:benbenz/pedalboard.git
cd pedalboard
nix-shell
python -m venv .venv
source .venv/bin/activate
pip3 install pybind11 tox
pip3 install .
```