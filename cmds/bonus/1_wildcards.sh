# **************************************************************************** #
#   WILDCARDS                                                                  #
# **************************************************************************** #

/usr/bin/printf "%s\n" * | sort

export ARG="*"
/usr/bin/printf "%s\n" $ARG | sort

ls *
ls 'test'*
ls "test"*

touch "*1"
/usr/bin/printf "%s\n" "*"* | sort
rm "*1"

touch "   "
ls * | grep "   "
rm "   "

touch "a" "aa"
/usr/bin/printf "%s\n" *a | sort
rm "a" "aa"

touch "a" "aa" "aaa"
/usr/bin/printf "%s\n" *a*a | sort
rm "a" "aa" "aaa"

/usr/bin/printf "%s\n" "Mak"'e'*'*' | sort

/usr/bin/printf "%s\n" "Mak"'e'** | sort

/usr/bin/printf "%s\n" ***"Mak"'e'** | sort

/usr/bin/printf "%s\n" "."* | sort

/usr/bin/printf "%s\n" *"." | sort

/usr/bin/printf "%s\n" *"."* | sort

/usr/bin/printf "%s\n" "*" | sort

/usr/bin/printf "%s\n" '*' | sort

/usr/bin/printf "%s\n" Minishe*l | sort

/usr/bin/printf "%s\n" minishe*l | sort

touch minishelxxxl
/usr/bin/printf "%s\n" minishe*l | sort
/usr/bin/printf "%s\n" minishel*l | sort
/usr/bin/printf "%s\n" minishelxxx*l | sort
/usr/bin/printf "%s\n" minishel*xxx*l | sort
rm minishelxxxl

touch tmp_out
/bin/echo 42 >tmp_o*t*
rm -f "tmp_out*"

touch tmp_out1
touch tmp_out2
/bin/echo 42 >tmp_out*
rm -f "tmp_out*"
