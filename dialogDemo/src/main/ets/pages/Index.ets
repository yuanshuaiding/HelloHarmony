import { HobbyBean } from '../beans/HobbyBean'
import { ALL_PERCENT } from 'libCommon/src/main/ets/common/Consts';

@Entry
@Component
struct Index {
  @State message: string = 'Dialog示例'
  @State selected: number = 0
  selectedDate: Date = new Date('2010-1-1')
  selectedTime: Date = new Date()
  //自定义Dialog
  @State hobbies: string = ''
  private myDialogController: CustomDialogController = new CustomDialogController({
    builder: MyDialog({
      hobbies: $hobbies,
    }),
    customStyle: true,
    alignment: DialogAlignment.Bottom,
    offset: { dx: 0, dy: -20 }
  })

  build() {
    Row() {
      Column() {
        Text(this.message)
          .fontSize(50)
          .fontWeight(FontWeight.Bold)

        //警告类弹框：AlertDialog
        Button('点击显示弹窗')
          .onClick(() => {
            AlertDialog.show(
              {
                title: '删除联系人', // 标题
                message: '是否需要删除所选联系人?', // 内容
                autoCancel: false, // 点击遮障层时，是否关闭弹窗。
                alignment: DialogAlignment.Center, // 弹窗在竖直方向的对齐方式
                offset: { dx: 0, dy: -20 }, // 弹窗相对alignment位置的偏移量
                primaryButton: {
                  value: '取消',
                  action: () => {
                    console.info('Callback when the first button is clicked');
                  }
                },
                secondaryButton: {
                  value: '删除',
                  fontColor: '#D94838',
                  action: () => {
                    console.info('Callback when the second button is clicked');
                  }
                },
                cancel: () => { // 点击遮障层关闭dialog时的回调
                  console.info('Closed callbacks');
                }
              }
            )
          })
        Button('点击显示弹框（单确认按钮）')
          .onClick(() => {
            AlertDialog.show({
              message: "你好！",
              autoCancel: true,
              confirm: {
                value: "我知道了",
                action: () => {
                  console.info('Callback when confirm button is clicked')
                }
              },
              cancel: () => {
                console.info('Closed callbacks')
              }
            })
          })
          .margin({ top: 15 })

        //选择类弹框：文本选择弹窗TextPickerDialog
        Button('文本选择弹框')
          .margin({ top: 15 })
          .onClick(() => {
            TextPickerDialog.show({
              range: ["男", "女", "不限"],
              selected: this.selected,
              // 点击弹窗中的“确定”按钮时触发该回调。
              // 设置select为按下确定按钮时候的选中项index，这样当弹窗再次弹出时显示选中的是上一次确定的选项
              onAccept: (value: TextPickerResult) => {
                this.selected = value.index
                console.info("TextPickerDialog:onAccept()" + JSON.stringify(value));
              },
              // 滑动弹窗中的选择器使当前选中项改变时触发该回调。
              onChange: (value: TextPickerResult) => {
                console.info('TextPickerDialog:onChange()' + JSON.stringify(value));
              },
              // 点击弹窗中的“取消”按钮时触发该回调。
              onCancel: () => {
                console.info("TextPickerDialog:onCancel()");
              }
            })
          })
        //选择类弹框：日期选择弹窗DatePickerDialog
        Button('日期选择弹框')
          .margin({ top: 15 })
          .onClick(() => {
            DatePickerDialog.show({
              start: new Date('1900-1-1'),
              end: new Date('2024-12-31'),
              lunar: false,
              selected: this.selectedDate,
              onChange: (value) => {
                console.info('DatePickerDialog:onChange()' + JSON.stringify(value))
              },
              // 点击弹窗中的“确定”按钮时触发该回调
              onAccept: (value) => {
                // 通过Date的setFullYear方法设置按下确定按钮时的日期，这样当弹窗再次弹出时显示选中的是上一次确定的日期
                this.selectedDate.setFullYear(value.year, value.month, value.day)
                console.info('DatePickerDialog:onAccept()' + JSON.stringify(value))
              },
              // 点击弹窗中的“取消”按钮时触发该回调
              onCancel: () => {
                console.info('DatePickerDialog:onCancel()')
              }
            })
          })

        //选择类弹框：时间选择弹框TimePickerDialog
        Button('时间选择弹框')
          .margin(15)
          .onClick(() => {
            TimePickerDialog.show({
              useMilitaryTime: true,
              selected: this.selectedTime,
              onChange: (value) => {
                console.info('TimePickerDialog:onChange()' + JSON.stringify(value))
              },
              // 点击弹窗中的“确定”按钮时触发该回调
              onAccept: (value) => {
                this.selectedTime.setHours(value.hour, value.minute)
                console.info('TimePickerDialog:onAccept()' + JSON.stringify(value))
              },
              // 点击弹窗中的“取消”按钮时触发该回调
              onCancel: () => {
                console.info('TimePickerDialog:onCancel()')
              }
            })
          })

        //自定义弹框：@CustomDialog
        Button('自定义弹框>>' + this.hobbies)
          .margin(15)
          .onClick(() => {
            this.myDialogController?.open()
          })

      }
      .justifyContent(FlexAlign.Start)
      .width('100%')
    }
    .height('100%')
  }
}

@CustomDialog
struct MyDialog {
  @State hobbyBeans: HobbyBean[] = []
  @Link hobbies: string
  controller: CustomDialogController

  aboutToAppear() {
    let rm = getContext(this).resourceManager
    rm.getStringArrayValue($r('app.strarray.hobbies_data'), (_, hobbies) => {
      hobbies.forEach((hobby: string) => {
        this.hobbyBeans.push(new HobbyBean(hobby, this.hobbies.indexOf(hobby)>=0))
      })
    })
  }

  setHobbiesValue() {
    let hobbiesText: string = '';
    hobbiesText = this.hobbyBeans.filter((isCheckItem: HobbyBean) => isCheckItem?.selected)
      .map((checkedItem: HobbyBean) => {
        return checkedItem.label;
      }).join(',');
    this.hobbies = hobbiesText;
  }

  build() {
    Column() {
      Text('兴趣爱好')
      List({ space: 10 }) {
        ForEach(this.hobbyBeans, (item: HobbyBean) => {
          ListItem() {
            Row() {
              Text(item.label)
                .layoutWeight(1)
              Checkbox().select(item.selected).onChange(value => {
                item.selected = value
              })
            }
          }
        }, (item: HobbyBean) => item.label)
      }.width(ALL_PERCENT)

      Row() {
        Button('取消')
          .onClick(() => {
            this.controller?.close()
          })

        Button('确定')
          .onClick(() => {
            this.setHobbiesValue()
            this.controller?.close()
          })
      }
    }
    .backgroundColor(Color.White)
    .margin(15)
    .padding(10)

  }
}