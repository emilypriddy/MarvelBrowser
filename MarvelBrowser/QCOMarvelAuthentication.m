//
//  QCOMarvelAuthentication.m
//  MarvelBrowser
//
//  Created by Emily Priddy on 6/6/16.
//  Copyright © 2016 Jon Reid. All rights reserved.
//

#import "QCOMarvelAuthentication.h"

@implementation QCOMarvelAuthentication

+ (NSString *)timestamp
{
    return @([NSDate date].timeIntervalSinceReferenceDate).stringValue;
}

@end
