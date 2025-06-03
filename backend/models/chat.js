const Sequelize = require('sequelize');
const sequelize = require('../database');
const patient = require('./Patient');
const doctor = require('./Doctor');

const chat = sequelize.define('chat', {
  pk: {
    type: Sequelize.INTEGER,
    autoIncrement: true,
    primaryKey: true
  },
  patient_id: {
    type: Sequelize.INTEGER,
    allowNull: false,
    references: {
      model: patient,
      key: 'patient_id'
    }
  },
  doctor_id: {
    type: Sequelize.INTEGER,
    allowNull: false,
    references: {
      model: doctor,
      key: 'doctor_id'
    }
  },
  message: {
    type: Sequelize.TEXT,
    allowNull: false
  },
  sender: {
    type: Sequelize.ENUM('patient', 'doctor'),
    allowNull: false
  }
}, {
  timestamps: true
});

module.exports = chat;
