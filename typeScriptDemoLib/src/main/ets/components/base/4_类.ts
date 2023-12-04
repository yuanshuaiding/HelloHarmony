/*
 * TypeScript支持基于类的面向对象编程，定义类的关键字为class，后面紧跟类名，类体里包含创建对象时所需的共同属性与方法
 * */

class Person {
  private name: string
  private age: number

  constructor(name: string, age: number) {
    this.name = name
    this.age = age
  }

  public getPersonInfo(): string {
    return "My name is ${this.name} and my age is ${this.age}"
  }
}

let p: Person = new Person("tome", 19)
p.getPersonInfo()


/*
 * 类支持继承，使用extends关键字，表示子类具有父类相同的某些特征或行为
 */

class Employee extends Person {
  private department: string //子类特有属性

  constructor(name: string, age: number, department: string) {
    super(name, age)
    this.department = department
  }

  public getEmployeeInfo(): string {
    return this.getPersonInfo() + " and department is ${this.department}"
  }
}

// 使用
var employee = new Employee("jom", 20, "IT")
employee.getPersonInfo() //父类共同方法
employee.getEmployeeInfo() //子类特有方法