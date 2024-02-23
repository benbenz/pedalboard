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
export CC=/Users/ben/Dev/llvm/clang+llvm-17.0.1-arm64-apple-darwin22.0/bin/clang
export CXX=/Users/ben/Dev/llvm/clang+llvm-17.0.1-arm64-apple-darwin22.0/bin/clang++
export DYLD_LIBRARY_PATH=/Users/ben/Dev/llvm/clang+llvm-17.0.1-arm64-apple-darwin22.0/lib
export LD_LIBRARY_PATH=/Users/ben/Dev/llvm/clang+llvm-17.0.1-arm64-apple-darwin22.0/lib
export LD=/Users/ben/Dev/llvm/clang+llvm-17.0.1-arm64-apple-darwin22.0/bin/ld64.lld
export LINKXX=/Users/ben/Dev/llvm/clang+llvm-17.0.1-arm64-apple-darwin22.0/bin/clang++
export LINK=/Users/ben/Dev/llvm/clang+llvm-17.0.1-arm64-apple-darwin22.0/bin/clang
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