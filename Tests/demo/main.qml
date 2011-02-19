import Qt 4.7

Rectangle {
    id: screen
    width: 1024
    height: 600



        Image {
            id: background
            anchors.fill: parent
            source: "images/background.png"
            fillMode: Image.PreserveAspectCrop
            anchors.centerIn: parent
        }

}
