// Ques 1

function multiplywihCallback(a , b , callback){
    let result = a*b;
    callback(result);
}

function print(x){
    console.log("Value :" + x);
}

multiplywihCallback(3 , 4 , print);


function doAsyncOperation(callback){
    setTimeout(() =>{
        callback();
    } , 2000);
}

function print2(){
    console.log("Async operation in 2 sec delay");
}

doAsyncOperation(print2);

//Ques 3

function delay(time) {
    return new Promise((resolve, reject) => {
        setTimeout(() => {
            resolve(`Resolved after ${time } milliseconds`);
        }, time);
    });
}

delay(3000).then(msg => {
    console.log(msg); 
})