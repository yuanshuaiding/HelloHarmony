import router from '@ohos.router'
import { FruitBean } from '../beans/FruitBean'

@Entry
@Component
struct Index {
  @State message: string = 'Hello ArkTs'

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
      TitleBar({ title: '排行榜', dataRefresh: $dataChange})
      //二级标题栏
      SubTitleBar()
      //列表
      if (this.dataChange) {
        FruitList({ fruits: this.fruits1 })
      } else {
        FruitList({ fruits: this.fruits2 })
      }


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
          this.dataRefresh=!this.dataRefresh
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
