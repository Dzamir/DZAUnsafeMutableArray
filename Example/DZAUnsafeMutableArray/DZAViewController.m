//
//  DZAViewController.m
//  DZAUnsafeMutableArray
//
//  Created by Davide Di Stefano on 06/20/2017.
//  Copyright (c) 2017 Davide Di Stefano. All rights reserved.
//

#import "DZAViewController.h"
@import Accelerate;
@import DZAUnsafeMutableArray;
@import DZATimer;

@interface DZAViewController ()

@property (weak, nonatomic) IBOutlet UISlider *arraySizeSlider;
@property (weak, nonatomic) IBOutlet UITextView *textView;
@property (weak, nonatomic) IBOutlet UILabel *arraySizeLabel;

@end

@implementation DZAViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self updateArraySizeLabel];
    _textView.text = @"";
}

-(void) updateArraySizeLabel
{
    _arraySizeLabel.text = [NSString stringWithFormat:@"Array size %i", (int)_arraySizeSlider.value];
}

- (IBAction)arraySizeValueChanged:(id)sender
{
    [self updateArraySizeLabel];
}

- (IBAction)startBenchmarksAction:(id)sender
{
    int arraySize = (int)_arraySizeSlider.value;
    DZATimer * timer = [[DZATimer alloc] init];
    [timer startTimer];
    [self testNSMutableArrayWithArraySize:arraySize];
    NSTimeInterval benchmarkNSMutableArrayTimeInterval = [timer stopTimer];

    [timer startTimer];
    [self testUnsafeMutableArrayWithArraySize:arraySize];
    NSTimeInterval benchmarkUnsafeMutableArrayTimeInterval = [timer stopTimer];

    [timer startTimer];
    [self testAccelerateUnsafeMutableArrayWithArraySize:arraySize];
    NSTimeInterval benchmarkAccelerateUnsafeMutableArrayTimeInterval = [timer stopTimer];

    NSString * testResultsString = [NSString stringWithFormat:NSLocalizedString(@"benchmarkResults", nil),
                              benchmarkNSMutableArrayTimeInterval * 100,
                              benchmarkUnsafeMutableArrayTimeInterval * 100,
                              benchmarkAccelerateUnsafeMutableArrayTimeInterval * 100];
    _textView.text = testResultsString;
}

#define SCALAR 3
-(void) testNSMutableArrayWithArraySize:(int) arraySize
{
    NSMutableArray * array = [NSMutableArray arrayWithCapacity:1000];
    for (int i = 0; i < arraySize; i++)
    {
        [array addObject:@(i)];
    }
    for (int i = 0; i < array.count; i++)
    {
        NSNumber * objectAtIndex = array[i];
        NSNumber * sum = [NSNumber numberWithInt:[objectAtIndex intValue] + SCALAR];
        [array replaceObjectAtIndex:i withObject:sum];
    }
}

-(void) testUnsafeMutableArrayWithArraySize:(int) arraySize
{
    DZAUnsafeMutableArray * unsafeArray = [[DZAUnsafeMutableArray alloc] initWithCapacity:2000000];
    for (int i = 0; i < 2000000; i++)
    {
        [unsafeArray addInt:i];
    }
    for (int i = 0; i < unsafeArray.count; i++)
    {
        unsafeArray.intUnsafePointer[i] = unsafeArray.intUnsafePointer[i] + SCALAR;
    }
}

-(void) testAccelerateUnsafeMutableArrayWithArraySize:(int) arraySize
{
    DZAUnsafeMutableArray * unsafeArray = [[DZAUnsafeMutableArray alloc] initWithCapacity:2000000];
    for (int i = 0; i < 2000000; i++)
    {
        [unsafeArray addInt:i];
    }
    int scalar = SCALAR;
    vDSP_vsaddi(unsafeArray.intUnsafePointer, 1, &scalar, unsafeArray.intUnsafePointer, 1, unsafeArray.count);
}

@end
