//const sessions = require('express-session');
//const passport = require('passport');
const express = require('express');
const sequelize = require('./database.js');
const Patient = require('./models/Patient');
const doctor = require('./models/Doctor');
const pay=require("./models/pay")
const session=require("./models/Session")
const makesession=require('./models/MakeSession')
const Do=require("./models/doexercise.js")
const exercise = require('./models/exercise');
const documentation =require('./models/documentation')
const app = express();
const admin =require('./models/admin');
const doexercise =require('./models/doexercise.js')
const music = require('./models/Music');
const Listen=require("./models/listen")
const Test = require('./models/Test');
const Take=require("./models/Take")
const Admin=require("./models/admin")
const Notification=require("./models/Notification")
const plan =require("./models/plan.js")
const planQuestions =require("./models/plan'sQuestions.js")
const makes_plan =require("./models/makes_plan")
const bodyParser=require('body-parser')
const cors = require('cors');
app.use(cors());
app.use(bodyParser.json());
app.use(express.urlencoded({ extended: true }));

Patient.hasMany(pay, { foreignKey: 'patient_id' });  
pay.belongsTo(Patient, { foreignKey: 'patient_id' }); 
doctor.hasMany(pay, { foreignKey: 'doctor_id' });  
pay.belongsTo(doctor, { foreignKey:  'doctor_id' }); 

module.exports = { doctor,Patient, pay };


Patient.hasMany(makesession, { foreignKey: 'patient_id' });  
makesession.belongsTo(Patient, { foreignKey: 'patient_id' }); 
doctor.hasMany(makesession, { foreignKey: 'doctor_id' }); 
makesession.belongsTo(doctor, { foreignKey:  'doctor_id' });
session.hasMany(makesession, { foreignKey: 'session_id' });  
makesession.belongsTo(session, { foreignKey:  'session_id' }); 

module.exports = { doctor,Patient, session,makesession};
Patient.hasMany(Do, { foreignKey: 'patient_id' });  
Do.belongsTo(Patient, { foreignKey: 'patient_id' }); 
exercise.hasMany(Do, { foreignKey: 'exercise_id' });  
Do.belongsTo(exercise, { foreignKey:  'exercise_id' }); 

module.exports = { exercise,Patient, Do };

Patient.hasMany(Listen, { foreignKey: 'patient_id' });  // A user has many posts
Listen.belongsTo(Patient, { foreignKey: 'patient_id' }); // A post belongs to one user
music.hasMany(Listen, { foreignKey: 'music_id' });  // A user has many posts
Listen.belongsTo(music, { foreignKey:  'music_id' }); // A post belongs to one user

module.exports = { music,Patient, Listen };



Patient.hasMany(Take, { foreignKey: 'patient_id' });  // A user has many posts
Take.belongsTo(Patient, { foreignKey: 'patient_id' }); // A post belongs to one user
Test.hasMany(Take, { foreignKey: 'test_id' });  // A user has many posts
Take.belongsTo(Test, { foreignKey:  'test_id' }); // A post belongs to one user

module.exports = { Test,Patient, Take };

Patient.hasMany(Notification, { foreignKey: 'patient_id' });  // A user has many posts
Notification.belongsTo(Patient, { foreignKey: 'patient_id' }); // A post belongs to one user
Admin.hasMany(Notification, { foreignKey: 'admin_id' });  // A user has many posts
Notification.belongsTo(Admin, { foreignKey:  'admin_id' }); // A post belongs to one user

module.exports = { Admin,Patient, Notification};

Patient.hasMany(makes_plan, { foreignKey: 'patient_id' });  // A user has many posts
makes_plan.belongsTo(Patient, { foreignKey: 'patient_id' }); // A post belongs to one user
plan.hasMany(makes_plan, { foreignKey: 'plan_id' });  // A user has many posts
makes_plan.belongsTo(plan, { foreignKey:  'plan_id' }); // A post belongs to one user
planQuestions.hasMany(makes_plan, { foreignKey: 'question_num' });  // A user has many posts
makes_plan.belongsTo(planQuestions, { foreignKey:  'question_num' }); // A post belongs to one user

module.exports = { Admin,Patient, Notification};

//headers
app.use((req,res,next)=>{
  res.setHeader('Access-Control-Allow-Origin', '*');
  res.setHeader('Access-Control-Allow-Methods','GET,POST,PUT,PATCH,DELETE');
res.setHeader('Access-Control-Allow-Headers','Content-Type, Authorization');
next();

})
//
//app.use(sessions({
//    secret: 'keyboard cat',
//    resave: false,
//    saveUninitialized: false
//}));
//
//app.use(passport.initialize());
//app.use(passport.session());

const deleteRoutes = require('./routes/deleteroutes');
app.use('/delete', deleteRoutes);


const notificationRoutes = require('./routes/notificationRoutes'); // Import the notification routes
app.use(express.urlencoded({ extended: true }));

// Use the notification route for handling /notification requests
app.use('/notification', notificationRoutes);

const therapistRoutes = require('./routes/therapist');
app.use('/api', therapistRoutes);


app.use(express.json());


authRoutes=require('./routes/authRoutes')
app.use('/doctor',authRoutes);
const therapistRoutesbymail = require('./routes/getdoctorisBymail');
app.use('/api', therapistRoutesbymail);

getpatientId=require('./routes/therapistid')
app.use('/api',getpatientId);

getpatientname=require('./routes/patientname')
app.use('/api',getpatientname);
require('dotenv').config();

sequelize.sync()
  .then(result => {
    // console.log(result);
    app.listen(3000);
  })
  .catch(err => {
    console.log(err);
  });