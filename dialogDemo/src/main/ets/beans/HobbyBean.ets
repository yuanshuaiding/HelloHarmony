export class HobbyBean {
  label: string
  selected: boolean

  constructor(label: string, selected?: boolean) {
    this.label = label
    this.selected = selected
  }
}