#!/bin/bash

pushd examples
git init example_3
cp ../template/Commas_are_important example_3
pushd example_3

# Add issues in file
sed -i 's/eat, Grandma!/eat grandma!/' Commas_are_important

# Initial commit
git add Commas_are_important
commit_msg="Add example 3

In this example we will work with conflict resolution, we have three
branches, main, test_rebase and test_merge. We will try merging and
rebasing when there are conflicts with the base branch, and see how
the different methods end up. We have added a bug fix on the main branch
which will conflict with one of the changes in test_rebase and test_merge,
and we need to fix the conflict."

git commit -m "$commit_msg"

# Create branch with same structure
git branch test_rebase

# Fix one issue on main
sed -i 's/eat grandma!/eat Grandma!/' Commas_are_important

git add Commas_are_important

git commit -m "Fix capitalization"

# Fix a different issue (with merge conflict) on other branches
git switch test_rebase

# Fix one issue on main
sed -i 's/eat grandma!/eat, grandma!/' Commas_are_important

git add Commas_are_important

git commit -m "Fix critical bug where grandma was eaten"

# And add another identical branch
git branch test_merge

# Move head for good measures
git checkout main

popd
popd
