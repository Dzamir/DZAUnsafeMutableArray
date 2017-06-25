//
//  DZAUnsafeMutableArrayTests.m
//  DZAUnsafeMutableArrayTests
//
//  Created by Davide Di Stefano on 06/20/2017.
//  Copyright (c) 2017 Davide Di Stefano. All rights reserved.
//

@import XCTest;
@import DZAUnsafeMutableArray;
@import Accelerate;

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
    DZAUnsafeMutableArray * unsafeArray = [[DZAUnsafeMutableArray alloc] initWithCapacity:10];
    XCTAssertEqual(unsafeArray.capacity, 10);
    XCTAssertEqual(unsafeArray.length, 0);
    [unsafeArray addInt:3];
    XCTAssertEqual(unsafeArray.length, 1);
    XCTAssertEqual(unsafeArray.intUnsafePointer[0], 3);
    XCTAssertEqual([unsafeArray intAtIndex:0], 3);
}

- (void)testGrow
{
    DZAUnsafeMutableArray * unsafeArray = [[DZAUnsafeMutableArray alloc] initWithCapacity:1];
    XCTAssertEqual(unsafeArray.capacity, 1);
    XCTAssertEqual(unsafeArray.length, 0);
    [unsafeArray addInt:3];
    XCTAssertEqual(unsafeArray.length, 1);
    XCTAssertEqual(unsafeArray.intUnsafePointer[0], 3);
    XCTAssertEqual([unsafeArray intAtIndex:0], 3);
    [unsafeArray addInt:6];
    XCTAssertEqual(unsafeArray.length, 2);
    XCTAssertEqual(unsafeArray.intUnsafePointer[1], 6);
    XCTAssertEqual([unsafeArray intAtIndex:1], 6);
    [unsafeArray addInt:10];
    [unsafeArray addInt:20];
    [unsafeArray addInt:30];
    [unsafeArray addInt:40];
    [unsafeArray addInt:50];
    [unsafeArray addInt:60];
    [unsafeArray addInt:70];
    XCTAssertEqual(unsafeArray.length, 9);
    XCTAssertEqual(unsafeArray.intUnsafePointer[2], 10);
    XCTAssertEqual([unsafeArray intAtIndex:2], 10);
    XCTAssertEqual(unsafeArray.intUnsafePointer[3], 20);
    XCTAssertEqual([unsafeArray intAtIndex:3], 20);
    XCTAssertEqual(unsafeArray.intUnsafePointer[4], 30);
    XCTAssertEqual([unsafeArray intAtIndex:4], 30);
    XCTAssertEqual(unsafeArray.intUnsafePointer[5], 40);
    XCTAssertEqual([unsafeArray intAtIndex:5], 40);
    XCTAssertEqual(unsafeArray.intUnsafePointer[6], 50);
    XCTAssertEqual([unsafeArray intAtIndex:6], 50);
    XCTAssertEqual(unsafeArray.intUnsafePointer[7], 60);
    XCTAssertEqual([unsafeArray intAtIndex:7], 60);
    XCTAssertEqual(unsafeArray.intUnsafePointer[8], 70);
    XCTAssertEqual([unsafeArray intAtIndex:8], 70);
}

- (void)testUltraGrow
{
    DZAUnsafeMutableArray * unsafeArray = [[DZAUnsafeMutableArray alloc] initWithCapacity:1];
    for (int i = 0; i < 2000000; i++)
    {
        [unsafeArray addInt:i];
    }
    for (int i = 0; i < 2000000; i++)
    {
        XCTAssertEqual(unsafeArray.intUnsafePointer[i], i);
        XCTAssertEqual([unsafeArray intAtIndex:i], i);
    }
}

-(void) testAccellerate
{
    DZAUnsafeMutableArray * unsafeArray = [[DZAUnsafeMutableArray alloc] initWithCapacity:2000000];
    DZAUnsafeMutableArray * outputArray1 = [[DZAUnsafeMutableArray alloc] initWithCapacity:2000000];
    for (int i = 0; i < 2000000; i++)
    {
        [unsafeArray addInt:i];
    }
    int scalar = 3;
    vDSP_vsaddi(unsafeArray.intUnsafePointer, 1, &scalar, outputArray1.intUnsafePointer, 1, unsafeArray.length);

    for (int i = 0; i < outputArray1.length; i++)
    {
        int value = outputArray1.intUnsafePointer[i];
        XCTAssertEqual(value, i + 3);
    }

    // realloc test
    DZAUnsafeMutableArray * outputArray2 = [[DZAUnsafeMutableArray alloc] initWithCapacity:4000000];
    for (int i = 2000000; i < 4000000; i++)
    {
        [unsafeArray addInt:i];
    }
    vDSP_vsaddi(unsafeArray.intUnsafePointer, 1, &scalar, outputArray2.intUnsafePointer, 1, unsafeArray.length);
    for (int i = 0; i < outputArray1.length; i++)
    {
        int value = outputArray1.intUnsafePointer[i];
        XCTAssertEqual(value, i + 3);
    }
}

-(void) testAccellerateSameOutput
{
    DZAUnsafeMutableArray * unsafeArray = [[DZAUnsafeMutableArray alloc] initWithCapacity:2000000];
    for (int i = 0; i < 2000000; i++)
    {
        [unsafeArray addInt:i];
    }
    int scalar = 3;
    vDSP_vsaddi(unsafeArray.intUnsafePointer, 1, &scalar, unsafeArray.intUnsafePointer, 1, unsafeArray.length);

    for (int i = 0; i < unsafeArray.length; i++)
    {
        int value = unsafeArray.intUnsafePointer[i];
        XCTAssertEqual(value, i + 3);
    }
}

@end

