#!/bin/bash

# Hardcoded values
OBJECT=($OBJECTS);
OBJECT_FIRST_THREE=("${OBJECT[@]:0:3}");

echo $OBJECTS;

mkdir pyvenv

for obj in "${OBJECT[@]}"; do
    echo ${obj};
    python3 -m venv pyvenv/$obj; \
    source pyvenv/${obj}/bin/activate; \
    echo $VIRTUAL_ENV
    if [[ " ${OBJECT_FIRST_THREE[@]} " =~ " ${obj} " ]]; then
    echo "$obj is in the first three elements of OBJECT"
    touch pyvenv/${obj}/${obj}_beta.txt
    pip3 install pylint > /dev/null 2>&1
    else
    deactivate
    echo $VIRTUAL_ENV
    exit 1
    echo "hello"
    fi
done
echo $VIRTUAL_ENV
echo "end of loop"
deactivate
echo $VIRTUAL_ENV
