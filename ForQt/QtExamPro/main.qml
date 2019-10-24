import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.3
import QtQuick.Window 2.12
import QtQuick.Controls.Styles 1.4
import QtQuick.Dialogs 1.2

import ToDo 1.0

ApplicationWindow {
    visible: true
    width: 500
    height: 600

    title: qsTr("Tabs")

    SwipeView {
        id: swipeView
        anchors.fill: parent
        currentIndex: tabBar.currentIndex

        Page1 {
        }

        Page2Form {
            Page2 {
            }
        }

        Page3 {
        }

        Page4 {
        }
    }

    footer: TabBar {
        id: tabBar
        currentIndex: swipeView.currentIndex

        TabButton {
            text: qsTr("Start")
        }
        TabButton {
            text: qsTr("Liste")
        }
        TabButton {
            text: qsTr("Karte")
        }
        TabButton {
            text: qsTr("Formular")
        }
    }

}
