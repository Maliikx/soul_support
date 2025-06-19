const Sequelize = require('sequelize');
const sequelize=require("../database");
const patient = require('./Patient');
const exercise = require('./exercise');
const plan = require('./plan');
const planQuestions = require('./plan\'sQuestions');
const makeplan=sequelize.define("makeplan",{
    patient_id:{
        type:Sequelize.INTEGER,allowNull:false,references:{Model:patient,Key:"patient_id"},
        primaryKey: true
    },
    plan_id:{
        type:Sequelize.INTEGER,allowNull:false,references:{Model:plan,Key:"plan_id"},
        primaryKey: true
    },  
    question_num:{
        type:Sequelize.INTEGER,allowNull:false,references:{Model:planQuestions,Key:"question_num"},
        primaryKey: true
    },  
   

});
module.exports =makeplan;