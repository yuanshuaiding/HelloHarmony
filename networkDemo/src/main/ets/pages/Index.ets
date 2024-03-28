import { ALL_PERCENT } from 'libCommon/src/main/ets/common/Consts'
import webview from '@ohos.web.webview'

@Entry
@Component
struct Index {
  @State type: number = 0
  private url = 'https://baidu.com/'

  private controller = new webview.WebviewController()


  build() {
    Column() {
      Navigator({
        target: 'pages/LocalHtmlPage',
        type: NavigationType.Push
      }) {
        Button("加载本地html")
      }

      Web({
        src: this.url,
        controller: this.controller
      })
        .verticalScrollBarAccess(true)
        .javaScriptAccess(true)
        .zoomAccess(true)
        .width(ALL_PERCENT)
        .height('90%')

    }
  }
}