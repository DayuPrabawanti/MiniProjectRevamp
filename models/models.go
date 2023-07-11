// Code generated by sqlc. DO NOT EDIT.
// versions:
//   sqlc v1.19.0

package models

import (
	"database/sql"
)

type JobhireClient struct {
	ClitID           int32          `db:"clit_id" json:"clitId"`
	ClitName         sql.NullString `db:"clit_name" json:"clitName"`
	ClitAbout        sql.NullString `db:"clit_about" json:"clitAbout"`
	ClitModifiedDate sql.NullTime   `db:"clit_modified_date" json:"clitModifiedDate"`
	ClitAddrID       sql.NullInt32  `db:"clit_addr_id" json:"clitAddrId"`
	ClitEmraID       sql.NullInt32  `db:"clit_emra_id" json:"clitEmraId"`
}

type JobhireEmployeeRange struct {
	EmraID           int32         `db:"emra_id" json:"emraId"`
	EmraRangeMin     sql.NullInt32 `db:"emra_range_min" json:"emraRangeMin"`
	EmraRangeMax     sql.NullInt32 `db:"emra_range_max" json:"emraRangeMax"`
	EmraModifiedDate sql.NullTime  `db:"emra_modified_date" json:"emraModifiedDate"`
}

type JobhireJobCategory struct {
	JocaID           int32          `db:"joca_id" json:"jocaId"`
	JocaName         sql.NullString `db:"joca_name" json:"jocaName"`
	JocaModifiedDate sql.NullTime   `db:"joca_modified_date" json:"jocaModifiedDate"`
}

type JobhireJobPhoto struct {
	JophoID           int32          `db:"jopho_id" json:"jophoId"`
	JophoFilename     sql.NullString `db:"jopho_filename" json:"jophoFilename"`
	JophoFilesize     sql.NullInt32  `db:"jopho_filesize" json:"jophoFilesize"`
	JophoFiletype     sql.NullString `db:"jopho_filetype" json:"jophoFiletype"`
	JophoModifiedDate sql.NullTime   `db:"jopho_modified_date" json:"jophoModifiedDate"`
	JophoEntityID     sql.NullInt32  `db:"jopho_entity_id" json:"jophoEntityId"`
}

type JobhireJobPost struct {
	JopoEntityID       int32          `db:"jopo_entity_id" json:"jopoEntityId"`
	JopoNumber         sql.NullString `db:"jopo_number" json:"jopoNumber"`
	JopoTitle          sql.NullString `db:"jopo_title" json:"jopoTitle"`
	JopoStartDate      sql.NullTime   `db:"jopo_start_date" json:"jopoStartDate"`
	JopoEndDate        sql.NullTime   `db:"jopo_end_date" json:"jopoEndDate"`
	JopoMinSalary      sql.NullString `db:"jopo_min_salary" json:"jopoMinSalary"`
	JopoMaxSalary      sql.NullString `db:"jopo_max_salary" json:"jopoMaxSalary"`
	JopoMinExperience  sql.NullInt32  `db:"jopo_min_experience" json:"jopoMinExperience"`
	JopoMaxExperience  sql.NullInt32  `db:"jopo_max_experience" json:"jopoMaxExperience"`
	JopoPrimarySkill   sql.NullString `db:"jopo_primary_skill" json:"jopoPrimarySkill"`
	JopoSecondarySkill sql.NullString `db:"jopo_secondary_skill" json:"jopoSecondarySkill"`
	JopoPublishDate    sql.NullTime   `db:"jopo_publish_date" json:"jopoPublishDate"`
	JopoModifiedDate   sql.NullTime   `db:"jopo_modified_date" json:"jopoModifiedDate"`
	JopoEmpEntityID    sql.NullInt32  `db:"jopo_emp_entity_id" json:"jopoEmpEntityId"`
	JopoClitID         sql.NullInt32  `db:"jopo_clit_id" json:"jopoClitId"`
	JopoJoroID         sql.NullInt32  `db:"jopo_joro_id" json:"jopoJoroId"`
	JopoJotyID         sql.NullInt32  `db:"jopo_joty_id" json:"jopoJotyId"`
	JopoJocaID         sql.NullInt32  `db:"jopo_joca_id" json:"jopoJocaId"`
	JopoAddrID         sql.NullInt32  `db:"jopo_addr_id" json:"jopoAddrId"`
	JopoWorkCode       sql.NullString `db:"jopo_work_code" json:"jopoWorkCode"`
	JopoEduCode        sql.NullString `db:"jopo_edu_code" json:"jopoEduCode"`
	JopoInduCode       sql.NullString `db:"jopo_indu_code" json:"jopoInduCode"`
	JopoStatus         sql.NullString `db:"jopo_status" json:"jopoStatus"`
}

type JobhireJobPostDesc struct {
	JopoEntityID       int32                 `db:"jopo_entity_id" json:"jopoEntityId"`
	JopoDescription    sql.NullString `db:"jopo_description" json:"jopoDescription"`
	JopoResponsibility sql.NullString `db:"jopo_responsibility" json:"jopoResponsibility"`
	JopoTarget         sql.NullString `db:"jopo_target" json:"jopoTarget"`
	JopoBenefit        sql.NullString `db:"jopo_benefit" json:"jopoBenefit"`
}

type JobhireTalentApply struct {
	TaapUserEntityID int32          `db:"taap_user_entity_id" json:"taapUserEntityId"`
	TaapEntityID     int32          `db:"taap_entity_id" json:"taapEntityId"`
	TaapIntro        sql.NullString `db:"taap_intro" json:"taapIntro"`
	TaapScoring      sql.NullInt32  `db:"taap_scoring" json:"taapScoring"`
	TaapModifiedDate sql.NullTime   `db:"taap_modified_date" json:"taapModifiedDate"`
	TaapStatus       sql.NullString `db:"taap_status" json:"taapStatus"`
}

type JobhireTalentApplyProgress struct {
	TaprID           int32          `db:"tapr_id" json:"taprId"`
	TaapUserEntityID int32          `db:"taap_user_entity_id" json:"taapUserEntityId"`
	TaapEntityID     int32          `db:"taap_entity_id" json:"taapEntityId"`
	TaprModifiedDate sql.NullTime   `db:"tapr_modified_date" json:"taprModifiedDate"`
	TaprStatus       sql.NullString `db:"tapr_status" json:"taprStatus"`
	TaprComment      sql.NullString `db:"tapr_comment" json:"taprComment"`
	TaprProgressName sql.NullString `db:"tapr_progress_name" json:"taprProgressName"`
}
