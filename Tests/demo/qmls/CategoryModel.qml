import Qt 4.7

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
