package main

import (
	"context"
	"database/sql"
	"log"
	"os"
	"time"

	// "codeid.JHOne/config"
	// "codeid.JHOne/server"
	"codeid.JHOne/config"
	repositories "codeid.JHOne/repositories/jobHire"
	"codeid.JHOne/server"
	_ "github.com/lib/pq"

)

func main() {

	log.Println("starting northwind resapi")
	
	log.Println("Initializing configuration ")
	config := config.InitConfig(getConfigFileName())

	log.Println("Initializing database ")
	dbHandler := server.InitDatabase(config) 
	log.Println(dbHandler)

	ctx := context.Background()
	queries := repositories.New(dbHandler)

	// createJopo(ctx,queries)
	// insertDataCategory(ctx,queries)
	insertDataClient(ctx,queries)


}



func getConfigFileName() string {
	env := os.Getenv("ENV")

	if env != " " {
		return	"testJH" + env 
	}

	return "testJH"
}

func insertDataCategory (ctx context.Context, queries *repositories.Queries) {
	
	newCategory, err := queries.CreateCategory(ctx, 
		repositories.CreateCategoryParams{
		JocaID : 6,
		JocaName : "sales", 
		JocaModifiedDate : time.Now(),
		},
	)
	if err != nil{
		log.Fatal("Error : ", err)
	}
	log.Println(newCategory)

}


func insertDataClient(ctx context.Context, queries *repositories.Queries) {
	newClient, err := queries.CreateClient(ctx,
		repositories.CreateClientParams{
	ClitID :    318,
	ClitName    : "bca",     
	ClitAbout    :   "PT Bank Central Asia Tbk, commonly known as Bank Central Asia is an Indonesian bank founded on 21 February 1957",
	ClitModifiedDate : time.Now(),
	ClitAddrID      : sql.NullInt32{},
	ClitEmraID       : sql.NullInt32{},
		},
	)
	//cek error
	if err != nil {
		log.Fatal(err)
	}

	//tampilkan
	log.Println(newClient)
}

func createJopo(ctx context.Context, queries *repositories.Queries) {
	newJopo, err := queries.CreateJopo(ctx,
		repositories.CreateJopoParams{
	JopoEntityID    :  2,
	JopoNumber       :  "JOB20220727-0002",
	JopoTitle         : "Android Developer",
	JopoStartDate      : time.Now(),
	JopoEndDate        : time.Now(),
	JopoMinSalary      :	8000000,
	JopoMaxSalary      :	16000000,
	JopoMinExperience  : 1,
	JopoMaxExperience  : 3,
	JopoPrimarySkill   : "golang", 
	JopoSecondarySkill : "gin" ,
	JopoPublishDate    : time.Now(),
	JopoModifiedDate   : time.Now(),
	JopoEmpEntityID    : 7 ,
	JopoClitID         : 3,
	JopoJoroID         : 1 ,
	JopoJotyID         : 5,
	JopoJocaID         : 2,
	JopoAddrID         : 1,
	JopoWorkCode       : "a01", 
	JopoEduCode        : "e01" ,
	JopoInduCode       : "i01" ,
	JopoStatus         : "publish", 
		},
	)
	//cek error
	if err != nil {
		log.Fatal(err)
	}

	//tampilkan
	log.Println(newJopo)
}
