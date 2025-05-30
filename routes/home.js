const express =require('express');
const router =express.Router();
const homecontroller=require('../controllers/home')
//get/feed/posts
router.get('/posts',homecontroller.getPosts);
//post/feed/post
router.post("/post",homecontroller.createPost)
module.exports=router;