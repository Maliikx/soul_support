const Sequelize = require('sequelize');
const sequelize=require("../database");
const { type } = require('os');
const session=sequelize.define("session",{
    session_id:{
        type:Sequelize.INTEGER,autoIncrement:true,primaryKey: true
    },
    Name:{type:Sequelize.STRING,allowNull: false},
    status:{type:Sequelize.STRING},
    Date:{ type: Sequelize.DATE,  allowNull: false },
    duration:{type:Sequelize.DOUBLE},
    
   
});
module.exports = session;
