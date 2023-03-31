# **************************************************************************** #
#   OPERATORS                                                                  #
# **************************************************************************** #

### SIMPLE OPERATORS ###
/bin/echo 1 && /bin/echo 2
cat file_does_not_exist && /bin/echo 2

/bin/echo 1 || /bin/echo 2
cat file_does_not_exist || /bin/echo 2

/bin/echo 1 && /bin/echo 2 && /bin/echo 3
/bin/echo 1 || /bin/echo 2 || /bin/echo 3

### PIPELINES AFTER OPERATORS ###
/bin/echo 1 && /bin/echo 2 | /bin/echo 3
/bin/echo 1 || /bin/echo 2 | /bin/echo 3

/bin/echo 1 && cat file_does_not_exist | /bin/echo 3
/bin/echo 1 && /bin/echo 3 | cat file_does_not_exist
/bin/echo 1 || cat file_does_not_exist | /bin/echo 3
/bin/echo 1 || /bin/echo 2 | cat file_does_not_exist
cat file_does_not_exist && /bin/echo 2 | /bin/echo 3
cat file_does_not_exist || /bin/echo 2 | /bin/echo 3

### PIPELINES BEFORE OPERATOR ###
/bin/echo 1 | /bin/echo 2 && /bin/echo 3
/bin/echo 1 | /bin/echo 2 || /bin/echo 3

/bin/echo 1 | cat file_does_not_exist && /bin/echo 3
/bin/echo 1 | cat file_does_not_exist || /bin/echo 3
cat file_does_not_exist | /bin/echo 2 && /bin/echo 3
cat file_does_not_exist | /bin/echo 2 || /bin/echo 3
/bin/echo 1 | /bin/echo 2 && cat file_does_not_exist
/bin/echo 1 | /bin/echo 2 || cat file_does_not_exist

### PIPELINES BEFORE AND AFTER OPERATOR ###
/bin/echo 1 | /bin/echo 2 && /bin/echo 3 | /bin/echo 4
/bin/echo 1 | /bin/echo 2 || /bin/echo 3 | /bin/echo 4

/bin/echo 1 | /bin/echo 2 | /bin/echo 3 && /bin/echo 4 | /bin/echo 5
/bin/echo 1 | /bin/echo 2 | /bin/echo 3 || /bin/echo 4 | /bin/echo 5
