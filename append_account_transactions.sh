# appen account transactions to existing ones
# create a copy of old.csv (1st line, including 3-byte code for representation of special 'de' characters required by M$ excel)
# data shaping (could be done in one line)
# convert date to iso8601 
# unique-sort and append to x.csv

head -1 old.csv >x.csv
sed '1d' new.csv   |\
sed 's/"//g'       |\
sed 's/\t/ /g'     |\
sed 's/  */ /g'    |\
sed 's/\([0-9]\{2\}\)\.\([0-9]\{2\}\)\.\([0-9]\{2\}\)/20\3-\2-\1/g' >u.csv
sed '1d' old.csv >>u.csv
sort -r -u u.csv >>x.csv
rm u.csv
