package create

import (
	"context"
	"time"
)

const createEmployee = `-- name: CreateEmployee :one

INSERT INTO hr.employee (emp_entity_id, emp_emp_number, emp_national_id, emp_birth_date, emp_marital_status, emp_gender, emp_hire_date, emp_salaried_flag, emp_vacation_hours, emp_sickleave_hours, emp_current_flag, emp_modified_date, emp_type, emp_joro_id, emp_emp_entity_id) VALUES ($1, $2, $3, $4, $5, $6, $7, $8, $9, $10, $11, $12, $13, $14, $15)
RETURNING emp_entity_id
`

type CreateEmployeeParams struct {
	EmpEntityID       int32     `db:"emp_entity_id" json:"empEntityId"`
	EmpEmpNumber      string    `db:"emp_emp_number" json:"empEmpNumber"`
	EmpNationalID     string    `db:"emp_national_id" json:"empNationalId"`
	EmpBirthDate      time.Time `db:"emp_birth_date" json:"empBirthDate"`
	EmpMaritalStatus  string    `db:"emp_marital_status" json:"empMaritalStatus"`
	EmpGender         string    `db:"emp_gender" json:"empGender"`
	EmpHireDate       time.Time `db:"emp_hire_date" json:"empHireDate"`
	EmpSalariedFlag   string    `db:"emp_salaried_flag" json:"empSalariedFlag"`
	EmpVacationHours  int16     `db:"emp_vacation_hours" json:"empVacationHours"`
	EmpSickleaveHours int16     `db:"emp_sickleave_hours" json:"empSickleaveHours"`
	EmpCurrentFlag    int16     `db:"emp_current_flag" json:"empCurrentFlag"`
	EmpModifiedDate   time.Time `db:"emp_modified_date" json:"empModifiedDate"`
	EmpType           string    `db:"emp_type" json:"empType"`
	EmpJoroID         int32     `db:"emp_joro_id" json:"empJoroId"`
	EmpEmpEntityID    int32     `db:"emp_emp_entity_id" json:"empEmpEntityId"`
}

func (q *Queries) CreateEmployee(ctx context.Context, arg CreateEmployeeParams) (int32, error) {
	row := q.db.QueryRowContext(ctx, createEmployee,
		arg.EmpEntityID,
		arg.EmpEmpNumber,
		arg.EmpNationalID,
		arg.EmpBirthDate,
		arg.EmpMaritalStatus,
		arg.EmpGender,
		arg.EmpHireDate,
		arg.EmpSalariedFlag,
		arg.EmpVacationHours,
		arg.EmpSickleaveHours,
		arg.EmpCurrentFlag,
		arg.EmpModifiedDate,
		arg.EmpType,
		arg.EmpJoroID,
		arg.EmpEmpEntityID,
	)
	var emp_entity_id int32
	err := row.Scan(&emp_entity_id)
	return emp_entity_id, err
}
