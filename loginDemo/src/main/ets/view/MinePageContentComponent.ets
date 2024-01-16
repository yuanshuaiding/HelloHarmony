import LoginPageViewModel from '../viewmodel/LoginViewMode';
import { CommonConstants } from '../common/constants/CommonConstants';
import type { ListItemData } from '../common/bean/ListItemData';

/**
 * Personal page component.
 */
@Component
export default struct MinePageContentComponent {
  build() {
    Column() {
      List() {
        ForEach(LoginPageViewModel.getPersonalListItems(), (item: ListItemData) => {
          ListItem() {
            MinePageItemComponent({ itemTitle: item.title })
          }
        }, (item, index) => index + JSON.stringify(item))
      }
      .divider({
        strokeWidth: $r('app.float.divider_stroke_width'),
        color: $r('app.color.item_divider')
      })
    }
    .backgroundColor(Color.White)
    .margin({ top: $r('app.float.mine_content_column_margin_top') })
    .border({
      radius: $r('app.float.mine_content_column_border')
    })
    .padding({
      left: $r('app.float.mine_content_column_padding_left'),
      top: $r('app.float.mine_content_column_padding_top'),
      right: $r('app.float.mine_content_column_padding_right'),
      bottom: $r('app.float.mine_content_column_padding_top')
    })
  }
}

@Component
struct MinePageItemComponent {
  @State private isExpand: boolean = false
  private itemTitle: Resource;

  private getTitle(): string {
    let title = getContext(this).resourceManager.getStringSync(this.itemTitle)
    title = title.replace("%d", "    "+new Date().toTimeString())
    return title
  }

  build() {
    Column() {
      Text(this.itemTitle)
        .width(CommonConstants.MINE_PAGE_TEXT_WIDTH_PERCENT)
        .height($r('app.float.item_text_height'))
        .fontSize($r('app.float.item_text_font_size'))
        .fontWeight(CommonConstants.TEXT_FONT_WEIGHT)
        .onClick(() => {
          this.isExpand = !this.isExpand
        })
      if (this.isExpand) {
        Text(this.getTitle())
          .width(CommonConstants.MINE_PAGE_TEXT_WIDTH_PERCENT)
          .height($r('app.float.item_text_height'))
          .fontSize($r('app.float.item_text_font_size'))
          .fontWeight(CommonConstants.TEXT_FONT_WEIGHT)
      }
    }.width(CommonConstants.MINE_PAGE_TEXT_WIDTH_PERCENT)
  }
}
