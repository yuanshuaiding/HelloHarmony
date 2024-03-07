import SwipeBanners from '../views/SwipeBanners'
import { vm } from '../viewmodels/VideosViewModel'
import { VideoBean } from '../beans/VedioBean'
import { WIDTH_FULL } from '@ohos/libCommon'
import { VideoModuleBean } from '../beans/VideoModuleBean'

@Entry
@Component
struct VideoPlayerIndex {
  private videoModules: VideoModuleBean[] = vm.getVideoModules()
  build() {
    Column() {
      // 顶部轮播卡片
      SwipeBanners()
        .margin({ top: 20, left: 15, right: 15 })
      Blank().height(30)
      // 最近播放
      List(){
        ForEach(this.videoModules,(module)=>{
          ListItem(){
            VideoModuleItem({module})
          }
        })
      }
      .width(WIDTH_FULL)
      .height(WIDTH_FULL)

    }
  }
}

@Component
struct VideoModuleItem{
  module:VideoModuleBean

  build(){
    Column(){
      Text(this.module.name)
      .textAlign(TextAlign.Start)
      .width(WIDTH_FULL)
      List({space:10}){
        ForEach(this.module.videos,item=>{
          ListItem(){
            VideoCardItem({item})
          }
        })
      }.width(WIDTH_FULL)
      .height(110)
      .listDirection(Axis.Horizontal)
    }
  }
}

@Preview
@Component
struct VideoCardItem {
  item: VideoBean

  build() {
    Column() {
      Image(this.item.cover)
        .width(100)
        .height(60)

      Text(this.item.name)
        .width(100)
        .height(40)
        .margin({ top: 10, bottom: 10 })
        .textAlign(TextAlign.Center)
    }
    .width(100)
    .height('100%')

  }
}
