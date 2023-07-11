package repositories

import (
	"context"
	"database/sql"
	"time"
)

const createProgramApplyProgress = `-- name: CreateProgramApplyProgress :one
INSERT INTO bootcamp.program_apply_progress
(parog_id, parog_user_entity_id, parog_prog_entity_id, parog_action_date, parog_modified_date, parog_comment, parog_progress_name, parog_emp_entity_id, parog_status)
VALUES ($1, $2, $3, $4, $5, $6, $7, $8, $9)
RETURNING parog_id
`

type CreateProgramApplyProgressParams struct {
	ParogID           int32         `db:"parog_id" json:"parogId"`
	ParogUserEntityID int32         `db:"parog_user_entity_id" json:"parogUserEntityId"`
	ParogProgEntityID int32         `db:"parog_prog_entity_id" json:"parogProgEntityId"`
	ParogActionDate   time.Time     `db:"parog_action_date" json:"parogActionDate"`
	ParogModifiedDate time.Time     `db:"parog_modified_date" json:"parogModifiedDate"`
	ParogComment      string        `db:"parog_comment" json:"parogComment"`
	ParogProgressName string        `db:"parog_progress_name" json:"parogProgressName"`
	ParogEmpEntityID  sql.NullInt32 `db:"parog_emp_entity_id" json:"parogEmpEntityId"`
	ParogStatus       string        `db:"parog_status" json:"parogStatus"`
}

func (q *Queries) CreateProgramApplyProgress(ctx context.Context, arg CreateProgramApplyProgressParams) (int32, error) {
	row := q.db.QueryRowContext(ctx, createProgramApplyProgress,
		arg.ParogID,
		arg.ParogUserEntityID,
		arg.ParogProgEntityID,
		arg.ParogActionDate,
		arg.ParogModifiedDate,
		arg.ParogComment,
		arg.ParogProgressName,
		arg.ParogEmpEntityID,
		arg.ParogStatus,
	)
	var parog_id int32
	err := row.Scan(&parog_id)
	return parog_id, err
}

const deleteProgramApplyProgress = `-- name: DeleteProgramApplyProgress :exec
DELETE FROM bootcamp.program_apply_progress
WHERE parog_id = $1
`

func (q *Queries) DeleteProgramApplyProgress(ctx context.Context, parogID int32) error {
	_, err := q.db.ExecContext(ctx, deleteProgramApplyProgress, parogID)
	return err
}
