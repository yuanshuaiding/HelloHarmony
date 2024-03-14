@Entry
@Component
struct Index {
  @State message: string = 'Dialog示例'

  build() {
    Row() {
      Column() {
        Text(this.message)
          .fontSize(50)
          .fontWeight(FontWeight.Bold)

        //警告类弹框：AlertDialog
        Button('点击显示弹窗')
          .onClick(() => {
            AlertDialog.show(
              {
                title: '删除联系人', // 标题
                message: '是否需要删除所选联系人?', // 内容
                autoCancel: false, // 点击遮障层时，是否关闭弹窗。
                alignment: DialogAlignment.Center, // 弹窗在竖直方向的对齐方式
                offset: { dx: 0, dy: -20 }, // 弹窗相对alignment位置的偏移量
                primaryButton: {
                  value: '取消',
                  action: () => {
                    console.info('Callback when the first button is clicked');
                  }
                },
                secondaryButton: {
                  value: '删除',
                  fontColor: '#D94838',
                  action: () => {
                    console.info('Callback when the second button is clicked');
                  }
                },
                cancel: () => { // 点击遮障层关闭dialog时的回调
                  console.info('Closed callbacks');
                }
              }
            )
          })
        Button('点击显示弹框（单确认按钮）')
          .onClick(()=>{
            AlertDialog.show({
              message:"你好！",
              autoCancel:true,
              confirm:{
                value:"我知道了",
                action:()=>{
                  console.info('Callback when confirm button is clicked')
                }
              },
              cancel:()=>{
                console.info('Closed callbacks')
              }
            })
          })

        //选择类弹框：

      }
      .justifyContent(FlexAlign.Start)
      .width('100%')
    }
    .height('100%')
  }
}