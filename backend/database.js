const Sequelize = require('sequelize');
const sequelize=new Sequelize(
    "soulsupport",
    "root",
    "RMNA-y5P6-KFS2",
    {
        dialect:'mysql',
        host:'localhost'
    }
)
module.exports=sequelize;
