const Sequelize = require('sequelize');
const sequelize = require("../database");

const Music = sequelize.define("Music", {
  music_id: {
    type: Sequelize.INTEGER,
    autoIncrement: true,
    primaryKey: true
  },
  title: {
    type: Sequelize.STRING,
    allowNull: false
  },
  description: {
    type: Sequelize.STRING,
    allowNull: false
  },url:{
     type: Sequelize.STRING,
      allowNull: false,
  }
}, {
  tableName: 'music',
  timestamps: false // Disable createdAt/updatedAt if not needed
});

module.exports = Music;