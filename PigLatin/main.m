//
//  main.m
//  PigLatin
//
//  Created by Noor Alhoussari on 2017-06-02.
//  Copyright © 2017 Noor Alhoussari. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NSString+Pig.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {

        NSString *sentence = @"pig latin language";
        
        NSLog(@"%@", [sentence stringByPigLatinization]);
        

    }
    return 0;
}
