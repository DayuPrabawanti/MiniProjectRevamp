package repositories

import (
	"context"
	"time"
)

const createBatchTrainee = `-- name: CreateBatchTrainee :one
INSERT INTO bootcamp.batch_trainee
(batr_id, batr_status, batr_certificated, batre_certificate_link, batr_access_token, batr_access_grant, batr_review, batr_total_score, batr_modified_date, batr_trainee_entity_id, batr_batch_id)
VALUES ($1, $2, $3, $4, $5, $6, $7, $8, $9, $10, $11)
RETURNING batr_id
`

type CreateBatchTraineeParams struct {
	BatrID               int32     `db:"batr_id" json:"batrId"`
	BatrStatus           string    `db:"batr_status" json:"batrStatus"`
	BatrCertificated     string    `db:"batr_certificated" json:"batrCertificated"`
	BatreCertificateLink string    `db:"batre_certificate_link" json:"batreCertificateLink"`
	BatrAccessToken      string    `db:"batr_access_token" json:"batrAccessToken"`
	BatrAccessGrant      string    `db:"batr_access_grant" json:"batrAccessGrant"`
	BatrReview           string    `db:"batr_review" json:"batrReview"`
	BatrTotalScore       int32     `db:"batr_total_score" json:"batrTotalScore"`
	BatrModifiedDate     time.Time `db:"batr_modified_date" json:"batrModifiedDate"`
	BatrTraineeEntityID  int32     `db:"batr_trainee_entity_id" json:"batrTraineeEntityId"`
	BatrBatchID          int32     `db:"batr_batch_id" json:"batrBatchId"`
}

func (q *Queries) CreateBatchTrainee(ctx context.Context, arg CreateBatchTraineeParams) (int32, error) {
	row := q.db.QueryRowContext(ctx, createBatchTrainee,
		arg.BatrID,
		arg.BatrStatus,
		arg.BatrCertificated,
		arg.BatreCertificateLink,
		arg.BatrAccessToken,
		arg.BatrAccessGrant,
		arg.BatrReview,
		arg.BatrTotalScore,
		arg.BatrModifiedDate,
		arg.BatrTraineeEntityID,
		arg.BatrBatchID,
	)
	var batr_id int32
	err := row.Scan(&batr_id)
	return batr_id, err
}

const deleteBatchTrainee = `-- name: DeleteBatchTrainee :exec
DELETE FROM bootcamp.batch_trainee
WHERE batr_id = $1
`

func (q *Queries) DeleteBatchTrainee(ctx context.Context, batrID int32) error {
	_, err := q.db.ExecContext(ctx, deleteBatchTrainee, batrID)
	return err
}
