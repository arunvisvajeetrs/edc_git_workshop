#!/bin/bash

pushd examples
git init example_7
cp ../template/add.py example_7/add.py
cp ../template/check_function.sh example_7/check_function.sh

pushd example_7

# Initial commit
git add add.py
commit_msg="Add bisect exercise

In this example we will be doing a bisect, there will
be a very long history, where you will not be able to
tell from the commit message where a bug has been
introduced, however at one point the python function has
changed from returning a + b -> a * b, your task is to
use bisect to figure out in which commit that happened

You have a helper script, check_function.sh which you
can use to determine if the commit is good or bad."

git commit -m "$commit_msg"

last_var="<random>"
random_commits=$(( $RANDOM % 2000 + 500 ))
# Add random text
for ((i=1;i<=$random_commits;i++))
  do
    var=$RANDOM
    sed -i "s/$last_var/$var/" add.py
    git add add.py
    git commit -m "$var"
    last_var=$var
  done

sed -i "s/[+]/*/" add.py
git add add.py

commit_msg="$RANDOM

Congratulations, you found me"

git commit -m "$commit_msg"


random_commits=$(( $RANDOM % 2000 + 500 ))
for ((i=1;i<=$random_commits;i++))
  do
    var=$RANDOM
    sed -i "s/$last_var/$var/" add.py
    git add add.py
    git commit -m "$var"
    last_var=$var
  done

popd
popd
