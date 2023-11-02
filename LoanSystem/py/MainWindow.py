import sys

from PyQt5 import uic
from PyQt5 import QtGui
from PyQt5.QtWidgets import QMainWindow, QApplication


class MainWindow(QMainWindow):
    def __init__(self):
        super().__init__()        
        uic.loadUi('LoanSystem/ui/MainWindow.ui',self)
    #------------------------------------------------------------------------------------------------------
    #------------------------------------------------------------------------------------------------------
        # Main window settings.
        self.setWindowTitle('.:. PANEL PRINCIPAL .:.')
        self.setFixedSize(self.size())
        self.setWindowIcon(QtGui.QIcon('LoanSystem/images/Fav.jpg'))




if __name__ == '__main__':
    app = QApplication(sys.argv)       
    GUI = MainWindow()
    GUI.show()
    sys.exit(app.exec_())