import display from '@ohos.display';
import GlobalContext from '../common/GlobalContext';


let context = getContext(this);
const DESIGN_WIDTH = 360;
const DESIGN_HEIGHT = 780;

export default class DimensionUtil {
  static adaptDimension(value: number): number {
    let deviceDisplay: display.Display = GlobalContext.getContext().getDisplay();
    let widthScale = deviceDisplay.width / DESIGN_WIDTH;
    let virtualHeight = widthScale * DESIGN_HEIGHT;
    let designDim = Math.sqrt(DESIGN_WIDTH * DESIGN_WIDTH + DESIGN_HEIGHT * DESIGN_HEIGHT);
    let virtualDim = Math.sqrt(deviceDisplay.width * deviceDisplay.width + virtualHeight * virtualHeight);
    return virtualDim * value / designDim;
  }

  static getPx(value: Resource): number {
    let beforeVp = context.resourceManager.getNumber(value.id);
    return DimensionUtil.adaptDimension(beforeVp);
  }

  static getVp(value: Resource): number {
    let beforeVp = context.resourceManager.getNumber(value.id);
    return px2vp(DimensionUtil.adaptDimension(beforeVp));
  }

  static getFp(value: Resource): number {
    let beforeFp = context.resourceManager.getNumber(value.id);
    return px2fp(DimensionUtil.adaptDimension(beforeFp));
  }
}