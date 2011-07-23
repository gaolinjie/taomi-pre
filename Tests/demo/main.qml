import Qt 4.7
import "qmls"

Rectangle {
    id: screen
    width: 1024
    height: 600

    Image {
        id: background
        // 因为此qml文件在qrc资源系统中，若使用相对路径则会在qrc资源系统搜寻本图片，
        // 所以访问本地文件必须使用绝对路径
        source: "file:///home/gao/taomi/Tests/demo/images/background.png"
        anchors.fill: parent
        fillMode: Image.PreserveAspectCrop
        anchors.centerIn: parent
    }

    Component {
        id: itemDelegate

        Item {
            id: itemRow
            width: 310; height: 200
            y: 28

           Row {
                anchors.verticalCenter: parent.verticalCenter
                anchors.fill: parent

                BorderImage {
                    anchors.fill: pic
                    anchors { leftMargin: -6; topMargin: -6; rightMargin: -8; bottomMargin: -8 }
                    border { left: 10; top: 10; right: 10; bottom: 10 }
                    source: "images/shadow.png"; smooth: true
                }

                Image {
                    id: pic
                    source: ipic
                    sourceSize.width: 288
                    sourceSize.height: 180
                    smooth: true
                    anchors.centerIn: parent

                }
           }
        }
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
                   id: xx
                   width: 310; height: 600
                   color: "black"
                   opacity: 0.4
/*
                   gradient: Gradient {
                       GradientStop { position: 0.0;
                                      color: "darkolivegreen" }
                       GradientStop { position: 0.8; color: "darkseagreen" }
                       GradientStop { position: 1.0; color: "darkslategray" }
                   }*/

                   BorderImage {
                       anchors.fill: xx
                       anchors { leftMargin: -6; topMargin: -6; rightMargin: -8; bottomMargin: -8 }
                       border { left: 10; top: 10; right: 10; bottom: 10 }
                       source: "images/shadow.png"; smooth: true
                   }
               }

               Rectangle {
                   width: 310; height: 40
                   color: "black"
                   gradient: Gradient {
                       GradientStop { position: 0.0;
                                      color: Qt.rgba(0.5,0.5,0.5,0.5) }
                       GradientStop { position: 0.8; color: "black" }
                       GradientStop { position: 1.0; color: "black" }
                   }

                   Text {
                       anchors.centerIn: parent
                       text: category
                       color: "white"
                   }
               }

               ListView {
                   id: picsView
                   anchors.fill: parent
                   model: ItemModel {}
                   delegate: itemDelegate
                   orientation: ListView.Vertical
               }
            }
        }
    }

    ListView {
        id: listView
        anchors.fill: parent
        model: CategoryModel {}
        delegate: categoryDelegate
        orientation: ListView.Horizontal
    }
}
