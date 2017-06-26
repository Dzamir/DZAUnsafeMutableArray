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

- (void)testBasicInt
{
    DZAUnsafeMutableArray * unsafeArray = [[DZAUnsafeMutableArray alloc] initWithCapacity:10];
    XCTAssertEqual(unsafeArray.capacity, 10);
    XCTAssertEqual(unsafeArray.count, 0);
    [unsafeArray addInt:3];
    XCTAssertEqual(unsafeArray.count, 1);
    XCTAssertEqual(unsafeArray.intUnsafePointer[0], 3);
    XCTAssertEqual([unsafeArray intAtIndex:0], 3);
}

- (void)testBasicBool
{
    DZAUnsafeMutableArray * unsafeArray = [[DZAUnsafeMutableArray alloc] initWithCapacity:10 elementType:TypeBool];
    XCTAssertEqual(unsafeArray.capacity, 10);
    XCTAssertEqual(unsafeArray.count, 0);
    [unsafeArray addBool:YES];
    XCTAssertEqual(unsafeArray.count, 1);
    XCTAssertEqual(unsafeArray.boolUnsafePointer[0], YES);
    XCTAssertEqual([unsafeArray boolAtIndex:0], YES);
}

- (void)testBasicChar
{
    DZAUnsafeMutableArray * unsafeArray = [[DZAUnsafeMutableArray alloc] initWithCapacity:10 elementType:TypeChar];
    XCTAssertEqual(unsafeArray.capacity, 10);
    XCTAssertEqual(unsafeArray.count, 0);
    [unsafeArray addChar:'c'];
    XCTAssertEqual(unsafeArray.count, 1);
    XCTAssertEqual(unsafeArray.charUnsafePointer[0], 'c');
    XCTAssertEqual([unsafeArray charAtIndex:0], 'c');
}

- (void)testBasicUnsignedChar
{
    DZAUnsafeMutableArray * unsafeArray = [[DZAUnsafeMutableArray alloc] initWithCapacity:10 elementType:TypeUnsignedChar];
    XCTAssertEqual(unsafeArray.capacity, 10);
    XCTAssertEqual(unsafeArray.count, 0);
    [unsafeArray addUnsignedChar:(unsigned char)'c'];
    XCTAssertEqual(unsafeArray.count, 1);
    XCTAssertEqual(unsafeArray.unsignedCharUnsafePointer[0], 'c');
    XCTAssertEqual([unsafeArray unsignedCharAtIndex:0], 'c');
}

- (void)testBasicUnsignedInt
{
    DZAUnsafeMutableArray * unsafeArray = [[DZAUnsafeMutableArray alloc] initWithCapacity:10 elementType:TypeUnsignedInt];
    XCTAssertEqual(unsafeArray.capacity, 10);
    XCTAssertEqual(unsafeArray.count, 0);
    [unsafeArray addUnsignedInt:(unsigned int)3];
    XCTAssertEqual(unsafeArray.count, 1);
    XCTAssertEqual(unsafeArray.unsignedIntUnsafePointer[0], 3);
    XCTAssertEqual([unsafeArray unsignedIntAtIndex:0], 3);
}

- (void)testBasicShort
{
    DZAUnsafeMutableArray * unsafeArray = [[DZAUnsafeMutableArray alloc] initWithCapacity:10 elementType:TypeShort];
    XCTAssertEqual(unsafeArray.capacity, 10);
    XCTAssertEqual(unsafeArray.count, 0);
    [unsafeArray addShort:(short)3];
    XCTAssertEqual(unsafeArray.count, 1);
    XCTAssertEqual(unsafeArray.shortUnsafePointer[0], 3);
    XCTAssertEqual([unsafeArray shortAtIndex:0], 3);
}

- (void)testBasicUnsignedShort
{
    DZAUnsafeMutableArray * unsafeArray = [[DZAUnsafeMutableArray alloc] initWithCapacity:10 elementType:TypeUnsignedShort];
    XCTAssertEqual(unsafeArray.capacity, 10);
    XCTAssertEqual(unsafeArray.count, 0);
    [unsafeArray addUnsignedShort:(unsigned short)3];
    XCTAssertEqual(unsafeArray.count, 1);
    XCTAssertEqual(unsafeArray.unsignedShortUnsafePointer[0], 3);
    XCTAssertEqual([unsafeArray unsignedShortAtIndex:0], 3);
}

- (void)testBasicLong
{
    DZAUnsafeMutableArray * unsafeArray = [[DZAUnsafeMutableArray alloc] initWithCapacity:10 elementType:TypeLong];
    XCTAssertEqual(unsafeArray.capacity, 10);
    XCTAssertEqual(unsafeArray.count, 0);
    [unsafeArray addLong:(long)324242];
    XCTAssertEqual(unsafeArray.count, 1);
    XCTAssertEqual(unsafeArray.longUnsafePointer[0], 324242);
    XCTAssertEqual([unsafeArray longAtIndex:0], 324242);
}

- (void)testBasicUnsignedLong
{
    DZAUnsafeMutableArray * unsafeArray = [[DZAUnsafeMutableArray alloc] initWithCapacity:10 elementType:TypeUnsignedLong];
    XCTAssertEqual(unsafeArray.capacity, 10);
    XCTAssertEqual(unsafeArray.count, 0);
    [unsafeArray addUnsignedLong:(unsigned long)324242];
    XCTAssertEqual(unsafeArray.count, 1);
    XCTAssertEqual(unsafeArray.unsignedLongUnsafePointer[0], 324242);
    XCTAssertEqual([unsafeArray unsignedLongAtIndex:0], 324242);
}

- (void)testBasicDouble
{
    DZAUnsafeMutableArray * unsafeArray = [[DZAUnsafeMutableArray alloc] initWithCapacity:10 elementType:TypeDouble];
    XCTAssertEqual(unsafeArray.capacity, 10);
    XCTAssertEqual(unsafeArray.count, 0);
    [unsafeArray addDouble:(double)M_PI];
    XCTAssertEqual(unsafeArray.count, 1);
    XCTAssertEqual(unsafeArray.doubleUnsafePointer[0], M_PI);
    XCTAssertEqual([unsafeArray doubleAtIndex:0], M_PI);
}

- (void)testBasicFloat
{
    DZAUnsafeMutableArray * unsafeArray = [[DZAUnsafeMutableArray alloc] initWithCapacity:10 elementType:TypeFloat];
    XCTAssertEqual(unsafeArray.capacity, 10);
    XCTAssertEqual(unsafeArray.count, 0);
    [unsafeArray addFloat:(float)M_PI];
    XCTAssertEqual(unsafeArray.count, 1);
    XCTAssertEqual(unsafeArray.floatUnsafePointer[0], (float)M_PI);
    XCTAssertEqual([unsafeArray floatAtIndex:0], (float)M_PI);
}

- (void)testGrow
{
    DZAUnsafeMutableArray * unsafeArray = [[DZAUnsafeMutableArray alloc] initWithCapacity:1];
    XCTAssertEqual(unsafeArray.capacity, 1);
    XCTAssertEqual(unsafeArray.count, 0);
    [unsafeArray addInt:3];
    XCTAssertEqual(unsafeArray.count, 1);
    XCTAssertEqual(unsafeArray.intUnsafePointer[0], 3);
    XCTAssertEqual([unsafeArray intAtIndex:0], 3);
    [unsafeArray addInt:6];
    XCTAssertEqual(unsafeArray.count, 2);
    XCTAssertEqual(unsafeArray.intUnsafePointer[1], 6);
    XCTAssertEqual([unsafeArray intAtIndex:1], 6);
    [unsafeArray addInt:10];
    [unsafeArray addInt:20];
    [unsafeArray addInt:30];
    [unsafeArray addInt:40];
    [unsafeArray addInt:50];
    [unsafeArray addInt:60];
    [unsafeArray addInt:70];
    XCTAssertEqual(unsafeArray.count, 9);
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
    vDSP_vsaddi(unsafeArray.intUnsafePointer, 1, &scalar, outputArray1.intUnsafePointer, 1, unsafeArray.count);

    for (int i = 0; i < outputArray1.count; i++)
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
    vDSP_vsaddi(unsafeArray.intUnsafePointer, 1, &scalar, outputArray2.intUnsafePointer, 1, unsafeArray.count);
    for (int i = 0; i < outputArray1.count; i++)
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
    vDSP_vsaddi(unsafeArray.intUnsafePointer, 1, &scalar, unsafeArray.intUnsafePointer, 1, unsafeArray.count);

    for (int i = 0; i < unsafeArray.count; i++)
    {
        int value = unsafeArray.intUnsafePointer[i];
        XCTAssertEqual(value, i + 3);
    }
}

-(void) testRemove
{
    DZAUnsafeMutableArray * unsafeArray = [[DZAUnsafeMutableArray alloc] initWithCapacity:20];
    for (int i = 0; i < 10; i++)
    {
        [unsafeArray addInt:i];
    }
    XCTAssertEqual(unsafeArray.count, 10);
    for (int i = 0; i < unsafeArray.count; i++)
    {
        XCTAssertEqual([unsafeArray intAtIndex:i], i);
    }
    [unsafeArray removeLastElement];
    XCTAssertEqual(unsafeArray.count, 9);
    for (int i = 0; i < unsafeArray.count; i++)
    {
        XCTAssertEqual([unsafeArray intAtIndex:i], i);
    }
    XCTAssertEqual(unsafeArray.intUnsafePointer[9], 0);
    XCTAssertEqual(unsafeArray.intUnsafePointer[8], 8);
    XCTAssertEqual(unsafeArray.intUnsafePointer[7], 7);
    [unsafeArray removeLastElement];
    XCTAssertEqual(unsafeArray.intUnsafePointer[9], 0);
    XCTAssertEqual(unsafeArray.intUnsafePointer[8], 0);
    XCTAssertEqual(unsafeArray.intUnsafePointer[7], 7);
}

-(void) testShrink
{
    DZAUnsafeMutableArray * unsafeArray = [[DZAUnsafeMutableArray alloc] initWithCapacity:10];
    for (int i = 0; i < 10; i++)
    {
        [unsafeArray addInt:i];
    }
    XCTAssertEqual(unsafeArray.count, 10);
    for (int i = 0; i < unsafeArray.count; i++)
    {
        XCTAssertEqual([unsafeArray intAtIndex:i], i);
    }
    [unsafeArray shrinkToSize:5];
    XCTAssertEqual(unsafeArray.count, 5);
    for (int i = 0; i < unsafeArray.count; i++)
    {
        XCTAssertEqual([unsafeArray intAtIndex:i], i);
    }
    XCTAssertEqual(unsafeArray.intUnsafePointer[9], 0);
    XCTAssertEqual(unsafeArray.intUnsafePointer[8], 0);
    XCTAssertEqual(unsafeArray.intUnsafePointer[7], 0);
    XCTAssertEqual(unsafeArray.intUnsafePointer[6], 0);
    XCTAssertEqual(unsafeArray.intUnsafePointer[5], 0);
    XCTAssertEqual(unsafeArray.intUnsafePointer[4], 4);
}

-(void) testWrongTypeBool
{
    DZAUnsafeMutableArray * unsafeArray = [[DZAUnsafeMutableArray alloc] initWithCapacity:10 elementType:TypeBool];
    XCTAssertThrows([unsafeArray addFloat:3.0f]);
    XCTAssertThrows([unsafeArray addInt:3]);
    XCTAssertThrows([unsafeArray addChar:'c']);
    XCTAssertNoThrow([unsafeArray addBool:YES]);
    XCTAssertThrows([unsafeArray addLong:(long)3]);
    XCTAssertThrows([unsafeArray addDouble:(double)3.0]);
    XCTAssertThrows([unsafeArray addShort:(short)3]);
    XCTAssertThrows([unsafeArray addUnsignedInt:(unsigned int) 100]);
    XCTAssertThrows([unsafeArray addUnsignedChar:(unsigned char) 3]);
    XCTAssertThrows([unsafeArray addUnsignedLong:(unsigned long) 100]);
    XCTAssertThrows([unsafeArray addUnsignedShort:(unsigned short) 5]);
    
    XCTAssertThrows([unsafeArray floatAtIndex:0]);
    XCTAssertThrows([unsafeArray intAtIndex:0]);
    XCTAssertThrows([unsafeArray charAtIndex:0]);
    XCTAssertNoThrow([unsafeArray boolAtIndex:0]);
    XCTAssertThrows([unsafeArray longAtIndex:0]);
    XCTAssertThrows([unsafeArray doubleAtIndex:0]);
    XCTAssertThrows([unsafeArray shortAtIndex:0]);
    XCTAssertThrows([unsafeArray unsignedIntAtIndex:0]);
    XCTAssertThrows([unsafeArray unsignedCharAtIndex:0]);
    XCTAssertThrows([unsafeArray unsignedLongAtIndex:0]);
    XCTAssertThrows([unsafeArray unsignedShortAtIndex:0]);
}

-(void) testWrongTypeChar
{
    DZAUnsafeMutableArray * unsafeArray = [[DZAUnsafeMutableArray alloc] initWithCapacity:10 elementType:TypeChar];
    XCTAssertThrows([unsafeArray addFloat:3.0f]);
    XCTAssertThrows([unsafeArray addInt:3]);
    XCTAssertNoThrow([unsafeArray addChar:'c']);
    XCTAssertThrows([unsafeArray addBool:YES]);
    XCTAssertThrows([unsafeArray addLong:(long)3]);
    XCTAssertThrows([unsafeArray addDouble:(double)3.0]);
    XCTAssertThrows([unsafeArray addShort:(short)3]);
    XCTAssertThrows([unsafeArray addUnsignedInt:(unsigned int) 100]);
    XCTAssertThrows([unsafeArray addUnsignedChar:(unsigned char) 3]);
    XCTAssertThrows([unsafeArray addUnsignedLong:(unsigned long) 100]);
    XCTAssertThrows([unsafeArray addUnsignedShort:(unsigned short) 5]);
    
    XCTAssertThrows([unsafeArray floatAtIndex:0]);
    XCTAssertThrows([unsafeArray intAtIndex:0]);
    XCTAssertNoThrow([unsafeArray charAtIndex:0]);
    XCTAssertThrows([unsafeArray boolAtIndex:0]);
    XCTAssertThrows([unsafeArray longAtIndex:0]);
    XCTAssertThrows([unsafeArray doubleAtIndex:0]);
    XCTAssertThrows([unsafeArray shortAtIndex:0]);
    XCTAssertThrows([unsafeArray unsignedIntAtIndex:0]);
    XCTAssertThrows([unsafeArray unsignedCharAtIndex:0]);
    XCTAssertThrows([unsafeArray unsignedLongAtIndex:0]);
    XCTAssertThrows([unsafeArray unsignedShortAtIndex:0]);
}

-(void) testWrongTypeUnsignedChar
{
    DZAUnsafeMutableArray * unsafeArray = [[DZAUnsafeMutableArray alloc] initWithCapacity:10 elementType:TypeUnsignedChar];
    XCTAssertThrows([unsafeArray addFloat:3.0f]);
    XCTAssertThrows([unsafeArray addInt:3]);
    XCTAssertThrows([unsafeArray addChar:'c']);
    XCTAssertThrows([unsafeArray addBool:YES]);
    XCTAssertThrows([unsafeArray addLong:(long)3]);
    XCTAssertThrows([unsafeArray addDouble:(double)3.0]);
    XCTAssertThrows([unsafeArray addShort:(short)3]);
    XCTAssertThrows([unsafeArray addUnsignedInt:(unsigned int) 100]);
    XCTAssertNoThrow([unsafeArray addUnsignedChar:(unsigned char) 3]);
    XCTAssertThrows([unsafeArray addUnsignedLong:(unsigned long) 100]);
    XCTAssertThrows([unsafeArray addUnsignedShort:(unsigned short) 5]);
    
    XCTAssertThrows([unsafeArray floatAtIndex:0]);
    XCTAssertThrows([unsafeArray intAtIndex:0]);
    XCTAssertThrows([unsafeArray charAtIndex:0]);
    XCTAssertThrows([unsafeArray boolAtIndex:0]);
    XCTAssertThrows([unsafeArray longAtIndex:0]);
    XCTAssertThrows([unsafeArray doubleAtIndex:0]);
    XCTAssertThrows([unsafeArray shortAtIndex:0]);
    XCTAssertThrows([unsafeArray unsignedIntAtIndex:0]);
    XCTAssertNoThrow([unsafeArray unsignedCharAtIndex:0]);
    XCTAssertThrows([unsafeArray unsignedLongAtIndex:0]);
    XCTAssertThrows([unsafeArray unsignedShortAtIndex:0]);
}

-(void) testWrongTypeInt
{
    DZAUnsafeMutableArray * unsafeArray = [[DZAUnsafeMutableArray alloc] initWithCapacity:10 elementType:TypeInt];
    XCTAssertThrows([unsafeArray addFloat:3.0f]);
    XCTAssertNoThrow([unsafeArray addInt:3]);
    XCTAssertThrows([unsafeArray addChar:'c']);
    XCTAssertThrows([unsafeArray addBool:YES]);
    XCTAssertThrows([unsafeArray addLong:(long)3]);
    XCTAssertThrows([unsafeArray addDouble:(double)3.0]);
    XCTAssertThrows([unsafeArray addShort:(short)3]);
    XCTAssertThrows([unsafeArray addUnsignedInt:(unsigned int) 100]);
    XCTAssertThrows([unsafeArray addUnsignedChar:(unsigned char) 3]);
    XCTAssertThrows([unsafeArray addUnsignedLong:(unsigned long) 100]);
    XCTAssertThrows([unsafeArray addUnsignedShort:(unsigned short) 5]);
    
    XCTAssertThrows([unsafeArray floatAtIndex:0]);
    XCTAssertNoThrow([unsafeArray intAtIndex:0]);
    XCTAssertThrows([unsafeArray charAtIndex:0]);
    XCTAssertThrows([unsafeArray boolAtIndex:0]);
    XCTAssertThrows([unsafeArray longAtIndex:0]);
    XCTAssertThrows([unsafeArray doubleAtIndex:0]);
    XCTAssertThrows([unsafeArray shortAtIndex:0]);
    XCTAssertThrows([unsafeArray unsignedIntAtIndex:0]);
    XCTAssertThrows([unsafeArray unsignedCharAtIndex:0]);
    XCTAssertThrows([unsafeArray unsignedLongAtIndex:0]);
    XCTAssertThrows([unsafeArray unsignedShortAtIndex:0]);
}

-(void) testWrongTypeUnsignedInt
{
    DZAUnsafeMutableArray * unsafeArray = [[DZAUnsafeMutableArray alloc] initWithCapacity:10 elementType:TypeUnsignedInt];
    XCTAssertThrows([unsafeArray addFloat:3.0f]);
    XCTAssertThrows([unsafeArray addInt:3]);
    XCTAssertThrows([unsafeArray addChar:'c']);
    XCTAssertThrows([unsafeArray addBool:YES]);
    XCTAssertThrows([unsafeArray addLong:(long)3]);
    XCTAssertThrows([unsafeArray addDouble:(double)3.0]);
    XCTAssertThrows([unsafeArray addShort:(short)3]);
    XCTAssertNoThrow([unsafeArray addUnsignedInt:(unsigned int) 100]);
    XCTAssertThrows([unsafeArray addUnsignedChar:(unsigned char) 3]);
    XCTAssertThrows([unsafeArray addUnsignedLong:(unsigned long) 100]);
    XCTAssertThrows([unsafeArray addUnsignedShort:(unsigned short) 5]);
    
    XCTAssertThrows([unsafeArray floatAtIndex:0]);
    XCTAssertThrows([unsafeArray intAtIndex:0]);
    XCTAssertThrows([unsafeArray charAtIndex:0]);
    XCTAssertThrows([unsafeArray boolAtIndex:0]);
    XCTAssertThrows([unsafeArray longAtIndex:0]);
    XCTAssertThrows([unsafeArray doubleAtIndex:0]);
    XCTAssertThrows([unsafeArray shortAtIndex:0]);
    XCTAssertNoThrow([unsafeArray unsignedIntAtIndex:0]);
    XCTAssertThrows([unsafeArray unsignedCharAtIndex:0]);
    XCTAssertThrows([unsafeArray unsignedLongAtIndex:0]);
    XCTAssertThrows([unsafeArray unsignedShortAtIndex:0]);
}

-(void) testWrongTypeShort
{
    DZAUnsafeMutableArray * unsafeArray = [[DZAUnsafeMutableArray alloc] initWithCapacity:10 elementType:TypeShort];
    XCTAssertThrows([unsafeArray addFloat:3.0f]);
    XCTAssertThrows([unsafeArray addInt:3]);
    XCTAssertThrows([unsafeArray addChar:'c']);
    XCTAssertThrows([unsafeArray addBool:YES]);
    XCTAssertThrows([unsafeArray addLong:(long)3]);
    XCTAssertThrows([unsafeArray addDouble:(double)3.0]);
    XCTAssertNoThrow([unsafeArray addShort:(short)3]);
    XCTAssertThrows([unsafeArray addUnsignedInt:(unsigned int) 100]);
    XCTAssertThrows([unsafeArray addUnsignedChar:(unsigned char) 3]);
    XCTAssertThrows([unsafeArray addUnsignedLong:(unsigned long) 100]);
    XCTAssertThrows([unsafeArray addUnsignedShort:(unsigned short) 5]);
    
    XCTAssertThrows([unsafeArray floatAtIndex:0]);
    XCTAssertThrows([unsafeArray intAtIndex:0]);
    XCTAssertThrows([unsafeArray charAtIndex:0]);
    XCTAssertThrows([unsafeArray boolAtIndex:0]);
    XCTAssertThrows([unsafeArray longAtIndex:0]);
    XCTAssertThrows([unsafeArray doubleAtIndex:0]);
    XCTAssertNoThrow([unsafeArray shortAtIndex:0]);
    XCTAssertThrows([unsafeArray unsignedIntAtIndex:0]);
    XCTAssertThrows([unsafeArray unsignedCharAtIndex:0]);
    XCTAssertThrows([unsafeArray unsignedLongAtIndex:0]);
    XCTAssertThrows([unsafeArray unsignedShortAtIndex:0]);
}

-(void) testWrongTypeUnsignedShort
{
    DZAUnsafeMutableArray * unsafeArray = [[DZAUnsafeMutableArray alloc] initWithCapacity:10 elementType:TypeUnsignedShort];
    XCTAssertThrows([unsafeArray addFloat:3.0f]);
    XCTAssertThrows([unsafeArray addInt:3]);
    XCTAssertThrows([unsafeArray addChar:'c']);
    XCTAssertThrows([unsafeArray addBool:YES]);
    XCTAssertThrows([unsafeArray addLong:(long)3]);
    XCTAssertThrows([unsafeArray addDouble:(double)3.0]);
    XCTAssertThrows([unsafeArray addShort:(short)3]);
    XCTAssertThrows([unsafeArray addUnsignedInt:(unsigned int) 100]);
    XCTAssertThrows([unsafeArray addUnsignedChar:(unsigned char) 3]);
    XCTAssertThrows([unsafeArray addUnsignedLong:(unsigned long) 100]);
    XCTAssertNoThrow([unsafeArray addUnsignedShort:(unsigned short) 5]);
    
    XCTAssertThrows([unsafeArray floatAtIndex:0]);
    XCTAssertThrows([unsafeArray intAtIndex:0]);
    XCTAssertThrows([unsafeArray charAtIndex:0]);
    XCTAssertThrows([unsafeArray boolAtIndex:0]);
    XCTAssertThrows([unsafeArray longAtIndex:0]);
    XCTAssertThrows([unsafeArray doubleAtIndex:0]);
    XCTAssertThrows([unsafeArray shortAtIndex:0]);
    XCTAssertThrows([unsafeArray unsignedIntAtIndex:0]);
    XCTAssertThrows([unsafeArray unsignedCharAtIndex:0]);
    XCTAssertThrows([unsafeArray unsignedLongAtIndex:0]);
    XCTAssertNoThrow([unsafeArray unsignedShortAtIndex:0]);
}

-(void) testWrongTypeLong
{
    DZAUnsafeMutableArray * unsafeArray = [[DZAUnsafeMutableArray alloc] initWithCapacity:10 elementType:TypeLong];
    XCTAssertThrows([unsafeArray addFloat:3.0f]);
    XCTAssertThrows([unsafeArray addInt:3]);
    XCTAssertThrows([unsafeArray addChar:'c']);
    XCTAssertThrows([unsafeArray addBool:YES]);
    XCTAssertNoThrow([unsafeArray addLong:(long)3]);
    XCTAssertThrows([unsafeArray addDouble:(double)3.0]);
    XCTAssertThrows([unsafeArray addShort:(short)3]);
    XCTAssertThrows([unsafeArray addUnsignedInt:(unsigned int) 100]);
    XCTAssertThrows([unsafeArray addUnsignedChar:(unsigned char) 3]);
    XCTAssertThrows([unsafeArray addUnsignedLong:(unsigned long) 100]);
    XCTAssertThrows([unsafeArray addUnsignedShort:(unsigned short) 5]);
    
    XCTAssertThrows([unsafeArray floatAtIndex:0]);
    XCTAssertThrows([unsafeArray intAtIndex:0]);
    XCTAssertThrows([unsafeArray charAtIndex:0]);
    XCTAssertThrows([unsafeArray boolAtIndex:0]);
    XCTAssertNoThrow([unsafeArray longAtIndex:0]);
    XCTAssertThrows([unsafeArray doubleAtIndex:0]);
    XCTAssertThrows([unsafeArray shortAtIndex:0]);
    XCTAssertThrows([unsafeArray unsignedIntAtIndex:0]);
    XCTAssertThrows([unsafeArray unsignedCharAtIndex:0]);
    XCTAssertThrows([unsafeArray unsignedLongAtIndex:0]);
    XCTAssertThrows([unsafeArray unsignedShortAtIndex:0]);
}

-(void) testWrongTypeUnsignedLong
{
    DZAUnsafeMutableArray * unsafeArray = [[DZAUnsafeMutableArray alloc] initWithCapacity:10 elementType:TypeUnsignedLong];
    XCTAssertThrows([unsafeArray addFloat:3.0f]);
    XCTAssertThrows([unsafeArray addInt:3]);
    XCTAssertThrows([unsafeArray addChar:'c']);
    XCTAssertThrows([unsafeArray addBool:YES]);
    XCTAssertThrows([unsafeArray addLong:(long)3]);
    XCTAssertThrows([unsafeArray addDouble:(double)3.0]);
    XCTAssertThrows([unsafeArray addShort:(short)3]);
    XCTAssertThrows([unsafeArray addUnsignedInt:(unsigned int) 100]);
    XCTAssertThrows([unsafeArray addUnsignedChar:(unsigned char) 3]);
    XCTAssertNoThrow([unsafeArray addUnsignedLong:(unsigned long) 100]);
    XCTAssertThrows([unsafeArray addUnsignedShort:(unsigned short) 5]);
    
    XCTAssertThrows([unsafeArray floatAtIndex:0]);
    XCTAssertThrows([unsafeArray intAtIndex:0]);
    XCTAssertThrows([unsafeArray charAtIndex:0]);
    XCTAssertThrows([unsafeArray boolAtIndex:0]);
    XCTAssertThrows([unsafeArray longAtIndex:0]);
    XCTAssertThrows([unsafeArray doubleAtIndex:0]);
    XCTAssertThrows([unsafeArray shortAtIndex:0]);
    XCTAssertThrows([unsafeArray unsignedIntAtIndex:0]);
    XCTAssertThrows([unsafeArray unsignedCharAtIndex:0]);
    XCTAssertNoThrow([unsafeArray unsignedLongAtIndex:0]);
    XCTAssertThrows([unsafeArray unsignedShortAtIndex:0]);
}

-(void) testWrongTypeDouble
{
    DZAUnsafeMutableArray * unsafeArray = [[DZAUnsafeMutableArray alloc] initWithCapacity:10 elementType:TypeDouble];
    XCTAssertThrows([unsafeArray addFloat:3.0f]);
    XCTAssertThrows([unsafeArray addInt:3]);
    XCTAssertThrows([unsafeArray addChar:'c']);
    XCTAssertThrows([unsafeArray addBool:YES]);
    XCTAssertThrows([unsafeArray addLong:(long)3]);
    XCTAssertNoThrow([unsafeArray addDouble:(double)3.0]);
    XCTAssertThrows([unsafeArray addShort:(short)3]);
    XCTAssertThrows([unsafeArray addUnsignedInt:(unsigned int) 100]);
    XCTAssertThrows([unsafeArray addUnsignedChar:(unsigned char) 3]);
    XCTAssertThrows([unsafeArray addUnsignedLong:(unsigned long) 100]);
    XCTAssertThrows([unsafeArray addUnsignedShort:(unsigned short) 5]);
    
    XCTAssertThrows([unsafeArray floatAtIndex:0]);
    XCTAssertThrows([unsafeArray intAtIndex:0]);
    XCTAssertThrows([unsafeArray charAtIndex:0]);
    XCTAssertThrows([unsafeArray boolAtIndex:0]);
    XCTAssertThrows([unsafeArray longAtIndex:0]);
    XCTAssertNoThrow([unsafeArray doubleAtIndex:0]);
    XCTAssertThrows([unsafeArray shortAtIndex:0]);
    XCTAssertThrows([unsafeArray unsignedIntAtIndex:0]);
    XCTAssertThrows([unsafeArray unsignedCharAtIndex:0]);
    XCTAssertThrows([unsafeArray unsignedLongAtIndex:0]);
    XCTAssertThrows([unsafeArray unsignedShortAtIndex:0]);
}

-(void) testWrongTypeFloat
{
    DZAUnsafeMutableArray * unsafeArray = [[DZAUnsafeMutableArray alloc] initWithCapacity:10 elementType:TypeFloat];
    XCTAssertNoThrow([unsafeArray addFloat:3.0f]);
    XCTAssertThrows([unsafeArray addInt:3]);
    XCTAssertThrows([unsafeArray addChar:'c']);
    XCTAssertThrows([unsafeArray addBool:YES]);
    XCTAssertThrows([unsafeArray addLong:(long)3]);
    XCTAssertThrows([unsafeArray addDouble:(double)3.0]);
    XCTAssertThrows([unsafeArray addShort:(short)3]);
    XCTAssertThrows([unsafeArray addUnsignedInt:(unsigned int) 100]);
    XCTAssertThrows([unsafeArray addUnsignedChar:(unsigned char) 3]);
    XCTAssertThrows([unsafeArray addUnsignedLong:(unsigned long) 100]);
    XCTAssertThrows([unsafeArray addUnsignedShort:(unsigned short) 5]);
    
    XCTAssertNoThrow([unsafeArray floatAtIndex:0]);
    XCTAssertThrows([unsafeArray intAtIndex:0]);
    XCTAssertThrows([unsafeArray charAtIndex:0]);
    XCTAssertThrows([unsafeArray boolAtIndex:0]);
    XCTAssertThrows([unsafeArray longAtIndex:0]);
    XCTAssertThrows([unsafeArray doubleAtIndex:0]);
    XCTAssertThrows([unsafeArray shortAtIndex:0]);
    XCTAssertThrows([unsafeArray unsignedIntAtIndex:0]);
    XCTAssertThrows([unsafeArray unsignedCharAtIndex:0]);
    XCTAssertThrows([unsafeArray unsignedLongAtIndex:0]);
    XCTAssertThrows([unsafeArray unsignedShortAtIndex:0]);
}

-(void) testOutOfBounds
{
    DZAUnsafeMutableArray * unsafeArray = [[DZAUnsafeMutableArray alloc] initWithCapacity:10 elementType:TypeInt];
    for (int i = 0; i < 10; i++)
    {
        [unsafeArray addInt:i];
    }
    
    for (int i = 0; i < 10; i++)
    {
        XCTAssertNoThrow([unsafeArray intAtIndex:i]);
    }
    for (int i = 10; i < 20; i++)
    {
        XCTAssertThrows([unsafeArray intAtIndex:11]);
    }
}


@end
