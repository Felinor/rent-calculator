import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15

Window {
    width: 640
    height: 580
    visible: true
    title: qsTr("Rent Calculator")

    property var summ: parseFloat(text_field_1.text) + parseFloat(text_field_2.text)
                       + parseFloat(text_field_3.text) + parseFloat(text_field_4.text)
                       + parseFloat(text_field_5.text) + parseFloat(text_field_6.text)
                       + parseFloat(text_field_7.text) + parseFloat(text_field_8.text)

    //onSummChanged: summField.text = (summField.text !== "NaN" ) ? "Итог" : summ

    Grid {
        id: grid
        anchors.centerIn: parent
        columns: 2
        spacing: 10
        horizontalItemAlignment: Qt.AlignRight
        verticalItemAlignment: Qt.AlignVCenter

        Text { text: "T1" }

        CustomTextField {
            id: text_field_1
            setPlaceholderText: "T1"
        }

        Text { text: "T2" }

        CustomTextField {
            id: text_field_2
            setPlaceholderText: "T2"
        }

        Text { text: "T3" }

        CustomTextField {
            id: text_field_3
            setPlaceholderText: "T3"
        }

        Text { text: "SUMM" }

        CustomTextField {
            id: text_field_4
            maximumLength: 8
            setPlaceholderText: "SUMM"
        }

        Text { text: "ХВС" }

        CustomTextField {
            id: text_field_5
            setPlaceholderText: "ХВС"
        }

        Text { text: "ГВС" }

        CustomTextField {
            id: text_field_6
            setPlaceholderText: "ГВС"
        }

        Text { text: "Водоотвод" }

        CustomTextField {
            id: text_field_7
            setPlaceholderText: "Водоотвод"
        }

        Text { text: "Рента" }

        CustomTextField {
            id: text_field_8
            setPlaceholderText: "Рента"
        }
    }

    Row {
        anchors.top: grid.bottom
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.topMargin: 40
        spacing: 10

        Text { text: "Итог" }

        CustomTextField {
            id: summField
            readOnly: true
            maximumLength: 10
            activeFocusOnPress: false
            setPlaceholderText: "Итог"
            text: summ
        }
    }
}
