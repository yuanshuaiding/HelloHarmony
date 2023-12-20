import router from '@ohos.router'
import promptAction from '@ohos.promptAction'
import { SECOND_PAGE } from '../common/Const'
import { startAbilityMode } from '../common/Utils'

@Entry
@Component
struct Index {
  @State message: string = 'Hello World'
  @State message2: string = ''
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

        Button('带参数跳转到第二个页面')
          .onClick(() => {
            promptAction.showToast({ message: "跳转第二个页面", duration: 1000 })
            router.pushUrl({
              url: SECOND_PAGE,
              params: {
                hi: this.msg
              }
            }, router.RouterMode.Single)
          })

        Blank()

        Text(this.message2)
          .fontSize(20)

        Button('Singleton模式启动另一个UIAbility')
          .onClick(() => {
            startAbilityMode('MySingletonAbility', { hi: "Singleton模式启动另一个UIAbility" })
          })
      }
      .width('100%')
    }
    .height('100%')
  }

  // 页面显示
  onPageShow() {
    console.log('page1……onPageShow')
    //可以在此生命周期获取参数
    this.message2 = router.getParams()?.['hello']
  }
  // 页面隐藏
  onPageHide() {
    console.log('page1……onPageHide')
  }
  // 页面返回
  onBackPress() {
    console.log('page1……onBackPress')
  }

  aboutToAppear() {
    console.log('组件本身……aboutToAppear')
  }
  // 组件销毁时触发：删除  移出
  aboutToDisappear() {
    console.log('组件本身……aboutToDisappear')
  }
}