import { ALL_PERCENT } from '@ohos/libCommon/src/main/ets/common/Consts'

@Component
export default struct VideoSlide {
  private controller: VideoController = new VideoController()
  @Consume private isPlay: boolean
  @Consume private duration: number
  @Consume private durationTime: string
  @Consume private current: number
  @Consume private currentTime: string

  build() {
    Row() {
      //播放按钮
      Image(this.isPlay ? $r('app.media.ic_pause') : $r('app.media.ic_play'))
        .margin({ left: 15, right: 15 })
        .onClick(() => {
          this.onPlayClick()
        })
        .width(24)
        .height(24)
      //播放时间
      Text(this.currentTime)
        .fontColor(Color.White)
      //播放进度
      Slider({
        value: this.current,
        min: 0,
        max: this.duration,
        step: 1,
        style: SliderStyle.OutSet
      })
        .blockColor(Color.White)
        .trackColor(Color.Gray)
        .selectedColor(Color.White)
        .showSteps(true)
        .showTips(true)
        .layoutWeight(1)
      //总时间
      Text(this.durationTime)
        .fontColor(Color.White)
    }
    .backgroundColor(Color.Black)
    .width(ALL_PERCENT)
    .height(40)
  }

  private onPlayClick() {
    if (this.isPlay) {
      this.controller.pause()
      this.isPlay = false
    } else {
      this.controller.start()
      this.isPlay = true
    }
  }
}