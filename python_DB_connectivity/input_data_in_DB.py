import tkinter as tk
import tkinter.messagebox as messagebox
import mysql.connector as mysql

def insert_data():
    id = id_entry.get()
    name = name_entry.get()
    number = number_entry.get()

    if id == "" or name == "" or number == "":
        messagebox.showinfo("Insert Status", "All fields are required")
    else:
        try:
            # connect to the database
            conn = mysql.connect(host='localhost', user='root', password='newpassword', database='students')
            cursor = conn.cursor()
            
            # insert data into the table
            query = "INSERT INTO students (id, name, number) VALUES (%s, %s, %s)"
            values = (id, name, number)
            cursor.execute(query, values)
            conn.commit()
            
            id_entry.delete(0, 'end')
            name_entry.delete(0, 'end')
            number_entry.delete(0, 'end')
            show()
            messagebox.showinfo("Insert Status", "Inserted Successfully")
        except mysql.Error as e:
            messagebox.showerror("Error", str(e))
        finally:
            cursor.close()
            conn.close()

def delete_data():
    if id=="":
        messagebox.showinfo("Delete Status", "Id is compolsary for delete")
    else:
        conn = mysql.connect(host='localhost', user='root', password='newpassword', database='students')
        cursor = conn.cursor()
        
        # insert data into the table
        query = ("delete from students where id='"+ id_entry.get() +"'")
        cursor.execute(query)
        conn.commit()
        
        id_entry.delete(0, 'end')
        name_entry.delete(0, 'end')
        number_entry.delete(0, 'end')
        show()
        messagebox.showinfo("Delete Status", "Deleted Successfully")
        cursor.close()
        conn.close()

def update_data():
    if id_entry == "" or name_entry == "" or number_entry == "":
        messagebox.showinfo("Update Status", "All fields are required")
    else:
        try:
            # connect to the database
            conn = mysql.connect(host='localhost', user='root', password='newpassword', database='students')
            cursor = conn.cursor()
            
            # insert data into the table
            query = ("update students set name='"+ name_entry.get() +"', number='"+ number_entry.get() +"' where id='"+ id_entry.get() +"'")
            cursor.execute(query)
            conn.commit()
            
            id_entry.delete(0, 'end')
            name_entry.delete(0, 'end')
            number_entry.delete(0, 'end')
            show()
            messagebox.showinfo("Update Status", "Updated Successfully")
        except mysql.Error as e:
            messagebox.showerror("Error", str(e))
        finally:
            cursor.close()
            conn.close()

def get():
    if id_entry.get() == "":
        messagebox.showinfo("Get Status", "All fields are required")
    else:
        # connect to the database
        conn = mysql.connect(host='localhost', user='root', password='newpassword', database='students')
        cursor = conn.cursor()
        
        # insert data into the table
        query = ("select * from students where id='"+ id_entry.get() +"'")
        cursor.execute(query)
        rows = cursor.fetchall()

        for row in rows:
            name_entry.insert(0, row[1])
            number_entry.insert(0, row[2])
        conn.close()    

def show():
    conn = mysql.connect(host='localhost', user='root', password='newpassword', database='students')
    cursor = conn.cursor()
    
    # insert data into the table
    query = ("select * from students")
    cursor.execute(query)
    rows = cursor.fetchall()
    list.delete(0, list.size())

    for row in rows:
        insertData = str(row[0])+'     '+row[1]
        list.insert(list.size()+1, insertData)
    conn.close()

# create the GUI
root = tk.Tk()
root.geometry("600x300")
root.title("Py+Tkinter.Mysql")

# create the labels and entries
id_label = tk.Label(root, text="Enter ID", font=('italic', 10))
id_label.place(x=20, y=30)

name_label = tk.Label(root, text="Enter Name", font=('italic', 10))
name_label.place(x=20, y=60)

number_label = tk.Label(root, text="Enter Number", font=('italic', 10))
number_label.place(x=20, y=90)

id_entry = tk.Entry()
id_entry.place(x=150, y=30)

name_entry = tk.Entry()
name_entry.place(x=150, y=60)

number_entry = tk.Entry()
number_entry.place(x=150, y=90)

insert_button = tk.Button(root, text='Insert', font=('italic', 10), bg='green', command=insert_data)
insert_button.place(x=20, y=140)

delete_button = tk.Button(root, text='Delete', font=('italic', 10), bg='red', command=delete_data)
delete_button.place(x=70, y=140)

update_button = tk.Button(root, text='Update', font=('italic', 10), bg='green', command=update_data)
update_button.place(x=125, y=140)

get = tk.Button(root, text='Get', font=('italic', 10), bg='green', command=get)
get.place(x=185, y=140)

list = tk.Listbox(root)
list.place(x=285, y=30)

show()

root.mainloop()
