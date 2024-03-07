import { VIDEO_DATA, VideoBean } from './VedioBean'

export class VideoModuleBean {
  name: string
  videos: VideoBean[]

  constructor(name: string, videos: VideoBean[]) {
    this.name = name
    this.videos = videos
  }
}

export const VIDEO_MODULES = [
  new VideoModuleBean("最近播放", VIDEO_DATA),
  new VideoModuleBean("本地视频", VIDEO_DATA),
]