import mysql.connector

class SQLConnection:
  hostname='localhost'
  database='electricity'
  username='root'
  password='secret'
  port=33060
  connection=None

  def __init__(self):
    self.startConnection()
  
  def __del__(self):
    self.closeConnection()

  def startConnection(self):
    self.connection = mysql.connector.connect(
                              host=self.hostname,
                              database=self.database,
                              user=self.username,
                              password=self.password,
                              port=self.port
                            )
    if self.connection.is_connected():
        db_Info = self.connection.get_server_info()
  
  def closeConnection(self):
    if (self.connection.is_connected()):
      self.connection.close()

  def runQueryWithReturn(self, query):
    cursor = self.connection.cursor()

    cursor.execute(query)

    result = cursor.fetchall()

    cursor.close()

    return result
  

  def runQueryWithoutReturn(self, query):
    cursor = self.connection.cursor()

    cursor.execute(query)

    cursor.close()

    return None
  
  def runPreparedQueryWithoutReturn(self, query, params):
    cursor = self.connection.cursor()

    cursor.execute(query, params)

    cursor.close()

    return None
  
  def runPreparedQueryWithReturn(self, query, params):
    cursor = self.connection.cursor()

    cursor.execute(query, params)

    result = cursor.fetchall()

    cursor.close()

    return result
  
  def runPreparedQueryWithInsertId(self, query, params):
    cursor = self.connection.cursor()

    cursor.execute(query, params)

    insertId = cursor.lastrowid

    cursor.close()

    return insertId
  
  def commitChanges(self):
      self.connection.commit()