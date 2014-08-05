//
//  MenuView.m
//  headerMenu
//
//  Created by Allen on 8/5/14.
//  Copyright (c) 2014 Allen. All rights reserved.
//

#import "MenuView.h"



@implementation MenuView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
    }
    return self;
}

- (void)setLeftTitle:(NSString *)leftTitle {
    if (![_leftTitle isEqual:leftTitle]) {
        _leftTitle = [leftTitle copy];
        self.leftTitle = _leftTitle;
        self.labelLeft = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width/3, self.frame.size.height)];
        [self addSubview:self.labelLeft];
        CGFloat stringWitdh = [self.leftTitle sizeWithAttributes:@{NSFontAttributeName: [UIFont systemFontOfSize:self.maxFontSize]}].width;
        self.underlineLeft = [[UIView alloc] initWithFrame:CGRectMake((self.frame.size.width/3 - stringWitdh)/2, self.frame.size.height, stringWitdh, 2)];
        [self.underlineLeft setBackgroundColor:[UIColor whiteColor]];
        [self.labelLeft addSubview:self.underlineLeft];
        [self.labelLeft setTitle:self.leftTitle forState:UIControlStateNormal];
    }
}

- (void)setCenterTitle:(NSString *)centerTitle {
    if (![_centerTitle isEqual:centerTitle]) {
        _centerTitle = [centerTitle copy];
        self.centerTitle = _centerTitle;
        self.labelCenter = [[UIButton alloc] initWithFrame:CGRectMake(self.frame.size.width/3, 0, self.frame.size.width/3, self.frame.size.height)];
        [self addSubview:self.labelCenter];
        CGFloat stringWitdh = [self.centerTitle sizeWithAttributes:@{NSFontAttributeName: [UIFont systemFontOfSize:self.maxFontSize]}].width;
        self.underlineCenter =  [[UIView alloc] initWithFrame:CGRectMake((self.frame.size.width/3 - stringWitdh)/2, self.frame.size.height, stringWitdh, 2)];
        [self.underlineCenter setBackgroundColor:[UIColor whiteColor]];
        [self.labelCenter addSubview:self.underlineCenter];
        [self.labelCenter setTitle:self.centerTitle forState:UIControlStateNormal];
    }
}

- (void)setRightTitle:(NSString *)rightTitle {
    if (![_rightTitle isEqual:rightTitle]) {
        _rightTitle = [rightTitle copy];
        self.rightTitle = _rightTitle;
        self.labelRight = [[UIButton alloc] initWithFrame:CGRectMake(self.frame.size.width*2/3, 0, self.frame.size.width/3, self.frame.size.height)];
        [self addSubview:self.labelRight];
        CGFloat stringWitdh = [self.rightTitle sizeWithAttributes:@{NSFontAttributeName: [UIFont systemFontOfSize:self.maxFontSize]}].width;
        self.underlineRight = [[UIView alloc] initWithFrame:CGRectMake((self.frame.size.width/3 - stringWitdh)/2, self.frame.size.height, stringWitdh, 2)];
        [self.underlineRight setBackgroundColor:[UIColor whiteColor]];
        [self.labelRight addSubview:self.underlineRight];
        [self.labelRight setTitle:self.rightTitle forState:UIControlStateNormal];
    }
}

- (void)setMaxFontSize:(NSInteger)maxFontSize {
    _maxFontSize = maxFontSize;
}

@end
