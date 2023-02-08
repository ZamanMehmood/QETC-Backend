         // all modules

const express = require('express');
const { route } = require('./university.route');
const universityRoutes = require('./university.route')
const programmeRoutes = require('./programme.route');
const leadRoutes = require('./lead.route')
const applicantsRoute = require('./applicants.route');
const usersRoute = require('./users.route');
const backupsRoutes = require('./backups.route')

 
const router = express.Router();

/**
 * GET v1/status
 */

router.use('/backups', backupsRoutes);

router.use('/university', universityRoutes);
router.use('/programme',programmeRoutes)
router.use('/lead', leadRoutes);
router.use('/applicants',applicantsRoute)
router.use('/users',usersRoute)

router.use('/users',usersRoute)

module.exports = router;



     