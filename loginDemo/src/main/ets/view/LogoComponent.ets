@Component
export struct LogoComponent {
  build() {
    Column(){
      //使用本地resources里的media图片
      Image($r('app.media.ic_user_profile'))
        .width('100%')
        .height(50)
        .objectFit(ImageFit.Contain)
        .backgroundColor(0xaaccdd)
        .align(Alignment.Center)

      //使用网络图片
      Image('https://img.zcool.cn/community/018459568f541732f87574be60c997.jpg?x-oss-process=image/auto-orient,1/resize,m_lfit,w_1280,limit_1/sharpen,100')
        .width('100%')
        .height(50)
        .objectFit(ImageFit.ScaleDown)
        .backgroundColor(0xaaeeff)
        .align(Alignment.Center)
    }


  }
}