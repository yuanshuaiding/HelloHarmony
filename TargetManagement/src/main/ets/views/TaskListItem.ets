import {
  SLIDER_MODE_CLICK,
  SLIDER_MODE_DEFAULT,
  TRANSITION_ANIMATION_X,
  TRANSITION_ANIMATION_Y,
  WIDTH_FULL
} from '../common/Consts'
import { getCurrentTime } from '../common/Utils'
import TaskItem from '../viewmodels/TaskItem'
import ProgressEditPanel from './ProgressEditPanel'

@Component
export default struct TaskListItem {
  @State item?: TaskItem = null
  @Link @Watch('onClickIndexChange') clickIndex: number
  @State sliderMode: number = SLIDER_MODE_DEFAULT
  @Consume allProgressChange: boolean
  @State index: number = 0

  onClickIndexChange() {
    if (this.clickIndex != this.index) {
      this.item.isExpand = false
    }
  }

  build() {
    Column() {
      //内容部分
      Row() {
        Text(this.item?.taskName)
          .width('35%')
          .maxLines(3)
          .margin({ left: 10 })
        Column() {
          Text(`${this.item?.progress}%`)
            .fontSize(14)
            .fontWeight(400)
            .fontColor(Color.Black)

          Text(`更新时间：${this.item?.updateTime}`)
            .fontSize(14)
            .fontWeight(400)
            .fontColor(Color.Black)
        }
        .margin({ right: 10 })
        .alignItems(HorizontalAlign.End)
      }
      .justifyContent(FlexAlign.SpaceBetween)
      .margin({ left: 10, right: 10 })
      .width(WIDTH_FULL)

      //展开的进度条部分
      if (this.item?.isExpand) {
        ProgressEditPanel({
          slidingProgress: this.item.progress,
          onCancel: () => this.item.isExpand = false,
          onClickOk: (progress: number): void => {
            this.item.progress = progress
            this.item.updateTime = getCurrentTime()
            //更新整体目标进度
            this.allProgressChange = !this.allProgressChange
            this.item.isExpand = false
          },
          sliderMode: $sliderMode
        })
          .transition({
            scale: {
              x: TRANSITION_ANIMATION_X,
              y: TRANSITION_ANIMATION_Y
            }
          })
      }
    }
    .margin({ left: 10, right: 10 })
    .padding(5)
    .border({ radius: 6 })
    .backgroundColor(Color.White)
    .onClick(() => {
      if (this.sliderMode === SLIDER_MODE_CLICK) {
        this.sliderMode = SLIDER_MODE_DEFAULT
        return
      }
      this.item.isExpand = !this.item.isExpand
      this.clickIndex = this.index
    })
  }
}
