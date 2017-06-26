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

    NSTimeInterval benchmarkNSMutableArrayTimeInterval = [self testNSMutableArrayWithArraySize:arraySize];
    NSTimeInterval benchmarkUnsafeMutableArrayTimeInterval = [self testUnsafeMutableArrayWithArraySize:arraySize];
    NSTimeInterval benchmarkAccelerateUnsafeMutableArrayTimeInterval = [self testAccelerateUnsafeMutableArrayWithArraySize:arraySize];

    NSString * testResultsString = [NSString stringWithFormat:NSLocalizedString(@"benchmarkResults", nil),
                              benchmarkNSMutableArrayTimeInterval * 1000,
                              benchmarkUnsafeMutableArrayTimeInterval * 1000,
                              benchmarkAccelerateUnsafeMutableArrayTimeInterval * 1000];
    _textView.text = testResultsString;
}

#define SCALAR 3
-(NSTimeInterval) testNSMutableArrayWithArraySize:(int) arraySize
{
    NSMutableArray * array1 = [NSMutableArray arrayWithCapacity:1000];
    for (int i = 0; i < arraySize; i++)
    {
        [array1 addObject:@(i)];
    }
    DZATimer * timer = [[DZATimer alloc] init];
    [timer startTimer];
    for (int i = 0; i < array1.count; i++)
    {
        NSNumber * objectAtIndex1 = array1[i];
        NSNumber * sum1 = [NSNumber numberWithInt:[objectAtIndex1 intValue] + SCALAR];
        [array1 replaceObjectAtIndex:i withObject:sum1];
    }
    NSTimeInterval benchmarkTimeInterval = [timer stopTimer];
    return benchmarkTimeInterval;
}

-(NSTimeInterval) testUnsafeMutableArrayWithArraySize:(int) arraySize
{
    DZAUnsafeMutableArray * unsafeArray1 = [[DZAUnsafeMutableArray alloc] initWithCapacity:1000];
    for (int i = 0; i < arraySize; i++)
    {
        [unsafeArray1 addInt:i];
    }

    DZATimer * timer = [[DZATimer alloc] init];
    [timer startTimer];
    int *p = unsafeArray1.intUnsafePointer;
    for (int i = 0; i < unsafeArray1.count; i++, p++)
    {
        *p += SCALAR;
    }
    NSTimeInterval benchmarkTimeInterval = [timer stopTimer];
    return benchmarkTimeInterval;
}

-(NSTimeInterval) testAccelerateUnsafeMutableArrayWithArraySize:(int) arraySize
{
    DZAUnsafeMutableArray * unsafeArray1 = [[DZAUnsafeMutableArray alloc] initWithCapacity:1000];
    for (int i = 0; i < arraySize; i++)
    {
        [unsafeArray1 addInt:i];
    }

    DZATimer * timer = [[DZATimer alloc] init];
    [timer startTimer];
    int scalar = SCALAR;
    vDSP_vsaddi(unsafeArray1.intUnsafePointer, 1, &scalar, unsafeArray1.intUnsafePointer, 1, unsafeArray1.count);
    NSTimeInterval benchmarkTimeInterval = [timer stopTimer];
    return benchmarkTimeInterval;
}

@end
