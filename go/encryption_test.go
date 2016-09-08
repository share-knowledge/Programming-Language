package main

import (
	"crypto/md5"
	"crypto/sha1"
	"crypto/sha256"
	"encoding/hex"
	"fmt"
	"log"

	"testing"
)

func checkErr(err error, msg string) {
	if err != nil {
		log.Fatalln(msg, err)
	}
}

func Test_md5(t *testing.T) {
	str := "张三"

	md5 := md5.Sum([]byte(str))
	fmt.Println(md5)
	fmt.Printf("md5: %d, %x, %s \n", len(md5), md5, hex.EncodeToString(md5[:]))

}

func Test_sha1(t *testing.T) {
	str := "李四..."
	sha1 := sha1.Sum([]byte(str))

	fmt.Printf("sha1: %d, %x\n", len(sha1), sha1)

}
func Test_sha256(t *testing.T) {
	str := "李四..."
	sha256 := sha256.Sum256([]byte(str))

	fmt.Printf("sha256: %d, %x\n", len(sha256), sha256)

}
