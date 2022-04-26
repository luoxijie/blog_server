// 对blog表的操作
const db = require('../connect.js');
const result = require('../../utils/responseData.js');
const typeModel = require('./typeModel');
module.exports = {
   // 获取单个blog
   getblog: async (id)=>{
    const sql = 'select * from blog.blogs where id = ?';
    const res = await db.query(sql, [id]);
    // console.log(res);
    const r = await typeModel.getTypeById(res[0].types);
    res[0].typesword = r;
    return result.responseData(0, res);
   },
   // 获取首页的blogs
   getFirstPageBlogs: async () => {
    const sql = 'SELECT * FROM blog.blogs order by likes desc limit 0,5';
    const res = await db.query(sql);
    // console.log(res);
    for(let i = 0;i < res.length;i++){
        const r = await typeModel.getTypeById(res[i].types);
        res[i].typesword = r;
    };
    return result.responseData(0, res);
   }, 
   // 获取不同type的blogs
   getDifferentTypeBlogs: async (typeId) => {
    let id = [];
    let res = [];
    id = typeId.split(',');
    for(let i = 0;i < id.length;i++){
        const sql = `select * from blog.blogs where types like '%${id[i]}%'`;
        let r = await db.query(sql);
        res.push(r);
    }
    console.log(res[0]);
    if(res.length == 0){
        return result.responseData(-1, res);
    }else{
        return result.responseData(0, res); 
    }
   },
   // 模糊搜索blogs
   getSearchBlogs: async (kw, page, limit) => {
    let start = (page - 1) * limit;
    const sql = `select * from blog.blogs where blogname like '%${kw}%' or blogtext like '%${kw}%' limit ${start},${limit}`;
    const res = await db.query(sql);
    // console.log(res.length)
    if(res.length == 0){
        return result.responseData(-1, res);
    }else{
        return result.responseData(0, res);
    }
   },
   // 添加blog
   addBlog: async (id,name,text,types,time,likes)=>{
    const sql = 'insert into blog.blogs values(?,?,?,?,?,?)';
    const blog = {
        id,
        name,
        text,
        types,
        time,
        likes,
    };
    const res = await db.query(sql, [id,name,text,types,time,likes]);
    // console.log(res);
    if(res.protocol41 == true){
        return result.responseData(0, blog);
    }else{
        return result.responseData(1, {});
    }
   },
   // 删除blog
   deleteBlog: async (blogId)=>{
    const sql1 = 'delete from blog.comments where bid = ?';
    const res1 = await db.query(sql1, [blogId]);
    // console.log(res1);
    if(res1.protocol41 == true){
        const sql2 = 'delete from blog.blogs where id = ?';
        const res2 = await db.query(sql2, [blogId]);
        // console.log(res2);
        if(res2.protocol41 == true){
           return result.responseData(0, {}); 
        }
    }
    return result.responseData(1, {});
   },
   // 修改blog
   alterBlog: async (id,name,text,types)=>{
    const sql = 'update blog.blogs set blogname = ?,blogtext = ?,types = ? where id = ?';
    const res = await db.query(sql, [name,text,types,id]);
    // console.log(res);
    if(res.protocol41 == true){
        return result.responseData(0, {});
    }else{
        return result.responseData(1, {});
    }
   },
   // 分页查询
   searchBlogs: async (page,limit)=>{
    let start = (page - 1) * limit;
    const sql = `select * from blog.blogs limit ${start},${limit}`;
    const sql1 = 'select count(*) from blog.blogs';
    const res = await db.query(sql);
    const res1 = await db.query(sql1);
    if(res.length == 0){
        return result.responseData(-1, res);
    }else{
        res.push({total: res1[0]['count(*)']});
        return result.responseData(0, res); 
    }
   },
   // 点赞
   addLike: async (id)=>{
    const sql = 'update blog.blogs set likes = likes + 1 where id = ?';
    const res = await db.query(sql, [id]);
    if(res.protocol41 == true){
        return result.responseData(0, {});
    }else{
        return result.responseData(1, {});
    }
   },
}