import display from '@ohos.display'

export default class GlobalContext {
  private constructor() {
  }

  private static _instance: GlobalContext
  private _display: display.Display

  public static getContext(): GlobalContext {
    if (!GlobalContext._instance) {
      GlobalContext._instance = new GlobalContext()
    }
    return GlobalContext._instance
  }

  public setDisplay(display: display.Display) {
    this._display = display
  }

  public getDisplay(): display.Display {
    return this._display
  }
}