package main

import (
	"log"

	"github.com/jinzhu/gorm"
	_ "github.com/jinzhu/gorm/dialects/mysql"
)

func main() {
	db, err := gorm.Open("mysql", "root:root@tcp(db:3306)/?charset=utf8&parseTime=True&loc=Local")
	if err != nil {
		log.Fatal("Error connecting to database", err)
	}
	log.Println("MySQL Database connected successfully :)")
	defer db.Close()
}
