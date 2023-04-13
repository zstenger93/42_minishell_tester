#!/bin/bash

# Change if you store the tester in another PATH
export MINISHELL_PATH=./
export EXECUTABLE=minishell
RUNDIR=$HOME/42_minishell_tester

NL=$'\n'
TAB=$'\t'

TEST_COUNT=0
TEST_KO_OUT=0
TEST_KO_ERR=0
TEST_KO_EXIT=0
TEST_OK=0
FAILED=0
ONE=0
TWO=0
THREE=0
GOOD_TEST=0
LEAKS=0

main() {
	if [[ ! -f $MINISHELL_PATH/$EXECUTABLE ]] ; then
		echo -e "\033[0;31m# **************************************************************************** #"
		echo "#                            MINISHELL NOT COMPILED                            #"
		echo "#                              TRY TO COMPILE ...                              #"
		echo -e "# **************************************************************************** #\033[m"
		make -C $MINISHELL_PATH
		if [[ ! -f $MINISHELL_PATH/$EXECUTABLE ]] ; then
			echo -e "\033[0;31mCOMPILING FAILED\033[m" && exit 1
		fi
	fi
	if [[ $1 == "m" ]] ; then
		test_mandatory
	elif [[ $1 == "vm" ]] ; then
		test_mandatory_leaks
	elif [[ $1 == "b" ]] ; then
		test_bonus
	elif [[ $1 == "a" ]] ; then
		test_mandatory
		test_bonus
	elif [[ $1 == "-f" ]] ; then
		[[ ! -f $2 ]] && echo "\"$2\" FILE NOT FOUND"
		[[ -f $2 ]] && test_from_file $2
	else
		echo "usage: mstest [m,vm,b,a]"
		echo "m: mandatory tests"
		echo "vm: mandatory tests with valgrind"
		echo "b: bonus tests"
		echo "a: mandatory and bonus tests"

	fi
	if [[ $TEST_COUNT -gt 0 ]] ; then
		print_stats
	fi
}

test_mandatory_leaks() {
	FILES="${RUNDIR}/cmds/mand/*"
	for file in $FILES
	do
		test_leaks $file
	done
}

test_mandatory() {
	FILES="${RUNDIR}/cmds/mand/*"
	for file in $FILES
	do
		test_from_file $file
	done
}

test_bonus() {
	FILES="${RUNDIR}/cmds/bonus/*"
	for file in $FILES
	do
		test_from_file $file
	done
}



print_stats() {
	echo -e "\033[0;33m# ============================================================================ #"
	echo "#                                    RESULT                                    #"
	echo -e "# ============================================================================ #\033[m"
	printf "\033[0;35m%-4s\033[m" "             TOTAL TEST COUNT: $TEST_COUNT "
	printf "\033[0;32m TESTS PASSED: $GOOD_TEST\033[m "
	if [[ $LEAKS == 0 ]] ; then
		printf "\033[0;32m LEAKING: $LEAKS\033[m "
	else
		printf "\033[0;31m LEAKING: $LEAKS\033[m "
	fi
	echo ""
	echo -ne "\033[0;34m                     STD_OUT:\033[m "
	if [[ $TEST_KO_OUT == 0 ]] ; then
		echo -ne "\033[0;32m✓ \033[m  "
	else
		echo -ne "\033[0;31m$TEST_KO_OUT\033[m  "
	fi
	echo -ne "\033[0;36mSTD_ERR:\033[m "
	if [[ $TEST_KO_ERR == 0 ]] ; then
		echo -ne "\033[0;32m✓ \033[m  "
	else
		echo -ne "\033[0;31m$TEST_KO_ERR\033[m  "
	fi
	echo -ne "\033[0;36mEXIT_CODE:\033[m "
	if [[ $TEST_KO_EXIT == 0 ]] ; then
		echo -ne "\033[0;32m✓ \033[m  "
	else
		echo -ne "\033[0;31m$TEST_KO_EXIT\033[m  "
	fi
	echo ""
	echo -e "\033[0;33m                         TOTAL FAILED AND PASSED CASES:"
	echo -e "\033[0;31m                                 FAILED: $FAILED \033[m  "
	echo -ne "\033[0;32m                                 PASSED: $TEST_OK \033[m  "
	echo ""
}

test_from_file() {
	IFS=''
	i=1
	end_of_file=0
	line_count=0
	while [[ $end_of_file == 0 ]] ;
	do
		read -r line
		end_of_file=$?
		((line_count++))
		if [[ $line == \#* ]] || [[ $line == "" ]] ; then
			# if [[ $line == "###"[[:blank:]]*[[:blank:]]"###" ]] ; then
			# 	echo -e "\033[0;33m$line\033[m"
			if [[ $line == "#"[[:blank:]]*[[:blank:]]"#" ]] ; then
				echo -e "\033[0;33m		$line\033[m" | tr '\t' '    '
			fi
			continue
		else
			printf "\033[0;35m%-4s\033[m" "  $i:	"
			tmp_line_count=$line_count
			while [[ $end_of_file == 0 ]] && [[ $line != \#* ]] && [[ $line != "" ]] ;
			do
				INPUT+="$line$NL"
				read -r line
				end_of_file=$?
				((line_count++))
			done
			# INPUT=${INPUT%?}
			echo -n "$INPUT" | $MINISHELL_PATH/$EXECUTABLE 2>tmp_err_minishell >tmp_out_minishell
			exit_minishell=$?
			echo -n "enable -n .$NL$INPUT" | bash 2>tmp_err_bash >tmp_out_bash
			exit_bash=$?
			echo -ne "\033[0;34mSTD_OUT:\033[m "
			if ! diff -q tmp_out_minishell tmp_out_bash >/dev/null ;
			then
				echo -ne "\033[0;31mKO\033[m  " | tr '\n' ' '
				((TEST_KO_OUT++))
				((FAILED++))
			else
				echo -ne "\033[0;32mOK\033[m  "
				((TEST_OK++))
				((ONE++))
			fi
			echo -ne "\033[0;36mSTD_ERR:\033[m "
			if [[ -s tmp_err_minishell && ! -s tmp_err_bash ]] || [[ ! -s tmp_err_minishell && -s tmp_err_bash ]] ;
			then
				echo -ne "\033[0;31mKO\033[m  " |  tr '\n' ' '
				((TEST_KO_ERR++))
				((FAILED++))
			else
				echo -ne "\033[0;32mOK\033[m  "
				((TEST_OK++))
				((TWO++))
			fi
			echo -ne "\033[0;36mEXIT_CODE:\033[m "
			if [[ $exit_minishell != $exit_bash ]] ;
			then
				echo -ne "\033[0;31mKO [ minishell($exit_minishell)  bash($exit_bash) ]\033[m  " | tr '\n' ' '
				((TEST_KO_EXIT++))
				((FAILED++))
			else
				echo -ne "\033[0;32mOK\033[m  "
				((TEST_OK++))
				((THREE++))
			fi
			INPUT=""
			((i++))
			((TEST_COUNT++))
			echo -e "\033[0;90m$1:$tmp_line_count\033[m  "
			if [[ $ONE == 1 && $TWO == 1 && $THREE == 1 ]] ;
			then
				((GOOD_TEST++))
				((ONE--))
				((TWO--))
				((THREE--))
			else
				ONE=0
				TWO=0
				THREE=0
			fi
		fi
	done < "$1"
}

test_leaks() {
	IFS=''
	i=1
	end_of_file=0
	line_count=0
	while [[ $end_of_file == 0 ]] ;
	do
		read -r line
		end_of_file=$?
		((line_count++))
		if [[ $line == \#* ]] || [[ $line == "" ]] ; then
			# if [[ $line == "###"[[:blank:]]*[[:blank:]]"###" ]] ; then
			# 	echo -e "\033[0;33m$line\033[m"
			if [[ $line == "#"[[:blank:]]*[[:blank:]]"#" ]] ; then
				echo -e "\033[0;33m		$line\033[m" | tr '\t' '    '
			fi
			continue
		else
			printf "\033[0;35m%-4s\033[m" "  $i:	"
			tmp_line_count=$line_count
			while [[ $end_of_file == 0 ]] && [[ $line != \#* ]] && [[ $line != "" ]] ;
			do
				INPUT+="$line$NL"
				read -r line
				end_of_file=$?
				((line_count++))
			done
			# INPUT=${INPUT%?}
			echo -n "$INPUT" | $MINISHELL_PATH/$EXECUTABLE 2>tmp_err_minishell >tmp_out_minishell
			exit_minishell=$?
			echo -n "enable -n .$NL$INPUT" | bash 2>tmp_err_bash >tmp_out_bash
			exit_bash=$?
			echo -ne "\033[0;34mSTD_OUT:\033[m "
			if ! diff -q tmp_out_minishell tmp_out_bash >/dev/null ;
			then
				echo -ne "\033[0;31mKO\033[m  " | tr '\n' ' '
				((TEST_KO_OUT++))
				((FAILED++))
			else
				echo -ne "\033[0;32mOK\033[m  "
				((TEST_OK++))
				((ONE++))
			fi
			echo -ne "\033[0;36mSTD_ERR:\033[m "
			if [[ -s tmp_err_minishell && ! -s tmp_err_bash ]] || [[ ! -s tmp_err_minishell && -s tmp_err_bash ]] ;
			then
				echo -ne "\033[0;31mKO\033[m  " |  tr '\n' ' '
				((TEST_KO_ERR++))
				((FAILED++))
			else
				echo -ne "\033[0;32mOK\033[m  "
				((TEST_OK++))
				((TWO++))
			fi
			echo -ne "\033[0;36mEXIT_CODE:\033[m "
			if [[ $exit_minishell != $exit_bash ]] ;
			then
				echo -ne "\033[0;31mKO [ minishell($exit_minishell)  bash($exit_bash) ]\033[m  " | tr '\n' ' '
				((TEST_KO_EXIT++))
				((FAILED++))
			else
				echo -ne "\033[0;32mOK\033[m  "
				((TEST_OK++))
				((THREE++))
			fi
			echo -ne "\033[0;36mLEAKS:\033[m "
			echo -n "$INPUT" | valgrind --leak-check=full --show-leak-kinds=all --track-origins=yes --verbose --log-file=tmp_valgrind-out.txt $MINISHELL_PATH/$EXECUTABLE 2>/dev/null >/dev/null
			# Get the number of bytes lost
			definitely_lost=$(cat tmp_valgrind-out.txt | grep "definitely lost:" | awk 'END{print $4}')
			possibly_lost=$(cat tmp_valgrind-out.txt | grep "possibly lost:" | awk 'END{print $4}')
			indirectly_lost=$(cat tmp_valgrind-out.txt | grep "indirectly lost:" | awk 'END{print $4}')
			# echo "$definitely_lost"
			# echo "$possibly_lost"
			# echo "$indirectly_lost"
			# Check if any bytes were lost
			if [ "$definitely_lost" != "0" ] || [ "$possibly_lost" != "0" ] || [ "$indirectly_lost" != "0" ];
			then
				echo -ne "\033[0;31mKO\033[m "
				((LEAKS++))
			else
				echo -ne "\033[0;32mOK\033[m "
			fi
			INPUT=""
			((i++))
			((TEST_COUNT++))
			echo -e "\033[0;90m$1:$tmp_line_count\033[m  "
			if [[ $ONE == 1 && $TWO == 1 && $THREE == 1 ]] ;
			then
				((GOOD_TEST++))
				((ONE--))
				((TWO--))
				((THREE--))
			else
				ONE=0
				TWO=0
				THREE=0
			fi
		fi
	done < "$1"
}

# Start the tester
main "$@"

# Clean all tmp files
[[ $1 != "-f" ]] && rm -f tmp_*
