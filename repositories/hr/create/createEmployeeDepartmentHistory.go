package create

import (
	"context"
	"time"
)

const createEmployeeDepartmentHistory = `-- name: CreateEmployeeDepartmentHistory :one

INSERT INTO hr.employee_department_history 
(edhi_id, edhi_entity_id, edhi_start_date, edhi_end_date, edhi_modified_date, edhi_dept_id)
VALUES($1,$2,$3,$4,$5,$6)
RETURNING edhi_id
`

type CreateEmployeeDepartmentHistoryParams struct {
	EdhiID           int32     `db:"edhi_id" json:"edhiId"`
	EdhiEntityID     int32     `db:"edhi_entity_id" json:"edhiEntityId"`
	EdhiStartDate    time.Time `db:"edhi_start_date" json:"edhiStartDate"`
	EdhiEndDate      time.Time `db:"edhi_end_date" json:"edhiEndDate"`
	EdhiModifiedDate time.Time `db:"edhi_modified_date" json:"edhiModifiedDate"`
	EdhiDeptID       int32     `db:"edhi_dept_id" json:"edhiDeptId"`
}

func (q *Queries) CreateEmployeeDepartmentHistory(ctx context.Context, arg CreateEmployeeDepartmentHistoryParams) (int32, error) {
	row := q.db.QueryRowContext(ctx, createEmployeeDepartmentHistory,
		arg.EdhiID,
		arg.EdhiEntityID,
		arg.EdhiStartDate,
		arg.EdhiEndDate,
		arg.EdhiModifiedDate,
		arg.EdhiDeptID,
	)
	var edhi_id int32
	err := row.Scan(&edhi_id)
	return edhi_id, err
}
