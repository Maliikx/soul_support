const { DataTypes } = require('sequelize');
const sequelize = require("../database");
const Patient = require('./Patient');
const Admin = require('./admin');

const Notification = sequelize.define("Notification", {
    id: {
        type: DataTypes.INTEGER,
        autoIncrement: true,
        primaryKey: true
    },
    patient_id: {
        type: DataTypes.INTEGER,
        allowNull: false,
        references: {
            model: Patient,
            key: "patient_id"
        }
    },
    admin_id: {
        type: DataTypes.INTEGER,
        allowNull: false,
        references: {
            model: Admin,
            key: "admin_id"
        }
    },
    message: {
        type: DataTypes.STRING,
        allowNull: false
    },
    seen: {
        type: DataTypes.BOOLEAN,
        defaultValue: false
    }
}, {
    timestamps: true
});

// Sync Notification table
(async () => {
    try {
        await Notification.sync({ force: true }); // This will drop and recreate the table
        console.log("Notification table synced successfully.");
    } catch (err) {
        console.error("Error syncing Notification table:", err);
    }
})();

module.exports = Notification;
