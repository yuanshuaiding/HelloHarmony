import router from '@ohos.router'

@Entry
@Component
struct Index {
  @State message: string = 'UI控件测试'

  build() {
    Scroll() {
      Column() {
        Text(`${this.message}`)
          .width("300vp")
          .height("20vp")
          .textAlign(TextAlign.Center)
          .fontSize("20fp")
          .fontWeight(FontWeight.Bold)

        //List控件
        Button('List列表控件').margin({
          top: '15vp'
        }).onClick(() => {
          router.pushUrl({
            url: "pages/ListPage"
          })
        })

        Button('List列表控件(延迟加载)').margin({
          top: '15vp'
        }).onClick(() => {
          router.pushUrl({
            url: "pages/LazyListPage"
          })
        })

        Button('Grid列表控件').margin({
          top: '15vp'
        }).onClick(() => {
          router.pushUrl({
            url: "pages/GridPage"
          })
        })

        Button('页签控件Tab').margin({
          top: '15vp'
        }).onClick(() => {
          router.pushUrl({
            url: "pages/TabPage1"
          })
        })

        Button('页签控件Tab(自定义)').margin({
          top: '15vp'
        }).onClick(() => {
          router.pushUrl({
            url: "pages/TabPage2"
          })
        })
      }
      .width("100%")
      .height("100%")
      .justifyContent(FlexAlign.Start)
    }
    .width("100%")
    .height("100%")
  }
}