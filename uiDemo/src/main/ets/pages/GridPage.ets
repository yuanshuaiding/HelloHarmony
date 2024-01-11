import { ItemBean } from '../beans/ItemBean'
import ListDemoViewModel from '../viewmodels/ListDemoViewModel'

@Entry
@Component
struct GridPage {
  @State message: string = 'Hello World'

  build() {
    Grid() {
      ForEach(ListDemoViewModel.getListData(), (item: ItemBean, index: number) => {
        GridItem() {
          Text(item.name)
            .textAlign(TextAlign.Center)
            .width('100%')
            .height(100)
            .backgroundColor('#ccddee')
        }
      }, (item: ItemBean) => item.id.toString())
    }
    .columnsTemplate('1fr 1fr 1fr 1fr')
    .columnsGap(10)
    .rowsGap(10)
    .padding(12)
    .width('100%')
    .height('100%')
  }
}