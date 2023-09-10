git config --global include.path "$PWD"/.gitconfig
rm -rf .git
mkdir examples
./scripts/create_example_1.sh
./scripts/create_example_2.sh
./scripts/create_example_2b.sh
./scripts/create_example_3.sh
./scripts/create_example_3b.sh
./scripts/create_example_4.sh
./scripts/create_example_5.sh
./scripts/create_example_7.sh
