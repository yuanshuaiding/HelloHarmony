import { RefreshAnimItem } from '../beans/RefreshAnimItem'

export var PAGE_PULL_REFRESH = "pages/PullRefreshPage"

export class PULL_TO_REFRESH_CONST {
  static readonly  HEADER_HEIGHT = 50
  static readonly REFRESH_HEADER_ITEM_DEFAULT_WIDTH = 30;
  static readonly REFRESH_HEADER_ITEM_SCALE_WIDTH = 60;
}

export enum RefreshState {
  IDLE = 0,
  DRAGGING = 1,
  DRAGGING_REFRESHABLE = 2,
  REFRESHING = 3,
  COMPLETE = 4
}

var animItems = [
  new RefreshAnimItem($r('app.media.ic_loading_louder'), 400, 50),
  new RefreshAnimItem($r('app.media.ic_loading_heart'), 800, 120),
  new RefreshAnimItem($r('app.media.ic_loading_game'), 1200, 190),
  new RefreshAnimItem($r('app.media.ic_loading_file'), 1600, 260),
  new RefreshAnimItem($r('app.media.ic_loading_bag'), 2000, 330),
]

export { animItems }