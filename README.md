//all from  https://github.com/levey/AwesomeMenu
//just change a little, add a label for title 

//usage can refer to https://github.com/levey/AwesomeMenu
//or like this:
- (void)loadPathButtonMenu
{
    UIImage *storyMenuItemImage = [UIImage imageNamed:@"bg-menuitem.png"];
    UIImage *storyMenuItemImagePressed = [UIImage imageNamed:@"bg-menuitem-highlighted.png"];
    
    UIImage *starImage = [UIImage imageNamed:@"icon-star.png"];
    
    
    WAwesomeMenuItem *starMenuItem1 = [[WAwesomeMenuItem alloc] initWithImage:storyMenuItemImage
                                                             highlightedImage:storyMenuItemImagePressed
                                                                 ContentImage:starImage
                                                      highlightedContentImage:nil
                                                                 titleContent:@"start"];
    WAwesomeMenuItem *starMenuItem2 = [[WAwesomeMenuItem alloc] initWithImage:storyMenuItemImage
                                                             highlightedImage:storyMenuItemImagePressed
                                                                 ContentImage:starImage
                                                      highlightedContentImage:nil
                                                                 titleContent:@"story"];
    WAwesomeMenuItem *starMenuItem3 = [[WAwesomeMenuItem alloc] initWithImage:storyMenuItemImage
                                                             highlightedImage:storyMenuItemImagePressed
                                                                 ContentImage:starImage
                                                      highlightedContentImage:nil
                                                                 titleContent:@"我说旎旎"];
    WAwesomeMenuItem *starMenuItem4 = [[WAwesomeMenuItem alloc] initWithImage:storyMenuItemImage
                                                             highlightedImage:storyMenuItemImagePressed
                                                                 ContentImage:starImage
                                                      highlightedContentImage:nil
                                                                 titleContent:@"开发咨询站"];
    WAwesomeMenuItem *starMenuItem5 = [[WAwesomeMenuItem alloc] initWithImage:storyMenuItemImage
                                                             highlightedImage:storyMenuItemImagePressed
                                                                 ContentImage:starImage
                                                      highlightedContentImage:nil
                                                                 titleContent:@"企业简介"];
    
    NSArray *menus = [NSArray arrayWithObjects:starMenuItem1, starMenuItem2, starMenuItem3, starMenuItem4, starMenuItem5, nil];
    
    WAwesomeMenuItem *startItem = [[WAwesomeMenuItem alloc] initWithImage:[UIImage imageNamed:@"bg-addbutton.png"]
                                                         highlightedImage:[UIImage imageNamed:@"bg-addbutton-highlighted.png"]
                                                             ContentImage:[UIImage imageNamed:@"icon-plus.png"]
                                                  highlightedContentImage:[UIImage imageNamed:@"icon-plus-highlighted.png"]
                                                             titleContent:@""];
    
    self.menu= [[WAwesomeMenu alloc] initWithFrame:self.window.bounds startItem:startItem optionMenus:menus];
    self.menu.delegate = self;
    
    self.menu.rotateAngle=-M_PI_2;
	self.menu.menuWholeAngle = M_PI;
	self.menu.farRadius = 110.0f;
	self.menu.endRadius = 100.0f;
	self.menu.nearRadius = 90.0f;
    self.menu.animationDuration = 0.3f;
    self.menu.startPoint = CGPointMake(160.0, 410.0);
    
    [self.window addSubview:self.menu];
}

- (void)awesomeMenu:(WAwesomeMenu *)menu didSelectIndex:(NSInteger)idx
{
    NSLog(@"Select the index : %d",idx);
    
    
}
- (void)awesomeMenuDidFinishAnimationClose:(WAwesomeMenu *)menu {
    NSLog(@"Menu was closed!");
}
- (void)awesomeMenuDidFinishAnimationOpen:(WAwesomeMenu *)menu {
    NSLog(@"Menu is open!");
}