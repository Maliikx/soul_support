const Sequelize = require('sequelize');
const sequelize=new Sequelize(
    "soulsupport",
    "root",
    "malik123",
    {
        dialect:'mysql',
        host:'localhost'
    }
)
module.exports=sequelize;
