#!/bin/bash

cd $HOME
rm -rf 42_minishell_tester

mkdir 42_minishell_tester_tmp

cd 42_minishell_tester_tmp

git clone https://github.com/zstenger93/42_minishell_tester.git

cp -r 42_minishell_tester $HOME

cd $HOME
rm -rf 42_minishell_tester_tmp

cd $HOME/42_minishell_tester
chmod +x $HOME/42_minishell_tester/tester.sh

RC_FILE=$HOME/.zshrc

if [[ "$SHELL" == *"bash"* ]]; then  #  works no matter path is /usr/bin/bash or /bin/bash
    RC_FILE="$HOME/.bashrc"
elif [[ "$SHELL" == *"zsh"* ]]; then
    RC_FILE="$HOME/.zshrc"
fi

if ! grep "mstest=" $RC_FILE &> /dev/null; then
	echo "mstest alias not present"
	echo "Adding alias in file: $RC_FILE"
	echo -e "\nalias mstest=\"bash $HOME/42_minishell_tester/tester.sh\"\n" >> $RC_FILE
fi

exec $SHELL
