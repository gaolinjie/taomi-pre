import QtQuick 1.0
import "item"

// 类别列的ListView代理
//
Component {
    id: categoryDelegate

    Item {
        id: categoryColumn
        width: 360; height: 575

       Column {
           anchors.horizontalCenter: parent.horizontalCenter
           anchors.fill: parent

           Rectangle {
               id: titleBar
               width: 310; height: 40
               z: 3
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

           Rectangle {
               id: categoryView
               width: 310; height: 535
               z: 1

               color: "black"
               opacity: 0.4

               BorderImage {
                   anchors.fill: categoryView
                   anchors { leftMargin: -6; topMargin: -6; rightMargin: -8; bottomMargin: -8 }
                   border { left: 10; top: 10; right: 10; bottom: 10 }
                   source: "item/images/shadow.png"; smooth: true
               }
           }

           // 菜式行的ListView
           //
           ListView {
               id: picsView
               z: 2
               anchors.fill: categoryView
               anchors.top: titleBar.bottom
               model: ItemModel {}
               delegate: ItemDelegate{}
               orientation: ListView.Vertical
           }
        }
    }
}
