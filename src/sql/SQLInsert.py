from connections.Connections import SQLConnection
from mapping.mapping import mapping, countryMapping, tableMappings

class SQLInsert:
  targetConnection: None
  headers = []
  addedCountries = {}

  def __init__(self, headers):
    self.targetConnection = SQLConnection()
    self.headers = headers
  
  def insertRow(self, row):
    country_id = -1
    if row[self.headers.index('country')] not in self.addedCountries:
      country_id = self.insertCountry(row)
      self.addedCountries[row[self.headers.index('country')]] = country_id
    else:
      country_id = self.addedCountries[row[self.headers.index('country')]]

    for key in tableMappings:
      self.insertInTable(row, country_id, key, tableMappings[key])

  def insertCountry(self, row):
    data = ()
    for column in countryMapping:
      data = (*data, None if not row[self.headers.index(column)] else row[self.headers.index(column)])

    query = ("INSERT INTO electricity.Country " + 
            "(" + mapping[countryMapping[0]] + ", " + mapping[countryMapping[1]] + ")" +
            " VALUES ( %s, %s )")

    insertId = self.targetConnection.runPreparedQueryWithInsertId(query, data)
    self.targetConnection.commitChanges()

    return insertId
  
  def insertInTable(self, row, country, tableName, tableArray):
    data = ()
    variables = ""
    values = ""
    for column in tableArray:
      data = (*data, None if not row[self.headers.index(column)] else float(row[self.headers.index(column)]))
      variables = variables + mapping[column] + ","
      values = values + "%s,"

    variables = variables + "country"
    values = values + str(country)

    query = ("INSERT INTO electricity." + tableName + " " + 
            "(" + variables + ")" +
            " VALUES ( " + values + " )")

    self.targetConnection.runPreparedQueryWithoutReturn(query, data)
