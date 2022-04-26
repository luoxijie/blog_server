var express = require('express');
var router = express.Router();
var commentModel = require('../db/model/commentModel');

const bodyparser = require('body-parser');
router.use(bodyparser.urlencoded({ extended:false }));
router.use(bodyparser.json());

router.get('/getCommentByBlogId', async (req, res)=>{
    let {blogid} = req.query;
    if(blogid == undefined){
        return res.send({code: 3, msg: '请求参数不能为空'});
    }else{
       const result = await commentModel.getCommentByBlogId(blogid);
        return res.send(result); 
    }
});
router.get('/getAllComment', async (req, res)=>{
    let {page,limit} = req.query;
    if(page == undefined || limit == undefined){
        return res.send({code: 3, msg: '请求参数不能为空'});
    }
    const result = await commentModel.getAllComment(page,limit);
    // console.log(result);
    return res.send(result);
});
router.get('/addComment', async (req, res) =>{
    let {blogid, text, time} = req.query;
    if(blogid == undefined||text == undefined||time == undefined){
        return res.send({code: 3, msg: '请求参数不能为空'});
    }else{
        const result = await commentModel.addComment(blogid,text,time);
        return res.send(result);
    }
});
router.get('/deleteComment', async (req, res) =>{
    let {cid} = req.query;
    if(cid == undefined){
        return res.send({code: 3, msg: '请求参数不能为空'});
    }else{
        const result = await commentModel.deleteComment(cid);
        return res.send(result);
    }
});
router.get('/alterComment', async (req, res) =>{
    let {cid,text} = req.query;
    if(cid == undefined||text == undefined){
        return res.send({code: 3, msg: '请求参数不能为空'});
    }else{
        const result = await commentModel.alterComment(cid,text);
        return res.send(result);
    }
});
router.get('/getComment', async (req, res)=>{
    let {cid} = req.query;
    if(cid == undefined){
        return res.send({code: 3, msg: '请求参数不能为空'});
    }else{
        const result = await commentModel.getComment(cid);
        return res.send(result);
    }
});

module.exports = router;