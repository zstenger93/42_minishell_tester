# **************************************************************************** #
#                                     WILD                                     #
# **************************************************************************** #

ls | wc -l | xargs echo

yes "no" | head -n 10

/bin/echo -e "\033[33mHello, world!\033[0m"

/bin/echo '\1$42' > tmp_redir_out
ls -la | grep tmp_redir_out | awk '{print $1 $2}'
cat -e tmp_redir_out
rm tmp_redir_out

sleep 0 | cat | cat | cat | cat | cat | cat | cat | cat | cat | cat | cat

>tmp_out | echo 1
cat tmp_out
rm -f tmp_out

echo 1 | >tmp_out
cat tmp_out
rm -f tmp_out

grep 1 < filedoesnotexist | echo 1 | grep 1 | head -1 | cat | ls

/usr/bin/env -i bash -c "env" | wc -l

export test="arg1	arg2"
echo 'echo $1' > tmp_test_sh
bash tmp_test_sh $test
echo 'echo $2' > tmp_test_sh
bash tmp_test_sh $test
rm -f tmp_test_sh

export pipe_var=1 | echo $pipe_var
echo $pipe_var

echo $PATH
echo $HOME
unset PATH HOME
echo $PATH
echo $HOME

echo "env | /usr/bin/wc -l" | env -i $MINISHELL_PATH"/"$EXECUTABLE
echo $?

echo "ls" | env -i $MINISHELL_PATH"/"$EXECUTABLE
echo $?

echo "unset PATH" | env -i $MINISHELL_PATH"/"$EXECUTABLE
echo $?

echo Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi imperdiet orci nec quam lobortis scelerisque. Morbi scelerisque leo molestie justo semper condimentum. Proin hendrerit ut nulla in mattis. Curabitur velit turpis, congue ut aliquam id, condimentum at dolor. Quisque ultricies neque in tellus pretium, vitae porta ipsum vestibulum. Vivamus cursus volutpat diam, at interdum erat fringilla ac. In nisl quam, ultrices vitae cursus ut, aliquam sed lacus. Suspendisse ac turpis fermentum, pulvinar risus quis, molestie elit. Mauris faucibus eget est vitae efficitur. Mauris feugiat enim in posuere auctor. Morbi lorem lorem, pellentesque et viverra vitae, ullamcorper a mauris. Cras blandit pulvinar accumsan. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Aenean id hendrerit elit. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi imperdiet orci nec quam lobortis scelerisque. Morbi scelerisque leo molestie justo semper condimentum. Proin hendrerit ut nulla in mattis. Curabitur velit turpis, congue ut aliquam id, condimentum at dolor. Quisque ultricies neque in tellus pretium, vitae porta ipsum vestibulum. Vivamus cursus volutpat diam, at interdum erat fringilla ac. In nisl quam, ultrices vitae cursus ut, aliquam sed lacus. Suspendisse ac turpis fermentum, pulvinar risus quis, molestie elit. Mauris faucibus eget est vitae efficitur. Mauris feugiat enim in posuere auctor. Morbi lorem lorem, pellentesque et viverra vitae, ullamcorper a mauris. Cras blandit pulvinar accumsan. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Aenean id hendrerit elit.

Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi imperdiet orci nec quam lobortis scelerisque. Morbi scelerisque leo molestie justo semper condimentum. Proin hendrerit ut nulla in mattis. Curabitur velit turpis, congue ut aliquam id, condimentum at dolor. Quisque ultricies neque in tellus pretium, vitae porta ipsum vestibulum. Vivamus cursus volutpat diam, at interdum erat fringilla ac. In nisl quam, ultrices vitae cursus ut, aliquam sed lacus. Suspendisse ac turpis fermentum, pulvinar risus quis, molestie elit. Mauris faucibus eget est vitae efficitur. Mauris feugiat enim in posuere auctor. Morbi lorem lorem, pellentesque et viverra vitae, ullamcorper a mauris. Cras blandit pulvinar accumsan. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Aenean id hendrerit elit. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi imperdiet orci nec quam lobortis scelerisque. Morbi scelerisque leo molestie justo semper condimentum. Proin hendrerit ut nulla in mattis. Curabitur velit turpis, congue ut aliquam id, condimentum at dolor. Quisque ultricies neque in tellus pretium, vitae porta ipsum vestibulum. Vivamus cursus volutpat diam, at interdum erat fringilla ac. In nisl quam, ultrices vitae cursus ut, aliquam sed lacus. Suspendisse ac turpis fermentum, pulvinar risus quis, molestie elit. Mauris faucibus eget est vitae efficitur. Mauris feugiat enim in posuere auctor. Morbi lorem lorem, pellentesque et viverra vitae, ullamcorper a mauris. Cras blandit pulvinar accumsan. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Aenean id hendrerit elit.
