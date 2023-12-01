// 1.if语句
let num1: number = 5
if (num1 > 0) {
  console.log('数字为正数')
}

// 2.if...else语句
let num2: number = 12;
if (num2 % 2 == 0) {
  console.log('偶数');
} else {
  console.log('奇数');
}

// 3.if...else if...else语句
let num3: number = 0;
if (num3 > 0) {
  console.log('正数');
} else if (num3 < 0) {
  console.log('负数');
} else {
  console.log('为0');
}

// 4.switch语句
var grade: string = 'A'
switch (grade) {
  case 'A': {
    console.log('优秀');
    break;
  }
  case 'B': {
    console.log('良好');
    break;
  }
  default: {
    console.log('普通');
    break;
  }
}