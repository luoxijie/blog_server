// 对comments表的操作
const db = require('../connect.js');
const result = require('../../utils/responseData.js');
module.exports = {
    // 获取blog的comment
    getCommentByBlogId: async (id)=>{
        const sql = 'select * from blog.comments where bid = ?';
        const res = await db.query(sql, [id]);
        return result.responseData(0, res);
    },
    getComment: async (cid)=>{
        const sql = 'select * from blog.comments where cid = ?';
        const res = await db.query(sql, [cid]);
        return result.responseData(0, res);
    },
    // 获取所有的comment
    getAllComment: async (page,limit)=>{
        let start = (page-1)*limit;
        const sql = `select * from blog.comments limit ${start},${limit}`;
        const sql1 = 'select count(*) from blog.comments';
        const res = await db.query(sql);
        const res1 = await db.query(sql1);
        res.push({total: res1[0]['count(*)']});
        // console.log(res);
        // console.log(res1);
        return result.responseData(0, res);
    },
    // 添加一个comment
    addComment: async (blogid, text, time)=>{
        const sql = 'insert into blog.comments (bid,ctext,time) values(?,?,?)';
        const res = await db.query(sql, [blogid,text,time]);
        if(res.protocol41 == true){
            return result.responseData(0, {});
        }else{
            return result.responseData(1, {});
        }
    },
    // 删除一个comment
    deleteComment: async (cid)=>{
        const sql = 'delete from blog.comments where cid = ?';
        const res = await db.query(sql, [cid]);
        return result.responseData(0, res);
    },
    // 修改一个comment
    alterComment: async (cid, text)=>{
        const sql = 'update blog.comments set ctext = ? where cid = ?';
        const res = await db.query(sql, [text,cid]);
        return result.responseData(0, res);
    },
};