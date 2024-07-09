const mockApi = {
    statusCode: 200,
    data: {
        x:1,
        y:2,
        z:3
    }
};


function fetchData() {

    return new Promise((resolve, reject) => {
        if (mockApi.statusCode === 200) {
            resolve(mockApi.data); 
        } else {
            reject(new Error("Some Error comes in fetching data , you can check your status code"));
        }
     });
}

fetchData().then(data => {
        console.log("Data:", data); 
    })
    .catch(error => {
        console.error("Error:", error.message); 
    });
