import QtQuick 2.15

Rectangle {
    property alias text: text

    width: text.width + 10
    height: text.height
    radius: 2

    Text {
        id: text
        anchors.centerIn: parent
        color: "#22282E"
        font.bold: true
        font.pointSize: 12
    }
}
