@Entry
@Component
struct TabPage1 {

  build() {
    Tabs({barPosition:BarPosition.End}){
      TabContent(){
        Column().width('100%').height('100%').backgroundColor(Color.Green)
      }
      .tabBar("Green")
      TabContent(){
        Column().width('100%').height('100%').backgroundColor(Color.Blue)
      }
      .tabBar("Blue")
      TabContent(){
        Column().width('100%').height('100%').backgroundColor(Color.Orange)
      }
      .tabBar("Orange")

    }
    .barWidth('100%') // 设置TabBar宽度
    .barHeight(50) // 设置TabBar高度
    .width('100%')
    .height('100%')
  }
}