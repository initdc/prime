use std::time::Instant;

fn is_prime(num: u32) -> bool {
    if num < 4 {
        return true;
    }
    for div in 3..num / 3 {
        if num % div == 0 {
            return false;
        }
    }
    true
}

fn main() {
    let mut count = 0;
    let start = Instant::now();
    for num in (1..250000).step_by(2) {
        if is_prime(num) {
            count += 1
        }
    }
    let duration = start.elapsed();

    println!("count   : {}", count);
    println!("duration: {:?}", duration);
}
