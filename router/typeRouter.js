var express = require('express');
var router = express.Router();
var typeModel = require('../db/model/typeModel');

const bodyparser = require('body-parser');
const { type } = require('express/lib/response');
router.use(bodyparser.urlencoded({ extended:false }));
router.use(bodyparser.json());

router.get('/getAllType', async (req, res)=>{
    const result = await typeModel.getAllType();
    console.log(result);
    return res.send(result);
});
router.get('/getTopType', async (req, res)=>{
    const result = await typeModel.getTopType();
    return res.send(result);
});
router.get('/addType', async (req, res)=>{
    let {typename} = req.query;
    if(typename == undefined){
        return res.send({code: 3, msg: '请求参数不能为空'});
    }else{
        const result = await typeModel.addType(typename);
        return res.send(result);
    }
});
router.get('/deleteType', async (req, res)=>{
    let {typeid} = req.query;
    if(typeid == undefined){
        return res.send({code: 3, msg: '请求参数不能为空'});
    }else{
        const result = await typeModel.deleteType(typeid);
        return res.send(result);
    }
});
router.get('/alterType', async (req, res)=>{
    let {typeid,typename} = req.query;
    if(typeid == undefined||typename == undefined){
        return res.send({code: 3, msg: '请求参数不能为空'});
    }else{
        const result = await typeModel.alterType(typeid, typename);
        return res.send(result);
    }
});
router.get('/getTypeById', async (req, res) =>{
    let {typeid} = req.query;
    if(typeid == undefined){
        return res.send({code: 3, msg: '请求参数不能为空'});
    }else{
        const result = await typeModel.getTypeById(typeid);
        return res.send(result);
    }
});

module.exports = router;