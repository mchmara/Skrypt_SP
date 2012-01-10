#!/bin/bash

diagnoza=0;
echo 'KLASYFIKACJA PACJENTOW'
echo 'Po wpisaniu danych wcisnij Enter by przejsc dalej.'
echo 'Imie:'
read imie
echo 'Nazwisko:'
read nazwisko
echo 'Pesel:'
read pesel

if test -e EASY/"$nazwisko$imie$pesel.txt"
then
echo 'istnieje w EASY'
x=EASY/"$nazwisko$imie$pesel.txt"

elif test -e MEDIUM/"$nazwisko$imie$pesel.txt"
then
echo 'istnieje w MEDIUM'
x=MEDIUM/"$nazwisko$imie$pesel.txt"

elif test -e HARD/"$nazwisko$imie$pesel.txt"
then
echo 'istnieje w HARD'
x=HARD/"$nazwisko$imie$pesel.txt"

else
echo 'nie istnieje'
touch "$nazwisko$imie$pesel.txt"
x="$nazwisko$imie$pesel.txt"

fi

date >> $x
echo "PESEL:$pesel" >> $x

echo 'Stan ogolny 1-10'
read stan
diagnoza=$[$diagnoza+10*$stan];
echo "STAN:$stan" >> $x
echo 'Przytomny? (1-tak/0-nie)'
read przytomnosc
diagnoza=$[$diagnoza+20*$przytomnosc];
echo "PRZYTOMNSC: $przytomnosc" >> $x
echo 'Oddech? (2-ok/1-przerywany/0-brak)'
read oddech
diagnoza=$[$diagnoza+50*$oddech];
echo "ODDECH:$oddech" >> $x
echo "DIAGNOZA:$diagnoza" >> "$nazwisko$imie$pesel.txt"


if (($diagnoza<50));
then
mv $x HARD
elif (($diagnoza<75));
then
mv $x MEDIUM
else
mv $x EASY
fi

if test -e "$nazwisko$imie$pesel.txt"
then
rm "$nazwisko$imie$pesel.txt"
fi

#!/bin/bash
diagnoza=0;
echo 'KLASYFIKACJA PACJENTÓW'
echo 'Po wpisaniu danych wciśnij Enter by przejść dalej.'
echo 'Imię:'
read imie
echo 'Nazwisko:'
read nazwisko
echo 'Pesel:'
read pesel
touch "$nazwisko$imie"
echo "PESEL:$pesel" >> "$nazwisko$imie"
echo 'Stan ogolny 1-10'
read stan
diagnoza=$[$diagnoza+10*$stan];
echo "STAN:$stan" >> "$nazwisko$imie"
echo 'Przytomny? (1-tak/0-nie)'
read przytomnosc
diagnoza=$[$diagnoza+20*$przytomnosc];
echo "PRZYTOMNOŚĆ:$przytomnosc" >> $nazwisko$imie
echo 'Oddycha? (1-tak/0-nie)'
read oddech
diagnoza=$[$diagnoza+50*$oddech];
echo "ODDECH:$oddech" >> $nazwisko$imie
echo "DIAGNOZA:$diagnoza" >> "$nazwisko$imie"

if (($diagnoza<50));
then
mv $nazwisko$imie natychmiastowa_pomoc
elif (($diagnoza<75));
then
mv $nazwisko$imie stan_posredni
else
mv $nazwisko$imie lagodne_schorzenie
fi
