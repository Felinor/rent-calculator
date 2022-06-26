import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import Qt.labs.settings 1.0

ApplicationWindow {
    width: 640
    height: 580
    minimumWidth: 540
    minimumHeight: 480
    visible: true
    flags: Qt.Dialog
    title: qsTr("Rent Calculator")
    background: Image { source: "qrc:/backgroundImage.jpg" }

    Settings {
        category: "General"

        property alias electricity: electricity.text
        property alias coldWater: coldWater.text
        property alias hotWater: hotWater.text
        property alias canalization: canalization.text
        property alias rent: rent.text
        property alias amountOfPeople: amountOfPeople.text
        property alias householdExpenses: householdExpenses.text
        property alias totalField: totalField.text
    }

    property double sum: (parseFloat(electricity.text)
                        + parseFloat(coldWater.text)
                        + parseFloat(hotWater.text)
                        + parseFloat(canalization.text)
                        + parseFloat(rent.text))
                        / parseFloat(amountOfPeople.text)

    property double personalSum: sum - (parseFloat(householdExpenses.text)
                                        - (parseFloat(householdExpenses.text) / parseFloat(amountOfPeople.text)))

    property double theirSum: sum + (parseFloat(householdExpenses.text) / parseFloat(amountOfPeople.text))

    Grid {
        id: grid
        anchors.centerIn: parent
        columns: 2
        spacing: 10
        horizontalItemAlignment: Qt.AlignRight
        verticalItemAlignment: Qt.AlignVCenter                

        CustomText { text.text: "Электричество" }

        CustomTextField { id: electricity }

        CustomText { text.text: "ХВС" }

        CustomTextField { id: coldWater }

        CustomText { text.text: "ГВС" }

        CustomTextField { id: hotWater }

        CustomText { text.text: "Водоотвод" }

        CustomTextField { id: canalization }

        CustomText { text.text: "Бытовые расходы" }

        CustomTextField { id: householdExpenses }

        CustomText { text.text: "Рента" }

        CustomTextField { id: rent }

        CustomText { text.text: "Кол-во человек" }

        CustomTextField { id: amountOfPeople }

        CustomText { text.text: "Итог личный"; text.font.pointSize: 14; text.color: totalField.color }

        CustomTextField {
            readOnly: true
            maximumLength: 10
            activeFocusOnPress: false
            text: Number.isNaN(personalSum) || personalSum <= 0 || personalSum === Infinity ? 0 : personalSum
            color: "#AA1945"
            font.pointSize: 14
        }

        CustomText { text.text: "Итог"; text.font.pointSize: 14; text.color: totalField.color }

        CustomTextField {
            id: totalField
            readOnly: true
            maximumLength: 10
            activeFocusOnPress: false
            text: Number.isNaN(theirSum) || theirSum === Infinity ? 0 : theirSum
            color: "#AA1945"
            font.pointSize: 14
        }
    }
}
