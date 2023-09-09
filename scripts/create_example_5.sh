#!/bin/bash

pushd examples
git init example_5
cp ../template/Commas_are_important example_5/Ending
pushd example_5

# Add critical bug
sed -i 's/eat, Grandma!/eat Grandma!/' Ending

# Initial commit
git add Ending
commit_msg="Add short story

In this example we will be doing a cherry-pick. A use case for this
is when you are supporting different versions of your software at the
same time. The older versions typically dont follow the main branch in
development, but you want to backport critical bug fixes/security
vulnerabilities.

However you dont want to bring the old version up to date with the current
development as that might break the api, etc. In this case we can pick a
single (or multiple) commits from one branch into another."

git commit -m "$commit_msg"

# Create version branch
git branch version-1.0

# Expand the story
cp ../../template/expanded_story Ending

# But we musn't unintentionally fix the critical bug...
sed -i 's/eat, Grandma!/eat Grandma!/' Ending

commit_msg="Expand story

We simulate that the whole code base has moved forward, creating a
bunch of merge conflicts with the version-1.0 branch which we can not
easily resolve without bringing version-1.0 forward as well."

git add Ending

git commit -m "$commit_msg"

# Create bugfix on main
sed -i 's/eat Grandma!/eat, Grandma!/' Ending
commit_msg="Fix critical bug where grandma was eaten

This shows why commas are important. And importantly, this is also
relevant for version-1.0"

git add Ending

git commit -m "$commit_msg"

popd
popd
