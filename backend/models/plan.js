const Sequelize = require('sequelize');
const sequelize=require("../database");
const plan=sequelize.define("plan",{
    plane_id:{
        type:Sequelize.INTEGER,autoIncrement:true,primaryKey: true
    },
    Description:{type:Sequelize.STRING,allowNull: false},
    
});
module.exports = plan;