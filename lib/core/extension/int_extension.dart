import '../../ui/shared/size_fit.dart';

extension IntFit on int {
  double get px {
    return SizeFit.setPx(toDouble());
  }

  double get rpx {
    return SizeFit.setRpx(toDouble());
  }
}
