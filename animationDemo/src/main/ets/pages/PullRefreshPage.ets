import { ALL_PERCENT } from 'libCommon/src/main/ets/common/Consts'
import display from '@ohos.display'
import { RefreshAnimItem } from '../beans/RefreshAnimItem'
import { animItems, PULL_TO_REFRESH_CONST, RefreshState } from '../common/Consts'
import GlobalContext from '../../../../../libCommon/src/main/ets/common/GlobalContext'
import DimensionUtil from '../../../../../libCommon/src/main/ets/utils/DimensionUtil'
/**
 * 自定义下拉刷新控件
 */
@Entry
@Component
export struct PullRefreshPage {
  build() {
    Column() {
      PullToRefreshWidget()
    }
    .width(ALL_PERCENT)
    .height(ALL_PERCENT)
  }
}

@Component
struct PullToRefreshWidget {
  @Provide refreshState: number = RefreshState.REFRESHING

  @Builder pullContent() {
    Image($r('app.media.bg_content'))
      .width(ALL_PERCENT)
      .margin({ top: 10 })
      .objectFit(ImageFit.Auto)
  }

  build() {
    Stack({ alignContent: Alignment.Top }) {
      Text("自定义下拉刷新")
        .width(ALL_PERCENT)
        .height(DimensionUtil.getVp($r('app.float.file_index_title_height')))
        .backgroundColor(Color.White)
        .fontSize(18)
        .padding({ left: 10 })
        .zIndex(1)

      PullToRefreshBody({
        itemContent: this.pullContent,
        onRefresh: () => {
          setTimeout(() => {
            this.refreshState = RefreshState.COMPLETE
          }, 4000)
        }
      })
        .margin({ top: DimensionUtil.getVp($r('app.float.file_index_title_height')) })
    }

    .width(ALL_PERCENT)

    .height(ALL_PERCENT)
  }
}

@Component
struct PullToRefreshBody {
  @State headerOffset: number = 0
  private displayHeight = 0
  private deviceDisplay: display.Display = GlobalContext.getContext().getDisplay();
  private scroller: Scroller = new Scroller()
  onRefresh: () => void
  @BuilderParam itemContent: () => any
  @Consume @Watch('onStateChange') refreshState: number

  onStateChange() {
    switch (this.refreshState) {
      case RefreshState.REFRESHING:
        if (this.onRefresh !== undefined) {
          this.onRefresh();
        }
        break;
      case RefreshState.COMPLETE:
        this.headerOffset = -PULL_TO_REFRESH_CONST.HEADER_HEIGHT
        break;
    }
  }

  aboutToAppear() {
    if (this.refreshState === RefreshState.REFRESHING) {
      this.headerOffset = 0;
      this.onStateChange();
    } else {
      this.refreshState = RefreshState.IDLE;
      this.headerOffset = -PULL_TO_REFRESH_CONST.HEADER_HEIGHT
    }
    this.displayHeight = px2vp(this.deviceDisplay.height) - DimensionUtil.getVp($r('app.float.file_index_title_height'))

  }

  build() {
    List({ scroller: this.scroller }) {
      ListItem() {
        Column() {
          PullRefreshHeader()
          if (this.itemContent !== undefined) {
            this.itemContent()
          }
        }
        .width(ALL_PERCENT)
        //ListItem高度要超过List的高度才能触发下拉回弹效果，所以此处+0.1
        .height(this.displayHeight + 0.1)
      }

    }
    .edgeEffect(EdgeEffect.Spring)
    .offset({ y: this.headerOffset })
    .width(ALL_PERCENT)
    .height(this.displayHeight)
    .animation({
      curve: Curve.Smooth,
      duration: 500,
      playMode: PlayMode.Normal,
      onFinish: () => {
        if (this.headerOffset === -PULL_TO_REFRESH_CONST.HEADER_HEIGHT) {
          this.refreshState = RefreshState.IDLE;
        }
      }
    })
    .onTouch(event => {
      if (!event) {
        return
      }
      switch (event.type) {
        case TouchType.Down:
          if (this.refreshState === RefreshState.IDLE) {
            this.refreshState = RefreshState.DRAGGING;
          }
          break
        case TouchType.Move:
          if (this.refreshState === RefreshState.DRAGGING
          && this.scroller.currentOffset().yOffset <= -PULL_TO_REFRESH_CONST.HEADER_HEIGHT) {
            this.refreshState = RefreshState.DRAGGING_REFRESHABLE;
          }
          break
        case TouchType.Up:
          if (this.refreshState === RefreshState.DRAGGING_REFRESHABLE) {
            this.headerOffset = 0;
            this.refreshState = RefreshState.REFRESHING;
          }
          break
      }
    })

  }
}

@Component
struct PullRefreshHeader {
  private icons: RefreshAnimItem[] = []
  @State iconWidth:number = PULL_TO_REFRESH_CONST.REFRESH_HEADER_ITEM_DEFAULT_WIDTH
  @Consume @Watch('onStateCheck') refreshState: number;

  onStateCheck() {
    if (this.refreshState === RefreshState.REFRESHING) {
      this.iconWidth = PULL_TO_REFRESH_CONST.REFRESH_HEADER_ITEM_SCALE_WIDTH;
    } else {
      this.iconWidth = PULL_TO_REFRESH_CONST.REFRESH_HEADER_ITEM_DEFAULT_WIDTH;
    }
  }

  aboutToAppear() {
    //设置动画元素列表
    this.icons = animItems
  }

  @Builder
  private animImage(item: RefreshAnimItem) {
    Image(item.icon)
      .width(this.iconWidth)
      .objectFit(ImageFit.Contain)
      .position({ x: item.pos_x })
      .animation({
        delay: item.delay,
        duration: 1000,
        tempo: 2,
        curve: Curve.Linear,
        playMode: PlayMode.Alternate,
        iterations: -1,
      })
  }

  build() {
    Row() {
      if (this.refreshState !== RefreshState.IDLE) {
        ForEach(this.icons, (item) => {
          this.animImage(item)
        }, item => JSON.stringify(item))
      }
    }
    .width(ALL_PERCENT)
    .height(PULL_TO_REFRESH_CONST.HEADER_HEIGHT)
    .onAppear(() => {
      this.onStateCheck()
    })
  }
}