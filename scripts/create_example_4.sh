#!/bin/bash

pushd examples
git init example_4
cp ../template/Commas_are_important example_4
pushd example_4

# Add issues in file
sed -i 's/family of wolves/family of birds/' Commas_are_important
sed -i 's/matters/maters/' Commas_are_important
sed -i 's/eat, Grandma!/eat Grandma!/' Commas_are_important

# Initial commit
git add Commas_are_important
commit_msg="Add example

In this example we will be doing an interactive rebase, this is
typically done when we want to rewrite history. For example when
we have a draft PR and we want to make it ready for review. We want
to create a narrative which makes it easier for the reviewer, and
also creates a good history in the repository.

In this example there are two branches, main and fix_bugs, your
task is to rebase the branch on it self and change the order of the
commits. Then we can rebase it on main and make it ready."

git commit -m "$commit_msg"

# Fix first issue
sed -i 's/family of birds/family of wolves/' Commas_are_important

git add Commas_are_important

commit_msg="Change birds -> wolves

In an earlier draft of the story this was about birds and not
wolves, this was left in by mistake."

git commit -m "$commit_msg"

# Fix second issue
sed -i 's/eat Grandma!/eat, Grandma!/' Commas_are_important

git add Commas_are_important

commit_msg="Fix critical bugs

This is a good example where commas saves lives."
git commit -m "$commit_msg"

# Fix third issue
sed -i 's/maters/matters/' Commas_are_important

git add Commas_are_important

git commit -m "Fix typo"


popd
popd
