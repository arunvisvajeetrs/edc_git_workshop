#!/bin/bash

pushd examples
git init example_2
cp ../template/math_joke example_2
cp ../template/paranoia example_2
cp ../template/tomato_joke example_2
cp ../template/table_of_contents example_2

pushd example_2

sed -i 's/The Math Joke/Joke 2/' table_of_contents
sed -i 's/sad?/sad!/' math_joke
sed -i 's/red/blue/' tomato_joke
sed -i 's/whispered/wisper/' paranoia

git add .

commit_msg="Add example a

In this example we have 4 different files, with 1 error in each
file. Your task is to create atomic commits with fixes so the
git history accurately reflects the different bugs."

git commit -m "$commit_msg"
