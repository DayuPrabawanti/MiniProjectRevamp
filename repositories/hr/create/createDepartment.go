package create

import (
	"context"
	"time"
)

const createDepartment = `-- name: CreateDepartment :one

INSERT INTO hr.department 
(dept_id, dept_name, dept_modified_date)
VALUES($1,$2,$3)
RETURNING dept_id
`

type CreateDepartmentParams struct {
	DeptID           int32     `db:"dept_id" json:"deptId"`
	DeptName         string    `db:"dept_name" json:"deptName"`
	DeptModifiedDate time.Time `db:"dept_modified_date" json:"deptModifiedDate"`
}

func (q *Queries) CreateDepartment(ctx context.Context, arg CreateDepartmentParams) (int32, error) {
	row := q.db.QueryRowContext(ctx, createDepartment, arg.DeptID, arg.DeptName, arg.DeptModifiedDate)
	var dept_id int32
	err := row.Scan(&dept_id)
	return dept_id, err
}
