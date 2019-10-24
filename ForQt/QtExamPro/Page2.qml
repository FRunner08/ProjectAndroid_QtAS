// Liste
import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12
import QtQuick.Window 2.12

import ToDo 1.0

ColumnLayout {
    anchors.top: parent.top
    anchors.topMargin: 25
    anchors.horizontalCenter: parent.horizontalCenter
    //Layout.fillWidth: true
    width: parent.width

    RowLayout {
        spacing: 10
        Button {
            id: button1
            text: qsTr("Add Item")
            font.capitalization: Font.AllUppercase
            font.family: "Arial"
            font.bold: true
            font.pointSize: 12
            onClicked: liste.appendItem()
            Layout.fillWidth: true
        }

        Button {
            id: button2
            text: qsTr("Remove Done Item")
            font.capitalization: Font.AllUppercase
            font.family: "Arial"
            font.bold: true
            font.pointSize: 12
            onClicked: liste.removeDoneItems()
            Layout.fillWidth: true
        }
    }

    Frame {
        Layout.fillWidth: true

        ListView {
            id: listView
            implicitHeight: 500
            implicitWidth: 250
            clip: true
            anchors.fill: parent
            spacing: 10

            model: ListModel {
                list: liste
            }

            delegate: RowLayout {
                width: parent.width

                CheckBox {
                    checked: model.done
                    onClicked: model.done = checked
                }

                TextField {
                    text: model.description
                    onEditingFinished: model.description = text
                    Layout.fillWidth: true
                }
            }
        }
    }
}
