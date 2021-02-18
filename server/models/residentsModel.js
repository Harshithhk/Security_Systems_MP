import mongoose from 'mongoose'
import bcrypt from  'bcryptjs'
const residentSchema = mongoose.Schema({
    name:{
        type: String,
        required: true
    },
    password:{
        type: String,
        required: true,
    },
    wing:{
        type: String,
        required: true
    },
    flatNo:{
        type: String,
        required: true
    },
    phoneNo:{
        type: Number,
        required:true,
    },
    isRental:{
        type: Boolean,
        required: true,
        default : false
    },
    ownerId:{
        type: mongoose.Schema.Types.ObjectId,
        required: false,
        ref: 'Resident'
    },
    avatar:{
        type: String,
        required: false,
    },
    expecting:{
        type: [mongoose.Schema.Types.ObjectId],
        required: false,
    }   
},{
    timestamps: true
})

residentSchema.methods.matchPassword = async function(enteredPasswrod){
    return await bcrypt.compare(enteredPasswrod, this.password)
}

residentSchema.pre('save', async function(next){
    if(!this.isModified('password')){
        next()
    }

    const salt = await bcrypt.genSalt(10)
    this.password =await bcrypt.hash(this.password,salt)
})

const Resident = mongoose.model('Resident', residentSchema)

export default Resident