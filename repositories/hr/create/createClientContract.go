package create

import (
	"context"
	"time"
)

const createClientContract = `-- name: CreateClientContract :one

INSERT INTO hr.employee_client_contract (ecco_id, ecco_entity_id, ecco_contract_no, ecco_contract_date, ecco_start_date, ecco_end_date, ecco_notes, ecco_modified_date, ecco_media_link, ecco_joty_id, ecco_account_manager, ecco_clit_id, ecco_status) VALUES ($1, $2, $3, $4, $5, $6, $7, $8, $9, $10, $11, $12, $13)
RETURNING ecco_id
`

type CreateClientContractParams struct {
	EccoID             int32     `db:"ecco_id" json:"eccoId"`
	EccoEntityID       int32     `db:"ecco_entity_id" json:"eccoEntityId"`
	EccoContractNo     string    `db:"ecco_contract_no" json:"eccoContractNo"`
	EccoContractDate   time.Time `db:"ecco_contract_date" json:"eccoContractDate"`
	EccoStartDate      time.Time `db:"ecco_start_date" json:"eccoStartDate"`
	EccoEndDate        time.Time `db:"ecco_end_date" json:"eccoEndDate"`
	EccoNotes          string    `db:"ecco_notes" json:"eccoNotes"`
	EccoModifiedDate   time.Time `db:"ecco_modified_date" json:"eccoModifiedDate"`
	EccoMediaLink      string    `db:"ecco_media_link" json:"eccoMediaLink"`
	EccoJotyID         int32     `db:"ecco_joty_id" json:"eccoJotyId"`
	EccoAccountManager int32     `db:"ecco_account_manager" json:"eccoAccountManager"`
	EccoClitID         int32     `db:"ecco_clit_id" json:"eccoClitId"`
	EccoStatus         string    `db:"ecco_status" json:"eccoStatus"`
}

func (q *Queries) CreateClientContract(ctx context.Context, arg CreateClientContractParams) (int32, error) {
	row := q.db.QueryRowContext(ctx, createClientContract,
		arg.EccoID,
		arg.EccoEntityID,
		arg.EccoContractNo,
		arg.EccoContractDate,
		arg.EccoStartDate,
		arg.EccoEndDate,
		arg.EccoNotes,
		arg.EccoModifiedDate,
		arg.EccoMediaLink,
		arg.EccoJotyID,
		arg.EccoAccountManager,
		arg.EccoClitID,
		arg.EccoStatus,
	)
	var ecco_id int32
	err := row.Scan(&ecco_id)
	return ecco_id, err
}
