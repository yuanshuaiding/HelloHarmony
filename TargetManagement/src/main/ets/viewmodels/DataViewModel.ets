import { getCurrentTime } from '../common/Utils'
import TaskItem from './TaskItem'

class DataViewModel {
  private datas: Array<TaskItem> = [
    new TaskItem("目标一", getCurrentTime(), 50),
    new TaskItem("目标二", getCurrentTime(), 10),
    new TaskItem("目标三", getCurrentTime(), 0)
  ]

  getData(): Array<TaskItem> {
    return this.datas
  }

  addData(name: string) {
    this.datas.push(new TaskItem(name, getCurrentTime(), 0))
  }

  deleteAll(){
    this.datas=[]
  }
}

let vm = new DataViewModel()

export { vm as viewModel }