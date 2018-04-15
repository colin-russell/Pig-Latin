//
//  NSString+PigLatin.m
//  Pig Latin
//
//  Created by Colin on 2018-04-14.
//  Copyright © 2018 Colin Russell. All rights reserved.
//

#import "NSString+PigLatin.h"

@implementation NSString (PigLatin)

- (NSString *)stringByPigLatinization {
    
    NSArray *words = [self componentsSeparatedByString:@" "];
    NSMutableString *appendedString = [NSMutableString new];
    
    for (NSString *wordPlace in words){
        
        NSUInteger len = [wordPlace length];
        unichar buffer[len+1];
        
        [wordPlace getCharacters:buffer range:NSMakeRange(0, len)];
        NSMutableString *mutableString = [wordPlace mutableCopy];
        
        NSMutableString *consonantString = [NSMutableString new];
        
        NSInteger i;
        for(i = 0; i < len; i++) {
            
            if (buffer[i] == 'a' | buffer[i] == 'e' | buffer[i] == 'i' | buffer[i] == 'o' | buffer[i] == 'u')
                break; // end loop if it reaches a vowel
            
            [consonantString appendString:[NSString stringWithFormat:@"%c", buffer[i]]];
        }
  
        [mutableString appendString:[NSString stringWithFormat:@"%@ay", consonantString]];
        NSString *appendedWord = [mutableString substringFromIndex:i];
        [appendedString appendFormat:@"%@ ", appendedWord];
    }
    
    return appendedString;
}

@end
