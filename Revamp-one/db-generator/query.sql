-- name: GetBatch :one 
SELECT * FROM bootcamp.batch
WHERE batch_id = $1;

-- name: ListBatchs :many
SELECT * FROM bootcamp.batch
ORDER BY batch_name;

-- name: CreateBatch :one
INSERT INTO bootcamp.batch
(batch_id, batch_entity_id, batch_name, batch_description, batch_start_date, batch_end_date, batch_reason, batch_type, batch_modified_date, batch_status, batch_pic_id)
VALUES ($1, $2, $3, $4, $5, $6, $7, $8, $9, $10, $11)
RETURNING batch_id;

-- name: DeleteBatch :exec
DELETE  FROM bootcamp.batch
WHERE batch_id = $1;

-- name: UpdateBatch :exec
UPDATE bootcamp.batch
SET batch_name = $2,
    batch_description = $3
WHERE batch_id = $1;

-- name: GetBatchTrainee :one
SELECT * FROM bootcamp.batch_trainee
WHERE batr_id = $1;

-- name: ListBatchTrinee :many
SELECT * FROM bootcamp.batch_trainee
ORDER BY batr_id;

-- name: CreateBatchTrainee :one
INSERT INTO bootcamp.batch_trainee
(batr_id, batr_status, batr_certificated, batre_certificate_link, batr_access_token, batr_access_grant, batr_review, batr_total_score, batr_modified_date, batr_trainee_entity_id, batr_batch_id)
VALUES ($1, $2, $3, $4, $5, $6, $7, $8, $9, $10, $11)
RETURNING batr_id;

-- name: DeleteBatchTrainee :exec
DELETE FROM bootcamp.batch_trainee
WHERE batr_id = $1;

-- name: UpdateBatchTrainee :exec
UPDATE bootcamp.batch_trainee
SET batr_status = $2,
    batr_review = $3
WHERE batr_id = $1;

-- name: GetBatchTraineeEvaluation :one
SELECT * FROM bootcamp.batch_trainee_evaluation
WHERE btev_id = $1;

-- name: ListBatchTraineeEvaluations :many
SELECT * FROM bootcamp.batch_trainee_evaluation
ORDER BY btev_id;

-- name: CreateBatchTraineeEvaluation :one
INSERT INTO bootcamp.batch_trainee_evaluation
(btev_id, btev_type, btev_header, btev_section, btev_skill, btev_week, btev_skor, btev_note, btev_modified_date, btev_batch_id, btev_trainee_entity_id)
VALUES ($1, $2, $3, $4, $5, $6, $7, $8, $9, $10, $11)
RETURNING btev_id;

-- name: DeleteBatchTraineeEvaluation :exec
DELETE FROM bootcamp.batch_trainee_evaluation
WHERE btev_id = $1;

-- name: UpdateBatchTraineeEvaluation :exec
UPDATE bootcamp.batch_trainee_evaluation
SET btev_type = $2,
    btev_header = $3
WHERE btev_id = $1;

-- name: GetInstructorProgram :one
SELECT * FROM bootcamp.instructor_programs
WHERE batch_id = $1;

-- name: ListInstructorPrograms :many
SELECT * FROM bootcamp.instructor_programs
ORDER BY batch_id;

-- name: CreateInstructorProgram :one
INSERT INTO bootcamp.instructor_programs
(batch_id, inpro_entity_id, inpro_emp_entity_id, inpro_modified_date)
VALUES ($1, $2, $3, $4)
RETURNING batch_id;

-- name: DeleteInstructorProgram :exec
DELETE FROM bootcamp.instructor_programs
WHERE batch_id = $1;

-- name: UpdateInstructorProgram :exec
UPDATE bootcamp.instructor_programs
SET inpro_entity_id = $2,
    inpro_modified_date = $3
WHERE batch_id = $1;

-- name: GetProgramApply :one
SELECT * FROM bootcamp.program_apply
WHERE prap_user_entity_id = $1;

-- name: ListProgramApplies :many
SELECT * FROM bootcamp.program_apply
ORDER BY prap_user_entity_id;

-- name: CreateProgramApply :one
INSERT INTO bootcamp.program_apply
(prap_user_entity_id, prap_prog_entity_id, prap_test_score, prap_gpa, prap_iq_test, prap_review, prap_modified_date, prap_status)
VALUES ($1, $2, $3, $4, $5, $6, $7, $8)
RETURNING prap_user_entity_id;

-- name: DeleteProgramApply :exec
DELETE FROM bootcamp.program_apply
WHERE prap_user_entity_id = $1;

-- name: UpdateProgramApply :exec
UPDATE bootcamp.program_apply
SET prap_prog_entity_id = $2,
    prap_modified_date = $3
WHERE prap_user_entity_id = $1;

-- name: GetProgramApplyProgress :one
SELECT * FROM bootcamp.program_apply_progress
WHERE parog_id = $1;

-- name: ListProgramApplyProgresses :many
SELECT * FROM bootcamp.program_apply_progress
ORDER BY parog_id;

-- name: CreateProgramApplyProgress :one
INSERT INTO bootcamp.program_apply_progress
(parog_id, parog_user_entity_id, parog_prog_entity_id, parog_action_date, parog_modified_date, parog_comment, parog_progress_name, parog_emp_entity_id, parog_status)
VALUES ($1, $2, $3, $4, $5, $6, $7, $8, $9)
RETURNING parog_id;

-- name: DeleteProgramApplyProgress :exec
DELETE FROM bootcamp.program_apply_progress
WHERE parog_id = $1;

-- name: UpdateProgramApplyProgress :exec
UPDATE bootcamp.program_apply_progress
SET parog_user_entity_id = $2,
    parog_modified_date = $3
WHERE parog_id = $1;