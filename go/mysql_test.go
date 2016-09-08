package main

import (
	"database/sql"
	"fmt"
	"log"
	"os"
	"testing"

	_ "github.com/go-sql-driver/mysql"
	"gopkg.in/gorp.v1"
)

type Post struct {
	Id      int64 `db:"id"`
	Created int64
	Title   string `db:"title" dbmode:"r"`
	Body    string `db:"article_body"`
}

func initDb() *gorp.DbMap {
	db, err := sql.Open("mysql", "bang:nawalegincla@tcp(127.0.0.1:3306)/bang")
	checkErr(err, "open mysql error")

	err = db.Ping()
	checkErr(err, "connection mysql error")

	dbmap := &gorp.DbMap{Db: db, Dialect: gorp.MySQLDialect{Engine: "InnoDB", Encoding: "latin1"}}
	dbmap.TraceOn("[gorp]", log.New(os.Stdout, "myapp:", log.Lmicroseconds))

	dbmap.AddTableWithName(Post{}, "test_stu").SetKeys(true, "id")

	err = dbmap.CreateTablesIfNotExists()
	checkErr(err, "Create tables failed")

	return dbmap
}

func checkErr(err error, msg string) {
	if err != nil {
		log.Fatalln(msg, err)
	}
}

func Test_gorp(t *testing.T) {
	dbmap := initDb()
	fmt.Printf("dbmap: %+v \n", dbmap)
	//defer dbmap.Db.Close()
	var err error
	sql := "select * from test_stu where id = 1"
	p := make([]*Post, 0)
	data, err := dbmap.Select(&p, sql)
	fmt.Printf(" %d %v %v \n", len(data), err, p[0])
	pp := p[0]
	pp.Title = "ddddd"
	fmt.Println(pp.Id)
	dbmap.Insert(pp)
}
