// 整体进度
@Component
export default struct SummaryInfo {
  @Prop latestUpdateTime: string
  @Prop finishedTaskNum: number
  @Prop totalTaskNum: number

  build() {
    Row() {
      Column() {
        Text('整体进度')
        Text('最近更新：' + this.latestUpdateTime)
      }
      .alignItems(HorizontalAlign.Start)
      .margin({ left: 10 })

      Blank()

      Stack() {
        //进度条
        Progress({ value: this.finishedTaskNum, total: this.totalTaskNum, type: ProgressType.Ring })
          .color(Color.Green)
          .style({ strokeWidth: 2 })
          .backgroundColor(Color.Black)
          .width(50)
          .height(50)
        // 文本
        Row() {
          Text(this.finishedTaskNum.toString())
            .fontSize(12)
            .fontColor(Color.Green)
          Text("/" + this.totalTaskNum.toString())
            .fontSize(12)
            .fontColor(Color.Black)
        }
        .width('100%')
        .height('100%')
        .justifyContent(FlexAlign.Center)

      }
      .width(50)
      .height(50)
      .margin({ right: 10 })

    }
    .margin({ top: 10 })
    .justifyContent(FlexAlign.SpaceBetween)
    .width('100%')
  }
}

@Preview
@Component
struct summaryPreview {
  build() {
    SummaryInfo({
      latestUpdateTime: new Date().toDateString(),
      finishedTaskNum: 1,
      totalTaskNum: 5
    })
  }
}