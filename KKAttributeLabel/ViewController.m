//
//  ViewController.m
//  KKAttributeLabel
//
//  Created by KING on 2016/10/8.
//  Copyright © 2016年 KK. All rights reserved.
//

#import "ViewController.h"

#import "KKAttributeLabel.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    KKAttributeLabel * label = [[KKAttributeLabel alloc]initWithFrame:CGRectMake(100, 100, 100, 20)];
    label.numberOfLines = 0;
    label.text = @"了贷款及法律的立法案例看大家福利卡时间段；路径案发就；发垃圾速度；离开房间啊按时交电费；啦";
    label.lineSpace = 10;
    label.numOfTrikethrough = 1;
    label.strikeColor = [UIColor redColor];
    label.strokeWidth = 2.0f;
    [self.view addSubview:label];
    [label sizeToFit];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
