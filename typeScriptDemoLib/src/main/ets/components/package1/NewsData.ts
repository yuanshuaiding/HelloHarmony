/*
任何声明（比如变量，函数，类，类型别名或接口）都能够通过添加export关键字来导出，例如我们要把NewsData这个类导出，代码示意如下：
 */
import List from '@ohos.util.List'
// 导出类
export class NewsDataBean {
  title: string
  content: string
  imgUrl: string
  source: string

  constructor(t: string, c: string, i: string, s: string) {
    this.title = t
    this.content = c
    this.imgUrl = i
    this.source = s
  }
}

// 导出函数
export function getNews():List<NewsDataBean>{
  var news=new List<NewsDataBean>()
  return news
}