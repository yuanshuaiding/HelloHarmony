/**
 * 动画对象类封装
 */
export class RefreshAnimItem {
  icon: Resource
  delay: number
  pos_x: number

  constructor(imgRes: Resource, delay: number, pos_x: number) {
    this.icon = imgRes
    this.delay = delay
    this.pos_x = pos_x
  }
}