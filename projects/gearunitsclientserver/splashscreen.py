"""
Splash Screen
Python Version: 3.1

"""

"""Only works if you got Python 3 installed with tkinter"""
import tkinter
import io

IMAGE_PATH = "python.gif"

class Splash(object):
	"Splash Screen GUI"
	def __init__(self, root):
		self.root = root
		# No window borders and decoration
		self.root.overrideredirect(True)
		# Get the size of the screen
		screen_width = self.root.winfo_screenwidth()
		screen_height = self.root.winfo_screenheight()
		# Full screen
		#geometry_text = "%dx%d+0+0" % (screen_width, screen_height)
		geometry_text = "%dx%d+0+0" % (50, 65)
		self.root.geometry(geometry_text)
		# Display an image
		self.label = tkinter.Label(self.root)
		# Only GIF and PGM/PPM supported, for more information see:
		self.label._image = tkinter.PhotoImage(file=IMAGE_PATH)
		# http://effbot.org/tkinterbook/photoimage.htm
		self.label.configure(image = self.label._image)
		#print(dir(self.label))
		self.label.pack()
		self.root.geometry('+100+100')
		#self.root.geometry(geo)
		# This will quit the screen after about 5 seconds
		self.root.after(5000, self.root.quit)

if __name__ == '__main__':
	ROOT = tkinter.Tk()
	APPL = Splash(ROOT)
	ROOT.mainloop() 