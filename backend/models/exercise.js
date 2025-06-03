const Sequelize = require('sequelize');
const sequelize=require("../database");
const exercise=sequelize.define("exercise",{
    exercise_id:{
        type:Sequelize.INTEGER,autoIncrement:true,primaryKey: true
    },
    Tittle:{type:Sequelize.STRING,allowNull: false},
    Description:{type:Sequelize.STRING,allowNull: false},
    
});
module.exports = exercise;