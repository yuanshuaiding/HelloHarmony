export default class TaskItem {
  taskName: string
  updateTime: string
  progress: number
  isExpand: boolean

  constructor(name: string, time: string, progress: number) {
    this.taskName = name
    this.updateTime = time
    this.progress = progress
    this.isExpand = false
  }
}