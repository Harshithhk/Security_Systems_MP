import mongoose from 'mongoose'
import bcrypt from  'bcryptjs'
const visitSchema = mongoose.Schema({
    name:{
        type: String,
        required: true
    },
    flatNo:{
        type: String,
        required: true
    },
    vehicleNo:{
        type: String,
        required: true
    },
    reasonOfVisit:{
        type: String,
        required: false,
    },
    
    phoneNo:{
        type: Number,
        required:false,
    },
    checkedOut:{
        type: String,
        required:false,
    },
    accepted:{
        type: Boolean,
        require:false,
        default: false,
    },
    warningReason:{
        type: String,
        required: false
    }
},{
    timestamps: true
})

const Visits = mongoose.model('Visits', visitSchema)

export default Visits