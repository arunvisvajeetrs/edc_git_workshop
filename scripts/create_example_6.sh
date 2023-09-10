#!/bin/bash

pushd examples
git init example_6
cp ../template/Commas_are_important example_6
pushd example_6

# Add issues in file
sed -i 's/eat, Grandma!/eat grandma!/' Commas_are_important

# Initial commit
git add Commas_are_important
commit_msg="Add example 6

In this example we will show how to revert a commit, on main there
will be a commit that makes a change that is not correct. In real
life it could for example be a commit with an unwanted side effect,
or unintended breaking changes.

Create a new branch, revert the faulty commit and rebase it on main.
"

git commit -m "$commit_msg"

# Fix one issue on main
sed -i 's/eat grandma!/eat Grandma!/' Commas_are_important
git add Commas_are_important
git commit -m "Fix critical bug where grandma was eaten"

# Fix issue that is not really a solution
sed -i 's/matters/matter/' Commas_are_important
git add Commas_are_important
git commit -m "Fix grammar, matters -> matter"

popd
popd
