
--
-- Name: jobhire; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA jobhire;


ALTER SCHEMA jobhire OWNER TO postgres;
--
-- Name: client; Type: TABLE; Schema: jobhire; Owner: postgres
--

CREATE TABLE jobhire.client (
    clit_id integer NOT NULL,
    clit_name character varying(256),
    clit_about character varying(512),
    clit_modified_date timestamp without time zone,
    clit_addr_id integer,
    clit_emra_id integer
);


ALTER TABLE jobhire.client OWNER TO postgres;

--
-- Name: employee_range; Type: TABLE; Schema: jobhire; Owner: postgres
--

CREATE TABLE jobhire.employee_range (
    emra_id integer NOT NULL,
    emra_range_min integer,
    emra_range_max integer,
    emra_modified_date timestamp without time zone
);


ALTER TABLE jobhire.employee_range OWNER TO postgres;

--
-- Name: employee_range_emra_id_seq; Type: SEQUENCE; Schema: jobhire; Owner: postgres
--

CREATE SEQUENCE jobhire.employee_range_emra_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE jobhire.employee_range_emra_id_seq OWNER TO postgres;

--
-- Name: employee_range_emra_id_seq; Type: SEQUENCE OWNED BY; Schema: jobhire; Owner: postgres
--

ALTER SEQUENCE jobhire.employee_range_emra_id_seq OWNED BY jobhire.employee_range.emra_id;


--
-- Name: job_category; Type: TABLE; Schema: jobhire; Owner: postgres
--

CREATE TABLE jobhire.job_category (
    joca_id integer NOT NULL,
    joca_name character varying(255),
    joca_modified_date timestamp without time zone
);


ALTER TABLE jobhire.job_category OWNER TO postgres;

--
-- Name: job_category_joca_id_seq; Type: SEQUENCE; Schema: jobhire; Owner: postgres
--

CREATE SEQUENCE jobhire.job_category_joca_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE jobhire.job_category_joca_id_seq OWNER TO postgres;

--
-- Name: job_category_joca_id_seq; Type: SEQUENCE OWNED BY; Schema: jobhire; Owner: postgres
--

ALTER SEQUENCE jobhire.job_category_joca_id_seq OWNED BY jobhire.job_category.joca_id;


--
-- Name: job_photo; Type: TABLE; Schema: jobhire; Owner: postgres
--

CREATE TABLE jobhire.job_photo (
    jopho_id integer NOT NULL,
    jopho_filename character varying(55),
    jopho_filesize integer,
    jopho_filetype character varying(15),
    jopho_modified_date timestamp without time zone,
    jopho_entity_id integer,
    CONSTRAINT job_photo_jopho_filetype_check CHECK (((jopho_filetype)::text = ANY ((ARRAY['png'::character varying, 'jpeg'::character varying])::text[])))
);


ALTER TABLE jobhire.job_photo OWNER TO postgres;

--
-- Name: job_photo_jopho_id_seq; Type: SEQUENCE; Schema: jobhire; Owner: postgres
--

CREATE SEQUENCE jobhire.job_photo_jopho_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE jobhire.job_photo_jopho_id_seq OWNER TO postgres;

--
-- Name: job_photo_jopho_id_seq; Type: SEQUENCE OWNED BY; Schema: jobhire; Owner: postgres
--

ALTER SEQUENCE jobhire.job_photo_jopho_id_seq OWNED BY jobhire.job_photo.jopho_id;


--
-- Name: job_post; Type: TABLE; Schema: jobhire; Owner: postgres
--

CREATE TABLE jobhire.job_post (
    jopo_entity_id integer NOT NULL,
    jopo_number character varying(25),
    jopo_title character varying(256),
    jopo_start_date timestamp without time zone,
    jopo_end_date timestamp without time zone,
    jopo_min_salary money,
    jopo_max_salary money,
    jopo_min_experience integer,
    jopo_max_experience integer,
    jopo_primary_skill character varying(256),
    jopo_secondary_skill character varying(256),
    jopo_publish_date timestamp without time zone,
    jopo_modified_date timestamp without time zone,
    jopo_emp_entity_id integer,
    jopo_clit_id integer,
    jopo_joro_id integer,
    jopo_joty_id integer,
    jopo_joca_id integer,
    jopo_addr_id integer,
    jopo_work_code character varying(15),
    jopo_edu_code character varying(5),
    jopo_indu_code character varying(15),
    jopo_status character varying(15)
);


ALTER TABLE jobhire.job_post OWNER TO postgres;

--
-- Name: job_post_desc; Type: TABLE; Schema: jobhire; Owner: postgres
--

CREATE TABLE jobhire.job_post_desc (
    jopo_entity_id integer NOT NULL,
    jopo_description json,
    jopo_responsibility json,
    jopo_target json,
    jopo_benefit json
);


ALTER TABLE jobhire.job_post_desc OWNER TO postgres;

--
-- Name: job_post_jopo_entity_id_seq; Type: SEQUENCE; Schema: jobhire; Owner: postgres
--

CREATE SEQUENCE jobhire.job_post_jopo_entity_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE jobhire.job_post_jopo_entity_id_seq OWNER TO postgres;

--
-- Name: job_post_jopo_entity_id_seq; Type: SEQUENCE OWNED BY; Schema: jobhire; Owner: postgres
--

ALTER SEQUENCE jobhire.job_post_jopo_entity_id_seq OWNED BY jobhire.job_post.jopo_entity_id;


--
-- Name: talent_apply; Type: TABLE; Schema: jobhire; Owner: postgres
--

CREATE TABLE jobhire.talent_apply (
    taap_user_entity_id integer NOT NULL,
    taap_entity_id integer NOT NULL,
    taap_intro character varying(512),
    taap_scoring integer,
    taap_modified_date timestamp without time zone,
    taap_status character varying(15)
);


ALTER TABLE jobhire.talent_apply OWNER TO postgres;

--
-- Name: talent_apply_progress; Type: TABLE; Schema: jobhire; Owner: postgres
--

CREATE TABLE jobhire.talent_apply_progress (
    tapr_id integer NOT NULL,
    taap_user_entity_id integer NOT NULL,
    taap_entity_id integer NOT NULL,
    tapr_modified_date timestamp without time zone,
    tapr_status character varying(15),
    tapr_comment character varying(256),
    tapr_progress_name character varying(55),
    CONSTRAINT talent_apply_progress_tapr_status_check CHECK (((tapr_status)::text = ANY ((ARRAY['open'::character varying, 'waiting'::character varying, 'done'::character varying, 'cancelled'::character varying, 'closed'::character varying])::text[])))
);


ALTER TABLE jobhire.talent_apply_progress OWNER TO postgres;

--
-- Name: talent_apply_progress_tapr_id_seq; Type: SEQUENCE; Schema: jobhire; Owner: postgres
--

CREATE SEQUENCE jobhire.talent_apply_progress_tapr_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE jobhire.talent_apply_progress_tapr_id_seq OWNER TO postgres;

--
-- Name: talent_apply_progress_tapr_id_seq; Type: SEQUENCE OWNED BY; Schema: jobhire; Owner: postgres
--

ALTER SEQUENCE jobhire.talent_apply_progress_tapr_id_seq OWNED BY jobhire.talent_apply_progress.tapr_id;

