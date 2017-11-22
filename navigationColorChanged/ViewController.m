//
//  ViewController.m
//  navigationColorChanged
//
//  Created by bex on 2017/11/22.
//  Copyright © 2017年 bex. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UITableViewDataSource,UIScrollViewDelegate>
@property(nonatomic,strong) UIView *barImageView;
@property(nonatomic,strong) UITableView *tableView;
@end

@implementation ViewController

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.tableView.delegate = self;
}
- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    self.tableView.delegate = nil;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBar.barTintColor = [UIColor redColor];
    self.navigationController.navigationBar.tintColor = [UIColor blackColor];
    self.navigationItem.title = @"daohang标题";
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:(UIBarButtonSystemItemDone) target:self action:@selector(gotoTop)];
    
    self.tableView = [[UITableView alloc]initWithFrame:self.view.frame style:(UITableViewStylePlain)];
    [self.view addSubview:self.tableView];
    self.tableView.dataSource = self;
}

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



-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 40;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:@"cell"];
    }
    cell.textLabel.text = [NSString stringWithFormat:@"cell = %ld",(long)indexPath.row];
    return cell;
}

-(void)gotoTop{
//    self.tableView.contentOffset = CGPointMake(0, 0 );
    
    [self.navigationController pushViewController:[ViewController new] animated:YES];
}

+ (UIImage *)imageWithColor:(UIColor *)color {
    CGRect rect = CGRectMake(0, 0, 1, 1);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    [color setFill];
    CGContextFillRect(context, rect);
    UIImage *imgae = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return imgae;
}

@end
