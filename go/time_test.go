package main

import (
	"fmt"
	"testing"
	"time"
)

/*


   Nanosecond  Duration = 1                  // 纳秒
   Microsecond          = 1000 * Nanosecond  // 微秒
   Millisecond          = 1000 * Microsecond // 毫秒
   Second               = 1000 * Millisecond
   Minute               = 60 * Second
   Hour                 = 60 * Minute
*/

func Test_time(t *testing.T) {
	fmt.Println("------ test time --------")

	a := time.Now()
	fmt.Println(a)
	fmt.Println(a.Unix())
	fmt.Println(a.Zone())

	b := time.Now().UTC()

	fmt.Println(b)
	fmt.Println(b.Unix())
	fmt.Println(b.Zone())

}
