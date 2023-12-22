import AbilityStage from '@ohos.app.ability.AbilityStage'
import Want from '@ohos.app.ability.Want'
import AbilityConstant from '@ohos.app.ability.AbilityConstant'
import { Configuration } from '@ohos.app.ability.Configuration';
import hilog from '@ohos.hilog';

export default class MyAbilityStage extends AbilityStage {
  onCreate() {

  }

  onAcceptWant(want: Want): string {
    hilog.debug(0x0000, "onAcceptWant", JSON.stringify(want))
    if (want && want.abilityName === 'MySpecifiedAbility') {
      if (want.parameters) {
        return `MySpecifiedAbility_${want.parameters.myInstanceKey}`
      }
    }
    return ""
  }

  onConfigurationUpdate(newConfig: Configuration): void {

  }

  onMemoryLevel(level: AbilityConstant.MemoryLevel) {

  }
}