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

        CustomText { text: "Электричество" }

        CustomTextField { id: electricity }

        CustomText { text: "ХВС" }

        CustomTextField { id: coldWater }

        CustomText { text: "ГВС" }

        CustomTextField { id: hotWater }

        CustomText { text: "Водоотвод" }

        CustomTextField { id: canalization }

        CustomText { text: "Бытовые расходы" }

        CustomTextField { id: householdExpenses }

        CustomText { text: "Рента" }

        CustomTextField { id: rent }

        CustomText { text: "Кол-во человек" }

        CustomTextField { id: amountOfPeople }

        CustomText { text: "Итог личный"; font.pointSize: 14; color: totalField.color }

        CustomTextField {
            readOnly: true
            maximumLength: 10
            activeFocusOnPress: false
            text: Number.isNaN(personalSum) || personalSum <= 0 || personalSum === Infinity ? 0 : personalSum
            color: "#AA1945"
            font.pointSize: 14
        }

        CustomText { text: "Итог"; font.pointSize: 14; color: totalField.color }

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
