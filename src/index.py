import csv
import json
from sql.SQLInsert import SQLInsert
from nosql.NoSQLInsert import NoSQLInsert

file_csv = open("./../dataset/owid-energy-data.csv")
file_json = open("./../dataset/owid-energy-data.json")

csvreader = csv.reader(file_csv)
header = next(csvreader)

sqlInsert = SQLInsert(header)

rows = []
for row in csvreader:
  sqlInsert.insertRow(row)

jsonreader = json.load(file_json)
noSqlInsert = NoSQLInsert()
noSqlInsert.insertData(jsonreader)