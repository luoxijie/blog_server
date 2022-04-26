var mysql = require('mysql');
var pool = mysql.createPool({
    host: 'localhost',
    port: 3306,
    user: 'root',
    password: 'root',
    database: 'blog',
    serverTimezone: 'HongKong',
});
var db = {};
db.query = function (sql, params) {
    return new Promise((resolve, reject) => {
      // 取出链接
      pool.getConnection(function (err, connection) {
        if (err) {
          reject(err);
          return;
        }
        connection.query(sql, params, function (error, results, fields) {
          console.log(`${ sql }=>${ params }`);
          // 释放连接
          connection.release();
          if (error) {
            reject(error);
            return;
          }
          resolve(results);
        });
      });
    });
};
// 导出对象
module.exports = db;
    