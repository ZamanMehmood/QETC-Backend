         // all modules

const express = require('express');
const universityRoutes = require('./university.route')
// const grantRoutes = require('./grants.route');

 
const router = express.Router();

/**
 * GET v1/status
 */
router.use('/university', universityRoutes);
// router.use('/lead', leadRoutes);
 
module.exports = router;



     