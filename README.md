# NavigationColorChange
基于系统导航栏的上滑渐变效果，上滑逐渐变透明，上滑64pt后完全变透明

核心代码
在scrollViewDidScroll方法中 改变navigationBar的背景图层的alpha 
-(void)scrollViewDidScroll:(UIScrollView *)scrollView{

    if (!_barImageView) {
        _barImageView = self.navigationController.navigationBar.subviews.firstObject;
    }
    CGFloat maxAlphaOffset = 64;
    CGFloat offset = scrollView.contentOffset.y;
    CGFloat alpha =(maxAlphaOffset - offset) / maxAlphaOffset;
    _barImageView.alpha = alpha;
    if (alpha<=0) {
        self.navigationItem.title = @"";
    }else{
        self.navigationItem.title = @"daohang标题";
    }
}
