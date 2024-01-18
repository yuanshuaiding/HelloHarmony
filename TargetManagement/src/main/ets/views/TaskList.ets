// 工作目标主页，包含编辑，新增，删除等功能
import { HEIGHT_FULL, LIST_SPACE, WIDTH_FULL } from '../common/Consts'
import TaskItem from '../viewmodels/TaskItem'
import TaskListItem from './TaskListItem'

@Component
export struct TaskList {
  @State isEdit: boolean = false
  onAdd?: () => void = null
  @Link items: Array<TaskItem>
  @State clickIndex: number = -1

  build() {
    Column() {
      //操作栏
      Row() {
        Text('目标列表')
          .fontSize(16)
          .fontWeight(600)
        Blank()
        if (this.items.length > 0) {
          if (this.isEdit) {
            Text('取消')
              .onClick(() => {
                this.isEdit = false
              })
            Text('全选')
              .margin({ left: 10 })
            Checkbox()
              .onChange((checked) => {
                //todo 全选
              })
              .margin({ left: 5 })
          } else {
            Text('编辑')
              .onClick(() => {
                this.isEdit = true
              })
          }
        }

      }
      .padding({ top: 15, left: 10, right: 10 })
      .width(WIDTH_FULL)
      //目标列表
      List({ space: LIST_SPACE }) {
        ForEach(this.items, (item: TaskItem, index: number) => {
          ListItem() {
            TaskListItem({ item: item, clickIndex: $clickIndex, index: index })
          }
        }, (item: TaskItem, index: number) => index.toString())

      }
      .margin({ top: LIST_SPACE })
      .width(WIDTH_FULL)
      .height('75%')
      //添加、删除按钮
      if (this.isEdit) {
        Button('删除')
          .btnStyle('#ffe6365c')
          .onClick(() => {
            //todo 删除选中的目标
          })
      } else {
        Button('新增')
          .btnStyle('#ff3c97f3')
          .onClick(() => {
            if (this.onAdd !== undefined) {
              this.onAdd()
            }
          })
      }
    }
  }
}

@Extend(Button) function btnStyle(color: ResourceColor) {
  .fontColor(Color.White)
  .type(ButtonType.Normal)
  .fontSize(16)
  .width('50%')
  .height(42)
  .borderRadius(21)
  .backgroundColor(color)
}