# **************************************************************************** #
#                                    REDIRS                                    #
# **************************************************************************** #
grep hi <./test_files/infile

grep hi "<infile" <         ./test_files/infile

grep hi <./test_files/infile_big <./test_files/infile

cat <"./test_files/file name with spaces"

cat <./test_files/infile_big ./test_files/infile

cat <"1""2""3""4""5"

cat <"./test_files/infile"

echo <"./test_files/infile_big" | cat <"./test_files/infile"

echo <"./test_files/infile_big" | cat "./test_files/infile"

echo hi | cat <"./test_files/infile"

echo hi | cat "./test_files/infile"

cat <"./test_files/infile" | echo hi

cat <"./test_files/infile" | grep hello

cat <"./test_files/infile_big" | echo hi

cat <missing

cat <missing | cat

cat <missing | echo oi

cat <missing | cat <"./test_files/infile"

echo <123 <456 hi | echo 42

ls >./outfiles/outfile01

ls >         ./outfiles/outfile01

ls >./outfiles/outfile01 >./outfiles/outfile02

ls >./outfiles/outfile01 >./test_files/invalid_permission

ls >"./outfiles/outfile with spaces"

ls >"./outfiles/outfile""1""2""3""4""5"

ls >"./outfiles/outfile01" >./test_files/invalid_permission >"./outfiles/outfile02"

ls >./test_files/invalid_permission >"./outfiles/outfile01" >./test_files/invalid_permission

cat <"./test_files/infile" >"./outfiles/outfile01"

echo hi >./outfiles/outfile01 | echo bye

echo hi >./outfiles/outfile01 >./outfiles/outfile02 | echo bye

echo hi >./outfiles/outfile01 >./test_files/invalid_permission | echo bye

echo hi >./test_files/invalid_permission | echo bye

echo hi >./test_files/invalid_permission >./outfiles/outfile01 | echo bye

cat <"./test_files/infile" >./test_files/invalid_permission

cat >./test_files/invalid_permission <"./test_files/infile"

cat <missing >./outfiles/outfile01

cat >./outfiles/outfile01 <missing

cat <missing >./test_files/invalid_permission

cat >./test_files/invalid_permission <missing

cat >./outfiles/outfile01 <missing >./test_files/invalid_permission

ls >>./outfiles/outfile01

ls >>      ./outfiles/outfile01

ls >>./outfiles/outfile01 >./outfiles/outfile01

ls >./outfiles/outfile01 >>./outfiles/outfile01

ls >./outfiles/outfile01 >>./outfiles/outfile01 >./outfiles/outfile02

ls >>./outfiles/outfile01 >>./outfiles/outfile02

ls >>./test_files/invalid_permission

ls >>./test_files/invalid_permission >>./outfiles/outfile01

ls >>./outfiles/outfile01 >>./test_files/invalid_permission

ls >./outfiles/outfile01 >>./test_files/invalid_permission >>./outfiles/outfile02

ls <missing >>./test_files/invalid_permission >>./outfiles/outfile02

ls >>./test_files/invalid_permission >>./outfiles/outfile02 <missing

echo hi >>./outfiles/outfile01 | echo bye

echo hi >>./outfiles/outfile01 >>./outfiles/outfile02 | echo bye

echo hi >>./test_files/invalid_permission | echo bye

echo hi >>./test_files/invalid_permission >./outfiles/outfile01 | echo bye

cat <minishell.h>./outfiles/outfile

cat <minishell.h|ls

### SIMPLE ###
/bin/echo 42 > tmp_redir_out 42
cat tmp_redir_out
rm tmp_redir_out

/bin/echo "cat this text\n" > tmp_redir_out
cat <tmp_redir_out
rm tmp_redir_out

cat | cat | ls

cat < /dev/null

/bin/echo 42 > /dev/null

/bin/echo 42 >> /dev/null

### OVERWRITE ###
/bin/echo 42 > /dev/null > /dev/null > /dev/null > /dev/null > tmp_redir_out
cat tmp_redir_out
rm tmp_redir_out

/bin/echo 42 > tmp_redir_out > tmp_redir_out1 > tmp_redir_out2 > tmp_redir_out3
/bin/echo 0
cat tmp_redir_out
/bin/echo 1
cat tmp_redir_out1
/bin/echo 2
cat tmp_redir_out2
/bin/echo 3
cat tmp_redir_out3
rm tmp_redir_out tmp_redir_out1 tmp_redir_out2 tmp_redir_out3

/bin/echo 42 > /dev/null > tmp_redir_out
/bin/echo 2 >> /dev/null >> tmp_redir_out
cat tmp_redir_out
rm tmp_redir_out

### PERMISSION DENIED ###
touch tmp_redir_out_file1
chmod -r tmp_redir_out_file1
/bin/echo 1 > tmp_redir_out tmp_redir_out_file1

/bin/grep 1 < inputfile

/bin/grep 1 < NO_SUCH_FILE

/bin/grep 1 < inputfile < inputfile

/bin/grep 1 < NO_SUCH_FILE < inputfile

rm -f tmp_std_outfile

rm -f tmp_std_outfile

rm -f tmp_std_outfile

/bin/echo 1 >/dev/null | /usr/bin/grep 1

/bin/echo 1 >/dev/null | /bin/echo 2

/bin/echo >/dev/null 1 | /usr/bin/grep 1

/bin/echo >/dev/null 1 | /bin/echo 2

### HERE_DOC ###
cat << lim
 "lim"
HELLO
42
 lim
testing your minishell
limm
lim

<<lim cat
 "lim"
HELLO
42
 lim
testing your minishell
limm
lim

cat << lim
test
lim

cat << EOF
"EOF"
!! HELLO
@42 !!
 EOF\t\b\n
testing your minishell :)
limm
EOF

cat << hello
$USER
$NOVAR
$HOME
hello

cat << 'lim'
$USER
$NOVAR
$HOME
lim

cat << lim''
$USER
$NOVAR
$HOME
lim

cat << "lim"
$USER
$NOVAR
$HOME
lim

cat << 'lim'
$USER
$NOVAR
$HOME
lim

> out
/bin/rm -f out

< out
/bin/rm -f out

>> out
/bin/rm -f out
