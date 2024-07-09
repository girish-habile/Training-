async function fetchDataFromMultipleEndpoints() {
    try {
        const urls = [
            'https://jsonplaceholder.typicode.com/posts/1', 
            'https://api.chucknorris.io/jokes/random'       
        ];

        const responses = await Promise.all(urls.map(url => fetch(url)));

        const dataPromises = responses.map(async response => {
             return await response.json();
        });

        const results = await Promise.all(dataPromises);

        return results;
    } catch (error) {
        console.error('Error fetching data:', error);
        throw error;
    }
}

fetchDataFromMultipleEndpoints()
    .then(results => {
        console.log( results);
    })
    .catch(error => {
        console.error(error);
    });
