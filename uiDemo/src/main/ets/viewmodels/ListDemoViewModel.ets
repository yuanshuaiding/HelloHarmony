import { ItemBean } from '../beans/ItemBean'

class ListDemoViewModel {
  getListData(): Array<ItemBean> {
    let items = new Array()
    for (let index = 0; index < 1000; index++) {
      let item = new ItemBean(index, `My name is ${index}`, index)
      items.push(item)
    }
    return items
  }
}


let lvm = new ListDemoViewModel()

export default lvm as ListDemoViewModel