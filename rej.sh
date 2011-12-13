#!/bin/bash
diagnoza=0;
echo 'KLASYFIKACJA PACJENTÓW'
echo 'Po wpisaniu danych wciœnij Enter by przejœæ dalej.'
echo 'Imiê:'
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
echo "PRZYTOMNOŒÆ:$przytomnosc" >> $nazwisko$imie
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
