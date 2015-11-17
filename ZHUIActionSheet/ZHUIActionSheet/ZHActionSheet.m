//
//  HLActionSheet.m
//  ActionSheet
//
//  Created by 赵子辉 on 15/10/22.
//  Copyright © 2015年 zhaozihui. All rights reserved.
//

#import "ZHActionSheet.h"
#define SCREENSIZE UIScreen.mainScreen.bounds.size
@implementation ZHActionSheet
{
    UIView *bgView;
}
- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    return self;
}

- (void)hide
{
    [bgView removeFromSuperview];
    [self removeFromSuperview];

    
}
- (void)showInViewWithItems:(NSArray *)items title:(NSString *)title detail:(NSString *)detail cancel:(NSString *)cancel inView:(UIView *)vc
{
    BOOL hasDetail = detail.length >0? YES:NO;
    self.backgroundColor = [self getColor:@"F1F1F1"];
    
    UILabel *titleLbl = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, SCREENSIZE.width, 39)];
    titleLbl.textAlignment = NSTextAlignmentCenter;
    titleLbl.backgroundColor = [UIColor whiteColor];
    titleLbl.textColor = [self getColor:@"FF8000"];
    titleLbl.font = [UIFont fontWithName:@"Helvetica-Bold" size:15.0];
    titleLbl.text = title;
    [self addSubview:titleLbl];
    
   // CGSize size=[self workOutSizeWithStr:detail andFont:12 value:[NSValue valueWithCGSize:CGSizeMake(SCREENSIZE.width - 20, 29)]];

    
    UILabel *detailLbl = [[UILabel alloc] initWithFrame:CGRectMake(0, 39, SCREENSIZE.width, 29 )];

    
    detailLbl.font = [UIFont systemFontOfSize:12];
    detailLbl.numberOfLines = 0;
    detailLbl.lineBreakMode = NSLineBreakByCharWrapping;
    detailLbl.backgroundColor = [UIColor whiteColor];
    detailLbl.textColor = [self getColor:@"636363"];
    NSMutableParagraphStyle *style =  [[NSParagraphStyle defaultParagraphStyle] mutableCopy];
    style.alignment = NSTextAlignmentCenter;  //对齐
    style.headIndent = 10;          //行首缩进
    style.tailIndent = -10.0;//行尾缩进
    style.firstLineHeadIndent = 10.0;//首行缩进
    NSAttributedString *attrText = [[NSAttributedString alloc] initWithString:detail attributes:@{ NSParagraphStyleAttributeName : style}];
    
    detailLbl.attributedText = attrText;
    if (hasDetail) {
        [self addSubview:detailLbl];
    }
    
    int btnStartHeight = hasDetail >0?(detailLbl.frame.origin.y +detailLbl.frame.size.height + 1):40;
    
    for (int i=0; i<[items count]; i++) {
        UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(0, btnStartHeight + 50*i, SCREENSIZE.width, 49)];
        [btn setTitle:items[i] forState:UIControlStateNormal];
        [btn setTitleColor:[self getColor:@"2EBE68"] forState:UIControlStateNormal];
        btn.titleLabel.font = [UIFont fontWithName:@"Helvetica-Bold" size:18.0];
        btn.backgroundColor = [UIColor whiteColor];
        btn.tag = 900+i;
        [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:btn];
    }
    UIButton *bottom1 = [[UIButton alloc] initWithFrame:CGRectMake(0, btnStartHeight +[items count]*50 + 5, SCREENSIZE.width ,50)];
    [bottom1 setTitle:cancel forState:UIControlStateNormal];
    [bottom1 setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    bottom1.backgroundColor = [UIColor whiteColor];
    bottom1.titleLabel.font = [UIFont systemFontOfSize:15];
    [bottom1 addTarget:self action:@selector(cancelView:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:bottom1];
    

    
    float height = btnStartHeight +[items count]*50 + 5 + 50;
    
    self.frame = CGRectMake(0, vc.frame.size.height - height, vc.frame.size.width, height);
    
    bgView = [[UIView alloc] initWithFrame:UIScreen.mainScreen.bounds];
    bgView.backgroundColor = [UIColor blackColor];
    bgView.alpha = 0.3f;
    [vc addSubview:bgView];
    
    CGRect frame = self.frame ;
    self.frame = CGRectMake(0,vc.frame.size.height + frame.size.height, SCREENSIZE.width, frame.size.height);
    [vc addSubview:self];
    [UIView animateWithDuration:0.5f
                     animations:^{
                         
                         self.frame = frame;
                     }
                     completion:nil];

}

- (void)cancelView:(UIButton *)btn
{
    _block(-1);
    [self hide];
    
    
}
- (void)btnClick:(UIButton *)btn
{
    NSLog(@"%d",btn.tag - 900);
    _block(btn.tag - 900);
    [self hide];
    
}
- (UIColor *)getColor:(NSString*)hexColor

{
    
    unsigned int red,green,blue;
    NSRange range;
    range.length = 2;
    range.location = 0;
    [[NSScanner scannerWithString:[hexColor substringWithRange:range]]scanHexInt:&red];
    range.location = 2;
    [[NSScanner scannerWithString:[hexColor substringWithRange:range]]scanHexInt:&green];
    range.location = 4;
    [[NSScanner scannerWithString:[hexColor substringWithRange:range]]scanHexInt:&blue];
    return [UIColor colorWithRed:(float)(red/255.0f)green:(float)(green / 255.0f) blue:(float)(blue / 255.0f)alpha:1.0f];
    
}

- (CGSize)workOutSizeWithStr:(NSString *)str andFont:(NSInteger)fontSize value:(NSValue *)value{
    CGSize size;
    if (str) {
        NSDictionary *attribute = [NSDictionary dictionaryWithObjectsAndKeys:[UIFont systemFontOfSize:fontSize],NSFontAttributeName, nil];
        size=[str boundingRectWithSize:[value CGSizeValue] options:NSStringDrawingUsesFontLeading |NSStringDrawingUsesLineFragmentOrigin |NSStringDrawingTruncatesLastVisibleLine attributes:attribute context:nil].size;
    }
    return size;
}
@end
