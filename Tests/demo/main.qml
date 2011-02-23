import Qt 4.7
import "qmls"

Rectangle {
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

    Component {
        id: categoryDelegate

        Item {
            id: categoryColumn
            width: 360; height: 600
            y: 28

           Column {
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.fill: parent

               Rectangle {
                   width: 310; height: 600
                   color: "black"
                   opacity: 0.6
                   border.color: "white"

                   Rectangle {
                       width: 310; height: 40
                       color: "black"
                       gradient: Gradient {
                           GradientStop { position: 0.0; color: Qt.rgba(0.5,0.5,0.5,0.5) }
                           GradientStop { position: 0.8; color: "black" }
                           GradientStop { position: 1.0; color: "black" }
                       }

                       Text {
                           anchors.centerIn: parent
                           text: name
                           color: "white"
                       }
                   }
               }
            }
        }
    }

    ListView {
        id: listView
        anchors.fill: parent;
        model: CategoryModel {}
        delegate: categoryDelegate
        orientation: ListView.Horizontal
    }
}
