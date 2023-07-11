package main

import (
	"context"
	"log"
	"os"
	"time"

	"codeid.revampone/config"
	"codeid.revampone/repositories"
	"codeid.revampone/server"
	_ "github.com/lib/pq"
)

func main() {
	log.Println("Starting revampone restapi")

	log.Println("Initializing configuration")
	config := config.InitConfig(getConfigFileName())

	log.Println("Initializing database")
	dbHandler := server.InitDatabase(config)
	log.Println(dbHandler)

	// test insert to category, using qoroutine
	ctx := context.Background()
	queries := repositories.New(dbHandler)

	// newBatch, err := queries.CreateBatch(ctx,
	// 	repositories.CreateBatchParams{
	// 		BatchID:           2,
	// 		BatchEntityID:     2,
	// 		BatchName:         "Batch#16",
	// 		BatchDescription:  "",
	// 		BatchStartDate:    time.Now(),
	// 		BatchEndDate:      time.Date(2023, time.May, 10, 12, 0, 0, 0, time.Local),
	// 		BatchReason:       "",
	// 		BatchType:         "offline",
	// 		BatchModifiedDate: time.Now(),
	// 		BatchStatus:       "Open",
	// 	},
	// )
	// if err != nil {
	// 	log.Fatal("Error : ", err)
	// }
	// log.Println(newBatch)

	// newBatchTrainee, err := queries.CreateBatchTrainee(ctx,
	// 	repositories.CreateBatchTraineeParams{
	// 		BatrID:               3,
	// 		BatrStatus:           "Running",
	// 		BatrCertificated:     "0",
	// 		BatreCertificateLink: "",
	// 		BatrAccessToken:      "",
	// 		BatrAccessGrant:      "0",
	// 		BatrReview:           "selama bootcamp ok nice",
	// 		BatrTotalScore:       88,
	// 		BatrModifiedDate:     time.Now(),
	// 		BatrTraineeEntityID:  4,
	// 		BatrBatchID:          1,
	// 	},
	// )
	// if err != nil {
	// 	log.Fatal("Error : ", err)
	// }
	// log.Println(newBatchTrainee)

	// newBatchTraineeEvaluation, err := queries.CreateBatchTraineeEvaluation(ctx,
	// 	repositories.CreateBatchTraineeEvaluationParams{
	// 		BtevID:              6,
	// 		BtevType:            "hardskill",
	// 		BtevHeader:          "Fundamental",
	// 		BtevSection:         "tiga",
	// 		BtevSkill:           "Golang",
	// 		BtevWeek:            3,
	// 		BtevSkor:            70,
	// 		BtevNote:            "nice try",
	// 		BtevModifiedDate:    time.Now(),
	// 		BtevBatchID:         2,
	// 		BtevTraineeEntityID: 3,
	// 	},
	// )
	// if err != nil {
	// 	log.Fatal("Error : ", err)
	// }
	// log.Println(newBatchTraineeEvaluation)

	newInstructorProgram, err := queries.CreateInstructorProgram(ctx,
		repositories.CreateInstructorProgramParams{
			BatchID:           1,
			InproEntityID:     1,
			InproEmpEntityID:  4,
			InproModifiedDate: time.Now(),
		},
	)
	if err != nil {
		log.Fatal("Error : ", err)
	}
	log.Println(newInstructorProgram)

	// newProgramApply, err := queries.CreateProgramApply(ctx,
	// 	repositories.CreateProgramApplyParams{
	// 		PrapUserEntityID: 3,
	// 		PrapProgEntityID: 3,
	// 		PrapTestScore:    80,
	// 		PrapGpa:          4.00,
	// 		PrapIqTest:       88,
	// 		PrapReview:       "Nice",
	// 		PrapModifiedDate: time.Now(),
	// 		PrapStatus:       "Passed",
	// 	},
	// )
	// if err != nil {
	// 	log.Fatal("Error : ", err)
	// }
	// log.Println(newProgramApply)

	// newProgramApplyProgress, err := queries.CreateProgramApplyProgress(ctx,
	// 	repositories.CreateProgramApplyProgressParams{
	// 		ParogID:           8,
	// 		ParogUserEntityID: 2,
	// 		ParogProgEntityID: 3,
	// 		ParogActionDate:   time.Now(),
	// 		ParogModifiedDate: time.Now(),
	// 		ParogComment:      "join bootcamp available di minggu ke 2 dari jadwal",
	// 		ParogProgressName: "done",
	// 		// ParogEmpEntityID:,
	// 		ParogStatus: "Open",
	// 	},
	// )
	// if err != nil {
	// 	log.Fatal("Error : ", err)
	// }
	// log.Println(newProgramApplyProgress)
}

func getConfigFileName() string {
	env := os.Getenv("ENV")

	if env != "" {
		return "revampone" + env
	}
	return "revampone"
}
