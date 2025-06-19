const Sequelize = require('sequelize');
const sequelize=require("../database");
const patient = require('./documentation');
const doctor = require('./admin');
const Update=sequelize.define("Update",{
    documentation_id:{
        type:Sequelize.INTEGER,allowNull:false,references:{Model:patient,Key:"documentation_id"},
        primaryKey: true
    },
    admin_id:{
        type:Sequelize.INTEGER,allowNull:false,references:{Model:Music,Key:"admin_id"},
        primaryKey: true
    },  
   

});
module.exports =Update;