import Visits from '../models/visitsModel.js' 


// @route    POST /api/visits/addVisit
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

const checkOut= async(req,res) =>{
    const {id} = req.body
    console.log(req.body)

    try{
        var checkoutVisit = await Visits.findByIdAndUpdate(id,{checkedOut: Date.now().toString()});
        console.log(checkoutVisit);
        res.status(200).send(checkoutVisit)
    }catch(err){
        console.log(err)
        res.status(400).send(err)
    }
}


// @route    POST /api/visits/
// @access   Public
const getVisits = async(req,res)=>{


    const params = req.url.split('=')[1]
    console.log(params)
    
    try{
        var visits
        if(!params){
             visits = await Visits.find({checkedOut :null})
        }else if(params == "warning"){
            visits = await Visits.find({checkedOut :null,warningReason: {$ne: null}})
        }else{
             visits = await Visits.find({checkedOut :null,flatNo: params,accepted:false})
        }
        console.log(visits)
    res.send(visits)
    }catch(err){
        res.status(404)
    }
}


// @route    POST /api/visits/
// @access   Public
const expiredVisits = async(req,res)=>{

    const timeOut = 0.016;
    
    let expiredVisits=[];
    try{
    var visits = await Visits.find({checkedOut :null})
    visits.forEach(visit => {

        var diff =(new Date(Date.now()).getTime() - new Date(visit.createdAt).getTime()) / 1000;
  diff /= (60 * 60);
  Math.abs(Math.round(diff));
  console.log(`DIFF : ${diff}` )
        
  if(diff > timeOut){
    expiredVisits.push(visit);
  }
       
        
    });

    // console.log(expiredVisits)
    console.log(expiredVisits.length)
    res.send(expiredVisits)
    }catch(err){
        res.status(404)
    }
    
}

const confirmVisit= async(req,res) =>{
    const {id} = req.body
    console.log(req.body)

    try{
        var acceptedVisit = await Visits.findByIdAndUpdate(id,{accepted: true});
        console.log(acceptedVisit);
        res.status(200).send(acceptedVisit)
    }catch(err){
        console.log(err)
        res.status(400).send(err)
    }
}

const rejectVisit= async(req,res) =>{
    const {id,bySecurity} = req.body
    console.log(req.body)

    
    try{
        var acceptedVisit
        if(bySecurity == 'true'){
            console.log("SECURITY")
         acceptedVisit = await Visits.findByIdAndUpdate(id,{warningReason: "SECURITY"});
        }else{
            console.log("RESIDENT")
         acceptedVisit = await Visits.findByIdAndUpdate(id,{warningReason: "RESIDENT"});
        }
        console.log(acceptedVisit);
        res.status(200).send(acceptedVisit)
    }catch(err){
        console.log(err)
        res.status(400).send(err)
    }
}


export{addVisit,getVisits,checkOut,expiredVisits,confirmVisit,rejectVisit}