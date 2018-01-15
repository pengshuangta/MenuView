//
//  ViewController.m
//  DropMenu
//
//  Created by 彭双塔 on 2018/1/11.
//  Copyright © 2018年 pst. All rights reserved.
//

#import "ViewController.h"
#import "PST_MenuView.h"
@interface ViewController ()<PST_MenuViewDelegate>
/** 左边按钮 */
@property(nonatomic,strong)UIButton *leftBtn;
/** 右边按钮 */
@property(nonatomic,strong)UIButton *rightBtn;
/** 图片数组 */
@property(nonatomic,strong)NSArray *imgArr;
/** 文字数组 */
@property(nonatomic,strong)NSArray *titleArr;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    self.title = @"下拉菜单封装";
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(navLeftClick)];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(navRightClick)];
    
    [self.view addSubview:self.leftBtn];
    [self.view addSubview:self.rightBtn];
    self.titleArr = @[@"创建群聊",@"加好友／群",@"扫一扫",@"面对面快传",@"付款",@"拍摄",];
    self.imgArr = @[@"创建群聊",@"加好友",@"扫一扫",@"面对面快传",@"付款",@"拍摄",];
    
}
-(void)navLeftClick{
    PST_MenuView *menuView = [[PST_MenuView alloc] initWithFrame:CGRectMake(8, 50, 120, 248) titleArr:self.titleArr imgArr:self.imgArr arrowOffset:16 rowHeight:40 layoutType:1 directionType:0 delegate:self];
    menuView.lineColor = [UIColor yellowColor];
    menuView.titleColor = [UIColor redColor];
    menuView.arrowColor = [UIColor redColor];
}
-(void)didSelectRowAtIndex:(NSInteger)index title:(NSString *)title img:(NSString *)img{
    NSLog(@"index----%zd,  title---%@, image---%@", index, title, img);
}
-(void)navRightClick{
    PST_MenuView *menuView = [[PST_MenuView alloc] initWithFrame:CGRectMake(self.view.frame.size.width - 120 - 8, 50, 120, 248) titleArr:self.titleArr imgArr:self.imgArr arrowOffset:104 rowHeight:40 layoutType:0 directionType:0 delegate:self];
}
#pragma mark - 懒加载
-(UIButton *)leftBtn{
    if (!_leftBtn) {
        _leftBtn = [[UIButton alloc] initWithFrame:CGRectMake(10, self.view.frame.size.height - 60, 150, 40)];
        [_leftBtn setTitle:@"左按钮" forState:0];
        [_leftBtn setBackgroundColor:[UIColor blueColor]];
        [_leftBtn setTitleColor:[UIColor whiteColor] forState:0];
        [_leftBtn addTarget:self action:@selector(leftBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _leftBtn;
}
-(UIButton *)rightBtn{
    if (!_rightBtn) {
        _rightBtn = [[UIButton alloc] initWithFrame:CGRectMake(self.view.frame.size.width - 160, self.view.frame.size.height - 60, 150, 40)];
        [_rightBtn setTitle:@"右按钮" forState:0];
        [_rightBtn setBackgroundColor:[UIColor blueColor]];
        [_rightBtn setTitleColor:[UIColor whiteColor] forState:0];
        [_rightBtn addTarget:self action:@selector(rightBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _rightBtn;
}
-(NSArray *)imgArr{
    if (!_imgArr) {
        _imgArr = [[NSArray alloc] init];
    }
    return _imgArr;
}
-(NSArray *)titleArr{
    if (!_titleArr) {
        _titleArr = [[NSArray alloc] init];
    }
    return _titleArr;
}
-(void)leftBtnClicked:(UIButton *)button{
    PST_MenuView *menuView = [[PST_MenuView alloc] initWithFrame:CGRectMake(button.frame.origin.x, button.frame.origin.y - 248, 120, 248) titleArr:self.titleArr imgArr:self.imgArr arrowOffset:16 rowHeight:40 layoutType:0 directionType:1 delegate:self];
    menuView.arrowColor = [UIColor redColor];
}
-(void)rightBtnClicked:(UIButton *)button{
    PST_MenuView *menuView = [[PST_MenuView alloc] initWithFrame:CGRectMake(self.view.frame.size.width - 10 - 120, button.frame.origin.y - 248, 120, 248) titleArr:self.titleArr imgArr:self.imgArr arrowOffset:120 - 16 rowHeight:40 layoutType:0 directionType:1 delegate:self];
    menuView.arrowColor = [UIColor redColor];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end

