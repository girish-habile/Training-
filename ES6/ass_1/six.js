//Ques 8

const numbers = [1, 2, 3, 4, 5];
const doubledNumbers = numbers.map(num => num * 2);
console.log(doubledNumbers);


numbers.forEach((num, index) => {
    console.log(`Element at index ${index}: ${num}`);
});

const number2 = [5, 8, 15, 3, 2];
const result = number2.some(num => num > 10);
console.log(result); 

const number3 = [1, 2, 3, -4, 5];
const positive = number3.every(num => num > 0);

console.log(positive);
const even = numbers.filter(num => num % 2 === 0);
console.log(even);