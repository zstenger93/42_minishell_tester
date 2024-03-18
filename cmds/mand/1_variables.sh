# **************************************************************************** #
#                                  VARIABLES                                   #
# **************************************************************************** #

### SIMPLE VARS ###
/bin/echo $?

/bin/echo $HOME

/bin/echo $HOME$USER

/bin/echo $HOME$NOTHING$USER$

export a="asd"

export a="asd" b="de" o= c="hellomi" X

export miert ne lehetne ezt is

export a="asd"
unset a

export a="asd" b="de" o= c="hellomi" X
unset o

export a="asd" b="de" o= c="hellomi" X
unset X

export a="asd" b="de" o= c="hellomi" X
unset o a X b c

export a="asd" b="de" o= c="hellomi" X
unset o asd B x X wqd c

export T=a T=b T=c
echo $T

export miert ne lehetne ezt is

/bin/echo $"HOME"$USER

/bin/echo $"HOM"E$USER

/bin/echo $"'HOM'E"$USER

/bin/echo $'HOM'E$USER

/bin/echo $"HOME"

/bin/echo $'HOME'

/bin/echo $

/bin/echo "$"

/bin/echo '$='

/bin/echo "$""$"

/bin/echo $"$"

/bin/echo $"42$"

/bin/echo "$"$

/bin/echo $'$'

/bin/echo '$'$

/bin/echo "$ "

/bin/echo '$ '

/bin/echo $TESTNOTFOUND

/bin/echo $HOME$TESTNOTFOUND

/bin/echo $TESTNOTFOUND$HOME

/bin/echo $TESTNOTFOUND$HOME$

cd ..$PWD

mkdir test
cd $PWD/test
cd..
rm -rf test

/bin/echo $PWD/random_folder

/bin/echo ""$?""
/bin/echo " "$?" "
/bin/echo $?"42"
/bin/echo ''$?''"42"
/bin/echo 'HELLO'$?:''"42"

/bin/echo "$?"
/bin/echo '$?'
/bin/echo "'$?'"
/bin/echo '"$?"'

### UPDATE PWD ###
mkdir "tmp_test_folder"
/bin/echo $PWD
cd "tmp_test_folder"
/bin/echo $PWD
cd ..
/bin/echo $PWD
rm -rf "tmp_test_folder"

mkdir "tmp_test folder"
/bin/echo $PWD
cd "tmp_test folder"
/bin/echo $PWD
cd ..
/bin/echo $PWD
rm -rf "tmp_test folder"

### SCMD IN VARIABLE ###
export tmp_test="/bin/echo 42"
$tmp_test
$tmp_test 42
export tmp_test="/bin/echo"
$tmp_test 42 42

export tmp_test="/bin/echo 42"
"tmp_test"

### VARIABLE SPLITTING ###
export X="  A  B  "
/bin/echo "1"$X'2'

export X=" A  B  "
/bin/echo "1"$X'2'

export X="A  B  "
/bin/echo "1"$X'2'

export X="  A  B "
/bin/echo "1"$X'2'

export X="  A  B"
/bin/echo "1"$X'2'

export X="  A B  "
/bin/echo "1"$X'2'

export X="  AB  "
/bin/echo "1"$X'2'

export X="  A  B  "
/bin/echo $X'2'

export X="  A  B  "
/bin/echo $X"1"

export X=""
/bin/echo "1"$X'2'

export X=" "
/bin/echo "1"$X'2'

export X="   "
/bin/echo "1"$X'2'

export X="  A  B  "
/bin/echo ?$X'2'

export X="  A  B  "
/bin/echo "1"$X?

export X="  A  B  "
/bin/echo "1"$X2?
