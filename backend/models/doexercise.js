const Sequelize = require('sequelize');
const sequelize=require("../database");
const patient = require('./Patient');
const exercise = require('./exercise');
const doexercise=sequelize.define("Do",{
    patient_id:{
        type:Sequelize.INTEGER,allowNull:false,references:{Model:patient,Key:"patient_id"},
        primaryKey: true
    },
    exercise_id:{
        type:Sequelize.INTEGER,allowNull:false,references:{Model:exercise,Key:" exercise_id"},
        primaryKey: true
    },  
   

});
module.exports =doexercise;