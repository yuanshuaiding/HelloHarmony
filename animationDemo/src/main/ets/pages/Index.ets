import { ALL_PERCENT } from 'libCommon/src/main/ets/common/Consts'

@Entry
@Component
struct Index {
  build() {
    Row() {
      Column() {
        Text('动画演示')
          .fontSize(20)
          .fontWeight(FontWeight.Bold)

        AnimWidget()
      }
      .width('100%')
    }
    .height('100%')
  }
}

@Component
struct AnimWidget {
  //1.声明需要变化的尺寸变量
  @State w_size: number = 30

  build() {
    Row() {
      Image($r('app.media.app_icon'))
        //2.在使用animation之前，先设置好动画需要控制的属性
        .width(this.w_size)
        .objectFit(ImageFit.Contain)
          //3.设置动画参数
        .animation({
          duration: 5000,
          tempo: 2,
          delay: 200,
          playMode: PlayMode.Alternate,
          iterations: -1 // -1代表一直播放
        })
    }
    .justifyContent(FlexAlign.Center)
    .width(ALL_PERCENT)
    .onAppear(() => {
      //改变变量值，使动画生效
      this.w_size = 100
    })
  }
}