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
        
        NSMutableString *consonantString = [NSMutableString new];//[NSMutableString stringWithFormat:@"%c", buffer[0]];
        
        NSInteger place = 0;
        for(NSInteger i = 0; i < len; i++) {

            
            if (buffer[i] == 'a' | buffer[i] == 'e' | buffer[i] == 'i' | buffer[i] == 'o' | buffer[i] == 'u'){
                
                NSLog(@"buffer: %c", buffer[i]);
                if (i == 0)
                    [consonantString appendString:@"|"];
                
                //place = i+1;
                place = i;
                //i = len; // end loop
                break; // end loop
            }
            
            [consonantString appendString:[NSString stringWithFormat:@"%c", buffer[i]]];

        }
        
        //if (place == 0)
          //  place ++;
        NSLog(@"consonantString %@", consonantString);

        [mutableString appendString:[NSString stringWithFormat:@"%@ay", consonantString]];
        NSString *appendedWord = [mutableString substringFromIndex:place];
        [appendedString appendFormat:@"%@ ", appendedWord];
    }
    
    
    
    return appendedString;
}

@end
