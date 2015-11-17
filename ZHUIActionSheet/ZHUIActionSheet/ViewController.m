//
//  ViewController.m
//  ZHUIActionSheet
//
//  Created by 赵子辉 on 15/11/17.
//  Copyright © 2015年 zhaozihui. All rights reserved.
//

#import "ViewController.h"
#import "ZHActionSheet.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)showMe:(id)sender {
    ZHActionSheet *sheet = [[ZHActionSheet alloc] init];
    [sheet showInViewWithItems:@[@"button1",@"button2",@"button2"] title:@"title" detail:@"This demo will show a actionsheet with title and detail!" cancel:@"Cancel" inView:self.view];
    sheet.block = ^(int index)
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"You have choosed:" message:[NSString stringWithFormat:@"index:%d",index] delegate:nil cancelButtonTitle:@"Cancel" otherButtonTitles:nil, nil];
        [alert show];
    };
}

@end
