# -*- coding: utf-8 -*-

################################################################################
## Form generated from reading UI file 'MainWindow.ui'
##
## Created by: Qt User Interface Compiler version 6.5.2
##
## WARNING! All changes made in this file will be lost when recompiling UI file!
################################################################################

from PySide6.QtCore import (QCoreApplication, QDate, QDateTime, QLocale,
    QMetaObject, QObject, QPoint, QRect,
    QSize, QTime, QUrl, Qt)
from PySide6.QtGui import (QBrush, QColor, QConicalGradient, QCursor,
    QFont, QFontDatabase, QGradient, QIcon,
    QImage, QKeySequence, QLinearGradient, QPainter,
    QPalette, QPixmap, QRadialGradient, QTransform)
from PySide6.QtWidgets import (QApplication, QComboBox, QLabel, QLineEdit,
    QMainWindow, QPushButton, QSizePolicy, QStatusBar,
    QTextEdit, QWidget)

class Ui_MainWindow(object):
    def setupUi(self, MainWindow):
        if not MainWindow.objectName():
            MainWindow.setObjectName(u"MainWindow")
        MainWindow.setWindowModality(Qt.NonModal)
        MainWindow.resize(1019, 658)
        MainWindow.setStyleSheet(u"QWidget {\n"
"    background-color: #deede3;\n"
"}")
        self.centralwidget = QWidget(MainWindow)
        self.centralwidget.setObjectName(u"centralwidget")
        self.label = QLabel(self.centralwidget)
        self.label.setObjectName(u"label")
        self.label.setGeometry(QRect(20, 80, 51, 21))
        font = QFont()
        font.setPointSize(1)
        font.setBold(True)
        self.label.setFont(font)
        self.label.setStyleSheet(u"QWidget {\n"
"    background-color: var(--jade-50);\n"
"}\n"
"\n"
"QLabel {\n"
"    color: var(--jade-500);\n"
"    font-size: 16px;\n"
"    font-weight: bold;\n"
"}")
        self.QLineEdit = QLineEdit(self.centralwidget)
        self.QLineEdit.setObjectName(u"QLineEdit")
        self.QLineEdit.setGeometry(QRect(20, 330, 120, 35))
        self.QLineEdit.setStyleSheet(u"QLineEdit {\n"
"    background-color: #96bfab;\n"
"    border: 1px solid #cccccc;\n"
"    padding: 6px;\n"
"    border-radius: 4px;\n"
"    font-size: 14px;\n"
"}\n"
"\n"
"QLineEdit:hover {\n"
"    border: 1px solid #689f84;\n"
"}\n"
"\n"
"QLineEdit:focus {\n"
"    border: 1px solid #689f84;\n"
"    outline: none;\n"
"}\n"
"\n"
"QLineEdit::placeholder {\n"
"    color: #1e362d;\n"
"    font-weight: bold;\n"
"}")
        self.Button = QPushButton(self.centralwidget)
        self.Button.setObjectName(u"Button")
        self.Button.setGeometry(QRect(20, 260, 106, 37))
        self.Button.setStyleSheet(u"QPushButton {\n"
"    background: qlineargradient(x1: 0, y1: 0, x2: 0, y2: 1,\n"
"                                 stop: 0 #c0dacb, stop: 1 #96bfab);\n"
"    color: #ffffff;\n"
"    border: 1px solid #1e362d;\n"
"    padding: 8px 16px;\n"
"    border-radius: 4px;\n"
"    font-size: 14px;\n"
"}\n"
"\n"
"QPushButton:hover {\n"
"    background: qlineargradient(x1: 0, y1: 0, x2: 0, y2: 1,\n"
"                                 stop: 0 #689f84, stop: 1 #96bfaa);\n"
"    border: 1px solid #96bfaa;\n"
"}\n"
"\n"
"QPushButton:pressed {\n"
"    background: qlineargradient(x1: 0, y1: 0, x2: 0, y2: 1,\n"
"                                 stop: 0 #2a5242, stop: 1 #32624d);\n"
"    border: 1px solid #32624d;\n"
"}")
        self.QComboBox = QComboBox(self.centralwidget)
        self.QComboBox.addItem("")
        self.QComboBox.addItem("")
        self.QComboBox.setObjectName(u"QComboBox")
        self.QComboBox.setGeometry(QRect(20, 200, 100, 25))
        self.QComboBox.setStyleSheet(u"/* Estilos para QComboBox */\n"
"QComboBox {\n"
"    background-color: #96bfab;\n"
"    border: 1px solid #cccccc;\n"
"    padding: 6px;\n"
"    border-radius: 4px;\n"
"    font-size: 14px;\n"
"}\n"
"\n"
"QComboBox:hover {\n"
"    border: 1px solid #689f84;\n"
"}\n"
"\n"
"QComboBox:focus {\n"
"    border: 1px solid #689f84;\n"
"    outline: none;\n"
"}\n"
"\n"
"QComboBox::placeholder {\n"
"    color: #1e362d;\n"
"    font-weight: bold;\n"
"}")
        self.QTextEdit = QTextEdit(self.centralwidget)
        self.QTextEdit.setObjectName(u"QTextEdit")
        self.QTextEdit.setGeometry(QRect(20, 120, 221, 51))
        self.QTextEdit.setStyleSheet(u"QTextEdit {\n"
"    background-color: #96bfab;\n"
"    border: 1px solid #cccccc;\n"
"    padding: 6px;\n"
"    border-radius: 4px;\n"
"    font-size: 14px;\n"
"}\n"
"\n"
"QTextEdit:hover {\n"
"    border: 1px solid #689f84;\n"
"}\n"
"\n"
"QTextEdit:focus {\n"
"    border: 1px solid #689f84;\n"
"    outline: none;\n"
"}")
        MainWindow.setCentralWidget(self.centralwidget)
        self.statusbar = QStatusBar(MainWindow)
        self.statusbar.setObjectName(u"statusbar")
        MainWindow.setStatusBar(self.statusbar)

        self.retranslateUi(MainWindow)

        QMetaObject.connectSlotsByName(MainWindow)
    # setupUi

    def retranslateUi(self, MainWindow):
        MainWindow.setWindowTitle(QCoreApplication.translate("MainWindow", u"MainWindow", None))
        self.label.setText(QCoreApplication.translate("MainWindow", u"Label", None))
#if QT_CONFIG(tooltip)
        self.QLineEdit.setToolTip(QCoreApplication.translate("MainWindow", u"<html><head/><body><p>Inserte el nombre del articulo</p></body></html>", None))
#endif // QT_CONFIG(tooltip)
        self.Button.setText(QCoreApplication.translate("MainWindow", u"PushButton", None))
        self.QComboBox.setItemText(0, QCoreApplication.translate("MainWindow", u"Item1", None))
        self.QComboBox.setItemText(1, QCoreApplication.translate("MainWindow", u"Item2", None))

    # retranslateUi

