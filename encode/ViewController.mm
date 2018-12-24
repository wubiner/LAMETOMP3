//
//  ViewController.m
//  encode
//
//  Created by Apple on 2018/12/21.
//  Copyright © 2018年 Apple. All rights reserved.
//

#import "ViewController.h"
#import "mp3Encoder.hpp"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Do any additional setup after loading the view, typically from a nib.
}


- (IBAction)startEncode:(id)sender {
    NSLog(@"start encoder");
    mp3Encoder * mp3 = new mp3Encoder();
   // NSString * path = [[[NSBundle mainBundle] bundlePath] stringByAppendingPathComponent:@"vocal.pcm"];
   NSString* wavPath = [[NSBundle mainBundle] pathForResource:@"vocal" ofType:@"pcm"];
    NSString* mp3Path = [[NSString alloc] initWithFormat:@"%@/Documents/wav_to_mp3.mp3",NSHomeDirectory()];
    
  //  NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,
    //                                                      NSUserDomainMask, YES);
   // NSString *documentsDirectory = [paths objectAtIndex:0];
   // [documentsDirectory stringByAppendingPathComponent:@"vocal.mp3"];
    NSLog(@"pcm路径：%@,mp3路径为：%@",wavPath,mp3Path);
    int res_init = mp3->init([wavPath UTF8String],[mp3Path UTF8String], 44100, 2, 8);
    if(res_init == -1) {
        NSLog(@"初始化失败！");
        return ;
    }
    mp3->encoder();
    mp3->destory();
}
@end
