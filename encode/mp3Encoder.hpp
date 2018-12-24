//
//  mp3Encoder.hpp
//  encode
//
//  Created by Apple on 2018/12/21.
//  Copyright © 2018年 Apple. All rights reserved.
//

#ifndef mp3Encoder_hpp
#define mp3Encoder_hpp

#include <stdio.h>
#include "lame.h"
class mp3Encoder{
private:
    FILE* pcmFile;
    FILE* mp3File;
    lame_t lameClient;
public:
    mp3Encoder();
    ~mp3Encoder();
    int init(const char* pcmFilePath,const char* mp3FilePath,int sampleRate,int channels,int bitRate);
    void encoder();
    void destory();
};
#endif /* mp3Encoder_hpp */
