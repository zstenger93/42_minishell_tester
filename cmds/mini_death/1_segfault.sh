# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    1_segfault.sh                                      :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: kvebers <kvebers@student.42.fr>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/04/26 13:05:49 by kvebers           #+#    #+#              #
#    Updated: 2023/04/26 13:17:03 by kvebers          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

echo seg <> echo seg

echo seg >< echo segf

echo seg <<> echo segf

echo seg <<<> echo segf

echo <<< echo seegf

echo |< echo segf

echo segf >| echo is this invalid

echo segf <|< echo super valid

echo >>< "echo"

echo >>| echo kekw

echo >>| echo super valid

echo <<> echo

echo <<<> ok

echo <<| echo ok

echo <<|< ok

echo <<|> echo

echo segfault <"<<<"<<amazing
.
amazing

echo seg < > echo seg

echo seg > < echo segf

echo seg < < > echo segf

echo seg < < < > echo segf

echo < < < echo seegf

echo | < echo segf

echo segf > | echo is this invalid

echo segf < | < echo super valid

echo > > < "echo"

echo > > | echo kekw

echo > > | echo super valid

echo < < > echo

echo < < < > ok

echo < < | echo ok

echo < < | < ok

echo < < | > echo

echo segfault < " < < < " < < amazing
.
amazing

echo seg <  > echo seg

echo seg >  < echo segf

echo seg <      < > echo segf

echo seg <      < <    > echo segf

echo <      <     < echo seegf

echo |      < echo segf

echo segf >     | echo is this invalid

echo segf <         |        < echo super valid

echo >          >           < "echo"

echo >          >         | echo kekw

echo >          >         | echo super valid

echo <          <         > echo

echo <  < <         > ok

echo <  < | echo ok

echo <  < |    < ok

echo <      < |    > echo

echo segfault <"    <   <   <"  <   <   amazing
.
amazing
