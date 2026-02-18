# append account transactions to existing ones
# assumption:
#    old.csv encoding is utf8
#    new.csv encoding is iso8859
# create a copy of old.csv (1st line, including 3-byte code for representation of special 'de' characters required by M$ excel)
# data shaping (could be done in one line)
# convert date to iso8601 
# unique-sort and append to x.csv


cat neu.csv                   |\
iconv -f ISO-8859-15 -t utf-8 |\
sed '1d'                      |\
sed 's#"##g'                  |\
sed 's#\t# #g'                |\
sed 's#  *# #g'               |\
sed 's#\([0-9]\{2\}\)\.\([0-9]\{2\}\)\.\([0-9]\{2\}\)#20\3-\2-\1#g' >u.csv
sed '1d' Umsatz_KSKWN.csv >>u.csv
head -1  Umsatz_KSKWN.csv  >x.csv
sort -r -u          u.csv >>x.csv
rm u.csv
