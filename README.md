# Objective-C Crash: Deallocated Object in performSelector

This repository demonstrates a common but easily overlooked issue in Objective-C related to the `performSelector:withObject:afterDelay:` method.  If the object on which you perform a selector is deallocated before the delay expires, the application will crash.

The `bug.m` file showcases the problematic code.  The solution, provided in `bugSolution.m`, demonstrates how to avoid this crash through proper object management and lifecycle considerations.