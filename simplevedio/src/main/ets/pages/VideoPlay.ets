@Entry
@Component
struct Index {

  build() {
    Column() {
      Video({
        src: 'https://v6-web.toutiaovod.com/f973b81a9116ea5d1b31f19a9cd97a81/65af92e8/video/tos/cn/tos-cn-ve-4/ogI3ZIAyKyWpCfvwCgmz7QQAmFgNAK6uSEM8h1/?a=24&ch=0&cr=0&dr=0&er=0&lr=unwatermarked&net=5&cd=0%7C0%7C0%7C0&cv=1&br=890&bt=890&cs=0&ds=3&eid=21760&ft=hGkwBy6LRR0sLOC3NDl2Ncy3kIXbvLryXqWgx4kxHLc.YvjThW&mime_type=video_mp4&qs=0&rc=OGg3Z2k0NzU0OzwzOGkzOkBpMzhkaTU6ZjhkcDMzNDczM0A2Ll82YF5fNWIxYmNhLy4zYSNkci9xcjQwL19gLS1kLWFzcw%3D%3D&btag=e00028000&dy_q=1706001508&feature_id=1229c61d4e863560fb994c11be849377&l=20240123171828800CC61451D503E4E825',
        previewUri: 'https://p3-sign.toutiaoimg.com/tos-cn-i-pk90l89vgd/6d2480a360ef4a1d9716bd5d0d099682~tplv-tt-cs0-jzss2:640:360.jpg?_iz=31127&from=ttvideo.headline&lk3s=06827d14&x-expires=1706605873&x-signature=H92uKIW52bOQjaHsnGUiR50DLNg%3D'
      })
        .objectFit(ImageFit.Contain)
        .width('100%')
        .height('100%')
    }
    .width('100%')
    .height('100%')
  }
}