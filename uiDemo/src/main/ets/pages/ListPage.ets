import { ItemBean } from '../beans/ItemBean'
import ListDemoViewModel from '../viewmodels/ListDemoViewModel'

@Entry
@Component
struct ListPage {
  build() {
    List({ space: 20 }) {
      ForEach(ListDemoViewModel.getListData(), (item: ItemBean) => {
        ListItem() {
          Text(item.name)
            .fontSize(20)
            .textAlign(TextAlign.Center)
            .width('100%')
            .height('45vp')
            .backgroundColor('#ff17a0e5')
            .borderRadius(8)
        }
      }, (item: ItemBean) => item.id.toString())
    }
    .listDirection(Axis.Vertical)
    .divider({ strokeWidth: 2, color: '#ccddff', startMargin: 10, endMargin: 10 })
    .padding(10)
    .width('100%')
    .height('100%')
    .onScrollIndex((start,end)=>{
      console.debug("滚动，start="+start+",end="+end)
    })
  }
}