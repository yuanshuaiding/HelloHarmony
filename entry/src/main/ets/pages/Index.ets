import router from '@ohos.router'
import promptAction from '@ohos.promptAction'
import { SECOND_PAGE } from '../common/Const'

@Entry
@Component
struct Index {
  @State message: string = 'Hello World'
  private msg: string = '这是Index页面的参数'

  build() {
    Row() {
      Column() {
        Text(this.message)
          .fontSize(50)
          .fontWeight(FontWeight.Bold)
          .onClick(() => {
            console.debug("hehehe")
          })

        Blank()

        Button('跳转到第二个页面')
          .onClick(() => {
            promptAction.showToast({message:"跳转第二个页面",duration:1000})
            router.pushUrl({
              url: SECOND_PAGE,
              params: {
                hi: this.msg
              }
            })
          })
      }
      .width('100%')
    }
    .height('100%')
  }
}