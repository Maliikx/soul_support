const Sequelize = require('sequelize');
const sequelize=new Sequelize(
    "soulsupport",
    "root",
    "#sama12345*",
    {
        dialect:'mysql',
        host:'localhost'
    }
)
module.exports=sequelize;
