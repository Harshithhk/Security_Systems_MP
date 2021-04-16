import Visits from '../models/visitsModel.js' 

// @desc     Auth user & get token
// @route    POST /api/users/login
// @access   Public
const addVisit =async(req,res) => {
    const {name,phoneNo,flatNo,vehicleNo,reasonOfVisit} = req.body
    
    console.log(req.body)
    // const flat = await Resident.findOne({flatNo:flatNo})
try{
    var visit = await Visits.create(req.body)
    res.send(visit)
}catch(err){
    console.log(err)
}
}


export{addVisit}