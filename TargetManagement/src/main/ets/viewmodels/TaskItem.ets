export default  class TaskItem {
  taskName: string
  updateTime: string
  progress: number

  constructor(name: string, time: string, progress: number) {
    this.taskName = name
    this.updateTime = time
    this.progress = progress
  }
}