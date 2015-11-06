import QtQuick 2.0

Rectangle {
    id: rectDelegate
//    border.color: "green"
    color: "transparent"

    signal userClicked();

    Rectangle{
        anchors.centerIn: parent
        width: parent.width*95/100
        height: parent.height*95/100
        color: "transparent"

        Image {
            id: name
            source: "qrc:///images/Penguins.jpg"
            width: parent.width
            height: parent.height * 75/100
            anchors.top: parent.top
            fillMode: Image.PreserveAspectFit
        }

        Text {
            id: inText
            text: fileName
            font.bold: true
            color: "green"
            anchors.bottom: parent.bottom
            anchors.horizontalCenter: parent.horizontalCenter
            width: parent.width
            wrapMode:Text.WordWrap
        }

    }

    MouseArea{
        anchors.fill: parent
        onClicked: {
            userClicked();
        }
    }
}
