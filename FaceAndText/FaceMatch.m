//
//  FaceMatch.m
//  FaceAndText
//
//  Created by Ibokan on 14-4-10.
//  Copyright (c) 2014年 CainiaoLiu. All rights reserved.
//

#import "FaceMatch.h"

@implementation FaceMatch
/**
 *  重写init对实例变量进行初始化
 *
 *  @return <#return value description#>
 */
-(id)init{

    self = [super init];
    if (self) {
        _faceArray = [NSMutableArray array];
        
    }
    return self;
}
/**
 *  <#Description#>
 *
 *  @param resourceString <#resourceString description#>
 */
-(void)doMatch:(NSString *)resourceString{
     NSLog(@"%s----%@",__FUNCTION__,resourceString);
    if ([resourceString length] == 0) {
        NSLog(@"fanhui");
        return;
    }
    NSRange endRang = [resourceString rangeOfString:kEND_MARK];
    if (endRang.location == NSNotFound) {
            NSLog(@"location = %d,",endRang.location);

            [_faceArray addObject:resourceString];
            return;
        }else{
            NSString * string = [resourceString substringToIndex:endRang.location];
            if (string == nil) {
                [_faceArray addObject:resourceString];
                return;
            }else{
                NSRange beginRang = [string rangeOfString:kBEGIN_MARK options:NSBackwardsSearch];//从结尾开始查找
                if (beginRang.location == NSNotFound) {
                    NSLog(@"begin.location = %d,resourceString = %@",beginRang.location,resourceString);
                    [_faceArray addObject:resourceString];
                    return;
                }else{
                    string = [string substringToIndex:beginRang.location];
                    if ([string length] > 0 ) {
                        NSLog(@"string = %@",string);

                        [_faceArray addObject:string];
                    }
                    [_faceArray addObject:[resourceString substringWithRange:NSMakeRange(beginRang.location, endRang.location - beginRang.location +1)]];
                    [self doMatch:[resourceString substringFromIndex:endRang.location + 1]];//循环
                
                }
            }
            
        
        }
    
}
#pragma mark--接口实现
-(NSArray * )match:(NSString * )resourceString;
{    NSLog(@"%s----%@",__FUNCTION__,resourceString);
    [self doMatch:resourceString];
    return _faceArray;
}
@end
