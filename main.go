package main

import (
	"context"
	"log"
	"os"

	"codeid.revampone/config"
	"codeid.revampone/repositories/hr/delete"
	"codeid.revampone/server"
	_ "github.com/lib/pq"
)

func main() {
	log.Println("Starting northwind restapi")

	log.Println("Initializing configuration")
	config := config.InitConfig(getConfigFileName())

	log.Println("Initializing database")
	dbHandler := server.InitDatabase(config)
	log.Println(dbHandler)

	// CRUD (Create, Read, Update, Delete)
	ctx := context.Background() //goroutine
	// queries := create.New(dbHandler)

	//MENAMBAH DATA
	// newClientContract, err := queries.CreateClientContract(ctx,
	// 	create.CreateClientContractParams{
	// 		EccoID:             3,
	// 		EccoEntityID:       5,
	// 		EccoContractNo:     "003/HR-CODE.ID/PKWTT/I/2023",
	// 		EccoContractDate:   time.Date(2023, time.July, 1, 9, 0, 0, 0, time.UTC),
	// 		EccoStartDate:      time.Date(2023, time.July, 1, 9, 0, 0, 0, time.UTC),
	// 		EccoEndDate:        time.Date(2024, time.July, 1, 9, 0, 0, 0, time.UTC),
	// 		EccoNotes:          "Karyawan Internal",
	// 		EccoModifiedDate:   time.Date(2023, time.July, 10, 9, 0, 0, 0, time.UTC),
	// 		EccoMediaLink:      "https://codeacademy/assets/contract.pdf",
	// 		EccoJotyID:         2,
	// 		EccoAccountManager: 5,
	// 		EccoClitID:         1,
	// 		EccoStatus:         "Contract",
	// 	},
	// )

	// newDepartment, err := queries.CreateDepartment(ctx,
	// 	create.CreateDepartmentParams{
	// 		DeptID:           4,
	// 		DeptName:         "Tes",
	// 		DeptModifiedDate: time.Date(2023, time.July, 10, 19, 0, 0, 0, time.UTC),
	// 	},
	// )

	// newEmployee, err := queries.CreateEmployee(ctx,
	// 	create.CreateEmployeeParams{
	// 		EmpEntityID:       2,
	// 		EmpEmpNumber:      "202307010",
	// 		EmpNationalID:     "13419981009002",
	// 		EmpBirthDate:      time.Date(2000, time.August, 20, 0, 0, 0, 0, time.UTC),
	// 		EmpMaritalStatus:  "S",
	// 		EmpGender:         "M",
	// 		EmpHireDate:       time.Date(2020, time.July, 1, 9, 0, 0, 0, time.UTC),
	// 		EmpSalariedFlag:   "1",
	// 		EmpVacationHours:  12,
	// 		EmpSickleaveHours: 12,
	// 		EmpCurrentFlag:    1,
	// 		EmpModifiedDate:   time.Date(2023, time.July, 10, 19, 0, 0, 0, time.UTC),
	// 		EmpType:           "Internal",
	// 		EmpJoroID:         1,
	// 		EmpEmpEntityID:    2,
	// 	},
	// )

	// newEmployeeDepartmentHistory, err := queries.CreateEmployeeDepartmentHistory(ctx,
	// 	create.CreateEmployeeDepartmentHistoryParams{
	// 		EdhiID:           3,
	// 		EdhiEntityID:     2,
	// 		EdhiStartDate:    time.Date(2021, time.July, 12, 0, 0, 0, 0, time.UTC),
	// 		EdhiEndDate:      time.Date(2022, time.July, 10, 0, 0, 0, 0, time.UTC),
	// 		EdhiModifiedDate: time.Date(2023, time.July, 10, 20, 0, 0, 0, time.UTC),
	// 		EdhiDeptID:       2,
	// 	},
	// )

	// newPayHistory, err := queries.CreatePayHistory(ctx,
	// 	create.CreatePayHistoryParams{
	// 		EphiEntityID:       2,
	// 		EphiRateChangeDate: time.Date(2021, time.July, 12, 0, 0, 0, 0, time.UTC),
	// 		EphiRateSalary:     8000000,
	// 		EphiPayFrequence:   1,
	// 		EphiModifiedDate:   time.Date(2023, time.July, 10, 20, 0, 0, 0, time.UTC),
	// 	},
	// )

	// MENGHAPUS DATA
	queries2 := delete.New(dbHandler)

	deleteClientContract := queries2.DeleteClientContract(ctx, 3)
	// deleteDepartment := queries2.DeleteDepartment(ctx, 4)
	// deleteEmployee := queries2.DeleteEmployee(ctx, 2)
	// deleteEmployeeDepartmentHistory := queries2.DeleteEmployeeDepartmentHistory(ctx, 3)
	// deletePayHistory := queries2.DeletePayHistory(ctx, 2)

	// if err != nil {
	// 	log.Fatal("Error : ", err)
	// }

	// MENAMBAH DATA
	// log.Println(newClientContract)
	// log.Println(newDepartment)
	// log.Println(newEmployee)
	// log.Println(newEmployeeDepartmentHistory)
	// log.Println(newPayHistory)

	// // MENGHAPUS DATA
	log.Println(deleteClientContract)
	// log.Println(deleteDepartment)
	// log.Println(deleteEmployee)
	// log.Println(deleteEmployeeDepartmentHistory)
	// log.Println(deletePayHistory)

}

func getConfigFileName() string {
	env := os.Getenv("ENV")

	if env != "" {
		return "revamp-one" + env
	}
	return "revamp-one"
}
