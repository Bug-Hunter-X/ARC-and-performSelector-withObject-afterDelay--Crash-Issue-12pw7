# Objective-C ARC and `performSelector:withObject:afterDelay:` Crash Issue

This repository demonstrates a potential crash in Objective-C applications using automatic reference counting (ARC) when `performSelector:withObject:afterDelay:` is used inappropriately.  The bug occurs when an object is deallocated before a delayed selector invocation executes, resulting in a crash.  The solution involves using blocks or timers for managing delayed execution, ensuring proper object lifetime management.

## Bug Description

The `performSelector:withObject:afterDelay:` method retains the object until the delayed method is executed. If the object is deallocated before the delay period elapses, attempting to access it will lead to a crash due to the dangling pointer.  This is a subtle and often unexpected behavior.

## Solution

The recommended solution involves using Grand Central Dispatch (GCD) or blocks to manage the delayed execution and ensure proper object lifetime management, preventing crashes caused by premature deallocation.