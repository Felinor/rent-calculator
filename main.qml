import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15

ApplicationWindow {
    width: 640
    height: 580
    minimumWidth: 540
    minimumHeight: 480
    visible: true
    flags: Qt.Dialog
    title: qsTr("Rent Calculator")
    background: Image { source: "qrc:/backgroundImage.jpg" }

    property var summ: (parseFloat(text_field_4.text)
                        + parseFloat(text_field_5.text)
                        + parseFloat(text_field_6.text)
                        + parseFloat(text_field_7.text)
                        + parseFloat(text_field_8.text))
                        / parseFloat(text_field_2.text)

    property var personSumm: summ - (parseFloat(text_field_1.text) - (parseFloat(text_field_1.text) / parseFloat(text_field_2.text)))

    property var otherSumm: summ + (parseFloat(text_field_1.text) / parseFloat(text_field_2.text))

    Grid {
        id: grid
        anchors.centerIn: parent
        columns: 2
        spacing: 10
        horizontalItemAlignment: Qt.AlignRight
        verticalItemAlignment: Qt.AlignVCenter                

        CustomText { text: "Электричество" }

        CustomTextField { id: text_field_4 }

        CustomText { text: "ХВС" }

        CustomTextField { id: text_field_5 }

        CustomText { text: "ГВС" }

        CustomTextField { id: text_field_6 }

        CustomText { text: "Водоотвод" }

        CustomTextField { id: text_field_7 }

        CustomText { text: "Бытовые расходы" }

        CustomTextField { id: text_field_1 }

        CustomText { text: "Рента" }

        CustomTextField { id: text_field_8 }        

        CustomText { text: "Кол-во человек" }

        CustomTextField { id: text_field_2 }

        CustomText { text: "Итог личный"; font.pointSize: 14; color: totalField.color }

        CustomTextField {
            id:  text_field_3
            readOnly: true
            maximumLength: 10
            activeFocusOnPress: false
            placeholderText: "Итог личный"
            text: Number.isNaN(personSumm) || personSumm <= 0 || personSumm === Infinity ? 0 : personSumm
            color: "#AA1945"
            font.pointSize: 14
        }

        CustomText { text: "Итог"; font.pointSize: 14; color: totalField.color }

        CustomTextField {
            id: totalField
            readOnly: true
            maximumLength: 10
            activeFocusOnPress: false
            placeholderText: "Итог"
            text: Number.isNaN(otherSumm) || otherSumm === Infinity ? 0 : otherSumm
            color: "#AA1945"
            font.pointSize: 14
        }
    }
}
