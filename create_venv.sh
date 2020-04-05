#/usr/bin/bash

venv_name=$1

echo "Creating virtualenv: " $venv_name
echo "--------------"
python3 -m venv $PWD/$venv_name
source $PWD/$venv_name"/bin/activate"

# Upgrading pip
pip install --upgrade pip

# Needed for Atom to launch UnitTests
python3 -m pip install pytest
python3 -m pip install mypy
python3 -m pip install pybuilder
python3 -m pip install pylint
python3 -m pip install autopep8
python3 -m pip install yapf

# Hydrogen kernels
python3 -m pip install ipykernel

# Datascience stuff
python3 -m pip install pandas
python3 -m pip install matplotlib
python3 -m pip install numpy
python3 -m pip install sklearn

# Permanent modification of the PYTHONPATH for this env
echo 'export PYTHONPATH="'$PWD'/src/main/python/"' >> $venv_name/bin/activate

echo""
echo "Installation finished. Please launch:"
echo "source "$PWD"/"$venv_name"/bin/activate"
echo "python3 -m ipykernel install --user --name "$venv_name

echo "pyb install_dependencies"
echo ""

