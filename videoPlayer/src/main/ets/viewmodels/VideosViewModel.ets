import SwipeBannerBean, { SWIPE_VIDEO_DATA } from '../beans/SwipeBannerBean';

export class VideoDataViewModel {
  public getSwipeBanners(): SwipeBannerBean[] {
    return SWIPE_VIDEO_DATA
  }
}

export let vm = new VideoDataViewModel()