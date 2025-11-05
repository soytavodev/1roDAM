import mysql.connector

conexion = mysql.connector.connect(
    host="localhost",      
    user="yosoytavo",    
    password="Hakaishin2.",  
    database="portafolio"      
)
cursor = conexion.cursor() 

print("Gestion de portafolio v0.1")
while True:
  print("Escoge una opcion")
  print("1.-Insertar")
  print("2.-Listar")
  print("3.-Actualizar")
  print("4.-Eliminar")
  opcion = int(input("Escoge una opcion: "))
  print("La opción que has escogido es: ",opcion)
  if opcion == 1:
    titulo = input("Introduce el titulo: ")
    descripción = input("Introduce la descripcion: ")
    imagen = input("Introduce el nombre de la imagen: ")
    url = input("Introduce la url: ")
    cursor.execute("INSERT INTO pieza VALUES (NULL,'"+título+"','"+descripción+"','"+imagen+"','"+url+"', 1);")
    conexion.commit()
  elif opcion == 2:
    cursor.execute("SELECT * FROM pieza;")
    lineas = cursor.fetchall()
    for linea in lineas:
      print(linea)
  elif opcion == 3:
    identificador = input("Introduce el Identificador a actualizar: ")
    título = input("Introduce el titulo de la nueva pieza: ")
    descripción = input("Introduce la descripcion de la nueva pieza: ")
    imagen = input("Introduce el nombre de la imagen de la nueva pieza: ")
    url = input("Introduce la url de la nueva pieza: ")
    cursor.execute('''
      UPDATE pieza 
      SET
      titulo = "'''+título+'''",
      descripción = "'''+descripción+'''",
      imagen = "'''+imagen+'''",
      url = "'''+url+'''"
      WHERE Identificador = '''+identificador+''';
    ''')
    conexion.commit()
  elif opcion == 4:
    identificador = input("Introduce el Identificador a eliminar: ")
    cursor.execute("DELETE FROM pieza WHERE Identificador = "+identificador+";")
    conexion.commit()
