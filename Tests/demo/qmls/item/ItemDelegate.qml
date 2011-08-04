import QtQuick 1.0

// 菜式行的ListView代理
//
Component {
    id: itemDelegate

    Item {
       id: itemRow
       width: 310; height: 200

       Row {
           id: foodItem
            anchors.verticalCenter: parent.verticalCenter
            anchors.fill: parent

            BorderImage {
                anchors.fill: pic
                anchors { leftMargin: -6; topMargin: -6; rightMargin: -8; bottomMargin: -8 }
                border { left: 10; top: 10; right: 10; bottom: 10 }
                source: "images/shadow.png"; smooth: true
            }

            Text {
                anchors.left: pic.left
                y: pic.y - 20
                text: item
                color: "white"
                font.bold: true
                smooth: true
            }

            Text {
                anchors.right: pic.right
                y: pic.y - 20
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
                width: 288
                height: 160
                smooth: true
                anchors.centerIn: parent
                state: 'list'

                MouseArea {
                    id: mouseArea
                    anchors.fill: parent
                    onClicked: {
                        if (pic.state == 'list') {
                            pic.state = 'popup'
                        } else {
                            pic.state = 'list'
                        }
                    }
                }

                states: [
                    State {
                        name: 'list'
                        ParentChange { target: pic; parent: foodItem}
                        PropertyChanges { target: pic; width: 288; height: 160;
                                          sourceSize.width: 288; sourceSize.height: 160}
                    },
                    State {
                        name: 'popup'
                        ParentChange { target: pic; parent: mainView}
                        PropertyChanges { target: pic; width: 1024; height: 600;
                                          sourceSize.width: 820; sourceSize.height: 547 }
                    }
                ]

                transitions: [
                    Transition {
                        from: 'list'; to: 'popup'
                            NumberAnimation {
                                target: pic
                                properties: 'width, height'
                                duration: 600; easing.type: 'OutBack'
                            }
                    },

                    Transition {
                        from: 'popup'; to: 'list'
                            NumberAnimation {
                                target: pic
                                properties: 'width, height'
                                duration: 600; easing.type: 'OutQuart'
                            }
                    }
                ]
            }
       }
    }
}
