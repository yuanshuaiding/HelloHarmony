/*1.布尔值

TS使用boolean表示某变量为布尔值，可以赋值true或false*/
let isDone: boolean = true;

/*2.数字

TS里的所有数字都是浮点数，类型用number表示，支持十进制、二进制、八进制、十六进制。*/
let decLiteral: number = 2023;
let binaryLiteral: number = 0b11111100111;
let octalLiteral: number = 0o3747;
let hexLiteral: number = 0x7e7;
// 以上都是2023的数字类型表示，打印结果是一样的

/*3.字符串

TS里使用string标识文本数据类型，可以使用双引号赋值，也可以使用单引号：*/
let name: string = "tom";
name = "jim";
name = 'eric';

/*
4.数组

TS支持两种方式声明数组：

第一种：元素类型后面跟[]，表示由此类型组成的一个数组；

第二种：使用数组泛型Array<元素类型>.
*/
let list1: number[] = [1, 2, 3];
let list2: Array<number> = [1, 2, 3];

/*
5.元组

元组类型允许表示一个已知元素数量和类型的数组，各元素类型可以不同。
*/
let x: [string, number];
x = ['hello', 10]; //ok
// x=[10,'hello']; //error

/*
6.枚举

enum类型是对JavaScript标准数据类型的补充，使用枚举可以为数值赋予更友好的名字。
*/
enum Color {Red, Green, Blue};
let c: Color = Color.Red;

/*
7.unknown

对于编程阶段还不清楚类型的变量可以使用unknown来标记。
*/
let notSure: unknown = 4;
notSure = 'maybe string';
notSure = false;

/*
8.void

当一个函数无返回值时，可以使用void返回值类型
*/
function funtest(): void {
  console.log("this function is void");
}

/*
9.null和undefined

TypeScript里null和undefined都有自己的类型：
*/
let u: undefined = undefined;
let n: null = null;

/*
10.联合类型

表示取值可以是多种类型中的一种：
*/
let myFarvorite: string | number;
myFarvorite = 'flower';
myFarvorite = 10;




