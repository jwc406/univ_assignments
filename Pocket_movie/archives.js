var html5rocks = {};
html5rocks.webdb = {};
html5rocks.webdb.db = null;

html5rocks.webdb.open = function(){
    var dbSize = 5*1024*1024;
    html5rocks.webdb.db = openDatabase("myarchives", "1.0", "my movie archives", dbSize);
}

html5rocks.webdb.createTable = function(){ //테이블 생성
    var db = html5rocks.webdb.db;
    db.transaction(function(tx){
        tx.executeSql("CREATE TABLE IF NOT EXISTS myarchives(ID INTEGER PRIMARY KEY ASC, mdate DATE, mname TEXT, mrate TEXT)", []);
    });
}

html5rocks.webdb.add = function(mdate, mname, mrate) {
    var db = html5rocks.webdb.db;
    swal("", "새 기록을 작성했습니다!", "success");
    db.transaction(function(tx){
        tx.executeSql("INSERT INTO myarchives(mdate, mname, mrate) VALUES (?,?,?)", 
        [mdate, mname, mrate], 
        html5rocks.webdb.onSuccess,
        html5rocks.webdb.onError);
    });
}

html5rocks.webdb.onError = function(tx, e){
    swal("에러 발생: " + e.message);
}

html5rocks.webdb.onSuccess = function(tx, r){
    html5rocks.webdb.getAllWebsiteItems(loadItems);
}

html5rocks.webdb.getAllWebsiteItems = function(renderFunc){
    var db = html5rocks.webdb.db;
    db.transaction(function(tx){
        tx.executeSql("SELECT * FROM myarchives", [], renderFunc, html5rocks.webdb.onError);
    });
}

html5rocks.webdb.delete = function(id){
    var db = html5rocks.webdb.db;
    db.transaction(function(tx){
        tx.executeSql("DELETE FROM myarchives WHERE ID=?", [id],
        html5rocks.webdb.onSuccess,
        html5rocks.webdb.onError);
    });
}

function loadItems(tx, rs){
    var rowOutput = "";
    var todoItems = document.getElementById("MyRecordItems");
    for (var i = 0; i < rs.rows.length; i++){
        rowOutput += renderWebSite(rs.rows.item(i));
    }
    todoItems.innerHTML = rowOutput;
}

function renderWebSite(row){
    return "<li>" + row.mdate + "&nbsp;&nbsp;🎥 " 
    + row.mname + "&nbsp;&nbsp;⭐" 
    + row.mrate + "&nbsp;&nbsp;" 
    + "<button href='javascript:void(0)' onclick='deleteRow(" + row.ID +");' style='border: none; background-color:rgba(0,0,0,0); color:black;'>X</button></li>";  
}

function deleteRow(rowId){
    swal("", "삭제를 완료했습니다!", "error");
    html5rocks.webdb.delete(rowId);
}

function init(){
    html5rocks.webdb.open();
    html5rocks.webdb.createTable();
    html5rocks.webdb.getAllWebsiteItems(loadItems);
}

function add(){
    var mdate = document.getElementById("mdate");
    var mname = document.getElementById("mname");
    var mrate = document.getElementById("mrate");
    html5rocks.webdb.add(mdate.value, mname.value, mrate.value);
    mdate.value = "";
    mname.value = "";
    mrate.value = "";
}

function deleteAll(){
    swal("", "전체 기록 삭제를 완료했습니다!", "error");
    html5rocks.webdb.deleteAll();
    init();
}

html5rocks.webdb.deleteAll = function(){
    var db = html5rocks.webdb.db;
    db.transaction(function(tx){
        tx.executeSql("drop table myarchives", [],
        html5rocks.webdb.onSuccess,
        html5rocks.webdb.onError);
    });
}