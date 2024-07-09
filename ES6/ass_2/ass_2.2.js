let myobject ={
    name:'Girish',
    age:21,
    city:'Jaipur'
}

function parseInfo(object){
    const {name , age='unknown' , city ='unknown'} = object;
    console.log(`name: ${name}`);
    console.log(`age: ${age}`);
    console.log(`city: ${city}`);
}

parseInfo(myobject);

function mergeObjects(obj1, obj2) {
    return { ...obj1, ...obj2 };
  }
  const obj = { x: 1, y: 2 };
  
  const merged = mergeObjects(myobject , obj);
  console.log(merged); 

  function getRemainingProperties({ name, ...rest }) {
   return rest;
  }

  const data =getRemainingProperties(myobject);
  console.log(data);

  function updatePersonInfo(object, newName) {
    return { ...object, name: newName };
  }

  const newobject =updatePersonInfo(myobject ,'Rahul');
  console.log(newobject);

  
  





