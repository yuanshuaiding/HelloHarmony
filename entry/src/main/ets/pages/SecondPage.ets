import router from '@ohos.router'
import { PAGE_INDEX } from '../common/Const'

@Entry
@Component
struct SecondPage {
  @State message: string = '第二个页面'
  @State hiFromIndex: string = router.getParams()?.['hi']

  build() {
    Row() {
      Column() {
        Text(this.message)
          .fontSize(50)
          .fontWeight(FontWeight.Bold)
          .layoutWeight(1)
        Blank()
        Text(this.hiFromIndex)
          .fontSize(50)
          .fontWeight(FontWeight.Bold)
          .layoutWeight(1)

        //返回
        Button('返回')
          .onClick(() => {
            //提示是否要返回
            router.showAlertBeforeBackPage({message:'是否要返回上一个页面？'})
            router.back({ url: PAGE_INDEX, params: {
              hello:"Second页面返回的数据"
            } })
          })
      }
      .width('100%')
    }
    .height('100%')
  }
}