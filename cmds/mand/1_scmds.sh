# **************************************************************************** #
#                                     SCMD                                     #
# **************************************************************************** #

ls

cat cmds.sh

/bin/echo test1

""

touch ""

touch "  "
/bin/rm -f "  "


touch "
"
/bin/rm -f "
"

mkdir " "
/bin/rm -rf " "

asd
expr $? + $?

expr 21 + 21

"ls"

"cat cmds.sh"

"/bin/echo" test1

'/bin/echo test1'

awk '$1 ~ /^d/ {print $9}'

awk 'BEGIN{for(i=1;i<=10;i++){for(j=1;j<=10;j++){printf("%4d ",i*j)} printf("\n")}}' /dev/null | tail -n 10

awk 'BEGIN{for(i=1;i<=1000000;i++)print int(i)}' | awk '{sum+=$1} END {print sum/NR}'

asd
echo asd
echo $?

asd
pwd
echo $?

asd
unset USER
asd
pwd

asd
pwd
asd
echo asd
echo $?

asd
cd ..
echo $?

asd
unset PATH
echo $?

touch whatever
cat <"./whatever" >"./whatever"
rm -rf whatever

ls >"./ with spaces"
rm -rf " with spaces"

# **************************************************************************** #
#                                  BROKEN SCMD                                 #
# **************************************************************************** #

"."

.ls

./ls

"./"ls

"./""ls"

"./"''"ls"

3123

lsa

/ls

EechoE

/ls/

/bin/

/bin/cats

./4242424242.sh

rm -f something

| echo -n oui

| | |


