import Want from '@ohos.app.ability.Want'
import hilog from '@ohos.hilog'
import common from '@ohos.app.ability.common'

export function startAbilityMode(targetAbilityName: string, params: any) {
  let context = getContext() as common.UIAbilityContext //获取当前运行UIAbility上下文
  if (context != null) {
    let want: Want = {
      bundleName: 'com.eric.example.helloharmony',
      abilityName: targetAbilityName,
      parameters: params
    }
    try {
      context.startAbility(want).catch((err) => {
        hilog.debug(0x0000, "startAbilityMode", "startAbility failed,because err=" + JSON.stringify(err))
      })
    } catch (err) {
      hilog.debug(0x0000, "startAbilityMode", "startAbility failed,because err=" + JSON.stringify(err))
    } finally {
      hilog.debug(0x0000, "startAbilityMode", "startAbility finally block")
    }

  }
}

export function getContextData(): Want {
  let context = getContext() as common.UIAbilityContext
  if (context != null) {
    let data = {
      want: null
    }
    context.eventHub.emit("getAbilityData", data)
    return data.want
  }
  return null
}