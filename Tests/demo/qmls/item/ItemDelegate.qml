import QtQuick 1.0

// 菜式行的ListView代理
//
Component {
    id: itemDelegate

    Item {
       id: itemRow
       width: 310; height: 200

       Row {
            anchors.verticalCenter: parent.verticalCenter
            anchors.fill: parent

            BorderImage {
                anchors.fill: pic
                anchors { leftMargin: -6; topMargin: -6; rightMargin: -8; bottomMargin: -8 }
                border { left: 10; top: 10; right: 10; bottom: 10 }
                source: "images/shadow.png"; smooth: true
            }

            Text {
                anchors.bottom: pic.top
                anchors.left: pic.left
                text: item
                color: "white"
                font.bold: true
                smooth: true
            }

            Text {
                anchors.bottom: pic.top
                anchors.right: pic.right
                text: iprice
                color: "white"
                font.bold: true
                smooth: true
            }

            Image {
                id: pic
                source: ipic
                sourceSize.width: 288
                sourceSize.height: 160
                smooth: true
                anchors.centerIn: parent
            }
       }
    }
}
