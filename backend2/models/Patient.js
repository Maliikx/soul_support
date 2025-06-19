const { Sequelize, DataTypes } = require('sequelize');
const sequelize = require("../database");

const Patient = sequelize.define('Patient', {
    patient_id: { type: DataTypes.INTEGER, autoIncrement: true, primaryKey: true },
    FirstName: { type: DataTypes.STRING, allowNull: false },
    PhoneNumber: { type: DataTypes.STRING, allowNull: false },
    Gender: { type: DataTypes.STRING, allowNull: false },
    email: { 
        type: DataTypes.STRING, 
        allowNull: false, 
        unique: {
            name: 'unique_email_constraint', //  Prevents duplicate constraints
            msg: 'Email already exists' // Optional: Custom error message
        } 
    },
    password: { type: DataTypes.STRING, allowNull: false },
    otp: { type: DataTypes.STRING, allowNull: true },
    otpExpiry: { type: DataTypes.DATE, allowNull: true },
    isVerified: { type: DataTypes.BOOLEAN, defaultValue: false },
}, {
    timestamps: true
});

//  Sync the model (DO NOT use alter here)
(async () => {
    try {
        await Patient.sync();  //  Avoid using `alter: true`
        console.log(" Patients table synced successfully.");
    } catch (error) {
        console.error(" Error syncing patients table:", error);
    }
})();

module.exports = Patient;
