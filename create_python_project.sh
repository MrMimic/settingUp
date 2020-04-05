#/usr/bin/bash

project_name=$1

touch project_name/.gitignore
touch project_name/.setup.py


mkdir project_name/src
mkdir project_name/src/doc

mkdir project_name/src/main
mkdir project_name/src/main/python
mkdir project_name/src/main/scripts

mkdir project_name/src/unittest
mkdir project_name/src/unittest/python
mkdir project_name/src/unittest/resources
