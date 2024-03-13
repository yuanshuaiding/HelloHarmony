// 工作目标主页，包含编辑，新增，删除等功能
import promptAction from '@ohos.promptAction'
import { LIST_SPACE, ALL_PERCENT } from 'libCommon/src/main/ets/common/Consts'
import TaskItem from '../viewmodels/TaskItem'
import TaskListItem from './TaskListItem'

@Component
export struct TaskList {
  @State isEdit: boolean = false
  @State clickIndex: number = -1
  @State isSelectAll: boolean = false
  @State selectStateArr: Array<boolean> = []
  @Link items: Array<TaskItem>
  onAdd?: () => void = null
  onDelete?: (arr: Array<boolean>) => void = null

  selectAll(selected: boolean) {
    let newArr: Array<boolean> = []
    this.items.forEach(() => {
      newArr.push(selected)
    })
    this.selectStateArr = newArr
  }

  hasSelectedTask(): boolean {
    let hasSelect = false
    let index = 0
    for (index = 0; index < this.selectStateArr.length; index++) {
      if (this.selectStateArr[index]) {
        hasSelect = true
        break
      }
    }
    return hasSelect
  }

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
                this.isSelectAll = false
                this.isEdit = false
                this.selectAll(false)
              })
            Text('全选')
              .margin({ left: 10 })
            Checkbox()
              .select(this.isSelectAll)
              .selectedColor(Color.Red)
              .onClick(() => {
                //全选
                this.isSelectAll = !this.isSelectAll
                this.selectAll(this.isSelectAll)
              })
              .width(22)
              .margin({ left: 5 })
          } else {
            Text('编辑')
              .onClick(() => {
                this.isEdit = true
                this.selectAll(false)
              })
          }
        }

      }
      .padding({ top: 15, left: 10, right: 10 })
      .width(ALL_PERCENT)
      //目标列表
      List({ space: LIST_SPACE }) {
        ForEach(this.items, (item: TaskItem, index: number) => {
          ListItem() {
            TaskListItem({
              item: item,
              clickIndex: $clickIndex,
              index: index,
              isEdit: this.isEdit,
              selectStateArr: $selectStateArr
            })
          }
        }, (item: TaskItem) => JSON.stringify(item))

      }
      .margin({ top: LIST_SPACE })
      .width(ALL_PERCENT)
      .height('70%')
      //添加、删除按钮
      if (this.isEdit) {
        Button('删除')
          .btnStyle('#ffe6365c')
          .enabled(this.hasSelectedTask())
          .onClick(() => {
            //删除选中的目标
            if (!this.hasSelectedTask()) {
              promptAction.showToast({ message: '请选中要删除的任务！' })
            } else {
              if (this.onDelete) {
                this.onDelete(this.selectStateArr)
                this.selectAll(false)
                this.isSelectAll = false
                this.isEdit = false
              }
            }
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