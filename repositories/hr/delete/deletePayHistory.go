package delete

import "context"

const deletePayHistory = `-- name: DeletePayHistory :exec
DELETE FROM hr.employee_pay_history
WHERE ephi_entity_id = $1
`

func (q *Queries) DeletePayHistory(ctx context.Context, ephiEntityID int32) error {
	_, err := q.db.ExecContext(ctx, deletePayHistory, ephiEntityID)
	return err
}
