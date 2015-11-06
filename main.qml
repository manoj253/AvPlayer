import QtQuick 2.5
import  QtQuick.Controls 1.4
import QtQuick.Dialogs 1.0
import QtMultimedia 5.5
import QtQuick.Window 2.2
//import Life.Plank.Media 1.0


ApplicationWindow{
    visible: true
    width: 640
    height: 480

    Rectangle{
        id:rect1
        width:parent.width
        height:parent.height *10/100
        border.color: "black"
        anchors.top: parent.top

        Text {
            id: title
            text: qsTr("PLANK")
            anchors.centerIn: parent
            font.bold: true
            font.pixelSize: 30
        }
    }

    Rectangle{
        id:rect2
        width:parent.width *40/100
        height:parent.height *90/100
        border.color: "red"
        anchors.top: rect1.bottom


        GridView {
            id: foldersGrid
            anchors.fill: parent
            cellWidth: width/3
            cellHeight: height/5

            model: FolderModel {}

            delegate: GridItem{
                width: foldersGrid.cellWidth
                height: foldersGrid.cellHeight
                color: (index%2) == 0 ? "lightgray" : "darkgray"
                onUserClicked: {
                    console.log(fileName)
                    console.log(fileURL)
                    mediaPlayer.source =  fileURL;
                    mediaPlayer.play();
                }
            }
        }
    }

    Rectangle{
        id:rect3
        width: parent.width *60/100
        height:parent.height *30/100
        border.color: "black"
        anchors.top: rect1.bottom
        anchors.right:rect1.right

        FileDialog {
            id:  fbrowser
            title:  "Please select a media file"
        }

        Row {
            id:  buttonRow

            Button {
                id:  goButton
                text: "Start"
                onClicked:  {
                    mediaPlayer.source =  playFilePath.text;
                    mediaPlayer.play();
                }
            }

            Button {
                id: stopButton
                text: "Stop"
                onClicked: {mediaPlayer.stop(); }
            }

            Button {
                id:  chooseFileButton
                text: "Select Media File..."
                onClicked: {fbrowser.open();}
            }

            TextField {
                id:  playFilePath
                width: 450
                text:  fbrowser.fileUrl
            }
        }
    }

    Rectangle{
        id:rect4
        width: parent.width *60/100
        height:parent.height *30/100
        border.color: "black"
        anchors.top: rect3.bottom
        anchors.right:rect1.right

        Rectangle{
            id:  videoRect
            width:parent.width *90/100
            height:parent.height *80/100
            border.color:"black"
            anchors.centerIn: parent
            color:"black"

            Video {
                id: mediaPlayer
                fillMode: VideoOutput.Stretch
                focus: true
                anchors.fill: parent
            }

        }
    }
    Rectangle{
        id:rect5
        width: parent.width *60/100
        height:parent.height *30/100
        border.color: "black"
        anchors.top: rect4.bottom
        anchors.right:rect1.right
        onCreationCompleted: {
           //you need a tmp variable, since you can't do that with property variant
           var imagesTmp = Array();
            for (var n = 0; n < 3 * numberOfTiles; n ++) {
                imagesTmp[n] = imageDefinition.createObject()
                imagesTmp[n].translationX = getX(n);
                imagesTmp[n].translationY = getY(n);
                drawContainer.add(imagesTmp[n]);
            }
            images = imagesTmp;
            images[3].translationX = 10; //as example, this works!
        }

    }
}
