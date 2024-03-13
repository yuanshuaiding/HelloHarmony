export class VideoBean {
  //id
  id: number
  //名称
  name: string
  //封面
  cover: Resource
  //播放源
  source:Resource
  constructor(id: number, name: string, cover: Resource,source:Resource) {
    this.id = id
    this.name = name
    this.cover = cover
    this.source = source
  }
}

class VideoModuleBean {
  title: Resource
  videos: VideoBean[]
}

export const VIDEO_DATA: VideoBean[] = [
  new VideoBean(1, '视频1', $r('app.media.video_list0'),$rawfile("video1.mp4")),
  new VideoBean(1, '视频11', $r('app.media.video_list0'),$rawfile("video1.mp4")),
  new VideoBean(2, '视频2', $r('app.media.video_list1'),$rawfile("video2.mp4")),
  new VideoBean(2, '视频22', $r('app.media.video_list1'),$rawfile("video2.mp4")),
  new VideoBean(3, '视频3', $r('app.media.video_list2'),$rawfile("video1.mp4")),
  new VideoBean(3, '视频33', $r('app.media.video_list2'),$rawfile("video1.mp4")),
]