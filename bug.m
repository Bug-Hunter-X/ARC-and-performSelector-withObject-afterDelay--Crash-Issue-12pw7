This code snippet demonstrates a potential issue with Objective-C's `performSelector:withObject:afterDelay:` method when combined with automatic reference counting (ARC). If the object on which the selector is performed is deallocated before the delay expires, a crash may occur.  This is because the delayed method invocation retains the object, but the object is no longer valid.

```objectivec
@interface MyClass : NSObject
- (void)myMethod;
@end

@implementation MyClass
- (void)myMethod {
    NSLog(@"My method executed");
}

- (void)dealloc {
    NSLog(@"MyClass deallocated");
}
@end

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        MyClass *myObject = [[MyClass alloc] init];
        [myObject performSelector:@selector(myMethod) withObject:nil afterDelay:2.0];
        myObject = nil; //Deallocates myObject immediately
    }
    return 0;
}
```