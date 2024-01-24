import SwipeBanners from '../views/SwipeVedios'
@Entry
@Component
struct VideoPlayerIndex {

  build() {
    Column({space:10}){
      // 顶部轮播卡片
      SwipeBanners()

      // 播放列表
    }
  }
}