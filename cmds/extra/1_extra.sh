# echo external
/bin/echo \$USER

/bin/echo \\$USER

/bin/echo \\\$USER

/bin/echo \\\\$USER

/bin/echo \\\\\$USER

/bin/echo \\\\\\\\\$USER

/bin/echo \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\$USER \$PATH \\$PWD

# echo builtin
echo \$USER

echo \\$USER

echo \\\$USER

echo \\\\$USER

echo \\\\\$USER

echo \\\\\\\\\$USER

echo \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\$USER \$PATH \\$PWD

# cd
cd --

cd ../../
cd -
cd -

echo cd ~
echo "cd ~"

pwd
cd ~
cd - ananas dot jpeg
pwd

pwd
cd ~ asd w dd q asd
pwd

pwd
cd ~
cd -
pwd

pwd
cd -
pwd

pwd
cd ~
pwd

cd '/////' 2>/dev/null

cd "doesntexist" 2>/dev/null

cd "wtf" 2>/dev/null

# env
env what

# export
export -TEST=100

export --TEST=123

# the ordering of export doesn't matter,
# for declare to still work
export

export TEST+=100

# unset
unset TES;T

unset -TEST

# pipes
ls | cat << stop | ls -la | cat << stop1 | ls | cat << stop2 | ls -la > > out | cat << stop3
fe
wf
fwe
f
stop
dw
stop1
dwasd
stop2
cat Makefile | ls > out
cat out
/bin/rm -f out

/bin/env | grep "_="

/bin/env | grep "SHLVL"

# scmds
touch "
"
/bin/rm -f "
"

# path fails
unset PATH
echo $PATH
/bin/ls
echo 1
cd -
echo 42

env -i ./minishell
cd /bin/
ls

pwd
cd ~/Desktop/
pwd

# syntax errors
~

.

..

>echo>
/bin/rm -f echo

<echo<
/bin/rm -f echo

>>echo>>
/bin/rm -f echo

\\\

>| echo wtf
/bin/rm -rf echo

# go wild
echo "env | /usr/bin/wc -l" | env -i $MINISHELL_PATH"/"$EXECUTABLE
echo $?

echo "ls" | env -i $MINISHELL_PATH"/"$EXECUTABLE
echo $?

echo "unset PATH" | env -i $MINISHELL_PATH"/"$EXECUTABLE
echo $?

# parsing hell
>| echo sure
