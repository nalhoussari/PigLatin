//
//  NSString+Pig.m
//  PigLatin
//
//  Created by Noor Alhoussari on 2017-06-02.
//  Copyright © 2017 Noor Alhoussari. All rights reserved.
//

#import "NSString+Pig.h"

@implementation NSString (Pig)

-(NSString *)stringByPigLatinization{
    
    NSArray *words = [self componentsSeparatedByString:@" "];
    
    NSMutableArray *latinizedWords = [NSMutableArray array];
    
    for (NSString *word in words){
        
        NSCharacterSet *characterSet = [NSCharacterSet characterSetWithCharactersInString:@"aeiuo"];
        
        NSRange range = [word rangeOfCharacterFromSet:characterSet options:NSCaseInsensitiveSearch];
        if(range.location == NSNotFound){
            NSString *pigged = [word stringByAppendingString:@"ay"];
            [latinizedWords addObject: pigged];
        
        } else {
            NSMutableArray *consonants = [NSMutableArray array];
            
            for (int i=0; i < word.length; i++){
                NSString *currentLetter = [NSString stringWithFormat: @"%c", [word characterAtIndex:i]];
                
                NSRange range = [currentLetter rangeOfCharacterFromSet:characterSet options:NSCaseInsensitiveSearch];
                if(range.location != NSNotFound){
                    //Vowl
                    //Remove consonants from the begining
                    NSString *removedConsonants = [word substringFromIndex:i];
                    //add them to the end
                    NSString *consonantString = [consonants componentsJoinedByString:@""];
                    NSString *addToEnd = [removedConsonants stringByAppendingString:consonantString];
                    //Add ay
                    NSString *pigged = [addToEnd stringByAppendingString:@"ay"];
                    [latinizedWords addObject:pigged];
                    break;
                } else {
                    //consonant
                    [consonants addObject:currentLetter];
                }
            }
        }
    }
    return [latinizedWords componentsJoinedByString:@" "];
}

@end
