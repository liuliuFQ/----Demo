//
//  RootViewController.m
//  FaceAndText
//
//  Created by Ibokan on 14-4-10.
//  Copyright (c) 2014年 CainiaoLiu. All rights reserved.
//

#import "RootViewController.h"
#import "FaceAndTextLabel.h"
@interface RootViewController ()

@end

@implementation RootViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    FaceAndTextLabel * label  = [[FaceAndTextLabel alloc]initWithFrame:CGRectMake(20, 100, 250, 100)];
    
    [label  setFaceAndText:@"[月亮]开始这是MyFaceAndTextLabel的测试[转圈][发怒][抠鼻]中间这是MyFaceAndTextLabel的测试[傲慢][得意][吐][弱]最后这是MyFaceAndTextLabel的测试[晕][擦汗]"];

    [self.view addSubview:label];
  
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
