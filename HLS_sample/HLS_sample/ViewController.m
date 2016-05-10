//
//  ViewController.m
//  HLS_sample
//
//  Created by max on 2016/5/10.
//  Copyright © 2016年 max hu. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    stream = [NSURL URLWithString:@"https://huder.link/max/test/HLS/test.m3u8"];
    
    float width = 200;
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake((self.view.frame.size.width-width)/2, 200, width, 100);
    [btn setTitle:@"Video Go!" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor brownColor] forState:UIControlStateNormal];
    btn.layer.borderWidth = 1;
    btn.layer.borderColor = [UIColor brownColor].CGColor;
    btn.layer.cornerRadius = 10;
    if ([[UIDevice currentDevice].systemVersion floatValue] >= 9.0) {
        [btn addTarget:self action:@selector(ios9) forControlEvents:UIControlEventTouchUpInside];
    }else{
        [btn addTarget:self action:@selector(ios8) forControlEvents:UIControlEventTouchUpInside];
    }
    [self.view addSubview:btn];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)ios9{
    
    // AVPlayerViewcontroller繼承自UIViewController，一般適用於點擊一個視頻縮略圖，modal出一個新的界面來進行播放的情況。
    
    avPlayerController = [[AVPlayerViewController alloc] init];
    avPlayerController.showsPlaybackControls = YES;
    avPlayerController.delegate = self;
    
    avPlayerController.player = [[AVPlayer alloc]initWithURL:stream];
    [self presentViewController:avPlayerController animated:YES completion:nil];
}

- (void)ios8{
    
    player = [[MPMoviePlayerController alloc] initWithContentURL:stream];
    
    UIView *playerView = player.view;
    
    [playerView setTranslatesAutoresizingMaskIntoConstraints:NO];
    
    [self.view addSubview:playerView];
    
    [self.view addConstraints:[NSLayoutConstraint
                               constraintsWithVisualFormat:@"H:|-0-[playerView]-0-|"
                               options:NSLayoutFormatDirectionLeadingToTrailing
                               metrics:nil
                               views:NSDictionaryOfVariableBindings(playerView)]];
    
    [self.view addConstraints:[NSLayoutConstraint
                               constraintsWithVisualFormat:@"V:|-0-[playerView]-0-|"
                               options:NSLayoutFormatDirectionLeadingToTrailing
                               metrics:nil
                               views:NSDictionaryOfVariableBindings(playerView)]];
    [player play];

}

@end
