import tkinter as tk

ventana = tk.Tk()

marco = tk.Frame(ventana)

#DNI NIE
tk.Label(marco,text="Introduce el dni/nie del cliente").pack(padx=20,pady=20)
dninie = tk.Entry(marco)
dninie.pack(padx=10,pady=10)

#NOMBRE
tk.Label(marco,text="Introduce el nombre del cliente").pack(padx=20,pady=20)
nombre = tk.Entry(marco)
nombre.pack(padx=10,pady=10)

#APELLIDOS
tk.Label(marco,text="Introduce los apellidos del cliente").pack(padx=20,pady=20)
apellido = tk.Entry(marco)
apellido.pack(padx=10,pady=10)

#EMAIL
tk.Label(marco,text="Introduce el email del cliente").pack(padx=20,pady=20)
email = tk.Entry(marco)
email.pack(padx=10,pady=10)

#BOTON
tk.Button(marco,text="Insertar cliente",command = insertar).pack(padx=10,pady=10)

marco.pack(padx=20,pady=20)

ventana.mainloop()
