# pip3 install mysql-connector-python --break-system-packages
# sudo apt install libmysqlclient-dev python3-mysql.connector
# solo si da error de ssl en socket:
# pip3 install --user --upgrade mysql-connect-python --break-system-packages
import mysql.connector

conexion = mysql.connector.connect(
    host="localhost",
    user="empresadam",
    password="Empresadam123$",
    database="empresadam"
)

cursor = conexion.cursor()
cursor.execute('''
  INSERT INTO clientes
  VALUES(
    "12345678Z",
    "Gustavo Enrique",
    "Delnardo Vallejo",
    "info@gustavo.com"
  );
''')
conexion.commit()

cursor.close()
conexion.close()
