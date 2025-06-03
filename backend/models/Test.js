const Sequelize = require('sequelize');
const sequelize=require("../database");
const test=sequelize.define("Test",{
    test_id:{
        type:Sequelize.INTEGER,autoIncrement:true,primaryKey: true
    },
    Date:{type:Sequelize.DATE,allowNull: false},
    Name:{type:Sequelize.STRING,allowNull: false},
    Status:{type:Sequelize.STRING,allowNull: false},
    
});
module.exports = test;