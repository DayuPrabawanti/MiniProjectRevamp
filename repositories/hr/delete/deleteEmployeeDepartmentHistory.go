package delete

import "context"

const deleteEmployeeDepartmentHistory = `-- name: DeleteEmployeeDepartmentHistory :exec
DELETE FROM hr.employee_department_history
WHERE edhi_id = $1
`

func (q *Queries) DeleteEmployeeDepartmentHistory(ctx context.Context, edhiID int32) error {
	_, err := q.db.ExecContext(ctx, deleteEmployeeDepartmentHistory, edhiID)
	return err
}
