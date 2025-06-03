const Sequelize = require('sequelize');
const sequelize=require("../database");
const { type } = require('os');
const doctor=sequelize.define("doctor",{
    doctor_id:{
        type:Sequelize.INTEGER,autoIncrement:true,primaryKey: true
    },
    Name:{type:Sequelize.STRING,allowNull: false},
    Qualification:{type:Sequelize.STRING},// allow null or no?
    email:{ type: Sequelize.STRING, unique: true, allowNull: false },
    Age:{type:Sequelize.INTEGER},
    Rating: { type: Sequelize.DOUBLE,  },
    NumberOfPatient:{ type: Sequelize.INTEGER}
   , Calender:{type:Sequelize.DATE},
    password: { type: Sequelize.STRING, allowNull: false },
   
});
module.exports = doctor;
