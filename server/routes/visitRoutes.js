import express from 'express'
const router = express.Router()
import {
  addVisit,
//   getVisit,
  // getUserProfile,
  // updateUserProfile,
  // getUserName,
} from '../controllers/visitController.js'
import {protect} from '../middlewares/authMiddleware.js'

router.route('/addVisit').post(addVisit)
// router.post('/loginResident',residentAuth)
// router.route('/profile').get(protect,getUserProfile).put(protect,updateUserProfile)
// router.route('/profile/:id').get(getUserName)

export default router