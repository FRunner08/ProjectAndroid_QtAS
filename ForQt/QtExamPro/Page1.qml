// Start
import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Dialogs 1.2
import QtQuick.Window 2.12

Page1Form {

    button.onClicked: {
        messageDialog.open()
    }

    MessageDialog {
        id: messageDialog
        title: ""
        text: "Hier sollte es zum internen Speicher gehen."
    }

//    Image {
//        id: picture
//        //mipmap: true

//        anchors.fill: parent
//        fillMode: Image.PreserveAspectFit
//        source: "qrc:/images/one.png"
//    }

}
