const Sequelize = require('sequelize');
const sequelize=require("../database");
const documentation=sequelize.define("Documentation",{
    Documentation_id:{
        type:Sequelize.INTEGER,autoIncrement:true,primaryKey: true
    },
    Tittle:{type:Sequelize.STRING,allowNull: false},
    Description:{type:Sequelize.STRING,allowNull: false},
    
});
module.exports = documentation;