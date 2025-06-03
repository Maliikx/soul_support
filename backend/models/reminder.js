const { DataTypes } = require("sequelize");
const sequelize = require("../database");

const Reminder = sequelize.define("Reminder", {
    id: { type: DataTypes.INTEGER, autoIncrement: true, primaryKey: true },
    patient_id: {
        type: DataTypes.INTEGER,
        allowNull: false,
        references: { model: "Patient", key: "patient_id" },
    },
    message: { type: DataTypes.STRING, allowNull: false },
    reminder_time: { type: DataTypes.DATE, allowNull: false },
    sent: { type: DataTypes.BOOLEAN, defaultValue: false }
}, {
    timestamps: true
});

(async () => {
    try {
        await Reminder.sync();
        console.log("Reminder table synced successfully.");
    } catch (error) {
        console.error("Error syncing Reminder table:", error);
    }
})();

module.exports = Reminder;
