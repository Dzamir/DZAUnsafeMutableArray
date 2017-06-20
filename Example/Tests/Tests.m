//
//  DZAUnsafeMutableArrayTests.m
//  DZAUnsafeMutableArrayTests
//
//  Created by Davide Di Stefano on 06/20/2017.
//  Copyright (c) 2017 Davide Di Stefano. All rights reserved.
//

@import XCTest;
@import DZAUnsafeMutableArray;

@interface Tests : XCTestCase

@end

@implementation Tests

- (void)setUp
{
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown
{
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample
{
    DZAUnsafeMutableArray * unsafeArray = [[DZAUnsafeMutableArray alloc] initWithCapacity:10 elementSize:sizeof(int)];
    XCTAssertEqual(unsafeArray.capacity, 10);
    XCTAssertEqual(unsafeArray.length, 0);
    [unsafeArray addElement:3];
    XCTAssertEqual(unsafeArray.length, 1);
    XCTAssertEqual(unsafeArray.unsafePointer[0], 3);
}

@end

