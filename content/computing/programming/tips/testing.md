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

## End to end test
High reliability, most important.
