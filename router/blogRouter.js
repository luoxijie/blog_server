var express = require('express');
var router = express.Router();
var blogModel = require('../db/model/blogModel');

const bodyparser = require('body-parser');
router.use(bodyparser.urlencoded({ extended:false }));
router.use(bodyparser.json());

router.get('/getblog', async (req, res)=>{
    let {id} = req.query;
    if(id == undefined){
        return res.send({code: 3, msg: '请求参数不能为空'});
    }else{
        const result = await blogModel.getblog(id);
        // console.log(result);
        return res.send(result);
    }
});
router.get('/getFirstPageBlogs', async (req, res)=>{
    const result = await blogModel.getFirstPageBlogs();
    // console.log(result);
    return res.send(result);
});
router.get('/getDifferentTypeBlogs', async (req, res)=>{
    let {typeId} = req.query;
    if(typeId == undefined){
        return res.send({code: 3, msg: '请求参数不能为空'});
    }else{
        // console.log(typeId);
        const result = await blogModel.getDifferentTypeBlogs(typeId);
        return res.send(result); 
    }
});
router.get('/getSearchBlogs', async (req, res)=>{
    let {kw,page,limit} = req.query;
    if(kw == undefined||page == undefined||limit == undefined){
        return res.send({code: 3, msg: '请求参数不能为空'});
    }else{
        const result = await blogModel.getSearchBlogs(kw, page, limit);
        return res.send(result);
    }
});
router.get('/addBlog', async (req, res)=>{
    let {id,name,text,types,time} = req.query;
    if(id == undefined||name == undefined||text == undefined||types == undefined||time == undefined){
        return res.send({code: 3, msg: '请求参数不能为空'});
    }else{
        const result = await blogModel.addBlog(id,name,text,types,time,0);
        return res.send(result);
    }
});
router.get('/deleteBlog', async (req, res)=>{
    let {id} = req.query;
    if(id == undefined){
        return res.send({code: 3, msg: '请求参数不能为空'});
    }else{
        const result = await blogModel.deleteBlog(id);
        return res.send(result);
    }
});
router.get('/addLike', async (req, res)=>{
    let {id} = req.query;
    if(id == undefined){
        return res.send({code: 3, msg: '请求参数不能为空'});
    }else{
        const result = await blogModel.addLike(id);
        return res.send(result);
    }
});
router.get('/searchBlogs', async (req, res)=>{
    let {page,limit} = req.query;
    if(page == undefined || limit == undefined){
        return res.send({code: 3, msg: '请求参数不能为空'});
    }else{
        const result = await blogModel.searchBlogs(page,limit);
        return res.send(result);
    }
});
router.get('/alterBlog', async (req, res)=>{
    let {id,name,text,types} = req.query;
    if(id == undefined || name == undefined || text == undefined|| types == undefined){
        return res.send({code: 3, msg: '请求参数不能为空'});
    }else{
        const result = await blogModel.alterBlog(id,name,text,types);
        return res.send(result);
    }
});

module.exports = router;