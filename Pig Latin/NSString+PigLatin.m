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
    
    for (NSString *i in words){
        
        NSUInteger len = [i length];
        unichar buffer[len+1];
        
        [self getCharacters:buffer range:NSMakeRange(0, len)];
        NSMutableString *mutableString = [i mutableCopy];
        
        NSMutableString *consonantString = [NSMutableString stringWithFormat:@"%c", buffer[0]];
        NSLog(@"consonantString %@", consonantString);
        
        NSInteger place = 0;
        for(NSInteger i = 1; i < len; i++) {
            
            if (buffer[i] == 'a' | buffer[i] == 'e' | buffer[i] == 'i' | buffer[i] == 'o' | buffer[i] == 'u'){
                
                [consonantString appendString:[NSString stringWithFormat:@"%c", buffer[i]]];
                place = i;
                i = len; // end loop
            }
            
        }
        
        [mutableString appendString:[NSString stringWithFormat:@"%@ay", consonantString]];
        NSString *appendedWord = [mutableString substringFromIndex:place];
        [appendedString appendFormat:appendedWord];
    }
    
    
    
    return appendedString;
}

@end
