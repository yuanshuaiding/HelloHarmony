import SwipeBannerBean from '../beans/SwipeBannerBean'
import { vm } from '../viewmodels/VideosViewModel'

@Component
export default struct SwipeBanners {
  @State swipeVideos: SwipeBannerBean[] = vm.getSwipeBanners()

  @Builder BannerItem(bannerBean: SwipeBannerBean) {
    Navigator({ target: 'pages/VideoPlay', type: NavigationType.Push }) {
      Image(bannerBean.image)
        .width('100%')
        .height('100%')
        .borderRadius(5)
    }.params({ id: bannerBean.id })
  }

  build() {
    Stack() {
      Swiper() {
        ForEach(this.swipeVideos, item => {
          this.BannerItem(item)
        })
      }
      .autoPlay(true)
      .interval(3000)
      .indicatorStyle({color:Color.Gray,selectedColor:Color.Orange})
      .height('100%')
    }
    .width('100%')
    .height(200)
  }
}