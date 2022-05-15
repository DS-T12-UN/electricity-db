from connections.Connections import MongoConnection
from mapping.mapping import mapping, countryMapping, tableMappings

class NoSQLInsert:
  targetConnection: None
  addedCountries = {}

  def __init__(self):
    self.targetConnection = MongoConnection()

  def insertData(self, data):
    self.targetConnection.insertData(data)
