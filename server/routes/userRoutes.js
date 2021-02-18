import express from 'express'
const router = express.Router()
import {
  residentAuth,
  registerResident,
  // getUserProfile,
  // updateUserProfile,
  // getUserName,
} from '../controllers/userController.js'
import {protect} from '../middlewares/authMiddleware.js'

router.route('/registerResident').post(registerResident)
router.post('/loginResident',residentAuth)
// router.route('/profile').get(protect,getUserProfile).put(protect,updateUserProfile)
// router.route('/profile/:id').get(getUserName)

export default router