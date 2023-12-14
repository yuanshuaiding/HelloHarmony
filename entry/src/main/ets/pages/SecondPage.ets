import router from '@ohos.router'
@Entry
@Component
struct SecondPage {
  @State message: string = '第二个页面'
  @State hiFromIndex:string = router.getParams()?.['hi']
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
      }
      .width('100%')
    }
    .height('100%')
  }
}