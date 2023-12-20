//展示不同启动模式的结果页面
import router from '@ohos.router'
import Want from '@ohos.app.ability.Want'
import { getContextData } from '../../common/Utils'

@Entry
@Component
struct DetailPage {
  @State want: Want = null

  aboutToAppear() {
    this.want= getContextData()
  }

  build() {
    Column() {
      Text('UIAbility 启动模式结果页面')
      Blank()
      Text("启动参数如下：")
      Text(JSON.stringify(this.want))
      Blank()
      Text("自定义参数hi="+this.want?.parameters?.['hi'])
      Blank()
      Button('关闭')
        .onClick(() => {
          router.back()
        })
    }
    .width('100%')
    .height('100%')
  }
}