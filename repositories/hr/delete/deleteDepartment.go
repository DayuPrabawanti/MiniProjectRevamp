package delete

import "context"

const deleteDepartment = `-- name: DeleteDepartment :exec
DELETE FROM hr.department
WHERE dept_id = $1
`

func (q *Queries) DeleteDepartment(ctx context.Context, deptID int32) error {
	_, err := q.db.ExecContext(ctx, deleteDepartment, deptID)
	return err
}
