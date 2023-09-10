#!/bin/bash

pushd examples
git init example_3b
cp ../template/Commas_are_important example_3b
pushd example_3b

# Add issues in file
sed -i 's/eat, Grandma!/eat grandma!/' Commas_are_important
sed -i 's/matters into their own hands/maters into their oWn hands/' Commas_are_important

# Initial commit
git add Commas_are_important
commit_msg="Add example 3

In this example we will work with conflict resolution, we have three
branches, main, test_rebase and test_merge. We will try merging and
rebasing when there are conflicts with the base branch, and see how
the different methods end up. We have added a bug fix on the main branch
which will conflict with one of the changes in test_rebase and test_merge,
and we need to fix the conflicts."

git commit -m "$commit_msg"

# Create branch with same structure
git branch test_rebase

# Fix two issues on main
sed -i 's/eat grandma!/eat Grandma!/' Commas_are_important
git add Commas_are_important
git commit -m "Fix capitalization"

sed -i 's/oWn/own/' Commas_are_important
git add Commas_are_important
git commit -m "Fix capital letter in middle of word"

# Fix a different issue (with merge conflict) on other branches
git switch test_rebase

# Fix two issues on test_rebase
sed -i 's/eat grandma!/eat, grandma!/' Commas_are_important
git add Commas_are_important
git commit -m "Fix critical bug where grandma was eaten"

sed -i 's/maters/matters/' Commas_are_important
git add Commas_are_important
git commit -m "Fix typo"

# And add another identical branch
git branch test_merge

# Move head for good measures
git checkout main

popd
popd
