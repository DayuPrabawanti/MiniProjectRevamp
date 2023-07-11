package delete

import "context"

const deleteEmployee = `-- name: DeleteEmployee :exec
DELETE FROM hr.employee
WHERE emp_entity_id = $1
`

func (q *Queries) DeleteEmployee(ctx context.Context, empEntityID int32) error {
	_, err := q.db.ExecContext(ctx, deleteEmployee, empEntityID)
	return err
}
