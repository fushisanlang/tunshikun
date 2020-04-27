package main

import (
        "fmt"
) 

func redprint(note string) {
	fmt.Printf("\n 0x1B[1;40;32m note 0x1B[0m\n\n")
}

func main() {
	redprint('asd')
}