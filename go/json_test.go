package main

import (
	"encoding/json"
	"fmt"
	"log"
	"testing"
)

type Stu struct {
	Name string `json:"name"`
	Age  int    `json:"-"`
	Id   int    `json:"id,omitempty,string"`
}

func checkErr(err error, msg string) {
	if err != nil {
		log.Fatalln(msg, err)
	}
}

func Test_json(t *testing.T) {
	fmt.Println(" ---- test json ")
	var err error
	str := `
		{
			"name": "张三",
			"age": 11
		}
	`

	fmt.Println(str)
	bytes := []byte(str)

	fmt.Printf("%+v \n", bytes)

	var s Stu

	err = json.Unmarshal([]byte(str), &s)
	checkErr(err, "parse json error")

	fmt.Printf("s: %+v \n", s)

	s.Id = 0
	s.Name = "李四"

	b, err := json.Marshal(s)
	checkErr(err, "pack json error")
	fmt.Printf("new stu: %s \n", string(b))
	fmt.Println(err)
}
