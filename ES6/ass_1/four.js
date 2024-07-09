//Ques 7



async function process(posts) {
    try {
        
        const filteredPosts = posts.filter(post => post.userId === 1);
        return filteredPosts;
    } catch (error) {
        console.error('Error filtering data:', error.message);
        throw error;
    }
}



async function performTasksSequentially() {
    try {
        //Task 1
        const url = 'https://jsonplaceholder.typicode.com/posts';
        const response = await fetch(url);
        const data = await response.json();
        console.log(data);
        console.log('Task 1 completed: Data fetched');

        //Task 2
        const processedData = process(data);
        console.log(processedData);
        console.log('Task 2 completed: Data processed');

        //Task 3
        const postUrl = 'https://jsonplaceholder.typicode.com/posts';
        const postDataResponse = await fetch(postUrl, {
            method: 'POST',
            body: JSON.stringify(processedData)
        });
        console.log('Task 3 completed: Data posted successfully');
        
        return postDataResponse;
    } catch (error) {
        console.error('Error performing tasks:', error.message);
        throw error;
    }
}


performTasksSequentially().then(result => {
        console.log('All tasks completed successfully');
    })
    .catch(error => {
        console.error('Error in performing tasks:', error.message);
    });



