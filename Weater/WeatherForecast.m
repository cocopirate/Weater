//
//  NSObject+WeatherForecast.m
//  Weater
//
//  Created by coco on 15/1/7.
//  Copyright (c) 2015年 coco. All rights reserved.
//

#import "XPathQuery.h"
#import "WeatherForecast.h"
#import "MainViewController.h"

@implementation WeatherForecast

-(void)queryServiceWithCity:(NSString *)city withParent:(UIViewController *)controller{
    responseData = [NSMutableData data];
    NSString *url = [NSString stringWithFormat:@"http://wthrcdn.etouch.cn/WeatherApi?city=%@",city];
    theURL = [NSURL URLWithString:[url stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
    NSURLRequest *request = [NSURLRequest requestWithURL:theURL];
    [NSURLConnection connectionWithRequest:request delegate:self];

}

#pragma mark NSURLConnection Delegate Methods

-(NSURLRequest *)connection:(NSURLConnection *)connection willSendRequest:(NSURLRequest *)request redirectResponse:(NSURLResponse *)response
{
    @autoreleasepool {
        theURL = [request URL];
    }
    return request;
}

-(void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response{
    [responseData setLength:0];
}

-(void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data{
    [responseData appendData:data];
}

-(void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error{
    NSLog(@"Error = %@",error);
}

-(NSString *)fetchContent:(NSArray *)nodes{
    NSString *result=@"";
    for (NSDictionary *node in nodes) {
        for (id key in node) {
            if ([key isEqualToString:@"nodeContent"]) {
                result = [node objectForKey:key];
            }
        }
    }
    return result;
}

-(void)populateArray:(NSMutableArray *)arry fromNodes:(NSArray *)nodes{

    for (NSDictionary *node in nodes) {
        for (id key in node) {
            if ([key isEqualToString:@"nodeContent"]) {
                [arry addObject:[node objectForKey:key]];
            }
        }
    }
}

-(void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    //NSString *content = [[NSString alloc] initWithBytes:[responseData bytes] length:[responseData length] encoding:NSUTF8StringEncoding];
    //NSLog(@"Data = %@",content);
    NSString *xpathQueryString;
    NSArray *nodes;
    
    //城市
    xpathQueryString = @"//resp/city";
    nodes = PerformXMLXPathQuery(responseData, xpathQueryString);
    self.location = [self fetchContent:nodes];
    NSLog(@"location = %@",self.location);

    
    [mainViewController updateView];
}

@end
