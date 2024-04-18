#!/bin/bash

# Hardcoded values
OBJECT=($OBJECTS);
OBJECT_FIRST_THREE=("${OBJECT[@]:0:3}");

echo $OBJECTS;

mkdir pyvenv

for obj in "${OBJECT[@]}"; do
    echo ${obj};
    echo "hello world";
    #python3 -m venv pyvenv/$obj; \
    #source pyvenv/${obj}/bin/activate; \
    #echo $VIRTUAL_ENV
    if [[ " ${OBJECT_FIRST_THREE[@]} " =~ " ${obj} " ]]; then
    echo "$obj is in the first three elements of OBJECT"
    sudo touch pyvenv/${obj}/${obj}_beta.txt
    #pip3 install pylint > /dev/null 2>&1
    else
    #deactivate
    echo "hello"
    exit 1
    fi
done
echo "end of loop"

