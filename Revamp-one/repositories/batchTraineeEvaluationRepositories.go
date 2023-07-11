package repositories

import (
	"context"
	"time"
)

const createBatchTraineeEvaluation = `-- name: CreateBatchTraineeEvaluation :one
INSERT INTO bootcamp.batch_trainee_evaluation
(btev_id, btev_type, btev_header, btev_section, btev_skill, btev_week, btev_skor, btev_note, btev_modified_date, btev_batch_id, btev_trainee_entity_id)
VALUES ($1, $2, $3, $4, $5, $6, $7, $8, $9, $10, $11)
RETURNING btev_id
`

type CreateBatchTraineeEvaluationParams struct {
	BtevID              int32     `db:"btev_id" json:"btevId"`
	BtevType            string    `db:"btev_type" json:"btevType"`
	BtevHeader          string    `db:"btev_header" json:"btevHeader"`
	BtevSection         string    `db:"btev_section" json:"btevSection"`
	BtevSkill           string    `db:"btev_skill" json:"btevSkill"`
	BtevWeek            int32     `db:"btev_week" json:"btevWeek"`
	BtevSkor            int32     `db:"btev_skor" json:"btevSkor"`
	BtevNote            string    `db:"btev_note" json:"btevNote"`
	BtevModifiedDate    time.Time `db:"btev_modified_date" json:"btevModifiedDate"`
	BtevBatchID         int32     `db:"btev_batch_id" json:"btevBatchId"`
	BtevTraineeEntityID int32     `db:"btev_trainee_entity_id" json:"btevTraineeEntityId"`
}

func (q *Queries) CreateBatchTraineeEvaluation(ctx context.Context, arg CreateBatchTraineeEvaluationParams) (int32, error) {
	row := q.db.QueryRowContext(ctx, createBatchTraineeEvaluation,
		arg.BtevID,
		arg.BtevType,
		arg.BtevHeader,
		arg.BtevSection,
		arg.BtevSkill,
		arg.BtevWeek,
		arg.BtevSkor,
		arg.BtevNote,
		arg.BtevModifiedDate,
		arg.BtevBatchID,
		arg.BtevTraineeEntityID,
	)
	var btev_id int32
	err := row.Scan(&btev_id)
	return btev_id, err
}

const deleteBatchTraineeEvaluation = `-- name: DeleteBatchTraineeEvaluation :exec
DELETE FROM bootcamp.batch_trainee_evaluation
WHERE btev_id = $1
`

func (q *Queries) DeleteBatchTraineeEvaluation(ctx context.Context, btevID int32) error {
	_, err := q.db.ExecContext(ctx, deleteBatchTraineeEvaluation, btevID)
	return err
}
