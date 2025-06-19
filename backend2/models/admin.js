const Sequelize = require('sequelize');
const sequelize = require("../database");

const Admin = sequelize.define("Admin", {
    admin_id: {
        type: Sequelize.INTEGER,
        autoIncrement: true,
        primaryKey: true
    },
    Name: {
        type: Sequelize.STRING,
        allowNull: false
    },
    Gender: {
        type: Sequelize.STRING,
        allowNull: false
    }
}, {
    timestamps: true  // Ensures Sequelize automatically handles createdAt and updatedAt fields
});

module.exports = Admin;
