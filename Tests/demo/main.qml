import Qt 4.7
import "qmls"

Item {
    id: screen; width: 1024; height: 600
    property bool inSelectedView : false

    // Status Bar
    //
    Item {
        id: statusBar
        width: parent.width
        height: statusBarImage.height
        z: 2

        Image {
            id: statusBarImage
            source: "qmls/item/images/status_bar.png"
        }
    }

    // Main View
    //
    Item {
        id: mainView
        width: parent.width
        anchors.top: statusBar.bottom; anchors.bottom: parent.bottom
        z: 1

        Image {
            id: backgroundImage
            source: "file:///home/gao/taomi/Tests/demo/images/background.png"
        }

        // 菜类列的ListView
        //
        ListView {
            id: listView
            anchors.fill: parent
            model: CategoryModel {}
            delegate: CategoryDelegate{}
            orientation: ListView.Horizontal
        }
    }

    // Switch Button
    //
    Item {
        id: switchButton
        x: 987
        y: 270
        width: switchButtonImage.width
        height: switchButtonImage.height
        z: 3

        Image {
            id: switchButtonImage
            source: "file:///home/gao/taomi/Tests/demo/images/switchbutton.png"
        }
    }

    MouseArea {
        id: switchMouse
        anchors.fill: switchButton
        z: 4
        onClicked: {
            if (screen.inSelectedView == true) {
                screen.inSelectedView = false
            } else {
                screen.inSelectedView = true
            }
        }
    }

    Item {
        id: selectedView
        width: parent.width
        anchors.top: statusBar.bottom; anchors.bottom: parent.bottom
        anchors.left: mainView.right
        z: 1

        Rectangle {
            width: parent.width
            height: parent.height
            color: "#343434";

            Image {
                source: "file:///home/gao/taomi/Tests/demo/images/stripes.png"
                fillMode: Image.Tile
                anchors.fill: parent
                opacity: 0.3
            }
        }
    }

    states: [
        State {
            name: "MainView"; when: screen.inSelectedView == false
            PropertyChanges { target: mainView; x: 0 }
            PropertyChanges { target: selectedView; x: parent.width }
            PropertyChanges { target: switchButton; x: 987 }
        },
        State {
            name: "SelectedView"; when: screen.inSelectedView == true
            PropertyChanges { target: mainView; x: -parent.width }
            PropertyChanges { target: selectedView; x: 0 }
            PropertyChanges { target: switchButton; x: -36 }
        }
    ]

    transitions: [
        Transition {
            from: 'MainView'; to: 'SelectedView'
                NumberAnimation {
                    target: mainView
                    properties: 'x'
                    duration: 900
                    easing.type: Easing.InOutQuad
                }
                NumberAnimation {
                    target: switchButton
                    properties: 'x'
                    duration: 900
                    easing.type: Easing.InOutQuad
                }
        },

        Transition {
            from: 'SelectedView'; to: 'MainView'
                NumberAnimation {
                    target: mainView
                    properties: 'x'
                    duration: 900
                    easing.type: Easing.InOutQuad
                }
                NumberAnimation {
                    target: switchButton
                    properties: 'x'
                    duration: 900
                    easing.type: Easing.InOutQuad
                }
        }
    ]
}
