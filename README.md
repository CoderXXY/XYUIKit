# XYUIKit
You can easy to make UI, but  you maybe take some parameters...
你可以很容易地做UI，但你可能需要一些参数…

/**
 图片在文字的位置
 */
typedef NS_ENUM(NSInteger, XYImgDirectionType){
    XYImgDirectionType_default = 0,                               //  默认 left
    XYImgDirectionType_left,                                      //  left
    XYImgDirectionType_top,                                       //  top
    XYImgDirectionType_right,                                     //  right
    XYImgDirectionType_bottom                                     //  bottom
};

@interface XYButton : UIControl
/** the backgroundColor of XYButton */
@property (nonatomic, strong) UIColor *bgColor;
/** the titleBackgroundColor is different of titleColor */
@property (nonatomic, strong) UIColor *titleBackgroundColor;
/** title-color */
@property (nonatomic, strong) UIColor *titleColor;
/** the size of title,but it is an instance. */
@property (nonatomic, strong) UIFont *titleFont;
/** the space of title and image, suggest set 3.0 ~ 10.0 */
@property (nonatomic, assign) CGFloat space;

/** You can get the width of this button, and you have no permissions to set or modify the width. */
@property (nonatomic, assign, readonly, getter=width) CGFloat buttonWidth;
/** You can get the height of this button, and you have no permissions to set or modify the height. */
@property (nonatomic, assign, readonly, getter=height) CGFloat buttonHeight;


/** You will make a button which only with a background image that you input the parameter. */
+ (XYButton *) buttonWithImageName:(NSString *)imageName actionTarget:(id)actionTarget action:(SEL)action;
/** You will make a button which only with the title that you input the parameter, title, title's font-value and font-weight. */
+ (XYButton *) buttonWithTitle:(NSString *)title titleFontValue:(CGFloat)titleFontValue weight:(CGFloat)weight actionTarget:(id)actionTarget action:(SEL)action;
/** You will make a button which with the title and background image, that you input the parameter, title, background image and the background image direction of this button is you make it ,but title's defalut font-value is 12 and  default font-weight is 0.1. */
+ (XYButton *) buttonWithTitle:(NSString *)title imageName:(NSString *)imageName actionTarget:(id)actionTarget action:(SEL)action imageDirection:(XYImgDirectionType)imageDirection;
/** You will make a button which with the title and background image,title's font-value, font-weight and background image's location,these parameters just by yourself input. */
+ (XYButton *) buttonWithTitle:(NSString *)title imageName:(NSString *)imageName titleFontValue:(CGFloat)titleFontValue weight:(CGFloat)weight actionTarget:(id)actionTarget action:(SEL)action imageDirection:(XYImgDirectionType)imageDirection;

@end

简单实用如下：
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor redColor];
    
    XYButton *button = [XYButton buttonWithTitle:@"click" imageName:@"apple-login" titleFontValue:14 weight:0.1 actionTarget:self action:@selector(handleAction) imageDirection:XYImgDirectionType_bottom];
    button.frame = CGRectMake(100, 100, button.width, button.height);
    button.bgColor = [UIColor cyanColor];
    button.titleColor = [UIColor blackColor];
    button.space = 30;
    
    [self.view addSubview:button];
}

- (void)handleAction{
    
}


