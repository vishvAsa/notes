+++
title = "Rust"
+++

## Notable Traits
- Compiled; no runtime or garbage collection. Hence faster relatived to compiled languages like python (2x on binary search).
- static strict typing
- Strict safe memory allocations - Avoids memory leaks without garbage collection.
- Low level of monkey patching support.
- compiler can be slow compared to other languages.

## Building
Cargo is Rust’s build system and package manager.

## Main function
```rust
fn main() {
    let x = 5 + /* 90 + */ 5;
    println!("Is `x` 10 or 100? x = {}", x);
}
```