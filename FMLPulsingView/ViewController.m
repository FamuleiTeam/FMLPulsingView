//
//  ViewController.m
//  FMLPulsingView
//
//  Created by Damien on 16/3/31.
//  Copyright © 2016年 Damien. All rights reserved.
//

#import "ViewController.h"
#import "FMLPulsingView.h"
@interface ViewController ()
@property (nonatomic, strong) FMLPulsingView *pview;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    FMLPulsingView *view = [[FMLPulsingView alloc]initWithFrame:CGRectMake(0, 100, 414, 414)];
    view.pulsingCount = 3;
    view.startRadius = 50;
    view.radius = 150;
    view.pulsingColor = [UIColor colorWithRed:0 green:0.455 blue:0.756 alpha:1];
    [self.view addSubview:view];
    
    _pview = view;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)stop:(id)sender {
    [_pview stopAnimation];
}
- (IBAction)start:(id)sender {
    [_pview startAnimation];
}

@end
