// Formular
import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Dialogs 1.2
import QtQuick.Window 2.12

Page4Form {

    button5.onClicked: {
        messageDialog.open()
    }

    MessageDialog {
        id: messageDialog
        title: ""
        text: "Kein Profil - nicht gespeichert"
    }

}
