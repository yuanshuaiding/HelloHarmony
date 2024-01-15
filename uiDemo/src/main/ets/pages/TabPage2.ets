@Entry
@Component
struct TabPage2 {
  @State currentIndex: number = 0
  private controller: TabsController = new TabsController()

  @Builder myBar(tabName: string, currentPosition: number, normalIcon: Resource, selectedIcon: Resource) {
    Column() {
      Image(this.currentIndex === currentPosition ? selectedIcon : normalIcon)
        .size({ width: 25, height: 25 })
      Text(tabName)
        .fontSize(12)
        .fontColor(this.currentIndex === currentPosition ? '#212121' : '#888888')
    }
    .width('100%')
    .height(50)
    .justifyContent(FlexAlign.Center)
    .onClick(() => {
      this.currentIndex = currentPosition
      this.controller.changeIndex(currentPosition)
    })
  }

  build() {
    Tabs({ barPosition: BarPosition.End, controller: this.controller }) {
      TabContent() {
        Column().width('100%').height('100%').backgroundColor(Color.Red)
      }
      .tabBar(this.myBar('首页', 0, $r('app.media.home_FILL0_wght400_GRAD0_opsz24'), $r('app.media.home_FILL1_wght400_GRAD0_opsz24')))

      TabContent() {
        Column().width('100%').height('100%').backgroundColor(Color.Orange)
      }
      .tabBar(this.myBar('购物车', 1, $r('app.media.shopping_cart_FILL0_wght400_GRAD0_opsz24'), $r('app.media.shopping_cart_FILL1_wght400_GRAD0_opsz24')))

      TabContent() {
        Column().width('100%').height('100%').backgroundColor(Color.Blue)
      }
      .tabBar(this.myBar('我的', 2, $r('app.media.favorite_FILL0_wght400_GRAD0_opsz24'), $r('app.media.favorite_FILL1_wght400_GRAD0_opsz24')))
    }
    .vertical(false)
    .barMode(BarMode.Fixed)
    .barWidth('100%')
    .barHeight(50)
    .width('100%')
    .height('100%')
    .onChange((index) => {
      this.currentIndex = index
    })
  }
}