//
//  QCOMarvelAuthenticationTests.m
//  MarvelBrowser
//
//  Created by Emily Priddy on 6/6/16.
//  Copyright © 2016 Jon Reid. All rights reserved.
//

#import "QCOMarvelAuthentication.h"

#import <XCTest/XCTest.h>

#define HC_SHORTHAND
#import <OCHamcrestIOS/OCHamcrestIOS.h>

@interface QCOMarvelAuthenticationTests : XCTestCase

@end

@implementation QCOMarvelAuthenticationTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testTimestamp_ShouldChangeEveryCall
{
    NSString *ts1 = [QCOMarvelAuthentication timestamp];
    NSString *ts2 = [QCOMarvelAuthentication timestamp];

    assertThat(ts1, isNot(equalTo(ts2)));
}

- (void)testPublicKey_ShouldHave32Characters
{
    NSString *key = [QCOMarvelAuthentication publicKey];

    assertThat(@(key.length), is(@32));
}

@end
