package fflag_test

import (
	"../fflag"
	"fmt"
	"testing"
)

func TestRead(t *testing.T) {
	fmt.Println("######")
	ip := fflag.Int("flagname", 1234, "help message for flagname")
	fflag.Parse()
	fmt.Printf("%v %v\n", ip, fflag.CommandLine)
	fmt.Println("######")
}
