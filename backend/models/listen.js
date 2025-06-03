const Sequelize = require('sequelize');
const sequelize=require("../database");
const patient = require('./Patient');
const Music = require('./Music');
const listen=sequelize.define("Listen",{
    patient_id:{
        type:Sequelize.INTEGER,allowNull:false,references:{Model:patient,Key:"patient_id"},
        primaryKey: true
    },
    music_id:{
        type:Sequelize.INTEGER,allowNull:false,references:{Model:Music,Key:"music_id"},
        primaryKey: true
    },  
   

});
module.exports = listen;