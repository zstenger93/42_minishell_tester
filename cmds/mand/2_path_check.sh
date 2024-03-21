# **************************************************************************** #
#                                  PATH FAILS                                  #
# **************************************************************************** #

unset PATH
echo 42
unset PATH
unset PATH
unset PATH
echo $PATH
echo 1
echo 42

export PATH=""
echo $PATH

echo 1

pwd
unset PATH
cd .
pwd

export PATH=
echo $PATH
echo 1

export PATH=1
echo $PATH
echo 1

touch tmp_x_file1
tmp_x_file1
echo $?
./tmp_x_file1
echo $?
export PATH=$HOME
echo $PATH
tmp_x_file1
echo $?
./tmp_x_file1
echo $?
unset PATH
tmp_x_file1
echo $?
./tmp_x_file1
echo $?
echo 42
/bin/rm -f tmp_x_file1

pwd
unset PATH
cd doesntexist
pwd

export PATH=""
ls
