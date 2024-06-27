async function fetchData() {
    const url = 'https://jsonplaceholder.typicode.com/posts';

    try {
        const response = await fetch(url);
        const data = await response.json();
        return data;
    } catch (error) {
        console.error(error);
        throw error; 
    }
}

async function fetchAndLogData() {
    try {

        const data = await fetchData();
        console.log('Fetched Data:', data);
    } catch (error) {
        console.error(error);
    }
}

fetchAndLogData();
