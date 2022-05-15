import csv

from sql.SQLInsert import SQLInsert

file = open("./../dataset/owid-energy-data.csv")
csvreader = csv.reader(file)
header = next(csvreader)

sqlInsert = SQLInsert(header)

rows = []
for row in csvreader:
  sqlInsert.insertRow(row)

