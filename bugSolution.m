```objectivec
#import <Foundation/Foundation.h>

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
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{            
            [myObject myMethod];
        });
        myObject = nil; //Deallocates myObject immediately, no longer causing a crash
    }
    return 0;
}
```