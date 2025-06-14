// const express = require('express');
// const router = express.Router();
// const Patient = require('../models/Patient');

// router.get("/getpatientname", async (req, res) => {
//   const { patient_id } = req.query;

//   if (!patient_id) {
//     return res.status(400).json({
//       status_code: 400,
//       message: "!patient_id is required"
//     });
//   }

//   try {
//     const patientRecord = await Patient.findOne({
//       where: { patient_id: patient_id },
//       attributes: ['name'] // fetch only the name column
//     });

//     if (patientRecord) {
//       res.status(200).json({
//         status_code: 200,
//         patient_name: patientRecord.name
//       });
//     } else {
//       res.status(200).json({
//         status_code: 200,
//         patient_name: null // or 'Not found'
//       });
//     }
//   } catch (error) {
//     console.error("Error fetching patient name:", error);
//     res.status(500).json({
//       status_code: 500,
//       message: "Internal server error"
//     });
//   }
// });

// module.exports = router;
const express = require('express');
const router = express.Router();
const Patient = require('../models/Patient');

// router.post("/get_patientNamesByIds", async (req, res) => {
//   try {
//     const { patient_ids } = req.body; // Expecting array of IDs

//     if (!Array.isArray(patient_ids) || patient_ids.length === 0) {
//       return res.status(400).json({ status_code: 400, message: "patient_ids must be a non-empty array" });
//     }

//     const patients = await Patient.findAll({
//       where: { id: patient_ids },
//       attributes: ['id', 'FirstName']
//     });

//     // Map id to name for easy lookup
//     const idNameMap = {};
//     patients.forEach(p => {
//       idNameMap[p.id] = p.FirstName;
//     });

//     res.status(200).json({
//       status_code: 200,
//       patientNames: idNameMap // Object with id:name pairs
//     });
//   } catch (error) {
//     console.error("Error fetching patient names by IDs:", error);
//     res.status(500).json({ status_code: 500, message: "Internal server error" });
//   }
// }
router.post("/get_patientNamesByIds", async (req, res) => {
  try {
    const { patient_ids } = req.body;

    if (!Array.isArray(patient_ids) || patient_ids.length === 0) {
      return res.status(400).json({ status_code: 400, message: "patient_ids must be a non-empty array" });
    }

    const patients = await Patient.findAll({
      where: { patient_id: patient_ids },
      attributes: ['FirstName'],
    });

    const names = patients.map(p => ({ name: p.FirstName }));

    res.status(200).json({
      status_code: 200,
      patientNames: names, // ✅ List of objects with 'name' key
    });
  } catch (error) {
    console.error("Error fetching patient names by IDs:", error);
    res.status(500).json({ status_code: 500, message: "Internal server error" });
  }
});


module.exports = router;
