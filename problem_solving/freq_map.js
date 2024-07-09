let intersect = function(nums1, nums2) {
    const map = new Map();
    for (const n of nums1) {
        if (map.has(n)) {
            map.set(n, map.get(n) + 1);
        } else {
            map.set(n, 1);
        }
    }
    const result = [];
    for (const n of nums2) {
        if (map.has(n) && map.get(n) > 0) {
            result.push(n);
            map.set(n, 0);
        }
    }
    return result;
};

let nums1 =[1 , 2 ,2 , 3 , 4 , 5 , 2];
let nums2 = [ 2 , 2 , 3  , -1 , 3 , 5 , 6 ]
let res2 = intersect(nums1 , nums2);
console.log(res2);