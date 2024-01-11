import ArrayList from '@ohos.util.ArrayList'
import List from '@ohos.util.List'
import { ItemBean } from '../beans/ItemBean'

class BaseDataSource implements IDataSource {
  private listeners: DataChangeListener[] = []

  unregisterDataChangeListener(listener: DataChangeListener): void {
    let pos = this.listeners.indexOf(listener)
    if (pos >= 0) {
      console.debug("remove listener by unregisterDataChangeListener")
      this.listeners.splice(pos, 1)
    }
  }

  registerDataChangeListener(listener: DataChangeListener): void {
    if (this.listeners.indexOf(listener) < 0) {
      console.debug("add listener by registerDataChangeListener")
      this.listeners.push(listener)
    }
  }

  getData(index: number) {
    return undefined
  }

  totalCount(): number {
    return 0
  }

  notifyDataAdd(index: number) {
    this.listeners.forEach(listener => {
      listener.onDataAdd(index)
    })
  }
}

export class MyDataSource extends BaseDataSource {
  private data: ItemBean[] = [
    new ItemBean(1, 'tom1', 18),
    new ItemBean(2, 'tom2', 18),
    new ItemBean(3, 'tom3', 18),
  ]

  getData(index: number) {
    return this.data[index]
  }

  totalCount() {
    return this.data.length
  }

  addNewData(id: number, name: string, age: number) {
    this.data.push(new ItemBean(id, name, age))
    this.notifyDataAdd(this.data.length-1)
  }
}