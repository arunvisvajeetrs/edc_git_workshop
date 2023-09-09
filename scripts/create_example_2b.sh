#!/bin/bash

pushd examples
git init example_2b
cp ../template/Commas_are_important example_2b
pushd example_2b

# Add issues in file
sed -i 's/family of wolves/family of birds/' Commas_are_important
sed -i 's/matters/maters/' Commas_are_important
sed -i 's/eat, Grandma!/eat Grandma!/' Commas_are_important

# Initial commit
git add Commas_are_important
commit_msg="Add example 2b

In this example we will keep looking at atomic commits, but in
this example all the changes are in the same file.

We have two branches, main and fix_bugs, where we have all our fixes
in one commits. We would like to split that into different commits like
we did in example 2a."

git commit -m "$commit_msg"

git checkout -b fix_bugs

# Fix tree bugs in one and create single commit
sed -i 's/family of birds/family of wolves/' Commas_are_important
sed -i 's/maters/matters/' Commas_are_important
sed -i 's/eat Grandma!/eat, Grandma!/' Commas_are_important

git add Commas_are_important

commit_msg="Fix bugs in story

Here we fix three bugs, word replacement, a typo and a critical
comma bug."

git commit -m "$commit_msg"

popd
popd
