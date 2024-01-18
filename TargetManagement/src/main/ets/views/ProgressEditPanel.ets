import { WIDTH_FULL } from '../common/Consts'

@Component
export default struct ProgressEditPanel {
  @Prop slidingProgress: number
  @Link sliderMode: number
  onCancel: () => void
  onClickOk: (progress: number) => void

  build() {
    Column() {
      Row() {
        Slider({
          value: this.slidingProgress,
          min: 0,
          max: 100,
          style: SliderStyle.InSet,
          step: 1
        })
          .width('90%')
          .onChange((value: number, mode: SliderChangeMode) => {
            this.slidingProgress = Math.floor(value);
            this.sliderMode = mode;
          })
        Text(`${this.slidingProgress}%`)
          .fontSize(13)
          .fontWeight(400)
          .fontColor(Color.Blue)
          .textAlign(TextAlign.Center)
          .margin({ left: 10 })
      }
      .width('90%')
      .height(50)

      Row() {
        CustomButton({
          buttonText: '取消'
        })
          .onClick(() => {
            if (this.onCancel !== undefined) {
              this.onCancel();
            }
          })
        CustomButton({
          buttonText: '确定'
        })
          .onClick(() => {
            if (this.onClickOk !== undefined) {
              this.onClickOk(this.slidingProgress);
            }
          })
      }
      .margin({ top: 10 })
      .width('70%')
      .justifyContent(FlexAlign.SpaceBetween)
    }
    .height(100)
    .width(WIDTH_FULL)
    .justifyContent(FlexAlign.End)
  }
}

@Component
struct CustomButton {
  buttonText: ResourceStr = ''
  @State buttonColor: Resource = $r('app.color.start_window_background');

  build() {
    Text(this.buttonText)
      .dialogButtonStyle()
      .backgroundColor(this.buttonColor)
      .borderRadius(4)
      .textAlign(TextAlign.Center)
      .onTouch((event?: TouchEvent) => {
        if (event !== undefined && event.type === TouchType.Down) {
          this.buttonColor = $r('app.color.custom_button_color');
        }
        if (event !== undefined && event.type === TouchType.Up) {
          this.buttonColor = $r('app.color.start_window_background');
        }
      })
  }
}

/**
 * Custom button style.
 */
@Extend(Text) function dialogButtonStyle() {
  .fontSize(14)
  .height(28)
  .width(50)
  .fontColor(Color.Brown)
}