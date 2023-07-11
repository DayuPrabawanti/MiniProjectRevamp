-- JobHireClient

-- name: Getclient :one
SELECT * FROM jobhire.client
  WHERE clit_id = $1;

-- name: ListClient :many
SELECT * FROM jobhire.client
    ORDER BY clit_name;

-- name: CreateClient :one

INSERT INTO jobhire.client (clit_id, clit_name, clit_about, clit_modified_date, clit_addr_id, clit_emra_id)
 VALUES 
 ($1,$2,$3,$4,$5,$6)
RETURNING clit_id;

-- name: DeleteClient :exec
      DELETE FROM jobhire.client
  WHERE clit_id = $1;


UPDATE jobhire.client
      set clit_name = $2,
        clit_about = $3,
        clit_modified_date = $4,
        clit_addr_id = $5,
        clit_emra_id = $6
  WHERE clit_id = $1;

  
-- JOBHIRE CATEGORY --

-- name: Getjob_Category :one

SELECT * FROM jobhire.job_category
  WHERE joca_id = $1;

-- name: ListjobCategory :many
SELECT * FROM jobhire.job_category
    ORDER BY joca_name;

-- name: CreateCategory :one

INSERT INTO jobhire.job_category (joca_id, joca_name, joca_modified_date)
 VALUES 
 ($1,$2,$3)
 RETURNING joca_id;

-- name: DeleteCategory :exec
DELETE FROM jobhire.job_category
  WHERE joca_id = $1;


UPDATE jobhire.job_category
      set joca_name = $2,
        joca_modified_date = $3
WHERE joca_id = $1;


-- JOBHIRE JOB POST--

-- name: GetJopo :one
SELECT * FROM jobhire.job_post
  WHERE jopo_entity_id = $1;

-- name: Listjob_post :many
SELECT * FROM jobhire.job_post
    ORDER BY jopo_number;

-- name: CreateJopo :one

  INSERT INTO jobhire.job_post (jopo_entity_id, jopo_number, jopo_title, jopo_start_date, jopo_end_date, jopo_min_salary, jopo_max_salary, jopo_min_experience, jopo_max_experience, jopo_primary_skill, jopo_secondary_skill, jopo_publish_date, jopo_modified_date, jopo_emp_entity_id, jopo_clit_id, jopo_joro_id, jopo_joty_id, jopo_joca_id, jopo_addr_id, jopo_work_code, jopo_edu_code, jopo_indu_code, jopo_status) 
    VALUES 
      ($1,$2,$3,$4,$5,$6,$7,$8,$9,$10,$11,$12,$13,$14,$15,$16,$17,$18,$19,$20,$21,$22,$23)
RETURNING jopo_entity_id;



-- name: Deletejob_post :exec
DELETE FROM jobhire.job_post
  WHERE jopo_entity_id = $1;


UPDATE jobhire.job_post
      set jopo_number = $2,
        jopo_title = $3,
         jopo_start_date = $4, 
          jopo_end_date = $5,
           jopo_min_salary = $6,
            jopo_max_salary = $7,
             jopo_min_experience = $8,
              jopo_max_experience = $9,
               jopo_primary_skill = $10,
                jopo_secondary_skill = $11, 
                jopo_publish_date = $12,
                 jopo_modified_date = $13, 
                 jopo_emp_entity_id = $14,
                  jopo_clit_id = $15,
                   jopo_joro_id = $16,
                    jopo_joty_id = $17,
                     jopo_joca_id = $18,
                      jopo_addr_id = $19,
                       jopo_work_code = $20,
                        jopo_edu_code = $21,
                         jopo_indu_code = $22,
                          jopo_status = $23

WHERE jopo_entity_id = $1;


-- jobPostDesc


SELECT * FROM jobhire.job_post_desc
  WHERE jopo_entity_id = $1;

SELECT * FROM jobhire.job_post_desc
    ORDER BY jopo_responsibility;

INSERT INTO jobhire.job_post_desc (jopo_entity_id, jopo_description, jopo_responsibility, jopo_target, jopo_benefit)
    VALUES 
        ($1,$2,$3,$4,$5)
        RETURNING jopo_entity_id;

DELETE FROM jobhire.job_post_desc
  WHERE jopo_entity_id = $1;


UPDATE jobhire.job_post_desc
      set jopo_description = $2,
        jopo_responsibility = $3,
        jopo_target = $4,
        jopo_benefit =$5

WHERE jopo_entity_id = $1;


-- jobhire.talent_apply


SELECT * FROM  jobhire.talent_apply
  WHERE taap_user_entity_id = $1;

SELECT * FROM jobhire.talent_apply
  ORDER BY taap_entity_id;

INSERT INTO jobhire.talent_apply (taap_user_entity_id, taap_entity_id, taap_intro, taap_scoring, taap_modified_date, taap_status) 
  VALUES
    ($1,$2,$3,$4,$5,$6)
    RETURNING taap_user_entity_id;

DELETE FROM jobhire.talent_apply 
  where taap_user_entity_id = $1;

UPDATE jobhire.talent_apply
  SET 
   taap_entity_id = $2,
    taap_intro = $3,
     taap_scoring = $4,
      taap_modified_date = $5,
       taap_status = $6  

WHERE taap_user_entity_id = $1;


-- jobhire.talent_apply_progress

SELECT * FROM  jobhire.talent_apply_progress
  WHERE tapr_id = $1;

SELECT * FROM jobhire.talent_apply_progress
  ORDER BY taap_entity_id;

INSERT INTO jobhire.talent_apply_progress (tapr_id, taap_user_entity_id, taap_entity_id, tapr_modified_date, tapr_status, tapr_comment, tapr_progress_name) 
  VALUES ($1,$2,$3,$4,$5,$6,$7)
  RETURNING tapr_id;

  DELETE FROM jobhire.talent_apply_progress 
  where taap_user_entity_id = $1;

  UPDATE jobhire.talent_apply_progress
    SET  
    taap_user_entity_id = $2, 
    taap_entity_id = $3, 
    tapr_modified_date = $4, 
    tapr_status = $5, 
    tapr_comment = $6, 
    tapr_progress_name = $7

  WHERE tapr_id = $1;


