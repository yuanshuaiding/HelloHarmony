import webview from '@ohos.web.webview'
import { ALL_PERCENT } from 'libCommon/src/main/ets/common/Consts'
@Entry
@Component
struct LocalHtmlPage {
  private localHtml = $rawfile('index.html')
  private controller = new webview.WebviewController()
  build() {
    Column() {
      Navigator({
        target: '',
        type: NavigationType.Back
      }) {
        Button("返回")
      }

      Web({
        src: this.localHtml,
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