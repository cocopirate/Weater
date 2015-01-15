//
//  MainViewController.h
//  Weater
//
//  Created by coco on 15/1/7.
//  Copyright (c) 2015年 coco. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WeatherForecast.h"

@interface MainViewController : UIViewController{

    IBOutlet UIActivityIndicatorView *loadingActivityIndicator;
    IBOutlet UILabel *cityLable;
    IBOutlet UILabel *weatherLabel;
    IBOutlet UIImageView *weatherImage;
    IBOutlet UILabel *centigradeLabel;
    IBOutlet UILabel *fahrenheitLabel;
    IBOutlet UILabel *hmidityLabel;
    IBOutlet UILabel *windLabel;
    IBOutlet UIButton *refreshButton;
    
}

@property(strong,nonatomic) WeatherForecast *forecast;

-(IBAction)refreshView:(id)sender;
-(void)updateView;

@end

