//
//  ViewController.m
//  Animation
//
//  Created by 宋文涛 on 2019/8/5.
//  Copyright © 2019 songwentao. All rights reserved.
//

#import "ViewController.h"


static NSString * const wShowShadowAnimation = @"wShowShadowAnimation";
static NSString * const wShowTransformAnimation = @"wShowTransformAnimation";
static NSString * const wShowMaskAnimation = @"wShowMaskAnimation";
static NSString * const wShowCellAnimation = @"wShowCellAnimation";
static NSString * const wShowGroupAnimation = @"wShowGroupAnimation";
static NSString * const wShowPushAnimation = @"wShowPushAnimation";

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic,strong)NSArray *titleArray;
@property (nonatomic,strong)NSArray *segueArray;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _titleArray = @[@"阴影动画", @"旋转动画", @"遮罩动画", @"Cell加载动画", @"组动画",@"push动画"];
    _segueArray = @[wShowShadowAnimation,wShowTransformAnimation,wShowMaskAnimation,wShowCellAnimation,wShowGroupAnimation,wShowPushAnimation];
    // Do any additional setup after loading the view.
}





-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _titleArray.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *identifier = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    cell.textLabel.text = _titleArray[indexPath.row];
    return cell;
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:true];
    [self performSegueWithIdentifier:_segueArray[indexPath.row] sender:nil];
}



@end
