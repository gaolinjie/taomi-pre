import Qt 4.7
import "qmls"

Item {
    id: screen; width: 1024; height: 600

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
}
