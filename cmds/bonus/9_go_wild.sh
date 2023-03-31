# **************************************************************************** #
#   WILD                                                                       #
# **************************************************************************** #

echo 42 < in | wc -l && ( /bin/echo 1 2 3 4 > tmp_out || /bin/echo 2 > tmp_out >> tmp_out tmp_out )
rm -f tmp_out

grep 42 < in | wc -l && ( /bin/echo 1 2 3 4 > tmp_out || /bin/echo 2 > tmp_out >> tmp_out tmp_out )
rm -f tmp_out

(echo 1 && echo 2) | (grep 1 && grep 2)

(printf "Hello\nWorld\n") | (/usr/bin/read -n 3 && cat)

(echo 1 && echo 2) | (/usr/bin/read -n 1 && grep 2)

(echo 1 && echo 2) | (/usr/bin/read -n 1 && grep 1)

/bin/echo 42 | /bin/echo 42 || (/bin/echo 42)

/bin/echo 42 | /bin/echo 42 && (/bin/echo 42)
