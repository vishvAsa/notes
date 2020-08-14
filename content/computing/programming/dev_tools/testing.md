---
title: Testing
---

## Use
- Forces implementer to think like user. (Ease of use emphasized.)
- Useful for debugging.
- Testable code tends to be more readable.
- Safeguard against monkey-errors in future.

## Test desiderata
- Speed
- Isolation
- In production code
  - Check inputs - use assertions

### What to test?
- Prove assertions
  - Check safety: Recognize invariants
  - Check progress
    - Induction


## Isolation testing
- Unit test function
  - Mocking function calls
    - Eg: to databases
  - Use fake objects
    - Eg: fake databases

### Mocking frameworks
The tester stubs out various functions that the method being tested is supposed to call. Then in the test, you make calls to those stubbed out functions with the arguments that you expect to be passed to them if the function being tested is working properly, and mox records it. Then, when the function is actually called, mox asserts that the order and arguments to the stubbed out functions are what was expected.

## End to end test
High reliability, most important.
