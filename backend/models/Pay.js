const Sequelize = require('sequelize');
const sequelize=require("../database");
const patient = require('./Patient');
const doctor = require('./Doctor');
const pay=sequelize.define("pay",{
    patient_id:{
        type:Sequelize.INTEGER,allowNull:false,references:{Model:patient,Key:"patient_id"},
        primaryKey: true
    },
    doctor_id:{
        type:Sequelize.INTEGER,allowNull:false,references:{Model:doctor,Key:"doctor_id"},
        primaryKey: true
    },  
    Amount:{type:Sequelize.DOUBLE,allowNull: false},
    Date:{ type: Sequelize.DATE,  allowNull: false },
   

});
module.exports = pay;
