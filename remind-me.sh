#!/bin/bash

FILE=~/.remember

echo "Nicolas TALEC-BERNARD -- remind-me.sh"
[ ! -f $FILE ] &&echo "le fichier $FILE n'existe pas, veuillez consulter l'aide de ./remember.sh" &&exit 1

if [ $# -eq 0 ];then
		if [ -f $FILE ];then
			cat $FILE #affiche .remember
		fi
else
	grep -rnw $FILE -e $@ #affiche la ligne et la phrase de l'argument donne
fi
