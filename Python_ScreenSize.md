# Basic Info: #
Python version: 3.1

```
from tkinter import *
class App(Frame):
    def __init__(self, master=None):
        Frame.__init__(self, master)
        self.pack()


# create the application
myapp = App()

#
# here are method calls to the window manager class
#
myapp.master.title("My Do-Nothing Application")
myapp.master.geometry("200x100")
#myapp.master.minsize(1000, 400) #screen limited
#myapp.master.maxsize(1000, 400) #screen limited

print(dir(myapp.master))

# start the program
myapp.mainloop()
```