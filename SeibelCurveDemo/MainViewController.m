//
//  MainViewController.m
//  SeibelCurveDemo
//
//  Created by 赵进雄 on 14-7-7.
//  Copyright (c) 2014年 zhaojinxiong. All rights reserved.
//

#import "MainViewController.h"
#import "SeibelCurve.h"

@interface MainViewController ()

@end

@implementation MainViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)loadView
{
    [super loadView];
    
    UIScrollView *scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 76,  self.view.frame.size.width, 100)];
    scrollView.pagingEnabled = YES;
    scrollView.showsHorizontalScrollIndicator = NO;
    scrollView.backgroundColor = [UIColor yellowColor];
    [self.view addSubview:scrollView];
    
    [scrollView setContentSize:CGSizeMake(self.view.frame.size.width*2, 0)];
    
    SeibelCurve *seibel = [[SeibelCurve alloc]initWithFrame:CGRectMake(0, -62, scrollView.frame.size.width*2, 100)];
    seibel.dataPointArray = [[NSMutableArray alloc]initWithObjects:@"-20",@"-25",@"-28",@"-30",@"-40",@"40",@"-20",@"-25",@"-28",@"-30",@"-40",@"40",  nil];
    seibel.backgroundColor = [UIColor greenColor];
    [scrollView addSubview:seibel];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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
