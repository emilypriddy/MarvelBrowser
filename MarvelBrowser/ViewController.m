//
//  ViewController.m
//  MarvelBrowser
//
//  Created by Jon Reid on 11/19/14.
//  Copyright (c) 2014 Jon Reid. All rights reserved.
//

#import "ViewController.h"
#import "MarvelKeys.m"
#import <CommonCrypto/CommonDigest.h>

@interface ViewController () <NSURLSessionDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    // concatenate keys per Marvel API documentation
    NSString *timeStamp = @"2"; // Hard-coded for spike
    NSString *keys = [NSString stringWithFormat:@"%@%@%@", timeStamp, MarvelPrivateKey, MarvelPublicKey];
    char const *keysString = [keys UTF8String];

    // confirm manually
    NSLog(@"%s", keysString);

    // create md5 hash:
    unsigned char digest[CC_MD5_DIGEST_LENGTH];
    CC_MD5(keysString, strlen(keysString), digest);

    NSMutableString *hash = [NSMutableString stringWithCapacity:CC_MD5_DIGEST_LENGTH * 2];
    for (NSUInteger i = 0; i < CC_MD5_DIGEST_LENGTH; ++i)
        [hash appendFormat:@"%02x", digest[i]];
    NSLog(@"%@", hash);

    // manually confirm URL string:
    NSString *urlString = [NSString stringWithFormat:@"http://gateway.marvel.com/v1/public/characters?nameStartsWith=B&ts=%@&apikey=%@&hash=%@", timeStamp, MarvelPublicKey, hash];
    NSLog(@"%@", urlString);

    // create data task:
    NSURLSessionConfiguration *sessionConfig = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLSession *session = [NSURLSession sessionWithConfiguration:sessionConfig
                                                          delegate:self
                                                     delegateQueue:nil];
    NSURLSessionDataTask *dataTask = [session dataTaskWithURL:[NSURL URLWithString:urlString]
                                            completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
                                                NSLog(@"Data: %@", data);
                                                NSLog(@"Response: %@", response);
                                                NSLog(@"Error: %@", error);
                                            }];
    [dataTask resume];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
