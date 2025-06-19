const Sequelize = require('sequelize');
const sequelize=require("../database");
const patient = require('./Patient');
const Test= require('./Test');
const Take=sequelize.define("Take",{
    patient_id:{
        type:Sequelize.INTEGER,allowNull:false,references:{Model:patient,Key:"patient_id"},
        primaryKey: true
    },
    test_id:{
        type:Sequelize.INTEGER,allowNull:false,references:{Model:Test,Key:"test_id"},
        primaryKey: true
    },  
   

});
module.exports = Take;