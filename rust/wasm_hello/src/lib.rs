use std::usize;

// stuff is OS and hardware agnostic.. why we have wasm32-uknown-unknonw (arch-os-underlying
// platform)
#[unsafe(no_mangle)]
// as per wasm requirement and the contigousous memory requirement and the fact that wasm does not
// know anything about strings, we store the pointer address to the beginning to the byte array and
// the length
pub fn greet(ptr: i32, len: i32) {
    // rust handles seamless conversion to wasm types
    let hello = "Hello, ";
    
    // get the right types
    let input_ptr = ptr as *mut u8;
    let input_len = len as usize;
    // calculate the new len
    let new_len = input_len + hello.len();
    // get the memory slice we need for the output
    let output = unsafe { core::slice::from_raw_parts_mut(0 as *mut u8, new_len) };
    // fill up the memory slice
    output[..hello.len()].copy_from_slice(hello.as_bytes());
    output[hello.len()..].copy_from_slice(unsafe { core::slice::from_raw_parts(input_ptr, input_len) });
}
