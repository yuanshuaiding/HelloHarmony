/*函数是一组一起执行一个任务的语句。

函数的声明就是告诉编译器函数的名称、参数、返回值类型。

函数分为：有名称函数和匿名函数：*/
//有名称函数
function add(x: number, y: number): number {
  return x + y;
}

//匿名函数
let myAdd = function (x: number, y: number): number {
  return x + y;
}

// 函数支持可选参数，使用?表示，如下所示，lastName为可选参数，调用时此参数可以传值，也可以不传：
function getName(firstName:string,lastName?:string){
  if(lastName){
    return firstName+' '+lastName;
  }else{
    return firstName;
  }
}

let result1=getName('bob');
let result2=getName('bob','Admas');

//函数还支持剩余参数（可变参数），使用...进行定义，调用时可以一个都没有，也可以有任意多个：
function getNames(firstName:string, ...otherNames:string[]){
  return firstName+' '+otherNames.join(' ');
}

let names1=getNames('tom');
let names2=getNames('tom','jim','tony');

/* ES6版本的TypeScript新增了箭头函数，这是匿名函数的简写方式，多用于函数表达式，它省略了function关键字，其定义如下：
```
([param1,param2,...paramN])=>{
  //代码块
}
如下例所示：
```*/
let arrowFun=(num:number)=>{
  if(num>0){
    console.log(num+'为正数');
  }else{
    console.log(num+'为非正数');
  }
}
//调用同普通函数一样
arrowFun(-1);