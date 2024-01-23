import { getCurrentTime } from '../common/Utils'
import { viewModel } from '../viewmodels/DataViewModel'
import TaskItem from '../viewmodels/TaskItem'
import AddTaskDialog from '../views/AddTaskDialog'
import SummaryInfo from '../views/SummaryInfo'
import { TaskList } from '../views/TaskList'


@Entry
@Component
struct Index {
  @State finishedTaskNum: number = 0
  @State totalTaskNum: number = 0
  @State latestUpdateTime: string = ''
  @State taskItems: Array<TaskItem> = viewModel.getData()
  @Provide @Watch('onProgressChange') allProgressChange: boolean = false

  aboutToAppear() {
    this.onProgressChange()
  }

  onProgressChange() {
    this.totalTaskNum = this.taskItems.length
    this.finishedTaskNum = this.taskItems.filter((item: TaskItem) => {
      return item.progress == 100
    }).length
    this.latestUpdateTime = getCurrentTime()
  }

  dialog: CustomDialogController = new CustomDialogController({
    builder: AddTaskDialog({
      onAdd: (taskName: string): void => {
        this.saveTask(taskName)
      }
    }),
    alignment: DialogAlignment.Bottom,
    offset: { dx: 0, dy: -20 },
    customStyle: true,
    autoCancel: false
  })

  saveTask(name: string) {
    viewModel.addData(name)
    this.taskItems = viewModel.getData()
    this.allProgressChange = !this.allProgressChange
    this.dialog.close()
  }

  deleteTask(arr:Array<boolean>){
    viewModel.deleteData(arr)
    this.taskItems = viewModel.getData()
    this.allProgressChange = !this.allProgressChange
  }

  build() {
    Column() {
      this.titleBar('工作目标')
      SummaryInfo({
        finishedTaskNum: this.finishedTaskNum,
        totalTaskNum: this.totalTaskNum,
        latestUpdateTime: this.latestUpdateTime
      })

      TaskList({ items: $taskItems,
        onAdd: () => {
          this.dialog.open()
        },
        onDelete: (arr: Array<boolean>) => {
          this.deleteTask(arr)
        } })
    }
    .alignItems(HorizontalAlign.Start)
    .width('100%')
    .height('100%')
    .backgroundColor('#f0f0f0')
  }

  @Builder titleBar(title: string) {
    Text(title)
      .textAlign(TextAlign.Center)
      .fontSize(20)
      .height(45)
      .margin({ top: 10, left: 10 })
      .fontWeight(600)
  }
}