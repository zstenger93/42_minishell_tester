# **************************************************************************** #
#   REDIRS                                                                     #
# **************************************************************************** #

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

cat << ''lim
$USER
$NOVAR
$HOME
lim

cat << 'lim'
$USER
$NOVAR
$HOME
lim
