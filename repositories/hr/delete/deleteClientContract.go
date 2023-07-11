package delete

import "context"

const deleteClientContract = `-- name: DeleteClientContract :exec
DELETE FROM hr.employee_client_contract
WHERE ecco_id = $1
`

func (q *Queries) DeleteClientContract(ctx context.Context, eccoID int32) error {
	_, err := q.db.ExecContext(ctx, deleteClientContract, eccoID)
	return err
}
