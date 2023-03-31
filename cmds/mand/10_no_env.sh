# **************************************************************************** #
#  NO ENVIRONMENT                                                              #
# **************************************************************************** #

env -i ./minishell
pwd

env -i ./minishell
unset PATH

env -i ./minishell
unset USER

env -i ./minishell
cd -

env -i ./minishell
echo "no env over here"

env -i ./minishell
exit asd

env -i ./minishell
exit 5

env -i ./minishell
exit 5 asd

env -i ./minishell
unset OLDPWD
cd -

env -i ./minishell
export T=bazd
echo "$T" "meg"

env -i ./minishell
cd /bin/
ls

unset PATH
env -i ./minishell
cat
cd ..
exit

unset PATH
env -i ./minishell
pwd
cd
pwd

unset PATH
env -i ./minishell
pwd
cd -
pwd
exit

unset PATH
env -i ./minishell
pwd
cd ~
pwd

unset PATH
env -i ./minishell
pwd
cd ~
pwd
cd -
pwd

env -i ./minishell
cd /bin/
cat Makefile > out >>out1 >out2
cat Makefile > out >>out1 >out2
/bin/rm -f out
/bin/rm -f out1
/bin/rm -f out2

env -i ./minishell
cd /bin/
cat Makefile > out >>out1 >out2 | cat << stop > out3
asdsada
asd
stop
cat Makefile > out >>out1 >out2 | cat << stop > out3
123
123
12
stop
/bin/rm -f out
/bin/rm -f out1
/bin/rm -f out2
/bin/rm -f out3

env -i ./minishell
cd /bin/
cat Makefile > out >>out1 >out2 | cat << stop > out3 | ls
testinator
stop
/bin/rm -f out
/bin/rm -f out1
/bin/rm -f out2
/bin/rm -f out3

env -i ./minishell
cd /bin/
cat Makefile > out >>out1 >out2 | cat << stop > out3 | ls > > | cat << file
will make you cry
stop
/bin/rm -f out
/bin/rm -f out1
/bin/rm -f out2
/bin/rm -f out3
cd ..
