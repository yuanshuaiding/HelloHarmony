/*
随着应用越来越大，通常要将代码拆分成多个文件，即所谓的模块（module）。模块可以相互加载，并可以使用特殊的指令 export 和 import 来交换功能，从另一个模块调用一个模块的函数。

两个模块之间的关系是通过在文件级别上使用 import 和 export 建立的。模块里面的变量、函数和类等在模块外部是不可见的，除非明确地使用 export 导出它们。类似地，我们必须通过 import 导入其他模块导出的变量、函数、类等。
 */

//导出：参考package1包下的NewsData类


//导入类
import { getNews, NewsDataBean } from '../package1/NewsData'
var news:NewsDataBean= new NewsDataBean("title","content","url","")


//导入函数
var newsList=getNews()