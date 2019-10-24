// Formular
import QtQuick 2.12
import QtQuick.Controls 2.12

Page {
    id: page4
    width: 500
    height: 600
    font.capitalization: Font.AllUppercase
    font.pointSize: 9
    property alias button5: button5

    Row {
        id: row

        Button {
            id: button5
            x: 44
            width: 135
            height: 40
            text: "Save"
            font.bold: true
            spacing: 5
            font.family: "Arial"
            font.pointSize: 12
            anchors.left: parent.left
            anchors.leftMargin: 22
            anchors.top: textInput3.bottom
            anchors.topMargin: 25
        }

        Text {
            id: element
            x: 22
            y: 35
            width: 458
            height: 50
            text: "Eingabeformular"
            verticalAlignment: Text.AlignVCenter
            font.bold: true
            font.pixelSize: 36
        }

        TextInput {
            id: textInput
            width: 300
            height: 25
            font.family: "Arial"
            anchors.top: element.bottom
            anchors.topMargin: 25
            anchors.left: parent.left
            anchors.leftMargin: 22
            font.pixelSize: 18
            inputMethodHints: Qt.ImhHiddenText
            property string placeholderText: "Nickname"
            //overwriteMode: true

            Text {
                y: 0
                width: 300
                height: 25
                text: textInput.placeholderText
                font.family: "Arial"
                verticalAlignment: Text.AlignTop
                font.pixelSize: 18
                color: "#aaa"
                visible: !textInput.text && !textInput.activeFocus
            }
        }

        TextInput {
            id: textInput1
            width: 300
            height: 25
            font.family: "Arial"
            anchors.top: textInput.bottom
            anchors.topMargin: 25
            inputMethodHints: Qt.ImhEmailCharactersOnly
            anchors.left: parent.left
            anchors.leftMargin: 22
            font.pixelSize: 18
            property string placeholderText: "Email"

            Text {
                x: 0
                y: 0
                width: 300
                height: 25
                text: textInput1.placeholderText
                font.family: "Arial"
                verticalAlignment: Text.AlignTop
                font.pixelSize: 18
                color: "#aaa"
                visible: !textInput1.text && !textInput1.activeFocus
            }
        }

        TextInput {
            id: textInput2
            width: 300
            height: 25
            font.family: "Arial"
            anchors.top: textInput1.bottom
            anchors.topMargin: 25
            inputMethodHints: Qt.ImhFormattedNumbersOnly
            anchors.left: parent.left
            anchors.leftMargin: 22
            font.pixelSize: 18
            property string placeholderText: "Telefonnummer"

            Text {
                y: 0
                width: 300
                height: 25
                text: textInput2.placeholderText
                font.family: "Arial"
                verticalAlignment: Text.AlignTop
                font.pixelSize: 18
                color: "#aaa"
                visible: !textInput2.text && !textInput2.activeFocus
            }
        }

        TextInput {
            id: textInput3
            width: 300
            height: 25
            font.family: "Arial"
            anchors.top: textInput2.bottom
            anchors.topMargin: 25
            inputMethodHints: Qt.ImhDate
            anchors.left: parent.left
            anchors.leftMargin: 22
            font.pixelSize: 18
            property string placeholderText: "Geburtsdatum"

            Text {
                y: 0
                width: 300
                height: 25
                text: textInput3.placeholderText
                verticalAlignment: Text.AlignTop
                font.pixelSize: 18
                color: "#aaa"
                visible: !textInput3.text && !textInput3.activeFocus
            }
        }
    }
}
