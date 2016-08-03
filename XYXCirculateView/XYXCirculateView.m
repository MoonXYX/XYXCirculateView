//
//  XYXCirculateView.m
//  XYXCirculateImage
//
//  Created by vlusi on 16/8/2.
//  Copyright © 2016年 vlusi. All rights reserved.
//

#import "XYXCirculateView.h"

@interface XYXCirculateView ()<UIScrollViewDelegate>
@property (nonatomic,strong)UIScrollView *scrollView;
@property (nonatomic,strong)UIImageView *visibleView;
@property (nonatomic,strong)UIImageView *reuseView;
@property (nonatomic,strong)NSTimer *timer;
@property (nonatomic,strong)UIPageControl *pageControl;

@end

@implementation XYXCirculateView

- (void)setImagesArray:(NSArray *)imagesArray{
    _imagesArray = imagesArray;
    self.visibleView.image = [imagesArray firstObject];
    self.pageControl.numberOfPages = imagesArray.count;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self setUpScrollViewAndImageView];
        [self startTimer];
       
    }
    return self;
}

- (void)setUpScrollViewAndImageView{
    
    CGFloat XYXViewWidth = self.bounds.size.width;
    CGFloat XYXViewHeight = self.bounds.size.height;
    
    //scrollview
    self.scrollView = [[UIScrollView alloc]initWithFrame:self.bounds];
    self.scrollView.pagingEnabled = YES;
    self.scrollView.contentSize = CGSizeMake(XYXViewWidth * 3, 0);
    //当前偏移的位置
    self.scrollView.contentOffset = CGPointMake(XYXViewWidth , 0);
    //隐藏滚动条
    self.scrollView.showsHorizontalScrollIndicator = NO;
    self.scrollView.delegate = self;
    [self addSubview:self.scrollView];
    
    //显示在视图上的imageview
    self.visibleView = [[UIImageView alloc]init];
    self.visibleView.frame = CGRectMake(XYXViewWidth, 0, XYXViewWidth, XYXViewHeight);
    self.visibleView.tag = 0;
    [self.scrollView addSubview:self.visibleView];
    
    //重复利用的imageview
    self.reuseView = [[UIImageView alloc]init];
    self.reuseView.frame = self.bounds;
    [self.scrollView addSubview:self.reuseView];
    
    //设置pagecontrol
    self.pageControl = [[UIPageControl alloc]initWithFrame:CGRectMake(0, XYXViewHeight - 20, 150, 20)];
    self.pageControl.currentPageIndicatorTintColor = [UIColor greenColor];
    self.pageControl.pageIndicatorTintColor = [UIColor grayColor];
    [self.pageControl setCenter:CGPointMake(self.center.x, XYXViewHeight - 10)];
    //当前页
    self.pageControl.currentPage = self.visibleView.tag;
    [self addSubview:self.pageControl];
    
}
#pragma mark - <UIScrollViewDelegate>
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
    CGFloat offsetX = scrollView.contentOffset.x;
    CGFloat ScrollWidth = scrollView.frame.size.width;
    
    CGRect fra = self.reuseView.frame;
    NSInteger index = 0;
    
    if (offsetX > self.visibleView.frame.origin.x) {
        fra.origin.x = scrollView.contentSize.width - ScrollWidth;
        index = self.visibleView.tag + 1;
        if (index >= self.imagesArray.count) index = 0;
    }else{
        fra.origin.x = 0;
        
        index = self.visibleView.tag - 1;
        if (index < 0) index = self.imagesArray.count - 1;
    }
    self.reuseView.frame = fra;
    self.reuseView.tag = index;
    self.reuseView.image = self.imagesArray[index];
    
    if (offsetX <= 0 || offsetX >= ScrollWidth * 2) {
        //交换 中间的 和 循环利用的指针
        UIImageView *imageview = self.visibleView;
        self.visibleView = self.reuseView;
        self.reuseView = imageview;
        //交换显示的位置
        self.visibleView.frame = self.reuseView.frame;
        //初始化scrollview的偏移量
        self.scrollView.contentOffset = CGPointMake(ScrollWidth, 0);
    }
    self.pageControl.currentPage = index;
}
//开始拖动
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
    [self stopTimer];
}
//结束拖动
- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate{
    [self startTimer];
}

- (void)startTimer{
    
    self.timer = [NSTimer scheduledTimerWithTimeInterval:2 target:self selector:@selector(changeImage) userInfo:nil repeats:YES];
    [[NSRunLoop mainRunLoop]addTimer:self.timer forMode:NSRunLoopCommonModes];
}
- (void)stopTimer{
    [self.timer invalidate];
    self.timer = nil;
}
- (void)changeImage{
    
    [self.scrollView setContentOffset:CGPointMake(self.bounds.size.width * 2, 0) animated:YES];
}

- (void)setCurrentColor:(UIColor *)currentColor
{
    _currentColor = currentColor;
    
    self.pageControl.currentPageIndicatorTintColor = currentColor;
}
- (void)setOtherColor:(UIColor *)otherColor
{
    _otherColor = otherColor;
    
    self.pageControl.pageIndicatorTintColor = otherColor;
}

@end
