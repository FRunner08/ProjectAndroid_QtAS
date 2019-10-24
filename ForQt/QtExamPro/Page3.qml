// Map
import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.12
import QtLocation 5.12
import QtPositioning 5.12


Page3Form {

    Map {
        id: map
        anchors.fill: parent
        activeMapType: map.supportedMapTypes[5]
        zoomLevel: 9
        center: QtPositioning.coordinate(50.9852, 11.0423)
        plugin: Plugin {
            name: 'osm';
        }
    }
}
