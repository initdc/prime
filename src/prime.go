package main

import (
	"flag"
	"fmt"
	"os"
	"runtime/pprof"
	"time"
)

func isPrime(num int) bool {
	if num < 4 {
		return true

	}
	for i := 3; i <= num/3; i++ {
		if num%i == 0 {
			return false
		}
	}
	return true
}

func main() {
	cpuProfile := flag.String("cpuprofile", "", "write cpu profile to file")
	flag.Parse()

	if *cpuProfile != "" {
		f, err := os.Create(*cpuProfile)
		if err != nil {
			panic(err)
		}
		pprof.StartCPUProfile(f)
		defer pprof.StopCPUProfile()
	}

	count := 0
	start := time.Now().UTC()

	for i := 1; i <= 250000; i += 2 {
		if isPrime(i) {
			count++
		}
	}

	finish := time.Now().UTC()
	duration := finish.Sub(start)
	fmt.Printf("count   : %v\n", count)
	fmt.Printf("duration: %v\n", duration)
}
