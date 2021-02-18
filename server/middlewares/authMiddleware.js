import jwt from 'jsonwebtoken'
import Resident from '../models/residentsModel.js'

const protect =async(req,res,next)=>{
    console.log("authmiddle")
    let token

    if(req.headers.authorization && req.headers.authorization.startsWith('Bearer')){
        try{
            token =req.headers.authorization.split(' ')[1]

            const decoded = jwt.verify(token,process.env.JWT_SECRET)

            req.user = await User.findById(decoded.id).select('-password')

            next()
        }catch(error){
            console.log(error)
            res.status(401)
            throw new Error('Not Authorized, token failed')
        }
    }

    if(!token){
        res.status(401)
        throw new Error('Not authorized,no token')

    }
}

export {protect}