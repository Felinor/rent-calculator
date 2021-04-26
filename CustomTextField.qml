import QtQuick 2.15
import QtQuick.Controls 2.15

TextField {
    property string setPlaceholderText
    maximumLength: 10
    placeholderText: setPlaceholderText
    validator: RegExpValidator{regExp: /^\d+(\.\d{1,4})?$/}
}
