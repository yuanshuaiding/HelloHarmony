import SwipeBannerBean, { SWIPE_VIDEO_DATA } from '../beans/SwipeBannerBean';
import { VIDEO_MODULES, VideoModuleBean } from '../beans/VideoModuleBean';

export class VideoDataViewModel {
  public getSwipeBanners(): SwipeBannerBean[] {
    return SWIPE_VIDEO_DATA
  }

  public getVideoModules():VideoModuleBean[]{
    return VIDEO_MODULES
  }
}

export let vm = new VideoDataViewModel()