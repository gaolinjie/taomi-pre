import Qt 4.7

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
                                          "item": 'AlmondCookies',
                                          "ipic": 'file:///home/gao/taomi/Tests/demo/images/AlmondCookies.jpg',
                                          "iprice": 18.0,
                                          "iorder": 1,
                                          "icid": 1});
                    itemModel.append({"iid": 2,
                                          "item": 'asian_noodle_soup',
                                          "ipic": 'file:///home/gao/taomi/Tests/demo/images/asian_noodle_soup.jpg',
                                     "iprice": 12.5,
                                          "iorder": 3,
                                          "icid": 1});
                    itemModel.append({"iid": 3,
                                          "item": 'baba-ganoush',
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
                                          "item": 'BasilDrawing',
                                          "ipic": 'file:///home/gao/taomi/Tests/demo/images/BasilDrawing.jpg',
                                     "iprice": 22.0,
                                          "iorder": 4,
                                          "icid": 1});
                    itemModel.append({"iid": 6,
                                          "item": 'BerryPie',
                                          "ipic": 'file:///home/gao/taomi/Tests/demo/images/BerryPie.jpg',
                                     "iprice": 15.0,
                                          "iorder": 1,
                                          "icid": 2});
                    itemModel.append({"iid": 7,
                                          "item": 'Blueberry_cake',
                                          "ipic": 'file:///home/gao/taomi/Tests/demo/images/Blueberry_cake.jpg',
                                     "iprice": 23.0,
                                          "iorder": 2,
                                          "icid": 2});
                    itemModel.append({"iid": 8,
                                          "item": 'Blueberry_muffins',
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
                                          "item": 'Briwates_Recipe',
                                          "ipic": 'file:///home/gao/taomi/Tests/demo/images/Briwates_Recipe.jpg',
                                     "iprice": 12.0,
                                          "iorder": 5,
                                          "icid": 2});
                    itemModel.append({"iid": 11,
                                          "item": 'Butter_Nut_Soup',
                                          "ipic": 'file:///home/gao/taomi/Tests/demo/images/Butter_Nut_Soup.jpg',
                                     "iprice": 31.0,
                                          "iorder": 1,
                                          "icid": 3});
                    itemModel.append({"iid": 12,
                                          "item": 'butternut_squash_salad',
                                          "ipic": 'file:///home/gao/taomi/Tests/demo/images/butternut_squash_salad.jpg',
                                     "iprice": 12.0,
                                          "iorder": 2,
                                          "icid": 3});
                    itemModel.append({"iid": 13,
                                          "item": 'camping_breakfast',
                                          "ipic": 'file:///home/gao/taomi/Tests/demo/images/camping_breakfast.jpg',
                                     "iprice": 18.5,
                                          "iorder": 3,
                                          "icid": 3});
                    itemModel.append({"iid": 14,
                                          "item": 'camping_breakfast_coffee',
                                          "ipic": 'file:///home/gao/taomi/Tests/demo/images/camping_breakfast_coffee.jpg',
                                     "iprice": 10.0,
                                          "iorder": 4,
                                          "icid": 3});
                    itemModel.append({"iid": 15,
                                          "item": 'camping_breakfast_copping',
                                          "ipic": 'file:///home/gao/taomi/Tests/demo/images/camping_breakfast_copping.jpg',
                                     "iprice": 28.5,
                                          "iorder": 5,
                                          "icid": 3});
                    itemModel.append({"iid": 16,
                                          "item": 'camping_breakfast_stirring',
                                          "ipic": 'file:///home/gao/taomi/Tests/demo/images/camping_breakfast_stirring.jpg',
                                     "iprice": 15.5,
                                          "iorder": 1,
                                          "icid": 4});
                    itemModel.append({"iid": 17,
                                          "item": 'Carrot-Ginger-Soup',
                                          "ipic": 'file:///home/gao/taomi/Tests/demo/images/Carrot-Ginger-Soup.jpg',
                                     "iprice": 12.0,
                                          "iorder": 2,
                                          "icid": 4});
                    itemModel.append({"iid": 18,
                                          "item": 'CheeseStraws',
                                          "ipic": 'file:///home/gao/taomi/Tests/demo/images/CheeseStraws.jpg',
                                     "iprice": 13.5,
                                          "iorder": 3,
                                          "icid": 4});
                    itemModel.append({"iid": 19,
                                          "item": 'Chermoula_aubergine',
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
                                          "item": 'Cherry_amandines',
                                          "ipic": 'file:///home/gao/taomi/Tests/demo/images/Cherry_amandines.jpg',
                                     "iprice": 19.5,
                                          "iorder": 1,
                                          "icid": 5});
                    itemModel.append({"iid": 22,
                                          "item": 'Christmas_Brunch',
                                          "ipic": 'file:///home/gao/taomi/Tests/demo/images/Christmas_Brunch.jpg',
                                     "iprice": 8.0,
                                          "iorder": 2,
                                          "icid": 5});
                    itemModel.append({"iid": 23,
                                          "item": 'ChristopherBreakfast',
                                          "ipic": 'file:///home/gao/taomi/Tests/demo/images/ChristopherBreakfast.jpg',
                                     "iprice": 28.0,
                                          "iorder": 3,
                                          "icid": 5});
                    itemModel.append({"iid": 24,
                                          "item": 'Con_Kit_Kat',
                                          "ipic": 'file:///home/gao/taomi/Tests/demo/images/Con_Kit_Kat.jpg',
                                     "iprice": 17.5,
                                          "iorder": 4,
                                          "icid": 5});
                    itemModel.append({"iid": 25,
                                          "item": 'Corn_Salad',
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
