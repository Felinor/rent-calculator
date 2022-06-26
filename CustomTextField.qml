import QtQuick 2.15
import QtQuick.Controls 2.15

TextField {
    text: "0"
    font.bold: true
    font.pointSize: 12
    maximumLength: 10
    selectByMouse: true
    validator: RegExpValidator{regExp: /^\d+(\.\d{1,4})?$/}
    onFocusChanged: if (focus) selectAll()    
}
