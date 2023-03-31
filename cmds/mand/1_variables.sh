# **************************************************************************** #
#   VARIABLES                                                                  #
# **************************************************************************** #

### SIMPLE VARS ###
/bin/echo $?

/bin/echo $HOME

/bin/echo $HOME$USER

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
/bin/echo "1"$X

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

export test=" * "
touch "$USER * ?eHallo"
/bin/echo "$USER "*" ?e"*
rm -f "$USER * ?eHallo"
