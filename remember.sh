#!/bin/bash

FILE=~/.remember

[ ! -f $FILE ] &&echo "$FILE n'existe pas, il a donc ete cree" &&touch $FILE
 #si .remember n'existe pas, le creer
[ -f $FILE ] &&echo $@ >> $FILE
 #ecrit les arguments dans .remember

if [ $# -eq 0 ]
	then
		echo "Entrez votre texte (puis enregistrez avec CTRL+D):" &&cat $@ >> $FILE
fi


while getopts "chs" option; do
	echo "Nicolas TALEC-BERNARD -- remember.sh"
	case $option in
		c)
		echo "contenu du fichier $FILE supprime" &&rm $FILE &&touch $FILE
		;;
		h)
		echo "aide commande - remember "
		echo "========================="
		echo "Commande -c : Supprime le contenu de .remember"
		echo "Commande -h : Affiche l'aide"
		echo "Commande -s : Supprime .remember"
		echo "remember.sh sans option vous permet d'ecrire votre texte direcement via la console" 
		sed -i '$d' $FILE
		;;
		s)
		echo "Fichier $FILE supprime."&& rm $FILE
		;;
		?)
		echo "Option illegale"
		exit 1
		;;
	esac
done
shift $((OPTIND - 1))


