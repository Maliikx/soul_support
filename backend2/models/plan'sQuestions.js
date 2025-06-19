const Sequelize = require('sequelize');
const sequelize=require("../database");
const planQuestions=sequelize.define("planQuestions",{
    question_num:{
        type:Sequelize.INTEGER,autoIncrement:true,primaryKey: true
    },
    Questions:{type:Sequelize.STRING,allowNull: false},
    
});
module.exports = planQuestions;