// 对types表的操作
const db = require('../connect.js');
const result = require('../../utils/responseData.js');
module.exports = {
   // 获取所有的type
   getAllType: async () => {
      const sql = 'select * from blog.types';
      const res = await db.query(sql);
      return result.responseData(0, res);
   }, 
   // 获取热度前十的type
   getTopType: async () => {
      const sql = 'SELECT * FROM blog.types order by typeheat desc limit 0,10';
      const res = await db.query(sql);
      return result.responseData(0, res);
   },
   // 根据字符串typeid获取type
   getTypeById: async (typeid)=>{
      let id = [];
      id = typeid.split(',');
      let res = [];
      for(let i = 0;i < id.length;i++){
         const sql = 'select * from blog.types where id = ?';
         const r = await db.query(sql, [id[i]]);
         res.push(r);
      };
      if(res.length == 0){
         return result.responseData(-1, {});
      }else{
         return res;
      }
   },
   // 增加type
   addType: async (name) =>{
      const sql = 'insert into blog.types (typename) values(?)';
      const res = await db.query(sql, [name]);
      return result.responseData(0, {});
   },
   // 删除type
   deleteType: async (id) => {
      const sql = 'delete from blog.types where id = ?';
      const res = await db.query(sql, [id]);
      return result.responseData(0, {});
   },
   // 修改type
   alterType: async (id,name) =>{
      const sql = 'update blog.types set typename = ? where id = ?';
      const res = await db.query(sql, [name,id]);
      return result.responseData(0, {});
   },
}

