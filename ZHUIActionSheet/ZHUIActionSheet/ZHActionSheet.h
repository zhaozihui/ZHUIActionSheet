//
//  HLActionSheet.h
//  ActionSheet
//
//  Created by 赵子辉 on 15/10/22.
//  Copyright © 2015年 zhaozihui. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ZHActionSheet;
typedef void (^HLActionSheetSubmit)(int);

@interface ZHActionSheet : UIView

- (void)showInViewWithItems:(NSArray *)items title:(NSString *)title detail:(NSString *)detail cancel:(NSString *)cancel inView:(UIView *)vc;
- (void)hide;
@property(nonatomic,copy)HLActionSheetSubmit block;
@end
