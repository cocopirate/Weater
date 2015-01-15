//
//  NSObject+WeatherForecast.h
//  Weater
//
//  Created by coco on 15/1/7.
//  Copyright (c) 2015年 coco. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

@class MainViewController;

@interface WeatherForecast:NSObject<NSURLConnectionDataDelegate>{
    
    MainViewController *mainViewController;
    NSMutableData *responseData;
    NSURL *theURL;
}

@property(weak,nonatomic) NSString *location;

@property(weak,nonatomic) NSString *icon;
@property(weak,nonatomic) NSString *condition;

@property(weak,nonatomic) NSString *centigrade;
@property(weak,nonatomic) NSString *fahrenheit;
@property(weak,nonatomic) NSString *humidity;
@property(weak,nonatomic) NSString *wind;

-(void)queryServiceWithCity:(NSString *)city withParent:(UIViewController *)controller;

@end
