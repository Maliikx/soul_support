const Sequelize = require('sequelize');
const sequelize=require("../database");
const patient = require('./Patient');
const doctor = require('./Doctor');
const session = require('./Session');
const makesession=sequelize.define("makesession",{
    patient_id:{
        type:Sequelize.INTEGER,allowNull:false,references:{Model:patient,Key:"patient_id"},
        primaryKey: true
    },
    doctor_id:{
        type:Sequelize.INTEGER,allowNull:false,references:{Model:doctor,Key:"doctor_id"},
        primaryKey: true
    },  
    session_id:{
        type:Sequelize.INTEGER,allowNull:false,references:{Model:session,Key:"session_id"},
        primaryKey: true
    },  
    

});
module.exports =makesession;