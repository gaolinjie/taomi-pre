import Qt 4.7

/*
 *  ui.qml
 */
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
            source: "file:///home/gao/taomi/Tests/demo/icons/status_bar.png"
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
            model: categoryModel
            delegate: categoryDelegate
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
            source: "file:///home/gao/taomi/Tests/demo/icons/switchbutton.png"
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
                source: "file:///home/gao/taomi/Tests/demo/icons/stripes.png"
                fillMode: Image.Tile
                anchors.fill: parent
                opacity: 0.3
            }
        }

        GridView {
            id: selectedGridView
            anchors.centerIn: parent
            model: selectedModel
            delegate: selectedDelegate
            cacheBuffer: 100
            cellWidth: 341
            cellHeight: 200
            width: 1024
            height: 600
        }
    }

    states: [
        State {
            name: "MainView"; when: screen.inSelectedView == false
            PropertyChanges { target: mainView; x: 0 }
            PropertyChanges { target: selectedView; x: parent.width }
            PropertyChanges { target: switchButton; x: 988 }
        },
        State {
            name: "SelectedView"; when: screen.inSelectedView == true
            PropertyChanges { target: mainView; x: -parent.width }
            PropertyChanges { target: selectedView; x: 0 }
            PropertyChanges { target: switchButton; x: -37 }
        }
    ]

    transitions: [
        Transition {
            from: 'MainView'; to: 'SelectedView'
                NumberAnimation {
                    target: mainView
                    properties: 'x'
                    duration: 900
                    easing.type: Easing.OutQuart
                }
                NumberAnimation {
                    target: switchButton
                    properties: 'x'
                    duration: 900
                    easing.type: Easing.OutQuart
                }
        },

        Transition {
            from: 'SelectedView'; to: 'MainView'
                NumberAnimation {
                    target: mainView
                    properties: 'x'
                    duration: 900
                    easing.type: Easing.OutQuart
                }
                NumberAnimation {
                    target: switchButton
                    properties: 'x'
                    duration: 900
                    easing.type: Easing.OutQuart
                }
        }
    ]

    /*
     *  Categorydelegate.qml
     */
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
                        font.bold: true
                        smooth: true
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
                        source: "file:///home/gao/taomi/Tests/demo/icons/shadow.png"; smooth: true
                    }
                }

                // 菜式行的ListView
                //
                ListView {
                    id: picsView
                    z: 2
                    anchors.fill: categoryView
                    anchors.top: titleBar.bottom
                    model: itemModel
                    delegate: itemDelegate
                    orientation: ListView.Vertical
                }

                /*
                 *  ItemDelegate.qml
                 */
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
                                source: "file:///home/gao/taomi/Tests/demo/icons/shadow.png"; smooth: true
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
                                source: "file:///home/gao/taomi/Tests/demo/icons/accepted.png"
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
                                    color: "#222"//"#3b5998"
                                    opacity: 0.8
                                    visible: false

                                    Image {
                                        id: rect
                                        source: "file:///home/gao/taomi/Tests/demo/icons/rect.png"
                                        anchors.fill: parent
                                        smooth: true
                                        x: 0
                                        y: 0
                                    }

                                    Text {
                                        x: pic.x + 20
                                        y: pic.y + 30
                                        text: item
                                        font.pointSize: 22
                                        color: "white"
                                        smooth: true
                                        font.family: "Times New Roman"
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
                                    source: "file:///home/gao/taomi/Tests/demo/icons/add.png"
                                    smooth: true
                                    x: pic.x + 950
                                    y: pic.y + 528
                                    visible: false
                                }

                                Image {
                                    id: acceptIcon
                                    source: "file:///home/gao/taomi/Tests/demo/icons/accept.png"
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

                                    // 删除选中的菜式
                                    function removeSelectedItem() {
                                        var i = 0;
                                        while (selectedModel.get(i).item != item)
                                        {
                                            i++;
                                        }
                                        selectedModel.remove(i);
                                    }

                                    onClicked: {
                                        if (acceptIcon.accepted) {
                                            addIcon.visible = true;
                                            acceptIcon.visible = false;
                                            removeSelectedItem();
                                        } else {
                                            addIcon.visible = false;
                                            acceptIcon.visible = true;
                                            selectedModel.append({"iid": iid,
                                                                 "item": item,
                                                                 "ipic": ipic,
                                                                 "iprice": iprice,
                                                                 "iorder": iorder,
                                                                 "icid": icid});
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

                /*
                 *  ItemModel.qml
                 */
                /* 菜式数据模型的数据从DemoDB数据库的Items表中读取 */
                ListModel {
                    id: itemModel
                    Component.onCompleted: loadItemData()
                    Component.onDestruction: saveItemData()
                    function loadItemData() {
                        var db = openDatabaseSync("DemoDB", "1.0", "Demo Model SQL", 50000);
                        db.transaction(
                            function(tx) {
                                // Create the database if it doesn't already exist
                                //
                                tx.executeSql('CREATE TABLE IF NOT EXISTS Items(iid INTEGER primary key, item TEXT, ipic TEXT, iorder INTEGER, icid INTEGER, FOREIGN KEY(icid) REFERENCES Categorys(cid))');

                                var rs = tx.executeSql('SELECT * FROM Items WHERE icid = ?', [cid]);
                                var index = 0;
                                if (rs.rows.length > 0) {
                                    var index = 0;
                                    while (index < rs.rows.length) {
                                        var myItem = rs.rows.item(index);
                                        itemModel.append({"iid": myItem.iid,
                                                              "item": myItem.item,
                                                              "ipic": myItem.ipic,
                                                              "iprice": myItem.iprice,
                                                              "iorder": myItem.iorder,
                                                              "icid": myItem.icid});
                                        index++;
                                    }
                                } else {
                                    // 仅执行一次，用于向数据库中插入菜式数据
                   /*                itemModel.append({"iid": 1,
                                                          "item": 'Almond Cookies',
                                                          "ipic": 'file:///home/gao/taomi/Tests/demo/images/AlmondCookies.jpg',
                                                          "iprice": 18.0,
                                                          "iorder": 1,
                                                          "icid": 1});
                                    itemModel.append({"iid": 2,
                                                          "item": 'Asian Noodle',
                                                          "ipic": 'file:///home/gao/taomi/Tests/demo/images/asian_noodle_soup.jpg',
                                                     "iprice": 12.5,
                                                          "iorder": 3,
                                                          "icid": 1});
                                    itemModel.append({"iid": 3,
                                                          "item": 'Baba Ganoush',
                                                          "ipic": 'file:///home/gao/taomi/Tests/demo/images/baba-ganoush.jpg',
                                                     "iprice": 22.5,
                                                          "iorder": 2,
                                                          "icid": 1});
                                    itemModel.append({"iid": 4,
                                                          "item": 'Basil',
                                                          "ipic": 'file:///home/gao/taomi/Tests/demo/images/Basil.jpg',
                                                     "iprice": 15.0,
                                                          "iorder": 5,
                                                          "icid": 1});
                                    itemModel.append({"iid": 5,
                                                          "item": 'Basil Drawing',
                                                          "ipic": 'file:///home/gao/taomi/Tests/demo/images/BasilDrawing.jpg',
                                                     "iprice": 22.0,
                                                          "iorder": 4,
                                                          "icid": 1});
                                    itemModel.append({"iid": 6,
                                                          "item": 'Berry Pie',
                                                          "ipic": 'file:///home/gao/taomi/Tests/demo/images/BerryPie.jpg',
                                                     "iprice": 15.0,
                                                          "iorder": 1,
                                                          "icid": 2});
                                    itemModel.append({"iid": 7,
                                                          "item": 'Blueberry Cake',
                                                          "ipic": 'file:///home/gao/taomi/Tests/demo/images/Blueberry_cake.jpg',
                                                     "iprice": 23.0,
                                                          "iorder": 2,
                                                          "icid": 2});
                                    itemModel.append({"iid": 8,
                                                          "item": 'Blueberry Muffins',
                                                          "ipic": 'file:///home/gao/taomi/Tests/demo/images/Blueberry_muffins.jpg',
                                                     "iprice": 11.0,
                                                          "iorder": 3,
                                                          "icid": 2});
                                    itemModel.append({"iid": 9,
                                                          "item": 'Briwates',
                                                          "ipic": 'file:///home/gao/taomi/Tests/demo/images/Briwates.jpg',
                                                     "iprice": 28.5,
                                                          "iorder": 4,
                                                          "icid": 2});
                                    itemModel.append({"iid": 10,
                                                          "item": 'Briwates Recipe',
                                                          "ipic": 'file:///home/gao/taomi/Tests/demo/images/Briwates_Recipe.jpg',
                                                     "iprice": 12.0,
                                                          "iorder": 5,
                                                          "icid": 2});
                                    itemModel.append({"iid": 11,
                                                          "item": 'Butter Nut Soup',
                                                          "ipic": 'file:///home/gao/taomi/Tests/demo/images/Butter_Nut_Soup.jpg',
                                                     "iprice": 31.0,
                                                          "iorder": 1,
                                                          "icid": 3});
                                    itemModel.append({"iid": 12,
                                                          "item": 'Butternut Squash',
                                                          "ipic": 'file:///home/gao/taomi/Tests/demo/images/butternut_squash_salad.jpg',
                                                     "iprice": 12.0,
                                                          "iorder": 2,
                                                          "icid": 3});
                                    itemModel.append({"iid": 13,
                                                          "item": 'Camping Breakfast',
                                                          "ipic": 'file:///home/gao/taomi/Tests/demo/images/camping_breakfast.jpg',
                                                     "iprice": 18.5,
                                                          "iorder": 3,
                                                          "icid": 3});
                                    itemModel.append({"iid": 14,
                                                          "item": 'Breakfast Coffee',
                                                          "ipic": 'file:///home/gao/taomi/Tests/demo/images/camping_breakfast_coffee.jpg',
                                                     "iprice": 10.0,
                                                          "iorder": 4,
                                                          "icid": 3});
                                    itemModel.append({"iid": 15,
                                                          "item": 'Camping Copping',
                                                          "ipic": 'file:///home/gao/taomi/Tests/demo/images/camping_breakfast_copping.jpg',
                                                     "iprice": 28.5,
                                                          "iorder": 5,
                                                          "icid": 3});
                                    itemModel.append({"iid": 16,
                                                          "item": 'Camping Stirring',
                                                          "ipic": 'file:///home/gao/taomi/Tests/demo/images/camping_breakfast_stirring.jpg',
                                                     "iprice": 15.5,
                                                          "iorder": 1,
                                                          "icid": 4});
                                    itemModel.append({"iid": 17,
                                                          "item": 'Carrot Ginger',
                                                          "ipic": 'file:///home/gao/taomi/Tests/demo/images/Carrot-Ginger-Soup.jpg',
                                                     "iprice": 12.0,
                                                          "iorder": 2,
                                                          "icid": 4});
                                    itemModel.append({"iid": 18,
                                                          "item": 'Cheese Straws',
                                                          "ipic": 'file:///home/gao/taomi/Tests/demo/images/CheeseStraws.jpg',
                                                     "iprice": 13.5,
                                                          "iorder": 3,
                                                          "icid": 4});
                                    itemModel.append({"iid": 19,
                                                          "item": 'Chermoula Aubergine',
                                                          "ipic": 'file:///home/gao/taomi/Tests/demo/images/Chermoula_aubergine.jpg',
                                                     "iprice": 17.5,
                                                          "iorder": 4,
                                                          "icid": 4});
                                    itemModel.append({"iid": 20,
                                                          "item": 'Cherries',
                                                          "ipic": 'file:///home/gao/taomi/Tests/demo/images/Cherries.jpg',
                                                     "iprice": 22.0,
                                                          "iorder": 5,
                                                          "icid": 4});
                                    itemModel.append({"iid": 21,
                                                          "item": 'Cherry Amandines',
                                                          "ipic": 'file:///home/gao/taomi/Tests/demo/images/Cherry_amandines.jpg',
                                                     "iprice": 19.5,
                                                          "iorder": 1,
                                                          "icid": 5});
                                    itemModel.append({"iid": 22,
                                                          "item": 'Christmas Brunch',
                                                          "ipic": 'file:///home/gao/taomi/Tests/demo/images/Christmas_Brunch.jpg',
                                                     "iprice": 8.0,
                                                          "iorder": 2,
                                                          "icid": 5});
                                    itemModel.append({"iid": 23,
                                                          "item": 'Christopher Breakfast',
                                                          "ipic": 'file:///home/gao/taomi/Tests/demo/images/ChristopherBreakfast.jpg',
                                                     "iprice": 28.0,
                                                          "iorder": 3,
                                                          "icid": 5});
                                    itemModel.append({"iid": 24,
                                                          "item": 'Con Kit Kat',
                                                          "ipic": 'file:///home/gao/taomi/Tests/demo/images/Con_Kit_Kat.jpg',
                                                     "iprice": 17.5,
                                                          "iorder": 4,
                                                          "icid": 5});
                                    itemModel.append({"iid": 25,
                                                          "item": 'Corn Salad',
                                                          "ipic": 'file:///home/gao/taomi/Tests/demo/images/Corn_Salad.jpg',
                                                     "iprice": 19.0,
                                                          "iorder": 5,
                                                          "icid": 5});*/
                                }
                            }
                        )
                    }

                    function saveItemData() {
                        // 仅执行一次，用于向数据库中写入菜式数据
                /*       var db = openDatabaseSync("DemoDB", "1.0", "Demo Model SQL", 50000);
                        db.transaction(
                            function(tx) {
                                tx.executeSql('DROP TABLE Items');
                                tx.executeSql('CREATE TABLE IF NOT EXISTS Items(iid INTEGER primary key, item TEXT, ipic TEXT, iprice INTEGER, iorder INTEGER, icid INTEGER, FOREIGN KEY(icid) REFERENCES Categorys(cid))');
                                var index = 0;
                                while (index < itemModel.count) {
                                    var myItem = itemModel.get(index);
                                    tx.executeSql('INSERT INTO Items VALUES(?,?,?,?,?,?)', [myItem.iid, myItem.item, myItem.ipic, myItem.iprice, myItem.iorder, myItem.icid]);
                                    index++;
                                }
                            }
                        )*/
                    }
                }
            }
        }
    }

    /*
     *  CategoryModel.qml
     */
    /* 类别数据模型的数据从DemoDB数据库的Categorys表中读取 */
    ListModel {
        id: categoryModel
        Component.onCompleted: loadCategoryData()
        Component.onDestruction: saveCategoryData()
        function loadCategoryData() {
            var db = openDatabaseSync("DemoDB", "1.0", "Demo Model SQL", 50000);
            db.transaction(
                function(tx) {
                    // Create the database if it doesn't already exist
                    //
                    tx.executeSql('CREATE TABLE IF NOT EXISTS Categorys(cid INTEGER primary key, category TEXT)');

                    var rs = tx.executeSql('SELECT * FROM Categorys ORDER BY cid'); // 以主键cid值对类别的显示进行排序
                    var index = 0;
                    if (rs.rows.length > 0) {
                        var index = 0;
                        while (index < rs.rows.length) {
                            var myItem = rs.rows.item(index);
                            categoryModel.append({"cid": myItem.cid,
                                                  "category": myItem.category});
                            index++;
                        }
                    } else {
                        categoryModel.append({"cid": 1,
                                              "category": '炒菜'});
                        categoryModel.append({"cid": 3,
                                              "category": '炖菜'});
                        categoryModel.append({"cid": 4,
                                              "category": '特色'});
                        categoryModel.append({"cid": 2,
                                              "category": '凉菜'});
                        categoryModel.append({"cid": 5,
                                              "category": '酒水'});
                    }
                }
            )
        }

        function saveCategoryData() {
            var db = openDatabaseSync("DemoDB", "1.0", "Demo Model SQL", 50000);
            db.transaction(
                function(tx) {
                    tx.executeSql('DROP TABLE Categorys');
                    tx.executeSql('CREATE TABLE IF NOT EXISTS Categorys(cid INTEGER primary key, category TEXT)');
                    var index = 0;
                    while (index < categoryModel.count) {
                        var myItem = categoryModel.get(index);
                        tx.executeSql('INSERT INTO Categorys VALUES(?,?)', [myItem.cid, myItem.category]);
                        index++;
                    }
                }
            )
        }
    }

    /*
     *  SelectedDelegate.qml
     */
    Component {
        id: selectedDelegate
        Item {
            width: 341
            height: 200

            Image {
                id: selectedPic
                source: ipic
                anchors.centerIn: parent
                width: 228
                height: 133
            }

            Image {
                source: "file:///home/gao/taomi/Tests/demo/icons/cross.png"
                anchors.horizontalCenter: selectedPic.right
                anchors.verticalCenter: selectedPic.top
                sourceSize.width: 40
                sourceSize.height: 40
                opacity: 0.8



                MouseArea {
                    id: cancelMouse
                    anchors.fill: parent
                    z: 4

                    // 删除选中的菜式
                    function removeSelectedItem() {
                        var i = 0;
                        while (selectedModel.get(i).item != item)
                        {
                            i++;
                        }
                        selectedModel.remove(i);
                    }

                    onClicked: {
                        removeSelectedItem();
                    }
                }
            }
        }
    }

    /*
     *  SelectedModel.qml
     */
    ListModel {
        id: selectedModel
    }
}





