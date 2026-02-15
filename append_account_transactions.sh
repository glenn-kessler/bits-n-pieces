# appen account transactions to existing ones

head -1 old.csv >u.csv >x.csv
sed '1d' new.csv   |\
sed 's/"//g'       |\
sed 's/\t/ /g'     |\
sed 's/  */ /g'    |\
sed 's/\([0-9]\{2\}\)\.\([0-9]\{2\}\)\.\([0-9]\{2\}\)/20\3-\2-\1/g' >>u.csv
sed '1d' old.csv >>u.csv
sort -r -u u.csv >>x.csv
rm u.csv
