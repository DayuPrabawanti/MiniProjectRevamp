package repositories

import (
	"context"
	"database/sql"
	"time"
)

const createCategory = `-- name: CreateCategory :one

INSERT INTO jobhire.job_category (joca_id, joca_name, joca_modified_date)
 VALUES 
 ($1,$2,$3)
 RETURNING joca_id
`

type CreateCategoryParams struct {
	JocaID           int32          `db:"joca_id" json:"jocaId"`
	JocaName         string `db:"joca_name" json:"jocaName"`
	JocaModifiedDate time.Time   `db:"joca_modified_date" json:"jocaModifiedDate"`
}

func (q *Queries) CreateCategory(ctx context.Context, arg CreateCategoryParams) (int32, error) {
	row := q.db.QueryRowContext(ctx, createCategory, arg.JocaID, arg.JocaName, arg.JocaModifiedDate)
	var joca_id int32
	err := row.Scan(&joca_id)
	return joca_id, err
}

const createClient = `-- name: CreateClient :one

INSERT INTO jobhire.client (clit_id, clit_name, clit_about, clit_modified_date, clit_addr_id, clit_emra_id)
 VALUES 
 ($1,$2,$3,$4,$5,$6)
RETURNING clit_id
`

type CreateClientParams struct {
	ClitID           int32          `db:"clit_id" json:"clitId"`
	ClitName         string `db:"clit_name" json:"clitName"`
	ClitAbout        string `db:"clit_about" json:"clitAbout"`
	ClitModifiedDate time.Time   `db:"clit_modified_date" json:"clitModifiedDate"`
	ClitAddrID       sql.NullInt32  `db:"clit_addr_id" json:"clitAddrId"`
	ClitEmraID       sql.NullInt32  `db:"clit_emra_id" json:"clitEmraId"`
}

func (q *Queries) CreateClient(ctx context.Context, arg CreateClientParams) (int32, error) {
	row := q.db.QueryRowContext(ctx, createClient,
		arg.ClitID,
		arg.ClitName,
		arg.ClitAbout,
		arg.ClitModifiedDate,
		arg.ClitAddrID,
		arg.ClitEmraID,
	)
	var clit_id int32
	err := row.Scan(&clit_id)
	return clit_id, err
}

const createJopo = `-- name: CreateJopo :one

  INSERT INTO jobhire.job_post (jopo_entity_id, jopo_number, jopo_title, jopo_start_date, jopo_end_date, jopo_min_salary, jopo_max_salary, jopo_min_experience, jopo_max_experience, jopo_primary_skill, jopo_secondary_skill, jopo_publish_date, jopo_modified_date, jopo_emp_entity_id, jopo_clit_id, jopo_joro_id, jopo_joty_id, jopo_joca_id, jopo_addr_id, jopo_work_code, jopo_edu_code, jopo_indu_code, jopo_status) 
    VALUES 
      ($1,$2,$3,$4,$5,$6,$7,$8,$9,$10,$11,$12,$13,$14,$15,$16,$17,$18,$19,$20,$21,$22,$23)
RETURNING jopo_entity_id
`

type CreateJopoParams struct {
	JopoEntityID       int32          `db:"jopo_entity_id" json:"jopoEntityId"`
	JopoNumber         string `db:"jopo_number" json:"jopoNumber"`
	JopoTitle          string `db:"jopo_title" json:"jopoTitle"`
	JopoStartDate      time.Time   `db:"jopo_start_date" json:"jopoStartDate"`
	JopoEndDate        time.Time  `db:"jopo_end_date" json:"jopoEndDate"`
	JopoMinSalary      int32 `db:"jopo_min_salary" json:"jopoMinSalary"`
	JopoMaxSalary      int32 `db:"jopo_max_salary" json:"jopoMaxSalary"`
	JopoMinExperience  int32  `db:"jopo_min_experience" json:"jopoMinExperience"`
	JopoMaxExperience  int32  `db:"jopo_max_experience" json:"jopoMaxExperience"`
	JopoPrimarySkill   string `db:"jopo_primary_skill" json:"jopoPrimarySkill"`
	JopoSecondarySkill string `db:"jopo_secondary_skill" json:"jopoSecondarySkill"`
	JopoPublishDate    time.Time  `db:"jopo_publish_date" json:"jopoPublishDate"`
	JopoModifiedDate   time.Time  `db:"jopo_modified_date" json:"jopoModifiedDate"`
	JopoEmpEntityID    int32  `db:"jopo_emp_entity_id" json:"jopoEmpEntityId"`
	JopoClitID         int32  `db:"jopo_clit_id" json:"jopoClitId"`
	JopoJoroID         int32  `db:"jopo_joro_id" json:"jopoJoroId"`
	JopoJotyID         int32  `db:"jopo_joty_id" json:"jopoJotyId"`
	JopoJocaID         int32  `db:"jopo_joca_id" json:"jopoJocaId"`
	JopoAddrID         int32  `db:"jopo_addr_id" json:"jopoAddrId"`
	JopoWorkCode       string `db:"jopo_work_code" json:"jopoWorkCode"`
	JopoEduCode        string `db:"jopo_edu_code" json:"jopoEduCode"`
	JopoInduCode       string `db:"jopo_indu_code" json:"jopoInduCode"`
	JopoStatus         string `db:"jopo_status" json:"jopoStatus"`
}

func (q *Queries) CreateJopo(ctx context.Context, arg CreateJopoParams) (int32, error) {
	row := q.db.QueryRowContext(ctx, createJopo,
		arg.JopoEntityID,
		arg.JopoNumber,
		arg.JopoTitle,
		arg.JopoStartDate,
		arg.JopoEndDate,
		arg.JopoMinSalary,
		arg.JopoMaxSalary,
		arg.JopoMinExperience,
		arg.JopoMaxExperience,
		arg.JopoPrimarySkill,
		arg.JopoSecondarySkill,
		arg.JopoPublishDate,
		arg.JopoModifiedDate,
		arg.JopoEmpEntityID,
		arg.JopoClitID,
		arg.JopoJoroID,
		arg.JopoJotyID,
		arg.JopoJocaID,
		arg.JopoAddrID,
		arg.JopoWorkCode,
		arg.JopoEduCode,
		arg.JopoInduCode,
		arg.JopoStatus,
	)
	var jopo_entity_id int32
	err := row.Scan(&jopo_entity_id)
	return jopo_entity_id, err
}

const deleteCategory = `-- name: DeleteCategory :exec
DELETE FROM jobhire.job_category
  WHERE joca_id = $1
`

func (q *Queries) DeleteCategory(ctx context.Context, jocaID int32) error {
	_, err := q.db.ExecContext(ctx, deleteCategory, jocaID)
	return err
}

const deleteClient = `-- name: DeleteClient :exec
      DELETE FROM jobhire.client
  WHERE clit_id = $1
`

func (q *Queries) DeleteClient(ctx context.Context, clitID int32) error {
	_, err := q.db.ExecContext(ctx, deleteClient, clitID)
	return err
}

const deletejob_post = `-- name: Deletejob_post :exec
DELETE FROM jobhire.job_post
  WHERE jopo_entity_id = $1
`

func (q *Queries) Deletejob_post(ctx context.Context, jopoEntityID int32) error {
	_, err := q.db.ExecContext(ctx, deletejob_post, jopoEntityID)
	return err
}

// const getJopo = `-- name: GetJopo :one

// SELECT jopo_entity_id, jopo_number, jopo_title, jopo_start_date, jopo_end_date, jopo_min_salary, jopo_max_salary, jopo_min_experience, jopo_max_experience, jopo_primary_skill, jopo_secondary_skill, jopo_publish_date, jopo_modified_date, jopo_emp_entity_id, jopo_clit_id, jopo_joro_id, jopo_joty_id, jopo_joca_id, jopo_addr_id, jopo_work_code, jopo_edu_code, jopo_indu_code, jopo_status FROM jobhire.job_post
//   WHERE jopo_entity_id = $1
// `

// // JOBHIRE JOB POST--
// func (q *Queries) GetJopo(ctx context.Context, jopoEntityID int32) (JobhireJobPost, error) {
// 	row := q.db.QueryRowContext(ctx, getJopo, jopoEntityID)
// 	var i JobhireJobPost
// 	err := row.Scan(
// 		&i.JopoEntityID,
// 		&i.JopoNumber,
// 		&i.JopoTitle,
// 		&i.JopoStartDate,
// 		&i.JopoEndDate,
// 		&i.JopoMinSalary,
// 		&i.JopoMaxSalary,
// 		&i.JopoMinExperience,
// 		&i.JopoMaxExperience,
// 		&i.JopoPrimarySkill,
// 		&i.JopoSecondarySkill,
// 		&i.JopoPublishDate,
// 		&i.JopoModifiedDate,
// 		&i.JopoEmpEntityID,
// 		&i.JopoClitID,
// 		&i.JopoJoroID,
// 		&i.JopoJotyID,
// 		&i.JopoJocaID,
// 		&i.JopoAddrID,
// 		&i.JopoWorkCode,
// 		&i.JopoEduCode,
// 		&i.JopoInduCode,
// 		&i.JopoStatus,
// 	)
// 	return i, err
// }

// const getclient = `-- name: Getclient :one

// SELECT clit_id, clit_name, clit_about, clit_modified_date, clit_addr_id, clit_emra_id FROM jobhire.client
//   WHERE clit_id = $1
// `

// // JobHireClient
// func (q *Queries) Getclient(ctx context.Context, clitID int32) (JobhireClient, error) {
// 	row := q.db.QueryRowContext(ctx, getclient, clitID)
// 	var i JobhireClient
// 	err := row.Scan(
// 		&i.ClitID,
// 		&i.ClitName,
// 		&i.ClitAbout,
// 		&i.ClitModifiedDate,
// 		&i.ClitAddrID,
// 		&i.ClitEmraID,
// 	)
// 	return i, err
// }

// const getjob_Category = `-- name: Getjob_Category :one


// SELECT joca_id, joca_name, joca_modified_date FROM jobhire.job_category
//   WHERE joca_id = $1
// `

// // JOBHIRE CATEGORY --
// func (q *Queries) Getjob_Category(ctx context.Context, jocaID int32) (JobhireJobCategory, error) {
// 	row := q.db.QueryRowContext(ctx, getjob_Category, jocaID)
// 	var i JobhireJobCategory
// 	err := row.Scan(&i.JocaID, &i.JocaName, &i.JocaModifiedDate)
// 	return i, err
// }

// const listClient = `-- name: ListClient :many
// SELECT clit_id, clit_name, clit_about, clit_modified_date, clit_addr_id, clit_emra_id FROM jobhire.client
//     ORDER BY clit_name
// `

// func (q *Queries) ListClient(ctx context.Context) ([]JobhireClient, error) {
// 	rows, err := q.db.QueryContext(ctx, listClient)
// 	if err != nil {
// 		return nil, err
// 	}
// 	defer rows.Close()
// 	var items []JobhireClient
// 	for rows.Next() {
// 		var i JobhireClient
// 		if err := rows.Scan(
// 			&i.ClitID,
// 			&i.ClitName,
// 			&i.ClitAbout,
// 			&i.ClitModifiedDate,
// 			&i.ClitAddrID,
// 			&i.ClitEmraID,
// 		); err != nil {
// 			return nil, err
// 		}
// 		items = append(items, i)
// 	}
// 	if err := rows.Close(); err != nil {
// 		return nil, err
// 	}
// 	if err := rows.Err(); err != nil {
// 		return nil, err
// 	}
// 	return items, nil
// }

// const listjobCategory = `-- name: ListjobCategory :many
// SELECT joca_id, joca_name, joca_modified_date FROM jobhire.job_category
//     ORDER BY joca_name
// `

// func (q *Queries) ListjobCategory(ctx context.Context) ([]JobhireJobCategory, error) {
// 	rows, err := q.db.QueryContext(ctx, listjobCategory)
// 	if err != nil {
// 		return nil, err
// 	}
// 	defer rows.Close()
// 	var items []JobhireJobCategory
// 	for rows.Next() {
// 		var i JobhireJobCategory
// 		if err := rows.Scan(&i.JocaID, &i.JocaName, &i.JocaModifiedDate); err != nil {
// 			return nil, err
// 		}
// 		items = append(items, i)
// 	}
// 	if err := rows.Close(); err != nil {
// 		return nil, err
// 	}
// 	if err := rows.Err(); err != nil {
// 		return nil, err
// 	}
// 	return items, nil
// }

// const listjob_post = `-- name: Listjob_post :many
// SELECT jopo_entity_id, jopo_number, jopo_title, jopo_start_date, jopo_end_date, jopo_min_salary, jopo_max_salary, jopo_min_experience, jopo_max_experience, jopo_primary_skill, jopo_secondary_skill, jopo_publish_date, jopo_modified_date, jopo_emp_entity_id, jopo_clit_id, jopo_joro_id, jopo_joty_id, jopo_joca_id, jopo_addr_id, jopo_work_code, jopo_edu_code, jopo_indu_code, jopo_status FROM jobhire.job_post
//     ORDER BY jopo_number
// `

// func (q *Queries) Listjob_post(ctx context.Context) ([]JobhireJobPost, error) {
// 	rows, err := q.db.QueryContext(ctx, listjob_post)
// 	if err != nil {
// 		return nil, err
// 	}
// 	defer rows.Close()
// 	var items []JobhireJobPost
// 	for rows.Next() {
// 		var i JobhireJobPost
// 		if err := rows.Scan(
// 			&i.JopoEntityID,
// 			&i.JopoNumber,
// 			&i.JopoTitle,
// 			&i.JopoStartDate,
// 			&i.JopoEndDate,
// 			&i.JopoMinSalary,
// 			&i.JopoMaxSalary,
// 			&i.JopoMinExperience,
// 			&i.JopoMaxExperience,
// 			&i.JopoPrimarySkill,
// 			&i.JopoSecondarySkill,
// 			&i.JopoPublishDate,
// 			&i.JopoModifiedDate,
// 			&i.JopoEmpEntityID,
// 			&i.JopoClitID,
// 			&i.JopoJoroID,
// 			&i.JopoJotyID,
// 			&i.JopoJocaID,
// 			&i.JopoAddrID,
// 			&i.JopoWorkCode,
// 			&i.JopoEduCode,
// 			&i.JopoInduCode,
// 			&i.JopoStatus,
// 		); err != nil {
// 			return nil, err
// 		}
// 		items = append(items, i)
// 	}
// 	if err := rows.Close(); err != nil {
// 		return nil, err
// 	}
// 	if err := rows.Err(); err != nil {
// 		return nil, err
// 	}
// 	return items, nil
// }
