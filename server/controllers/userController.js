import generateToken from '../utils/generateToken.js'
import Resident from '../models/residentsModel.js' 

// @desc     Auth user & get token
// @route    POST /api/users/login
// @access   Public
const residentAuth =async(req,res) => {
    const {flatNo,password} = req.body
    console.log(req.body)
    
    const user = await Resident.findOne({flatNo:flatNo})
    console.log(user)

    if(user && (await user.matchPassword(password))){
        delete user.password
        res.json({
            user: {
                name:user.name,
                    wing:user.wing,
                    flatNo:user.flatNo,
                    phoneNo:user.phoneNo,
                    isRental:user.isRental,
                    ownerId:user.ownerId,
                    avatar:user.avatar,
                    expecting:user.expecting,
                },
            token: generateToken(user._id),
        })
    } else {
        res.status(401)
        throw new Error('Invalid email or password')
    }
}


// @desc     Register a new user
// @route    POST /api/users
// @access   Public
const registerResident =async(req,res) => {
    const {name,password,wing,flatNo,phoneNo,isRental,ownerId,avatar} = req.body
    
    const userExists = await Resident.findOne({flatNo:flatNo})

    if(!userExists){

        const user = await Resident.create({name,password,wing,flatNo,phoneNo,isRental,ownerId,avatar})

        if(user){
             delete user['password']
            res.json({
                user: {
                    name:user.name,
                    wing:user.wing,
                    flatNo:user.flatNo,
                    phoneNo:user.phoneNo,
                    isRental:user.isRental,
                    ownerId:user.ownerId,
                    avatar:user.avatar,
                    expecting:user.expecting,
                },
                token: generateToken(user._id),    
            })
        }else{
            res.status(400).json('Invalid user data')
        }
    }else{
        res.status(400).json('UserExists')
    }
}



// @desc     GET user profile
// @route    GET /api/users/profile
// @access   Private
const getUserProfile =async(req,res)=>{
    
   const user = await Resident.findById(req.user._id)

   if(user){
    res.json({
        _id: user._id,
        name: user.name,
        email: user.email,
        isAdmin: user.isAdmin,
        likes:user.likes,
        rating:user.rating,
        endorsments:user.endorsments,
        communityRatings:user.communityRatings,
        questionSubscriptions: user.questionSubscriptions,
    })
   }else{
       res.status(404)
       throw new Error('User not found')
   }
}


// @desc     Update user profile
// @route    PUT /api/users/profile
// @access   Private
const updateUserProfile = async(req,res) => {
    
    
   
//    console.log(`USER OF REPLY ${userOfReply}`)
   
   const user = await Resident.findById(req.user._id)

   if(user){

        // UPDATING USER
        user.name = req.body.name || user.name
        user.email = req.body.email || user.email
        if(req.body.password){
            user.password = req.body.password
        }
        user.likes = req.body.likes || user.likes
        user.questionSubscriptions = req.body.questionSubscriptions || user.questionSubscriptions

        const updatedUser = await user.save()

        res.json({
            name : updatedUser.name,
            email : updatedUser.email,
            likes: updatedUser.likes
        })

   }else{
       res.status(404)
       throw new Error('User not found')
   }
}


export{residentAuth,registerResident,getUserProfile,updateUserProfile}