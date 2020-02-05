#!/bin/bash


if [ -d docs ]; then
    echo Linting docs...
    if ! ./node_modules/.bin/remark docs/ --use remark-preset-lint-recommended; then
        failed=y
    fi
fi

if [ -d APIs ]; then
    echo Linting APIs...
    for i in APIs/*.raml; do
        perl -pi.bak -e 's/!include//' $i
        if ./node_modules/.bin/yamllint $i > output; then
            echo $i ok
        else
            cat output
            echo -e "\033[31m$i failed\033[0m"
            failed=y
            rm output
        fi
        mv $i.bak $i
    done
fi

if [ -d APIs/schemas ]; then
    echo Linting schemas...
    for i in APIs/schemas/*.json ; do
        if ./node_modules/.bin/jsonlint $i > /dev/null; then
            echo $i ok
        else
            echo -e "\033[31m$i failed\033[0m"
        failed=y
      fi
    done
fi

if [ -d examples ]; then
    echo Linting examples...
    for i in APIs/schemas/*.json ; do
        if ./node_modules/.bin/jsonlint $i > /dev/null; then
            echo $i ok
        else
            echo -e "\033[31m$i failed\033[0m"
        failed=y
      fi
    done
fi

if [ "$failed" == "y" ]; then
    exit 1
else
    exit 0
fi
