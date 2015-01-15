//
//  MainViewController.m
//  Weater
//
//  Created by coco on 15/1/7.
//  Copyright (c) 2015年 coco. All rights reserved.
//

#import "MainViewController.h"

@interface MainViewController ()

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self refreshView:self];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

-(IBAction)refreshView:(id)sender{
    [loadingActivityIndicator startAnimating];
    [self.forecast queryServiceWithCity:@"杭州" withParent:self];
}
-(void)updateView{
    [loadingActivityIndicator stopAnimating];
}


@end
