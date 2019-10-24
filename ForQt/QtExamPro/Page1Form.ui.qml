// Start
import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Dialogs 1.2
import QtQuick.Window 2.12

Page {
    id: page
    width: 500
    height: 600
    property alias image: image
    property alias button: button

    Button {
        id: button
        width: 135
        height: 40
        text: "load a picture"
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 30
        font.capitalization: Font.AllUppercase
        font.family: "Arial"
        font.bold: true
        font.pointSize: 12
        anchors.horizontalCenter: parent.horizontalCenter
        visible: true
        focusPolicy: Qt.TabFocus
    }

    Image {
        id: image
        width: 315
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottom: button.top
        anchors.bottomMargin: 30
        anchors.top: parent.top
        anchors.topMargin: 30
        fillMode: Image.PreserveAspectCrop
        //source: "/images/one.png" // mit diesem Code wird das Bild hier in der ui.qml angezeigt
        source: "qrc:/images/one.png"
    }
}




/*##^## Designer {
    D{i:1;anchors_height:40}D{i:2;anchors_height:420;anchors_width:315}
}
 ##^##*/
