         // all modules

const express = require('express');
const { route } = require('./university.route');
const universityRoutes = require('./university.route')
const programmeRoutes = require('./programme.route');
const leadRoutes = require('./lead.route')
// const grantRoutes = require('./grants.route');

 
const router = express.Router();

/**
 * GET v1/status
 */
router.use('/university', universityRoutes);
router.use('/programme',programmeRoutes)
router.use('/lead', leadRoutes);
 
module.exports = router;



     