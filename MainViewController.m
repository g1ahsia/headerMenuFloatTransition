//
//  MainViewController.m
//  headerMenu
//
//  Created by Allen on 8/5/14.
//  Copyright (c) 2014 Allen. All rights reserved.
//

#import "MainViewController.h"
#import "MenuView.h"

#define MENU_HEIGHT 45
#define MENU_WIDTH 150
#define MENU_FONT_MAX 24
#define MENU_FONT_MIN 18
#define XOFFSET_SPEED 0.09
#define FONTDIFF_SPEED 0.0039

@interface MainViewController () {
    UIScrollView *menuScrollView;
    UIView *redView;
    UIView *greenView;
    UIView *blueView;
    
    UIView *headerView;
    UIButton *labelLeft;
    UIButton *labelCenter;
    UIButton *labelRight;
    UIView *underlineLeft;
    UIView *underlineCenter;
    UIView *underlineRight;
    
    NSInteger BOUND_WIDTH;
    NSInteger BOUND_HEIGHT;
    
    MenuView *menuView;
}

@end

@implementation MainViewController

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
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
    BOUND_WIDTH = self.view.bounds.size.width;
    BOUND_HEIGHT = self.view.bounds.size.height;
    // Do any additional setup after loading the view
    menuScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, BOUND_WIDTH, BOUND_HEIGHT)];
    [menuScrollView setContentSize:CGSizeMake(3*BOUND_WIDTH, BOUND_HEIGHT)];
    [menuScrollView setPagingEnabled:YES];
    menuScrollView.delegate = self;
    redView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, BOUND_WIDTH, BOUND_HEIGHT)];
    [redView setBackgroundColor:[UIColor redColor]];
    
    greenView = [[UIView alloc] initWithFrame:CGRectMake(BOUND_WIDTH, 0, BOUND_WIDTH, BOUND_HEIGHT)];
    [greenView setBackgroundColor:[UIColor greenColor]];
    
    blueView = [[UIView alloc] initWithFrame:CGRectMake(2*BOUND_WIDTH, 0, BOUND_WIDTH, BOUND_HEIGHT)];
    [blueView setBackgroundColor:[UIColor blueColor]];
    
    [self.view addSubview:menuScrollView];
    [menuScrollView addSubview:redView];
    [menuScrollView addSubview:greenView];
    [menuScrollView addSubview:blueView];
    
    menuView = [[MenuView alloc] initWithFrame:CGRectMake((BOUND_WIDTH - 3*MENU_WIDTH)/2, 90, 3*MENU_WIDTH, MENU_HEIGHT)];
    
    [menuView setMaxFontSize:MENU_FONT_MAX];
    [menuView setLeftTitle:@"Quotes"];
    [menuView setCenterTitle:@"Collections"];
    [menuView setRightTitle:@"Quoters"];
    [menuView.labelLeft addTarget:self action:@selector(menuTapped:) forControlEvents:UIControlEventTouchUpInside];
    [menuView.labelCenter addTarget:self action:@selector(menuTapped:) forControlEvents:UIControlEventTouchUpInside];
    [menuView.labelRight addTarget:self action:@selector(menuTapped:) forControlEvents:UIControlEventTouchUpInside];
    
    
    
//    headerView = [[UIView alloc] initWithFrame:CGRectMake((BOUND_WIDTH - 3*MENU_WIDTH)/2, 90, 3*MENU_WIDTH, MENU_HEIGHT)];
    
//    labelLeft = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, MENU_WIDTH, MENU_HEIGHT)];
//    [labelLeft setTitle:@"Quotes" forState:UIControlStateNormal];
//    [labelLeft addTarget:self action:@selector(menuTapped:) forControlEvents:UIControlEventTouchUpInside];
//    [labelLeft.titleLabel setFont:[UIFont systemFontOfSize:MENU_FONT_MAX]];
//    CGFloat stringWitdh = [@"Quotes" sizeWithAttributes:@{NSFontAttributeName: [UIFont systemFontOfSize:MENU_FONT_MAX]}].width;
//    underlineLeft = [[UIView alloc] initWithFrame:CGRectMake((MENU_WIDTH - stringWitdh)/2, MENU_HEIGHT, stringWitdh, 2)];
//    [underlineLeft setBackgroundColor:[UIColor whiteColor]];
//    
//    labelCenter = [[UIButton alloc] initWithFrame:CGRectMake(MENU_WIDTH, 0, MENU_WIDTH, MENU_HEIGHT)];
//    [labelCenter setTitle:@"Collections" forState:UIControlStateNormal];
//    [labelCenter addTarget:self action:@selector(menuTapped:) forControlEvents:UIControlEventTouchUpInside];
//    stringWitdh = [@"Collections" sizeWithAttributes:@{NSFontAttributeName: [UIFont systemFontOfSize:MENU_FONT_MAX]}].width;
//    underlineCenter = [[UIView alloc] initWithFrame:CGRectMake((MENU_WIDTH - stringWitdh)/2, MENU_HEIGHT, stringWitdh, 2)];
//    [underlineCenter setBackgroundColor:[UIColor whiteColor]];
//    
//    labelRight = [[UIButton alloc] initWithFrame:CGRectMake(2*MENU_WIDTH, 0, MENU_WIDTH, MENU_HEIGHT)];
//    [labelRight setTitle:@"Quoters" forState:UIControlStateNormal];
//    [labelRight addTarget:self action:@selector(menuTapped:) forControlEvents:UIControlEventTouchUpInside];
//    stringWitdh = [@"Quoters" sizeWithAttributes:@{NSFontAttributeName: [UIFont systemFontOfSize:MENU_FONT_MAX]}].width;
//    underlineRight = [[UIView alloc] initWithFrame:CGRectMake((MENU_WIDTH - stringWitdh)/2, MENU_HEIGHT, stringWitdh, 2)];
//    [underlineRight setBackgroundColor:[UIColor whiteColor]];
    
//    [self.view addSubview:headerView];
//    [headerView addSubview:labelLeft];
//    [headerView addSubview:labelCenter];
//    [headerView addSubview:labelRight];
//    [labelLeft addSubview:underlineLeft];
//    [labelCenter addSubview:underlineCenter];
//    [labelRight addSubview:underlineRight];
    
    [self.view addSubview:menuView];
    
    // Setting headerView offset
    CGFloat offsetX = (menuScrollView.contentOffset.x - BOUND_WIDTH)*XOFFSET_SPEED;
    
    [menuView setFrame:CGRectMake((BOUND_WIDTH - 3*MENU_WIDTH)/2 - offsetX, 90, 3*MENU_WIDTH, MENU_HEIGHT)];
    
//    [headerView setFrame:CGRectMake((BOUND_WIDTH - 3*MENU_WIDTH)/2 - offsetX, 90, 3*MENU_WIDTH, MENU_HEIGHT)];
    
    
    // Setting label font sizes
    CGFloat fontDiff1 = (menuScrollView.contentOffset.x)*FONTDIFF_SPEED;
    CGFloat newFont = fmaxf(MENU_FONT_MIN, MENU_FONT_MAX - fontDiff1);
//    [labelLeft.titleLabel setFont:[UIFont systemFontOfSize:newFont]];
    
    [menuView.labelLeft.titleLabel setFont:[UIFont systemFontOfSize:newFont]];
    
    CGFloat fontDiff2 = (menuScrollView.contentOffset.x - BOUND_WIDTH)*FONTDIFF_SPEED;
    newFont = fmaxf(MENU_FONT_MIN, MENU_FONT_MAX - fabsf(fontDiff2));
//    [labelCenter.titleLabel setFont:[UIFont systemFontOfSize:newFont]];
    [menuView.labelCenter.titleLabel setFont:[UIFont systemFontOfSize:newFont]];
    
    CGFloat fontDiff3 = (menuScrollView.contentOffset.x - 2*BOUND_WIDTH)*FONTDIFF_SPEED;
    newFont = fmaxf(MENU_FONT_MIN, MENU_FONT_MAX - fabsf(fontDiff3));
//    [labelRight.titleLabel setFont:[UIFont systemFontOfSize:newFont]];
    [menuView.labelRight.titleLabel setFont:[UIFont systemFontOfSize:newFont]];
    
    // Setting underlines transparency
    CGFloat transparency1 = menuScrollView.contentOffset.x/BOUND_WIDTH;
//    underlineLeft.alpha = 1 - transparency1;
    menuView.underlineLeft.alpha = 1 - transparency1;
    
    CGFloat transparency2 = (menuScrollView.contentOffset.x - BOUND_WIDTH)/BOUND_WIDTH;
//    underlineCenter.alpha = 1 - fabsf(transparency2);
    menuView.underlineCenter.alpha = 1 - fabs(transparency2);
    
    CGFloat transparency3 = (menuScrollView.contentOffset.x - 2*BOUND_WIDTH)/BOUND_WIDTH;
//    underlineRight.alpha = 1 - fabsf(transparency3);
    menuView.underlineRight.alpha = 1 - fabs(transparency3);
    

}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    
    // Setting headerView offset
    CGFloat offsetX = (scrollView.contentOffset.x - BOUND_WIDTH)*XOFFSET_SPEED;
//    [headerView setFrame:CGRectMake((BOUND_WIDTH - 3*MENU_WIDTH)/2 - offsetX, 90, 3*MENU_WIDTH, MENU_HEIGHT)];
    [menuView setFrame:CGRectMake((BOUND_WIDTH - 3*MENU_WIDTH)/2 - offsetX, 90, 3*MENU_WIDTH, MENU_HEIGHT)];
    
    // Setting label font sizes
    CGFloat fontDiff1 = (scrollView.contentOffset.x)*FONTDIFF_SPEED;
    CGFloat newFont = fmaxf(MENU_FONT_MIN, MENU_FONT_MAX - fontDiff1);
//    [labelLeft.titleLabel setFont:[UIFont systemFontOfSize:newFont]];
    [menuView.labelLeft.titleLabel setFont:[UIFont systemFontOfSize:newFont]];

    CGFloat fontDiff2 = (scrollView.contentOffset.x - BOUND_WIDTH)*FONTDIFF_SPEED;
    newFont = fmaxf(MENU_FONT_MIN, MENU_FONT_MAX - fabsf(fontDiff2));
//    [labelCenter.titleLabel setFont:[UIFont systemFontOfSize:newFont]];
    [menuView.labelCenter.titleLabel setFont:[UIFont systemFontOfSize:newFont]];

    CGFloat fontDiff3 = (scrollView.contentOffset.x - 2*BOUND_WIDTH)*FONTDIFF_SPEED;
    newFont = fmaxf(MENU_FONT_MIN, MENU_FONT_MAX - fabsf(fontDiff3));
//    [labelRight.titleLabel setFont:[UIFont systemFontOfSize:newFont]];
    [menuView.labelRight.titleLabel setFont:[UIFont systemFontOfSize:newFont]];

    // Setting underlines transparency
    CGFloat transparency1 = scrollView.contentOffset.x/BOUND_WIDTH;
//    underlineLeft.alpha = 1 - transparency1;
    menuView.underlineLeft.alpha = 1 - transparency1;

    CGFloat transparency2 = (scrollView.contentOffset.x - BOUND_WIDTH)/BOUND_WIDTH;
//    underlineCenter.alpha = 1 - fabsf(transparency2);
    menuView.underlineCenter.alpha = 1 - fabs(transparency2);

    
    CGFloat transparency3 = (scrollView.contentOffset.x - 2*BOUND_WIDTH)/BOUND_WIDTH;
//    underlineRight.alpha = 1 - fabsf(transparency3);
    menuView.underlineRight.alpha = 1 - fabs(transparency3);

}

- (void)menuTapped: (UIButton *)thisButton {
    if ([thisButton.titleLabel.text isEqualToString:@"Quotes"]) {
        [menuScrollView scrollRectToVisible:CGRectMake(0, 0, BOUND_WIDTH, BOUND_HEIGHT) animated:YES];
    }
    else if ([thisButton.titleLabel.text isEqualToString:@"Collections"]) {
        [menuScrollView scrollRectToVisible:CGRectMake(BOUND_WIDTH, 0, BOUND_WIDTH, BOUND_HEIGHT) animated:YES];
    }
    else if ([thisButton.titleLabel.text isEqualToString:@"Quoters"]) {
        [menuScrollView scrollRectToVisible:CGRectMake(2*BOUND_WIDTH, 0, BOUND_WIDTH, BOUND_HEIGHT) animated:YES];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
