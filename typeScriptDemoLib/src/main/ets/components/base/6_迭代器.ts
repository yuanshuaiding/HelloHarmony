// 当一个对象实现了Symbol.iterator属性时，我们认为它是可迭代的。一些内置的类型如Array，Map，Set，String，Int32Array，Uint32Array等都具有可迭代性。

/*for..of语句
for..of迭代器会遍历可迭代对象，调用对象上的Symbol.iterator方法，如下：
*/
let someArray:Array<any> = [1, "string", false];

for (let entry of someArray) {
  console.log(entry.toString()) // 1, "string", false
}

/* for..in语句
与of语句不同的是，in语句迭代的对象时对象的键（索引）
*/
let list = [4, 5, 6];

for (let i in list) {
  console.log(i); // "0", "1", "2",
}

for (let i of list) {
  console.log(i.toString()); // "4", "5", "6"
}

list.forEach((number,index,arr)=>{
  console.log(number+"")
})

