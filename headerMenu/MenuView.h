//
//  MenuView.h
//  headerMenu
//
//  Created by Allen on 8/5/14.
//  Copyright (c) 2014 Allen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MenuView : UIView

@property (nonatomic, strong) UIButton *labelLeft;
@property (nonatomic, strong) UIButton *labelCenter;
@property (nonatomic, strong) UIButton *labelRight;
@property (nonatomic, strong) UIView *underlineLeft;
@property (nonatomic, strong) UIView *underlineCenter;
@property (nonatomic, strong) UIView *underlineRight;

@property (nonatomic, strong) NSString *leftTitle;
@property (nonatomic, strong) NSString *centerTitle;
@property (nonatomic, strong) NSString *rightTitle;

@property (nonatomic, assign) NSInteger maxFontSize;


@end
