export class FruitBean {
  private _selected: boolean = false
  private _name: string = ''
  private _ticket: number

  constructor(selected: boolean = false, name: string, ticket: number) {
    this._selected = selected
    this._name = name
    this._ticket = ticket
  }

  get Name() {
    return this._name
  }

  get Selected() {
    return this._selected
  }

  set Selected(select: boolean) {
    this._selected = select
  }

  get Tickets() {
    return this._ticket
  }
}