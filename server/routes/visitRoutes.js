import express from 'express'
const router = express.Router()
import {
  addVisit,
  getVisits,
  checkOut,
  expiredVisits,
  confirmVisit,
  rejectVisit,
  addGuestVisit
  // getUserProfile,
  // updateUserProfile,
  // getUserName,
} from '../controllers/visitController.js'
import {protect} from '../middlewares/authMiddleware.js'

router.route('/').get(getVisits)

router.route('/addvisit').post(addVisit)
router.route('/addGuestVisit').post(addGuestVisit)
router.route('/checkout').post(checkOut)
router.route('/expiredvisits').get(expiredVisits)
router.route('/confirmVisit').post(confirmVisit)
router.route('/rejectVisit').post(rejectVisit)
// router.post('/loginResident',residentAuth)
// router.route('/profile').get(protect,getUserProfile).put(protect,updateUserProfile)
// router.route('/profile/:id').get(getUserName)

export default router