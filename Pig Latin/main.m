//
//  main.m
//  Pig Latin
//
//  Created by Colin on 2018-04-14.
//  Copyright © 2018 Colin Russell. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NSString+PigLatin.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        NSLog(@"> ");
        char str[100];
        fgets (str, 100, stdin);
        
        NSString *inputString = [[NSString alloc] initWithUTF8String:str];
        inputString = [inputString stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];

        NSLog(@"input: %@", inputString);
        NSLog(@"pig latin: %@", [inputString stringByPigLatinization]);
        
        
    }
    return 0;
}
