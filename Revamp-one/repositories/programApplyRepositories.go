package repositories

import (
	"context"
	"time"
)

const createProgramApply = `-- name: CreateProgramApply :one
INSERT INTO bootcamp.program_apply
(prap_user_entity_id, prap_prog_entity_id, prap_test_score, prap_gpa, prap_iq_test, prap_review, prap_modified_date, prap_status)
VALUES ($1, $2, $3, $4, $5, $6, $7, $8)
RETURNING prap_user_entity_id
`

type CreateProgramApplyParams struct {
	PrapUserEntityID int32     `db:"prap_user_entity_id" json:"prapUserEntityId"`
	PrapProgEntityID int32     `db:"prap_prog_entity_id" json:"prapProgEntityId"`
	PrapTestScore    int32     `db:"prap_test_score" json:"prapTestScore"`
	PrapGpa          int32     `db:"prap_gpa" json:"prapGpa"`
	PrapIqTest       int32     `db:"prap_iq_test" json:"prapIqTest"`
	PrapReview       string    `db:"prap_review" json:"prapReview"`
	PrapModifiedDate time.Time `db:"prap_modified_date" json:"prapModifiedDate"`
	PrapStatus       string    `db:"prap_status" json:"prapStatus"`
}

func (q *Queries) CreateProgramApply(ctx context.Context, arg CreateProgramApplyParams) (int32, error) {
	row := q.db.QueryRowContext(ctx, createProgramApply,
		arg.PrapUserEntityID,
		arg.PrapProgEntityID,
		arg.PrapTestScore,
		arg.PrapGpa,
		arg.PrapIqTest,
		arg.PrapReview,
		arg.PrapModifiedDate,
		arg.PrapStatus,
	)
	var prap_user_entity_id int32
	err := row.Scan(&prap_user_entity_id)
	return prap_user_entity_id, err
}

const deleteProgramApply = `-- name: DeleteProgramApply :exec
DELETE FROM bootcamp.program_apply
WHERE prap_user_entity_id = $1
`

func (q *Queries) DeleteProgramApply(ctx context.Context, prapUserEntityID int32) error {
	_, err := q.db.ExecContext(ctx, deleteProgramApply, prapUserEntityID)
	return err
}
