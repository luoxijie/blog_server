const express = require('express');
const db = require('./db/connect');
const app = express();

const path = require('path');

const bodyparser = require('body-parser');
app.use(bodyparser.urlencoded({extended:false}));
app.use(bodyparser.json());

//解决跨域问题
const cors = require('cors');
app.use(cors());

// app.use('/public',express.static(path.join(__dirname,'./uploads')));
//路由
const typerouter = require('./router/typeRouter');
const blogrouter = require('./router/blogRouter');
const commentrouter = require('./router/commentRouter');
app.use('/blog', blogrouter);
app.use('/type', typerouter);
app.use('/comment', commentrouter);

app.listen(3000,()=>{
    console.log('server start');
});
