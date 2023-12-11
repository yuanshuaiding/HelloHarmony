import router from '@ohos.router'
import FaultLogger from '@ohos.faultLogger'
import { FruitBean } from '../beans/FruitBean'
import promptAction from '@ohos.promptAction'

@Entry
@Component
struct Index {
  private clickBackTime: number = 0
  @State message: string = 'Hello ArkTs'

  onBackPress() {
    //1秒内连续两次点击返回才能退出应用限制
    if (this.showDoubleClickToast()) {
      promptAction.showToast({
        message: "再次点击退出应用",
        duration: 1000,
      })
      this.clickBackTime = new Date().getTime()
      return true
    }
    return false
  }

  showDoubleClickToast(): boolean {
    return new Date().getTime() - this.clickBackTime > 4500
  }

  build() {
    Stack() {
      排行榜()
    }.width('100%')
    .height('100%')
  }
}

@Component
struct 排行榜 {
  fruits1: Array<FruitBean> = [
    new FruitBean(false, '榴莲', 7000),
    new FruitBean(false, '山楂', 6000),
    new FruitBean(false, '葡萄', 5000),
    new FruitBean(false, '菠萝', 4000),
    new FruitBean(false, '橘子', 3000),
    new FruitBean(false, '香蕉', 2000),
    new FruitBean(true, '苹果', 1000),
  ]
  fruits2: Array<FruitBean> = [
    new FruitBean(true, '苹果', 1000),
    new FruitBean(false, '香蕉', 2000),
    new FruitBean(false, '橘子', 3000),
    new FruitBean(false, '菠萝', 4000),
    new FruitBean(false, '葡萄', 5000),
    new FruitBean(false, '山楂', 6000),
    new FruitBean(false, '榴莲', 7000),
  ]
  @State dataChange: boolean = false

  build() {
    Column() {
      // 导航栏
      TitleBar({ title: '排行榜', dataRefresh: $dataChange })
      //二级标题栏
      SubTitleBar()
      //列表
      if (this.dataChange) {
        FruitList({ fruits: this.fruits1 })
      } else {
        FruitList({ fruits: this.fruits2 })
      }
      //使用@Builder快速构建列表
      FruitList2({ fruits: this.fruits1 })
    }.width('100%')
    .height('100%')
  }
}


@Component
struct TitleBar {
  private title: string = ""
  @Link dataRefresh: boolean

  build() {
    Row() {
      Image($r('app.media.ic_back'))
        .width(20)
        .height(20)
        .margin({ left: 10 })
        .onClick(() => {
          router.back()
        })
      Text(this.title)
        .fontColor(Color.Black)
        .fontSize(18)
        .layoutWeight(1)
        .padding({ left: 10, right: 10 })

      Image($r('app.media.ic_refresh'))
        .width(20)
        .height(20)
        .margin({ left: 10, right: 10 })
        .onClick(() => {
          this.dataRefresh = !this.dataRefresh
        })
    }
    .width('100%')
    .height(42)
    .backgroundColor(Color.Gray)
  }
}

@Component
struct SubTitleBar {
  build() {
    Row() {
      Text('排名').width('20%').textAlign(TextAlign.Center)
      Text('种类').layoutWeight(1)
      Text('得票数').width('30%').textAlign(TextAlign.Center)
    }
    .width('100%')
    .height(30)
    .backgroundColor('#ffececec')
  }
}

@Component
struct FruitList {
  @State fruits: Array<FruitBean> = []

  build() {
    Column() {
      ForEach(this.fruits, (item, index) => {
        FruitComponentItem({ fruit: item, num: index })
      })
    }
    .width('100%')
  }
}

@Component
struct FruitComponentItem {
  @State fruit: FruitBean = null
  num: number

  build() {
    Row() {
      Text((this.num + 1).toString())
        .width('20%')
        .textAlign(TextAlign.Center)
        .backgroundColor(this.fruit.Selected ? 0xaaccdd : 0xffffff)
      Text(this.fruit.Name).layoutWeight(1)
      Text(this.fruit.Tickets.toString()).width('30%').textAlign(TextAlign.Center)
    }
    .width('100%')
    .height(30)
    .onClick(() => {
      this.fruit.Selected = !this.fruit.Selected
    })
  }
}

@Component
struct FruitList2 {
  fruits: Array<FruitBean> = []

  build() {
    Column() {
      Text("使用@Builder快速构建列表").align(Alignment.Start)
      ForEach(this.fruits, (item, index) => {
        this.FruitComponentItemBuilder(item, index)
      })
    }
    .width('100%')
  }

  //@Builder装饰的方法用于定义组件的声明式UI描述，在一个自定义组件内快速生成多个布局内容。
  @Builder FruitComponentItemBuilder(fruit: FruitBean, index: number) {
    Row() {
      Text((index + 1).toString())
        .width('20%')
        .textAlign(TextAlign.Center)
        .backgroundColor(fruit.Selected ? 0xaaccdd : 0xe2e2e2)
      Text(fruit.Name).layoutWeight(1)
      Text(fruit.Tickets.toString()).width('30%').textAlign(TextAlign.Center)
    }
    .width('100%')
    .height(30)
    .backgroundColor(0xe2e2e2)
    .onClick(() => {
      fruit.Selected = !fruit.Selected
    })
  }
}

