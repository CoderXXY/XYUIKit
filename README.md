# XYUIKit
You can easy to make UI, but  you maybe take some parameters...
你可以很容易地做UI，但你可能需要一些参数…

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
