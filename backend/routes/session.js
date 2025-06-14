// // const express = require('express');
// // const router = express.Router();
// // const { session } = require('../models/Session'); 

// // const { makesession} = require('../models/MakeSession'); 


// // router.get('/session/patient/:patientId', async (req, res) => {
// //   const { patientId } = req.params;

// //   try {
// //     const patientSessions = await makesession.findAll({
// //       where: { patient_id: patientId },
// //       include: [{
// //         model: session,
// //         where: { status: 'scheduled' }, // you can filter by status or date if needed
// //       }],
// //       order: [[session, 'Date', 'ASC']], // earliest session first
// //       limit: 1, // Get only next session, remove or adjust as needed
// //     });

// //     if (!patientSessions || patientSessions.length === 0) {
// //       return res.status(404).json({ message: 'No upcoming sessions found' });
// //     }

// //     // Return the session details
// //     res.json(patientSessions[0].session);
// //   } catch (error) {
// //     console.error(error);
// //     res.status(500).json({ message: 'Server error' });
// //   }
// // });

// // module.exports = router;
// // routes/session.js (or wherever your session routes are)

// // Required imports
// const express = require('express');
// const router = express.Router();

// const makesession = require('../models/MakeSession'); // Your junction model
// const session = require('../models/Session');
// const doctor = require('../models/Doctor');

// // Route to get all sessions for a patient by patientId
// router.get('/sessions/patient/:patientId', async (req, res) => {
//   const { patientId } = req.params;
//   const { page = 1, pageSize = 10 } = req.query;

//   try {
//     // Validate patientId
//     if (!Number.isInteger(Number(patientId))) {
//       return res.status(400).json({ 
//         error: 'Invalid patient ID format' 
//       });
//     }

//     // Validate pagination parameters
//     const parsedPage = Math.max(1, parseInt(page));
//     const parsedPageSize = Math.min(Math.max(1, parseInt(pageSize)), 100);

//     const { count, rows: sessions } = await makesession.findAndCountAll({
//       where: { 
//         patient_id: Number(patientId) 
//       },
//       include: [
//         {
//           model: session,
//           attributes: ['session_id', 'name', 'status', 'date', 'duration'],
//           where: { status: 'scheduled' }, // Only active sessions
//           required: true // INNER JOIN
//         },
//         {
//           model: doctor,
//           attributes: ['doctor_id', 'name', 'specialization', 'license_number'],
//           required: true
//         }
//       ],
//       order: [[session, 'date', 'ASC']],
//       limit: parsedPageSize,
//       offset: (parsedPage - 1) * parsedPageSize
//     });

//     if (sessions.length === 0) {
//       return res.status(404).json({ 
//         message: 'No sessions found for this patient',
//         code: 'NO_SESSIONS_FOUND'
//       });
//     }

//     // Safe response mapping
//     const formattedSessions = sessions.map((item) => {
//       const sessionData = item.session?.get({ plain: true }) || {};
//       const doctorData = item.doctor?.get({ plain: true }) || {};

//       return {
//         session_id: sessionData.session_id,
//         name: sessionData.name,
//         status: sessionData.status,
//         date: sessionData.date?.toISOString(), // Format dates
//         duration: sessionData.duration,
//         doctor: {
//           id: doctorData.doctor_id,
//           name: doctorData.name,
//           specialization: doctorData.specialization,
//           license: doctorData.license_number
//         }
//       };
//     });

//     res.status(200).json({
//       data: formattedSessions,
//       meta: {
//         total: count,
//         page: parsedPage,
//         pageSize: parsedPageSize,
//         totalPages: Math.ceil(count / parsedPageSize)
//       }
//     });

//   } catch (error) {
//     console.error(`Error fetching sessions for patient ${patientId}:`, error);
//     res.status(500).json({ 
//       error: 'Internal server error',
//       code: 'SESSION_FETCH_ERROR',
//       correlationId: req.correlationId // Add request tracking
//     });
//   }
// });
const express = require('express');
const router = express.Router();
const makesession = require('../models/MakeSession');
const session = require('../models/Session');
const doctor = require('../models/Doctor');

router.get('/sessions/patient/:patientId', async (req, res) => {
  const { patientId } = req.params;
  const { page = 1, pageSize = 10 } = req.query;

  try {
    const parsedPage = Math.max(1, parseInt(page));
    const parsedPageSize = Math.min(Math.max(1, parseInt(pageSize)), 100);

    const { count, rows: sessions } = await makesession.findAndCountAll({
      where: { patient_id: Number(patientId) },
      include: [
        {
          model: session,
          attributes: ['session_id', 'name', 'status', 'date', 'duration'],
          where: { status: 'scheduled' },
          required: true,
        },
        {
          model: doctor,
          attributes: ['doctor_id', 'name', 'specialization', 'license_number'],
          required: true,
        },
      ],
      order: [[session, 'date', 'ASC']],
      limit: parsedPageSize,
      offset: (parsedPage - 1) * parsedPageSize,
    });

    const formattedSessions = sessions.map((item) => {
      const s = item.session?.get({ plain: true }) || {};
      const d = item.doctor?.get({ plain: true }) || {};
      return {
        session_id: s.session_id,
        name: s.name,
        status: s.status,
        date: s.date?.toISOString(),
        duration: s.duration,
        doctor: {
          id: d.doctor_id,
          name: d.name,
          specialization: d.specialization,
          license: d.license_number,
        },
      };
    });

    res.status(200).json({
      data: formattedSessions,
      meta: {
        total: count,
        page: parsedPage,
        pageSize: parsedPageSize,
        totalPages: Math.ceil(count / parsedPageSize),
      },
    });
  } catch (error) {
    console.error('Error fetching sessions:', error);
    res.status(500).json({
      error: 'Internal server error',
      code: 'SESSION_FETCH_ERROR',
    });
  }
});

module.exports = router;
