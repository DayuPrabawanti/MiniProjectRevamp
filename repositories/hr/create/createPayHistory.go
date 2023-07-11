package create

import (
	"context"
	"time"
)

const createPayHistory = `-- name: CreatePayHistory :one

INSERT INTO hr.employee_pay_history (ephi_entity_id, ephi_rate_change_date, ephi_rate_salary, ephi_pay_frequence, ephi_modified_date) VALUES ($1, $2, $3, $4, $5)
RETURNING ephi_entity_id
`

type CreatePayHistoryParams struct {
	EphiEntityID       int32     `db:"ephi_entity_id" json:"ephiEntityId"`
	EphiRateChangeDate time.Time `db:"ephi_rate_change_date" json:"ephiRateChangeDate"`
	EphiRateSalary     int32     `db:"ephi_rate_salary" json:"ephiRateSalary"`
	EphiPayFrequence   int16     `db:"ephi_pay_frequence" json:"ephiPayFrequence"`
	EphiModifiedDate   time.Time `db:"ephi_modified_date" json:"ephiModifiedDate"`
}

func (q *Queries) CreatePayHistory(ctx context.Context, arg CreatePayHistoryParams) (int32, error) {
	row := q.db.QueryRowContext(ctx, createPayHistory,
		arg.EphiEntityID,
		arg.EphiRateChangeDate,
		arg.EphiRateSalary,
		arg.EphiPayFrequence,
		arg.EphiModifiedDate,
	)
	var ephi_entity_id int32
	err := row.Scan(&ephi_entity_id)
	return ephi_entity_id, err
}
