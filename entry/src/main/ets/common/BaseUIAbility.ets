import UIAbility from '@ohos.app.ability.UIAbility';

export default class BaseUIAbility extends UIAbility {
  onCreate(want, launchParams) {
    super.onCreate(want, launchParams)
    this.context.eventHub.on("getAbilityData", (data) => {
      data.want = want
    })
  }
}