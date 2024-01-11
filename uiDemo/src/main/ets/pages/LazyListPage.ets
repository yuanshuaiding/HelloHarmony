import { ItemBean } from '../beans/ItemBean'
import { MyDataSource } from '../viewmodels/MyDataSource'

@Entry
@Component
struct LazyListPage {
  private myDataSource = new MyDataSource()

  build() {
    List({ space: 10 }) {
      LazyForEach(this.myDataSource, (item: ItemBean, index: number) => {
        ListItem() {
          Row() {
            Text(`${index}.`).width(20)
              .fontColor('#ffffff')
            Text(item.name + ":" + item.age)
              .width('100%')
              .height('45vp')
              .fontSize(16)
              .fontColor('#ffffff')
              .textAlign(TextAlign.Center)
          }
          .width('100%')
          .justifyContent(FlexAlign.Start)
          .alignItems(VerticalAlign.Center)
          .backgroundColor('#ff039eec')
          .borderRadius(8)

        }
        .onClick(() => {
          this.myDataSource.addNewData(this.myDataSource.totalCount(), 'new tom', 20)
        })
      }, (item: ItemBean) => item.id.toString())
    }
    .padding(10)
    .width('100%')
    .height('100%')
  }
}