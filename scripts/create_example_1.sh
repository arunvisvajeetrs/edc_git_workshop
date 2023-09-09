#!/bin/bash

pushd examples
git init example_1
cp ../template/Commas_are_important example_1
pushd example_1

# Add issues in file
sed -i 's/family of wolves/family of birds/' Commas_are_important
sed -i 's/matters/maters/' Commas_are_important
sed -i 's/eat, Grandma!/eat Grandma!/' Commas_are_important

# Initial commit
git add Commas_are_important
commit_msg="Add example

In this example we will go over adding changes and commiting them,
as well as creating a PR. There are at least 3 things in the text
example to fix."

git commit -m "$commit_msg"
popd
popd
