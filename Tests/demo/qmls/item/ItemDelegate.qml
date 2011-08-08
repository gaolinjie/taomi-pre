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
                id:priceText
                anchors.right: pic.right
                y: pic.y - 20
                text: iprice
                color: "white"
                font.bold: true
                smooth: true
            }

            Image {
                id: acceptedIcon
                source: "images/accepted.png"
                smooth: true
                anchors.bottom: priceText.bottom
                anchors.right: priceText.left
                visible: acceptIcon.accepted
                sourceSize.width: 24
                sourceSize.height: 14
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

                Rectangle {
                    id: detail
                    x: pic.x + 55
                    y: pic.y + 75
                    width: 350; height: 100
                    radius: 10
                    color: "#3b5998"
                    opacity: 0.8
                    visible: false

                    Text {
                        x: pic.x + 20
                        y: pic.y + 30
                        text: item
                        font.pointSize: 22
                        color: "white"
                        smooth: true
                        font.family: "Monospace"
                        font.bold: true
                    }

                    Text {
                        x: pic.x + 20
                        y: pic.y + 70
                        text: "RMB: " + iprice + " 元/例"
                        font.pointSize: 12
                        color: "white"
                        smooth: true
                    }
                }

                Image {
                    id: addIcon
                    source: "images/add.png"
                    smooth: true
                    x: pic.x + 950
                    y: pic.y + 528
                    visible: false
                }

                Image {
                    id: acceptIcon
                    source: "images/accept.png"
                    smooth: true
                    x: pic.x + 950
                    y: pic.y + 528
                    visible: false
                    property bool accepted : false
                }

                MouseArea {
                    id: acceptMouse
                    z: 5
                    anchors.fill: acceptIcon
                    onClicked: {
                        if (acceptIcon.accepted) {
                            addIcon.visible = true;
                            acceptIcon.visible = false;
                        } else {
                            addIcon.visible = false;
                            acceptIcon.visible = true;
                        }
                        acceptIcon.accepted = !acceptIcon.accepted;
                    }
                }

                MouseArea {
                    id: picMouse
                    anchors.fill: parent
                    z: 4
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
                        PropertyChanges { target: detail; visible: false }
                        PropertyChanges { target: addIcon; visible: false }
                    },
                    State {
                        name: 'popup'
                        ParentChange { target: pic; parent: mainView}
                        PropertyChanges { target: pic; width: 1024; height: 600;
                                          sourceSize.width: 820; sourceSize.height: 547 }
                        PropertyChanges { target: detail; visible: true }
                        PropertyChanges { target: addIcon; visible: true}
                    }
                ]

                transitions: [
                    Transition {
                        from: 'list'; to: 'popup'
                            NumberAnimation {
                                target: pic
                                properties: 'width, height'
                                duration: 600; easing.type: 'OutQuart'//OutBack'
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
