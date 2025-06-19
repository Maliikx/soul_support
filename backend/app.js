////const sessions = require('express-session');
////const passport = require('passport');
//
//const express = require('express');
//const sequelize = require('./database.js');
//const Patient = require('./models/Patient');
//const doctor = require('./models/Doctor');
//const pay=require("./models/Pay")
//const session=require("./models/Session")
//const makesession=require('./models/MakeSession')
//const Do=require("./models/doexercise.js")
//const exercise = require('./models/exercise');
//const documentation =require('./models/documentation')
//const app = express();
//const admin =require('./models/admin');
//const doexercise =require('./models/doexercise.js')
//const music = require('./models/Music');
//const Listen=require("./models/listen")
//const Test = require('./models/Test');
//const Take=require("./models/Take")
//const Admin=require("./models/admin")
//const Notification=require("./models/Notification")
//const plan =require("./models/plan.js")
//const planQuestions =require("./models/plan'sQuestions.js")
//const makes_plan =require("./models/makes_plan")
//const bodyParser=require('body-parser')
//app.use(bodyParser.json());
//app.use(express.urlencoded({ extended: true }));
//
//Patient.hasMany(pay, { foreignKey: 'patient_id' });
//pay.belongsTo(Patient, { foreignKey: 'patient_id' });
//doctor.hasMany(pay, { foreignKey: 'doctor_id' });
//pay.belongsTo(doctor, { foreignKey:  'doctor_id' });
//
//module.exports = { doctor,Patient, pay };
//
//
//Patient.hasMany(makesession, { foreignKey: 'patient_id' });
//makesession.belongsTo(Patient, { foreignKey: 'patient_id' });
//doctor.hasMany(makesession, { foreignKey: 'doctor_id' });
//makesession.belongsTo(doctor, { foreignKey:  'doctor_id' });
//session.hasMany(makesession, { foreignKey: 'session_id' });
//makesession.belongsTo(session, { foreignKey:  'session_id' });
//
//module.exports = { doctor,Patient, session,makesession};
//Patient.hasMany(Do, { foreignKey: 'patient_id' });
//Do.belongsTo(Patient, { foreignKey: 'patient_id' });
//exercise.hasMany(Do, { foreignKey: 'exercise_id' });
//Do.belongsTo(exercise, { foreignKey:  'exercise_id' });
//
//module.exports = { exercise,Patient, Do };
//
//Patient.hasMany(Listen, { foreignKey: 'patient_id' });  // A user has many posts
//Listen.belongsTo(Patient, { foreignKey: 'patient_id' }); // A post belongs to one user
//music.hasMany(Listen, { foreignKey: 'music_id' });  // A user has many posts
//Listen.belongsTo(music, { foreignKey:  'music_id' }); // A post belongs to one user
//
//module.exports = { music,Patient, Listen };
//
//
//
//Patient.hasMany(Take, { foreignKey: 'patient_id' });  // A user has many posts
//Take.belongsTo(Patient, { foreignKey: 'patient_id' }); // A post belongs to one user
//Test.hasMany(Take, { foreignKey: 'test_id' });  // A user has many posts
//Take.belongsTo(Test, { foreignKey:  'test_id' }); // A post belongs to one user
//
//module.exports = { Test,Patient, Take };
//
//Patient.hasMany(Notification, { foreignKey: 'patient_id' });  // A user has many posts
//Notification.belongsTo(Patient, { foreignKey: 'patient_id' }); // A post belongs to one user
//Admin.hasMany(Notification, { foreignKey: 'admin_id' });  // A user has many posts
//Notification.belongsTo(Admin, { foreignKey:  'admin_id' }); // A post belongs to one user
//
//module.exports = { Admin,Patient, Notification};
//
//Patient.hasMany(makes_plan, { foreignKey: 'patient_id' });  // A user has many posts
//makes_plan.belongsTo(Patient, { foreignKey: 'patient_id' }); // A post belongs to one user
//plan.hasMany(makes_plan, { foreignKey: 'plan_id' });  // A user has many posts
//makes_plan.belongsTo(plan, { foreignKey:  'plan_id' }); // A post belongs to one user
//planQuestions.hasMany(makes_plan, { foreignKey: 'question_num' });  // A user has many posts
//makes_plan.belongsTo(planQuestions, { foreignKey:  'question_num' }); // A post belongs to one user
//
//module.exports = { Admin,Patient, Notification};
//
////headers
//app.use((req,res,next)=>{
//  res.setHeader('Access-Control-Allow-Origin', '*');
//  res.setHeader('Access-Control-Allow-Methods','GET,POST,PUT,PATCH,DELETE');
//res.setHeader('Access-Control-Allow-Headers','Content-Type, Authorization');
//next();
//
//})
//
//
//const deleteRouter = require('./routes/deleteroutes'); // or wherever your route file is
//const authmiddleware = require('./middleware/authMiddleware'); // your JWT middleware
//
//app.use('/delete', authmiddleware, deleteRouter);
//
//
//
//const notificationRoutes = require('./routes/notificationRoutes'); // Import the notification routes
//app.use(express.urlencoded({ extended: true }));
//
//// Use the notification route for handling /notification requests
//app.use('/notification', notificationRoutes);
//
//
//authRoutes=require('./routes/authRoutes')
//app.use('/patient',authRoutes);
//
//require('dotenv').config();
//
////sequelize.sync()
////  .then(result => {
////    // console.log(result);
////    app.listen(3000);
////  })
////  .catch(err => {
////    console.log(err);
////  });
//
//const http = require('http');
//const db = require('./database');
//const server = http.createServer(app);
//const io = require('socket.io')(server);
//
//app.use((req, res, next) => {
//  res.setHeader('Access-Control-Allow-Origin', '*');
//  res.setHeader('Access-Control-Allow-Methods', 'GET, POST, PUT, PATCH, DELETE');
//  res.setHeader('Access-Control-Allow-Headers', 'Content-Type, Authorization');
//  next();
//});
//const homeRoutes = require('./routes/home');
//app.use('/home', homeRoutes);
//
//// Socket.io channel
//io.on('connection', (client) => {
//  console.log('New client connected!', client.id);
//
//  client.on('load_history', async ({ patient_id, doctor_id }) => {
//    if (!patient_id || !doctor_id) {
//      return client.emit('error', { message: 'Missing patient_id or doctor_id' });
//    }
//
//    try {
//      const [chats] = await db.query(
//        'SELECT * FROM chats WHERE (patient_id = ? AND doctor_id = ?) ORDER BY createdAt',
//        // [patient_id, doctor_id]
//         {   replacements: [patient_id, doctor_id],
//            type: sequelize.QueryTypes.SELECT}
//      );
//      client.emit('chat_history', chats);
//    } catch (err) {
//      console.error('Error loading chat history:', err);
//      client.emit('error', { message: 'Failed to load chat history' });
//    }
//  });
//
//  client.on('msg', async (data) => {
//    const { patient_id, doctor_id, message, sender } = data;
//
//    // Validate required fields
//    if (!patient_id || !doctor_id  || !message || !sender) {
//      return client.emit('error', { message: 'All fields are required to send a message' });
//    }
//
//    try {
//      await db.query(
//        'INSERT INTO chats (patient_id, doctor_id, message, sender) VALUES (?, ?, ?, ?)',
//        [patient_id, doctor_id, message, sender,]
//      );
//      io.to(`room_${patient_id}_${doctor_id}`).emit('new_msg', data);
//    } catch (err) {
//      console.error('Error saving message:', err);
//      client.emit('error', { message: 'Failed to send message' });
//    }
//  });
//
//  client.on('join_room', ({ patient_id, doctor_id }) => {
//    if (patient_id && doctor_id) {
//      client.join(`room_${patient_id}_${doctor_id}`);
//    } else {
//      client.emit('error', { message: 'Missing patient_id or doctor_id for room join' });
//    }
//  });
//});
//
//
//sequelize.sync()
//  .then(result => {
//    // console.log(result);
//   server.listen(3000, '0.0.0.0', () => {
//  console.log('Server is running on port 3000');
//});
//
//  })
//  .catch(err => {
//    console.log(err);
//  });




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
 const chat = require('./models/chat')

 const planQuestions =require("./models/plan'sQuestions.js")
 const makes_plan =require("./models/makes_plan")
 const bodyParser=require('body-parser')
 app.use(bodyParser.json());
 const homeRoutes = require('./routes/home');
 const db = require('./database');
 const http = require('http');
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

Patient.hasMany(chat, { foreignKey: 'patient_id' });
chat.belongsTo(Patient,{foreignKey:"patient_id"});
doctor.hasMany(chat, { foreignKey: 'doctor_id' });
chat.belongsTo(doctor,{foreignKey:"doctor_id"});
module.exports={chat,Patient,doctor};



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
const getmusicRoutes = require('./routes/getMusic.js');
app.use('/api/music',getmusicRoutes)

const therapistRoutesbymail = require('./routes/getdoctorisBymail.js');
app.use('/api',therapistRoutesbymail  );


const deleteRoutes = require('./routes/deleteroutes');
 app.use('/delete', deleteRoutes);


 const notificationRoutes = require('./routes/notificationRoutes'); // Import the notification routes
 app.use(express.urlencoded({ extended: true }));

 // Use the notification route for handling /notification requests
 app.use('/notification', notificationRoutes);


 authRoutes=require('./routes/authRoutes')
 app.use('/patient',authRoutes);
 authRoutes=require('./routes/authRoutes')
 app.use('/doctor',authRoutes);
 require('dotenv').config();
 const therapistRoutes = require('./routes/therapist');
 app.use('/api', therapistRoutes);

const musicRoutes = require('./routes/Music');
app.use('/api', musicRoutes);

 const idRoutes = require('./routes/getPatientId');
 app.use('/api', idRoutes);

 const pay1 = require('./routes/pay');
 app.use('/api', pay1);

 const server = http.createServer(app);
 const io = require('socket.io')(server);
 app.use((req, res, next) => {
   res.setHeader('Access-Control-Allow-Origin', '*');
   res.setHeader('Access-Control-Allow-Methods', 'GET, POST, PUT, PATCH, DELETE');
   res.setHeader('Access-Control-Allow-Headers', 'Content-Type, Authorization');
   next();
 });

 app.use('/home', homeRoutes);
//
// // Socket.io channel
// io.on('connection', (client) => {
//   console.log('New client connected!', client.id);
//
//   client.on('load_history', async ({ patient_id, doctor_id }) => {
//     if (!patient_id || !doctor_id) {
//       return client.emit('error', { message: 'Missing patient_id or doctor_id' });
//     }
//
//     try {
//       const [chats] = await db.query(
//         'SELECT * FROM chats WHERE (patient_id = ? AND doctor_id = ?) ORDER BY createdAt',
//         // [patient_id, doctor_id]
//          {   replacements: [patient_id, doctor_id],
//             type: sequelize.QueryTypes.SELECT}
//       );
//       client.emit('chat_history', chats);
//     } catch (err) {
//       console.error('Error loading chat history:', err);
//       client.emit('error', { message: 'Failed to load chat history' });
//     }
//   });
io.on('connection', (client) => {
  console.log('New client connected!', client.id);

  client.on('load_history', async ({ patient_id, doctor_id }) => {
    if (!patient_id || !doctor_id) {
      return client.emit('error', { message: 'Missing patient_id or doctor_id' });
    }

    try {
      const chats = await db.query(
        'SELECT * FROM chats WHERE patient_id = ? AND doctor_id = ? ORDER BY createdAt',
        {
          replacements: [patient_id, doctor_id],
          type: sequelize.QueryTypes.SELECT,
        }
      );

      console.log('📜 Emitting chat_history:', chats);
      client.emit('chat_history', chats);
    } catch (err) {
      console.error('❌ Error loading chat history:', err);
      client.emit('error', { message: 'Failed to load chat history' });
    }
  });



   client.on('msg', async (data) => {
     const { patient_id, doctor_id, message, sender } = data;

     if (!patient_id || !doctor_id || !message || !sender) {
       return client.emit('error', { message: 'All fields are required to send a message' });
     }

     try {
       // Save the message using Sequelize
       await chat.create({ patient_id, doctor_id, message, sender });

       // Emit the new message to the room
       io.to(`room_${patient_id}_${doctor_id}`).emit('new_msg', data);
     } catch (err) {
       console.error('Error saving message:', err);
       client.emit('error', { message: 'Failed to send message' });
     }
   });

   client.on('join_room', ({ patient_id, doctor_id }) => {
     if (patient_id && doctor_id) {
       client.join(`room_${patient_id}_${doctor_id}`);
     } else {
       client.emit('error', { message: 'Missing patient_id or doctor_id for room join' });
     }
   });
 });


 sequelize.sync()
   .then(result => {
     // console.log(result);
    server.listen(3000, '0.0.0.0', () => {
   console.log('Server is running on port 3000');
 });

   })
   .catch(err => {
     console.log(err);
   });