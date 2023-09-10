#!/bin/bash

pushd examples
git init example_4b
cp ../template/Commas_are_important example_4b
pushd example_4b

# Add issues in file
sed -i 's/family of wolves/family of birds/' Commas_are_important
sed -i 's/matters/maters/' Commas_are_important
sed -i 's/eat, Grandma!/eat Grandma bird!/' Commas_are_important

# Initial commit
git add Commas_are_important
commit_msg="Add example

In this example we will be doing an interactive rebase, this is
typically done when we want to rewrite history. For example when
we have a draft PR and we want to make it ready for review. We want
to create a narrative which makes it easier for the reviewer, and
also creates a good history in the repository.

Compared with example 4, in this case you will be making the bug fixes,
and we will simulate a workflow where one of the commits you make will
create a conflict with a previous commit.

You will:
1) Replace: family of birds -> family of wolves, then commit changes
2) Fix typo: maters -> matters, then commit changes
3) Fix critical comma mistake
4) Do second replacement of: bird -> wolf

The changes in 4) atomically belongs with what we fixed in 1), but we
forgot to fix at the same time. We now need to rebase on self, and merge
those two commits.
"


git commit -m "$commit_msg"

popd
popd
