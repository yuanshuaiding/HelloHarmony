import { WIDTH_FULL } from 'libCommon/src/main/ets/common/Consts';

@CustomDialog
export default struct AddTaskDialog {
  @State taskName: string = ''
  onAdd?: (taskName: string) => void
  private controller?: CustomDialogController;

  build() {
    Column() {
      Text('新建目标')
        .width(WIDTH_FULL)
        .fontSize(16)
        .fontWeight(500)
        .fontColor(Color.Black)
        .textAlign(TextAlign.Start)
      TextInput({ placeholder: '请输入目标' })
        .placeholderColor(Color.Grey)
        .placeholderFont({ size: 14 })
        .caretColor(Color.Blue)
        .backgroundColor("#aaccdd")
        .width(WIDTH_FULL)
        .height(40)
        .margin({ top: 10 })
        .fontSize(14)
        .fontColor(Color.Black)
        .onChange((value: string) => {
          this.taskName = value;
        })
      Blank()
      Row() {
        Button('取消')
          .dialogButtonStyle()
          .onClick(() => {
            this.controller?.close();
          })
        Divider()
          .vertical(true)
        Button('确定')
          .dialogButtonStyle()
          .onClick(() => {
            if (this.onAdd !== undefined) {
              this.onAdd(this.taskName);
            }
          })
      }
      .width(200)
      .height(45)
      .justifyContent(FlexAlign.SpaceBetween)
    }
    .padding(10)
    .height(150)
    .width(350)
    .borderRadius(8)
    .backgroundColor(Color.White)
  }
}

/**
 * Custom button style.
 */
@Extend(Button) function dialogButtonStyle() {
  .fontSize(14)
  .height(40)
  .width(80)
  .backgroundColor(Color.Black)
  .fontColor(Color.White)
}

@Preview({
  title: "AddTaskDialog"
})
@Component
struct AddTaskDialogPreview {
  build() {
    AddTaskDialog()
  }
}