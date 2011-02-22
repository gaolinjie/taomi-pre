import Qt 4.7

Rectangle {
    signal close()

    id: screen
    width: 1024
    height: 600

    Image {
        id: background
        source: "images/background.png"
        anchors.fill: parent
        fillMode: Image.PreserveAspectCrop
        anchors.centerIn: parent
    }

    Image {
        id: colosebutton
        source: "images/closebutton.png"
        x: 992 // 绝对偏移，最好改为相对值

        MouseArea {
        anchors.fill: parent
        onClicked: close();
        }
    }
}
