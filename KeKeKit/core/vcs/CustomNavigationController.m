    //
    //  CustomNavigationController.m
    //  FirstProject
    //
    //  Created by KeKe on 3018/10/5.
    //  Copyright © 3018年 awen. All rights reserved.
    //

#import "CustomNavigationController.h"

@interface CustomNavigationController ()

@end

@implementation CustomNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    id target = self.interactivePopGestureRecognizer.delegate;
    UIPanGestureRecognizer* fullScreenGes = [[UIPanGestureRecognizer alloc]  initWithTarget:target action:@selector(handleNavigationTransition:)];
    [self.view addGestureRecognizer:fullScreenGes];
    fullScreenGes.delegate = self;
    self.interactivePopGestureRecognizer.enabled = NO;
        // Do any additional setup after loading the view.
}
-(BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch{

        //判断是否是根控制器
    return self.childViewControllers.count>1;

}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
        // Dispose of any resources that can be recreated.
}

/*
 #pragma mark - Navigation

 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */
- (UIStatusBarStyle)preferredStatusBarStyle {
    return [[self topViewController] preferredStatusBarStyle];
}
-(BOOL)prefersStatusBarHidden
{
    return    [[self topViewController]prefersStatusBarHidden];
}
- (nullable UIViewController *)childViewControllerForStatusBarHidden
{
    return  [self topViewController];
}
#pragma mark-top-iv
-(UIImage*)getNaviBarBackImg
{
    UIView*v=[self createBackView];
    UIImage*img=[v convertToImage];
    return img;
}
-(UIView*)createBackView
{
    UIView *backView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, WINDOWW, NavHeight)];
    CAGradientLayer *gradientLayer = [CAGradientLayer layer];
    gradientLayer.colors = @[(__bridge id)RGB(254, 213, 62, 1).CGColor, (__bridge id)RGB(235, 233, 81, 1).CGColor, (__bridge id)RGB(254, 213, 62, 1).CGColor];
    gradientLayer.locations = @[@0.3, @0.5, @1.0];
    gradientLayer.startPoint = CGPointMake(0, 0);
    gradientLayer.endPoint = CGPointMake(1.0, 0);
    gradientLayer.frame = backView.frame;
    [backView.layer addSublayer:gradientLayer];
    return backView;
}
-(UIImage*)convertViewToImage:(UIView*)v{
    CGSize s = v.bounds.size;
        // 下面方法，第一个参数表示区域大小。第二个参数表示是否是非透明的。如果需  要显示半透明效果，需要传NO，否则传YES。第三个参数就是屏幕密度了
    UIGraphicsBeginImageContextWithOptions(s, YES, [UIScreen mainScreen].scale);
    [v.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage*image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}
@end
