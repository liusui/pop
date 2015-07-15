//
//  ImageViewController.m
//  pop
//
//  Created by amssy on 15/7/15.
//  Copyright (c) 2015年 liusui. All rights reserved.
//

#import "ImageViewController.h"
#import <pop/POP.h>

@interface ImageViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *headImgaeView;

@end

@implementation ImageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.headImgaeView.userInteractionEnabled=YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)changeSize:(UITapGestureRecognizer *)sender {
    POPSpringAnimation *animation=[POPSpringAnimation animationWithPropertyNamed:kPOPLayerSize];
    if (self.headImgaeView.frame.size.width==100) {
        animation.toValue=[NSValue valueWithCGSize:CGSizeMake(300, 300)];
    }else{
        animation.toValue=[NSValue valueWithCGSize:CGSizeMake(100, 100)];
    }
    animation.springBounciness=20.0;
    animation.springSpeed=20.0;
    [self.headImgaeView.layer pop_addAnimation:animation forKey:@"animation"];

}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
