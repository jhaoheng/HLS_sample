//
//  ViewController.h
//  HLS_sample
//
//  Created by max on 2016/5/10.
//  Copyright © 2016年 max hu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MediaPlayer/MediaPlayer.h>

#import <AVKit/AVKit.h>
#import <AVFoundation/AVFoundation.h>

@interface ViewController : UIViewController<AVPlayerViewControllerDelegate>{
    AVPlayerViewController *avPlayerController;
    NSURL *stream;
    
    // ios 8
    MPMoviePlayerController *player;
}




@end

