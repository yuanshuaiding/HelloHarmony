export default class SwipeBannerBean {
  id: number
  image: Resource

  constructor(id: number, src: Resource) {
    this.id = id
    this.image = src
  }
}

export const SWIPE_VIDEO_DATA: SwipeBannerBean[] = [
  new SwipeBannerBean(1, $r('app.media.banner1')),
  new SwipeBannerBean(2, $r('app.media.banner2')),
  new SwipeBannerBean(3, $r('app.media.banner3')),
]
