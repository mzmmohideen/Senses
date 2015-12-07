--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: auth_group; Type: TABLE; Schema: public; Owner: root; Tablespace: 
--

CREATE TABLE auth_group (
    id integer NOT NULL,
    name character varying(80) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO root;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE auth_group_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_id_seq OWNER TO root;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE auth_group_id_seq OWNED BY auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: root; Tablespace: 
--

CREATE TABLE auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO root;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE auth_group_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_permissions_id_seq OWNER TO root;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE auth_group_permissions_id_seq OWNED BY auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: root; Tablespace: 
--

CREATE TABLE auth_permission (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO root;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE auth_permission_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_permission_id_seq OWNER TO root;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE auth_permission_id_seq OWNED BY auth_permission.id;


--
-- Name: auth_user; Type: TABLE; Schema: public; Owner: root; Tablespace: 
--

CREATE TABLE auth_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone NOT NULL,
    is_superuser boolean NOT NULL,
    username character varying(30) NOT NULL,
    first_name character varying(30) NOT NULL,
    last_name character varying(30) NOT NULL,
    email character varying(75) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL
);


ALTER TABLE public.auth_user OWNER TO root;

--
-- Name: auth_user_groups; Type: TABLE; Schema: public; Owner: root; Tablespace: 
--

CREATE TABLE auth_user_groups (
    id integer NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.auth_user_groups OWNER TO root;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE auth_user_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_groups_id_seq OWNER TO root;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE auth_user_groups_id_seq OWNED BY auth_user_groups.id;


--
-- Name: auth_user_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE auth_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_id_seq OWNER TO root;

--
-- Name: auth_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE auth_user_id_seq OWNED BY auth_user.id;


--
-- Name: auth_user_user_permissions; Type: TABLE; Schema: public; Owner: root; Tablespace: 
--

CREATE TABLE auth_user_user_permissions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_user_user_permissions OWNER TO root;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE auth_user_user_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_user_permissions_id_seq OWNER TO root;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE auth_user_user_permissions_id_seq OWNED BY auth_user_user_permissions.id;


--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: root; Tablespace: 
--

CREATE TABLE django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    user_id integer NOT NULL,
    content_type_id integer,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


ALTER TABLE public.django_admin_log OWNER TO root;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE django_admin_log_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_admin_log_id_seq OWNER TO root;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE django_admin_log_id_seq OWNED BY django_admin_log.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: root; Tablespace: 
--

CREATE TABLE django_content_type (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO root;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE django_content_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_content_type_id_seq OWNER TO root;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE django_content_type_id_seq OWNED BY django_content_type.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: root; Tablespace: 
--

CREATE TABLE django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO root;

--
-- Name: django_site; Type: TABLE; Schema: public; Owner: root; Tablespace: 
--

CREATE TABLE django_site (
    id integer NOT NULL,
    domain character varying(100) NOT NULL,
    name character varying(50) NOT NULL
);


ALTER TABLE public.django_site OWNER TO root;

--
-- Name: django_site_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE django_site_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_site_id_seq OWNER TO root;

--
-- Name: django_site_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE django_site_id_seq OWNED BY django_site.id;


--
-- Name: senses_chronicdisease; Type: TABLE; Schema: public; Owner: root; Tablespace: 
--

CREATE TABLE senses_chronicdisease (
    id integer NOT NULL,
    member_id integer,
    disease_name_id integer NOT NULL,
    doctor_name character varying(50),
    cost character varying(20),
    hospital_name character varying(50),
    status boolean NOT NULL,
    details character varying(300)
);


ALTER TABLE public.senses_chronicdisease OWNER TO root;

--
-- Name: senses_chronicdisease_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE senses_chronicdisease_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.senses_chronicdisease_id_seq OWNER TO root;

--
-- Name: senses_chronicdisease_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE senses_chronicdisease_id_seq OWNED BY senses_chronicdisease.id;


--
-- Name: senses_condition; Type: TABLE; Schema: public; Owner: root; Tablespace: 
--

CREATE TABLE senses_condition (
    id integer NOT NULL,
    field character varying(50),
    conditions character varying(20),
    value character varying(20)
);


ALTER TABLE public.senses_condition OWNER TO root;

--
-- Name: senses_condition_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE senses_condition_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.senses_condition_id_seq OWNER TO root;

--
-- Name: senses_condition_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE senses_condition_id_seq OWNED BY senses_condition.id;


--
-- Name: senses_disease; Type: TABLE; Schema: public; Owner: root; Tablespace: 
--

CREATE TABLE senses_disease (
    id integer NOT NULL,
    sym_type character varying(30) NOT NULL,
    disease_name character varying(100) NOT NULL,
    disease_id character varying(25) NOT NULL,
    description text
);


ALTER TABLE public.senses_disease OWNER TO root;

--
-- Name: senses_disease_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE senses_disease_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.senses_disease_id_seq OWNER TO root;

--
-- Name: senses_disease_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE senses_disease_id_seq OWNED BY senses_disease.id;


--
-- Name: senses_district; Type: TABLE; Schema: public; Owner: root; Tablespace: 
--

CREATE TABLE senses_district (
    id integer NOT NULL,
    district_name character varying(50) NOT NULL,
    district_code character varying(10) NOT NULL
);


ALTER TABLE public.senses_district OWNER TO root;

--
-- Name: senses_district_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE senses_district_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.senses_district_id_seq OWNER TO root;

--
-- Name: senses_district_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE senses_district_id_seq OWNED BY senses_district.id;


--
-- Name: senses_family; Type: TABLE; Schema: public; Owner: root; Tablespace: 
--

CREATE TABLE senses_family (
    id integer NOT NULL,
    muhalla_id integer NOT NULL,
    family_id character varying(30) NOT NULL,
    ration_card character varying(30) NOT NULL,
    address character varying(200) NOT NULL,
    mobile character varying(50),
    donor boolean NOT NULL,
    report_date timestamp with time zone NOT NULL,
    volunteer boolean NOT NULL,
    language character varying(30),
    health_insurance boolean NOT NULL,
    family_needs text,
    house_type character varying(50) NOT NULL,
    house_cat character varying(30),
    toilet boolean NOT NULL,
    financial_status character varying(50) NOT NULL
);


ALTER TABLE public.senses_family OWNER TO root;

--
-- Name: senses_family_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE senses_family_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.senses_family_id_seq OWNER TO root;

--
-- Name: senses_family_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE senses_family_id_seq OWNED BY senses_family.id;


--
-- Name: senses_masjid; Type: TABLE; Schema: public; Owner: root; Tablespace: 
--

CREATE TABLE senses_masjid (
    id integer NOT NULL,
    taluk_id integer NOT NULL,
    district_id integer NOT NULL,
    mohalla_id character varying(20),
    name character varying(70) NOT NULL,
    musallas character varying(20) NOT NULL,
    location character varying(30) NOT NULL
);


ALTER TABLE public.senses_masjid OWNER TO root;

--
-- Name: senses_masjid_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE senses_masjid_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.senses_masjid_id_seq OWNER TO root;

--
-- Name: senses_masjid_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE senses_masjid_id_seq OWNED BY senses_masjid.id;


--
-- Name: senses_masjid_members; Type: TABLE; Schema: public; Owner: root; Tablespace: 
--

CREATE TABLE senses_masjid_members (
    id integer NOT NULL,
    masjid_id integer NOT NULL,
    member_name character varying(30) NOT NULL,
    age character varying(30) NOT NULL,
    email character varying(60),
    mobile character varying(20) NOT NULL,
    is_availonwhatsapp boolean NOT NULL,
    is_coordinator boolean NOT NULL,
    address character varying(50) NOT NULL,
    designation character varying(20) NOT NULL
);


ALTER TABLE public.senses_masjid_members OWNER TO root;

--
-- Name: senses_masjid_members_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE senses_masjid_members_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.senses_masjid_members_id_seq OWNER TO root;

--
-- Name: senses_masjid_members_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE senses_masjid_members_id_seq OWNED BY senses_masjid_members.id;


--
-- Name: senses_medical; Type: TABLE; Schema: public; Owner: root; Tablespace: 
--

CREATE TABLE senses_medical (
    id integer NOT NULL,
    member_id integer,
    disease_id integer NOT NULL,
    medicine_needs character varying(200),
    cost character varying(20),
    monthly_expend character varying(30)
);


ALTER TABLE public.senses_medical OWNER TO root;

--
-- Name: senses_medical_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE senses_medical_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.senses_medical_id_seq OWNER TO root;

--
-- Name: senses_medical_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE senses_medical_id_seq OWNED BY senses_medical.id;


--
-- Name: senses_member; Type: TABLE; Schema: public; Owner: root; Tablespace: 
--

CREATE TABLE senses_member (
    id integer NOT NULL,
    muhalla_id integer NOT NULL,
    taluk_id integer NOT NULL,
    district_id integer NOT NULL,
    mem_id character varying(20) NOT NULL,
    name character varying(50) NOT NULL,
    gender character varying(10) NOT NULL,
    dateofbirth timestamp with time zone NOT NULL,
    age integer NOT NULL,
    "Relation" character varying(20) NOT NULL,
    family_head boolean NOT NULL,
    marital_status character varying(20) NOT NULL,
    qualification character varying(100),
    mother_tongue character varying(20),
    disability boolean NOT NULL,
    alive boolean NOT NULL,
    voter_status boolean NOT NULL,
    family_id integer NOT NULL,
    donor boolean NOT NULL,
    quran_reading boolean NOT NULL,
    namaz character varying(30) NOT NULL,
    mobile character varying(30),
    volunteer boolean NOT NULL,
    occupation character varying(30),
    curr_location character varying(20) NOT NULL,
    "Makthab" boolean NOT NULL,
    madarasa_details character varying(50),
    mem_age_month integer NOT NULL
);


ALTER TABLE public.senses_member OWNER TO root;

--
-- Name: senses_member_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE senses_member_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.senses_member_id_seq OWNER TO root;

--
-- Name: senses_member_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE senses_member_id_seq OWNED BY senses_member.id;


--
-- Name: senses_member_scheme; Type: TABLE; Schema: public; Owner: root; Tablespace: 
--

CREATE TABLE senses_member_scheme (
    id integer NOT NULL,
    member_id integer,
    scheme_id integer,
    status boolean NOT NULL,
    solution character varying(20) NOT NULL
);


ALTER TABLE public.senses_member_scheme OWNER TO root;

--
-- Name: senses_member_scheme_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE senses_member_scheme_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.senses_member_scheme_id_seq OWNER TO root;

--
-- Name: senses_member_scheme_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE senses_member_scheme_id_seq OWNED BY senses_member_scheme.id;


--
-- Name: senses_member_service; Type: TABLE; Schema: public; Owner: root; Tablespace: 
--

CREATE TABLE senses_member_service (
    id integer NOT NULL,
    member_id integer,
    scheme_id integer,
    status boolean NOT NULL,
    solution character varying(20) NOT NULL
);


ALTER TABLE public.senses_member_service OWNER TO root;

--
-- Name: senses_member_service_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE senses_member_service_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.senses_member_service_id_seq OWNER TO root;

--
-- Name: senses_member_service_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE senses_member_service_id_seq OWNED BY senses_member_service.id;


--
-- Name: senses_scheme; Type: TABLE; Schema: public; Owner: root; Tablespace: 
--

CREATE TABLE senses_scheme (
    id integer NOT NULL,
    scheme_type character varying(50) NOT NULL
);


ALTER TABLE public.senses_scheme OWNER TO root;

--
-- Name: senses_scheme_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE senses_scheme_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.senses_scheme_id_seq OWNER TO root;

--
-- Name: senses_scheme_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE senses_scheme_id_seq OWNED BY senses_scheme.id;


--
-- Name: senses_sensesmembers; Type: TABLE; Schema: public; Owner: root; Tablespace: 
--

CREATE TABLE senses_sensesmembers (
    id integer NOT NULL,
    user_id integer NOT NULL,
    member_type character varying(30) NOT NULL,
    masjid_id integer NOT NULL
);


ALTER TABLE public.senses_sensesmembers OWNER TO root;

--
-- Name: senses_sensesmembers_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE senses_sensesmembers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.senses_sensesmembers_id_seq OWNER TO root;

--
-- Name: senses_sensesmembers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE senses_sensesmembers_id_seq OWNED BY senses_sensesmembers.id;


--
-- Name: senses_service; Type: TABLE; Schema: public; Owner: root; Tablespace: 
--

CREATE TABLE senses_service (
    id integer NOT NULL,
    service_id character varying(20) NOT NULL,
    name character varying(50) NOT NULL,
    description text
);


ALTER TABLE public.senses_service OWNER TO root;

--
-- Name: senses_service_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE senses_service_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.senses_service_id_seq OWNER TO root;

--
-- Name: senses_service_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE senses_service_id_seq OWNED BY senses_service.id;


--
-- Name: senses_subscheme; Type: TABLE; Schema: public; Owner: root; Tablespace: 
--

CREATE TABLE senses_subscheme (
    id integer NOT NULL,
    scheme_id integer NOT NULL,
    subscheme_id character varying(20) NOT NULL,
    name character varying(100) NOT NULL,
    description character varying(30)
);


ALTER TABLE public.senses_subscheme OWNER TO root;

--
-- Name: senses_subscheme_conditions; Type: TABLE; Schema: public; Owner: root; Tablespace: 
--

CREATE TABLE senses_subscheme_conditions (
    id integer NOT NULL,
    subscheme_id integer NOT NULL,
    condition_id integer NOT NULL
);


ALTER TABLE public.senses_subscheme_conditions OWNER TO root;

--
-- Name: senses_subscheme_conditions_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE senses_subscheme_conditions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.senses_subscheme_conditions_id_seq OWNER TO root;

--
-- Name: senses_subscheme_conditions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE senses_subscheme_conditions_id_seq OWNED BY senses_subscheme_conditions.id;


--
-- Name: senses_subscheme_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE senses_subscheme_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.senses_subscheme_id_seq OWNER TO root;

--
-- Name: senses_subscheme_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE senses_subscheme_id_seq OWNED BY senses_subscheme.id;


--
-- Name: senses_surgery; Type: TABLE; Schema: public; Owner: root; Tablespace: 
--

CREATE TABLE senses_surgery (
    id integer NOT NULL,
    surgery_name character varying(50),
    member_id integer,
    disease_id integer NOT NULL,
    hospital_name character varying(50),
    cost character varying(20),
    "cash_inHand" character varying(20),
    details text
);


ALTER TABLE public.senses_surgery OWNER TO root;

--
-- Name: senses_surgery_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE senses_surgery_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.senses_surgery_id_seq OWNER TO root;

--
-- Name: senses_surgery_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE senses_surgery_id_seq OWNED BY senses_surgery.id;


--
-- Name: senses_taluk; Type: TABLE; Schema: public; Owner: root; Tablespace: 
--

CREATE TABLE senses_taluk (
    id integer NOT NULL,
    district_id integer NOT NULL,
    taluk_name character varying(30) NOT NULL
);


ALTER TABLE public.senses_taluk OWNER TO root;

--
-- Name: senses_taluk_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE senses_taluk_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.senses_taluk_id_seq OWNER TO root;

--
-- Name: senses_taluk_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE senses_taluk_id_seq OWNED BY senses_taluk.id;


--
-- Name: south_migrationhistory; Type: TABLE; Schema: public; Owner: root; Tablespace: 
--

CREATE TABLE south_migrationhistory (
    id integer NOT NULL,
    app_name character varying(255) NOT NULL,
    migration character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.south_migrationhistory OWNER TO root;

--
-- Name: south_migrationhistory_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE south_migrationhistory_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.south_migrationhistory_id_seq OWNER TO root;

--
-- Name: south_migrationhistory_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE south_migrationhistory_id_seq OWNED BY south_migrationhistory.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY auth_group ALTER COLUMN id SET DEFAULT nextval('auth_group_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('auth_group_permissions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY auth_permission ALTER COLUMN id SET DEFAULT nextval('auth_permission_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY auth_user ALTER COLUMN id SET DEFAULT nextval('auth_user_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY auth_user_groups ALTER COLUMN id SET DEFAULT nextval('auth_user_groups_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('auth_user_user_permissions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY django_admin_log ALTER COLUMN id SET DEFAULT nextval('django_admin_log_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY django_content_type ALTER COLUMN id SET DEFAULT nextval('django_content_type_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY django_site ALTER COLUMN id SET DEFAULT nextval('django_site_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY senses_chronicdisease ALTER COLUMN id SET DEFAULT nextval('senses_chronicdisease_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY senses_condition ALTER COLUMN id SET DEFAULT nextval('senses_condition_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY senses_disease ALTER COLUMN id SET DEFAULT nextval('senses_disease_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY senses_district ALTER COLUMN id SET DEFAULT nextval('senses_district_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY senses_family ALTER COLUMN id SET DEFAULT nextval('senses_family_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY senses_masjid ALTER COLUMN id SET DEFAULT nextval('senses_masjid_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY senses_masjid_members ALTER COLUMN id SET DEFAULT nextval('senses_masjid_members_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY senses_medical ALTER COLUMN id SET DEFAULT nextval('senses_medical_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY senses_member ALTER COLUMN id SET DEFAULT nextval('senses_member_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY senses_member_scheme ALTER COLUMN id SET DEFAULT nextval('senses_member_scheme_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY senses_member_service ALTER COLUMN id SET DEFAULT nextval('senses_member_service_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY senses_scheme ALTER COLUMN id SET DEFAULT nextval('senses_scheme_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY senses_sensesmembers ALTER COLUMN id SET DEFAULT nextval('senses_sensesmembers_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY senses_service ALTER COLUMN id SET DEFAULT nextval('senses_service_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY senses_subscheme ALTER COLUMN id SET DEFAULT nextval('senses_subscheme_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY senses_subscheme_conditions ALTER COLUMN id SET DEFAULT nextval('senses_subscheme_conditions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY senses_surgery ALTER COLUMN id SET DEFAULT nextval('senses_surgery_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY senses_taluk ALTER COLUMN id SET DEFAULT nextval('senses_taluk_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY south_migrationhistory ALTER COLUMN id SET DEFAULT nextval('south_migrationhistory_id_seq'::regclass);


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: root
--

COPY auth_group (id, name) FROM stdin;
\.


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('auth_group_id_seq', 1, false);


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: root
--

COPY auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('auth_group_permissions_id_seq', 1, false);


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: root
--

COPY auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add log entry	1	add_logentry
2	Can change log entry	1	change_logentry
3	Can delete log entry	1	delete_logentry
4	Can add permission	2	add_permission
5	Can change permission	2	change_permission
6	Can delete permission	2	delete_permission
7	Can add group	3	add_group
8	Can change group	3	change_group
9	Can delete group	3	delete_group
10	Can add user	4	add_user
11	Can change user	4	change_user
12	Can delete user	4	delete_user
13	Can add content type	5	add_contenttype
14	Can change content type	5	change_contenttype
15	Can delete content type	5	delete_contenttype
16	Can add session	6	add_session
17	Can change session	6	change_session
18	Can delete session	6	delete_session
19	Can add site	7	add_site
20	Can change site	7	change_site
21	Can delete site	7	delete_site
22	Can add migration history	8	add_migrationhistory
23	Can change migration history	8	change_migrationhistory
24	Can delete migration history	8	delete_migrationhistory
25	Can add district	9	add_district
26	Can change district	9	change_district
27	Can delete district	9	delete_district
28	Can add taluk	10	add_taluk
29	Can change taluk	10	change_taluk
30	Can delete taluk	10	delete_taluk
31	Can add masjid	11	add_masjid
32	Can change masjid	11	change_masjid
33	Can delete masjid	11	delete_masjid
34	Can add masjid_members	12	add_masjid_members
35	Can change masjid_members	12	change_masjid_members
36	Can delete masjid_members	12	delete_masjid_members
37	Can add family	13	add_family
38	Can change family	13	change_family
39	Can delete family	13	delete_family
40	Can add scheme	14	add_scheme
41	Can change scheme	14	change_scheme
42	Can delete scheme	14	delete_scheme
43	Can add condition	15	add_condition
44	Can change condition	15	change_condition
45	Can delete condition	15	delete_condition
46	Can add service	16	add_service
47	Can change service	16	change_service
48	Can delete service	16	delete_service
49	Can add sub scheme	17	add_subscheme
50	Can change sub scheme	17	change_subscheme
51	Can delete sub scheme	17	delete_subscheme
52	Can add member	18	add_member
53	Can change member	18	change_member
54	Can delete member	18	delete_member
55	Can add member_scheme	19	add_member_scheme
56	Can change member_scheme	19	change_member_scheme
57	Can delete member_scheme	19	delete_member_scheme
58	Can add member_service	20	add_member_service
59	Can change member_service	20	change_member_service
60	Can delete member_service	20	delete_member_service
61	Can add disease	21	add_disease
62	Can change disease	21	change_disease
63	Can delete disease	21	delete_disease
64	Can add surgery	22	add_surgery
65	Can change surgery	22	change_surgery
66	Can delete surgery	22	delete_surgery
67	Can add medical	23	add_medical
68	Can change medical	23	change_medical
69	Can delete medical	23	delete_medical
70	Can add chronic disease	24	add_chronicdisease
71	Can change chronic disease	24	change_chronicdisease
72	Can delete chronic disease	24	delete_chronicdisease
73	Can add senses members	25	add_sensesmembers
74	Can change senses members	25	change_sensesmembers
75	Can delete senses members	25	delete_sensesmembers
\.


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('auth_permission_id_seq', 75, true);


--
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: root
--

COPY auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
1	pbkdf2_sha256$10000$CKOfopd6jt9b$yax8q/Un4vl56lcA4IYXsOFvwGI8DWZ9IJapBvkHXzg=	2015-11-25 04:23:05.141672-05	t	admin			admin@mail.com	t	t	2015-11-13 07:18:45.370233-05
4	pbkdf2_sha256$10000$7gsvJEu91xcB$OYdN/PFqqQtl1IOzuosw73SBmbvNfQzzR9gmbC7UjpA=	2015-11-30 06:18:56.712478-05	f	CH_0002			unwo.althaf@ayisha.com	f	t	2015-11-25 05:45:28.519636-05
3	pbkdf2_sha256$10000$kEoeGn4L0zi4$C7WuFxB51yQiIHXaDyMZh1SQCDTbEhpRglDg+SwO3JE=	2015-12-01 00:26:00.966673-05	f	CH_0001			unwo.ilyas@gmail.com	f	t	2015-11-25 04:48:23.674807-05
2	pbkdf2_sha256$10000$TaNoT2fBaBke$+OmDfOOlHFXXRI2LRSlDsxUlArEvAE22Z0/DJ2UyyhU=	2015-12-01 02:49:09.870203-05	f	unwo_admin	Admin			f	t	2015-11-14 02:44:58.292897-05
\.


--
-- Data for Name: auth_user_groups; Type: TABLE DATA; Schema: public; Owner: root
--

COPY auth_user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('auth_user_groups_id_seq', 1, false);


--
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('auth_user_id_seq', 4, true);


--
-- Data for Name: auth_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: root
--

COPY auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('auth_user_user_permissions_id_seq', 1, false);


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: root
--

COPY django_admin_log (id, action_time, user_id, content_type_id, object_id, object_repr, action_flag, change_message) FROM stdin;
\.


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('django_admin_log_id_seq', 1, false);


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: root
--

COPY django_content_type (id, name, app_label, model) FROM stdin;
1	log entry	admin	logentry
2	permission	auth	permission
3	group	auth	group
4	user	auth	user
5	content type	contenttypes	contenttype
6	session	sessions	session
7	site	sites	site
8	migration history	south	migrationhistory
9	district	senses	district
10	taluk	senses	taluk
11	masjid	senses	masjid
12	masjid_members	senses	masjid_members
13	family	senses	family
14	scheme	senses	scheme
15	condition	senses	condition
16	service	senses	service
17	sub scheme	senses	subscheme
18	member	senses	member
19	member_scheme	senses	member_scheme
20	member_service	senses	member_service
21	disease	senses	disease
22	surgery	senses	surgery
23	medical	senses	medical
24	chronic disease	senses	chronicdisease
25	senses members	senses	sensesmembers
\.


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('django_content_type_id_seq', 25, true);


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: root
--

COPY django_session (session_key, session_data, expire_date) FROM stdin;
31wsjwuy4bnonsbr7tvpl5eeggn8w797	ZmUyYjQ2MWJlYTVmYTI4ZWVlMWE0ZTU2OTYyODM4ZDg3OGFiNTY3MDqAAn1xAShVEl9hdXRoX3VzZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHEDVQ1fYXV0aF91c2VyX2lkcQRLAnUu	2015-11-29 15:27:34.560051-05
5h4t3c40rajtbzxt9833fhoh45xcia1r	ZmUyYjQ2MWJlYTVmYTI4ZWVlMWE0ZTU2OTYyODM4ZDg3OGFiNTY3MDqAAn1xAShVEl9hdXRoX3VzZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHEDVQ1fYXV0aF91c2VyX2lkcQRLAnUu	2015-12-03 05:43:52.533801-05
xyl27ebwogmpqtzq5dq6lhhi0xk5cj56	ZmUyYjQ2MWJlYTVmYTI4ZWVlMWE0ZTU2OTYyODM4ZDg3OGFiNTY3MDqAAn1xAShVEl9hdXRoX3VzZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHEDVQ1fYXV0aF91c2VyX2lkcQRLAnUu	2015-12-09 04:26:20.798389-05
sbj9qsrzpdk8k7ww1rl4uvtjh9jqfl7s	Y2YzOGQ2NTBjMjk5NzkyNDgyNDkzN2E0NzFiZDhkMDYxOTJlMTBhYzqAAn1xAShVEl9hdXRoX3VzZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHEDVQ1fYXV0aF91c2VyX2lkcQRLA3Uu	2015-12-12 00:46:07.102482-05
yxl53n9tt91q9xjd6jglmtevva4tin7j	MjRiM2I1NTlhZjc4MTQ3NDhlMGY0MjUyNDk5ZWZkNzVhYWMyOTUzZDqAAn1xAShVEl9hdXRoX3VzZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHEDVQ1fYXV0aF91c2VyX2lkcQRLBHUu	2015-12-14 05:30:00.497025-05
qqctv6o1m882whe19hsguqy7mpjdxg8x	MjRiM2I1NTlhZjc4MTQ3NDhlMGY0MjUyNDk5ZWZkNzVhYWMyOTUzZDqAAn1xAShVEl9hdXRoX3VzZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHEDVQ1fYXV0aF91c2VyX2lkcQRLBHUu	2015-12-14 06:18:56.723524-05
nh7d4fq88lu1cvt7g79c2r35ox7l373o	Y2YzOGQ2NTBjMjk5NzkyNDgyNDkzN2E0NzFiZDhkMDYxOTJlMTBhYzqAAn1xAShVEl9hdXRoX3VzZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHEDVQ1fYXV0aF91c2VyX2lkcQRLA3Uu	2015-12-15 00:26:00.977849-05
1ass36zvq5gbg9tatqa67gw2h5d86muj	ZmUyYjQ2MWJlYTVmYTI4ZWVlMWE0ZTU2OTYyODM4ZDg3OGFiNTY3MDqAAn1xAShVEl9hdXRoX3VzZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHEDVQ1fYXV0aF91c2VyX2lkcQRLAnUu	2015-12-15 00:30:39.344132-05
nsmedqlymndulaohxg65kz364l286lio	Y2YzOGQ2NTBjMjk5NzkyNDgyNDkzN2E0NzFiZDhkMDYxOTJlMTBhYzqAAn1xAShVEl9hdXRoX3VzZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHEDVQ1fYXV0aF91c2VyX2lkcQRLA3Uu	2015-12-09 06:37:22.404873-05
5c5sei4xh6uidkcgji1wmlfaggbeu82m	Y2YzOGQ2NTBjMjk5NzkyNDgyNDkzN2E0NzFiZDhkMDYxOTJlMTBhYzqAAn1xAShVEl9hdXRoX3VzZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHEDVQ1fYXV0aF91c2VyX2lkcQRLA3Uu	2015-12-09 06:42:02.094999-05
cekvpfz7n66lyyrfg1mswiwkycfljj0f	NjNkZDIzZDVmMGJmMzA2Y2RjNTYyMWEzODI1NDI2ZmJjZTYwMTgxNjqAAn1xAS4=	2015-12-15 07:44:15.16974-05
zsp06sysged5ed2q369fyd5u4pb43e6q	Y2YzOGQ2NTBjMjk5NzkyNDgyNDkzN2E0NzFiZDhkMDYxOTJlMTBhYzqAAn1xAShVEl9hdXRoX3VzZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHEDVQ1fYXV0aF91c2VyX2lkcQRLA3Uu	2015-12-10 00:06:16.396488-05
7ectlennl6ngsiw88j99wsrn5w5nd52f	Y2YzOGQ2NTBjMjk5NzkyNDgyNDkzN2E0NzFiZDhkMDYxOTJlMTBhYzqAAn1xAShVEl9hdXRoX3VzZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHEDVQ1fYXV0aF91c2VyX2lkcQRLA3Uu	2015-12-10 02:39:57.006814-05
\.


--
-- Data for Name: django_site; Type: TABLE DATA; Schema: public; Owner: root
--

COPY django_site (id, domain, name) FROM stdin;
1	example.com	example.com
\.


--
-- Name: django_site_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('django_site_id_seq', 1, true);


--
-- Data for Name: senses_chronicdisease; Type: TABLE DATA; Schema: public; Owner: root
--

COPY senses_chronicdisease (id, member_id, disease_name_id, doctor_name, cost, hospital_name, status, details) FROM stdin;
1	272	5	\N	\N	\N	t	NA
2	286	19	\N	\N	\N	t	N
3	288	6	\N	\N	\N	t	N
4	292	7	\N	\N	\N	t	N
5	296	5	\N	\N	\N	t	N
6	297	24	\N	\N	\N	t	N
7	298	24	\N	\N	\N	t	N
8	299	24	\N	\N	\N	t	N
9	300	24	\N	\N	\N	t	N
10	301	24	\N	\N	\N	t	N
11	383	25	\N	\N	\N	t	EYE Operation 
12	455	11	\N	\N	\N	t	CANCER OPERATION ALERDY DONE
13	2674	24	\N	\N	\N	t	N
14	2675	24	\N	\N	\N	t	N
15	2676	24	\N	\N	\N	t	N
16	2677	24	\N	\N	\N	t	N
17	2678	24	\N	\N	\N	t	N
18	2679	81	\N	\N	\N	t	N
19	2680	24	\N	\N	\N	t	N
20	2681	24	\N	\N	\N	t	N
21	2682	24	\N	\N	\N	t	N
22	2683	82	\N	\N	\N	t	N
23	2684	24	\N	\N	\N	t	N
24	2685	24	\N	\N	\N	t	N
\.


--
-- Name: senses_chronicdisease_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('senses_chronicdisease_id_seq', 24, true);


--
-- Data for Name: senses_condition; Type: TABLE DATA; Schema: public; Owner: root
--

COPY senses_condition (id, field, conditions, value) FROM stdin;
\.


--
-- Name: senses_condition_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('senses_condition_id_seq', 1, false);


--
-- Data for Name: senses_disease; Type: TABLE DATA; Schema: public; Owner: root
--

COPY senses_disease (id, sym_type, disease_name, disease_id, description) FROM stdin;
1	DISEASE	General Medical Check Up	HL01	\N
2	DISEASE	Lower Limb Ailments	HL02	\N
3	DISEASE	Upper Limb Ailments	HL03	\N
4	DISEASE	ENT Issues	HL04	\N
5	DISEASE	Abdominal Ailments	HL05	\N
6	DISEASE	Cardiac Ailments	HL06	\N
7	DISEASE	Pulmonary Ailments	HL07	\N
8	DISEASE	Renal Ailments	HL08	\N
9	DISEASE	Diabetic Issues	HL09	\N
10	DISEASE	Mental Ailments	HL10	\N
11	DISEASE	Oncology Issues	HL11	\N
12	DISEASE	Emergency Medical Assistance	HL12	\N
13	DISEASE	Medical Guidance	HL13	\N
14	DISEASE	Congenital Deformities	HL14	\N
15	DISEASE	Infectious Diseases	HL15	\N
16	DISEASE	Ophtalmic Ailments	HL16	\N
17	DISEASE	Dermatological Ailments	HL17	\N
18	DISEASE	Neorological Issues	HL18	\N
19	DISEASE	Stroke Problem	HL19	\N
20	DISEASE	lymphadenopathy Disease	HL20	\N
21	DISEASE	Disease Hl08	Hl08	\N
22	DISEASE	Disease Hl06	Hl06	\N
23	DISEASE	Disease BP / Thiraidu	BP / Thiraidu	\N
24	DISEASE	Disease N	N	\N
25	DISEASE	Disease B.P	B.P	\N
26	DISEASE	Disease BP	BP	\N
27	DISEASE	Disease HLO2	HLO2	\N
28	DISEASE	Disease Operation Will Do	Operation Will Do	\N
29	DISEASE	Disease Thairaidu	Thairaidu	\N
30	DISEASE	Disease HL13/ Neck pain	HL13/ Neck pain	\N
31	DISEASE	Disease Drink addit he want leave 	Drink addit he want leave	\N
32	DISEASE	Disease HL09 / HL05	HL09 / HL05	\N
33	DISEASE	Disease Head	Head	\N
34	DISEASE	Disease Mayakam	Mayakam	\N
35	DISEASE	Disease Heart	Heart	\N
36	DISEASE	Disease Delivery	Delivery	\N
37	DISEASE	Disease Fix	Fix	\N
38	DISEASE	Disease Alsar	Alsar	\N
39	DISEASE	Disease Bp	Bp	\N
40	DISEASE	Disease Leg	Leg	\N
41	DISEASE	Disease Asthuma	Asthuma	\N
42	DISEASE	Disease Hl09	Hl09	\N
43	DISEASE	Disease Blood Surculation Low	Blood Surculation Low	\N
44	DISEASE	Disease Aasthuma	Aasthuma	\N
45	DISEASE	Disease Week Body	Week Body	\N
46	DISEASE	Disease PRESURE	PRESURE	\N
47	DISEASE	Disease Presure	Presure	\N
48	DISEASE	Disease Hl03	Hl03	\N
49	DISEASE	Disease HL 09	HL 09	\N
50	DISEASE	Disease HL 06	HL 06	\N
51	DISEASE	Disease HL 07	HL 07	\N
52	DISEASE	Disease Neck Tumour	Neck Tumour	\N
53	DISEASE	Disease Leg Problem	Leg Problem	\N
54	DISEASE	Disease HL 19	HL 19	\N
55	DISEASE	Disease B	B	\N
56	DISEASE	Disease HL 05	HL 05	\N
57	DISEASE	Disease HL 16	HL 16	\N
58	DISEASE	Disease Pressure	Pressure	\N
59	DISEASE	Disease Sugar. B.P	Sugar. B.P	\N
60	DISEASE	Disease Nuraiyiral	Nuraiyiral	\N
61	DISEASE	Disease Eye Pro	Eye Pro	\N
62	DISEASE	Disease Karbapai Pro	Karbapai Pro	\N
63	DISEASE	Disease Head Pain	Head Pain	\N
64	DISEASE	Disease Tairaidu	Tairaidu	\N
65	DISEASE	Disease Aisar	Aisar	\N
66	DISEASE	Disease Thiraidu	Thiraidu	\N
67	DISEASE	Disease Mantaly Pro	Mantaly Pro	\N
68	DISEASE	Disease Bailes	Bailes	\N
69	DISEASE	Disease Stone	Stone	\N
70	DISEASE	Disease Stomac	Stomac	\N
71	DISEASE	Disease Beac Pain	Beac Pain	\N
72	DISEASE	Disease Vaatham	Vaatham	\N
73	DISEASE	Disease Heart Pro	Heart Pro	\N
74	DISEASE	Disease Eye	Eye	\N
75	DISEASE	Disease Mentaly P	Mentaly P	\N
76	DISEASE	Disease Kitney	Kitney	\N
77	DISEASE	Disease HL4	HL4	\N
78	DISEASE	Disease HL06BP	HL06BP	\N
79	DISEASE	Disease HL09 	HL09 	\N
80	DISEASE	Disease Jaundice 	Jaundice 	\N
81	DISEASE	Disease HL17/ BP	HL17/ BP	\N
82	DISEASE	Disease HL09 / HL08	HL09 / HL08	\N
84	DISEASE	Disease HL09 / BP	HL09 / BP	\N
85	DISEASE	Disease Hl10	Hl10	\N
86	DISEASE	Disease FTS Problem	FTS Problem	\N
87	DISEASE	Disease Muthugu	Muthugu	\N
88	DISEASE	Disease Kudal	Kudal	\N
89	DISEASE	Disease HL06 / Hl09 / BP	HL06 / Hl09 / BP	\N
90	DISEASE	Disease Hl01	Hl01	\N
91	DISEASE	Disease HL05/BP/HL09	HL05/BP/HL09	\N
92	DISEASE	Disease Hl02	Hl02	\N
93	DISEASE	Disease HL20/HL07	HL20/HL07	\N
94	DISEASE	Disease HL02 /HL03/HL06	HL02 /HL03/HL06	\N
95	DISEASE	Disease HL02 / HL09 / HL06	HL02 / HL09 / HL06	\N
96	DISEASE	Disease back pain	back pain	\N
97	DISEASE	Disease HL09 /BP 	HL09 /BP 	\N
98	DISEASE	Disease HL02 / HL03	HL02 / HL03	\N
99	DISEASE	Disease Veecing / 	Veecing / 	\N
100	DISEASE	Disease Head injuri	Head injuri	\N
101	DISEASE	Disease BP / HL02 /HL09	BP / HL02 /HL09	\N
102	DISEASE	Disease Head Probalem	Head Probalem	\N
103	DISEASE	Disease No kids 	No kids 	\N
104	DISEASE	Disease Annmai kurivu	Annmai kurivu	\N
105	DISEASE	Disease HL18/mentale problem	HL18/mentale problem	\N
106	DISEASE	Disease Psychiatric medicine	Psychiatric medicine	\N
107	DISEASE	Disease BP/thiraidu	BP/thiraidu	\N
108	DISEASE	Disease HL16 & HL12	HL16 & HL12	\N
83	DISEASE	Disease Ortho problem	HL21	Bone related problem
\.


--
-- Name: senses_disease_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('senses_disease_id_seq', 108, true);


--
-- Data for Name: senses_district; Type: TABLE DATA; Schema: public; Owner: root
--

COPY senses_district (id, district_name, district_code) FROM stdin;
1	Ariyalur	AR
2	Chennai	CH
3	Coimbatore	CO
4	Cuddalore	CU
5	Dharmapuri	DH
6	Dindigul	DI
7	Erode	ER
8	Kanchipuram	KC
9	Kanyakumari	KK
10	Karur	KRR
11	Krishnagiri	KR
12	Madurai	MA
13	Nagapattinam	NG
14	Namakkal	NM
15	The Nilgiris	NI
16	Perambalur	PE
17	Pudukkottai	PU
18	Ramanathapuram	RA
19	Salem	SA
20	Sivaganga	SI
21	Thanjavur	TJ
22	Theni	TH
23	Thoothukudi	TK
24	Tiruchirappalli	TC
25	Tirunelveli	TI
26	Tiruppur	TP
27	Tiruvallur	TL
28	Tiruvannamalai	TV
29	Tiruvarur	TR
30	Vellore	VE
31	Viluppuram	VL
32	Virudhunagar	VR
\.


--
-- Name: senses_district_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('senses_district_id_seq', 32, true);


--
-- Data for Name: senses_family; Type: TABLE DATA; Schema: public; Owner: root
--

COPY senses_family (id, muhalla_id, family_id, ration_card, address, mobile, donor, report_date, volunteer, language, health_insurance, family_needs, house_type, house_cat, toilet, financial_status) FROM stdin;
1	1	ER / 0001 / 659		3,Canadi Street,		f	2014-10-08 01:00:00-04	f		f		Rent		t	E - Very Poor
2	1	ER / 0001 / 660		.1/4,Kadapalayam,		f	2014-10-08 01:00:00-04	f		f		Rent		t	E - Very Poor
16	1	ER / 0001 / 674	12/G/0777667	44,Ohm Shakti koil Street ,Perundurai	8883562658	f	2014-10-08 01:00:00-04	f	Tamil	f		Rent		t	C - Middle Class
33	1	ER / 0001 / 7	12/G/0716705	39A,Podi Mattai Khan Street,Perundurai	9965790201	f	2014-09-08 01:00:00-04	f	Urdu	f		Own		t	D - Poor
14	1	ER / 0001 / 672	12/G/0002477	28/6,China madathu Palaiyam,Perundurai	8122462726	f	2014-10-08 01:00:00-04	f	Urdu	f		Own	Cement Sheet	t	C - Middle Class
4	1	ER / 0001 / 662		425B,Kunathur Road ,Perundurai	7502326645	f	2014-10-08 01:00:00-04	f	Urdu	f		Rent		t	E - Very Poor
15	1	ER / 0001 / 673	12/W/0001541	101/2,kangi Koil Road,Perundurai	9994139759	f	2014-10-08 01:00:00-04	f	Urdu	f		Rent		t	D - Poor
5	1	ER / 0001 / 663		4/113,Kadapalayam,		f	2014-10-08 01:00:00-04	f		f		Rent		t	E - Very Poor
35	1	ER / 0001 / 9		60,Majeed Street,Perundurai	9363120482	f	2014-09-08 01:00:00-04	f	Tamil	f		Own	Shell	t	C - Middle Class
6	1	ER / 0001 / 664	12/W/0001539	No:61,Kanaki Street,Perundurai	9788619199	f	2014-10-08 01:00:00-04	f	Tamil	f		Own	Concert	t	C - Middle Class
25	1	ER / 0001 / 683	12/W/0096108	306,kunathur Road ,Perundurai	9095808532	f	2014-10-08 01:00:00-04	f	Urdu	f		Rent		t	D - Poor
7	1	ER / 0001 / 665	10/G/0184288	57/17,Raja Veedi,Perundurai	7708939209	f	2014-10-08 01:00:00-04	f	Tamil	f		Rent		t	D - Poor
9	1	ER / 0001 / 667	12/G/0716447	15,Muhammdyar Street,Perundurai	9442289786	f	2014-10-08 01:00:00-04	f	Urdu	f		Own	Concert	t	A - Well Settled
24	1	ER / 0001 / 682		,Kullam Palayam ,		f	2014-10-08 01:00:00-04	f		f		Rent		t	E - Very Poor
10	1	ER / 0001 / 668	12/G/0745973	.1/15,Kunathur Road ,Perundurai	8012286525	f	2014-10-08 01:00:00-04	f	Tamil	f		Own	Ottu Veedu	t	C - Middle Class
29	1	ER / 0001 / 2	12/G/0715988	36/79,Majeed Street,Perundurai	9750498786	f	2014-09-08 01:00:00-04	f	Tamil	f		Own	Shell	t	B - Full Filled
11	1	ER / 0001 / 669		178,Kalium Pudur Street,		f	2014-10-08 01:00:00-04	f		f		Rent		t	E - Very Poor
38	1	ER / 0001 / 12		14/22,Bavadi Street,		f	2014-09-08 01:00:00-04	f		f		Rent		t	E - Very Poor
12	1	ER / 0001 / 670	12/G/0890782	4/113,Bavani Main Road,Perundurai	9994307281	f	2014-10-08 01:00:00-04	f	Urdu	f		Rent	Ottu Veedu	t	C - Middle Class
31	1	ER / 0001 / 4	12/W/0085450	60/127,Majeed Street,Perundurai	9786148401	f	2014-09-08 01:00:00-04	f	Tamil	f		Own	Thar	t	B - Full Filled
8	1	ER / 0001 / 666	12/G/0717388	396,Kunathur Road ,Perundurai	9095631715	f	2014-10-08 01:00:00-04	f	Tamil	f		Rent		t	E - Very Poor
18	1	ER / 0001 / 676		31/67,Masjid Street,Perundurai	9786006106	f	2014-10-08 01:00:00-04	f	Tamil	f		Rent	Ottu Veedu	t	C - Middle Class
19	1	ER / 0001 / 677		19,Bahath Sing Nagar,Perundurai	9600721533	f	2014-10-08 01:00:00-04	f	Urdu	f		Rent		t	C - Middle Class
23	1	ER / 0001 / 681	12/G/0861992	,Pavadi Street ,Perundurai	9942912667	f	2014-10-08 01:00:00-04	f	Urdu	f		Own	Concert	t	C - Middle Class
20	1	ER / 0001 / 678		47,kangi Koil Road,Perundurai	7373916218	f	2014-10-08 01:00:00-04	f	Tamil	f		Rent		t	D - Poor
26	1	ER / 0001 / 684		131,Old civil Office,		f	2014-10-08 01:00:00-04	f		f		Rent		t	E - Very Poor
21	1	ER / 0001 / 679	12/G/0717222	45/146,Agrahara Street,Perundurai	9150160817	f	2014-10-08 01:00:00-04	f	Tamil	f		Rent		t	C - Middle Class
22	1	ER / 0001 / 680		96,Masjid Street,Perundurai	9952670970	f	2014-10-08 01:00:00-04	f	Urdu	f		Own	Concert	t	C - Middle Class
32	1	ER / 0001 / 5	12/G/0720421	87,Majeed Street,Perundurai	9750508502	f	2014-09-08 01:00:00-04	f	Tamil	f		Own	Thar	t	C - Middle Class
27	1	ER / 0001 / 685		61/1,bavani mainroad,Perundurai	8883217941	f	2014-10-08 01:00:00-04	f	Urdu	f		Rent		t	D - Poor
34	1	ER / 0001 / 8		42/6,Bavadi Street,Perundurai	9715506677	f	2014-09-08 01:00:00-04	f	Urdu	f		Rent	Shell	t	C - Middle Class
40	1	ER / 0001 / 14	12/G/0699664	17/34,Anna Nagar,Perundurai	9788090923	f	2014-09-08 01:00:00-04	f	Urdu	f		Own	Shell	t	D - Poor
37	1	ER / 0001 / 11	12/W/0085436	133,Kongu Nagar,Perundurai	9698877064	f	2014-09-08 01:00:00-04	f	Tamil	f		Rent	Thar	t	B - Full Filled
39	1	ER / 0001 / 13	12/G/0493602	109/1,Anna Nagar,Perundurai	8344604274	f	2014-09-08 01:00:00-04	f	Urdu	f		Own	Thar	t	C - Middle Class
30	1	ER / 0001 / 3	12/G/0734868	104105,Lkshmi Puram Odupathi,Perundurai	9750047867	f	2014-09-08 01:00:00-04	f	Tamil	f		Own	Shell	t	C - Middle Class
51	1	ER / 0001 / 30	12/G/0716560	71,Muhammadiyya Puram,Perundurai	9486084222	f	2014-09-08 01:00:00-04	f	Urdu	f		Rent	Shell	t	D - Poor
48	1	ER / 0001 / 27	12/G/0716638	38,Vaala mattai Karar Lane,Perundurai	8883308561	f	2014-09-08 01:00:00-04	f	Tamil	f		Own	Shell	t	D - Poor
43	1	ER / 0001 / 17	No	107/A,Majeed Street,Perundurai	9095062238	f	2014-09-08 01:00:00-04	f	Tamil	f		Own	Thar	t	D - Poor
41	1	ER / 0001 / 15	12/G/0715818	74/17,Thaskant Street,Perundurai	9443794701	f	2014-09-08 01:00:00-04	f	Tamil	f		Rent		t	D - Poor
46	1	ER / 0001 / 25	12/G/0716444	29/3,Muhammadiyar Street,Perundurai	7373614818	f	2014-09-08 01:00:00-04	f	Urdu	f		Rent	Shell	t	E - Very Poor
3	1	ER / 0001 / 661	12/G/0463994	40,Sathiram Pudur,Perundurai Road	9659682376	f	2014-10-08 01:00:00-04	f	Tamil	f		Rent		t	D - Poor
47	1	ER / 0001 / 26	12/G/0881478	15/17,Kennady Lane,Perundurai	9976581755	f	2014-09-08 01:00:00-04	f	Tamil	f		Own	Shell	t	D - Poor
13	1	ER / 0001 / 671	12/G/0716332	39/20,Pavadi Street ,Perundurai	9843477370	f	2014-10-08 01:00:00-04	f	Urdu	f		Rent	Concert	t	C - Middle Class
52	1	ER / 0001 / 31	12/G/0716563	9,Bajanai Kovil Street,Perundurai	9786433767	f	2014-09-08 01:00:00-04	f	Tamil	f		Rent	Sheet	t	D - Poor
49	1	ER / 0001 / 28		11,Raj Street,		f	2014-09-08 01:00:00-04	f		f		Rent		t	E - Very Poor
50	1	ER / 0001 / 29	12/G/0699757	11,Anna Nagar,Perundurai	8526331319	f	2014-09-08 01:00:00-04	f	Tamil	f		Rent	Shell	t	D - Poor
28	1	ER / 0001 / 1	12/G/0777567	11,Raj Street,Perundurai	9865955483	f	2014-09-08 01:00:00-04	f	Tamil	f		Own	Shell	t	D - Poor
36	1	ER / 0001 / 10	12/G/0609486	20,Kennady Street,Perundurai	9698829593	f	2014-09-08 01:00:00-04	f	Tamil	f		Rent	Shell	t	E - Very Poor
45	1	ER / 0001 / 19	12/G/0879001	99,Muhammadiyar Street,Perundurai	8012438558	f	2014-09-08 01:00:00-04	f	Urdu	f		Own	Thar	t	D - Poor
17	1	ER / 0001 / 675		27,Podimattai kara Street,Perundurai	9600721533	f	2014-10-08 01:00:00-04	f	Urdu	f		Rent		t	C - Middle Class
55	1	ER / 0001 / 34	12/G/0716406	46/8,Pobu Mattaikarar Lane ,Perundurai	9965368279	f	2014-09-08 01:00:00-04	f	Urdu	f		Own	Shell	t	D - Poor
76	1	ER / 0001 / 23	12/G/0002425	165,Raj Street,Perundurai	9865284655	f	2014-09-08 01:00:00-04	f	Tamil	f		Rent	Shell	t	D - Poor
57	1	ER / 0001 / 36		116,Anna Nagar,		f	2014-09-08 01:00:00-04	f		f		Rent		t	E - Very Poor
67	1	ER / 0001 / 46	12/W/0085505	180-B,Kallliyam Pudur Road,Perundurai	9842598679	f	2014-09-08 01:00:00-04	f	Tamil	f		Own	Sheet	t	C - Middle Class
59	1	ER / 0001 / 38	12/G/0716389	10A,Bavadi Lane,Perundurai	9524729227	f	2014-09-08 01:00:00-04	f	Tamil	f		Own		t	C - Middle Class
92	1	ER / 0001 / 415	12/G/0890100	43,Gandhi Kovil Road,	9865112065	f	2014-10-08 01:00:00-04	f	Tamil	f		Rent		t	D - Poor
56	1	ER / 0001 / 35		30/Jun,M.C.Road,		f	2014-09-08 01:00:00-04	f		f		Rent		t	E - Very Poor
71	1	ER / 0001 / 50		44,Podi Mattaikar Lane,Perundurai	8508952537	f	2014-09-08 01:00:00-04	f	Tamil	f		Own	Shell	t	C - Middle Class
62	1	ER / 0001 / 41	12/G/0720092	61,Kongu Nagar,Perundurai	9443083336	f	2014-09-08 01:00:00-04	f	Tamil	f		Rent		t	D - Poor
73	1	ER / 0001 / 20		Y1/45,116,		f	2014-09-08 01:00:00-04	f		f		Rent		t	E - Very Poor
58	1	ER / 0001 / 37	12/K/0001893	83/59,Muhammadiyya Puram,Perundurai	9791376353	f	2014-09-08 01:00:00-04	f	Urdu	f		Own		t	B - Full Filled
80	1	ER / 0001 / 403	-	206,Kadukkam Palayam,Vakkalmadu	9524065548	f	2014-10-08 01:00:00-04	f	Urdu	f		Rent		t	D - Poor
68	1	ER / 0001 / 47	12/G/0001515	73/108,Majeed Steet,Perundurai	9843371753	f	2014-09-08 01:00:00-04	f	Tamil	f		Own	Shell	t	E - Very Poor
60	1	ER / 0001 / 39	12/G/0518845	27,Muhammadiyya Puram,Perundurai	9750533759	f	2014-09-08 01:00:00-04	f	Urdu	f		Rent		t	D - Poor
84	1	ER / 0001 / 407	NA	5-4/1-5,Pattakkarayan Palayam,		f	2014-10-08 01:00:00-04	f	Urdu	f		Rent		t	D - Poor
70	1	ER / 0001 / 49		07/34,Majeed Street,Perundurai	9150857372	f	2014-09-08 01:00:00-04	f	Tamil	f		Rent	Shell	t	D - Poor
61	1	ER / 0001 / 40	12/G/0002436	79,Sinna Madathu Palayam,Perundurai	9443935958	f	2014-09-08 01:00:00-04	f	Urdu	f		Own		t	B - Full Filled
69	1	ER / 0001 / 48	12/G/0023246	50,Kunnathur Road,Perundurai	8489729439	f	2014-09-08 01:00:00-04	f	Tamil	f		Rent	Shell	t	E - Very Poor
63	1	ER / 0001 / 42	12/G/0085649	2,Bajanai Kovil Street,Perundurai	9443696111	f	2014-09-08 01:00:00-04	f	Tamil	f		Own	Terraced	t	C - Middle Class
78	1	ER / 0001 / 401	12/G/0716709	21/15,Muhammadiyar Street,	9791914168	f	2014-10-08 01:00:00-04	f	Urdu	f		Rent		t	D - Poor
77	1	ER / 0001 / 24	12/G/0715855	41,Podi Mattai Khan Street,Perundurai	9965222813	f	2014-09-08 01:00:00-04	f	Urdu	f		Rent	Shell	t	D - Poor
64	1	ER / 0001 / 43	12/G/0085653	129/368,Kunnathur Road,Perundurai	9788830008	f	2014-09-08 01:00:00-04	f	Tamil	f		Own	Shell	t	C - Middle Class
65	1	ER / 0001 / 44	12/G/0085655	364/72,Kunnathur Road,Perundurai	4294225136	f	2014-09-08 01:00:00-04	f	Tamil	f		Own	Terraced	t	C - Middle Class
66	1	ER / 0001 / 45		5-420,Sakthi Steel,		f	2014-09-08 01:00:00-04	f		f		Rent		t	E - Very Poor
89	1	ER / 0001 / 412	12/G/0716014	85,Pethamma palayam Road,Kongun nagar	9578410824	f	2014-10-08 01:00:00-04	f	Tamil	f		Rent		t	E - Very Poor
81	1	ER / 0001 / 404	12/G/0721202	70,Pandiyan Street,	9488536354	f	2014-10-08 01:00:00-04	f	Tamil	f		Own		t	E - Very Poor
72	1	ER / 0001 / 6	12/G/0881636	87,Majeed Street,Perundurai	9942046759	f	2014-09-08 01:00:00-04	f	Tamil	f		Own	Thar	t	C - Middle Class
79	1	ER / 0001 / 402	12/W/0001002	27,Raja Street,	9095336693	f	2014-10-08 01:00:00-04	f	Urdu	f		Rent		t	C - Middle Class
95	1	ER / 0001 / 418	03/G/1070037	20,Muhammadiyar Street,	8675929967	f	2014-10-08 01:00:00-04	f	Urdu	f		Rent		t	D - Poor
74	1	ER / 0001 / 21		B 112,Anna Nagar,		f	2014-09-08 01:00:00-04	f		f		Rent		t	E - Very Poor
85	1	ER / 0001 / 408	NA	37,Raja Street,	9842609787	f	2014-10-08 01:00:00-04	f	Urdu	f		Rent		t	D - Poor
75	1	ER / 0001 / 22		130,Anna Nagar,		f	2014-09-08 01:00:00-04	f		f		Rent		t	E - Very Poor
90	1	ER / 0001 / 413		26/14 E,Rajendera prashad Street,Bhavani Road	9095727117	f	2014-10-08 01:00:00-04	f	Tamil	f		Rent		t	D - Poor
82	1	ER / 0001 / 405	12/G/0332359	6/426,Thermutti veedhi,Thinganoor	9578311175	f	2014-10-08 01:00:00-04	f	Urdu	f		Own		t	C - Middle Class
83	1	ER / 0001 / 406	12/G/0332357	6/340,Thingalur,	8220262367	f	2014-10-08 01:00:00-04	f	Urdu	f		Rent		t	D - Poor
86	1	ER / 0001 / 409	12/G/0721228	110,Pandiyan Street,	9677793469	f	2014-10-08 01:00:00-04	f	Tamil	f		Own	Brick	t	C - Middle Class
93	1	ER / 0001 / 416	12/G/0002591	17/16,Mudhaliyar  Street,	9659350380	f	2014-10-08 01:00:00-04	f	Urdu	f		Rent		t	D - Poor
100	1	ER / 0001 / 423		399,Kunnathur road,	9688543457	f	2014-10-08 01:00:00-04	f	Tamil	f		Rent		t	D - Poor
91	1	ER / 0001 / 414	12/G/0811882	17,Vengameadu,Eroad Road	8344030588	f	2014-10-08 01:00:00-04	f	Urdu	f		Rent		t	D - Poor
87	1	ER / 0001 / 410	13/G/1331143	3,Bajanai Kovil Street West,	9842302395	f	2014-10-08 01:00:00-04	f	Urdu	f		Rent		t	D - Poor
88	1	ER / 0001 / 411	12/G/0716234	80/B,Majith Street,	9865018828	f	2014-10-08 01:00:00-04	f	Tamil	f		Rent		t	C - Middle Class
94	1	ER / 0001 / 417	12/G/0716477	27,Muhammadiyar Street,	9865214092	f	2014-10-08 01:00:00-04	f	Urdu	f		Rent		t	D - Poor
98	1	ER / 0001 / 421	13/G/0178467	37,Bajanai Kovil Street West,	8883702506	f	2014-10-08 01:00:00-04	f	Urdu	f		Rent		t	D - Poor
96	1	ER / 0001 / 419	12/G/0819371	6,Baskand street,Gandhi Kovil Street	9976353952	f	2014-10-08 01:00:00-04	f	Tamil	f		Rent		t	D - Poor
101	1	ER / 0001 / 424		42-2,Palladi Street,	9994104235	f	2014-10-08 01:00:00-04	f	Urdu	f		Rent		t	D - Poor
97	1	ER / 0001 / 420		19,Muhammadiyar Street,	9865628124	f	2014-10-08 01:00:00-04	f	Urdu	f		Rent		t	D - Poor
102	1	ER / 0001 / 425	12/W/0001034	38/41,Bajanai Kovil Street West,	9942677561	f	2014-10-08 01:00:00-04	f	Urdu	f		Rent		t	D - Poor
99	1	ER / 0001 / 422	12/G/0722546	42/23,Pavadi lane,VIP Nagar	9042090641	f	2014-10-08 01:00:00-04	f	Tamil	f		Own		t	D - Poor
103	1	ER / 0001 / 426	12/B/0720590	70,Chidambaranar street,	8973415007	f	2014-10-08 01:00:00-04	f	Urdu	f		Rent		t	E - Very Poor
106	1	ER / 0001 / 429	13/G/0098374	13/70,Dhas kanda street,	9976220832	f	2014-10-08 01:00:00-04	f	Tamil	f		Rent		t	D - Poor
104	1	ER / 0001 / 427		71,Chidambaranar street,	9042723515	f	2014-10-08 01:00:00-04	f	Urdu	f		Rent		t	E - Very Poor
105	1	ER / 0001 / 428		6/12,,		f	2014-10-08 01:00:00-04	f		f		Rent		t	E - Very Poor
53	1	ER / 0001 / 32	12/G/0716551	84,Muhammadiyya Puram,Perundurai	9789447884	f	2014-09-08 01:00:00-04	f	Urdu	f		Own	Shell	t	E - Very Poor
54	1	ER / 0001 / 33	12/G/0716554	306/19,Arul Sitra Industries,Perundurai	9842706789	f	2014-09-08 01:00:00-04	f	Tamil	f		Rent	Shell	t	C - Middle Class
110	1	ER / 0001 / 527	12/G/0715746	13,Masjith Street,	9965070784	f	2014-10-08 01:00:00-04	f	Tamil	f		Own	Ottu Veedu	t	C - Middle Class
144	1	ER / 0001 / 124	12/W/0050402	42036,Bavadi Lane,Perundurai	9443669457	f	2014-09-08 01:00:00-04	f	Tamil	f		Own	Terraced	t	C - Middle Class
112	1	ER / 0001 / 529	12/G/0003208	47,Gandhi Kovil Road,	9865050279	f	2014-10-08 01:00:00-04	f	Tamil	f		Rent		t	D - Poor
128	1	ER / 0001 / 545	12/G/0716882	55,Masjith Street,	9994597651	f	2014-10-08 01:00:00-04	f	Tamil	f		Rent		t	D - Poor
113	1	ER / 0001 / 530	12/G/071586	47,Bajanai Kovil Street,	9080492879	f	2014-10-08 01:00:00-04	f	Urdu	f		Rent		t	D - Poor
111	1	ER / 0001 / 528	12/G/0715714	11/14,Masjith Street,	9600255896	f	2014-10-08 01:00:00-04	f	Tamil	f		Own	Sheet	t	C - Middle Class
137	1	ER / 0001 / 554				f	2014-10-08 01:00:00-04	f		f		Rent		t	E - Very Poor
125	1	ER / 0001 / 542	12/G/0002587	21/15,Muhamathiyar Street,	9677649590	f	2014-10-08 01:00:00-04	f	Urdu	f		Rent		t	D - Poor
114	1	ER / 0001 / 531		6/340,,		f	2014-10-08 01:00:00-04	f		f		Rent		t	E - Very Poor
115	1	ER / 0001 / 532	12/G/0716009	96/84,Raja Street,	8973340864	f	2014-10-08 01:00:00-04	f	Tamil	f		Rent	Ottu Veedu	t	D - Poor
127	1	ER / 0001 / 544	12/G/0843850	20,Kalliyammpudur Road,	9698190120	f	2014-10-08 01:00:00-04	f	Urdu	f		Rent		t	D - Poor
138	1	ER / 0001 / 555	12/G/0888566	417,Kunnathur Road,Kongu Nagar	9788479205/9894785147	f	2014-10-08 01:00:00-04	f	Urdu	f		Rent		t	D - Poor
116	1	ER / 0001 / 533	12/G/0715755	22/19,Raja Street,	9573577591	f	2014-10-08 01:00:00-04	f	Tamil	f		Rent	Ottu Veedu	t	C - Middle Class
152	1	ER / 0001 / 132		17,Kunnathur Road,Perundurai	4294221716	f	2014-09-08 01:00:00-04	f	Tamil	f		Own		t	B - Full Filled
131	1	ER / 0001 / 548	12/G/0716043	76/94,Masjith Street,	9942347114	f	2014-10-08 01:00:00-04	f	Tamil	f		Own	Ottu Veedu	t	C - Middle Class
119	1	ER / 0001 / 536	12/G/0721453	27/82,Nehru jee Street,	8973447330	f	2014-10-08 01:00:00-04	f	Tamil	f		Rent	Ottu Veedu	t	D - Poor
135	1	ER / 0001 / 552	12/G/0327082	223/226,Bhavani Road,	9965061559	f	2014-10-08 01:00:00-04	f	Tamil	f		Own	Concrete 	t	B - Full Filled
122	1	ER / 0001 / 539	12/G/0715855	41,Raja Street,		f	2014-10-08 01:00:00-04	f	Urdu	f		Rent		t	D - Poor
124	1	ER / 0001 / 541	12/G/0751711	35,Kovai Main Road,	9750532145	f	2014-10-08 01:00:00-04	f	Urdu	f		Rent		t	D - Poor
142	1	ER / 0001 / 122	12/G/1716007	83/37,Majeeed Street,Perundurai	9360708060	f	2014-09-08 01:00:00-04	f	Tamil	f		Own		t	C - Middle Class
126	1	ER / 0001 / 543				f	2014-10-08 01:00:00-04	f		f		Rent		t	E - Very Poor
140	1	ER / 0001 / 120		175,Raj Street,		f	2014-09-08 01:00:00-04	f		f		Rent		t	E - Very Poor
136	1	ER / 0001 / 553		37,Bhavani Road,	7373879232	f	2014-10-08 01:00:00-04	f	Tamil	f		Rent	Ottu Veedu	t	D - Poor
146	1	ER / 0001 / 126	12/G/0716654	45,Porumattaidar Lane,Perundurai	8489368167	f	2014-09-08 01:00:00-04	f	Tamil	f		Own	Tile	t	D - Poor
133	1	ER / 0001 / 550	12/G/0877832	,Pavai Lane,	9942199962/9940778862	f	2014-10-08 01:00:00-04	f	Tamil	f		Rent		t	D - Poor
134	1	ER / 0001 / 551	12/G/0721434	20,Nehru Jee Street,	9585648922	f	2014-10-08 01:00:00-04	f	Tamil	f		Rent	Ottu Veedu	t	E - Very Poor
143	1	ER / 0001 / 123	12/G/0859821	37/83,Majeeed Street,Perundurai	9345718161	f	2014-09-08 01:00:00-04	f	Tamil	f		Own	Terraced	t	C - Middle Class
141	1	ER / 0001 / 121	12/G/0716213	173,Kalliyampudur Road,Perundurai	9486274121	f	2014-09-08 01:00:00-04	f	Tamil	f		Rent		t	D - Poor
139	1	ER / 0001 / 119	15/G/0084395	2/132,Kalliyampudur Road,Perundurai	9787284681	f	2014-09-08 01:00:00-04	f	Tamil	f		Rent		t	E - Very Poor
149	1	ER / 0001 / 129	07/G/0128920	1/3A,Majeeed Street,Perundurai	9659316801	f	2014-09-08 01:00:00-04	f	Tamil	f		Rent		t	D - Poor
147	1	ER / 0001 / 127	12/G/0003192	11720,Bangala Street,Perundurai	9443498643	f	2014-09-08 01:00:00-04	f	Tamil	f		Own		t	D - Poor
153	1	ER / 0001 / 133		144-1-1,Pandian Street,Perundurai	8608983451	f	2014-09-08 01:00:00-04	f	Tamil	f		Rent		t	C - Middle Class
145	1	ER / 0001 / 125		26,Raj Street,		f	2014-09-08 01:00:00-04	f		f		Rent		t	E - Very Poor
148	1	ER / 0001 / 128	12/W/0085416	42,Majeeed Street,Perundurai	9043696040	f	2014-09-08 01:00:00-04	f	Tamil	f		Own	Terraced	t	A - Well Settled
157	1	ER / 0001 / 137	12/W/0085425	61,Majeeed Street,Perundurai	9698091785	f	2014-09-08 01:00:00-04	f	Tamil	f		Own	Sheet	t	D - Poor
151	1	ER / 0001 / 131	12/G/0841278	4,Sidambaranar Street,Perundurai	9965159192	f	2014-09-08 01:00:00-04	f	Tamil	f		Rent	Shell	t	C - Middle Class
150	1	ER / 0001 / 130		46/2,Bavadi Lane,Perundurai	9659542042	f	2014-09-08 01:00:00-04	f	Tamil	f		Rent		t	D - Poor
156	1	ER / 0001 / 136		309,Sathiya Street,		f	2014-09-08 01:00:00-04	f		f		Rent		t	E - Very Poor
154	1	ER / 0001 / 134	12/G/0873596	108,Pajanai Kovil Street,Perundurai	8489419936	f	2014-09-08 01:00:00-04	f	Tamil	f		Rent	Shell	t	D - Poor
159	1	ER / 0001 / 139	12/G/0820145	303,Sathya Street,Perundurai	9626630580	f	2014-09-08 01:00:00-04	f	Tamil	f		Rent	Shell	t	C - Middle Class
155	1	ER / 0001 / 135		287/1,Thai Nagar,		f	2014-09-08 01:00:00-04	f		f		Rent		t	E - Very Poor
161	1	ER / 0001 / 141		,Majeeed Street,Perundurai	9488854271	f	2014-09-08 01:00:00-04	f	Tamil	f		Own	Shell	t	D - Poor
158	1	ER / 0001 / 138	12/G/0815023	,Ayyappan Nagar,Perundurai	9942690786	f	2014-09-08 01:00:00-04	f	Tamil	f		Rent		t	D - Poor
160	1	ER / 0001 / 140	12/G/0762725	303,Sathya Street,Perundurai	95859704030	f	2014-09-08 01:00:00-04	f	Tamil	f		Rent	Shell	t	C - Middle Class
108	1	ER / 0001 / 525	12/G/0873798	163/92,Eroad Road,	7502040230	f	2014-10-08 01:00:00-04	f	Tamil	f		Rent		t	D - Poor
109	1	ER / 0001 / 526	12/G/0717132	77/87,Pavadi Lane,Raja Street	9578403312	f	2014-10-08 01:00:00-04	f	Urdu	f		Rent		t	D - Poor
107	1	ER / 0001 / 524	12/G/0721863	162,Asraf alla Dr.Hasratal Near,	7502040230	f	2014-10-08 01:00:00-04	f	Tamil	f		Rent		t	D - Poor
117	1	ER / 0001 / 534	12/g/0722259	22/19,Kalliyammpudur Road,	9750048461	f	2014-10-08 01:00:00-04	f	Tamil	f		Rent	Ottu Veedu	t	D - Poor
118	1	ER / 0001 / 535	12/G/0716281	12,Pavai Lane,	9786761154	f	2014-10-08 01:00:00-04	f	Tamil	f		Rent		t	D - Poor
121	1	ER / 0001 / 538				f	2014-10-08 01:00:00-04	f		f		Rent		t	E - Very Poor
123	1	ER / 0001 / 540	12/G/0721870	91,Pavadi Lane,	8870834659	f	2014-10-08 01:00:00-04	f	Urdu	f		Rent		t	D - Poor
129	1	ER / 0001 / 546	12/W/0006645	73,Masjith Street,	8526596116	f	2014-10-08 01:00:00-04	f	Tamil	f		Rent		t	D - Poor
130	1	ER / 0001 / 547	12/G/0717146	14,Raja Street,	7667639714	f	2014-10-08 01:00:00-04	f	Tamil	f		Rent		t	C - Middle Class
132	1	ER / 0001 / 549	12/G/0716211	375/417,Kalliyammpudur Road,	9842822298	f	2014-10-08 01:00:00-04	f	Urdu	f		Rent	Concrete 	t	B - Full Filled
183	1	ER / 0001 / 163		34,Kannagi Lane,		f	2014-09-08 01:00:00-04	f		f		Rent		t	E - Very Poor
162	1	ER / 0001 / 142	12/G/0715986	78,Sinnamadathu Palayam,Perundurai	9486274304	f	2014-09-08 01:00:00-04	f	Tamil	f		Own	Shell	t	C - Middle Class
205	2	TP / 0001 / 105	12/G/0375728	99,Periya Pallivasal Street,Alangiyam	8608084949	f	2015-11-13 09:48:56.048198-05	f	Tamil	f		Own	Shell	t	E - Very Poor
163	1	ER / 0001 / 143	12/G/0715894	24/1,Bavadi Street,Perundurai	9865720786	f	2014-09-08 01:00:00-04	f	Tamil	f		Own		t	C - Middle Class
198	2	TP / 0001 / 98	12/G/0375615	11/391,Palaya Agrahara Veethi,Alangiyam	9442339550	f	2015-11-13 09:48:55.009225-05	f	Tamil	f		Own		t	E - Very Poor
164	1	ER / 0001 / 144		34,Pillayatr Kovil Street,		f	2014-09-08 01:00:00-04	f		f		Rent		t	E - Very Poor
184	1	ER / 0001 / 164	12/G/0841345	414,Pallakkattur,Perundurai	9942327862	f	2014-09-08 01:00:00-04	f	Tamil	f		Own	Terraced	t	B - Full Filled
165	1	ER / 0001 / 145	12/G/0002550	22/16,Majeeed Street,Perundurai	9942897932	f	2014-09-08 01:00:00-04	f	Tamil	f		Rent	Shell	t	E - Very Poor
176	1	ER / 0001 / 156	12/G/0716088	113,Raj Street,Perundurai	9843297813	f	2014-09-08 01:00:00-04	f	Tamil	f		Own		t	E - Very Poor
168	1	ER / 0001 / 148		129,Kongu Nagar,		f	2014-09-08 01:00:00-04	f		f		Rent		t	E - Very Poor
171	1	ER / 0001 / 151	12/G/08773587	89/1,Raj Street,Perundurai	9003635685	f	2014-09-08 01:00:00-04	f	Tamil	f		Rent	Sheet	t	E - Very Poor
172	1	ER / 0001 / 152	12/G/0716526	417/1,Kunnathur Road,Perundurai	9965798162	f	2014-09-08 01:00:00-04	f	Tamil	f		Rent	Cement Sheet	t	D - Poor
187	1	ER / 0001 / 167		23/143,Raj Street,Perundurai	9843834484	f	2014-09-08 01:00:00-04	f	Tamil	f		Rent		t	D - Poor
177	1	ER / 0001 / 157		2/707,Thudupathi Road,		f	2014-09-08 01:00:00-04	f		f		Rent		t	E - Very Poor
178	1	ER / 0001 / 158		13181,Raj Street,		f	2014-09-08 01:00:00-04	f		f		Rent		t	E - Very Poor
169	1	ER / 0001 / 149	12/G/0717189	204/10,Kanunagaran Garden,Perundurai	9965716685	f	2014-09-08 01:00:00-04	f	Tamil	f		Own		t	D - Poor
170	1	ER / 0001 / 150	12/G/0716568	399,Kongu Nagar,Perundurai	9095350186	f	2014-09-08 01:00:00-04	f	Tamil	f		Own		t	E - Very Poor
179	1	ER / 0001 / 159		14,VPP Residency,		f	2014-09-08 01:00:00-04	f		f		Rent		t	E - Very Poor
174	1	ER / 0001 / 154	12/G/0819490	67/620,Nehru Street,Perundurai	9486942276	f	2014-09-08 01:00:00-04	f	Tamil	f		Rent		t	D - Poor
195	1	ER / 0001 / 175	N	399,Kunnathur Road,Perundurai	9578450782	f	2014-09-08 01:00:00-04	f		f		Rent	N	t	D - Poor
180	1	ER / 0001 / 160		14,VPP Residency,		f	2014-09-08 01:00:00-04	f		f		Rent		t	E - Very Poor
175	1	ER / 0001 / 155	12/G/0720446	129,Anna Nagar Sanatorium,Perundurai	9565907477	f	2014-09-08 01:00:00-04	f	Tamil	f		Own	Sheet	t	D - Poor
173	1	ER / 0001 / 153	12/G/0720934	462/1,Periyar Nagar,Perundurai	9942751763	f	2014-09-08 01:00:00-04	f	Tamil	f		Own	Terraced	t	C - Middle Class
181	1	ER / 0001 / 161	12/G/0716090	114/69,Majeed Street,Perundurai	9942944992	f	2014-09-08 01:00:00-04	f	Tamil	f		Own	Terraced	t	B - Full Filled
202	2	TP / 0001 / 102	33/G/0080157	2/45,Palaya Agrahara Veethi,Alangiyam	9842159121	f	2015-11-13 09:48:55.556588-05	f	Tamil	f		Rent		t	D - Poor
188	1	ER / 0001 / 168		92,Majeed Street,Perundurai		f	2014-09-08 01:00:00-04	f	Tamil	f		Own	Shell	t	D - Poor
182	1	ER / 0001 / 162		23,Majeed Street,		f	2014-09-08 01:00:00-04	f		f		Rent		t	E - Very Poor
196	2	TP / 0001 / 96	12/G/0427225	6/55A,South Muslim Street,Alangiyam	9092387542	f	2015-11-13 09:48:54.848689-05	f	Tamil	f		Rent		t	E - Very Poor
186	1	ER / 0001 / 166		17/168,Anna Nagar,		f	2014-09-08 01:00:00-04	f		f		Rent		t	E - Very Poor
192	1	ER / 0001 / 172	12/G/0699746	96,Anna Nagar,Perundurai	9524975344	f	2014-09-08 01:00:00-04	f	Tamil	f		Own	Shell	t	D - Poor
189	1	ER / 0001 / 169		17,Podi Mattai,		f	2014-09-08 01:00:00-04	f		f		Rent		t	E - Very Poor
185	1	ER / 0001 / 165	12/W/0001028	334,Kunnathur,Perundurai	9843297813	f	2014-09-08 01:00:00-04	f	Tamil	f		Own		t	D - Poor
197	2	TP / 0001 / 97		24/6,Periya Kadai Veethi,		f	2015-11-13 09:48:54.890935-05	f		f		Rent		t	E - Very Poor
190	1	ER / 0001 / 170		72,Kannagi Street,		f	2014-09-08 01:00:00-04	f		f		Rent		t	E - Very Poor
191	1	ER / 0001 / 171		71,Kannagi Street,		f	2014-09-08 01:00:00-04	f		f		Rent		t	E - Very Poor
208	2	TP / 0001 / 108	12/G/0376183	6/66,South Muslim Street,Alangiyam	7841509798	f	2015-11-13 09:48:56.418179-05	f	Tamil	f		Rent		t	E - Very Poor
203	2	TP / 0001 / 103	33/G/0075253	32295,Muslim Street,Alangiyam	7867905304	f	2015-11-13 09:48:55.691129-05	f	Tamil	f		Rent		t	D - Poor
193	1	ER / 0001 / 173		7,Kangi Kovil Road,		f	2014-09-08 01:00:00-04	f		f		Rent		t	E - Very Poor
200	2	TP / 0001 / 100	12/G/0375991	27,South Muslim Street,Alangiyam	9092014608	f	2015-11-13 09:48:55.294316-05	f	Tamil	f		Rent		t	E - Very Poor
194	1	ER / 0001 / 174	12/G/0815103	154,Kongu Nagar,Perundurai	9788523359	f	2014-09-08 01:00:00-04	f	Tamil	f		Rent		t	D - Poor
201	2	TP / 0001 / 101	12/G/0800228	2/61,Palaya Agrahara Veethi,Alangiyam	8682064655	f	2015-11-13 09:48:55.42457-05	f	Tamil	f		Own		t	B - Full Filled
209	2	TP / 0001 / 109	12/G/0375782	1/347,East Street,Alangiyam	8608211567	f	2015-11-13 09:48:56.665078-05	f	Tamil	f		Own		t	E - Very Poor
204	2	TP / 0001 / 104	12/G/0025989	6/66,South Muslim Street,Alangiyam	8608902872	f	2015-11-13 09:48:55.908806-05	f	Tamil	f		Rent		t	D - Poor
206	2	TP / 0001 / 106	12/G/0427206	6,Periya Pallivasal Street,Alangiyam	9965063327	f	2015-11-13 09:48:56.169261-05	f	Tamil	f		Own		t	E - Very Poor
207	2	TP / 0001 / 107	12/G/0427212	6/53,South Muslim Street,Alangiyam	9943651997	f	2015-11-13 09:48:56.210548-05	f	Tamil	f		Own	Shell	t	E - Very Poor
211	2	TP / 0001 / 111	12/G/0835795	3/129,East Street,Alangiyam	9688442723	f	2015-11-13 09:48:56.885616-05	f	Tamil	f		Rent	Shell	t	E - Very Poor
213	2	TP / 0001 / 114	12/G/0821151	407,Old Postoffice Street,Alangiyam	9751557209	f	2015-11-13 09:48:57.138096-05	f	Tamil	f		Rent		t	E - Very Poor
214	2	TP / 0001 / 115	12/G/0376475	23,South Street,Alangiyam	9500863787	f	2015-11-13 09:48:57.328537-05	f	Tamil	f		Own	Shell	t	E - Very Poor
166	1	ER / 0001 / 146	12/G/0715767	24/25,Raj Street,Perundurai	8508684995	f	2014-09-08 01:00:00-04	f	Tamil	f		Own	Shell	t	D - Poor
215	2	TP / 0001 / 116	12/G/0375780	161,South Muslim Street,Alangiyam	9715757127	f	2015-11-13 09:48:57.402201-05	f	Tamil	f		Own		t	E - Very Poor
167	1	ER / 0001 / 147	14/G/0185518	,Anna Nagar,Perundurai	8220894266	f	2014-09-08 01:00:00-04	f	Tamil	f		Rent	Shell	t	D - Poor
199	2	TP / 0001 / 99	12/G/0831266	104,South Muslim Street,Alangiyam	9751016990	f	2015-11-13 09:48:55.072806-05	f	Tamil	f		Own		t	E - Very Poor
210	2	TP / 0001 / 110		63,Periya Kadai Veethi,Alangiyam		f	2015-11-13 09:48:56.708803-05	f	Tamil	f		Rent		t	E - Very Poor
212	2	TP / 0001 / 112	12/G/0754612	1/217,North Street,Alangiyam	9887025066	f	2015-11-13 09:48:57.016112-05	f	Tamil	f		Own		t	E - Very Poor
232	2	TP / 0001 / 135	12/G/0376104	1/13,South Street,Alangiyam	8883298608	f	2015-11-13 09:48:58.960567-05	f	Tamil	f		Rent		t	E - Very Poor
216	2	TP / 0001 / 117	33/G/0075252	1/219,East Street,Alangiyam	7867983813	f	2015-11-13 09:48:57.535043-05	f	Tamil	f		Rent		t	E - Very Poor
229	2	TP / 0001 / 132	12/G/0375942	1/231,Periya Kadai Veethi,Alangiyam	9965863397	f	2015-11-13 09:48:58.701568-05	f	Tamil	f		Own	Shell	t	E - Very Poor
220	2	TP / 0001 / 121	12/G/0375725	97,Periya Pallivasal Street,Alangiyam	8608084949	f	2015-11-13 09:48:57.933077-05	f	Tamil	f		Own	Shell	t	E - Very Poor
230	2	TP / 0001 / 133	12/G/0375787	5/167,South Muslim Street,Alangiyam	9942531922	f	2015-11-13 09:48:58.7481-05	f	Tamil	f		Own	Shell	t	E - Very Poor
222	2	TP / 0001 / 123	12/G/0427199	3/65,South Muslim Street,Alangiyam	9095136259	f	2015-11-13 09:48:58.151501-05	f	Tamil	f		Rent	Shell	t	E - Very Poor
219	2	TP / 0001 / 120	12/G/0427369	17,North Muslim Street,Alangiyam	8888632959	f	2015-11-13 09:48:57.858943-05	f	Tamil	f		Own	Shell	t	E - Very Poor
254	2	TP / 0001 / 162	12/G/0427474	5/159,Madina Nagar,Alangiyam	9489875643	f	2015-11-13 09:49:00.924263-05	f	Tamil	f		Own		t	C - Middle Class
225	2	TP / 0001 / 128	12/G/0375672	5/54,Muslim Street,Alangiyam	9787314350	f	2015-11-13 09:48:58.446434-05	f	Tamil	f		Own	Shell	t	E - Very Poor
238	2	TP / 0001 / 141	12/W/0042775	2/21,Muslim Street,Alangiyam	8680826232	f	2015-11-13 09:48:59.614634-05	f	Tamil	f		Rent		t	D - Poor
231	2	TP / 0001 / 134	12/G/0025816	1/106,Kamaraj Nagar,Alangiyam	9626961654	f	2015-11-13 09:48:58.834015-05	f	Tamil	f		Rent		t	E - Very Poor
221	2	TP / 0001 / 122	12/G/0375575	5/68,Muslim Street,Alangiyam	9360503986	f	2015-11-13 09:48:58.021508-05	f	Tamil	f		Own		t	E - Very Poor
226	2	TP / 0001 / 129	12/G/0427183	89,South Muslim Street,Alangiyam	9488865589	f	2015-11-13 09:48:58.555079-05	f	Tamil	f		Rent		t	E - Very Poor
246	2	TP / 0001 / 150	12/G/0841475	,North Majeed Street,Alangiyam	9524259109	f	2015-11-13 09:49:00.253151-05	f	Tamil	f		Own	Shell	t	E - Very Poor
234	2	TP / 0001 / 137	12/G/0375528	1/335,Kamaraj Nagar,Alangiyam		f	2015-11-13 09:48:59.14378-05	f	Tamil	f		Rent		t	D - Poor
223	2	TP / 0001 / 126	12/G/0800212	5/10,Muslim Street,Alangiyam	9943278096	f	2015-11-13 09:48:58.245976-05	f	Tamil	f		Own	Shell	t	E - Very Poor
239	2	TP / 0001 / 142	33/G/0080056	1/401,1st Ward,Alangiyam	9486372711	f	2015-11-13 09:48:59.710608-05	f	Tamil	f		Own	Shell	t	D - Poor
224	2	TP / 0001 / 127	12/G/0376035	181,Periya Kadai Veethi,Alangiyam	9786887275	f	2015-11-13 09:48:58.333087-05	f	Tamil	f		Own	Shell	t	E - Very Poor
235	2	TP / 0001 / 138		81,Big Masjid Street,Alangiyam		f	2015-11-13 09:48:59.267903-05	f	Tamil	f		Own	Terraced	t	B - Full Filled
227	2	TP / 0001 / 130	12/G/0376185	2/210,Old Postoffice Street,Alangiyam	9786816366	f	2015-11-13 09:48:58.620686-05	f	Tamil	f		Own	Shell	t	E - Very Poor
247	2	TP / 0001 / 152	12/G/0375775	5/55,Madina Nagar,Alangiyam	9047215948	f	2015-11-13 09:49:00.305849-05	f	Tamil	f		Own		t	E - Very Poor
228	2	TP / 0001 / 131	12/G/0376010	4/46,South Street,Alangiyam		f	2015-11-13 09:48:58.640403-05	f	Tamil	f		Own	Shell	t	E - Very Poor
240	2	TP / 0001 / 143	12/G/0025993	5/76,South Muslim Street,Alangiyam	9092324349	f	2015-11-13 09:48:59.801203-05	f	Tamil	f		Own	Shell	t	E - Very Poor
243	2	TP / 0001 / 146	12/G/0025910	2/26,Old Agrahara Street,Alangiyam	9443301427	f	2015-11-13 09:48:59.998567-05	f	Tamil	f		Rent		t	E - Very Poor
248	2	TP / 0001 / 153		6/20,Alangiyam(south),Alangiyam	9545105762	f	2015-11-13 09:49:00.332055-05	f	Tamil	f		Rent		t	E - Very Poor
236	2	TP / 0001 / 139	33/G/0009716	2/184,Palaya Agrahara Veethi,Alangiyam	9047910069	f	2015-11-13 09:48:59.411907-05	f	Tamil	f		Own	Concreate	t	C - Middle Class
242	2	TP / 0001 / 145		63,Periya Kadai Veethi,Alangiyam	9626025353	f	2015-11-13 09:48:59.910746-05	f	Tamil	f		Own		t	E - Very Poor
237	2	TP / 0001 / 140	12/G/0427195	6/58,Periya Kadai Veethi,Alangiyam	8680826232	f	2015-11-13 09:48:59.514499-05	f	Tamil	f		Own		t	C - Middle Class
259	2	TP / 0001 / 167	33/G/0068284 	5/32,South Muslim Street,Alangiyam	9488942689	f	2015-11-13 09:49:01.382536-05	f	Tamil	f		Rent		t	C - Middle Class
251	2	TP / 0001 / 157	12/G/0375516	2/34,Palaya Agrahara Street,Alangiyam	9787552798	f	2015-11-13 09:49:00.630444-05	f	Tamil	f		Rent		t	E - Very Poor
249	2	TP / 0001 / 155	12/G/0375553	2/196,Palaya Agrahara Street,Alangiyam	9092442022	f	2015-11-13 09:49:00.439927-05	f	Tamil	f		Rent		t	E - Very Poor
244	2	TP / 0001 / 148		6/98,South Muslim Street,Alangiyam	9787458101	f	2015-11-13 09:49:00.088781-05	f	Tamil	f		Own		t	E - Very Poor
245	2	TP / 0001 / 149	12/G/0427205	5/171,South Muslim Street,Alangiyam	9524531245	f	2015-11-13 09:49:00.146597-05	f	Tamil	f		Own		t	E - Very Poor
252	2	TP / 0001 / 158	12/G/0025915	,South Street,Alangiyam		f	2015-11-13 09:49:00.765943-05	f		f		Rent		t	E - Very Poor
250	2	TP / 0001 / 156	33/5/0084496	2/37,Palaya Agrahara Street,Alangiyam	9943276798	f	2015-11-13 09:49:00.52821-05	f	Tamil	f		Rent		t	E - Very Poor
255	2	TP / 0001 / 163		,Madina Nagar,Alangiyam	9092376108	f	2015-11-13 09:49:01.028808-05	f	Tamil	f		Rent		t	E - Very Poor
256	2	TP / 0001 / 164	12/G/0755035	186,South Muslim Street,Alangiyam	9865899064	f	2015-11-13 09:49:01.091069-05	f	Tamil	f		Own		t	E - Very Poor
261	2	TP / 0001 / 169	12/G/0375584	6/102,Sinna Pallivasal Street,Alangiyam	9159532454	f	2015-11-13 09:49:01.490311-05	f	Tamil	f		Own	Concreate	t	D - Poor
258	2	TP / 0001 / 166	12/G/0364506	25,Periya Kadai Veethi,Alangiyam	9186929575	f	2015-11-13 09:49:01.247915-05	f	Tamil	f		Own	Shell	t	D - Poor
262	2	TP / 0001 / 170	12/G/0375660	57,Muslam Street,Alangiyam	9865061383	f	2015-11-13 09:49:01.56388-05	f	Tamil	f		Rent	Shell	t	E - Very Poor
260	2	TP / 0001 / 168	12/G/0375890	61,Indira Nagar,Alangiyam	9787234626	f	2015-11-13 09:49:01.425086-05	f	Tamil	f		Own		t	C - Middle Class
217	2	TP / 0001 / 118	12/G/0375957	2/149,Periya Kadai Veethi,Alangiyam	9698078082	f	2015-11-13 09:48:57.67872-05	f	Tamil	f		Rent		t	E - Very Poor
263	2	TP / 0001 / 171	12/G/0376031	2/56,Palaya Agraharam Street,Alangiyam	8608681154	f	2015-11-13 09:49:01.664652-05	f	Tamil	f		Rent		t	D - Poor
264	2	TP / 0001 / 172	12/G/0025839	2B67,Palaya Agraharam Street,Alangiyam	9943814153	f	2015-11-13 09:49:01.763096-05	f	Tamil	f		Rent		t	E - Very Poor
265	2	TP / 0001 / 173	12/G/0375722	5/64,Muslim Street,Alangiyam	9487070817	f	2015-11-13 09:49:01.806955-05	f	Tamil	f		Rent		t	D - Poor
266	2	TP / 0001 / 174	12/G/0025909	,,Alangiyam	8608003549	f	2015-11-13 09:49:01.887908-05	f	Tamil	f		Rent		t	C - Middle Class
218	2	TP / 0001 / 119	12/G/0376029	2/161,Periya Kadai Veethi,Alangiyam	9786103256	f	2015-11-13 09:48:57.802737-05	f	Tamil	f		Own		t	E - Very Poor
233	2	TP / 0001 / 136	12/G/0376138	1/233,South Street,Alangiyam	9043444886	f	2015-11-13 09:48:59.117945-05	f	Tamil	f		Rent		t	E - Very Poor
241	2	TP / 0001 / 144	12/W/0116514	3/141,South Muslim Street,Alangiyam	9626930834	f	2015-11-13 09:48:59.861294-05	f	Tamil	f		Own		t	E - Very Poor
253	2	TP / 0001 / 160	12/G/0768823	2/113,South Muslim Street,Alangiyam	9659785097	f	2015-11-13 09:49:00.791604-05	f		f		Own		t	E - Very Poor
257	2	TP / 0001 / 165		151,Muslim Street,		f	2015-11-13 09:49:01.159815-05	f		f		Rent		t	E - Very Poor
268	2	TP / 0001 / 178	33/G/0084495	4/81,South Muslim Street,Alangiyam	7402793200	f	2015-11-13 09:49:01.98197-05	f	Tamil	f		Rent		t	E - Very Poor
279	2	TP / 0001 / 191	12/G/0376008	53/73,Andhoniyar Street,Alangiyam	9788103366	f	2015-11-13 09:49:03.055908-05	f	Tamil	f		Own	Shell	t	E - Very Poor
269	2	TP / 0001 / 179	12/G/0375985	13,Periya Kadai Veethi,Alangiyam	9486440153	f	2015-11-13 09:49:02.072917-05	f	Tamil	f		Own		t	C - Middle Class
270	2	TP / 0001 / 180	12/G/0427322	9/13,Periya Pallivasal Street,Alangiyam	9481819345	f	2015-11-13 09:49:02.165738-05	f	Tamil	f		Own	Shell	t	C - Middle Class
313	1	ER / 0001 / 454	12/G/0881476	368/2,Selva Vinayagar Kovil Street,	9344006080	f	2014-10-08 01:00:00-04	f	Urdu	f		Rent		t	D - Poor
280	2	TP / 0001 / 192	33/G/0013947	2/69,Periya Kadai Veethi,Alangiyam	9442716485	f	2015-11-13 09:49:03.150512-05	f	Tamil	f		Rent		t	B - Full Filled
273	2	TP / 0001 / 183	12/G/0025919	1st Ward,Anna Nagar,Alangiyam	8190967688	f	2015-11-13 09:49:02.491278-05	f	Tamil	f		Rent		t	E - Very Poor
301	1	ER / 0001 / 442	12/G/0715773	14,Podi Mattaikkran Street,Kunnathur	8940730066	f	2014-10-08 01:00:00-04	f	Urdu	f		Rent		t	C - Middle Class
291	1	ER / 0001 / 432	12/G/0721741	298/3,Ram Nagar,	9566604540	f	2014-10-08 01:00:00-04	f	Tamil	f		Rent		t	D - Poor
274	2	TP / 0001 / 186	12/G/0427386	5/67-34,South Muslim Street,Alangiyam	8940173440	f	2015-11-13 09:49:02.682949-05	f	Tamil	f		Own	Shell	t	D - Poor
282	2	TP / 0001 / 194	12/G/0375631	24,South Muslim Street,Alangiyam	9843795565	f	2015-11-13 09:49:03.265251-05	f	Tamil	f		Rent	Shell	t	C - Middle Class
275	2	TP / 0001 / 187	12/G/0025912	5/151,Muslim Street,Alangiyam	8489973991	f	2015-11-13 09:49:02.796868-05	f	Tamil	f		Own		t	D - Poor
286	2	TP / 0001 / 198	12/G/0025827	2/211,Periya Kadai Veethi,Alangiyam	9442837236	f	2015-11-13 09:49:03.560229-05	f	Tamil	f		Rent		t	D - Poor
284	2	TP / 0001 / 196	12/G/0427376	24,South Muslim Street,Alangiyam	8681082002	f	2015-11-13 09:49:03.380128-05	f	Tamil	f		Own	Shell	t	C - Middle Class
276	2	TP / 0001 / 188	12/G/0427214	6/107b,South Muslim Street,Alangiyam	8940847858	f	2015-11-13 09:49:02.821404-05	f	Tamil	f		Own		t	C - Middle Class
292	1	ER / 0001 / 433	12/G/0715700	58,Kangi Kovil Road,	8675117164	f	2014-10-08 01:00:00-04	f	Tamil	f		Rent		t	D - Poor
300	1	ER / 0001 / 441	12/G/0716050	42-4/95,Majeeth Street,	9842836238	f	2014-10-08 01:00:00-04	f	Tamil	f		Rent		t	D - Poor
277	2	TP / 0001 / 189	12/G/0025826	65,Periya Kadai Veethi,Alangiyam	9042702049	f	2015-11-13 09:49:02.880116-05	f	Tamil	f		Rent		t	E - Very Poor
283	2	TP / 0001 / 195	33/W/0000090	5/36,South Muslim Street,Alangiyam	9965203936	f	2015-11-13 09:49:03.335607-05	f	Tamil	f		Rent	Shell	t	D - Poor
293	1	ER / 0001 / 434	12/G/0815777	22,Majeeth Street,	9994203965	f	2014-10-08 01:00:00-04	f	Tamil	f		Rent		t	D - Poor
299	1	ER / 0001 / 440	12/G/0815285	298/1,Tai Nagar,	9965245706	f	2014-10-08 01:00:00-04	f	Tamil	f		Own	Concrete Building	t	C - Middle Class
278	2	TP / 0001 / 190	12/G/0375769	180/149,Muslim Steeet,Alangiyam	8189998843	f	2015-11-13 09:49:03.010547-05	f	Tamil	f		Own		t	C - Middle Class
309	1	ER / 0001 / 450	12/G/0873797	37,Dhashgand Street,	9965023344	f	2014-10-08 01:00:00-04	f	Tamil	f		Rent		t	C - Middle Class
287	2	TP / 0001 / 199	12/G/0025990	42,South Muslim Street,Alangiyam	9489313305	f	2015-11-13 09:49:03.650205-05	f	Tamil	f		Own	Contract	t	B - Full Filled
288	2	TP / 0001 / 200	12/G/0376173	5/40,South Muslim Street,Alangiyam	9942444203	f	2015-11-13 09:49:03.703024-05	f	Tamil	f		Own	Shell	t	D - Poor
289	1	ER / 0001 / 430	12/G/0277650	22/26,Muhammadiyar Street,	9942588861	f	2014-10-08 01:00:00-04	f	Urdu	f		Rent		t	D - Poor
304	1	ER / 0001 / 445		37,Dhashgand Street,	9965023344	f	2014-10-08 01:00:00-04	f	Urdu	f		Rent		t	C - Middle Class
294	1	ER / 0001 / 435	12/G/0716417	2,Muhammadiyar Street,	9842476822	f	2014-10-08 01:00:00-04	f	Urdu	f		Rent		t	D - Poor
290	1	ER / 0001 / 431	WOU0373661	101,Dhashgand Street,	9842313114	f	2014-10-08 01:00:00-04	f	Urdu	f		Rent		t	D - Poor
303	1	ER / 0001 / 444	13/G/1371650	112,Pavadi lane ,Kongu Nagar	9865794345	f	2014-10-08 01:00:00-04	f	Tamil	f		Rent		t	C - Middle Class
295	1	ER / 0001 / 436	12/G/0721751	17,Dhashgand Street,	9751191326	f	2014-10-08 01:00:00-04	f	Tamil	f		Rent		t	D - Poor
296	1	ER / 0001 / 437	12/G/0057702	10,Gandhi Kovil Street,	8973281073	f	2014-10-08 01:00:00-04	f	Tamil	f		Rent		t	C - Middle Class
297	1	ER / 0001 / 438	12/G/0715966	,Dhashgand Street,	9842418484	f	2014-10-08 01:00:00-04	f	Tamil	f		Rent		t	D - Poor
298	1	ER / 0001 / 439	12/G/0881593	298/1,Tai Nagar,	9688855262	f	2014-10-08 01:00:00-04	f	Tamil	f		Own	Concrete Building	t	C - Middle Class
305	1	ER / 0001 / 446	12/G/0716474	19/27,Muhammadiyar Street,Kunnathur	9865946180	f	2014-10-08 01:00:00-04	f	Urdu	f		Rent		t	C - Middle Class
308	1	ER / 0001 / 449	WOU 0620369	42/161,Dhashgand Street,	8754767413	f	2014-10-08 01:00:00-04	f	Malayalam	f		Rent		t	C - Middle Class
302	1	ER / 0001 / 443	13/G/082274	74/1,Vannam Parai,	9360703175	f	2014-10-08 01:00:00-04	f	Tamil	f		Rent		t	D - Poor
307	1	ER / 0001 / 448	12/G/0759940	30,Raja Street,	7639647009	f	2014-10-08 01:00:00-04	f	Urdu	f		Rent		t	C - Middle Class
315	1	ER / 0001 / 456	12/G/0881502	2/7,Paavadi Street,Meakoor	9786483839	f	2014-10-08 01:00:00-04	f	Urdu	f		Rent		t	D - Poor
310	1	ER / 0001 / 451	12/G/0722453	59/7-1,,Bhagath Sing Nagar	9578649131	f	2014-10-08 01:00:00-04	f	Urdu	f		Own	Sheet	t	C - Middle Class
311	1	ER / 0001 / 452	12/G/0720906	412A,,Iyappa Nagar	8925682576	f	2014-10-08 01:00:00-04	f	Tamil	f		Own	Sheet	t	D - Poor
312	1	ER / 0001 / 453	12/W/00015303	31/8,Madathu palayam road,Balaji Nagar	9659058695	f	2014-10-08 01:00:00-04	f	Tamil	f		Rent		t	D - Poor
317	1	ER / 0001 / 458	21/G/0350257	44,Kumaran Street,	9943080598	f	2014-10-08 01:00:00-04	f	Tamil	f		Rent	Ottu Veedu	t	C - Middle Class
314	1	ER / 0001 / 455	12/W/0000972	21/1,Paavadi Street,	9965214202	f	2014-10-08 01:00:00-04	f	Tamil	f		Rent		t	D - Poor
319	1	ER / 0001 / 777				f	2014-08-08 01:00:00-04	f		f		Rent		t	E - Very Poor
316	1	ER / 0001 / 457		,Maykkal,Kalliyam Pudur	9842176535	f	2014-10-08 01:00:00-04	f	Tamil	f		Own	Concrete Building	t	C - Middle Class
318	1	ER / 0001 / 776		,Kalipudur,		f	2014-08-08 01:00:00-04	f		f		Rent		t	E - Very Poor
271	2	TP / 0001 / 181	12/G/0375962	2/179,Periya Kadai Veethi,Alangiyam	9445249870	f	2015-11-13 09:49:02.310813-05	f	Tamil	f		Own	Shell	t	D - Poor
272	2	TP / 0001 / 182	12/G/0375960	2/177,Periya Kadai Veethi,Alangiyam	7845086162	f	2015-11-13 09:49:02.431335-05	f	Tamil	f		Own	Shell	t	D - Poor
281	2	TP / 0001 / 193	12/G/0376001	40,South Street,Alangiyam	9585376341	f	2015-11-13 09:49:03.171434-05	f	Tamil	f		Rent		t	E - Very Poor
285	2	TP / 0001 / 197		6/118,South Muslim Street,Alangiyam	9942741346	f	2015-11-13 09:49:03.444037-05	f	Tamil	f		Rent		t	E - Very Poor
339	1	ER / 0001 / 797		61/132,Kunnathur road,		f	2014-08-21 01:00:00-04	f		f		Rent		t	E - Very Poor
352	1	ER / 0001 / 61	12/G/0715681	5\\9,Uppilar Str,	9688854787	f	2015-11-13 09:49:10.557281-05	f	Tamil	f		Own	Sheet	t	D - Poor
331	1	ER / 0001 / 789		0083A,Masjit street,Perundurai	8344721928	f	2014-08-08 01:00:00-04	f	Tamil	f		Own	Ottu Veedu	t	C - Middle Class
345	1	ER / 0001 / 54	N	449,Bavani Board Str,	9092375273	f	2015-11-13 09:49:10.12769-05	f	Tamil	f		Rent	Ciment	t	D - Poor
322	1	ER / 0001 / 780		21/1,Pavadi Street,Perundurai	98421266975	f	2014-08-08 01:00:00-04	f	Urdu	f		Own	Concret	t	C - Middle Class
340	1	ER / 0001 / 798		65,Kannagi street,Perundurai	9965618488	f	2014-08-08 01:00:00-04	f	Tamil	f		Own	Ottu Veedu	t	B - Full Filled
323	1	ER / 0001 / 781				f	2014-08-08 01:00:00-04	f	.	f		Rent		t	E - Very Poor
332	1	ER / 0001 / 790		128,Kondayan Thottam,		f	2014-08-19 01:00:00-04	f		f		Rent		t	E - Very Poor
324	1	ER / 0001 / 782		.1/4,Bavani Road,		f	2014-08-08 01:00:00-04	f		f		Rent		t	E - Very Poor
346	1	ER / 0001 / 55	12/G/0716323	10A,Pavadi Str,	9677788558	f	2015-11-13 09:49:10.174968-05	f	Tamil	f		Rent	N	t	D - Poor
42	1	ER / 0001 / 16		136,Kunnathur Road,		f	2014-09-08 01:00:00-04	f		f		Rent		t	E - Very Poor
347	1	ER / 0001 / 56	12/G/0699747	98/12,Anna Nagar,	9080030097	f	2015-11-13 09:49:10.218088-05	f	Tamil	f		Own	sheet	t	D - Poor
333	1	ER / 0001 / 791	12/G/0717356	343,kunnatur road,Perundurai	8012186965	f	2014-08-19 01:00:00-04	f	Tamil	f		Rent		t	D - Poor
341	1	ER / 0001 / 799	29/W/0011685	25,Bajani koil street ,Perundurai	9952614353	f	2014-08-16 01:00:00-04	f	Tamil	f		Rent		t	E - Very Poor
325	1	ER / 0001 / 783		33/2,Senyevalasu,Perundurai	9842092888	f	2014-08-08 01:00:00-04	f	Tamil	f		Rent		t	C - Middle Class
44	1	ER / 0001 / 18	12/G/0716117	58/124,Majeed Street,Perundurai	9524980005	f	2014-09-08 01:00:00-04	f	Tamil	f		Own	Shell	t	D - Poor
342	1	ER / 0001 / 51	N	4\\7,Mekkur Bajanai Kovil Str,Perundurai	9566805554	f	2015-11-13 09:49:09.797534-05	f	Tamil	f		Rent	N	t	D - Poor
326	1	ER / 0001 / 784		4,angothiri Tower,		f	2014-08-17 01:00:00-04	f		f		Rent		t	E - Very Poor
334	1	ER / 0001 / 792		65/125,Kannagi street,Perundurai	9962227185	f	2014-08-08 01:00:00-04	f	Tamil	f		Rent		t	B - Full Filled
120	1	ER / 0001 / 537	12/g/0897343	15,Chidambaranar Street,	8220262649	f	2014-10-08 01:00:00-04	f	Urdu	f		Rent		t	D - Poor
267	2	TP / 0001 / 175	12/G/0376460	10/368,Gandhi Nagar,Alangiyam		f	2015-11-13 09:49:01.933772-05	f	Tamil	f		Own	Shell	t	E - Very Poor
353	1	ER / 0001 / 62	12/G/0890103	87,Majid Str,	8220262616	f	2015-11-13 09:49:10.593764-05	f	Tamil	f		Rent	N	t	D - Poor
327	1	ER / 0001 / 785		99,Masjit street,Perundurai	9865922786	f	2014-08-08 01:00:00-04	f	Tamil	f		Rent		t	C - Middle Class
343	1	ER / 0001 / 52	12/G/0717313	77,Raja Str,	9788905229	f	2015-11-13 09:49:09.886645-05	f	Tamil	f		Rent	Sheet	t	D - Poor
335	1	ER / 0001 / 793		37/1,,		f	2014-08-21 01:00:00-04	f		f		Rent		t	E - Very Poor
328	1	ER / 0001 / 786	12/G/0881487	16,Masjit street,Perundurai	9786186980	f	2014-08-19 01:00:00-04	f	Tamil	f		Rent		t	D - Poor
348	1	ER / 0001 / 57	12/G/0716004	33,Pori Mandakar Str,	9894220169	f	2015-11-13 09:49:10.297107-05	f	Tamil	f		Rent	N	t	D - Poor
306	1	ER / 0001 / 447	12/G/0717097	140/11,Sri Maya Avenu ,Kunnathur	99949997031	f	2014-10-08 01:00:00-04	f	Tamil	f		Own	Concrete Building	t	B - Full Filled
344	1	ER / 0001 / 53	12/G/0716055	108/97,Raja Str,	9842958238	f	2015-11-13 09:49:10.026525-05	f	Tamil	f		Rent	Ciment	t	C - Middle Class
336	1	ER / 0001 / 794		14/A,pavade street,Perundurai	9585370004	f	2014-08-08 01:00:00-04	f	Tamil	f		Own		t	D - Poor
337	1	ER / 0001 / 795				f	2014-08-08 01:00:00-04	f	.	f		Rent		t	E - Very Poor
349	1	ER / 0001 / 58	12/G/0699786	138,Anna Nagar,	9524767559	f	2015-11-13 09:49:10.375258-05	f	Tamil	f		Own	sheet	t	D - Poor
329	1	ER / 0001 / 787		,Agrakara vedee,Perundurai	9842587611	f	2014-08-19 01:00:00-04	f	Tamil	f		Rent	Concret	t	B - Full Filled
354	1	ER / 0001 / 63	12/G/0717413	13,Muthaliyar Str,	9600274921	f	2015-11-13 09:49:10.654747-05	f	Tamil	f		Own	N	t	D - Poor
350	1	ER / 0001 / 59	12/G/0717182	137,Pavadi Str,	9940406085	f	2015-11-13 09:49:10.39786-05	f	Tamil	f		Rent	N	t	D - Poor
320	1	ER / 0001 / 778		250,Kunnathur Road,Perundurai	9488878605	f	2014-08-08 01:00:00-04	f	Tamil	f		Rent		t	C - Middle Class
321	1	ER / 0001 / 779		,,.		f	2014-08-08 01:00:00-04	f	.	f		Rent	.	t	E - Very Poor
330	1	ER / 0001 / 788		5A,pavade street,Perundurai	9965398982	f	2014-08-08 01:00:00-04	f	Tamil	f		Own		t	C - Middle Class
338	1	ER / 0001 / 796		381,Kunnathur road,Perundurai	8526596061	f	2014-08-08 01:00:00-04	f	Urdu	f		Rent	Line home	t	D - Poor
355	1	ER / 0001 / 64	12/G/0717382	N,Kunnathur Str,	7402014109	f	2015-11-13 09:49:10.709902-05	f	Tamil	f		Rent	N	t	D - Poor
351	1	ER / 0001 / 60	12/W/0000933	137C,Pavadi Str,	9940409500	f	2015-11-13 09:49:10.477961-05	f	Tamil	f		Rent	N	t	D - Poor
359	1	ER / 0001 / 68	12/G/0716383	4\\5,Bajanai Kovil Str,	9942690786	f	2015-11-13 09:49:10.89618-05	f	Tamil	f		Rent	N	t	D - Poor
356	1	ER / 0001 / 65	12/G/0699727	36/67,Anna Nagar,	8883108534	f	2015-11-13 09:49:10.771487-05	f	Tamil	f		Own	Sheet	t	D - Poor
357	1	ER / 0001 / 66	12/G/0717318	124,Raja Str,	8344096129	f	2015-11-13 09:49:10.81-05	f	Tamil	f		Rent	N	t	D - Poor
358	1	ER / 0001 / 67	12/G/0716681	21,Kamatchi Amman Str,	9442117620	f	2015-11-13 09:49:10.847412-05	f	Tamil	f		Rent	N	t	D - Poor
361	1	ER / 0001 / 70	12/W/0085429	29/63,Majid Str,	9442922786	f	2015-11-13 09:49:11.064549-05	f	Tamil	f		Rent	N	t	C - Middle Class
360	1	ER / 0001 / 69	12/G/0715703	2\\10P,Sileter Puram,	9750367962	f	2015-11-13 09:49:10.985376-05	f	Tamil	f		Own	Sheet	t	D - Poor
363	1	ER / 0001 / 72	N	94/4,Kalliyam Pudur,	9976136522	f	2015-11-13 09:49:11.173265-05	f	Tamil	f		Own	Building	t	C - Middle Class
362	1	ER / 0001 / 71	N	96/13,Kalliyam Pudur,	9842038712	f	2015-11-13 09:49:11.117394-05	f	Tamil	f		Rent	N	t	D - Poor
366	1	ER / 0001 / 75	12/G/0716215	N,Pavadi Str,	N	f	2015-11-13 09:49:11.501945-05	f	Tamil	f		Rent	N	t	D - Poor
364	1	ER / 0001 / 73	12/G/0717169	27,Muthaliyar Str,	8098988537	f	2015-11-13 09:49:11.329613-05	f	Tamil	f		Rent	N	t	D - Poor
365	1	ER / 0001 / 74	12/G/0699730	39/73,Anna Nagar,	8675653852	f	2015-11-13 09:49:11.426937-05	f	Tamil	f		Rent	N	t	D - Poor
368	1	ER / 0001 / 77	13/G/0949422	39/73,Anna Nagar,	8675653852	f	2015-11-13 09:49:11.580054-05	f	Tamil	f		Rent	N	t	D - Poor
369	1	ER / 0001 / 78	12/G/0715782	466-S,Annai Santhiya Nagar,	9942199879	f	2015-11-13 09:49:11.733133-05	f	Tamil	f		Own	Sheet	t	D - Poor
370	1	ER / 0001 / 79	12/G/0002661	406-T,Annai Santhiya Nagar,	9715563217	f	2015-11-13 09:49:11.883391-05	f	Tamil	f		Own	N	t	D - Poor
367	1	ER / 0001 / 76	12/G/0002530		8526596957	f	2014-10-08 01:00:00-04	f	Urdu	f		Rent		t	D - Poor
371	1	ER / 0001 / 80	12/W/0085446	68/116,Majid Str,	9842692333	f	2015-11-13 09:49:11.963051-05	f	Tamil	f		Own	Building	t	C - Middle Class
372	1	ER / 0001 / 81	12/G/0852052	68/116,Majid Str,	9842692333	f	2015-11-13 09:49:12.096217-05	f	Tamil	f		Own	Building	t	C - Middle Class
385	1	ER / 0001 / 94	12/G/0715874	47,Majid Str,	9345970917	f	2015-11-13 09:49:13.738512-05	f	Tamil	f		Own	N	t	D - Poor
373	1	ER / 0001 / 82	12/W/0000954	75,Majid Str,	9597580685	f	2015-11-13 09:49:12.225153-05	f	Tamil	f		Rent	Sheet	t	C - Middle Class
386	1	ER / 0001 / 95	N	2\\1,Pavadi Str,	9976273914	f	2015-11-13 09:49:13.82063-05	f	Tamil	f		Rent	N	t	C - Middle Class
374	1	ER / 0001 / 83	12/G/0762555	103,Kunnathur Road,	9894291029	f	2015-11-13 09:49:12.370582-05	f	Tamil	f		Own	N	t	D - Poor
413	1	ER / 0001 / 323	12/G/0715917	58,West School Str,Perundurai	9003937060	f	2015-11-13 09:49:17.948661-05	f	Tamil	f		Rent	Thars	t	D - Poor
375	1	ER / 0001 / 84	12/G/0815071	104,Kunnathur Road,	9994386983	f	2015-11-13 09:49:12.464702-05	f	Tamil	f		Rent	N	t	C - Middle Class
387	1	ER / 0001 / 96	12/W/0085678	37/17,Majid St,	9965061205	f	2015-11-13 09:49:13.913207-05	f	Tamil	f		Rent	N	t	B - Full Filled
400	1	ER / 0001 / 310	12/G/0717046	256/151,Kovai Main Road,Perundurai	9655539398	f	2015-11-13 09:49:16.279132-05	f	Tamil	f		Own	Sheet	t	C - Middle Class
376	1	ER / 0001 / 85	12/G/0716076	45,Majid Str,	9894083665	f	2015-11-13 09:49:12.606874-05	f	Tamil	f		Own	Thar	t	C - Middle Class
395	1	ER / 0001 / 305	12/G/0717246	67/71,Kunnathur Str,Perundurai	9965242364	f	2015-11-13 09:49:15.269293-05	f	Tamil	f		Own	Sheet	t	D - Poor
377	1	ER / 0001 / 86	12/G/0833931	45A,Majid Str,	9894104771	f	2015-11-13 09:49:12.704374-05	f	Tamil	f		Own	Thar	t	C - Middle Class
388	1	ER / 0001 / 97	12/G/0716329	15/1,Pavadi St,	9786862929	f	2015-11-13 09:49:14.132588-05	f	Tamil	f		Own	Building	t	B - Full Filled
411	1	ER / 0001 / 321	12/G/0715783	26/35,Raja Str,Perundurai	9751017860	f	2015-11-13 09:49:17.718882-05	f	Tamil	f		Rent	N	t	D - Poor
378	1	ER / 0001 / 87	12/G/0721391	26,Vivekananthar Str,	9362172726	f	2015-11-13 09:49:12.882873-05	f	Tamil	f		Rent	N	t	C - Middle Class
379	1	ER / 0001 / 88	12/W/0085445	110,Majid Str,	9994757727	f	2015-11-13 09:49:12.932261-05	f	Tamil	f		Own	Building	t	B - Full Filled
380	1	ER / 0001 / 89	12/G/0716392	192,Kalliyam Pudur,	7373556378	f	2015-11-13 09:49:12.988559-05	f	Tamil	f		Rent	N	t	D - Poor
389	1	ER / 0001 / 98	12/G/0823147	15,Majid Str,	9698243254	f	2015-11-13 09:49:14.246603-05	f	Tamil	f		Rent	N	t	D - Poor
381	1	ER / 0001 / 90	12/G/0815024	74/86,Majid Str,	9688131617	f	2015-11-13 09:49:13.127947-05	f	Tamil	f		Own	Sheet	t	C - Middle Class
405	1	ER / 0001 / 315	12/G/0002617	22,Bajanai Kovil Str,Perundurai	9789568586	f	2015-11-13 09:49:17.015154-05	f	Tamil	f		Rent	N	t	D - Poor
401	1	ER / 0001 / 311	12/G/0841617	56,Inthira Str,Perundurai	9787700635	f	2015-11-13 09:49:16.433944-05	f	Tamil	f		Rent	N	t	D - Poor
382	1	ER / 0001 / 91	12/G/0716015	84,Majid Str,	9790128483	f	2015-11-13 09:49:13.281138-05	f	Tamil	f		Own	N	t	C - Middle Class
396	1	ER / 0001 / 306	12/G/0034113	6,K.S Nagar,Perundurai	8695823553	f	2015-11-13 09:49:15.520051-05	f	Tamil	f		Rent	N	t	D - Poor
390	1	ER / 0001 / 99	N	8,Podi Mattakar Str,	9790135154	f	2015-11-13 09:49:14.442088-05	f	Tamil	f		Rent	N	t	C - Middle Class
383	1	ER / 0001 / 92	12/W/98268	88/80,Majid Str,	9025252828	f	2015-11-13 09:49:13.475507-05	f	Tamil	f		Own	Building	t	B - Full Filled
384	1	ER / 0001 / 93	N	3,Pavadi Str,	9940778760	f	2015-11-13 09:49:13.618793-05	f	Tamil	f		Rent	N	t	C - Middle Class
391	1	ER / 0001 / 100	N	5\\4,Kada Palayam,	8925335214	f	2015-11-13 09:49:14.593462-05	f	Tamil	f		Rent	N	t	D - Poor
392	1	ER / 0001 / 301	N	70/40,Majid Str,Perundurai	9842577843	f	2015-11-13 09:49:14.699723-05	f	Tamil	f		Rent	N	t	C - Middle Class
409	1	ER / 0001 / 319		28/1,28/1,Perundurai	9751383999	f	2015-11-13 09:49:17.453867-05	f	Tamil	f		Rent	N	t	D - Poor
393	1	ER / 0001 / 302	12/G/0003134	422/140,Santhi Koli Pannai,Perundurai	9943252143	f	2015-11-13 09:49:14.803819-05	f	Tamil	f		Rent	Sheet	t	C - Middle Class
397	1	ER / 0001 / 307	12/G/0716561	6\\88,Raja Str,Perundurai	9688455661	f	2015-11-13 09:49:15.720246-05	f	Tamil	f		Rent	N	t	D - Poor
406	1	ER / 0001 / 316	12/G/0716045	95,Muthaliyar Str,Perundurai	9750508846	f	2015-11-13 09:49:17.108981-05	f	Tamil	f		Rent	N	t	D - Poor
402	1	ER / 0001 / 312	12/G/0049476	148,Raja Str,Perundurai	9578054466	f	2015-11-13 09:49:16.627502-05	f	Tamil	f		Rent	N	t	D - Poor
394	1	ER / 0001 / 303	12/G/0715952	69,Majid Str,Perundurai	9865399133	f	2015-11-13 09:49:15.092548-05	f	Tamil	f		Own	N	t	D - Poor
398	1	ER / 0001 / 308	12/G/0717144	4/164,4/164,Perundurai	9894869896	f	2015-11-13 09:49:15.935801-05	f	Tamil	f		Rent	N	t	D - Poor
403	1	ER / 0001 / 313	12/W/0086698	149/1,Kannaki Str,Perundurai	9095336858	f	2015-11-13 09:49:16.732621-05	f	Tamil	f		Own	Building	t	B - Full Filled
399	1	ER / 0001 / 309	12/G/0862267	3/406,Iyapan Nagar,Perundurai	9790628882	f	2015-11-13 09:49:16.087584-05	f	Tamil	f		Own	Sheet	t	C - Middle Class
407	1	ER / 0001 / 317	12/W/0096098	82,Sinna Madathu Palayam,Perundurai	9488445248	f	2015-11-13 09:49:17.23438-05	f	Tamil	f	Need Treatment	Own	Sheet	t	D - Poor
404	1	ER / 0001 / 314	12/G/0716707	410,Water Tank Str,Perundurai	9443275875	f	2015-11-13 09:49:16.866139-05	f	Tamil	f		Own	Sheet	t	B - Full Filled
415	1	ER / 0001 / 325	12/W/0085426	156,Saja Str,Perundurai	9715527501	f	2015-11-13 09:49:18.173514-05	f	Tamil	f		Rent	Ottu House	t	D - Poor
412	1	ER / 0001 / 322	12/G/0619628	73/4,Kaliyam Pudur,Perundurai	8344357550	f	2015-11-13 09:49:17.83154-05	f	Tamil	f		Rent	N	t	D - Poor
408	1	ER / 0001 / 318	12/G/0717393	25,Kennadi Str,Perundurai	9894775494	f	2015-11-13 09:49:17.349919-05	f	Tamil	f		Rent	N	t	D - Poor
410	1	ER / 0001 / 320	12/G/0716375	144,Kaliyam Pudur,Perundurai	9994736870	f	2015-11-13 09:49:17.607724-05	f	Tamil	f		Rent	Building	t	B - Full Filled
414	1	ER / 0001 / 324		23/Na,Kaliyam Pudur,Perundurai	9965059765	f	2015-11-13 09:49:18.0233-05	f	Tamil	f		Own	N	t	C - Middle Class
416	1	ER / 0001 / 326	10/G/0035215	88/99,Raja Str,Perundurai	8973279605	f	2015-11-13 09:49:18.297322-05	f	Tamil	f		Rent	Thars	t	E - Very Poor
418	1	ER / 0001 / 328	12/W/0000951	35,Pavadi Str,Perundurai	7502075945	f	2015-11-13 09:49:18.613811-05	f	Tamil	f		Rent	N	t	C - Middle Class
417	1	ER / 0001 / 327	13/W/0091213	2\\8,Pavadi Str,Perundurai	8695899528	f	2015-11-13 09:49:18.457195-05	f	Tamil	f		Rent	N	t	D - Poor
419	1	ER / 0001 / 329	12/G/0820155	90/19,V.C.V Nagar,Perundurai	9786270754	f	2015-11-13 09:49:18.805541-05	f	Tamil	f		Own	Building	t	C - Middle Class
420	1	ER / 0001 / 330		43,Ennavannag Kaadu,Perundurai	9655294446	f	2015-11-13 09:49:18.917101-05	f	Tamil	f		Rent	N	t	E - Very Poor
421	1	ER / 0001 / 331		22,Pandiyan Str,Perundurai	8760080926	f	2015-11-13 09:49:19.065574-05	f	Tamil	f		Rent	N	t	D - Poor
422	1	ER / 0001 / 332		11\\2,Raja Str,Perundurai	9095062494	f	2015-11-13 09:49:19.219278-05	f	Tamil	f		Rent	N	t	D - Poor
423	1	ER / 0001 / 333	12/G/0716485	30/29,Mohamathiyar Str,Perundurai	9443820656	f	2015-11-13 09:49:19.375603-05	f	Tamil	f		Own	Ottu House	t	D - Poor
424	1	ER / 0001 / 334	12/G/0716486	30/29,Mohamathiyar Str,Perundurai	9443820656	f	2015-11-13 09:49:19.42915-05	f	Tamil	f		Own	Ottu House	t	D - Poor
437	1	ER / 0001 / 347	33/G/0041816	47,Majid Str,Perundurai	9894614224	f	2015-11-13 09:49:21.456314-05	f	Tamil	f		Rent	N	t	B - Full Filled
425	1	ER / 0001 / 335	12/G/0716481	30/29,Mohamathiyar Str,Perundurai	9952747453	f	2015-11-13 09:49:19.568583-05	f	Tamil	f		Rent	Ottu House	t	D - Poor
426	1	ER / 0001 / 336	08/G/0718128	106,Thaskan Str,Perundurai	7402066570	f	2015-11-13 09:49:19.738491-05	f	Tamil	f		Rent	N	t	D - Poor
457	1	ER / 0001 / 367	N	,Milliyanim Unit,Perundurai	8608700371	f	2015-11-13 09:49:24.578803-05	f	Tamil	f		Rent	Thars	t	C - Middle Class
438	1	ER / 0001 / 348	12/G/0715866	45,Majid Str,Perundurai	9943499983	f	2015-11-13 09:49:21.61141-05	f	Tamil	f		Own	Concreat	t	B - Full Filled
427	1	ER / 0001 / 337	12/G/0468198	13/29,Majid Str,Perundurai	9944561507	f	2015-11-13 09:49:19.965244-05	f	Tamil	f		Rent	N	t	D - Poor
428	1	ER / 0001 / 338	12/G/0715764	17/23,Majid Str,Perundurai	9976492342	f	2015-11-13 09:49:20.075986-05	f	Tamil	f		Own	Ottu House	t	C - Middle Class
443	1	ER / 0001 / 353	12/G/0831211	505/33,Akrahara Str,Perundurai	9488822088	f	2015-11-13 09:49:22.631614-05	f	Tamil	f		Rent	N	t	C - Middle Class
429	1	ER / 0001 / 339	13/G/0337472	17/2,Muthu Maariyaman Str,Perundurai	9788410009	f	2015-11-13 09:49:20.197705-05	f	Tamil	f		Rent	N	t	D - Poor
430	1	ER / 0001 / 340	10/G/0010695	88/80,Majid Str,Perundurai	9788944612	f	2015-11-13 09:49:20.367013-05	f	Tamil	f		Rent	N	t	C - Middle Class
431	1	ER / 0001 / 341	12/W/0001036	67,sithambaranar Str,Perundurai	9095808091	f	2015-11-13 09:49:20.468755-05	f	Tamil	f		Rent	N	t	B - Full Filled
452	1	ER / 0001 / 362	12/G/0720316	18/52,Vivekananthar Str,Perundurai	8220453559	f	2015-11-13 09:49:23.915416-05	f	Tamil	f		Rent	N	t	D - Poor
444	1	ER / 0001 / 354	12/G/0003185	107/49,Kannaki Str,Perundurai	9445804686	f	2015-11-13 09:49:22.797503-05	f	Tamil	f		Rent	N	t	D - Poor
432	1	ER / 0001 / 342	12/G/0715663	67,sithambaranar Str,Perundurai	9025373176	f	2015-11-13 09:49:20.733207-05	f	Tamil	f		Rent	N	t	B - Full Filled
439	1	ER / 0001 / 349	12/G/0716472	87/39,Majid Str,Perundurai	9025722588	f	2015-11-13 09:49:21.925003-05	f	Tamil	f		Rent	N	t	C - Middle Class
433	1	ER / 0001 / 343	12/G/0720902	306,Kunnathur Road,Perundurai	9842651449	f	2015-11-13 09:49:20.90664-05	f	Tamil	f		Own	Thars	t	B - Full Filled
458	1	ER / 0001 / 368	12/G/0002618	13/14,Sithambaranar Str,Perundurai	9791773192	f	2015-11-13 09:49:24.641608-05	f	Tamil	f		Rent	Thars	t	D - Poor
445	1	ER / 0001 / 355	12/G/0815750	412A,Iyappan Str,Perundurai	9715676848	f	2015-11-13 09:49:22.966168-05	f	Tamil	f		Own	Ottu House	t	C - Middle Class
434	1	ER / 0001 / 344	12/W/0096101	160,Raja Str,Perundurai	9092515576	f	2015-11-13 09:49:21.056741-05	f	Tamil	f		Rent	N	t	B - Full Filled
435	1	ER / 0001 / 345	12/G/0716044	94,Muthaliyar Str,Perundurai	9698570545	f	2015-11-13 09:49:21.127123-05	f	Tamil	f		Rent	N	t	C - Middle Class
440	1	ER / 0001 / 350	10/G/0965775	53/117,Majid Str,Perundurai	9655014720	f	2015-11-13 09:49:22.04253-05	f	Tamil	f		Rent	N	t	C - Middle Class
436	1	ER / 0001 / 346		,panikam Palayam,Perundurai	9965060091	f	2015-11-13 09:49:21.285596-05	f	Tamil	f		Own	Ottu House	t	C - Middle Class
446	1	ER / 0001 / 356	09/G/0162373	79,Majid Str,Perundurai	9944017186	f	2015-11-13 09:49:23.042013-05	f	Tamil	f		Rent	N	t	C - Middle Class
447	1	ER / 0001 / 357	12/G/0889626	20,Mohamathiyar Str,Perundurai	9865511679	f	2015-11-13 09:49:23.176687-05	f	Tamil	f		Rent	Sheet	t	C - Middle Class
448	1	ER / 0001 / 358	11/W/0032847	20,Mohamathiyar Str,Perundurai	9865661554	f	2015-11-13 09:49:23.268289-05	f	Tamil	f		Rent	Sheet	t	C - Middle Class
441	1	ER / 0001 / 351	12/G/0815065	99,Palaya Bus Stop,Perundurai	8760844793	f	2015-11-13 09:49:22.299555-05	f	Tamil	f		Rent	Ottu House	t	C - Middle Class
449	1	ER / 0001 / 359	N	299,Kilaku Aikavundan Palayam,Perundurai	9524289047	f	2015-11-13 09:49:23.389298-05	f	Tamil	f		Rent	N	t	D - Poor
442	1	ER / 0001 / 352	12/G/0473090	14,E.S Residance,Perundurai	9942199786	f	2015-11-13 09:49:22.41555-05	f	Tamil	f		Own	Concreat	t	B - Full Filled
461	1	ER / 0001 / 371	12/G/0715752	14/22,Raja Str,Perundurai	9788684844	f	2015-11-13 09:49:24.900885-05	f	Tamil	f		Rent	N	t	D - Poor
453	1	ER / 0001 / 363	12/G/0716649	43,Podi Mataikarar Str,Perundurai	9865944806	f	2015-11-13 09:49:24.108829-05	f	Tamil	f		Own	sheet	t	C - Middle Class
450	1	ER / 0001 / 360	12/G/0004814	5/145,Kilaku Aikavundan Palayam,Perundurai	9715752431	f	2015-11-13 09:49:23.51162-05	f	Tamil	f		Rent	N	t	D - Poor
454	1	ER / 0001 / 364	12/G/0777585	N,Madathu Palayam,Perundurai	8526596957	f	2015-11-13 09:49:24.144158-05	f	Tamil	f		Rent	N	t	E - Very Poor
451	1	ER / 0001 / 361	N	139,Muthaliyar Str,Perundurai	9788284838	f	2015-11-13 09:49:23.681998-05	f	Tamil	f		Rent	N	t	D - Poor
455	1	ER / 0001 / 365	12/W/0094899	12\\5,Kalliyam Pudur,Perundurai	8940207080	f	2015-11-13 09:49:24.227837-05	f	Tamil	f		Rent	N	t	C - Middle Class
459	1	ER / 0001 / 369	12/G/0777589	3,vallalar Str,Perundurai	9994984462	f	2015-11-13 09:49:24.728533-05	f	Tamil	f		Rent	N	t	D - Poor
456	1	ER / 0001 / 366	N	9B,Pavadi Str,Perundurai	9865443880	f	2015-11-13 09:49:24.431059-05	f	Tamil	f		Rent	N	t	D - Poor
465	1	ER / 0001 / 375	12/G/0717111	62/23,Sithambaranar Str,Perundurai	9659783756	f	2015-11-13 09:49:25.126727-05	f	Tamil	f		Rent	N	t	D - Poor
462	1	ER / 0001 / 372	N	,Nehru Str,Perundurai	7402306675	f	2015-11-13 09:49:24.980976-05	f	Tamil	f		Rent	N	t	D - Poor
460	1	ER / 0001 / 370	12/G/0814910	32/51,Anna Nagar,Perundurai	9842877779	f	2015-11-13 09:49:24.832964-05	f	Tamil	f		Own	N	t	B - Full Filled
463	1	ER / 0001 / 373	12/G/0716279	2/7A,Pavadi Str,Perundurai	9865955348	f	2015-11-13 09:49:25.016893-05	f	Tamil	f		Own	Thars	t	C - Middle Class
466	1	ER / 0001 / 376	12/G/0715950	35,Kalliyam Pudur,Perundurai		f	2015-11-13 09:49:25.172521-05	f	Tamil	f		Rent	N	t	E - Very Poor
464	1	ER / 0001 / 374	12/G/0884183	35/11,Pavadi Str,Perundurai	9976095692	f	2015-11-13 09:49:25.085589-05	f	Tamil	f		Rent	N	t	D - Poor
467	1	ER / 0001 / 377	N	83,Subash Santhira Bose Str,Perundurai	9952719907	f	2015-11-13 09:49:25.262488-05	f	Tamil	f		Own	Sheet	t	C - Middle Class
468	1	ER / 0001 / 378	12/G/0004798	5\\56,Kilaku Aikavundan Palayam,Perundurai	9976273809	f	2015-11-13 09:49:25.3521-05	f	Tamil	f		Rent	N	t	D - Poor
470	1	ER / 0001 / 380	12/W/0000970	21,Mohamathiyar Str,Perundurai	8344722353	f	2015-11-13 09:49:25.530754-05	f	Tamil	f		Rent	N	t	D - Poor
469	1	ER / 0001 / 379	12/G/0721252	9,Thiruvallur Str,Perundurai	9965021777	f	2015-11-13 09:49:25.440135-05	f	Tamil	f		Rent	N	t	D - Poor
471	1	ER / 0001 / 381	12/G/0715642	14/43,Pavadi Str,Perundurai	9486607786	f	2015-11-13 09:49:25.678876-05	f	Tamil	f		Rent	Sheet	t	C - Middle Class
472	1	ER / 0001 / 382	12/W/0085676	31,Podi Mataikarar Str,Perundurai	9600819786	f	2015-11-13 09:49:25.718583-05	f	Tamil	f		Rent	N	t	D - Poor
473	1	ER / 0001 / 383	12/G/0716569	29\\2,Mohamathiyar Str,Perundurai	9688171762	f	2015-11-13 09:49:25.789472-05	f	Tamil	f		Own	N	t	D - Poor
474	1	ER / 0001 / 384	12/G/0849136	106,Sanitoriyam,Perundurai	9788830007	f	2015-11-13 09:49:25.843322-05	f	Tamil	f		Rent	N	t	C - Middle Class
475	1	ER / 0001 / 385	12/W/0085754	106,Sanitoriyam,Perundurai	9842254148	f	2015-11-13 09:49:25.929006-05	f	Tamil	f		Rent	N	t	C - Middle Class
513	2	TP / 0001 / 12	12/G/0375981	6/113,Chinna Pallivasal Street,Alangiyam	9245494786	f	2015-11-13 09:49:28.86034-05	f	T	f		Own	Sheet	t	C - Middle Class
476	1	ER / 0001 / 386	12/G/0881529	137,Kunnathur Str,Perundurai	9952237878	f	2015-11-13 09:49:25.994407-05	f	Tamil	f		Own	Sheet	t	D - Poor
488	1	ER / 0001 / 398	12/G/0332356	N,M.P.C Nagar,Perundurai	8012686919	f	2015-11-13 09:49:27.048203-05	f	Tamil	f		Own	N	t	D - Poor
477	1	ER / 0001 / 387	12/G/0256020	14\\12,vallalar Str,Perundurai	9677313768	f	2015-11-13 09:49:26.05332-05	f	Tamil	f		Own	Apartment	t	C - Middle Class
506	2	TP / 0001 / 5	12/G/0375636	403,Old Post office Street,Alangiyam	9659785307	f	2015-11-13 09:49:28.27567-05	f	T	f		Rent		t	C - Middle Class
500	1	ER / 0001 / 599	12/G/0716217	12,Kuruththedu Masjith Street,Uppliyar Street	9543629371	f	2014-10-08 01:00:00-04	f	Tamil	f		Rent		t	D - Poor
478	1	ER / 0001 / 388	12/G/0815335	10\\14,kennadi Str,Perundurai	8681849455	f	2015-11-13 09:49:26.171432-05	f	Tamil	f		Rent	N	t	D - Poor
479	1	ER / 0001 / 389	12/G/0820153	31,Pilayar Kovil Str,Perundurai	9698838761	f	2015-11-13 09:49:26.231844-05	f	Tamil	f		Rent	N	t	E - Very Poor
489	1	ER / 0001 / 399	10/G/0977326	1,Raja Str,Perundurai	9443207000	f	2015-11-13 09:49:27.136171-05	f	Tamil	f		Rent	N	t	C - Middle Class
480	1	ER / 0001 / 390	N	62M,Hasnis Unit,Perundurai	8973410612	f	2015-11-13 09:49:26.318165-05	f	Tamil	f		Rent	N	t	D - Poor
481	1	ER / 0001 / 391	12/G/0332066	6/698,M.P.C Nagar,Perundurai	N	f	2015-11-13 09:49:26.380649-05	f	Tamil	f	Need Another Kitney	Own	Sheet	t	D - Poor
490	1	ER / 0001 / 400	10/G/0561254	6B/9,Pavadi Str,Perundurai	9043712344	f	2015-11-13 09:49:27.181801-05	f	Tamil	f		Rent	Thars	t	D - Poor
491	1	ER / 0001 / 590	112/G/0716261	416,Iyappan Nagar,Sullipalayam	9965791492	f	2014-10-08 01:00:00-04	f	Urdu	f		Own	Sheet	t	D - Poor
482	1	ER / 0001 / 392	12/W/0001037	436,Kunnathur Str,Perundurai	9688227144	f	2015-11-13 09:49:26.475776-05	f	Tamil	f		Rent	N	t	D - Poor
492	1	ER / 0001 / 591				f	2014-10-08 01:00:00-04	f		f		Rent		t	E - Very Poor
483	1	ER / 0001 / 393	12/G/0717163	67,Bajanai Kovil Str,Perundurai	8973281028	f	2015-11-13 09:49:26.576005-05	f	Tamil	f		Own	Sheet	t	D - Poor
493	1	ER / 0001 / 592	12/W/0118948	96,Masjith Street,	9894647783	f	2014-10-08 01:00:00-04	f	Urdu	f		Own	Concret	t	A - Well Settled
484	1	ER / 0001 / 394	12/G/0716008	84,Raja Str,Perundurai	9942163544	f	2015-11-13 09:49:26.682708-05	f	Tamil	f		Own	Thars	t	C - Middle Class
501	1	ER / 0001 / 600	WOU00065946	105/9,Dhasskaneet Street,Kongu Nagar	9952595385	f	2014-10-08 01:00:00-04	f	Tamil	f		Rent		t	D - Poor
494	1	ER / 0001 / 593	12/G/0819901	10,kennabu Street,	9965672866	f	2014-10-08 01:00:00-04	f	Urdu	f	Brain Tumer 	Rent	Ottu Veedu	t	D - Poor
485	1	ER / 0001 / 395	N	64/126,Kannaki Str,Perundurai	9965512123	f	2015-11-13 09:49:26.815396-05	f	Tamil	f		Own	Sheet	t	B - Full Filled
502	2	TP / 0001 / 1	12/W/0042795	2/83,Periya Pallivasal Street,Alangiyam	9842028098	f	2015-11-13 09:49:27.958935-05	f	T	f		Own		t	B - Full Filled
495	1	ER / 0001 / 594				f	2014-10-08 01:00:00-04	f		f		Rent		t	E - Very Poor
486	1	ER / 0001 / 396	12/W/0085461	174,Raja Str,Perundurai	9047419493	f	2015-11-13 09:49:26.935436-05	f	Tamil	f		Own	N	t	B - Full Filled
487	1	ER / 0001 / 397	12/G/0332018	N,M.P.C Nagar,Perundurai	8012686919	f	2015-11-13 09:49:26.954404-05	f	Tamil	f	Monthly Amount	Own	N	t	D - Poor
496	1	ER / 0001 / 595		155,Kaliyam pudur,		f	2014-10-08 01:00:00-04	f		f		Rent		t	E - Very Poor
510	2	TP / 0001 / 9	33/G/0012387	7/121,Chinna Pallivasal Street,Alangiyam	8608547860	f	2015-11-13 09:49:28.626395-05	f	T	f		Own		t	C - Middle Class
503	2	TP / 0001 / 2	33/W/0002438	2/89,Periya Pallivasal Street,Alangiyam	9884999095	f	2015-11-13 09:49:28.01433-05	f	T	f		Own		t	B - Full Filled
497	1	ER / 0001 / 596	12/G/0721905	14,Vanamparai,karumandi koli pallai	9003833298	f	2014-10-08 01:00:00-04	f	Tamil	f		Rent	Ottu Veedu	t	D - Poor
504	2	TP / 0001 / 3	12/G/0375539	2/61,Palaia Akiraharam Street,Alangiyam	9698078250	f	2015-11-13 09:49:28.037687-05	f	T	f		Own		t	E - Very Poor
498	1	ER / 0001 / 597	12/G/0002500	55,Madathu Palayam Road,	8526596957	f	2014-10-08 01:00:00-04	f	Urdu	f		Rent	Ottu Veedu	t	C - Middle Class
507	2	TP / 0001 / 6	13/G/0363778	14,Chinna Pallivasal Street,Alangiyam	9787855315	f	2015-11-13 09:49:28.354583-05	f	T	f		Rent		t	C - Middle Class
499	1	ER / 0001 / 598	12/G/0024384	45/1,Mugamathiyar Street,	8695861588	f	2014-10-08 01:00:00-04	f	Tamil	f		Rent		t	D - Poor
511	2	TP / 0001 / 10	12/G/0800210	5/28,Muslim street,Alangiyam	9655930180	f	2015-11-13 09:49:28.716867-05	f	T	f		Own		t	C - Middle Class
505	2	TP / 0001 / 4	12/G/0375974	5/48,North Muslim Street,Alangiyam	8608985411	f	2015-11-13 09:49:28.19306-05	f	T	f		Own		t	B - Full Filled
514	2	TP / 0001 / 13	12/G/0375651	35,North Muslim Street,Alangiyam	20106115	f	2015-11-13 09:49:28.918689-05	f	T	f		Own	SHEET	t	C - Middle Class
508	2	TP / 0001 / 7	12/G/0821152	7,North Muslim Street,Alangiyam	9448308575	f	2015-11-13 09:49:28.482723-05	f	T	f		Rent		t	C - Middle Class
512	2	TP / 0001 / 11	12/G/0025840	2/90A,Palaia Akiraharam Street,Alangiyam	8903292043	f	2015-11-13 09:49:28.783086-05	f	T	f		Own	Sheet	t	C - Middle Class
509	2	TP / 0001 / 8	12/G/0755033	3/112,Periya Kadai Street,Alangiyam	9484458730	f	2015-11-13 09:49:28.548714-05	f	T	f		Rent		t	C - Middle Class
515	2	TP / 0001 / 14	12/G/0427223	6/111,Chinna Pallivasal Street,Alangiyam	9245494786	f	2015-11-13 09:49:28.941507-05	f	T	f		Rent	SHEET	t	E - Very Poor
518	2	TP / 0001 / 17	12/G/0375552	2/172,Muslim street,Alangiyam	8056556324	f	2015-11-13 09:49:29.217928-05	f	T	f		Own	SHEET	t	C - Middle Class
519	2	TP / 0001 / 18		81,Peria kadai Street,Alangiyam	9776085811	f	2015-11-13 09:49:29.298539-05	f	T	f		Rent		t	C - Middle Class
516	2	TP / 0001 / 15	12/G/002591	6/71,Peria kadai Street,Alangiyam	8608232429	f	2015-11-13 09:49:29.020503-05	f	T	f		Rent	SHEET	t	C - Middle Class
517	2	TP / 0001 / 16	12/G/0375676	2/92,Palaia Akiraharam Street,Alangiyam	9715678086	f	2015-11-13 09:49:29.144378-05	f	T	f		Rent		t	C - Middle Class
520	2	TP / 0001 / 19	12/G/0025819	192/57,Peria kadai Street,Alangiyam	9047542218	f	2015-11-13 09:49:29.400926-05	f	T	f		Own	RC	t	C - Middle Class
521	2	TP / 0001 / 20		6/29,Muslim street,Alangiyam	9894391448	f	2015-11-13 09:49:29.557614-05	f	T	f		Own	RC	t	C - Middle Class
522	2	TP / 0001 / 21	12/W/0042768	2/63,OLD AKRAHARAM STREET,Alangiyam		f	2015-11-13 09:49:29.616993-05	f	T	f		Own	RC	t	C - Middle Class
523	2	TP / 0001 / 22	12/G/0375574	5/28,Muslim street,Alangiyam	9442962209	f	2015-11-13 09:49:29.745307-05	f	T	f		Own	RC	t	C - Middle Class
524	2	TP / 0001 / 23	12/G/0427483	1/104,Kamarajar Street,Alangiyam	8940071071	f	2015-11-13 09:49:29.894643-05	f	T	f		Own	RC	t	D - Poor
525	2	TP / 0001 / 24	12/G/0376051	6TH WARD,North Muslim Street,Alangiyam	9626042090	f	2015-11-13 09:49:30.082245-05	f	T	f		Own	RC	t	D - Poor
543	2	TP / 0001 / 42	12/G/0375961	2/178,Peria Kadai street,Alangiyam	9047542218	f	2015-11-13 09:49:32.292702-05	f	T	f		Rent		t	D - Poor
526	2	TP / 0001 / 25	12/G/0413296	33,OLD AKRAHARAM STREET,Alangiyam	9994441478	f	2015-11-13 09:49:30.37817-05	f	T	f		Own	RC	t	D - Poor
561	2	TP / 0001 / 60		4/36,North Muslim Street,Alangiyam	9150526063	f	2015-11-13 09:49:33.870804-05	f	T	f		Rent		t	E - Very Poor
544	2	TP / 0001 / 43	12/W/0042786	2/133,Peria Kadai street,Alangiyam	965550976	f	2015-11-13 09:49:32.413144-05	f	T	f		Rent		t	D - Poor
527	2	TP / 0001 / 26	12/G/0025845	2/3,1 ST WARD,Alangiyam	9659602549	f	2015-11-13 09:49:30.544973-05	f	T	f		Own	RC	t	D - Poor
528	2	TP / 0001 / 27		,,Alangiyam		f	2015-11-13 09:49:30.598155-05	f		f		Rent		t	E - Very Poor
529	2	TP / 0001 / 28	12/G/0375710	81,OLD AKRAHARAM STREET,Alangiyam	9750238599	f	2015-11-13 09:49:30.695325-05	f	T	f		Own	RC	t	D - Poor
530	2	TP / 0001 / 		,,Alangiyam		f	2015-11-13 09:49:30.732895-05	f		f		Rent		t	E - Very Poor
531	2	TP / 0001 / 30	12/G/0376053	3/112,Peria Kadai street,Alangiyam	4258245178	f	2015-11-13 09:49:30.762246-05	f	T	f		Rent		t	D - Poor
532	2	TP / 0001 / 31	12/G/0375987	5/14,North street,Alangiyam		f	2015-11-13 09:49:30.800015-05	f	T	f		Rent		t	D - Poor
533	2	TP / 0001 / 32		,,Alangiyam		f	2015-11-13 09:49:30.838217-05	f		f		Rent		t	E - Very Poor
553	2	TP / 0001 / 52	12/G/0375964	2/184,Peria Kadai street,Alangiyam	8807695450	f	2015-11-13 09:49:33.380106-05	f	T	f		Own		t	D - Poor
545	2	TP / 0001 / 44	14/G/0148227	2/14,OLD AKRAHARAM STREET,Alangiyam	9751401219	f	2015-11-13 09:49:32.530803-05	f	T	f		Rent		t	D - Poor
534	2	TP / 0001 / 33	12/G/0025823	2/151,Peria Kadai street,Alangiyam	9750238602	f	2015-11-13 09:49:31.029649-05	f	T	f		Rent		t	D - Poor
536	2	TP / 0001 / 35	12/G/0842488	145,Peria Kadai street,Alangiyam	7373249832	f	2015-11-13 09:49:31.140541-05	f	T	f		Rent		t	D - Poor
546	2	TP / 0001 / 45	12/G/0375566	4/4,North street,Alangiyam	9087191776	f	2015-11-13 09:49:32.672405-05	f	T	f		Rent		t	D - Poor
535	2	TP / 0001 / 34	33/G/0074148	5/153,Muslim Street,Alangiyam	9786094135	f	2015-11-13 09:49:31.267677-05	f	T	f		Rent		t	D - Poor
562	2	TP / 0001 / 61	12/G/0375624	20,North Muslim Street,Alangiyam	9865905733	f	2015-11-13 09:49:33.913201-05	f	T	f		Rent		t	E - Very Poor
537	2	TP / 0001 / 36	12/G/0376020	133,Peria Kadai street,Alangiyam	978268903	f	2015-11-13 09:49:31.450136-05	f	T	f		Rent		t	D - Poor
547	2	TP / 0001 / 46	12/G/0376015	6/33,Chinna Pallivasal Street,Alangiyam	9087191776	f	2015-11-13 09:49:32.814322-05	f	T	f		Rent		t	D - Poor
538	2	TP / 0001 / 37	12/G/0375834	295,OLD AKRAHARAM STREET,Alangiyam	04250-245152	f	2015-11-13 09:49:31.634402-05	f	T	f		Rent		t	D - Poor
548	2	TP / 0001 / 47	12/G/0427454	103,Chinna Pallivasal Street,Alangiyam	9965260398	f	2015-11-13 09:49:32.883265-05	f	T	f		Rent		t	D - Poor
539	2	TP / 0001 / 38	12/G/0025992	5/41,North street,Alangiyam	8608145486	f	2015-11-13 09:49:31.787428-05	f	T	f		Rent		t	D - Poor
540	2	TP / 0001 / 39	12/G/0427226	6/668,Chinna Pallivasal Street,Alangiyam		f	2015-11-13 09:49:31.847551-05	f	T	f		Rent		t	D - Poor
554	2	TP / 0001 / 53	12/G/0375975	5/52,North street,Alangiyam		f	2015-11-13 09:49:33.507818-05	f	T	f		Rent		t	D - Poor
541	2	TP / 0001 / 40	12/G/0427408	59,Peria Kadai street,Alangiyam	8526814526	f	2015-11-13 09:49:31.962239-05	f	T	f		Rent		t	D - Poor
549	2	TP / 0001 / 48	12/G/0376181	6/84,North street,Alangiyam	9965606878	f	2015-11-13 09:49:32.993271-05	f	T	f		Rent		t	D - Poor
542	2	TP / 0001 / 41	12/G/0375958	2/151,Peria Kadai street,Alangiyam	9943923450	f	2015-11-13 09:49:32.155312-05	f	T	f		Rent		t	D - Poor
563	2	TP / 0001 / 62	12/G/0375656	38,North Muslim Street,Alangiyam	9750057385	f	2015-11-13 09:49:33.957376-05	f	T	f		Own	SHEET	t	E - Very Poor
550	2	TP / 0001 / 49	33/G/0021137	6/16,Peria Kadai street,Alangiyam	8124331516	f	2015-11-13 09:49:33.100516-05	f	T	f		Own	RC	t	D - Poor
555	2	TP / 0001 / 54	12/G/0375541	2/80,OLD AKRAHARAM STREET,Alangiyam		f	2015-11-13 09:49:33.576469-05	f	T	f		Own	Sheet	t	D - Poor
551	2	TP / 0001 / 50		2/48,East street,Alangiyam	975127999	f	2015-11-13 09:49:33.19121-05	f	T	f		Rent		t	D - Poor
552	2	TP / 0001 / 51	33/G/0012423	2/182,Peria Kadai street,Alangiyam		f	2015-11-13 09:49:33.261074-05	f	T	f		Own		t	D - Poor
564	2	TP / 0001 / 63	12/G/0375713	82,North Muslim Street,Alangiyam	9655892219	f	2015-11-13 09:49:34.001052-05	f	T	f		Own	SHEET	t	C - Middle Class
556	2	TP / 0001 / 55	33/G/0021194	2/34,OLD AKRAHARAM STREET,Alangiyam	9843986587	f	2015-11-13 09:49:33.656969-05	f	T	f		Rent		t	E - Very Poor
557	2	TP / 0001 / 56		,,Alangiyam		f	2015-11-13 09:49:33.680551-05	f		f		Rent		t	E - Very Poor
565	2	TP / 0001 / 64		,,Alangiyam		f	2015-11-13 09:49:34.024838-05	f		f		Rent		t	E - Very Poor
558	2	TP / 0001 / 57	17/G/0618081	2/208,Peria Kadai street,Alangiyam	8098029399	f	2015-11-13 09:49:33.735569-05	f	T	f		Rent		t	E - Very Poor
559	2	TP / 0001 / 58	12/G/0800211	5/28,Muslim Street,Alangiyam	9655930180	f	2015-11-13 09:49:33.797573-05	f	T	f		Rent		t	E - Very Poor
560	2	TP / 0001 / 59	12/G/0375536	58,Old Postoffice Street,Alangiyam	9578808357	f	2015-11-13 09:49:33.815885-05	f	T	f		Rent		t	E - Very Poor
567	2	TP / 0001 / 68	12/G/0376052	40B,North street,Alangiyam	9487243763	f	2015-11-13 09:49:34.17245-05	f	T	f		Rent		t	E - Very Poor
566	2	TP / 0001 / 65	12/G/0375817	5/229,Muslim Street,Alangiyam	9655123632	f	2015-11-13 09:49:34.091321-05	f	T	f		Own	SHEET	t	E - Very Poor
569	2	TP / 0001 / 70	12/G/0376182	6/50,North street,Alangiyam	8760062934	f	2015-11-13 09:49:34.340278-05	f	T	f		Own	RC	t	E - Very Poor
574	2	TP / 0001 / 75	33/G/0061599	2/49,Peria pallivasal Street,Alangiyam	9965063327	f	2015-11-13 09:49:34.663207-05	f	T	f		Own		t	E - Very Poor
570	2	TP / 0001 / 71	12/G/0800214	5/157,Madheena Nagar,Alangiyam	8098230175	f	2015-11-13 09:49:34.418186-05	f	T	f		Own		t	E - Very Poor
568	2	TP / 0001 / 69	12/G/0427427	2/147,Peria Kadai street,Alangiyam	8608680091	f	2015-11-13 09:49:34.303432-05	f	T	f		Rent		t	E - Very Poor
571	2	TP / 0001 / 72	12/G/0375488	1/91,Muslim Street,Alangiyam		f	2015-11-13 09:49:34.455727-05	f	T	f		Rent		t	E - Very Poor
572	2	TP / 0001 / 73	12/G/0376040	2/210,North Muslim Street,Alangiyam	9786380391	f	2015-11-13 09:49:34.506405-05	f	T	f		Rent		t	E - Very Poor
575	2	TP / 0001 / 76	12/G/0376032	2/175,Peria Kadai street,Alangiyam	9221464790	f	2015-11-13 09:49:34.746924-05	f	T	f		Own		t	E - Very Poor
573	2	TP / 0001 / 74	12/G/0025847	1/213 C,Old Postoffice Street,Alangiyam	9659252770	f	2015-11-13 09:49:34.584283-05	f	T	f		Own		t	E - Very Poor
576	2	TP / 0001 / 77		,,Alangiyam		f	2015-11-13 09:49:34.769588-05	f		f		Rent		t	E - Very Poor
577	2	TP / 0001 / 78	12/G/04277380	5/104,North Muslim Street,Alangiyam	9159838455	f	2015-11-13 09:49:34.84074-05	f	T	f		Own		t	E - Very Poor
578	2	TP / 0001 / 79	12/G/0375846	6/43,Peria pallivasal Street,Alangiyam	7667419019	f	2015-11-13 09:49:34.884092-05	f	T	f		Rent		t	E - Very Poor
580	2	TP / 0001 / 81		,,Alangiyam		f	2015-11-13 09:49:35.006426-05	f		f		Rent		t	E - Very Poor
579	2	TP / 0001 / 80	12/G/0375783	5/165,Muslim Street,Alangiyam	7373675148	f	2015-11-13 09:49:34.98772-05	f	T	f		Rent		t	E - Very Poor
581	2	TP / 0001 / 82	12/W/116519	3/63,Peria Kadai street,Alangiyam	9524452259	f	2015-11-13 09:49:35.077699-05	f	T	f		Rent		t	E - Very Poor
601	1	ER / 0001 / 213	12/W/0095983	189/5,Kannaki Str,Perundurai	9962837311	f	2015-11-13 09:49:37.782482-05	f	Tamil	f		Rent	N	t	C - Middle Class
582	2	TP / 0001 / 83	12/G/0847010	2/79,Peria Kadai street,Alangiyam	9443348719	f	2015-11-13 09:49:35.231917-05	f	T	f		Rent		t	E - Very Poor
594	1	ER / 0001 / 206	12/G/0751699	73/1,Kaliyam Pudur,Perundurai	9788654903	f	2015-11-13 09:49:36.952144-05	f	Tamil	f		Own	Sheet	t	C - Middle Class
583	2	TP / 0001 / 84	12/G/0376025	147,North Muslim Street,Alangiyam	9788097983	f	2015-11-13 09:49:35.375049-05	f	T	f		Rent		t	E - Very Poor
607	1	ER / 0001 / 219	12/G/0873647	184/1,Kannaki Str,Perundurai	9578806680	f	2015-11-13 09:49:38.349918-05	f	Tamil	f		Rent	N	t	C - Middle Class
595	1	ER / 0001 / 207	12/W/0086637	52,Subasanthira Bose,Perundurai	9443023275	f	2015-11-13 09:49:37.045274-05	f	Tamil	f		Own	Thars	t	C - Middle Class
584	2	TP / 0001 / 85	12/G/0427198	2,Peria pallivasal Street,Alangiyam	9965174951	f	2015-11-13 09:49:35.521295-05	f	T	f		Rent		t	E - Very Poor
585	2	TP / 0001 / 86		,,Alangiyam		f	2015-11-13 09:49:35.571185-05	f		f		Rent		t	E - Very Poor
586	2	TP / 0001 / 87	33/G/0071735	3,Singmar Rice mill,Alangiyam	91766716376	f	2015-11-13 09:49:35.711344-05	f	T	f		Rent		t	E - Very Poor
587	2	TP / 0001 / 88		,,Alangiyam		f	2015-11-13 09:49:35.759512-05	f		f		Rent		t	E - Very Poor
588	2	TP / 0001 / 89	12/G/0427221	6/1,North Muslim Street,Alangiyam		f	2015-11-13 09:49:35.789416-05	f	T	f		Rent		t	E - Very Poor
619	1	ER / 0001 / 231	12/G/0002581	45/23,Subasanthira Bose,Perundurai	9842308532	f	2015-11-13 09:49:40.275851-05	f	Tamil	f		Own	Thar	t	C - Middle Class
602	1	ER / 0001 / 214	12/G/0779061	192/63A,Kannaki Str,Perundurai	7502706587	f	2015-11-13 09:49:37.895909-05	f	Tamil	f		Rent	N	t	C - Middle Class
596	1	ER / 0001 / 208	12/G/0715870	27,Paavara Str,Perundurai	9443243431	f	2015-11-13 09:49:37.205263-05	f	Tamil	f		Rent	N	t	C - Middle Class
589	1	ER / 0001 / 201	12/G/0717211	102/27,Kunnathur str,Perundurai	9894472902	f	2015-11-13 09:49:36.038885-05	f	Tamil	f		Own	Building	t	C - Middle Class
608	1	ER / 0001 / 220	12/G/0896430	192/62A,Kannaki Str,Perundurai	8012269422	f	2015-11-13 09:49:38.438605-05	f	Tamil	f		Rent	N	t	C - Middle Class
590	1	ER / 0001 / 202	12/G/0716092	90/101,Raja Str,Perundurai	9488381941	f	2015-11-13 09:49:36.238203-05	f	Tamil	f		Rent	N	t	D - Poor
603	1	ER / 0001 / 215	12/G/0829171	89,Mohamadiya Str,Perundurai	9842691855	f	2015-11-13 09:49:37.979698-05	f	Tamil	f		Rent	N	t	C - Middle Class
597	1	ER / 0001 / 209	12/G/0716399	22,Sarayakara Thottam,Perundurai	9940818441	f	2015-11-13 09:49:37.337101-05	f	Tamil	f		Rent	Sheet	t	D - Poor
591	1	ER / 0001 / 203	12/G/0762771	13/1,Marutha Str,Perundurai	9965453242	f	2015-11-13 09:49:36.414704-05	f	Tamil	f		Rent	N	t	D - Poor
598	1	ER / 0001 / 210	12/G/0716307	14A,N,Perundurai	9750857320	f	2015-11-13 09:49:37.433667-05	f	Tamil	f		Own	Sheet	t	D - Poor
592	1	ER / 0001 / 204	12/G/0715948	13/2,Uppilaar Str,Perundurai	9442156786	f	2015-11-13 09:49:36.629735-05	f	Tamil	f		Rent	N	t	D - Poor
622	1	ER / 0001 / 234	12/G/0715788	27,Majid Str,Perundurai	9524150331	f	2015-11-13 09:49:40.604797-05	f	Tamil	f		Own	Sheet	t	C - Middle Class
609	1	ER / 0001 / 221	No	117,Kannaki Str,Perundurai	8940921041	f	2015-11-13 09:49:38.505104-05	f	Tamil	f		Rent	N	t	D - Poor
599	1	ER / 0001 / 211	12/G/0815091	20,Kaliyam Pudur,Perundurai	9944102912	f	2015-11-13 09:49:37.538671-05	f	Tamil	f		Rent	Sheet	t	D - Poor
593	1	ER / 0001 / 205	12/W/0085455	140,Raja Str,Perundurai	9842651442	f	2015-11-13 09:49:36.824556-05	f	Tamil	f		Own	Sheet	t	C - Middle Class
604	1	ER / 0001 / 216	12/G/0715827	34/105,Majid Str,Perundurai	8526399946	f	2015-11-13 09:49:38.092374-05	f	Tamil	f		Own	Concrete	t	C - Middle Class
600	1	ER / 0001 / 212	12/G/0716308	14A,Paavara Str,Perundurai	9750857320	f	2015-11-13 09:49:37.680204-05	f	Tamil	f		Own	Sheet	t	D - Poor
613	1	ER / 0001 / 225	12/G/0721830	65/25,Kannaki Str,Perundurai	7373342080	f	2015-11-13 09:49:39.233897-05	f	Tamil	f		Own	Sheet	t	B - Full Filled
605	1	ER / 0001 / 217	12/G/0721664	192A,Kannaki Str,Perundurai	8344734504	f	2015-11-13 09:49:38.19453-05	f	Tamil	f		Rent	N	t	C - Middle Class
610	1	ER / 0001 / 222	12/G/0721933	190,Kannaki Str,Perundurai	9944920557	f	2015-11-13 09:49:38.671624-05	f	Tamil	f		Own	N	t	C - Middle Class
606	1	ER / 0001 / 218	12/W/0086799	105/A,Thaskanth Str,Perundurai	9842731077	f	2015-11-13 09:49:38.26769-05	f	Tamil	f		Rent	N	t	B - Full Filled
616	1	ER / 0001 / 228	12/G/0715810	368,Kunnathur Road,Perundurai	9688448475	f	2015-11-13 09:49:40.069052-05	f	Tamil	f		Rent	N	t	C - Middle Class
617	1	ER / 0001 / 229	12/G/0716420	3,Mohamathiyer Str,Perundurai	4294220582	f	2015-11-13 09:49:40.110415-05	f	Tamil	f		Rent	N	t	C - Middle Class
614	1	ER / 0001 / 226	12/W/0001526	139/3,Kannaki Str,Perundurai	9962227185	f	2015-11-13 09:49:39.384188-05	f	Tamil	f		Rent	N	t	B - Full Filled
611	1	ER / 0001 / 223	12/G/0815430	16/9,Uppilaar Str,Perundurai	9842332703	f	2015-11-13 09:49:38.828034-05	f	Tamil	f		Rent	N	t	D - Poor
612	1	ER / 0001 / 224	12/G/0715959	102A,Majid Str,Perundurai	8220443436	f	2015-11-13 09:49:39.000008-05	f	Tamil	f		Rent	N	t	C - Middle Class
618	1	ER / 0001 / 230	12/W/0085517	69/96,Mohamathiyer Str,Perundurai	9443845588	f	2015-11-13 09:49:40.18572-05	f	Tamil	f		Own	Concrete	t	B - Full Filled
621	1	ER / 0001 / 233	12/G/0720539	90/42,Kanchi Kovil Str,Perundurai	9715563029	f	2015-11-13 09:49:40.496466-05	f	Tamil	f		Rent	N	t	C - Middle Class
615	1	ER / 0001 / 227	11/W/0013455	3/421V,Annai Sathya Str,Perundurai	9688855787	f	2015-11-13 09:49:39.642968-05	f	Tamil	f		Own	Sheet	t	C - Middle Class
620	1	ER / 0001 / 232	N	N,Pantiyan Str,Perundurai	9965698277	f	2015-11-13 09:49:40.369516-05	f	Tamil	f		Rent	Sheet	t	D - Poor
626	1	ER / 0001 / 238	12/G/0716309	25/14B,Pavadi Str,Perundurai	9965016868	f	2015-11-13 09:49:40.919249-05	f	Tamil	f	Monthly Amount	Own	Sheet	t	D - Poor
625	1	ER / 0001 / 237	12/G/0721152	253,Bavani Main Road,Perundurai	9843636813	f	2015-11-13 09:49:40.864339-05	f	Tamil	f		Rent	N	t	E - Very Poor
624	1	ER / 0001 / 236	Applaid	216,Pavadi Str,Perundurai	9442604739	f	2015-11-13 09:49:40.795169-05	f	Tamil	f		Rent	N	t	D - Poor
623	1	ER / 0001 / 235	12/G/0716279	7,Pavadi Str,Perundurai	9442604739	f	2015-11-13 09:49:40.71678-05	f	Tamil	f		Own	Sheet	t	D - Poor
627	1	ER / 0001 / 239		449,Kada Palayam Str,Perundurai	8608700370	f	2015-11-13 09:49:40.986532-05	f	Tamil	f		Rent	N	t	C - Middle Class
628	1	ER / 0001 / 240	12/G/0881655	61/1,Kannaki Str,Perundurai	9003340678	f	2015-11-13 09:49:41.050324-05	f	Tamil	f		Own	Thars	t	C - Middle Class
629	1	ER / 0001 / 241	12/W/0096300	40A/28,Majid Str,Perundurai	9524150510	f	2015-11-13 09:49:41.15044-05	f	Tamil	f		Rent	N	t	D - Poor
630	1	ER / 0001 / 242	12/G/0715639	2\\1,Bajani Kovil Str,Perundurai	9865955352	f	2015-11-13 09:49:41.24076-05	f	Tamil	f		Rent	N	t	C - Middle Class
631	1	ER / 0001 / 243	12/G/0762740	130/269,Bajani Kovil Str,Perundurai	9787639421	f	2015-11-13 09:49:41.341918-05	f	Tamil	f		Own	Sheet	t	C - Middle Class
632	1	ER / 0001 / 244	12/G/0002669	32D,Kaliyam Pudur Road,Perundurai	9751435616	f	2015-11-13 09:49:41.404244-05	f	Tamil	f		Rent	N	t	D - Poor
643	1	ER / 0001 / 255	12/G/0002557	34,Majid Str,Perundurai	8148493560	f	2015-11-13 09:49:42.45185-05	f	Tamil	f		Rent	Sheet	t	C - Middle Class
633	1	ER / 0001 / 245	12/G/0715850	40,Majid Str,Perundurai	9698342616	f	2015-11-13 09:49:41.495731-05	f	Tamil	f		Rent	N	t	D - Poor
644	1	ER / 0001 / 256	12/W/0001026	112/5,Kongu Nagar,Perundurai	9025294388	f	2015-11-13 09:49:42.484545-05	f	Tamil	f		Rent	Thars	t	C - Middle Class
634	1	ER / 0001 / 246	12/G/0849256	42,Majid Str,Perundurai	9688746443	f	2015-11-13 09:49:41.550031-05	f	Tamil	f		Rent	N	t	D - Poor
635	1	ER / 0001 / 247	12/G/0716518	32/46,Mohamathiyer Str,Perundurai	8807962662	f	2015-11-13 09:49:41.614104-05	f	Tamil	f		Rent	Sheet	t	D - Poor
645	1	ER / 0001 / 257	12/G/0717037	200/3,Kongu Nagar,Perundurai	9944636318	f	2015-11-13 09:49:42.553075-05	f	Tamil	f		Rent	N	t	D - Poor
636	1	ER / 0001 / 248	12/G/0716514	35,Bajani Kovil Str,Perundurai	9842185980	f	2015-11-13 09:49:41.728048-05	f	Tamil	f		Rent	Sheet	t	D - Poor
660	1	ER / 0001 / 272	Applaid	180,Raja Str,Perundurai	9600700786	f	2015-11-13 09:49:44.276204-05	f	Tamil	f		Rent	N	t	D - Poor
661	1	ER / 0001 / 273	12/G/0721921	149/5,Kannaki Str,Perundurai	9965245700	f	2015-11-13 09:49:44.306278-05	f	Tamil	f		Rent	N	t	D - Poor
637	1	ER / 0001 / 249	12/G/0002553	417/8,Kaliyam Pudur Road,Perundurai	9842767840	f	2015-11-13 09:49:41.814596-05	f	Tamil	f		Own	Thars	t	D - Poor
638	1	ER / 0001 / 250	12/G/0879056	65,Kannaki Str,Perundurai	9965618488	f	2015-11-13 09:49:41.877521-05	f	Tamil	f		Own	Sheet	t	C - Middle Class
646	1	ER / 0001 / 258	12/G/0003050	5-306/16,Sulaiman Appartment,Perundurai	9787469354	f	2015-11-13 09:49:42.657616-05	f	Tamil	f		Rent	Thar	t	C - Middle Class
639	1	ER / 0001 / 251	12/G/0815005	47,Majid Str,Perundurai	9994176525	f	2015-11-13 09:49:41.963147-05	f	Tamil	f		Rent	Sheet	t	C - Middle Class
654	1	ER / 0001 / 266	12/G/0003143	28/49,Kada Vaalayam/ Bavani Road,Perundurai	9944566374	f	2015-11-13 09:49:43.495673-05	f	Tamil	f		Rent	N	t	D - Poor
640	1	ER / 0001 / 252	12/G/0002430	82,Sinna Madathu Palayam,Perundurai	9787639289	f	2015-11-13 09:49:42.057983-05	f	Tamil	f		Own	N	t	C - Middle Class
647	1	ER / 0001 / 259	N	18,Raja Str,Perundurai	9842645786	f	2015-11-13 09:49:42.746148-05	f	Tamil	f		Rent	Sheet	t	D - Poor
673	1	ER / 0001 / 285		162,Kannaki Str,Perundurai	9842321978	f	2015-11-13 09:49:46.168327-05	f	Tamil	f		Rent		t	C - Middle Class
641	1	ER / 0001 / 253		34/8,Inthira Str,Perundurai	9843376651	f	2015-11-13 09:49:42.15559-05	f	Tamil	f		Rent	N	t	C - Middle Class
655	1	ER / 0001 / 267	12/G/0815072	409,Kunnathur str,Perundurai	9095808036	f	2015-11-13 09:49:43.60189-05	f	Tamil	f		Rent	N	t	D - Poor
648	1	ER / 0001 / 260	12/W/0000949	24/25,Raja Str,Perundurai	9150198395	f	2015-11-13 09:49:42.827807-05	f	Tamil	f		Rent	N	t	D - Poor
649	1	ER / 0001 / 261	12/G/0849249	38/32,Kaliyam Pudur Road,Perundurai	9750048530	f	2015-11-13 09:49:42.893214-05	f	Tamil	f		Rent	N	t	D - Poor
666	1	ER / 0001 / 278	12/G/0716531	29/4,Mohamathiyer Str,Perundurai	9688171762	f	2015-11-13 09:49:45.018304-05	f	Tamil	f		Rent	N	t	D - Poor
662	1	ER / 0001 / 274	12/W/0001530	149/5,Kannaki Str,Perundurai	9965245700	f	2015-11-13 09:49:44.446667-05	f	Tamil	f		Rent	N	t	D - Poor
642	1	ER / 0001 / 254		66,Kannaki Str,Perundurai	9688667622	f	2015-11-13 09:49:42.387768-05	f	Tamil	f		Rent	Sheet	t	B - Full Filled
656	1	ER / 0001 / 268	12/G/0815310	6,Kennadi Str,Perundurai	9524230785	f	2015-11-13 09:49:43.738605-05	f	Tamil	f		Rent	N	t	D - Poor
650	1	ER / 0001 / 262	12/W/0095342	45/23,Subasanthira Bose,Perundurai	9894504713	f	2015-11-13 09:49:42.986323-05	f	Tamil	f		Own	Thar	t	D - Poor
651	1	ER / 0001 / 263	12/G/0716014	84,Majid Str,Perundurai	9698317739	f	2015-11-13 09:49:43.085718-05	f	Tamil	f		Own	Sheet	t	E - Very Poor
652	1	ER / 0001 / 264	12/G/0819480	43,Kaliyam Pudur Road,Perundurai	9715239668	f	2015-11-13 09:49:43.163356-05	f	Tamil	f		Rent	N	t	D - Poor
657	1	ER / 0001 / 269	12/G/0721503	233A,Bavani Main Road,Perundurai	9842671785	f	2015-11-13 09:49:43.846016-05	f	Tamil	f		Rent	N	t	C - Middle Class
653	1	ER / 0001 / 265	11/G/0066084	13/55,Sithambaranaar Str,Perundurai	8883691229	f	2015-11-13 09:49:43.324734-05	f	Tamil	f		Rent	N	t	C - Middle Class
671	1	ER / 0001 / 283	12/G/0814984	2,Mohamathiyer Str,Perundurai	9578412307	f	2015-11-13 09:49:45.942406-05	f	Tamil	f		Rent	Thars	t	E - Very Poor
658	1	ER / 0001 / 270	12/G/0721548	233,Bavani Main Road,Perundurai	9842671785	f	2015-11-13 09:49:43.997594-05	f	Tamil	f		Rent	N	t	C - Middle Class
659	1	ER / 0001 / 271	12/G/0721636	24/44,Pavadi Str,Perundurai	9524295553	f	2015-11-13 09:49:44.068531-05	f	Tamil	f	Marriage Help	Rent	N	t	D - Poor
663	1	ER / 0001 / 275	12/G/0717002	,Muthaliyar Str,Perundurai	9003671985	f	2015-11-13 09:49:44.627257-05	f	Tamil	f		Rent	N	t	D - Poor
669	1	ER / 0001 / 281	12/G/0002540	359,Kunnathur str,Perundurai	9095959092	f	2015-11-13 09:49:45.622044-05	f	Tamil	f		Rent	Sheet	t	D - Poor
667	1	ER / 0001 / 279	12/G/0003054	495/A,Petham Palayam Road,Perundurai	9865285857	f	2015-11-13 09:49:45.223123-05	f	Tamil	f		Rent	N	t	D - Poor
664	1	ER / 0001 / 276	12/G/0716068	103/103,Majid Str,Perundurai	9788539082	f	2015-11-13 09:49:44.775646-05	f	Tamil	f		Rent	N	t	D - Poor
665	1	ER / 0001 / 277	12/W/0085734	236,Kunnathur str,Perundurai	9994367836	f	2015-11-13 09:49:44.884519-05	f	Tamil	f		Own	Sheet	t	D - Poor
668	1	ER / 0001 / 280	12/G/0853253	5\\6,Muthaliyar Str,Perundurai	9600739824	f	2015-11-13 09:49:45.37872-05	f	Tamil	f		Rent	N	t	D - Poor
672	1	ER / 0001 / 284	12/G/0864390	200/7,Thaskan Str,Perundurai	9578412307	f	2015-11-13 09:49:46.050468-05	f	Tamil	f		Rent	Thars	t	E - Very Poor
670	1	ER / 0001 / 282	17/G/0421200	417/10,Kunnathur str,Perundurai	9965209233	f	2015-11-13 09:49:45.816431-05	f	Tamil	f		Own	Building	t	D - Poor
675	1	ER / 0001 / 287	12/G/0867008	95/11,Muthaliyar Str,Perundurai	9976289486	f	2015-11-13 09:49:46.49754-05	f	Tamil	f		Rent	N	t	D - Poor
674	1	ER / 0001 / 286	12/G/0716335	130/2,Pandiyan Str,Perundurai	9677801988	f	2015-11-13 09:49:46.344752-05	f	Tamil	f		Rent	N	t	D - Poor
676	1	ER / 0001 / 288	12/G/0716407	20/4,Sarayakara Thottam,Perundurai	9843836586	f	2015-11-13 09:49:46.607306-05	f	Tamil	f		Rent	N	t	D - Poor
677	1	ER / 0001 / 289	12/W/0086720	33/2,Senniyar Valadu,Perundurai	9842092888	f	2015-11-13 09:49:46.737371-05	f	Tamil	f		Rent	N	t	C - Middle Class
678	1	ER / 0001 / 290	12/G/0845653	196/101,Konka Petham Str,Perundurai	9698191219	f	2015-11-13 09:49:46.861353-05	f	Tamil	f		Own	Thar	t	C - Middle Class
679	1	ER / 0001 / 291	12/G/0377184	21,Sarayakara Thottam,Perundurai	8940864572	f	2015-11-13 09:49:46.953005-05	f	Tamil	f		Rent		t	D - Poor
680	1	ER / 0001 / 292	12/G/0881525	226,Thaskan Str,Perundurai	9791479441	f	2015-11-13 09:49:47.065863-05	f	Tamil	f		Own	Thar	t	E - Very Poor
681	1	ER / 0001 / 293	12/G/0815332	90,Majid Str,Perundurai	9842031035	f	2015-11-13 09:49:47.172934-05	f	Tamil	f		Rent	Cement	t	E - Very Poor
719	1	ER / 0001 / 487	12/G/0716251	368/2,Selva Vinayagar Kovil Street,	9345763335	f	2014-10-08 01:00:00-04	f	Urdu	f		Rent		t	D - Poor
682	1	ER / 0001 / 294	22/G/0043557	15,Solan Str,Perundurai	8973398125	f	2015-11-13 09:49:47.276511-05	f	Tamil	f		Rent	Sheet	t	E - Very Poor
683	1	ER / 0001 / 295	12/G/0715987	64,Sithambaranar Str,Perundurai	9942280386	f	2015-11-13 09:49:47.310969-05	f	Tamil	f		Rent	N	t	D - Poor
684	1	ER / 0001 / 556	12/G/0721792	102/135,Dhasgund Street,	8344612786	f	2014-10-08 01:00:00-04	f	Urdu	f		Rent		t	C - Middle Class
699	1	ER / 0001 / 571	12/G/0002524	62/B,Pavadi Lane ,	9944608868	f	2014-10-08 01:00:00-04	f	Urdu	f		Rent		t	C - Middle Class
685	1	ER / 0001 / 557	12/g/0715654	17/14,Anna Nagar,	9715118399	f	2014-10-08 01:00:00-04	f	Tamil	f		Rent	Ottu Veedu	t	D - Poor
710	1	ER / 0001 / 582	12/G/08873843	2,Mugamathiyar Street,	9025125028	f	2014-10-08 01:00:00-04	f	Urdu	f		Rent		t	B - Full Filled
686	1	ER / 0001 / 558	13/G/0062753	123,Anna Nagar,	9788918759	f	2014-10-08 01:00:00-04	f	Urdu	f		Rent	Cement Sheet	t	D - Poor
687	1	ER / 0001 / 559	12/G/002606	,Kalliyampudur Road,	7767774776	f	2014-10-08 01:00:00-04	f	Urdu	f		Rent		t	D - Poor
688	1	ER / 0001 / 560	12/g/0716132	176/32,Mudhaliyar Street,	9965457541	f	2014-10-08 01:00:00-04	f	Urdu	f		Rent		t	D - Poor
700	1	ER / 0001 / 572		2/2F,Slater Nagar,	9994048215	f	2014-10-08 01:00:00-04	f	Malayalam	f		Own	Sheet	t	C - Middle Class
701	1	ER / 0001 / 573		92/162,Vengamedu,	9715196339	f	2014-10-08 01:00:00-04	f	Tamil	f		Rent	Ottu Veedu	t	D - Poor
689	1	ER / 0001 / 561				f	2014-10-08 01:00:00-04	f		f		Rent		t	E - Very Poor
690	1	ER / 0001 / 562	12/G/0819637	,Masjith Street,	8760765582	f	2014-10-08 01:00:00-04	f	Urdu	f		Rent	Ottu Veedu	t	D - Poor
691	1	ER / 0001 / 563	12/G/0721739	44,Uppliyar Lane,	8344722361	f	2014-10-08 01:00:00-04	f	Urdu	f		Rent	Ottu Veedu	t	D - Poor
692	1	ER / 0001 / 564	12/G/0715973	74/86,Masjith Street,	9865544963	f	2014-10-08 01:00:00-04	f	Tamil	f		Rent	Ottu Veedu	t	C - Middle Class
693	1	ER / 0001 / 565		102/2,Dhasgund Street,	984245786/8870686997	f	2014-10-08 01:00:00-04	f	Urdu	f		Rent		t	C - Middle Class
694	1	ER / 0001 / 566	12/G/0716132	139/133,Mudhaliyar Street,	9965457541	f	2014-10-08 01:00:00-04	f	Urdu	f		Rent		t	D - Poor
724	1	ER / 0001 / 492	12/W/0085428	157,Raja Street,	989472200	f	2014-10-08 01:00:00-04	f	Tamil	f	Need Medical Help	Rent	Ottu veedu	t	C - Middle Class
702	1	ER / 0001 / 574		628,Masjith Street,	9677795956	f	2014-10-08 01:00:00-04	f	Tamil	f		Rent	Ottu Veedu	t	C - Middle Class
695	1	ER / 0001 / 567	13/G/0063441	114,Pavadi Lane ,Maykkur	8344411931	f	2014-10-08 01:00:00-04	f	Tamil	f		Rent		t	C - Middle Class
711	1	ER / 0001 / 583		117/NA,Raja Street,	8883308134	f	2014-10-08 01:00:00-04	f	Tamil	f		Rent	Sheet	t	D - Poor
696	1	ER / 0001 / 568	12/G/0815323	,Aadithyar Thotam,	8883308344	f	2014-10-08 01:00:00-04	f	Tamil	f		Rent		t	C - Middle Class
703	1	ER / 0001 / 575		42,Podimattaikkran Street,	9524469865	f	2014-10-08 01:00:00-04	f	Tamil	f		Rent	Ottu Veedu	t	E - Very Poor
697	1	ER / 0001 / 569		181,Mudhaliyar Street,	7639090891	f	2014-10-08 01:00:00-04	f	Tamil	f		Rent		t	C - Middle Class
704	1	ER / 0001 / 576		63,Masjith Street,	9092403780	f	2014-10-08 01:00:00-04	f	Tamil	f		Rent	Ottu Veedu	t	D - Poor
712	1	ER / 0001 / 584	12/W/0085466	B.71,Chinnamadathu palayam,	9443935958	f	2014-10-08 01:00:00-04	f	Urdu	f		Own	Concret	t	C - Middle Class
698	1	ER / 0001 / 570	12/G/0815315	62/B,Kangi Kovil Road,	8807461677	f	2014-10-08 01:00:00-04	f	Urdu	f		Rent		t	C - Middle Class
713	1	ER / 0001 / 585	12/G/0717177	32A,Bajanai kovil Street,	9698190120	f	2014-10-08 01:00:00-04	f	Urdu	f		Rent	Ottu Veedu	t	D - Poor
705	1	ER / 0001 / 577		26,Bajanai kovil Street,	9842650699	f	2014-10-08 01:00:00-04	f	Tamil	f		Rent	Ottu Veedu	t	D - Poor
706	1	ER / 0001 / 578		126,,		f	2014-10-08 01:00:00-04	f		f		Rent		t	E - Very Poor
714	1	ER / 0001 / 586	12/G/0716560	113,Mugamathiyar Street,	9095696374	f	2014-10-08 01:00:00-04	f	Urdu	f		Own	Ottu Veedu	t	D - Poor
707	1	ER / 0001 / 579		75,Kalliyampudur Road,	9842748784/9095794497	f	2014-10-08 01:00:00-04	f	Urdu	f		Rent	Sheet	t	D - Poor
708	1	ER / 0001 / 580		27,Mugamathiyar Street,	9842217609	f	2014-10-08 01:00:00-04	f	Urdu	f		Rent	Ottu Veedu	t	D - Poor
715	1	ER / 0001 / 587		30,,		f	2014-10-08 01:00:00-04	f		f		Rent		t	E - Very Poor
709	1	ER / 0001 / 581		120/121,Raja Street,	8807773257	f	2014-10-08 01:00:00-04	f	Tamil	f		Rent		t	D - Poor
716	1	ER / 0001 / 588	12/G/0715793	27-D,Kunnathur Road,	8344357590	f	2014-10-08 01:00:00-04	f		f		Rent	Ottu Veedu	t	D - Poor
720	1	ER / 0001 / 488		96,,		f	2014-10-08 01:00:00-04	f		f		Rent		t	E - Very Poor
717	1	ER / 0001 / 589	12/G/0716553	91,Mugamathiyar Street,	8148530032	f	2014-10-08 01:00:00-04	f	Urdu	f		Own	Ottu Veedu	t	D - Poor
718	1	ER / 0001 / 486		228,Kunnathur Road,	9524208314	f	2014-10-08 01:00:00-04	f	Urdu	f		Rent	Cement Sheet	t	D - Poor
725	1	ER / 0001 / 493	12/G/8430260	103,Kunnathur Road,	9698830228	f	2014-10-08 01:00:00-04	f	Urdu	f		Rent	Ottu veedu	t	D - Poor
721	1	ER / 0001 / 489				f	2014-10-08 01:00:00-04	f		f		Rent		t	E - Very Poor
726	1	ER / 0001 / 494	12/G/0716612	25,Podimattikkaran Street,	9524232786	f	2014-10-08 01:00:00-04	f	Urdu	f		Rent	Ottu veedu	t	D - Poor
728	1	ER / 0001 / 496	12/G/0719929	107,Raja Street,	8870841540	f	2014-10-08 01:00:00-04	f	Urdu	f		Rent		t	D - Poor
722	1	ER / 0001 / 490	12/G/0716069	73/104,Masjid Street,	8870283580	f	2014-10-08 01:00:00-04	f	Tamil	f		Own	Ottu veedu	t	C - Middle Class
723	1	ER / 0001 / 491	12/G/0716024	39/87,Masjid Street,		f	2014-10-08 01:00:00-04	f	Tamil	f		Rent	Concrete 	t	C - Middle Class
727	1	ER / 0001 / 495	12/G/0815016	22A,Mudhaliyar Street,	8344721794	f	2014-10-08 01:00:00-04	f	Urdu	f		Rent		t	D - Poor
730	1	ER / 0001 / 498		42/2,Pavadi Street,	9629521389/9994901214	f	2014-10-08 01:00:00-04	f	Urdu	f		Rent		t	C - Middle Class
729	1	ER / 0001 / 497	12/G/0716437	171,Maykur,	9789326654	f	2014-10-08 01:00:00-04	f	Urdu	f		Rent		t	C - Middle Class
731	1	ER / 0001 / 499	12/G/0881494	359,Kunnathur Road,		f	2014-10-08 01:00:00-04	f	Urdu	f		Rent	Ottu veedu	t	C - Middle Class
732	1	ER / 0001 / 500	12/G/8024544	32,Mudhaliyar Street,	9688170086	f	2014-10-08 01:00:00-04	f	Urdu	f		Rent	Cement Sheet	t	D - Poor
733	1	ER / 0001 / 501		16/9,Masjid Street,	8883468184	f	2014-10-08 01:00:00-04	f	Tamil	f		Rent	Ottu veedu	t	D - Poor
734	1	ER / 0001 / 502	12/G/0715955	62,Masjid Street,	9095648234	f	2014-10-08 01:00:00-04	f	Urdu	f		Rent		t	C - Middle Class
735	1	ER / 0001 / 503	12/G/0715891	98,Masjid Street,	9894637785	f	2014-10-08 01:00:00-04	f	Urdu	f		Rent	Concrete 	t	A - Well Settled
736	1	ER / 0001 / 504	12/G/0038144	2,Bhavani Road,	9065634595	f	2014-10-08 01:00:00-04	f	Tamil	f		Rent	Cement Sheet	t	D - Poor
737	1	ER / 0001 / 505		O.No:274,,		f	2014-10-08 01:00:00-04	f		f		Rent		t	E - Very Poor
738	1	ER / 0001 / 506	12/g/0469315	49,Masjid Street,	8122531269	f	2014-10-08 01:00:00-04	f	Tamil	f		Rent	Ottu veedu	t	C - Middle Class
739	1	ER / 0001 / 507		O.No:39,,		f	2014-10-08 01:00:00-04	f		f		Rent		t	E - Very Poor
756	1	ER / 0001 / 459	12/W/0096122	76/1,Balaji Road,Kkada Palayam	9865113420	f	2014-10-08 01:00:00-04	f	Tamil	f		Rent		t	D - Poor
740	1	ER / 0001 / 508	12/G/0715982	76,Masjid Street,	9715483707	f	2014-10-08 01:00:00-04	f	Tamil	f		Rent	Ottu veedu	t	D - Poor
741	1	ER / 0001 / 509		95/95,Kunnathur Road,	9095233190	f	2014-10-08 01:00:00-04	f	Tamil	f		Rent	Cement Sheet	t	C - Middle Class
763	1	ER / 0001 / 466	12/w/0096732	70,Muthaliyar Street,	8883930509	f	2014-10-08 01:00:00-04	f	Tamil	f		Rent	Ottu Veedu	t	D - Poor
742	1	ER / 0001 / 510	12/G/0715997	37/8,Masjid Street,	9944815993	f	2014-10-08 01:00:00-04	f	Tamil	f		Rent		t	C - Middle Class
757	1	ER / 0001 / 460	12/G/0716302	24,Pavadi Lane,	9095634156	f	2014-10-08 01:00:00-04	f	Tamil	f		Own	Ottu Veedu	t	D - Poor
743	1	ER / 0001 / 511	12/G/0004823	12/453,Sri Ram Nagar,Aaiye kavundan Palayam	9095478479	f	2014-10-08 01:00:00-04	f	Urdu	f		Own	Cement Sheet	t	D - Poor
744	1	ER / 0001 / 512	12/G/0819354	36/13,Uppliyar lane,	9578780421	f	2014-10-08 01:00:00-04	f	Urdu	f		Rent		t	D - Poor
758	1	ER / 0001 / 461		55,Muhammidiyar Street,	9095017875	f	2014-10-08 01:00:00-04	f	Urdu	f		Own	Ottu Veedu	t	D - Poor
745	1	ER / 0001 / 513	12/G/0720313	346,Kunnathur Road,	8526721281	f	2014-10-08 01:00:00-04	f	Tamil	f		Rent		t	D - Poor
774	1	ER / 0001 / 477				f	2014-10-08 01:00:00-04	f		f		Rent		t	E - Very Poor
746	1	ER / 0001 / 514		29/133,Kunnathur Road,	9629522311/9787796079	f	2014-10-08 01:00:00-04	f	Tamil	f		Rent		t	D - Poor
747	1	ER / 0001 / 515	12/G/07	15/9,Pavadi Street,	9791737168	f	2014-10-08 01:00:00-04	f	Urdu	f		Rent		t	D - Poor
748	1	ER / 0001 / 516				f	2014-10-08 01:00:00-04	f		f	converted as Muslim before 7 yrs want to get marred a muslim guy pls help us	Rent		t	E - Very Poor
749	1	ER / 0001 / 517	12/G/0715716	140,Mudhaliyar Street,	9578779906	f	2014-10-08 01:00:00-04	f	Tamil	f		Rent	Ottu veedu	t	D - Poor
750	1	ER / 0001 / 518	12/G/0720165	136/16,Pandiyan Street,	9629781950	f	2014-10-08 01:00:00-04	f	Tamil	f	Need medical help	Rent	Ottu veedu	t	D - Poor
764	1	ER / 0001 / 467	12/G/0716271	42/2,VIP Nagar,	9487516159	f	2014-10-08 01:00:00-04	f	Urdu	f		Own	Concrete 	t	C - Middle Class
751	1	ER / 0001 / 519	WOV0185181	10A,Pavadi Street,	8973340864	f	2014-10-08 01:00:00-04	f	Tamil	f		Rent	Ottu veedu	t	E - Very Poor
759	1	ER / 0001 / 462	I.D-FQV2016723	417-3,Kunnathur Road,	9787736119	f	2014-10-08 01:00:00-04	f	Tamil	f		Rent		t	D - Poor
752	1	ER / 0001 / 520	12/W/0125267	31/9,Kotaimedu,Balaji Nagar	9524690700	f	2014-10-08 01:00:00-04	f	Urdu	f		Rent	Cement Sheet	t	E - Very Poor
753	1	ER / 0001 / 521	12/G/0003354	36,Pavadi Street,	8526581795	f	2014-10-08 01:00:00-04	f	Urdu	f		Rent		t	E - Very Poor
754	1	ER / 0001 / 522	12/G/0818767	81,Masjid Street,	9842576085/9715835204	f	2014-10-08 01:00:00-04	f	Tamil	f		Rent		t	C - Middle Class
775	1	ER / 0001 / 478	12/G/0715896	O:44N:54,Muthaliyar Street,		f	2014-10-08 01:00:00-04	f	Urdu	f		Rent	Ottu Veedu	t	D - Poor
760	1	ER / 0001 / 463	12/G/0716789	,Kalliyam pudur Road,	9698829960	f	2014-10-08 01:00:00-04	f	Urdu	f		Rent		t	D - Poor
755	1	ER / 0001 / 523	12/G/0815121	88/80,Masjid Street,	9150497859	f	2014-10-08 01:00:00-04	f	Tamil	f	need job	Rent		t	D - Poor
769	1	ER / 0001 / 472	12/G/0881501	124/134,Muthaliyar Street,	9865326503	f	2014-10-08 01:00:00-04	f	Urdu	f		Rent		t	D - Poor
765	1	ER / 0001 / 468	12/G/0813440	58/71,Pandiyan Street,	9488536354	f	2014-10-08 01:00:00-04	f	Tamil	f	medical Insurance	Own	Ottu Veedu	t	D - Poor
761	1	ER / 0001 / 464	12/G/0002544	3/5A,Pavadi Lane,	9976725216	f	2014-10-08 01:00:00-04	f	Tamil	f		Rent		t	D - Poor
776	1	ER / 0001 / 479	12/G/0716819	21/13,Kanniyam Pudur Road,	7667774776	f	2014-10-08 01:00:00-04	f	Urdu	f		Rent	Ottu Veedu	t	E - Very Poor
766	1	ER / 0001 / 469	12/C/0721362	6/12,West chena puram,Kunnathur	9843493919	f	2014-10-08 01:00:00-04	f	Tamil	f	medical Insurance	Rent		t	C - Middle Class
762	1	ER / 0001 / 465	12/W/0085414	O:44 N:36,Raja Street,	9659208268	f	2014-10-08 01:00:00-04	f	Tamil	f	Marriage help 	Rent	Ottu Veedu	t	E - Very Poor
779	1	ER / 0001 / 482	FQT3734233	,Erode Road ,	8760080926	f	2014-10-08 01:00:00-04	f	Tamil	f		Rent		t	D - Poor
770	1	ER / 0001 / 473				f	2014-10-08 01:00:00-04	f		f		Rent		t	E - Very Poor
767	1	ER / 0001 / 470	12/G/071645	154/19,Mugamathiyar street,	9788090893	f	2014-10-08 01:00:00-04	f	Urdu	f		Rent		t	C - Middle Class
777	1	ER / 0001 / 480	15/G/0292183	75,Kalliyam pudur Road,	8925751636	f	2014-10-08 01:00:00-04	f	Urdu	f		Rent	Ottu Veedu	t	E - Very Poor
768	1	ER / 0001 / 471	12/g/0002551	35,Podimattaikkara Street,	9843449624	f	2014-10-08 01:00:00-04	f	Urdu	f		Rent		t	D - Poor
771	1	ER / 0001 / 474	12/G/0715823	347,Kunnathur Road,	8675539937	f	2014-10-08 01:00:00-04	f	Tamil	f		Rent		t	D - Poor
783	1	ER / 0001 / 601	12/G/0815419	22/25,Cholan Street,Bavani Main road	9965521054	f	2014-10-08 01:00:00-04	f	Tamil	f	N	Own	Ottu	t	C - Middle Class
772	1	ER / 0001 / 475	12/G/0721716	116,Kkada Palayam,	7373329344	f	2014-10-08 01:00:00-04	f	Tamil	f		Rent		t	C - Middle Class
780	1	ER / 0001 / 483	12/G/0715084	22/9,Majeeth Street,	84892333675	f	2014-10-08 01:00:00-04	f	Tamil	f		Own	Ottu Veedu	t	D - Poor
773	1	ER / 0001 / 476	12/G/0002530		8526596957	f	2014-10-08 01:00:00-04	f	Urdu	f		Rent		t	D - Poor
778	1	ER / 0001 / 481	WOV0772254	101/NA,Kkada Palayam,	8760080926	f	2014-10-08 01:00:00-04	f	Tamil	f		Rent		t	D - Poor
782	1	ER / 0001 / 485	12/G/0716440	29/31,Podimattaikkara Street,	8883824224	f	2014-10-08 01:00:00-04	f	Urdu	f		Rent		t	D - Poor
781	1	ER / 0001 / 484	12/g/0717121	17/Jan,Bajanai Kovil Street,	7667774776	f	2014-10-08 01:00:00-04	f	Urdu	f		Rent	Ottu Veedu	t	E - Very Poor
785	1	ER / 0001 / 603	10/G/0371939	89,Mohamathiyar Street,Perundurai	9842958238	f	2014-10-08 01:00:00-04	f	Urdu	f	N	Rent	Ottu	t	C - Middle Class
784	1	ER / 0001 / 602	12/G/0002458	55A,kottaimedu Harijan colony,Perundurai	9715839276	f	2014-10-08 01:00:00-04	f	Tamil	f	N	Rent	Hut	t	D - Poor
786	1	ER / 0001 / 604	N	43,Upliyar Street,Perundurai	8615116988	f	2014-10-08 01:00:00-04	f	Tamil	f	N	Rent	Ottu	t	D - Poor
787	1	ER / 0001 / 605	12/G/0438651	125/168,Mudaliyar Street Makur,Perundurai	9944859386	f	2014-10-08 01:00:00-04	f	Tamil	f	N	Own	Ottu	t	D - Poor
788	1	ER / 0001 / 606	12/G/0716121	126/169,Mudaliyar Street Makur,Perundurai	9944859386	f	2014-10-08 01:00:00-04	f	Tamil	f		Rent	Ottu	t	D - Poor
789	1	ER / 0001 / 607	12/G/0849310	10/8,Valalar Street ,K.K.Road	9865779686	f	2014-10-08 01:00:00-04	f	Tamil	f		Rent		t	D - Poor
790	1	ER / 0001 / 608		33/16,Raja Street,		f	2014-10-08 01:00:00-04	f		f		Rent		t	E - Very Poor
791	1	ER / 0001 / 609	12/G/0878699	15/6,Thaskant Street,Perundurai	9865672722	f	2014-08-08 01:00:00-04	f	Tamil	f		Rent		t	D - Poor
834	1	ER / 0001 / 199	12/G/0720270	73/34,Kanchi Kovil Str,Perundurai	9842886620	f	2014-09-08 01:00:00-04	f		f		Own	sheet	t	B - Full Filled
792	1	ER / 0001 / 610	N	7,Canady Street,K.K.Road	8122243844	f	2014-10-08 01:00:00-04	f	Tamil	f		Rent		t	D - Poor
820	1	ER / 0001 / 185	12/G/0002541	13\\3,Majid Str,Perundurai	9865896767	f	2014-09-08 01:00:00-04	f		f		Rent	N	t	D - Poor
803	1	ER / 0001 / 621	12/G/0717228	43,Upliyar Street,Perundurai	8675116988	f	2014-10-08 01:00:00-04	f	Tamil	f		Rent		t	D - Poor
793	1	ER / 0001 / 611	12/G/0716633	36,Podimattaikara Street ,Perundurai	9965368504	f	2014-10-08 01:00:00-04	f	Urdu	f		Own	Concrete	t	B - Full Filled
811	1	ER / 0001 / 176	12/G/0722393	73/73,Kumaran Str,Perundurai	9442071396	f	2014-09-08 01:00:00-04	f		f		Own	Building	t	C - Middle Class
794	1	ER / 0001 / 612	12/G/0863430	39,Agraharam Street,Perundurai	9865205857	f	2014-10-08 01:00:00-04	f	Tamil	f		Rent		t	D - Poor
795	1	ER / 0001 / 613	N	27,Mohamathiyar Street,Kunathur Road	9360571060	f	2014-10-08 01:00:00-04	f	Urdu	f		Rent		t	D - Poor
804	1	ER / 0001 / 622	12/G/0002604	27/B,.Mudaliyar Street ,Perundurai	8098590009	f	2014-10-08 01:00:00-04	f	Tamil	f		Rent		t	D - Poor
796	1	ER / 0001 / 614	12/G/0721203	56,Pondiyan Street,Bavani Main road	9942936354	f	2014-10-08 01:00:00-04	f	Tamil	f		Own	Ottu	t	D - Poor
812	1	ER / 0001 / 177	12/G/0699855	97,Anna Nagar,Perundurai	9524975344	f	2014-09-08 01:00:00-04	f		f		Own	Sheet	t	D - Poor
797	1	ER / 0001 / 615	12/G/0716976	23,Canady Street,Perundurai	8807775151	f	2014-10-08 01:00:00-04	f	Tamil	f		Rent		t	D - Poor
805	1	ER / 0001 / 623	12/G/0862070	36/1,Podi matikara Street ,Perundurai	9095336895	f	2014-10-08 01:00:00-04	f	Urdu	f		Rent		t	C - Middle Class
798	1	ER / 0001 / 616	12/G/0716176	33/16,Pavadi Street,Perundurai	9842768203	f	2014-10-08 01:00:00-04	f	Urdu	f		Own	Concrete	t	C - Middle Class
813	1	ER / 0001 / 178	N	N,Podi Mattakar Str,Perundurai	9500578567	f	2014-09-08 01:00:00-04	f		f		Rent	N	t	D - Poor
799	1	ER / 0001 / 617	12/G/0002547	,Pavadi Street,VIP Nagar	8526061592	f	2014-10-08 01:00:00-04	f	Urdu	f		Rent		t	C - Middle Class
806	1	ER / 0001 / 624	12/G/0815113	12A,Kondiyan Thottam,Perundurai	9786148501	f	2014-10-08 01:00:00-04	f	Tamil	f		Own	Concrete	t	C - Middle Class
800	1	ER / 0001 / 618	12/G/0716713	226,Chithambaranar Street,Kongu Nagar	9944277302	f	2014-10-08 01:00:00-04	f	Urdu	f		Rent		t	D - Poor
828	1	ER / 0001 / 193	24/G/0813093	13\\14,Sarayakara Thottam,Perundurai	9150194891	f	2014-09-08 01:00:00-04	f		f		Rent	Sheet	t	D - Poor
814	1	ER / 0001 / 179	N	N,Muthaliyar Str,Perundurai	8220894266	f	2014-09-08 01:00:00-04	f		f		Rent	N	t	C - Middle Class
807	1	ER / 0001 / 625	12/G/0038738	70,Javagar Nagar,Perundurai	9443730799	f	2014-10-08 01:00:00-04	f	Tamil	f		Rent		t	C - Middle Class
801	1	ER / 0001 / 619	12/G/0721693	35,Ceny valasu,Perundurai	9788904783	f	2014-10-08 01:00:00-04	f	Tamil	f		Rent		t	B - Full Filled
808	1	ER / 0001 / 626	12/G/0715809	23/30,Upliyar Street,Perundurai	N	f	2014-10-08 01:00:00-04	f	Tamil	f		Rent		t	D - Poor
825	1	ER / 0001 / 190	12/G/0777670	41,Kanchi Kovil Str,Perundurai	9750722380	f	2014-09-08 01:00:00-04	f		f		Rent	N	t	D - Poor
802	1	ER / 0001 / 620	08/G/00/0063	13,KK Valasu,Velleadu	9994936172	f	2014-10-08 01:00:00-04	f	Urdu	f	Need Treatment 	Rent		t	C - Middle Class
809	1	ER / 0001 / 627	12/G/0716557	68/94,Mohamathiyar Street,Perundurai	9003642484	f	2014-10-08 01:00:00-04	f	Tamil	f		Rent		t	C - Middle Class
815	1	ER / 0001 / 180	12/G/0742944	3/162,Kovai Main Road,Perundurai	9098633126	f	2014-09-08 01:00:00-04	f		f		Rent	N	t	D - Poor
821	1	ER / 0001 / 186	12/G/0721931	181,Kannaki Str,Perundurai	9600748611	f	2014-09-08 01:00:00-04	f		f		Rent	Sheet	t	D - Poor
810	1	ER / 0001 / 628	12/G/0720395	13/17,Canady Street,Perundurai	9500724550	f	2014-10-08 01:00:00-04	f	Tamil	f		Rent		t	D - Poor
816	1	ER / 0001 / 181	N	228/217,Kannathur Road,Perundurai	9751438777	f	2014-09-08 01:00:00-04	f		f		Rent	N	t	D - Poor
817	1	ER / 0001 / 182	12/G/0574632	18/1,Pavadi Str,Perundurai	9865689029	f	2014-09-08 01:00:00-04	f		f		Rent	Thar	t	D - Poor
822	1	ER / 0001 / 187	12/G/0717160	19,Podi Mattakar Str,Perundurai	9789218703	f	2014-09-08 01:00:00-04	f		f		Rent	N	t	D - Poor
818	1	ER / 0001 / 183	N	1\\36,Pavadi Str,Perundurai	9095348756	f	2014-09-08 01:00:00-04	f		f		Own	N	t	D - Poor
819	1	ER / 0001 / 184	12/G/0715631	43,Uppilar Str,Perundurai	9524150339	f	2014-09-08 01:00:00-04	f		f		Rent	N	t	D - Poor
831	1	ER / 0001 / 196	12/G/0715834	37,Majid Str,Perundurai	9943570689	f	2014-09-08 01:00:00-04	f		f		Own	N	t	E - Very Poor
823	1	ER / 0001 / 188	12/G/0715761	417/4,Kunnathur Road,Perundurai	9688006157	f	2014-09-08 01:00:00-04	f		f		Own	Building	t	D - Poor
826	1	ER / 0001 / 191	N	96/6,Muthaliyar Str,Perundurai	9443192201	f	2014-09-08 01:00:00-04	f		f		Rent	Thars	t	D - Poor
824	1	ER / 0001 / 189	12/G/0716137	4,Bajanai Kovil Str,Perundurai	9715196123	f	2014-09-08 01:00:00-04	f		f		Rent	N	t	D - Poor
829	1	ER / 0001 / 194	12/G/0002538	75,Raja Str,Perundurai	9942691118	f	2014-09-08 01:00:00-04	f		f		Rent	Sheet	t	E - Very Poor
833	1	ER / 0001 / 198	12/G/0174023	33/4,vivekananthar Str,Perundurai	8973104786	f	2014-09-08 01:00:00-04	f		f		Rent	Thar	t	C - Middle Class
827	1	ER / 0001 / 192	12/G/003053	200/5,Kongu Nagar,Perundurai	9944920521	f	2014-09-08 01:00:00-04	f		f		Rent	Siment	t	D - Poor
835	1	ER / 0001 / 200	12/G/0881493	43,Pavadi Str,Perundurai	9400858990	f	2014-09-08 01:00:00-04	f		f		Rent	Sheet	t	D - Poor
830	1	ER / 0001 / 195	N	4,Anna Nagar,Perundurai	8675652868	f	2014-09-08 01:00:00-04	f		f		Rent	Sheet	t	E - Very Poor
832	1	ER / 0001 / 197	12/G/0002428	23,Thangam Nagar,Perundurai	9442426773	f	2014-09-08 01:00:00-04	f		f		Own	Thar	t	D - Poor
837	1	ER / 0001 / 687	12/W/0095563	69,Masjid Street,Perundurai	8870909019	f	2014-10-08 01:00:00-04	f	Tamil	f		Rent		t	D - Poor
836	1	ER / 0001 / 686		.10/170,Kanji koil Road,		f	2014-10-08 01:00:00-04	f		f		Rent		t	E - Very Poor
838	1	ER / 0001 / 688	12/G/0716567	,Thingalur,Perundurai	9344093442	f	2014-10-08 01:00:00-04	f	Urdu	f		Own	Cement sheet	t	C - Middle Class
839	1	ER / 0001 / 689	12/G/0717070	424,Kovai main Road,Perundurai	9655962690	f	2014-10-08 01:00:00-04	f	Tamil	f		Own	Concrete	t	E - Very Poor
840	1	ER / 0001 / 690		423,Kovai main Road,Perundurai	9442244508	f	2014-11-08 01:00:00-05	f	Tamil	f		Rent		t	C - Middle Class
841	1	ER / 0001 / 691	12/W/0085505	26,Mugamdiyar Street,Perundurai	9843224496	f	2014-08-08 01:00:00-04	f	Urdu	f		Own	Ottu Veedu	t	C - Middle Class
842	1	ER / 0001 / 692		4,Kasturibai Street,		f	2014-08-08 01:00:00-04	f		f		Rent		t	E - Very Poor
843	1	ER / 0001 / 693		30,Pavadi Street,		f	2014-10-08 01:00:00-04	f		f		Rent		t	E - Very Poor
844	1	ER / 0001 / 694		,Thandral Nagar ,Perundurai	9787439855	f	2014-08-14 01:00:00-04	f	Tamil	f		Rent	Concrete	t	C - Middle Class
862	1	ER / 0001 / 712		17,kuruku veedi ,		f	2014-11-08 01:00:00-05	f		f		Rent		t	E - Very Poor
863	1	ER / 0001 / 713		.5/3,East Aaiye gowndam pallayam,pattakarran palayam		f	2014-11-08 01:00:00-05	f		f		Rent		t	E - Very Poor
845	1	ER / 0001 / 695	12/G/0815286	298/1,Thai Nagar,Perundurai	8973602070	f	2014-10-08 01:00:00-04	f	Tamil	f		Rent		t	C - Middle Class
846	1	ER / 0001 / 696		73,Kanji koil Road,		f	2014-10-08 01:00:00-04	f		f		Rent		t	E - Very Poor
864	1	ER / 0001 / 714		.5/3,East Aaiye gowndam pallayam,pattakarran palayam		f	2014-11-08 01:00:00-05	f		f		Rent		t	E - Very Poor
847	1	ER / 0001 / 697		162,kanagi Street,Perundurai	8883777117	f	2014-10-08 01:00:00-04	f	Urdu	f		Rent		t	D - Poor
848	1	ER / 0001 / 698	12/G/0819479	78,kunathur Road,Perundurai	9578591351	f	2014-10-08 01:00:00-04	f	Urdu	f		Own	Concrete	t	E - Very Poor
849	1	ER / 0001 / 699	12/G/0820040	26,mugamadeyar Street,Perundurai	9843224496	f	2014-10-08 01:00:00-04	f	Urdu	f		Own	Concrete	t	C - Middle Class
865	1	ER / 0001 / 715	12/G0751325	141/171,annanagar,Perundurai	9943611213	f	2014-11-08 01:00:00-05	f	Urdu	f		Own	Ottu Veedu	t	E - Very Poor
850	1	ER / 0001 / 700		20/38,Pavadi Street,		f	2014-10-08 01:00:00-04	f		f		Rent		t	E - Very Poor
875	1	ER / 0001 / 724	13/G/0004293	47A,Podi matikarar Street,Perundurai	7667842079	f	2014-11-08 01:00:00-05	f	Tamil	f		Rent		t	D - Poor
851	1	ER / 0001 / 701	12/W/0120973	92A,Masjid Street,Perundurai	9842831636	f	2014-11-08 01:00:00-05	f	Urdu	f		Own	Concrete	t	C - Middle Class
852	1	ER / 0001 / 702	12/G/0722330	40,Kumaran Street,Perundurai	9843813838	f	2014-11-08 01:00:00-05	f	Tamil	f		Rent		t	D - Poor
866	1	ER / 0001 / 716	12/G/0815009	74/86,Masjid Street,Perundurai	9365876486	f	2014-11-08 01:00:00-05	f	Tamil	f		Own	(Damage)IS their but cont stay	t	D - Poor
853	1	ER / 0001 / 703		5,Pavadi Street,		f	2014-11-08 01:00:00-05	f		f		Rent		t	E - Very Poor
854	1	ER / 0001 / 704	12/G/0007345	,Kaskaram Palaiyam,Perundurai	9965084185	f	2014-11-08 01:00:00-05	f	Urdu	f		Rent		t	D - Poor
855	1	ER / 0001 / 705		.11/39,Salam Nagar ,		f	2014-11-08 01:00:00-05	f		f		Rent		t	E - Very Poor
856	1	ER / 0001 / 706		423B,Kovai main Road,Perundurai	9655962690	f	2014-11-08 01:00:00-05	f	Tamil	f		Own	Concrete	t	C - Middle Class
857	1	ER / 0001 / 707	12/G/0717068	422,Kovai main Road,Perundurai	9865162472	f	2014-10-08 01:00:00-04	f	Tamil	f		Own	Ottu Veedu	t	C - Middle Class
867	1	ER / 0001 / 717	12/G/0699784	118/137,Annanagar,Perundurai	9502934864	f	2014-11-08 01:00:00-05	f	Urdu	f		Rent	Ottu Veedu	t	E - Very Poor
858	1	ER / 0001 / 708	12/G/0889941	.5/4,East Aaiye gowndam pallayam,Perundurai		f	2014-11-08 01:00:00-05	f	Urdu	f		Rent		t	D - Poor
859	1	ER / 0001 / 709		50B,Annanagar,		f	2014-11-08 01:00:00-05	f		f		Rent		t	E - Very Poor
860	1	ER / 0001 / 710		116/128,Annanagar,		f	2014-11-08 01:00:00-05	f		f		Rent		t	E - Very Poor
884	1	ER / 0001 / 733	12/G/0716312	91/19,Annanagar,Perundurai	9942128438	f	2014-11-08 01:00:00-05	f	Tamil	f		Own	Ottu Veedu	t	C - Middle Class
861	1	ER / 0001 / 711	12/G/0048558	12/100,Main Road,Perundurai	9788932644	f	2014-11-08 01:00:00-05	f	Urdu	f		Rent		t	D - Poor
876	1	ER / 0001 / 725	12/G/0715728	24,Bajani Koil Street,Perundurai	9842577843	f	2014-11-08 01:00:00-05	f	Tamil	f		Rent		t	D - Poor
868	1	ER / 0001 / 718	12/G/0699770	107/123,Annanagar,Perundurai	7502934864	f	2014-11-08 01:00:00-05	f	Urdu	f		Own	Ottu Veedu	t	E - Very Poor
880	1	ER / 0001 / 729		131,Mudaliyar Street,		f	2014-11-08 01:00:00-05	f		f		Rent		t	E - Very Poor
869	1	ER / 0001 / 719	12/G/0699779	114A,Annanagar,Perundurai	9688989054	f	2014-11-08 01:00:00-05	f	Urdu	f		Own	Cement sheet	t	E - Very Poor
870	1	ER / 0001 / 				f	2015-11-13 09:50:06.634282-05	f		f		Rent		t	E - Very Poor
871	1	ER / 0001 / 720	12/G/0430574	128,Annanagar,Perundurai	7708507574	f	2014-11-08 01:00:00-05	f	Urdu	f		Rent		t	E - Very Poor
872	1	ER / 0001 / 721	12/G/0699778	114,Annanagar,Perundurai	7502621758	f	2014-11-08 01:00:00-05	f	Urdu	f		Own	Cement sheet	t	E - Very Poor
873	1	ER / 0001 / 722	12/G/0716098	117,Raja Veedi,Perundurai	8122474002	f	2014-11-08 01:00:00-05	f	Tamil	f		Rent		t	E - Very Poor
874	1	ER / 0001 / 723	12/G/0716005	47,Podi matikarar Street,Perundurai	9944244034	f	2014-11-08 01:00:00-05	f	Tamil	f		Rent		t	D - Poor
877	1	ER / 0001 / 726	12/G/0873888	224/3,Ashok Nagar,Perundurai	9597431151	f	2014-11-08 01:00:00-05	f	Tamil	f		Rent		t	C - Middle Class
891	1	ER / 0001 / 740	12/W/0038720	,Kunnathur kundyan thotem,Perundurai	9442434245	f	2014-11-08 01:00:00-05	f	Tamil	f		Rent	Concreat	t	C - Middle Class
886	1	ER / 0001 / 735	12/G/0715711	11,Raja Veedi,Makur	8760840002	f	2014-11-08 01:00:00-05	f	Tamil	f		Rent		t	C - Middle Class
878	1	ER / 0001 / 727		6,Bajani Koil Street,		f	2014-11-08 01:00:00-05	f		f		Rent		t	E - Very Poor
881	1	ER / 0001 / 730		F5,E.B. lan,		f	2014-11-08 01:00:00-05	f		f		Rent		t	E - Very Poor
879	1	ER / 0001 / 728		35,Thaskant street,		f	2014-11-08 01:00:00-05	f		f		Rent		t	E - Very Poor
885	1	ER / 0001 / 734		22,Bajani koil street,		f	2014-11-08 01:00:00-05	f		f		Rent		t	E - Very Poor
882	1	ER / 0001 / 731	12/G/0699721	49/59,Annanagar,Perundurai	8883861434	f	2014-11-08 01:00:00-05	f	Urdu	f		Rent		t	D - Poor
883	1	ER / 0001 / 732	12/G/0699771	124,Annanagar,Perundurai	9791615755	f	2014-11-08 01:00:00-05	f	Urdu	f		Rent		t	D - Poor
888	1	ER / 0001 / 737	12/G0854179	45/1,Podi matikarar Street,Perundurai	9865187706	f	2014-10-08 01:00:00-04	f	Urdu	f		Rent		t	D - Poor
887	1	ER / 0001 / 736	12/G/0815533	76/36,Subas sandrabos Street,Perundurai	9842419535	f	2014-11-08 01:00:00-05	f	Urdu	f		Rent		t	C - Middle Class
890	1	ER / 0001 / 739	12/W/0049684	263/1,M.C. Main Road,Perundurai	9842785127	f	2014-10-08 01:00:00-04	f	Tamil	f		Own		t	B - Full Filled
889	1	ER / 0001 / 738		11/8C,Pavadi street,		f	2014-11-08 01:00:00-05	f		f		Rent		t	E - Very Poor
892	1	ER / 0001 / 741	12/G/0815006	192,Raja Veedi,Makur	9043206220	f	2014-11-08 01:00:00-05	f	Tamil	f		Rent		t	D - Poor
893	1	ER / 0001 / 742		,Masjit Street,		f	2014-11-08 01:00:00-05	f		f		Rent		t	E - Very Poor
894	1	ER / 0001 / 743	12/G/0716182	126,Mudaliyar Street,Perundurai	9842161205	f	2014-08-14 01:00:00-04	f	Tamil	f		Rent		t	D - Poor
895	1	ER / 0001 / 744	12/G/0716121	125,Mudaliyar Street,Perundurai	9842161205	f	2014-08-14 01:00:00-04	f	Tamil	f		Own	Ottu Veedu	t	D - Poor
896	1	ER / 0001 / 745	12/G/0777572	13/4,Upliyar Street,Perundurai	9894487275	f	2014-08-14 01:00:00-04	f	Tamil	f		Rent		t	C - Middle Class
897	1	ER / 0001 / 746		,Kongu Nagar,Perundurai	9688538532	f	2014-08-14 01:00:00-04	f	Urdu	f		Rent		t	D - Poor
898	1	ER / 0001 / 747		.5/2,AyeCowndam pallayam,patakaram pallayam	9944375156	f	2014-08-14 01:00:00-04	f	Tamil	f		Rent		t	D - Poor
911	1	ER / 0001 / 760	12/G/0716449	.10/11,Mugamadeyar Street,Perundurai	9842907867	f	2014-12-08 01:00:00-05	f	Urdu	f		Own	Concreat	t	B - Full Filled
899	1	ER / 0001 / 748		402/603,Annanagar,Sanatariyum	9698550945	f	2014-08-14 01:00:00-04	f	Urdu	f		Own		t	D - Poor
900	1	ER / 0001 / 749	12/G/0735592	.5/2,Aye covvendam pallyam,Pattakaram pallayam	7708406221	f	2014-08-14 01:00:00-04	f	Tamil	f		Rent		t	E - Very Poor
912	1	ER / 0001 / 761	12/G/0715981	85/76,Masjit Street ,Perundurai	8925474010	f	2014-12-08 01:00:00-05	f	Tamil	f		Own	Concreat	t	C - Middle Class
920	1	ER / 0001 / 769	12/G/0718383	52,Pokara Street,Perundurai		f	2014-08-16 01:00:00-04	f	Tamil	f		Rent		t	D - Poor
921	1	ER / 0001 / 770		333,Kunathur Road,Perundurai	7502119386	f	2014-08-17 01:00:00-04	f	Tamil	f		Rent		t	D - Poor
901	1	ER / 0001 / 750	12/N0001341	276,Ram Nagar,Perundurai	9842718757	f	2014-08-14 01:00:00-04	f	Urdu	f		Own	Concreat	t	A - Well Settled
913	1	ER / 0001 / 762	12/G0699859	112A/130A,Anna nagar,Perundurai	7373258296	f	2014-12-08 01:00:00-05	f	Urdu	f		Own	Ottu Veedu	t	D - Poor
902	1	ER / 0001 / 751		12/296,Aye covvendam pallyam,Aye covvendam pallyam		f	2014-08-14 01:00:00-04	f		f		Rent		t	E - Very Poor
922	1	ER / 0001 / 771	12/G/0716121	125,Muthaliyar street,Perundurai		f	2014-08-17 01:00:00-04	f	Tamil	f		Rent		t	E - Very Poor
903	1	ER / 0001 / 752	12/W/0002016	12/595,Ram Nagar,Aye covvendam pallyam	9524957793	f	2014-08-14 01:00:00-04	f	Tamil	f		Rent		t	D - Poor
914	1	ER / 0001 / 763	12/G/0717333	14,Podimattikara Street,Perundurai	9787507999	f	2014-08-15 01:00:00-04	f	Urdu	f		Rent		t	E - Very Poor
904	1	ER / 0001 / 753	10/G/0936459	3/516,Society Nagar,Sully pallayam	9688989106	f	2014-08-14 01:00:00-04	f	Urdu	f		Rent		t	D - Poor
938	1	ER / 0001 / 640	12/W/0095266	28,Mohamadiya Street,Perundurai	9865422759	f	2014-10-08 01:00:00-04	f	Urdu	f		Rent	concrete	t	C - Middle Class
905	1	ER / 0001 / 754	12/G/0895652	.1/17,Kullam pallyam,Pattakaram pallayam	9578099358	f	2014-08-14 01:00:00-04	f	Urdu	f		Rent		t	D - Poor
933	1	ER / 0001 / 635		35,kannaki Street,		f	2014-10-08 01:00:00-04	f		f		Rent		t	E - Very Poor
928	1	ER / 0001 / 630	12/G/0819625	.10/11,Mohammadyaar Street,Perundurai	91 595 19003	f	2014-10-08 01:00:00-04	f	Tamil	f		Own	Ottu veedu	t	D - Poor
915	1	ER / 0001 / 764		91/41,Masjit Street ,Perundurai	9443932153	f	2014-08-16 01:00:00-04	f	Tamil	f		Rent		t	D - Poor
906	1	ER / 0001 / 755	12/G/0002511	104,Masjit Street ,Perundurai	9843371753	f	2014-08-14 01:00:00-04	f	Tamil	f		Rent		t	D - Poor
907	1	ER / 0001 / 756		114,Anna nagar,Perundurai	8675570084	f	2014-08-14 01:00:00-04	f	Urdu	f		Rent		t	D - Poor
908	1	ER / 0001 / 757	12/G/0735475	.5/19,East Ayecoundam pallayam,Perundurai	9489491642	f	2014-12-08 01:00:00-05	f	Urdu	f		Own	Ottu Veedu	t	D - Poor
916	1	ER / 0001 / 765		416,Pavade street,		f	2014-08-15 01:00:00-04	f		f		Rent		t	E - Very Poor
909	1	ER / 0001 / 758	12/G/0778036	.5/19,East Ayecoundam pallayam,Perundurai	9489491642	f	2014-12-08 01:00:00-05	f	Urdu	f		Own	Ottu Veedu	t	C - Middle Class
910	1	ER / 0001 / 759		11/8C,Pavade street,		f	2014-12-08 01:00:00-05	f		f		Rent		t	E - Very Poor
923	1	ER / 0001 / 772	ID-W0U0700781	62NA,Kaliyampudur road,Perundurai	9360046065	f	2014-08-17 01:00:00-04	f	Malayalam	f		Rent		t	D - Poor
917	1	ER / 0001 / 766	11/G/0310755	24,Pavade street,Perundurai		f	2014-08-16 01:00:00-04	f	Tamil	f		Rent	Ottu Veedu	t	D - Poor
934	1	ER / 0001 / 636	12/G/ 0 357 246	34,Nehruji Street,Perundurai	897 3447 330	f	2014-10-08 01:00:00-04	f	Tamil	f		Rent		t	E - Very Poor
924	1	ER / 0001 / 773		3/421,Iyapan nagar,Sulipallyim		f	2014-08-20 01:00:00-04	f		f		Rent		t	E - Very Poor
918	1	ER / 0001 / 767	12/G/0895546	140,Mugamadeyar Street,Perundurai	9944049030	f	2014-08-16 01:00:00-04	f	Urdu	f		Rent		t	D - Poor
929	1	ER / 0001 / 631		34/51,KS Paliyam,		f	2014-10-08 01:00:00-04	f		f		Rent		t	E - Very Poor
919	1	ER / 0001 / 768	12/G/0715798	29,Raja Veede,Perundurai	9442352368	f	2014-08-16 01:00:00-04	f	Tamil	f		Own	Ottu Veedu	t	D - Poor
925	1	ER / 0001 / 774		62/133,Kongu nagar,		f	2014-08-21 01:00:00-04	f		f		Rent		t	E - Very Poor
930	1	ER / 0001 / 632	12/G/ 071 6727	112,Raja Street,Perundurai	8870 799 250	f	2014-10-08 01:00:00-04	f	Tamil	f		Rent		t	C - Middle Class
935	1	ER / 0001 / 637	12/G/ 07 16 480	28,Mohamadiya Street,Perundurai	 9865 4227 59	f	2014-10-08 01:00:00-04	f	Urdu 	f		Rent	concrete	t	D - Poor
926	1	ER / 0001 / 775	12/G/0716386	133,Anna nagar,Perundurai	9047419493	f	2014-08-21 01:00:00-04	f	Urdu	f		Own	Ottu Veedu	t	E - Very Poor
927	1	ER / 0001 / 629	12/G/0715975	74,Majeed Street,Perundurai	888 3380 803	f	2014-10-08 01:00:00-04	f	Tamil	f		Own	Ottu veedu	t	C - Middle Class
931	1	ER / 0001 / 633		26,Raja Veedhi,		f	2014-10-08 01:00:00-04	f		f		Rent		t	E - Very Poor
942	1	ER / 0001 / 644		57,Bhavani Road,		f	2014-10-08 01:00:00-04	f		f		Rent		t	E - Very Poor
936	1	ER / 0001 / 638	N	,makeur,Perundurai	909579234	f	2014-10-08 01:00:00-04	f	Urdu 	f		Rent		t	E - Very Poor
932	1	ER / 0001 / 634		34,thingalur,		f	2014-10-08 01:00:00-04	f		f		Rent		t	E - Very Poor
941	1	ER / 0001 / 643	W0U0426494	229/230,Kunnathur Road,Perundurai	9500299911	f	2014-10-08 01:00:00-04	f	Urdu	f		Rent		t	D - Poor
939	1	ER / 0001 / 641	12/G/0815038	73 A,Majid Street,Perundurai	8870283580	f	2014-10-08 01:00:00-04	f	Tamil	f		Own	Ottu veedu	t	B - Full Filled
937	1	ER / 0001 / 639	29/G/0330255	62,nehruji Street,Perundurai	9865170681	f	2014-10-08 01:00:00-04	f	Tamil	f		Rent	concrete	t	B - Full Filled
940	1	ER / 0001 / 642	12/G/0716065	37/17,Majid Street,Perundurai	8508777620	f	2014-10-08 01:00:00-04	f	Tamil	f		Rent		t	C - Middle Class
944	1	ER / 0001 / 646		10,Kumaran Street,		f	2014-10-08 01:00:00-04	f		f		Rent		t	E - Very Poor
943	1	ER / 0001 / 645		160/103,Raja Veedhi,Perundurai	8973410610	f	2014-10-08 01:00:00-04	f	Tamil	f		Rent		t	D - Poor
945	1	ER / 0001 / 647		328/217,Kunnathur Road,Perundurai	9751438777	f	2014-10-08 01:00:00-04	f	.Urdu	f		Rent		t	D - Poor
946	1	ER / 0001 / 648	12/W/0118450	424,Kovai main road,Perundurai	9842651527	f	2014-10-08 01:00:00-04	f	Tamil	f		Own		t	C - Middle Class
947	1	ER / 0001 / 649	12/G/0873893	3B,bajanai Koil Street,Perundurai	7305325 845	f	2014-10-08 01:00:00-04	f	.Urdu	f		Rent		t	D - Poor
948	1	ER / 0001 / 650		13,pavadai Sandhu,		f	2014-10-08 01:00:00-04	f		f		Rent		t	E - Very Poor
949	1	ER / 0001 / 651	12/G/0717102	2,bajanai Koil Street,Perundurai	7708484274	f	2014-10-08 01:00:00-04	f	.Urdu	f		Own	concrete	t	E - Very Poor
950	1	ER / 0001 / 652	12/G/0717069	423,Kovai main road,Perundurai	9976661193	f	2014-10-08 01:00:00-04	f	Tamil	f		Own	R.C.C	t	D - Poor
951	1	ER / 0001 / 653	12/W/0085555	37,Agarahara veedi,Perundurai	9842596000	f	2014-10-08 01:00:00-04	f	Tamil	f		Own	Ottu veedu	t	C - Middle Class
966	2	TP / 0001 / 210	12/G/0375785	165,Sinna pallivasal street,Alangiyam	9092445840	f	2015-06-21 01:00:00-04	f	Tamil	f		Rent	Odu	t	C - Middle Class
952	1	ER / 0001 / 654	21/G/0073152	6c/10,pavadai sandhu,Perundurai	9578946138	f	2014-10-08 01:00:00-04	f	Tamil	f		Rent		t	D - Poor
975	2	TP / 0001 / 219	12/G/0375998	34,Sinna Pallivasal Street,Alangiyam	8012993708	f	2015-06-21 01:00:00-04	f	Tamil	f		Own	Rcc	t	D - Poor
967	2	TP / 0001 / 211		3/47,Kadai veethi,Alangiyam		f	2015-06-21 01:00:00-04	f	Tamil	f		Rent	odu	t	D - Poor
953	1	ER / 0001 / 655	12/O/0001280	317,Kanji koil road,Perundurai	7373330100	f	2014-10-08 01:00:00-04	f		f		Rent	Ottu veedu	t	D - Poor
954	1	ER / 0001 / 656		281,Iyar Street ,		f	2014-10-08 01:00:00-04	f		f		Rent		t	E - Very Poor
989	2	TP / 0001 / 233	12/G/0375568	3/47,South muslim street,Alangiyam	8526631511	f	2015-06-21 01:00:00-04	f	TAMIL	f		Own	ODU	t	E - Very Poor
955	1	ER / 0001 / 657	WOU0701128	238/NA,Kunnathur Road,Perundurai	9080030039	f	2014-10-08 01:00:00-04	f	.Urdu	f		Rent	Seetu Veedu	t	D - Poor
976	2	TP / 0001 / 220	12/G/0421215	61/02,Sinna Pallivasal Street,Alangiyam	8608951420	f	2015-06-21 01:00:00-04	f	TAMIL	f		Own	ODU	t	C - Middle Class
968	2	TP / 0001 / 212	12/G/0375582	6/95,Sinna pallivasal street,Alangiyam		f	2015-06-21 01:00:00-04	f	Tamil	f		Rent		t	C - Middle Class
956	1	ER / 0001 / 658		69/67,Bavani Road,		f	2014-10-08 01:00:00-04	f		f		Rent		t	E - Very Poor
987	2	TP / 0001 / 231	12/G/0427582	6/118,South muslim street,Alangiyam	9787693280	f	2015-06-21 01:00:00-04	f	TAMIL	f		Own	RC	t	D - Poor
957	2	TP / 0001 / 201		5/68,South muslim street,Alangiyam	9655616286	f	2015-06-21 01:00:00-04	f	Tamil	f		Rent		t	E - Very Poor
969	2	TP / 0001 / 213	12/W/0042783	5/66,South muslim street,Alangiyam	9986048790	f	2015-06-21 01:00:00-04	f	Tamil	f		Own	Tiled	t	E - Very Poor
958	2	TP / 0001 / 202		5/76,South muslim street,Alangiyam	9442818168	f	2015-06-21 01:00:00-04	f	Tamil	f		Own	Odu	t	C - Middle Class
959	2	TP / 0001 / 203		6/51,South muslim street,Alangiyam	9865521669	f	2015-06-21 01:00:00-04	f	TAMIL	f		Own	TILED	t	E - Very Poor
982	2	TP / 0001 / 226	12/G/0025984	36/5,MUSLIM STREET,Alangiyam	9843074355	f	2015-06-21 01:00:00-04	f	TAMIL	f		Own		t	C - Middle Class
960	2	TP / 0001 / 204		1/376,Kamaraj Nagar,Alangiyam	9659778548	f	2015-06-21 01:00:00-04	f	Tamil	f	Education	Rent	odu	t	E - Very Poor
961	2	TP / 0001 / 205	12/G/0838880	,Valluvagar Nagar,Alangiyam	9786384905	f	2015-06-21 01:00:00-04	f	Tamil	f		Rent	500/-	t	E - Very Poor
962	2	TP / 0001 / 206		,Kadai veethi,Alangiyam	9750238602	f	2015-06-21 01:00:00-04	f	Tamil	f		Rent		t	E - Very Poor
970	2	TP / 0001 / 214	12/W/0005657	22B,South street,Alangiyam	9943723743	f	2015-06-21 01:00:00-04	f	Tamil	f		Rent	400 rs	t	D - Poor
977	2	TP / 0001 / 221	12/G/0427414	61/02,South muslim street,Alangiyam	9042892768	f	2015-06-21 01:00:00-04	f	TAMIL	f		Own	ODU	t	C - Middle Class
963	2	TP / 0001 / 207	12/G/0835683	3/101,South muslim street,Alangiyam	9585612311	f	2015-06-21 01:00:00-04	f	Tamil	f		Own	Odu	t	C - Middle Class
971	2	TP / 0001 / 215	33/G/0080177	2/41,North street,Alangiyam	8760474555	f	2015-06-21 01:00:00-04	f	Tamil	f		Rent	1500 rs	t	C - Middle Class
964	2	TP / 0001 / 208	12/W/0005648	2/58,old agiragara street,Alangiyam	9043262375	f	2015-06-21 01:00:00-04	f	Tamil	f		Rent	Odu	t	E - Very Poor
972	2	TP / 0001 / 216	12/G/0375691	66,Kadai veethi,Alangiyam		f	2015-06-21 01:00:00-04	f	Tamil	f		Rent	ODU	t	E - Very Poor
965	2	TP / 0001 / 209		,,Alangiyam	9751872521	f	2015-06-21 01:00:00-04	f	Tamil	f		Rent		t	C - Middle Class
983	2	TP / 0001 / 227	12/G/0427735	6/87,South muslim street,Alangiyam		f	2015-06-21 01:00:00-04	f	TAMIL	f		Own	ODU	t	C - Middle Class
978	2	TP / 0001 / 222	33/G/0084399	6/107,Sinnna Pallivasal Street,Alangiyam	9942253139	f	2015-06-21 01:00:00-04	f	TAMIL	f		Own	Terrace	t	C - Middle Class
973	2	TP / 0001 / 217	12/G/0376034	176,Periya Kadai Vethi,Alangiyam		f	2015-06-21 01:00:00-04	f	Tamil	f		Rent		t	E - Very Poor
974	2	TP / 0001 / 218	12/G/0427372	18,Periya Kadai Vethi,Alangiyam	9626029353	f	2016-06-21 01:00:00-04	f	Tamil	f		Own	TILED	t	E - Very Poor
990	2	TP / 0001 / 234	12/G/0375992	5/30A,South muslim street,Alangiyam	9943738092	f	2015-06-21 01:00:00-04	f	TAMIL	f		Own	ODU	t	C - Middle Class
979	2	TP / 0001 / 223	33/G/0013776	,South Street,Alangiyam		f	2015-06-21 01:00:00-04	f	TAMIL	f		Own		t	D - Poor
980	2	TP / 0001 / 224	12/G/0427316	9,South muslim street,Alangiyam	9751055986	f	2015-06-21 01:00:00-04	f	TAMIL	f		Own		t	E - Very Poor
981	2	TP / 0001 / 225	12/G/037579	36,MUSLIM STREET,Alangiyam	9843074355	f	2015-06-21 01:00:00-04	f	TAMIL	f		Own	ODU	t	C - Middle Class
988	2	TP / 0001 / 232	12/G/0375568	4/34,South muslim street,Alangiyam	8012659726	f	2015-06-21 01:00:00-04	f	TAMIL	f		Own	ODU	t	E - Very Poor
984	2	TP / 0001 / 228	12/G/0025988	6/87A,South muslim street,Alangiyam		f	2015-06-21 01:00:00-04	f	Tamil	f		Own	ODU	t	C - Middle Class
985	2	TP / 0001 / 229	33/G/0256738	6/87 B,South muslim street,Alangiyam		f	2015-06-21 01:00:00-04	f	TAMIL	f		Own	ODU	t	D - Poor
986	2	TP / 0001 / 230	12/G/0375996	4/34,South muslim street,Alangiyam	9092278600	f	2015-06-21 01:00:00-04	f	TAMIL	f		Own	ODU	t	E - Very Poor
996	2	TP / 0001 / 240		5/70,South muslim street,Alangiyam	9965203933	f	2015-06-21 01:00:00-04	f	TAMIL	f		Own		t	C - Middle Class
992	2	TP / 0001 / 236		5/26,South muslim street,Alangiyam	8190066671	f	2015-06-21 01:00:00-04	f	TAMIL	f		Own	ODU	t	D - Poor
994	2	TP / 0001 / 238		37,SEE SAHIB STREET,Alangiyam	9942126492	f	2015-06-21 01:00:00-04	f	TAMIL	f		Own		t	D - Poor
991	2	TP / 0001 / 235	12/G/0375993	5/30,South muslim street,Alangiyam	9442984277	f	2015-06-21 01:00:00-04	f	TAMIL	f		Own	ODU	t	B - Full Filled
993	2	TP / 0001 / 237		6/109,Sinna Pallivasal Street,Alangiyam	9976102763	f	2015-06-21 01:00:00-04	f	TAMIL	f		Own	TILED	t	C - Middle Class
995	2	TP / 0001 / 239		64,South muslim street,Alangiyam		f	2015-06-21 01:00:00-04	f	TAMIL	f		Rent	TILED	t	E - Very Poor
997	2	TP / 0001 / 241		2/164,Periya Kadai Vethi,Alangiyam	9443972007	f	2015-06-21 01:00:00-04	f	TAMIL	f		Own	TILED	t	B - Full Filled
998	2	TP / 0001 / 242		3/13,Periya Kadai Vethi,Alangiyam	9443972007	f	2015-06-21 01:00:00-04	f	TAMIL	f		Own	RC	t	B - Full Filled
999	2	TP / 0001 / 243		2/162,Periya Kadai Vethi,Alangiyam	9443972007	f	2015-06-21 01:00:00-04	f	TAMIL	f		Own	TILED	t	B - Full Filled
1000	2	TP / 0001 / 244		3/109/315,Periya Kadai Vethi,Alangiyam	9965215167	f	2015-06-21 01:00:00-04	f	TAMIL	f		Own	RCC	t	C - Middle Class
1001	2	TP / 0001 / 245		5/48,South muslim street,Alangiyam	9786319464	f	2015-06-21 01:00:00-04	f	TAMIL	f		Own		t	E - Very Poor
1002	2	TP / 0001 / 246		3/25,KAMARAJ STREET,Alangiyam	9715881930	f	2015-06-21 01:00:00-04	f	TAMIL	f		Rent	2000/-	t	C - Middle Class
1003	2	TP / 0001 / 247		11/129,Periya Kadai Vethi,Alangiyam	9943804822	f	2015-06-21 01:00:00-04	f	TAMIL	f		Rent		t	E - Very Poor
1004	2	TP / 0001 / 248		6/17,MUSLIM STREET,Alangiyam	9487930484	f	2015-06-21 01:00:00-04	f	TAMIL	f		Own	TILED	t	E - Very Poor
1005	2	TP / 0001 / 249		6/87,MUSLIM STREET,Alangiyam	9003685951	f	2015-06-21 01:00:00-04	f	TAMIL	f		Rent	2000	t	E - Very Poor
1006	2	TP / 0001 / 250		19/9,MUSLIM STREET,Alangiyam		f	2015-06-21 01:00:00-04	f	TAMIL	f		Rent	800/-	t	C - Middle Class
1007	2	TP / 0001 / 251		162/2,NORTH STREET,Alangiyam	9698078039	f	2015-06-21 01:00:00-04	f	TAMIL	f		Rent		t	E - Very Poor
1008	2	TP / 0001 / 252		81,Periya Kadai Vethi,Alangiyam	9787979459	f	2015-06-21 01:00:00-04	f	TAMIL	f		Rent	1000/-	t	C - Middle Class
1009	2	TP / 0001 / 253		161,KAMARAJAR NAGAR,Alangiyam	9698078039	f	2015-06-21 01:00:00-04	f	TAMIL	f		Rent	1500/-	t	E - Very Poor
1011	6	SI / 0001 / 1	25/G/0120887	27B,Old Sarukani Road,Devakottai	9487110352	f	2015-11-27 07:07:25.616221-05	f	Tamil	f		Own		t	C - Middle Class
1012	7	RA / 0001 / 1	GH/90/908	79/A small mosque	8940009095	f	2015-11-30 01:00:00-05	f	Tamil	t		Rent	Terrrace	t	A - Well Settled
\.


--
-- Name: senses_family_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('senses_family_id_seq', 1012, true);


--
-- Data for Name: senses_masjid; Type: TABLE DATA; Schema: public; Owner: root
--

COPY senses_masjid (id, taluk_id, district_id, mohalla_id, name, musallas, location) FROM stdin;
1	1	7	ER / 0001	Perundurai Palli		
2	2	26	TP / 0001	Alangiyam		Alangiyam
3	3	2	CH / 0001	Aanikar Masjid	1000	Neval Hospital Street
6	6	20	SI / 0001			Devakottai
7	7	18	RA / 0001	Small Mosque Street	800	Small Mosque Street
4	4	2	CH / 0002	Aayisha Masjid	1000	Aayisha masjid street
18	10	18	RA / 0002	Hmeedia masjid	10000	Melaltheru
19	10	18	RA / 0003	thittachery	999	ramnad 600009
\.


--
-- Name: senses_masjid_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('senses_masjid_id_seq', 19, true);


--
-- Data for Name: senses_masjid_members; Type: TABLE DATA; Schema: public; Owner: root
--

COPY senses_masjid_members (id, masjid_id, member_name, age, email, mobile, is_availonwhatsapp, is_coordinator, address, designation) FROM stdin;
9	4	Mohamed Althaf	22	unwo.althaf@ayisha.com	8489207935	f	t	Unwo complex	Process Executive
10	3	Mohamed Althaf	22	mohamedalthaf993@gmail.com	8489207935	f	t	unwo complex	Process Executive
13	7	Mohammed Ilyas	22	mohammed.ilyas@gmail.com	8940009095	t	t	Unwo-complex	It developer
14	7	Mohamed Shafin	22	shafin@gmail.com	99809898990	f	f	unwo-complex	Process executing
\.


--
-- Name: senses_masjid_members_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('senses_masjid_members_id_seq', 14, true);


--
-- Data for Name: senses_medical; Type: TABLE DATA; Schema: public; Owner: root
--

COPY senses_medical (id, member_id, disease_id, medicine_needs, cost, monthly_expend) FROM stdin;
39	300	24	N	N	N
40	301	24	N	N	N
41	324	6			
42	340	20			
12	147	16			
13	149	16			
14	163	9			
15	167	9			
16	168	18			
17	170	18			
18	189	6			300
19	190	6			
20	198	9			
21	208	9			
22	235	5			
43	356	7			
44	357	2			
45	359	15			2500/M
46	362	9			
47	366	8			2000/M
48	379	19			
49	383	25			700/M
50	386	6			
51	387	26			
52	393	16			
53	397	3			
54	398	26			
55	399	26			
56	404	2			
57	411	9			
58	412	9			
59	424	5			
60	427	9			
61	436	9			
62	443	9			
63	447	9			
64	455	11			
65	456	26			
67	466	16			
68	471	2			
69	479	9			
70	480	2			
71	491	9			
72	501	18			
73	505	9			
74	506	4			
75	509	10			
76	515	2			
77	569	27			
78	573	9			
79	576	4			
80	579	9			
81	591	9			
82	592	5			
83	600	9			
84	606	19			
85	627	6			300
86	636	6			
87	638	8			
88	647	6			
89	651	6			
90	660	6			
91	678	18			
92	684	7			
93	685	28			
94	686	29			
96	695	9			
97	760	6			
98	779	9			
99	781	2			500
100	809	2			
101	823	3			
102	824	6			
103	826	19			
104	827	6			
105	834	2			
106	843	4			
107	854	6			2000
108	876	6			1500
109	890	9			
110	894	9			
111	903	9			
112	947	7			
113	990	9			
114	1003	9			500/M
115	1006	16			
116	1032	9			
117	1037	5			
118	1072	17			
119	1104	16			
120	1110	2			
121	1111	2			
122	1113	6			
123	1114	30			
124	1124	31			
125	1125	16			
126	1130	9			
127	1131	32			
128	1142	33			
129	1158	33			
130	1162	26			
131	1184	34			
132	1189	26			
133	1193	35			
134	1200	26			
135	1211	9			
136	1213	36			
137	1224	9			
138	1236	9			
139	1246	37			
140	1247	38			
141	1254	39			
142	1263	26			
143	1266	40			
144	1268	9			
145	1270	41			
146	1271	37			
147	1273	39			
148	1290	35			500
149	1297	9			
150	1298	9			
151	1303	26			
152	1308	39			500
1	19	5			
2	27	21			5000
3	31	22			
4	63	23			1000
5	88	2			
6	99	7			
7	112	2			
8	115	2			
9	124	2			
10	127	19			
11	128	16			
23	236	4			
24	238	5			
25	89	7			
26	99	16			
27	100	5			
28	105	9			
29	147	6			
30	272	5	N	NA	NA
31	279	17	N	N	N
32	286	19	N	N	N
33	288	6	N	2000/Month	N
34	292	7	N	N	N
35	296	5	N	N	N
36	297	24	N	N	N
37	298	24	N	N	N
38	299	24	N	N	N
66	463	10			
95	694	5			
153	1325	42			
154	1326	5			
155	1335	16			
156	1345	4			
157	1355	43			
158	1358	10			
159	1363	9			4000
160	1364	9			4000
161	1366	42			
162	1376	7			1800
163	1380	16			
164	1381	37			
165	1390	9			
166	1391	41			
167	1396	4			
168	1400	33			
169	1445	9			
170	1449	4			
171	1453	9			
172	1470	44			
173	1471	6			
174	1480	26			
175	1487	16			
176	1494	9			
177	1495	9			
178	1498	26	Supermet Cat 20Mg		750
179	1532	45			
180	1535	16			
181	1536	2			
182	1541	9			
183	1544	46			
184	1548	47			
185	1556	2			
186	1561	33			
187	1565	2			
188	1568	9			
189	1581	5			
190	1589	5			
191	1590	5			
192	1599	6			1000
193	1603	2			
194	1610	9			
195	1613	26			
196	1621	42			
197	1627	6			1700
198	1628	6			
199	1629	26			
200	1645	16			
201	1646	2			
202	1650	9			
203	1652	2			
204	1657	8			
205	1659	2			
206	1663	5			
207	1671	42			
208	1672	9			
209	1683	10			
210	1685	48			
211	1694	9			
212	1702	12			
213	1705	13			
214	1742	26			
215	1751	49			
216	1752	49			
217	1800	50			
218	1801	50			
219	1804	51			
220	1825	49			
221	1834	52		30000	
222	1837	53			
223	1843	49			
224	1864	54	40000		
225	1878	55			
226	1879	49			
227	1913	56		75000	
228	1922	50			
229	1923	57			
230	1926	49			
231	1927	49			
232	1972	50			
233	1973	50			
234	1974	50			
235	2005	9			
236	2009	9			
237	2043	58			
238	2056	9			
239	2067	9			1500
240	2082	25			
241	2101	35			
242	2102	59			
243	2114	9			1140
244	2115	60			1140
245	2120	9			
246	2147	61			
247	2159	9			
248	2168	62			
249	2169	63			
250	2170	40			1500
251	2171	9			2000
252	2179	35			
253	2182	41			
254	2183	26			500
255	2187	64			
256	2204	9			800
257	2216	65			
258	2220	66			
259	2222	67			
260	2224	68			
261	2229	9			
262	2230	26			
263	2233	69			
264	2239	26			
265	2243	70			
266	2244	40			
267	2245	40			
268	2263	9			
269	2273	26			
270	2274	26			
271	2283	65			
272	2290	38			
273	2292	9			
274	2293	40			
275	2298	26			
276	2299	35			
277	2304	35			
278	2305	71			
279	2309	9			
280	2321	72			
281	2322	73			
282	2339	39			
283	2344	74			
284	2354	75			
285	2361	35			
286	2364	76			
287	2372	9			
288	2388	6			
289	2389	26			
290	2390	3			
291	2395	77			
292	2399	5		2500/M	
293	2402	4			
294	2404	18			
295	2406	9			
296	2411	26			
297	2412	9			500/M
298	2418	2			200/M
299	2424	4			
300	2439	2			
301	2440	2			
302	2441	9			
303	2444	25			
304	2449	25			
305	2450	10			
306	2464	2			
307	2469	5			
308	2472	9			
309	2477	16			
310	2479	78			
311	2484	79			
312	2491	6			
313	2496	2			
314	2497	5			
315	2498	26			
316	2499	2			
317	2500	14			
318	2502	9			
319	2509	6			
320	2514	9			
321	2515	9			
322	2519	13			
323	2520	9			
324	2524	5			
325	2530	9			
326	2533	25			1000/M
327	2536	9			
328	2538	7			
329	2541	9			
330	2547	2			
331	2551	5			300/M
332	2552	5			200/M
333	2556	6			
334	2558	25			
335	2559	25			600/M
336	2560	25			
337	2561	13			
338	2571	6			
339	2575	13			
340	2581	2			
341	2588	2			700/M
342	2600	25			1000/M
343	2605	80			700/m
344	2606	80			
345	2608	25			250/M
346	2609	25			250/M
347	2637	8			
348	2643	4			
349	2644	4			
350	2647	6			
351	2650	25			
352	2652	5			500/M
353	2655	6			500/M
354	2665	18			
355	2669	9			
356	2670	9			
357	2674	24	N	N	N
358	2675	24	N	N	N
359	2676	24	N	N	N
360	2677	24	N	N	N
361	2678	24	N	N	N
362	2679	81	N	400	400
363	2680	24	N	N	N
364	2681	24	N	N	N
365	2682	24	N	N	N
366	2683	82	N	N	N
367	2684	24	N	N	N
368	2685	24	N	N	N
369	2688	26			
370	2690	7			
371	2715	2			
372	2742	83			1200
373	2754	9			1000
374	2755	9			1000
375	2764	4			
376	2765	84			
377	2770	7			
378	2772	85			
379	2776	35			
380	2782	9			
381	2785	9			
382	2786	35			
383	2790	33			
384	2795	86			
385	2797	87			
386	2803	9			
387	2811	26			
388	2827	9			
389	2859	47			
390	2864	39			
391	2873	88			
392	2881	5			
393	2885	26			
394	2888	6			1500
395	2891	89			
396	2920	90			
397	2923	91			500
398	2925	92			
399	2929	5			
400	2930	13			
401	2931	9			
402	2938	84			
403	2939	5			
404	2946	26			
405	2951	93			5000
406	2953	5			
407	2954	94			
408	2955	16			
409	2956	26			
410	2957	20			
411	2966	2			
412	2968	16			
413	2976	95			1500
414	2996	2			1500
415	3025	96			
416	3027	97			
417	3028	98			
418	3030	2			
419	3034	99			
420	3039	18			420
421	3042	26			350
422	3045	22			
423	3046	2			
424	3069	100			
425	3073	101			700
426	3086	26			
427	3088	26			5000
428	3089	3			
429	3093	6			
430	3094	7			
431	3095	2			
432	3100	9			
433	3122	4			
434	3126	26			
435	3145	5			
436	3149	26			
437	3150	7			
438	3156	92			
439	3157	102			
440	3160	103			
441	3161	103			
442	3172	5			
443	3184	104			
444	3189	105			
445	3190	106			
446	3198	107			1000
447	3205	18			
448	3208	18			
449	3221	13			
450	3237	12			
451	3258	12			
452	3259	12			
453	3260	12			
454	3271	12			
455	3272	12			
456	3311	7			
457	3312	12			
458	3315	5			
459	3316	19			
460	3318	12			
461	3338	108			
462	3343	12			
463	3344	12			
464	3345	12			
465	3363	12			
466	3366	12			
467	3379	18			
468	3388	12			
\.


--
-- Name: senses_medical_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('senses_medical_id_seq', 468, true);


--
-- Data for Name: senses_member; Type: TABLE DATA; Schema: public; Owner: root
--

COPY senses_member (id, muhalla_id, taluk_id, district_id, mem_id, name, gender, dateofbirth, age, "Relation", family_head, marital_status, qualification, mother_tongue, disability, alive, voter_status, family_id, donor, quran_reading, namaz, mobile, volunteer, occupation, curr_location, "Makthab", madarasa_details, mem_age_month) FROM stdin;
5	1	1	7	ER / 0001 / 661 / 3	S.Sadam Hussain	MALE	1991-10-08 01:00:00-04	24	Son	f	Single	B.com 	\N	f	t	t	3	f	f		\N	f	Labor	Local	f		0
2	1	1	7	ER / 0001 / 660 / 		MALE	2014-10-08 01:00:00-04	1		f	Single		\N	f	t	f	2	f	f		\N	f		Local	f		0
10	1	1	7	ER / 0001 / 663 / 		MALE	2014-10-08 01:00:00-04	1		f	Single		\N	f	t	f	5	f	f		\N	f		Local	f		0
26	1	1	7	ER / 0001 / 669 / 		MALE	2014-10-08 01:00:00-04	1		f	Single		\N	f	t	f	11	f	f		\N	f		Local	f		0
6	1	1	7	ER / 0001 / 662 / 1	D.Anvar Basha	MALE	1982-10-08 01:00:00-04	33	Family Head	t	Married	6	\N	f	t	t	4	f	f		\N	f	Labor	Local	f		0
7	1	1	7	ER / 0001 / 662 / 2	A.Farhana	FEMALE	1987-10-08 01:00:00-04	28	Wife	f	Married	SSLC	\N	f	t	t	4	f	f		\N	f	Labor	Local	f		0
8	1	1	7	ER / 0001 / 662 / 3	A.Vaheit	MALE	2007-10-08 01:00:00-04	8	Son	f	Single	2	\N	f	t	f	4	f	f		\N	f	Student	Local	f		0
9	1	1	7	ER / 0001 / 662 / 4	Mohammed Afrith	MALE	2012-10-08 01:00:00-04	3	Son	f	Single	N	\N	f	t	f	4	f	f		\N	f	Child	Local	f		0
12	1	1	7	ER / 0001 / 664 / 2	Z.Mumtaj Bagam	FEMALE	1984-10-08 01:00:00-04	31	Wife	f	Married	7	\N	f	t	t	6	f	f		\N	f	Labor	Local	f		0
13	1	1	7	ER / 0001 / 664 / 3	Z.Sagana Parveen	FEMALE	2001-10-08 01:00:00-04	14	Daughter	f	Single	8	\N	f	t	f	6	f	f		\N	f	Student	Local	f		0
14	1	1	7	ER / 0001 / 664 / 4	Z.Riyana Parveen	FEMALE	2004-10-08 01:00:00-04	11	Daughter	f	Single	4	\N	f	t	f	6	f	f		\N	f	Student	Local	f		0
15	1	1	7	ER / 0001 / 665 / 1	E.Kursit Basha	MALE	1972-08-08 01:00:00-04	43	Family Head	t	Married	6	\N	f	t	f	7	f	f		\N	f	Tailor	Local	f		0
16	1	1	7	ER / 0001 / 665 / 2	K.Parveen Banu	FEMALE	1981-08-08 01:00:00-04	34	Wife	f	Married	5	\N	f	t	f	7	f	f		\N	f	Tailor	Local	f		0
17	1	1	7	ER / 0001 / 665 / 3	K.Asath Khan	MALE	2000-08-08 01:00:00-04	15	Son	f	Single	9	\N	f	t	f	7	f	f		\N	f	Student	Local	f		0
18	1	1	7	ER / 0001 / 665 / 4	K.Hussian Khan	MALE	2003-10-08 01:00:00-04	12	Son	f	Single	7	\N	f	t	f	7	f	f		\N	f	Student	Local	f		0
19	1	1	7	ER / 0001 / 666 / 1	A.Raseda	FEMALE	1949-10-08 01:00:00-05	66	Family Head	t	Married	3	\N	f	t	t	8	f	f		\N	f	House wife	Local	f		0
20	1	1	7	ER / 0001 / 667 / 1	D.S. Lyagath Alli	MALE	1950-10-08 01:00:00-05	65	Family Head	t	Married	12	\N	f	t	t	9	f	f		\N	f	Fruit Sales	Local	f		0
21	1	1	7	ER / 0001 / 667 / 2	Shakela Banu	FEMALE	1965-10-08 01:00:00-04	50	Wife	f	Married	8	\N	f	t	t	9	f	f		\N	f	House wife	Local	f		0
22	1	1	7	ER / 0001 / 668 / 1	Abdul Rhaman	MALE	1980-10-08 01:00:00-04	35	Family Head	t	Married	SSLC	\N	f	t	f	10	f	f		\N	f	Bakri	Local	f		0
23	1	1	7	ER / 0001 / 668 / 2	Rabiya Basiriya	FEMALE	1985-10-08 01:00:00-04	30	Wife	f	Married	5	\N	f	t	t	10	f	f		\N	f	House wife	Local	f		0
24	1	1	7	ER / 0001 / 668 / 3	Amith Khan	MALE	2006-10-08 01:00:00-04	9	Son	f	Single	4	\N	f	t	f	10	f	f		\N	f	Student	Local	f		0
25	1	1	7	ER / 0001 / 668 / 4	Lylathul Afsara	FEMALE	2010-10-08 01:00:00-04	5	Daughter	f	Single	1	\N	f	t	f	10	f	f		\N	f	Student	Local	f		0
28	1	1	7	ER / 0001 / 670 / 2	S.Ayisha	FEMALE	1986-10-08 01:00:00-04	29	Wife	f	Married	8	\N	f	t	t	12	f	f		\N	f	House wife	Local	f		0
29	1	1	7	ER / 0001 / 670 / 3	S. Ashifa	FEMALE	2009-10-08 01:00:00-04	6	Daughter	f	Single	UKG	\N	f	t	f	12	f	f		\N	f	Student	Local	f		0
30	1	1	7	ER / 0001 / 670 / 4	S.Asiya	FEMALE	2012-10-08 01:00:00-04	3	Daughter	f	Single		\N	f	t	f	12	f	f		\N	f	Child	Local	f		0
31	1	1	7	ER / 0001 / 671 / 1	S.Jenat Bagam	FEMALE	1955-10-08 01:00:00-04	60	Family Head	t	Married		\N	f	t	t	13	f	f		\N	f	House wife	Local	f		0
32	1	1	7	ER / 0001 / 671 / 2	Sakel Ahmad	MALE	1975-10-08 01:00:00-04	40	Son	f	Married	8	\N	f	t	t	13	f	f		\N	f	Turner	Local	f		0
33	1	1	7	ER / 0001 / 671 / 3	Mubarak.S	MALE	1985-10-08 01:00:00-04	30	Son	f	Married	8	\N	f	t	t	13	f	f		\N	f	Turner	Local	f		0
34	1	1	7	ER / 0001 / 671 / 4	S.Sammem Banu	FEMALE	1988-10-08 01:00:00-04	27	.Daughter in law	f	Married	6	\N	f	t	t	13	f	f		\N	f	House wife	Local	f		0
35	1	1	7	ER / 0001 / 671 / 5	S.Aiysha Sidquha	FEMALE	2007-10-08 01:00:00-04	8	Grand daughter	f	Single	2	\N	f	t	f	13	f	f		\N	f	Student	Local	f		0
36	1	1	7	ER / 0001 / 671 / 6	S.Abubakar Siduq	MALE	2010-10-08 01:00:00-04	5	.Grand Son	f	Single	LKG	\N	f	t	f	13	f	f		\N	f	Student	Local	f		0
37	1	1	7	ER / 0001 / 671 / 7	S.yasmen Banu	FEMALE	1990-10-08 01:00:00-04	25	.Daughter in law	f	Married	B.com 	\N	f	t	t	13	f	f		\N	f	House wife	Local	f		0
38	1	1	7	ER / 0001 / 671 / 8	S.Afreen	FEMALE	2010-10-08 01:00:00-04	5	Grand daughter	f	Single	LKG	\N	f	t	f	13	f	f		\N	f	Student	Local	f		0
39	1	1	7	ER / 0001 / 671 / 9	S.Afrila siduq	FEMALE	2013-10-08 01:00:00-04	2	Grand daughter	f	Single		\N	f	t	f	13	f	f		\N	f	Child	Local	f		0
40	1	1	7	ER / 0001 / 672 / 1	E.Share Ali	MALE	1976-10-08 01:00:00-04	39	Family Head	t	Married	4	\N	f	t	t	14	f	f		\N	f	Work shope	Local	f		0
41	1	1	7	ER / 0001 / 672 / 2	J.Abima	MALE	1986-10-08 01:00:00-04	29	Wife	f	Married	9	\N	f	t	t	14	f	f		\N	f	House wife	Local	f		0
42	1	1	7	ER / 0001 / 672 / 3	S.Mohammed shagul Ameed	MALE	2003-10-08 01:00:00-04	12	Son	f	Single	7	\N	f	t	f	14	f	f		\N	f	Student	Local	f		0
43	1	1	7	ER / 0001 / 672 / 4	S.Mohammed Riyz	MALE	2008-10-08 01:00:00-04	7	Son	f	Single	1	\N	f	t	f	14	f	f		\N	f	Student	Local	f		0
44	1	1	7	ER / 0001 / 673 / 1	P.sanavulla	MALE	1972-10-08 01:00:00-04	43	Family Head	t	Married	DME	\N	f	t	t	15	f	f		\N	f	Engener 	Local	f		0
45	1	1	7	ER / 0001 / 673 / 2	R.Vagitha Banu	FEMALE	1978-10-08 01:00:00-04	37	Wife	f	Married	Bsc	\N	f	t	t	15	f	f		\N	f	House wife	Local	f		0
46	1	1	7	ER / 0001 / 673 / 3	S.Sanofar mariyam	FEMALE	2000-10-08 01:00:00-04	15	Daughter	f	Single	9	\N	f	t	f	15	f	f		\N	f	Student	Local	f		0
47	1	1	7	ER / 0001 / 673 / 4	S.Nilofer mariyam	FEMALE	2003-10-08 01:00:00-04	12	Daughter	f	Single	6	\N	f	t	f	15	f	f		\N	f	Student	Local	f		0
48	1	1	7	ER / 0001 / 674 / 1	M.Jafar Ulla	MALE	1944-10-08 01:00:00-04	71	Family Head	t	Married	5	\N	f	t	t	16	f	f		\N	f	Retirement	Local	f		0
49	1	1	7	ER / 0001 / 674 / 2	J.Jaibu Nisha	FEMALE	1956-10-08 01:00:00-04	59	Wife	f	Married	6	\N	f	t	t	16	f	f		\N	f	House wife	Local	f		0
50	1	1	7	ER / 0001 / 674 / 3	J.Sheik Farith	MALE	1989-10-08 01:00:00-04	26	Son	f	Married	6	\N	f	t	f	16	f	f		\N	f	Tailor	Local	f		0
51	1	1	7	ER / 0001 / 674 / 4	J.Abdul Vahith	MALE	1990-10-08 01:00:00-04	25	Son	f	Single	6	\N	f	t	t	16	f	f		\N	f	Tailor	Local	f		0
3	1	1	7	ER / 0001 / 661 / 1	M.Sikandar	MALE	1966-10-08 01:00:00-04	49	Family Head	t	Married	5	\N	f	t	t	3	f	f		\N	f	Fruit Sales	Local	f		0
4	1	1	7	ER / 0001 / 661 / 2	S.Muhammatha Bagam	FEMALE	1969-10-08 01:00:00-04	46	Wife	f	Married	7	\N	f	t	t	3	f	f		\N	f	House wife	Local	f		0
80	1	1	7	ER / 0001 / 683 / 3	J.Mohammed younis	MALE	2006-10-08 01:00:00-04	9	Son	f	Single	2	\N	f	t	f	25	f	f		\N	f	Student	Local	f		0
92	1	1	7	ER / 0001 / 3 / 		MALE	2014-08-09 01:00:00-04	1		f	Single		\N	f	t	f	30	f	f		\N	f		Local	f		0
82	1	1	7	ER / 0001 / 684 / 		MALE	2014-10-08 01:00:00-04	1		f	Single		\N	f	t	f	26	f	f		\N	f		Local	f		0
93	1	1	7	ER / 0001 / 4 / 1	K.M.Mohamed Musthafa	MALE	1959-09-08 01:00:00-04	56	Father	t	Aged Unmarried Woman	Diplomo	\N	f	t	t	31	f	f		\N	f	Hotel&Chicken Stall	Local	f		0
94	1	1	7	ER / 0001 / 4 / 2	M.Noorjahan	FEMALE	1964-09-08 01:00:00-04	51	Mother	f	Aged Unmarried Woman	5	\N	f	t	t	31	f	f		\N	f	House Wife	Local	f		0
95	1	1	7	ER / 0001 / 4 / 3	Pasila Yasmeen	FEMALE	1991-09-08 01:00:00-04	24	Daughter	f	Single	B.SC	\N	f	t	t	31	f	f		\N	f	Hotel Management	Local	f		0
96	1	1	7	ER / 0001 / 4 / 4	Rahila Jasmeen	FEMALE	1992-09-08 01:00:00-04	23	Daughter	f	Single	B.SC	\N	f	t	t	31	f	f		\N	f	Hotel Management	Local	f		0
99	1	1	7	ER / 0001 / 5 / 1	N.Mohamed Kaseem	MALE	1952-09-08 01:00:00-04	63	Husband	t	Aged Unmarried Woman		\N	f	t	t	32	f	f		\N	f	Pickle Business	Local	f		0
97	1	1	7	ER / 0001 / 4 / 5	Ameer Hussain 	MALE	2008-08-09 01:00:00-04	7	Grand Son	f	Aged Unmarried Woman	1	\N	f	t	f	31	f	f		\N	f	Student	Outstation	f		0
98	1	1	7	ER / 0001 / 4 / 6	Mohamed Younus	MALE	2010-08-09 01:00:00-04	5	Grand Son	f	Aged Unmarried Woman	P.K.G	\N	f	t	f	31	f	f		\N	f	Student	Outstation	f		0
52	1	1	7	ER / 0001 / 674 / 5	J.Abdul Rahem	MALE	1998-10-08 01:00:00-04	17	Son	f	Single	12	\N	f	t	f	16	f	f		\N	f	Student	Local	f		0
89	1	1	7	ER / 0001 / 2 / 2	A.Asath Nisha	FEMALE	1972-09-08 01:00:00-04	43	Mother	f	Aged Unmarried Woman	5	\N	f	t	t	29	f	f		\N	f	House Wife	Local	f		0
54	1	1	7	ER / 0001 / 675 / 2	S.Mahamutha Bagam	FEMALE	1988-10-08 01:00:00-04	27	Wife	f	Married	12	\N	f	t	f	17	f	f		\N	f	House wife	Local	f		0
55	1	1	7	ER / 0001 / 675 / 3	S.Arsheya	FEMALE	2012-10-08 01:00:00-04	3	Daughter	f	Single		\N	f	t	f	17	f	f		\N	f	Child	Local	f		0
56	1	1	7	ER / 0001 / 676 / 1	K.Ibrhim	MALE	1929-10-08 01:00:00-05	86	Family Head	t	Married		\N	f	t	f	18	f	f		\N	f	Retirement	Local	f		0
57	1	1	7	ER / 0001 / 676 / 2	Abdul samadu	MALE	1963-10-08 01:00:00-04	52	Son	f	Married	5	\N	f	t	t	18	f	f		\N	f	Pan sales	Local	f		0
58	1	1	7	ER / 0001 / 676 / 3	Ajara Beeve	FEMALE	1970-10-08 01:00:00-04	45	.Daughter in law	f	Married	5	\N	f	t	t	18	f	f		\N	f	House wife	Local	f		0
59	1	1	7	ER / 0001 / 676 / 4	Yasar Arafath	MALE	1990-10-08 01:00:00-04	25	.Grand Son	f	Single	B.teh	\N	f	t	t	18	f	f		\N	f	Computer Center	Local	f		0
60	1	1	7	ER / 0001 / 676 / 5	Ayunul enaya	FEMALE	1993-10-08 01:00:00-04	22	Grand daughter	f	Single	B.E	\N	f	t	f	18	f	f		\N	f	Student	Local	f		0
61	1	1	7	ER / 0001 / 676 / 6	Sakela Parveen	FEMALE	1996-10-08 01:00:00-04	19	Grand daughter	f	Single	Bsc	\N	f	t	f	18	f	f		\N	f	Student	Local	f		0
62	1	1	7	ER / 0001 / 677 / 1	Sheik Davuth	MALE	1960-10-08 01:00:00-04	55	Family Head	t	Married		\N	f	t	t	19	f	f		\N	f	Security	Local	f		0
63	1	1	7	ER / 0001 / 677 / 2	Mumtag	FEMALE	1972-10-08 01:00:00-04	43	Wife	f	Married		\N	f	t	t	19	f	f		\N	f	House wife	Local	f		0
64	1	1	7	ER / 0001 / 678 / 1	A.sadiq Basha	MALE	1969-10-08 01:00:00-04	46	Family Head	t	Married	4	\N	f	t	t	20	f	f		\N	f	Ice Sales	Local	f		0
65	1	1	7	ER / 0001 / 678 / 2	S.Meharu Nisha	FEMALE	1976-10-08 01:00:00-04	39	Wife	f	Married	3	\N	f	t	t	20	f	f		\N	f	House wife	Local	f		0
66	1	1	7	ER / 0001 / 678 / 3	S.Syed Abuthager	MALE	1995-10-08 01:00:00-04	20	Son	f	Single	9	\N	f	t	f	20	f	f		\N	f	Labor	Local	f		0
67	1	1	7	ER / 0001 / 678 / 4	S.Sagena Fathima	FEMALE	1996-10-08 01:00:00-04	19	Daughter	f	Single	bsc	\N	f	t	f	20	f	f		\N	f	Student	Local	f		0
68	1	1	7	ER / 0001 / 679 / 1	A.Mubarak Ali	MALE	1969-10-08 01:00:00-04	46	Family Head	t	Married	9	\N	f	t	t	21	f	f		\N	f	Labor	Local	f		0
69	1	1	7	ER / 0001 / 679 / 2	M.Sherin Frsana 	FEMALE	1979-10-08 01:00:00-04	36	Wife	f	Married	8	\N	f	t	t	21	f	f		\N	f	House wife	Local	f		0
70	1	1	7	ER / 0001 / 679 / 3	M.Thowfek	MALE	1998-10-08 01:00:00-04	17	Son	f	Single	11	\N	f	t	f	21	f	f		\N	f	Student	Local	f		0
71	1	1	7	ER / 0001 / 679 / 4	M.Thagera	FEMALE	2009-10-08 01:00:00-04	6	Daughter	f	Single	LKG	\N	f	t	f	21	f	f		\N	f	Student	Local	f		0
72	1	1	7	ER / 0001 / 680 / 1	S.Riyas	MALE	1984-10-08 01:00:00-04	31	Family Head	t	Married	BE	\N	f	t	t	22	f	f		\N	f	Design Work	Local	f		0
73	1	1	7	ER / 0001 / 680 / 2	R.Yasmen	FEMALE	1990-10-08 01:00:00-04	25	Wife	f	Married	B.com 	\N	f	t	f	22	f	f		\N	f	Office Work	Local	f		0
75	1	1	7	ER / 0001 / 681 / 2	F.Chitara	FEMALE	1990-10-08 01:00:00-04	25	Wife	f	Married	12	\N	f	t	t	23	f	f		\N	f	House wife	Local	f		0
76	1	1	7	ER / 0001 / 681 / 3	F.Mohammed Uksh	MALE	2008-10-08 01:00:00-04	7	Son	f	Single	1	\N	f	t	f	23	f	f		\N	f	Student	Local	f		0
77	1	1	7	ER / 0001 / 682 / 		MALE	2014-10-08 01:00:00-04	1		f	Single		\N	f	t	f	24	f	f		\N	f		Local	f		0
78	1	1	7	ER / 0001 / 683 / 1	S.Jan Basha	MALE	1982-10-08 01:00:00-04	33	Family Head	t	Married		\N	f	t	t	25	f	f		\N	f	Welder	Local	f		0
79	1	1	7	ER / 0001 / 683 / 2	S.Sakella	FEMALE	1984-10-08 01:00:00-04	31	Wife	f	Married	5	\N	f	t	t	25	f	f		\N	f	House wife	Local	f		0
53	1	1	7	ER / 0001 / 675 / 1	S.Mabu Sherif	MALE	1986-10-08 01:00:00-04	29	Family Head	t	Married	B.com 	\N	f	t	t	17	f	f		\N	f	Accountant	Local	f		0
81	1	1	7	ER / 0001 / 683 / 4	J.Sakera	FEMALE	2007-10-08 01:00:00-04	8	Daughter	f	Single	2	\N	f	t	f	25	f	f		\N	f	Student	Local	f		0
83	1	1	7	ER / 0001 / 685 / 1	S.sowgath Ali	MALE	1983-10-08 01:00:00-04	32	Family Head	t	Married	5	\N	f	t	t	27	f	f		\N	f	Painting	Local	f		0
84	1	1	7	ER / 0001 / 685 / 2	A.Mahatha Banu	FEMALE	1986-10-08 01:00:00-04	29	Wife	f	Married	Bsc	\N	f	t	t	27	f	f		\N	f	House wife	Local	f		0
85	1	1	7	ER / 0001 / 685 / 3	S.Mohammed Husain	MALE	2010-10-08 01:00:00-04	5	Son	f	Single		\N	f	t	f	27	f	f		\N	f	Child	Local	f		0
86	1	1	7	ER / 0001 / 685 / 4	S.Jafar Ali	MALE	2006-10-08 01:00:00-04	9	Son	f	Single		\N	f	t	f	27	f	f		\N	f	Child	Local	f		0
87	1	1	7	ER / 0001 / 1 / 		MALE	2014-08-09 01:00:00-04	1		f	Single		\N	f	t	f	28	f	f		\N	f		Local	f		0
90	1	1	7	ER / 0001 / 2 / 3	A.Sajitha Thahsin	FEMALE	1989-09-08 01:00:00-04	26	Daughter	f	Aged Unmarried Woman	12	\N	f	t	t	29	f	f		\N	f	Afzalul Ulama	Local	f		0
100	1	1	7	ER / 0001 / 5 / 2	Fathimutthu	FEMALE	1959-09-08 01:00:00-04	56	Wife	f	Aged Unmarried Woman	5	\N	f	t	t	32	f	f		\N	f	House Wife	Local	f		0
101	1	1	7	ER / 0001 / 5 / 3	Arishya Tasleem	FEMALE	1999-08-09 01:00:00-04	16	Daughter	f	Aged Unmarried Woman	10	\N	f	t	f	32	f	f		\N	f	Student	Local	f		0
91	1	1	7	ER / 0001 / 2 / 4	A.Shahul Hameed	MALE	1991-09-08 01:00:00-04	24	Son	f	Single	10	\N	f	t	t	29	f	f		\N	f	Textile Shop	Local	f		0
108	1	1	7	ER / 0001 / 8 / 2	Subaitha	FEMALE	1991-09-08 01:00:00-04	24	Mother	f	Aged Unmarried Woman	12	\N	f	t	f	34	f	f		\N	f	Tailor	Local	f		0
109	1	1	7	ER / 0001 / 8 / 3	Thaseen	FEMALE	2008-09-08 01:00:00-04	7	Daughter	f	Single	1	\N	f	t	f	34	f	f		\N	f		Local	f		0
112	1	1	7	ER / 0001 / 9 / 1	S.Abibulla	MALE	1962-09-08 01:00:00-04	53	Father	t	Aged Unmarried Woman	5	\N	f	t	t	35	f	f		\N	f	Bike Mechanic	Local	f		0
110	1	1	7	ER / 0001 / 8 / 4	Sharmila Banu	FEMALE	1989-08-09 01:00:00-04	26	Grand Daughter	f	Aged Unmarried Woman		\N	f	t	t	34	f	f		\N	f		Local	f		0
114	1	1	7	ER / 0001 / 10 / 1	Abdul Azeez	MALE	1958-09-08 01:00:00-04	57	Husband	t	Aged Unmarried Woman	3	\N	f	t	t	36	f	f		\N	f	Betal Shop	Local	f		0
111	1	1	7	ER / 0001 / 8 / 5	Asbia Imrana	FEMALE	2012-08-09 01:00:00-04	3	Grand Daughter	f	Aged Unmarried Woman		\N	f	t	f	34	f	f		\N	f		Local	f		0
119	1	1	7	ER / 0001 / 11 / 1	Abdul Kadar	MALE	1950-09-08 01:00:00-04	65	Husband	t	Aged Unmarried Woman	7	\N	f	t	t	37	f	f		\N	f	Betal Shop	Local	f		0
118	1	1	7	ER / 0001 / 10 / 5	Mohamed Abubakkar Siddiqe	MALE	1994-08-09 01:00:00-04	21	Son	f	Aged Unmarried Woman	7	\N	f	t	f	36	f	f		\N	f	Aircel Field Officer	Local	f		0
120	1	1	7	ER / 0001 / 11 / 2	Aajara Beevi	FEMALE	1954-09-08 01:00:00-04	61	Wife	f	Aged Unmarried Woman	6	\N	f	t	t	37	f	f		\N	f	House Wife	Local	f		0
121	1	1	7	ER / 0001 / 11 / 3	Abbas	MALE	1987-09-08 01:00:00-04	28	Son	f	Single	ITI	\N	f	t	t	37	f	f		\N	f	Fruits Shop	Local	f		0
122	1	1	7	ER / 0001 / 11 / 4	Kaja Mohideen	MALE	1998-09-08 01:00:00-04	17	Son	f	Single	12	\N	f	t	f	37	f	f		\N	f	Student	Local	f		0
123	1	1	7	ER / 0001 / 11 / 5	Tharvesh Mohideen	MALE	1981-09-08 01:00:00-04	34	Son	f	Aged Unmarried Woman	B.E	\N	f	t	t	37	f	f		\N	f	Foreign Shop	Foreign	f		0
128	1	1	7	ER / 0001 / 13 / 1	Abdullah	MALE	1945-09-08 01:00:00-04	70	Husband	t	Aged Unmarried Woman	6	\N	f	t	t	39	f	f		\N	f	Rest	Local	f		0
124	1	1	7	ER / 0001 / 12 / 1	P.M.Kaja Mohideen	MALE	1956-08-09 01:00:00-04	59	Husband 	t	Aged Unmarried Woman	10	\N	f	t	t	38	f	f		\N	f	Vessels Shop	Local	f		0
133	1	1	7	ER / 0001 / 14 / 1	Alavudeen	MALE	1955-09-08 01:00:00-04	60	Husband	t	Aged Unmarried Woman		\N	f	t	t	40	f	f		\N	f	Flower Shop	Local	f		0
125	1	1	7	ER / 0001 / 12 / 2	K.Nilofer Nisha	FEMALE	1966-08-09 01:00:00-04	49	Wife	f	Aged Unmarried Woman	6	\N	f	t	t	38	f	f		\N	f	House Wife	Local	f		0
140	1	1	7	ER / 0001 / 15 / 1	Syed Musthafa	MALE	1969-09-08 01:00:00-04	46	Father	t	Aged Unmarried Woman	8	\N	f	t	t	41	f	f		\N	f	Flower Shop	Local	f		0
131	1	1	7	ER / 0001 / 13 / 4	Nawsith Banu	FEMALE	1995-08-09 01:00:00-04	20	Daughter	f	Aged Unmarried Woman	B.SC	\N	f	t	f	39	f	f		\N	f	Student	Local	f		0
145	1	1	7	ER / 0001 / 17 / 1	M.Habeebur Rahman 	MALE	1954-09-08 01:00:00-04	61	Husband	t	Aged Unmarried Woman	5	\N	f	t	t	43	f	f		\N	f	Driver	Local	f		0
136	1	1	7	ER / 0001 / 14 / 4	Mahmooda Gani	FEMALE	1991-08-09 01:00:00-04	24	Daughter In Law	f	Aged Unmarried Woman	10	\N	f	t	t	40	f	f		\N	f	House Wife	Local	f		0
147	1	1	7	ER / 0001 / 18 / 1	A.Mohamed Usman	MALE	1954-09-08 01:00:00-04	61	Father	t	Aged Unmarried Woman	PUC	\N	f	t	t	44	f	f		\N	f	Karuvadu Shop	Local	f		0
143	1	1	7	ER / 0001 / 16 / 2	S.Fairose Begam	FEMALE	1967-08-09 01:00:00-04	48	Wife	f	Aged Unmarried Woman	7	\N	f	t	t	42	f	f		\N	f	House Wife	Local	f		0
104	1	1	7	ER / 0001 / 7 / 2	Mubeena	FEMALE	1985-09-08 01:00:00-04	30	Wife	f	Aged Unmarried Woman		\N	f	t	t	33	f	f		\N	f	House Wife	Local	f		0
106	1	1	7	ER / 0001 / 7 / 4	Yaseen	MALE	2001-09-08 01:00:00-04	14	Son	f	Single	9	\N	f	t	f	33	f	f		\N	f	Student	Local	f		0
107	1	1	7	ER / 0001 / 8 / 1	S.Rasi Ahmed	MALE	1989-09-08 01:00:00-04	26	Father	t	Aged Unmarried Woman	8	\N	f	t	f	34	f	f		\N	f	Tailor	Local	f		0
115	1	1	7	ER / 0001 / 10 / 2	Mumtaj Begam	FEMALE	1971-09-08 01:00:00-04	44	Wife	f	Aged Unmarried Woman	5	\N	f	t	t	36	f	f		\N	f	House Wife	Local	f		0
126	1	1	7	ER / 0001 / 12 / 3	K.Mohamed Sheik Fareed	MALE	1989-08-09 01:00:00-04	26	Son	f	Aged Unmarried Woman	25	\N	f	t	t	38	f	f		\N	f	Private Employmer	Outstation	f		0
113	1	1	7	ER / 0001 / 9 / 2	Rahila  	FEMALE	1972-09-08 01:00:00-04	43	Mother	f	Aged Unmarried Woman	8	\N	f	t	t	35	f	f		\N	f	House Wife	Local	f		0
130	1	1	7	ER / 0001 / 13 / 3	B.Naseema Begam	FEMALE	1992-08-09 01:00:00-04	23	Daughter	f	Aged Unmarried Woman	B.SC	\N	f	t	t	39	f	f		\N	f	Private School Teacher	Local	f		0
135	1	1	7	ER / 0001 / 14 / 3	Jaan Basheer	MALE	1989-08-09 01:00:00-04	26	Son	f	Aged Unmarried Woman	9	\N	f	t	t	40	f	f		\N	f	Fruits Shop	Local	f		0
127	1	1	7	ER / 0001 / 12 / 4	Jameela Beevi	FEMALE	1929-08-09 01:00:00-04	86	Mother	f	Aged Unmarried Woman	85	\N	f	t	t	38	f	f		\N	f	House Wife	Local	f		0
129	1	1	7	ER / 0001 / 13 / 2	Mehar Nisha	FEMALE	1947-09-08 01:00:00-04	68	Wife	f	Aged Unmarried Woman	2	\N	f	t	t	39	f	f		\N	f		Local	f		0
132	1	1	7	ER / 0001 / 13 / 5	B.Abdul Musharaf	MALE	2000-08-09 01:00:00-04	15	Son	f	Aged Unmarried Woman	9	\N	f	t	f	39	f	f		\N	f	Student	Local	f		0
142	1	1	7	ER / 0001 / 16 / 1	A.Sheik Dawood	MALE	1952-08-09 01:00:00-04	63	Husband 	t	Aged Unmarried Woman	9	\N	f	t	t	42	f	f		\N	f	Pane Shop	Local	f		0
134	1	1	7	ER / 0001 / 14 / 2	Thaj 	FEMALE	1966-09-08 01:00:00-04	49	Wife	f	Aged Unmarried Woman		\N	f	t	t	40	f	f		\N	f		Local	f		0
137	1	1	7	ER / 0001 / 14 / 5	Mohamed Aabik	MALE	2010-08-09 01:00:00-04	5	Grand Son	f	Aged Unmarried Woman		\N	f	t	f	40	f	f		\N	f		Local	f		0
651	2	2	26	TP / 0001 / 98 / 1	Sakila Banu	MALE	1969-11-13 09:48:54.911013-05	46	Father	t	Aged Unmarried Woman	5	\N	f	t	f	198	f	f		\N	f	Rest	Local	f		0
138	1	1	7	ER / 0001 / 14 / 6	Mohamed Kasim	MALE	1992-08-09 01:00:00-04	23	Son	f	Aged Unmarried Woman	8	\N	f	t	t	40	f	f		\N	f	Plastic Company Labour	Local	f		0
139	1	1	7	ER / 0001 / 14 / 7	Mohamed Rahman	MALE	1995-08-09 01:00:00-04	20	Son	f	Aged Unmarried Woman	8	\N	f	t	t	40	f	f		\N	f	Two Wheeler Mechanicer	Local	f		0
141	1	1	7	ER / 0001 / 15 / 2	Mumtaj 	FEMALE	1980-09-08 01:00:00-04	35	Mother	f	Aged Unmarried Woman	8	\N	f	t	t	41	f	f		\N	f	House Wife	Local	f		0
146	1	1	7	ER / 0001 / 17 / 2	A.Alimutthu Ahadiya	FEMALE	1964-09-08 01:00:00-04	51	Wife	f	Aged Unmarried Woman	6	\N	f	t	t	43	f	f		\N	f		Local	f		0
105	1	1	7	ER / 0001 / 7 / 3	Aamina	FEMALE	1954-09-08 01:00:00-04	61	Mother	f	Aged Unmarried Woman		\N	f	t	t	33	f	f		\N	f	H.R	Local	f		0
650	2	2	26	TP / 0001 / 97 / 		MALE	2015-11-13 09:48:54.890935-05	0		f	Single		\N	f	t	f	197	f	f		\N	f		Local	f		0
116	1	1	7	ER / 0001 / 10 / 3	Mosina Begam	FEMALE	1997-09-08 01:00:00-04	18	Daughter	f	Single	Polytechnic	\N	f	t	f	36	f	f		\N	f		Local	f		0
165	1	1	7	ER / 0001 / 28 / 		MALE	2014-09-08 01:00:00-04	1		f	Single		\N	f	t	f	49	f	f		\N	f		Local	f		0
190	1	1	7	ER / 0001 / 37 / 2	S.Ajeemu Nisha	FEMALE	1958-09-08 01:00:00-04	57	Mother	f	Aged Unmarried Woman	12	\N	f	t	t	58	f	f		\N	f	House Wife	Local	f		0
187	1	1	7	ER / 0001 / 35 / 		MALE	2014-09-08 01:00:00-04	1		f	Single		\N	f	t	f	56	f	f		\N	f		Local	f		0
153	1	1	7	ER / 0001 / 19 / 2	S.Parveen	FEMALE	1991-09-08 01:00:00-04	24	Mother	f	Aged Unmarried Woman	8	\N	f	t	t	45	f	f		\N	f	Tailor	Local	f		0
155	1	1	7	ER / 0001 / 19 / 4	Hasina Fathima	FEMALE	2006-08-09 01:00:00-04	9	Daughter	f	Aged Unmarried Woman	3	\N	f	t	f	45	f	f		\N	f	Student	Local	f		0
157	1	1	7	ER / 0001 / 25 / 2	Khos Beevi	FEMALE	1967-09-08 01:00:00-04	48	Wife	f	Aged Unmarried Woman	5	\N	f	t	t	46	f	f		\N	f	House Wife	Local	f		0
152	1	1	7	ER / 0001 / 19 / 1	M.Syed Ismail	MALE	1986-09-08 01:00:00-04	29	Father	t	Aged Unmarried Woman	6	\N	f	t	t	45	f	f		\N	f	2 Wheeler Mechanical	Local	f		0
159	1	1	7	ER / 0001 / 26 / 2	S.Ramla Banu	FEMALE	1981-09-08 01:00:00-04	34	Mother	f	Aged Unmarried Woman	8	\N	f	t	t	47	f	f		\N	f	House Wife	Local	f		0
154	1	1	7	ER / 0001 / 19 / 3	S.Syed Akmal	MALE	2009-09-08 01:00:00-04	6	Son	f	Single	U.K.G	\N	f	t	f	45	f	f		\N	f	Student	Local	f		0
156	1	1	7	ER / 0001 / 25 / 1	Thahir Basha	MALE	1949-09-08 01:00:00-04	66	Husband	t	Aged Unmarried Woman		\N	f	t	t	46	f	f		\N	f	Tailor	Local	f		0
158	1	1	7	ER / 0001 / 26 / 1	M.Saet Mohamed 	MALE	1977-09-08 01:00:00-04	38	Father 	t	Aged Unmarried Woman	5	\N	f	t	t	47	f	f		\N	f	Baniyan Company Labour	Local	f		0
160	1	1	7	ER / 0001 / 26 / 3	S.Rifana Jasmeen	FEMALE	1997-09-08 01:00:00-04	18	Daughter	f	Single	12	\N	f	t	f	47	f	f		\N	f	Student	Local	f		0
161	1	1	7	ER / 0001 / 26 / 4	S.Abbas	MALE	2000-09-08 01:00:00-04	15	Son	f	Single	10	\N	f	t	f	47	f	f		\N	f	Student	Local	f		0
162	1	1	7	ER / 0001 / 27 / 1	M.Dhasthakeer	MALE	1961-09-08 01:00:00-04	54	Father 	t	Aged Unmarried Woman	4	\N	f	t	t	48	f	f		\N	f	Labour	Local	f		0
163	1	1	7	ER / 0001 / 27 / 2	T.Musthas Beevi	FEMALE	1972-09-08 01:00:00-04	43	Mother	f	Aged Unmarried Woman	2	\N	f	t	t	48	f	f		\N	f	House Wife	Local	f		0
164	1	1	7	ER / 0001 / 27 / 3	T.Agana Begam	FEMALE	1996-09-08 01:00:00-04	19	Daughter	f	Single	8	\N	f	t	f	48	f	f		\N	f	Rest	Local	f		0
166	1	1	7	ER / 0001 / 29 / 1	Mubarak Ali	MALE	1966-09-08 01:00:00-04	49	Father 	t	Aged Unmarried Woman		\N	f	t	t	50	f	f		\N	f	Cycle Shop	Local	f		0
167	1	1	7	ER / 0001 / 29 / 2	Kuljanar	FEMALE	1969-09-08 01:00:00-04	46	Mother	f	Aged Unmarried Woman		\N	f	t	t	50	f	f		\N	f	House Wife	Local	f		0
168	1	1	7	ER / 0001 / 29 / 3	Yakoob Ali	MALE	1989-09-08 01:00:00-04	26	Son	f	Single		\N	f	t	t	50	f	f		\N	f	Baniyan Company Labour	Local	f		0
169	1	1	7	ER / 0001 / 29 / 4	Yasmeen Banu	FEMALE	2004-09-08 01:00:00-04	11	Daughter	f	Single		\N	f	t	f	50	f	f		\N	f	Student	Local	f		0
170	1	1	7	ER / 0001 / 30 / 1	Malikkun Naseer	MALE	1949-09-08 01:00:00-04	66	Father 	t	Aged Unmarried Woman	9	\N	f	t	f	51	f	f		\N	f		Local	f		0
171	1	1	7	ER / 0001 / 30 / 2	Thhahirun Nisha	FEMALE	1959-09-08 01:00:00-04	56	Mother	f	Aged Unmarried Woman	5	\N	f	t	f	51	f	f		\N	f	House Wife	Local	f		0
172	1	1	7	ER / 0001 / 30 / 3	Syed Idrees	MALE	1986-09-08 01:00:00-04	29	Son	f	Single	12	\N	f	t	f	51	f	f		\N	f	BSNL Office Labour	Local	f		0
174	1	1	7	ER / 0001 / 31 / 2	Narkis Banu	FEMALE	1976-09-08 01:00:00-04	39	Mother	f	Aged Unmarried Woman	6	\N	f	t	t	52	f	f		\N	f	House Wife	Local	f		0
175	1	1	7	ER / 0001 / 31 / 3	Jaffer Sathick	MALE	2000-09-08 01:00:00-04	15	Son	f	Single	8	\N	f	t	f	52	f	f		\N	f	Student	Local	f		0
176	1	1	7	ER / 0001 / 32 / 1	Sheik Ajees	MALE	1947-09-08 01:00:00-04	68	Father 	t	Aged Unmarried Woman		\N	f	t	t	53	f	f		\N	f	Tailor	Local	f		0
177	1	1	7	ER / 0001 / 32 / 2	Mumtaj Begam	FEMALE	1967-09-08 01:00:00-04	48	Mother	f	Aged Unmarried Woman		\N	f	t	t	53	f	f		\N	f	House Wife	Local	f		0
178	1	1	7	ER / 0001 / 32 / 3	Ihsanullah	MALE	1988-09-08 01:00:00-04	27	Son	f	Single		\N	f	t	t	53	f	f		\N	f		Local	f		0
179	1	1	7	ER / 0001 / 33 / 1	N.Sheik Ismail	MALE	1964-09-08 01:00:00-04	51	Father 	t	Aged Unmarried Woman	12	\N	f	t	t	54	f	f		\N	f	Labour	Local	f		0
180	1	1	7	ER / 0001 / 33 / 2	M.Sulaika	FEMALE	1982-09-08 01:00:00-04	33	Mother	f	Aged Unmarried Woman	8	\N	f	t	t	54	f	f		\N	f	Acupuncture Doctor	Local	f		0
181	1	1	7	ER / 0001 / 33 / 3	S.Noor Mohamed 	MALE	1993-09-08 01:00:00-04	22	Son	f	Single	B.E	\N	f	t	t	54	f	f		\N	f	Student	Local	f		0
182	1	1	7	ER / 0001 / 34 / 1	M.Alaudeen	MALE	1977-09-08 01:00:00-04	38	Father 	t	Aged Unmarried Woman	3	\N	f	t	t	55	f	f		\N	f	Recover Waste Thing	Local	f		0
183	1	1	7	ER / 0001 / 34 / 2	A.Fasih Nisha	FEMALE	1986-09-08 01:00:00-04	29	Mother	f	Aged Unmarried Woman	9	\N	f	t	f	55	f	f		\N	f	House Wife	Local	f		0
184	1	1	7	ER / 0001 / 34 / 3	A.Abuthahir	MALE	2000-09-08 01:00:00-04	15	Son	f	Single	10	\N	f	t	f	55	f	f		\N	f	Student	Local	f		0
185	1	1	7	ER / 0001 / 34 / 4	Mudassir	FEMALE	2004-09-08 01:00:00-04	11	Daughter	f	Single	5	\N	f	t	f	55	f	f		\N	f	Student	Local	f		0
186	1	1	7	ER / 0001 / 34 / 5	M.Kavarjan	FEMALE	1985-09-08 01:00:00-04	30	Daughter	f	Aged Unmarried Woman		\N	f	t	f	55	f	f		\N	f	Rest	Local	f		0
188	1	1	7	ER / 0001 / 36 / 		MALE	2014-09-08 01:00:00-04	1		f	Single		\N	f	t	f	57	f	f		\N	f		Local	f		0
189	1	1	7	ER / 0001 / 37 / 1	A.Sha Aalam	MALE	1954-09-08 01:00:00-04	61	Father 	t	Aged Unmarried Woman	9	\N	f	t	t	58	f	f		\N	f	S.E.Retaired Officer	Local	f		0
191	1	1	7	ER / 0001 / 37 / 3	S.Ibrahim	MALE	1986-09-08 01:00:00-04	29	Son	f	Single	M.B.A	\N	f	t	t	58	f	f		\N	f	Assistant Manager	Local	f		0
192	1	1	7	ER / 0001 / 37 / 4	S.Imthiyas	MALE	1990-09-08 01:00:00-04	25	Son	f	Single	M.E	\N	f	t	t	58	f	f		\N	f	Assistant Professor	Outstation	f		0
193	1	1	7	ER / 0001 / 38 / 1	A.Akbar Ali	MALE	1959-09-08 01:00:00-04	56	Father 	t	Aged Unmarried Woman	6	\N	f	t	t	59	f	f		\N	f	Vegetables Shop	Local	f		0
194	1	1	7	ER / 0001 / 38 / 2	A.Saila Banu	FEMALE	1969-09-08 01:00:00-04	46	Mother	f	Aged Unmarried Woman	8	\N	f	t	t	59	f	f		\N	f	Baniyan Company Labour	Outstation	f		0
195	1	1	7	ER / 0001 / 38 / 3	A.Umar	MALE	1993-09-08 01:00:00-04	22	Son	f	Single	ECE	\N	f	t	t	59	f	f		\N	f	Job Searching	Local	f		0
196	1	1	7	ER / 0001 / 39 / 1	S.Shajahan	MALE	1962-09-08 01:00:00-04	53	Father 	t	Aged Unmarried Woman		\N	f	t	t	60	f	f		\N	f	Tailor	Local	f		0
197	1	1	7	ER / 0001 / 39 / 2	S.Imthiyas Ahmed	FEMALE	1994-09-08 01:00:00-04	21	Mother	f	Single	10	\N	f	t	t	60	f	f		\N	f	Labour	Local	f		0
150	1	1	7	ER / 0001 / 18 / 4	M.Luthfiya Jumana	FEMALE	1996-09-08 01:00:00-04	19	Daughter	f	Single	12	\N	f	t	t	44	f	f		\N	f	Student	Local	f		0
151	1	1	7	ER / 0001 / 18 / 5	Mohamed Aashiq	MALE	1999-08-09 01:00:00-04	16	Son	f	Aged Unmarried Woman	10	\N	f	t	f	44	f	f		\N	f	Student	Local	f		0
215	1	1	7	ER / 0001 / 45 / 		MALE	2014-09-08 01:00:00-04	1		f	Single		\N	f	t	f	66	f	f		\N	f		Local	f		0
199	1	1	7	ER / 0001 / 40 / 2	E.Alavudeen	MALE	1971-09-08 01:00:00-04	44	Son	f	Aged Unmarried Woman	5	\N	f	t	t	61	f	f		\N	f	Labour	Local	f		0
200	1	1	7	ER / 0001 / 40 / 3	A.Naseema Begam	FEMALE	1982-09-08 01:00:00-04	33	Son In Law	f	Aged Unmarried Woman	8	\N	f	t	t	61	f	f		\N	f	House Wife	Local	f		0
201	1	1	7	ER / 0001 / 40 / 4	A.Rahmathullah	MALE	1997-09-08 01:00:00-04	18	Grand Son	f	Single	12	\N	f	t	f	61	f	f		\N	f	Student	Local	f		0
202	1	1	7	ER / 0001 / 40 / 5	A.Mohamed Azarudeen	MALE	2001-09-08 01:00:00-04	14	Grand Son	f	Single	8	\N	f	t	f	61	f	f		\N	f	Student	Local	f		0
203	1	1	7	ER / 0001 / 40 / 6	A.Mohamed Nasrudeen	MALE	2003-09-08 01:00:00-04	12	Grand Son	f	Single	6	\N	f	t	f	61	f	f		\N	f	Student	Local	f		0
205	1	1	7	ER / 0001 / 41 / 2	Niyas Fathima	FEMALE	1967-09-08 01:00:00-04	48	Mother	f	Aged Unmarried Woman	12	\N	f	t	t	62	f	f		\N	f	Driver	Local	f		0
206	1	1	7	ER / 0001 / 41 / 3	Riswana	FEMALE	1997-09-08 01:00:00-04	18	Daughter	f	Single	12	\N	f	t	f	62	f	f		\N	f	Student	Local	f		0
207	1	1	7	ER / 0001 / 42 / 1	A.Kaleel 	MALE	1955-09-08 01:00:00-04	60	Husband	t	Aged Unmarried Woman	M.A	\N	f	t	t	63	f	f		\N	f		Local	f		0
208	1	1	7	ER / 0001 / 42 / 2	Rawoofun Nisha	FEMALE	1966-09-08 01:00:00-04	49	Wife	f	Aged Unmarried Woman		\N	f	t	t	63	f	f		\N	f	House Wife	Local	f		0
209	1	1	7	ER / 0001 / 43 / 1	a.Anees Babu	MALE	1981-09-08 01:00:00-04	34	Father 	t	Aged Unmarried Woman		\N	f	t	t	64	f	f		\N	f	Fruits Shop	Local	f		0
210	1	1	7	ER / 0001 / 43 / 2	Rahma Beevi	FEMALE	1989-09-08 01:00:00-04	26	Mother	f	Aged Unmarried Woman		\N	f	t	t	64	f	f		\N	f	House Wife	Local	f		0
211	1	1	7	ER / 0001 / 43 / 3	Mohamed Aslam	MALE	2010-09-08 01:00:00-04	5	Son	f	Single		\N	f	t	f	64	f	f		\N	f	Student	Local	f		0
212	1	1	7	ER / 0001 / 43 / 4	Mohamed Haneef	MALE	2013-09-08 01:00:00-04	2	Son	f	Single		\N	f	t	f	64	f	f		\N	f		Local	f		0
213	1	1	7	ER / 0001 / 44 / 1	Abdul Kareem	MALE	1950-09-08 01:00:00-04	65	Husband	t	Aged Unmarried Woman	8	\N	f	t	t	65	f	f		\N	f	Fruits Shop	Local	f		0
214	1	1	7	ER / 0001 / 44 / 2	Thoulath Nisha	FEMALE	1955-09-08 01:00:00-04	60	Wife	f	Aged Unmarried Woman		\N	f	t	t	65	f	f		\N	f		Local	f		0
216	1	1	7	ER / 0001 / 46 / 1	B.Asraf Ali	MALE	1970-09-08 01:00:00-04	45	Father 	t	Aged Unmarried Woman	10	\N	f	t	t	67	f	f		\N	f	Steel Shop	Local	f		0
217	1	1	7	ER / 0001 / 46 / 2	A.Asraf Nisha	FEMALE	1976-09-08 01:00:00-04	39	Mother	f	Aged Unmarried Woman	5	\N	f	t	t	67	f	f		\N	f	House Wife	Local	f		0
218	1	1	7	ER / 0001 / 46 / 3	A.Arshadha Nirfana	FEMALE	1999-09-08 01:00:00-04	16	Daughter	f	Single	10	\N	f	t	f	67	f	f		\N	f	Student	Local	f		0
219	1	1	7	ER / 0001 / 46 / 4	A.Aadila Rizwana	FEMALE	2003-09-08 01:00:00-04	12	Daughter	f	Single	7	\N	f	t	f	67	f	f		\N	f	Student	Local	f		0
220	1	1	7	ER / 0001 / 47 / 1	Abdul Kareem	MALE	1975-09-08 01:00:00-04	40	Father 	t	Aged Unmarried Woman	6	\N	f	t	t	68	f	f		\N	f	Tailor	Local	f		0
221	1	1	7	ER / 0001 / 47 / 2	Aarif Nisha	FEMALE	1976-09-08 01:00:00-04	39	Mother	f	Aged Unmarried Woman	6	\N	f	t	t	68	f	f		\N	f	House Wife	Local	f		0
222	1	1	7	ER / 0001 / 47 / 3	Mohamed Siraj	MALE	1995-09-08 01:00:00-04	20	Son	f	Single	B.COM	\N	f	t	f	68	f	f		\N	f	Student	Local	f		0
223	1	1	7	ER / 0001 / 47 / 4	Abdur Raheem	MALE	1996-09-08 01:00:00-04	19	Son	f	Single	EEE	\N	f	t	f	68	f	f		\N	f	Student	Local	f		0
224	1	1	7	ER / 0001 / 47 / 5	Mohamed Haneeba	MALE	1997-09-08 01:00:00-04	18	Son	f	Single	ECE	\N	f	t	f	68	f	f		\N	f	Student	Local	f		0
225	1	1	7	ER / 0001 / 48 / 1	V.A.Abdur Rahman	MALE	1944-09-08 01:00:00-04	71	Father 	t	Aged Unmarried Woman	4	\N	f	t	t	69	f	f		\N	f	Modinar	Local	f		0
226	1	1	7	ER / 0001 / 48 / 2	Salma	FEMALE	1954-09-08 01:00:00-04	61	Mother	f	Aged Unmarried Woman	5	\N	f	t	t	69	f	f		\N	f	House Wife	Local	f		0
227	1	1	7	ER / 0001 / 48 / 3	Fariza	FEMALE	1984-09-08 01:00:00-04	31	Son	f	Single	4	\N	f	t	f	69	f	f		\N	f		Local	f		0
228	1	1	7	ER / 0001 / 49 / 1	M.Shajahan	MALE	1979-09-08 01:00:00-04	36	Father 	t	Aged Unmarried Woman	6	\N	f	t	t	70	f	f		\N	f	Tailor	Local	f		0
229	1	1	7	ER / 0001 / 49 / 2	S.Sabeena	FEMALE	1984-09-08 01:00:00-04	31	Mother	f	Aged Unmarried Woman	11	\N	f	t	t	70	f	f		\N	f	House Wife	Local	f		0
230	1	1	7	ER / 0001 / 49 / 3	S.Shihabudeen	MALE	2004-09-08 01:00:00-04	11	Son	f	Single	6	\N	f	t	f	70	f	f		\N	f	Student	Local	f		0
231	1	1	7	ER / 0001 / 49 / 4	S.Suhaibudeen	MALE	2005-09-08 01:00:00-04	10	Son	f	Single	4	\N	f	t	f	70	f	f		\N	f	Student	Local	f		0
232	1	1	7	ER / 0001 / 49 / 5	S.Saliha Fathima	FEMALE	2006-09-08 01:00:00-04	9	Daughter	f	Single	4	\N	f	t	f	70	f	f		\N	f	Student	Local	f		0
233	1	1	7	ER / 0001 / 49 / 6	M.Katheeja Beevi	FEMALE	1951-09-08 01:00:00-04	64	Mother	f	Aged Unmarried Woman	3	\N	f	t	t	70	f	f		\N	f		Local	f		0
234	1	1	7	ER / 0001 / 50 / 1	M.Mohamed Shareef	MALE	1969-09-08 01:00:00-04	46	Father 	t	Aged Unmarried Woman	8	\N	f	t	t	71	f	f		\N	f	R.O.Plant Operater	Local	f		0
235	1	1	7	ER / 0001 / 50 / 2	A.Jareena Begam	FEMALE	1980-09-08 01:00:00-04	35	Mother	f	Aged Unmarried Woman	10	\N	f	t	t	71	f	f		\N	f		Local	f		0
236	1	1	7	ER / 0001 / 50 / 3	M.Sharukh Khan	MALE	2001-09-08 01:00:00-04	14	Son	f	Single	8	\N	f	t	f	71	f	f		\N	f	Student	Local	f		0
237	1	1	7	ER / 0001 / 1 / 1	M.Abdul Kadar	MALE	1980-09-08 01:00:00-04	35	Father	t	Aged Unmarried Woman	8	\N	f	t	t	28	f	f		\N	f	Puncher Shop	Local	f		0
238	1	1	7	ER / 0001 / 1 / 2	A.Rahmath Nisha	FEMALE	1985-09-08 01:00:00-04	30	Mother	f	Aged Unmarried Woman		\N	f	t	t	28	f	f		\N	f	House Wife	Local	f		0
239	1	1	7	ER / 0001 / 1 / 3	A.Mohamed Ilyas	MALE	2005-09-08 01:00:00-04	10	Son	f	Single	5	\N	f	t	f	28	f	f		\N	f	Student	Local	f		0
240	1	1	7	ER / 0001 / 1 / 4	A.Mohamed Irfan	MALE	2007-09-08 01:00:00-04	8	Son	f	Single	3	\N	f	t	f	28	f	f		\N	f	Student	Local	f		0
241	1	1	7	ER / 0001 / 1 / 5	A.Mohamed Thoufeeq	MALE	2008-09-08 01:00:00-04	7	Son	f	Single	2	\N	f	t	f	28	f	f		\N	f	Student	Local	f		0
242	1	1	7	ER / 0001 / 2 / 5	Mohamed Fahim	MALE	2013-09-08 01:00:00-04	2	Son	f	Single		\N	f	t	f	29	f	f		\N	f		Local	f		0
243	1	1	7	ER / 0001 / 3 / 1	S.Basheer	MALE	1967-09-08 01:00:00-04	48	Father	t	Aged Unmarried Woman		\N	f	t	t	30	f	f		\N	f	Chair Shop	Local	f		0
244	1	1	7	ER / 0001 / 3 / 2	Jeenath	FEMALE	1969-09-08 01:00:00-04	46	Mother	f	Aged Unmarried Woman		\N	f	t	t	30	f	f		\N	f	House Wife	Local	f		0
245	1	1	7	ER / 0001 / 6 / 1	M.Rahmanullah	MALE	1981-09-08 01:00:00-04	34	Father	t	Aged Unmarried Woman	7	\N	f	t	t	72	f	f		\N	f	T.V.Mechanical	Local	f		0
246	1	1	7	ER / 0001 / 6 / 2	Sumaya Banu	FEMALE	1989-09-08 01:00:00-04	26	Mother	f	Aged Unmarried Woman	10	\N	f	t	t	72	f	f		\N	f	House Wife	Local	f		0
254	1	1	7	ER / 0001 / 12 / 		MALE	2014-09-08 01:00:00-04	1		f	Single		\N	f	t	f	38	f	f		\N	f		Local	f		0
259	1	1	7	ER / 0001 / 17 / 4	H.Shibana Thasleem	FEMALE	2001-09-08 01:00:00-04	14	Daughter	f	Single	8	\N	f	t	f	43	f	f		\N	f	Student	Local	f		0
264	1	1	7	ER / 0001 / 23 / 2	Aaseena	FEMALE	1989-09-08 01:00:00-04	26	Mother	f	Aged Unmarried Woman	8	\N	f	t	t	76	f	f		\N	f	House Wife	Local	f		0
261	1	1	7	ER / 0001 / 21 / 		MALE	2014-09-08 01:00:00-04	1		f	Single		\N	f	t	f	74	f	f		\N	f		Local	f		0
262	1	1	7	ER / 0001 / 22 / 		MALE	2014-09-08 01:00:00-04	1		f	Single		\N	f	t	f	75	f	f		\N	f		Local	f		0
263	1	1	7	ER / 0001 / 23 / 1	T.S.Mohamed Ishaq	MALE	1975-09-08 01:00:00-04	40	Father	t	Aged Unmarried Woman	8	\N	f	t	t	76	f	f		\N	f	Lorry Mechanic	Local	f		0
248	1	1	7	ER / 0001 / 6 / 4	Shabik	MALE	2010-09-08 01:00:00-04	5	Son	f	Single		\N	f	t	f	72	f	f		\N	f		Local	f		0
249	1	1	7	ER / 0001 / 7 / 5	Abdul Rasheed	MALE	2003-09-08 01:00:00-04	12	Son	f	Single	6	\N	f	t	f	33	f	f		\N	f	Student	Local	f		0
250	1	1	7	ER / 0001 / 9 / 3	Thoufeeq	MALE	1990-09-08 01:00:00-04	25	Son	f	Single	9	\N	f	t	t	35	f	f		\N	f	Radio Repair	Local	f		0
251	1	1	7	ER / 0001 / 9 / 4	Dheen	MALE	1992-09-08 01:00:00-04	23	Son	f	Single	Diplomo	\N	f	t	t	35	f	f		\N	f	Labour	Local	f		0
252	1	1	7	ER / 0001 / 11 / 6	Juvairiyya	FEMALE	1989-09-08 01:00:00-04	26	Daughter In Law	f	Aged Unmarried Woman	MSC	\N	f	t	t	37	f	f		\N	f	House Wife	Local	f		0
253	1	1	7	ER / 0001 / 11 / 7	Faheem	MALE	2012-09-08 01:00:00-04	3	Grand Son	f	Single		\N	f	t	f	37	f	f		\N	f		Local	f		0
255	1	1	7	ER / 0001 / 15 / 3	Thahira Banu	FEMALE	1997-09-08 01:00:00-04	18	Daughter	f	Single	12	\N	f	t	f	41	f	f		\N	f	Student	Local	f		0
256	1	1	7	ER / 0001 / 15 / 4	Mohamed Raeshma	FEMALE	1999-09-08 01:00:00-04	16	Daughter	f	Single	10	\N	f	t	f	41	f	f		\N	f	Student	Local	f		0
257	1	1	7	ER / 0001 / 16 / 		MALE	2014-09-08 01:00:00-04	1		f	Single		\N	f	t	f	42	f	f		\N	f		Local	f		0
258	1	1	7	ER / 0001 / 17 / 3	H.Sumaiya Fathima	FEMALE	1990-09-08 01:00:00-04	25	Daughter	f	Single	B.SC	\N	f	t	f	43	f	f		\N	f	Rest	Local	f		0
149	1	1	7	ER / 0001 / 18 / 3	M.Noordeen Saet	MALE	1987-09-08 01:00:00-04	28	Son	f	Single	DEEF	\N	f	t	t	44	f	f		\N	f	Sales Man	Local	f		0
247	1	1	7	ER / 0001 / 6 / 3	Shabika	FEMALE	2010-09-08 01:00:00-04	5	Daughter	f	Single	L.K.G	\N	f	t	f	72	f	f		\N	f	Student	Local	f		0
265	1	1	7	ER / 0001 / 23 / 3	Mohamed Julbihar	MALE	2003-09-08 01:00:00-04	12	Son	f	Single	6	\N	f	t	f	76	f	f		\N	f	Student	Local	f		0
266	1	1	7	ER / 0001 / 23 / 4	Suhaina	FEMALE	2006-09-08 01:00:00-04	9	Daughter	f	Single	3	\N	f	t	f	76	f	f		\N	f	Student	Local	f		0
267	1	1	7	ER / 0001 / 24 / 1	Shajahan	MALE	1976-09-08 01:00:00-04	39	Father	t	Aged Unmarried Woman	5	\N	f	t	t	77	f	f		\N	f	Lock Repair	Local	f		0
268	1	1	7	ER / 0001 / 24 / 2	Parveen	FEMALE	1984-09-08 01:00:00-04	31	Mother	f	Aged Unmarried Woman	5	\N	f	t	t	77	f	f		\N	f	House Wife	Local	f		0
269	1	1	7	ER / 0001 / 24 / 3	Badhusha	MALE	1997-09-08 01:00:00-04	18	Son	f	Single	8	\N	f	t	f	77	f	f		\N	f	Work Shop	Local	f		0
270	1	1	7	ER / 0001 / 24 / 4	Hakeem	MALE	1998-09-08 01:00:00-04	17	Son	f	Single	6	\N	f	t	f	77	f	f		\N	f	Student	Local	f		0
271	1	1	7	ER / 0001 / 24 / 5	Alaudeen	MALE	2004-09-08 01:00:00-04	11	Son	f	Single	4	\N	f	t	f	77	f	f		\N	f	Student	Local	f		0
272	1	1	7	ER / 0001 / 401 / 1	Shadudeen M	MALE	1974-10-08 01:00:00-04	41	Family Head	t	Married	Nill	\N	f	t	t	78	f	f		\N	f	Tinker	Local	f		0
273	1	1	7	ER / 0001 / 401 / 2	Fathima	FEMALE	1979-10-08 01:00:00-04	36	Wife	f	Married	8	\N	f	t	t	78	f	f		\N	f	H.W	Local	f		0
274	1	1	7	ER / 0001 / 401 / 3	Aakik S	MALE	2001-10-08 01:00:00-04	14	Son	f	Single	8	\N	f	t	f	78	f	f		\N	f	Student	Local	f		0
275	1	1	7	ER / 0001 / 401 / 4	Azarudeen S	MALE	2006-10-08 01:00:00-04	9	Son	f	Single	4	\N	f	t	f	78	f	f		\N	f	Student	Local	f		0
276	1	1	7	ER / 0001 / 402 / 1	Babu A	MALE	1980-10-08 01:00:00-04	35	Family Head	t	Married	4	\N	f	t	t	79	f	f		\N	f	Tailor	Local	f		0
277	1	1	7	ER / 0001 / 402 / 2	Nargeesh Banu B	FEMALE	1984-10-08 01:00:00-04	31	Wife	f	Married	"""+2"	\N	f	t	t	79	f	f		\N	f	H.W	Local	f		0
278	1	1	7	ER / 0001 / 402 / 3	Moullana Rahim B	MALE	2005-10-08 01:00:00-04	10	Son	f	Single	4	\N	f	t	f	79	f	f		\N	f	Student	Local	f		0
279	1	1	7	ER / 0001 / 403 / 1	Sowkath Ali	MALE	1959-10-08 01:00:00-04	56	Family Head	t	Married	Nill	\N	f	t	f	80	f	f		\N	f	Old Scarp Merchant	Local	f		0
280	1	1	7	ER / 0001 / 403 / 2	Fathima	FEMALE	1981-10-08 01:00:00-04	34	Wife	f	Married	Nill	\N	f	t	f	80	f	f		\N	f	H.W	Local	f		0
281	1	1	7	ER / 0001 / 403 / 3	Sabith	MALE	1999-10-08 01:00:00-04	16	Son	f	Single	10	\N	f	t	f	80	f	f		\N	f	Student	Local	t	Interest in Aalim/Hifz	0
282	1	1	7	ER / 0001 / 403 / 4	Sadique	MALE	2004-10-08 01:00:00-04	11	Son	f	Single	6	\N	f	t	f	80	f	f		\N	f	Student	Local	f		0
283	1	1	7	ER / 0001 / 403 / 5	Sharmila	FEMALE	2001-10-08 01:00:00-04	14	Daughter	f	Single	8	\N	f	t	f	80	f	f		\N	f	Student	Local	f		0
284	1	1	7	ER / 0001 / 403 / 6	Samsath	FEMALE	2002-10-08 01:00:00-04	13	Daughter	f	Single	7	\N	f	t	f	80	f	f		\N	f	Student	Local	f		0
285	1	1	7	ER / 0001 / 403 / 7	Sabir	FEMALE	2006-10-08 01:00:00-04	9	Daughter	f	Single	3	\N	f	t	f	80	f	f		\N	f	Student	Local	f		0
286	1	1	7	ER / 0001 / 404 / 1	Musthafa A	MALE	1949-10-08 01:00:00-05	66	Family Head	t	Married	3	\N	f	t	t	81	f	f		\N	f	Bakery	Local	f		0
287	1	1	7	ER / 0001 / 404 / 2	Rahamath Nisha	FEMALE	1959-10-08 01:00:00-04	56	Wife	f	Married	Nill	\N	f	t	t	81	f	f		\N	f	H.W	Local	f		0
289	1	1	7	ER / 0001 / 405 / 1	Kulfeer T M	MALE	1962-10-08 01:00:00-04	53	Family Head	t	Married	5	\N	f	t	t	82	f	f		\N	f	Chair repair works	Local	f		0
290	1	1	7	ER / 0001 / 405 / 2	Kursath	FEMALE	1969-10-08 01:00:00-04	46	Wife	f	Married	3	\N	f	t	t	82	f	f		\N	f	H.W	Local	f		0
291	1	1	7	ER / 0001 / 405 / 3	Jaffer	MALE	1993-10-08 01:00:00-04	22	Son	f	Single	Diplomo	\N	f	t	t	82	f	f		\N	f	T.V.S.COMPANY	Outstation	f		0
292	1	1	7	ER / 0001 / 406 / 1	Musthafa	MALE	1986-10-08 01:00:00-04	29	Family Head	t	Married	7	\N	f	t	t	83	f	f		\N	f	Labour / welder	Local	f		0
293	1	1	7	ER / 0001 / 406 / 2	Subaidha Begam	FEMALE	1990-10-08 01:00:00-04	25	Wife	f	Married	"""+2"	\N	f	t	t	83	f	f		\N	f	H.W	Local	f		0
294	1	1	7	ER / 0001 / 406 / 3	Ibrahim	MALE	2011-10-08 01:00:00-04	4	Son	f	Single		\N	f	t	f	83	f	f		\N	f	Baby	Local	f		0
295	1	1	7	ER / 0001 / 407 / 1	Azath ali F	MALE	1982-10-08 01:00:00-04	33	Family Head	t	Married	Nill	\N	f	t	t	84	f	f		\N	f	Labour	Local	f		0
296	1	1	7	ER / 0001 / 407 / 2	Sharmila S	FEMALE	1992-10-08 01:00:00-04	23	Wife	f	Married	2	\N	f	t	t	84	f	f		\N	f	Thread	Local	f		0
260	1	1	7	ER / 0001 / 20 / 		MALE	2014-09-08 01:00:00-04	1		f	Single		\N	f	t	f	73	f	f		\N	f		Local	f		0
2943	1	1	7	ER / 0001 / 712 / 		MALE	2014-11-08 01:00:00-05	1		f	Single		\N	f	t	f	862	f	f		\N	f		Local	f		0
2944	1	1	7	ER / 0001 / 713 / 		MALE	2014-11-08 01:00:00-05	1		f	Single		\N	f	t	f	863	f	f		\N	f		Local	f		0
299	1	1	7	ER / 0001 / 408 / 3	Biyarijan	FEMALE	1942-10-08 01:00:00-04	73	Mother	f	Married	Nill	\N	f	t	t	85	f	f		\N	f	H.W	Local	f		0
300	1	1	7	ER / 0001 / 408 / 4	Anarkali	FEMALE	2002-10-08 01:00:00-04	13	Daughter	f	Single	7	\N	f	t	f	85	f	f		\N	f	Student	Local	f		0
301	1	1	7	ER / 0001 / 408 / 5	Nadhiya Banu	FEMALE	2004-10-08 01:00:00-04	11	Daughter	f	Single	6	\N	f	t	f	85	f	f		\N	f	Student	Local	f		0
303	1	1	7	ER / 0001 / 409 / 1	A Ajiz 	MALE	1943-10-08 01:00:00-04	72	Family Head	t	Married	S.S.LC	\N	f	t	t	86	f	f		\N	f	Govt. retaid	Local	f		0
304	1	1	7	ER / 0001 / 409 / 2	A Syed Rabiyammal	FEMALE	1957-10-08 01:00:00-04	58	Wife	f	Married	5	\N	f	t	t	86	f	f		\N	f	H.W	Local	f		0
305	1	1	7	ER / 0001 / 409 / 3	Nazmudeen	MALE	1974-10-08 01:00:00-04	41	Son	f	Devorced	12	\N	f	t	t	86	f	f		\N	f	T.V Mechanic	Local	f		0
306	1	1	7	ER / 0001 / 409 / 4	Aasha Banu	FEMALE	1997-10-08 01:00:00-04	18	Daughter	f	Single	12	\N	f	t	f	86	f	f		\N	f	Student	Local	f		0
307	1	1	7	ER / 0001 / 409 / 5	Tanisha	FEMALE	2011-10-08 01:00:00-04	4	Grand Daughter	f	Single	n	\N	f	t	f	86	f	f		\N	f		Local	f		0
308	1	1	7	ER / 0001 / 410 / 1	S.J Syed Mohaideen	MALE	1969-10-08 01:00:00-04	46	Family Head	t	Married	B.A	\N	f	t	t	87	f	f		\N	f	Auto Mobiles Sales Man	Local	f		0
309	1	1	7	ER / 0001 / 410 / 2	S.M.Anisha	FEMALE	1976-10-08 01:00:00-04	39	Wife	f	Married	8	\N	f	t	t	87	f	f		\N	f	H.W	Local	f		0
310	1	1	7	ER / 0001 / 410 / 3	S.m.Syed Irfaan	MALE	2003-10-08 01:00:00-04	12	Son	f	Single	11	\N	f	t	f	87	f	f		\N	f	Student	Local	f		0
311	1	1	7	ER / 0001 / 410 / 4	S.M.Heena Afrin	FEMALE	2007-10-08 01:00:00-04	8	Daughter	f	Single	7	\N	f	t	f	87	f	f		\N	f	Student	Local	f		0
312	1	1	7	ER / 0001 / 411 / 1	Mahamudha beeve	FEMALE	1964-10-08 01:00:00-04	51	Family Head	t	Widow	5	\N	f	t	t	88	f	f		\N	f	H.W	Local	f		0
313	1	1	7	ER / 0001 / 411 / 2	Syed Abuthaheer	MALE	1986-10-08 01:00:00-04	29	Son	f	Single	DME	\N	f	t	t	88	f	f		\N	f	Mecanical Engneering	Local	f		0
314	1	1	7	ER / 0001 / 412 / 1	Immam Ali	MALE	1969-10-08 01:00:00-04	46	Family Head	t	Married	5	\N	f	t	t	89	f	f		\N	f	Labour	Local	f		0
315	1	1	7	ER / 0001 / 412 / 2	Zeenathu nisha	FEMALE	1974-10-08 01:00:00-04	41	Wife	f	Married	7	\N	f	t	t	89	f	f		\N	f	Tailor	Local	f		0
316	1	1	7	ER / 0001 / 413 / 1	SIdique Muhammed.M	MALE	1981-10-08 01:00:00-04	34	Family Head	t	Married	ITI	\N	f	t	t	90	f	f		\N	f	Windmill job	Local	f		0
317	1	1	7	ER / 0001 / 413 / 2	Parveen Banu	FEMALE	1989-10-08 01:00:00-04	26	Wife	f	Married	12	\N	f	t	t	90	f	f		\N	f	Call Center	Local	f		0
318	1	1	7	ER / 0001 / 413 / 3	Anshil Samar.S	MALE	2008-10-08 01:00:00-04	7	Son	f	Single	1	\N	f	t	f	90	f	f		\N	f	Student	Local	f		0
319	1	1	7	ER / 0001 / 413 / 4	Ashmitha.S	FEMALE	2011-10-08 01:00:00-04	4	Daughter	f	Single		\N	f	t	f	90	f	f		\N	f		Local	f		0
320	1	1	7	ER / 0001 / 414 / 1	Muhammed Raja	MALE	1977-10-08 01:00:00-04	38	Family Head	t	Married	B.E.M.ed	\N	f	t	t	91	f	f		\N	f	Baniyan company work	Outstation	f		0
321	1	1	7	ER / 0001 / 414 / 2	Shakeela Banu	FEMALE	1984-10-08 01:00:00-04	31	Wife	f	Married	12	\N	f	t	t	91	f	f		\N	f	Tailor	Local	f		0
322	1	1	7	ER / 0001 / 414 / 3	Babu	MALE	2001-10-08 01:00:00-04	14	Son	f	Single	9	\N	f	t	f	91	f	f		\N	f	Student	Local	f		0
323	1	1	7	ER / 0001 / 414 / 4	Rashma	FEMALE	2004-10-08 01:00:00-04	11	Daughter	f	Single	6	\N	f	t	f	91	f	f		\N	f	Student	Local	f		0
324	1	1	7	ER / 0001 / 415 / 1	S.Muhammed Sehabudeen	MALE	1983-10-08 01:00:00-04	32	Family Head	t	Married	7	\N	f	t	f	92	f	f		\N	f	Labour	Local	f		0
325	1	1	7	ER / 0001 / 415 / 2	S.Meharaj	FEMALE	1988-10-08 01:00:00-04	27	Wife	f	Married	10	\N	f	t	f	92	f	f		\N	f	Tailor	Local	f		0
326	1	1	7	ER / 0001 / 415 / 3	S.Muhammed Sheik Alaudeen	MALE	2011-10-08 01:00:00-04	4	Son	f	Single		\N	f	t	f	92	f	f		\N	f		Local	f		0
327	1	1	7	ER / 0001 / 416 / 1	S.Usuf	MALE	1959-10-08 01:00:00-04	56	Family Head	t	Married	7	\N	f	t	t	93	f	f		\N	f	Tailor	Local	f		0
328	1	1	7	ER / 0001 / 416 / 2	U.Nasreen	FEMALE	1971-10-08 01:00:00-04	44	Wife	f	Married		\N	f	t	t	93	f	f		\N	f	H.W	Local	f		0
329	1	1	7	ER / 0001 / 416 / 3	U.Sabeer	MALE	1992-10-08 01:00:00-04	23	Son	f	Single	B.B.M	\N	f	t	t	93	f	f		\N	f	Searching for job	Local	f		0
330	1	1	7	ER / 0001 / 416 / 4	U.Benazeer	FEMALE	1994-10-08 01:00:00-04	21	Daughter	f	Single	12	\N	f	t	f	93	f	f		\N	f		Local	f		0
331	1	1	7	ER / 0001 / 416 / 5	S.Ajijabee	FEMALE	1934-10-08 01:00:00-05	81	Mother	f	Married	DCDT	\N	f	t	t	93	f	f		\N	f	H.W	Local	f		0
332	1	1	7	ER / 0001 / 417 / 1	J.Shajahan	MALE	1981-10-08 01:00:00-04	34	Family Head	t	Married	11	\N	f	t	t	94	f	f		\N	f	Labour	Local	f		0
333	1	1	7	ER / 0001 / 417 / 2	S.mehathaj Begam	FEMALE	1986-10-08 01:00:00-04	29	Wife	f	Married	1	\N	f	t	t	94	f	f		\N	f	H.W	Local	f		0
334	1	1	7	ER / 0001 / 417 / 3	S.Thahasen Taj	FEMALE	2008-10-08 01:00:00-04	7	Daughter	f	Single	L.KG	\N	f	t	f	94	f	f		\N	f	Student	Local	f		0
335	1	1	7	ER / 0001 / 417 / 4	S.Syed Imran	MALE	2010-10-08 01:00:00-04	5	Son	f	Single		\N	f	t	f	94	f	f		\N	f	Student	Local	f		0
336	1	1	7	ER / 0001 / 417 / 5	S.Thasleem Taj	FEMALE	2012-10-08 01:00:00-04	3	Daughter	f	Single		\N	f	t	t	94	f	f		\N	f		Local	f		0
337	1	1	7	ER / 0001 / 418 / 1	Azmath	FEMALE	1950-10-08 01:00:00-05	65	Family Head	t	Widow	5	\N	f	t	t	95	f	f		\N	f	H.W	Local	f		0
338	1	1	7	ER / 0001 / 418 / 2	A.Muhammed hussain	MALE	1972-10-08 01:00:00-04	43	Son	f	Devorced	8	\N	f	t	t	95	f	f		\N	f	Driver	Local	f		0
339	1	1	7	ER / 0001 / 419 / 1	M.Amanulla	MALE	1975-10-08 01:00:00-04	40	Family Head	t	Married	4	\N	f	t	t	96	f	f		\N	f	Labour	Local	f		0
340	1	1	7	ER / 0001 / 419 / 2	Noor Jahan	FEMALE	1982-10-08 01:00:00-04	33	Wife	f	Married	8	\N	f	t	t	96	f	f		\N	f	H.W	Local	f		0
341	1	1	7	ER / 0001 / 419 / 3	Jaffer Sadeek	MALE	2001-10-08 01:00:00-04	14	Son	f	Single	8	\N	f	t	f	96	f	f		\N	f	Student	Local	f		0
342	1	1	7	ER / 0001 / 419 / 4	Sabeena	FEMALE	2003-10-08 01:00:00-04	12	Daughter	f	Single	7	\N	f	t	f	96	f	f		\N	f		Local	f		0
344	1	1	7	ER / 0001 / 420 / 2	J.Raheemunisha	FEMALE	1958-10-08 01:00:00-04	57	Wife	f	Married	5	\N	f	t	t	97	f	f		\N	f	H.W	Local	f		0
345	1	1	7	ER / 0001 / 421 / 1	Jawahera Bagum	FEMALE	1969-10-08 01:00:00-04	46	Family Head	t	Widow	7	\N	f	t	t	98	f	f		\N	f	Tailor	Local	f		0
346	1	1	7	ER / 0001 / 421 / 2	Amjath	MALE	1990-10-08 01:00:00-04	25	Son	f	Single	12	\N	f	t	t	98	f	f		\N	f	Courier company job	Local	f		0
347	1	1	7	ER / 0001 / 422 / 1	Abdul Razac.P	MALE	1966-10-08 01:00:00-04	49	Family Head	t	Married		\N	f	t	t	99	f	f		\N	f	Old Scarp Merchant	Local	f		0
348	1	1	7	ER / 0001 / 422 / 2	Badharunisha	FEMALE	1967-10-08 01:00:00-04	48	Wife	f	Married	10	\N	f	t	t	99	f	f		\N	f	Ration Shop Seller	Local	f		0
298	1	1	7	ER / 0001 / 408 / 2	Noor Jahan	FEMALE	1981-10-08 01:00:00-04	34	Wife	f	Married	Nill	\N	f	t	t	85	f	f		\N	f	Labour	Local	f		0
365	1	1	7	ER / 0001 / 428 / 		MALE	2014-10-08 01:00:00-04	1		f	Single		\N	f	t	f	105	f	f		\N	f		Local	f		0
351	1	1	7	ER / 0001 / 422 / 5	Muhammed Aalam Bhasa	MALE	2013-10-08 01:00:00-04	2	Grand son	f	Single		\N	f	t	f	99	f	f		\N	f		Local	f		0
352	1	1	7	ER / 0001 / 422 / 6	Katheeja Parveen	FEMALE	1999-10-08 01:00:00-04	16	Daughter	f	Single		\N	f	t	f	99	f	f		\N	f	Student	Local	f		0
353	1	1	7	ER / 0001 / 423 / 1	K.Ibraheem	MALE	1983-10-08 01:00:00-04	32	Family Head	t	Married	8	\N	f	t	t	100	f	f		\N	f	Labour	Local	f		0
354	1	1	7	ER / 0001 / 423 / 2	I.Dhavulath Begam	FEMALE	1990-10-08 01:00:00-04	25	Wife	f	Married	5	\N	f	t	t	100	f	f		\N	f	H.W	Local	f		0
355	1	1	7	ER / 0001 / 423 / 3	I.Sadhana	FEMALE	2012-10-08 01:00:00-04	3	Daughter	f	Single		\N	f	t	f	100	f	f		\N	f		Local	f		0
356	1	1	7	ER / 0001 / 424 / 1	B.Syed Basha	MALE	1952-10-08 01:00:00-05	63	Family Head	t	Married	12	\N	f	t	t	101	f	f		\N	f	Driver	Local	f		0
357	1	1	7	ER / 0001 / 424 / 2	S.Barkat	FEMALE	1962-10-08 01:00:00-04	53	Wife	f	Married		\N	f	t	t	101	f	f		\N	f	Home Made	Local	f		0
358	1	1	7	ER / 0001 / 424 / 3	T.Sabitha	FEMALE	1999-10-08 01:00:00-04	16	Grand Daughter	f	Single	10	\N	f	t	f	101	f	f		\N	f	Student	Local	f		0
359	1	1	7	ER / 0001 / 425 / 1	Amjath	MALE	1971-10-08 01:00:00-04	44	Family Head	t	Married		\N	f	t	t	102	f	f		\N	f	Labour	Local	f		0
360	1	1	7	ER / 0001 / 425 / 2	Gulzar	FEMALE	1976-10-08 01:00:00-04	39	Wife	f	Married		\N	f	t	t	102	f	f		\N	f	Labour	Local	f		0
361	1	1	7	ER / 0001 / 425 / 3	Asin Taj	FEMALE	1999-10-08 01:00:00-04	16	Daughter	f	Single	11	\N	f	t	f	102	f	f		\N	f	Student	Local	f		0
362	1	1	7	ER / 0001 / 426 / 1	Noor Jahan	FEMALE	1957-10-08 01:00:00-04	58	Family Head	t	Widow		\N	f	t	t	103	f	f		\N	f	H.W	Local	f		0
363	1	1	7	ER / 0001 / 427 / 1	Gulabe	FEMALE	1978-10-08 01:00:00-04	37	Family Head	t	Widow	5	\N	f	t	t	104	f	f		\N	f	Labour	Local	f		0
364	1	1	7	ER / 0001 / 427 / 2	Rashma	FEMALE	1997-10-08 01:00:00-04	18	Daughter	f	Single	7	\N	f	t	f	104	f	f		\N	f		Local	t	Interest in Aalim/Hifz	0
366	1	1	7	ER / 0001 / 429 / 1	J.Shagul Ameed	MALE	1979-10-08 01:00:00-04	36	Family Head	t	Married	5	\N	f	t	t	106	f	f		\N	f	Petty Business	Local	f		0
367	1	1	7	ER / 0001 / 429 / 2	S.Jaibuneesha	FEMALE	1984-10-08 01:00:00-04	31	Wife	f	Married	3	\N	f	t	t	106	f	f		\N	f	H.W	Local	f		0
368	1	1	7	ER / 0001 / 429 / 3	S.Nauzeeya	FEMALE	2001-10-08 01:00:00-04	14	Daughter	f	Single	8	\N	f	t	f	106	f	f		\N	f	Student	Local	f		0
369	1	1	7	ER / 0001 / 429 / 4	S.Anzeeya	FEMALE	2003-10-08 01:00:00-04	12	Daughter	f	Single	6	\N	f	t	f	106	f	f		\N	f	Student	Local	f		0
370	1	1	7	ER / 0001 / 429 / 5	S.Ramzeeya	FEMALE	2005-10-08 01:00:00-04	10	Daughter	f	Single	4	\N	f	t	f	106	f	f		\N	f	Student	Local	f		0
371	1	1	7	ER / 0001 / 524 / 1	Ubaithulla	MALE	1964-10-08 01:00:00-04	51	Family Head	t	Married	5	\N	f	t	f	107	f	f		\N	f	Labour	Local	f		0
372	1	1	7	ER / 0001 / 524 / 2	Noojahan	FEMALE	1970-10-08 01:00:00-04	45	Wife	f	Married		\N	f	t	t	107	f	f		\N	f	Labour	Local	f		0
374	1	1	7	ER / 0001 / 525 / 2	N.Sabeera	FEMALE	1988-10-08 01:00:00-04	27	Wife	f	Married	5	\N	f	t	f	108	f	f		\N	f	H.W	Local	f		0
375	1	1	7	ER / 0001 / 525 / 3	N.Aamina	FEMALE	2012-10-08 01:00:00-04	3	Daughter	f	Single		\N	f	t	f	108	f	f		\N	f		Local	f		0
376	1	1	7	ER / 0001 / 526 / 1	A.Shagulhameed	MALE	1964-10-08 01:00:00-04	51	Family Head	t	Married	8	\N	f	t	t	109	f	f		\N	f	Labour	Local	f		0
377	1	1	7	ER / 0001 / 526 / 2	S.Fathima Sha	FEMALE	1974-10-08 01:00:00-04	41	Wife	f	Married		\N	f	t	t	109	f	f		\N	f	H.W	Local	f		0
378	1	1	7	ER / 0001 / 526 / 3	A.Biyare	FEMALE	1939-10-08 01:00:00-05	76	Mother	f	Married		\N	f	t	t	109	f	f		\N	f	H.W	Local	f		0
379	1	1	7	ER / 0001 / 527 / 1	S.Sheik AlavedeenBasha	MALE	1982-10-08 01:00:00-04	33	Family Head	t	Married	7	\N	f	t	t	110	f	f		\N	f	Acting Driver	Local	f		0
380	1	1	7	ER / 0001 / 527 / 2	S.Fagarunisha	FEMALE	1985-10-08 01:00:00-04	30	Wife	f	Married	5	\N	f	t	t	110	f	f		\N	f	H.W	Local	f		0
381	1	1	7	ER / 0001 / 527 / 3	A.Aasarama Beeve	FEMALE	1944-10-08 01:00:00-04	71	.Mother in law	f	Married		\N	f	t	t	110	f	f		\N	f	H.W	Local	f		0
382	1	1	7	ER / 0001 / 528 / 1	Syed Musthafa.M	MALE	1974-10-08 01:00:00-04	41	Family Head	t	Married	8	\N	f	t	t	111	f	f		\N	f	Labour	Local	f		0
383	1	1	7	ER / 0001 / 528 / 2	S.Sajena	FEMALE	1976-10-08 01:00:00-04	39	Wife	f	Married	5	\N	f	t	t	111	f	f		\N	f	H.W	Local	f		0
384	1	1	7	ER / 0001 / 528 / 3	S.Sadham hussain	MALE	1998-10-08 01:00:00-04	17	Son	f	Single	11	\N	f	t	f	111	f	f		\N	f	Student	Local	f		0
385	1	1	7	ER / 0001 / 528 / 4	S.Muhammed Subeer	MALE	2003-10-08 01:00:00-04	12	Son	f	Single	6	\N	f	t	f	111	f	f		\N	f	Student	Local	f		0
386	1	1	7	ER / 0001 / 529 / 1	Noor Mohammed	MALE	1962-10-08 01:00:00-04	53	Family Head	t	Married	3	\N	f	t	t	112	f	f		\N	f	Labour	Local	f		0
387	1	1	7	ER / 0001 / 529 / 2	N.Balkees	FEMALE	1972-10-08 01:00:00-04	43	Wife	f	Married	5	\N	f	t	t	112	f	f		\N	f	H.W	Local	f		0
388	1	1	7	ER / 0001 / 529 / 3	N.Shajahan	MALE	1990-10-08 01:00:00-04	25	Son	f	Single	8	\N	f	t	t	112	f	f		\N	f	Labour	Local	f		0
389	1	1	7	ER / 0001 / 529 / 4	N.Sofia Banu	FEMALE	1986-10-08 01:00:00-04	29	Daughter	f	Married	10	\N	f	t	t	112	f	f		\N	f		Local	f		0
390	1	1	7	ER / 0001 / 529 / 5	S.Muhammed Refath	MALE	2006-10-08 01:00:00-04	9	Grand Son	f	Single	2	\N	f	t	f	112	f	f		\N	f	Student	Local	f		0
391	1	1	7	ER / 0001 / 529 / 6	S.Muhammed Abbas	MALE	2008-10-08 01:00:00-04	7	Grand Son	f	Single	1	\N	f	t	f	112	f	f		\N	f	Student	Local	f		0
392	1	1	7	ER / 0001 / 529 / 7	S.Tarwesh Mydeen	MALE	2013-10-08 01:00:00-04	2	Grand Son	f	Single		\N	f	t	f	112	f	f		\N	f		Local	f		0
393	1	1	7	ER / 0001 / 530 / 1	S.Bhasha	MALE	1958-10-08 01:00:00-04	57	Family Head	t	Married		\N	f	t	t	113	f	f		\N	f	Labour	Local	f		0
394	1	1	7	ER / 0001 / 530 / 2	B.Rajiya	FEMALE	1964-10-08 01:00:00-04	51	Wife	f	Married	5	\N	f	t	t	113	f	f		\N	f	H.W	Local	f		0
395	1	1	7	ER / 0001 / 530 / 3	B.Alavudeen	MALE	1999-10-08 01:00:00-04	16	Son	f	Single	9	\N	f	t	f	113	f	f		\N	f	Student	Local	f		0
396	1	1	7	ER / 0001 / 531 / 		MALE	2014-10-08 01:00:00-04	1		f	Single		\N	f	t	f	114	f	f		\N	f		Local	f		0
397	1	1	7	ER / 0001 / 532 / 1	Ajjeyamma.A	FEMALE	1949-10-08 01:00:00-05	66	Family Head	t	Widow		\N	f	t	t	115	f	f		\N	f	H.W	Local	f		0
398	1	1	7	ER / 0001 / 533 / 1	Mumeena	FEMALE	1961-10-08 01:00:00-04	54	Family Head	t	Married	5	\N	f	t	f	116	f	f		\N	f	Labour	Local	f		0
399	1	1	7	ER / 0001 / 533 / 2	Muhammed Rafek	MALE	1975-10-08 01:00:00-04	40	Son	f	Married	5	\N	f	t	f	116	f	f		\N	f	Machanic	Local	f		0
400	1	1	7	ER / 0001 / 533 / 3	Syera banu	FEMALE	1982-10-08 01:00:00-04	33	.Daughter in law	f	Married	12	\N	f	t	f	116	f	f		\N	f	Post women (temporary)	Local	f		0
350	1	1	7	ER / 0001 / 422 / 4	Syed Meera Sahana	FEMALE	1990-10-08 01:00:00-04	25	Daughter In Law	f	Married	B.Sc	\N	f	t	f	99	f	f		\N	f	H.W	Local	f		0
403	1	1	7	ER / 0001 / 533 / 6	Ajeba tashlem	FEMALE	2008-10-08 01:00:00-04	7	.Grand Daughter	f	Single	1	\N	f	t	f	116	f	f		\N	f	Student	Local	f		0
404	1	1	7	ER / 0001 / 534 / 1	Noorjahan	FEMALE	1962-10-08 01:00:00-04	53	Family Head	t	Widow	3	\N	f	t	t	117	f	f		\N	f	H.W	Local	f		0
405	1	1	7	ER / 0001 / 534 / 2	Saleema Beeve	MALE	1974-10-08 01:00:00-04	41	.Brother in law	f	Single	12	\N	f	t	t	117	f	f		\N	f	Labour	Local	f		0
406	1	1	7	ER / 0001 / 534 / 3	Seeraj	MALE	1982-10-08 01:00:00-04	33	Son	f	Married	6	\N	f	t	t	117	f	f		\N	f	Labour	Local	f		0
407	1	1	7	ER / 0001 / 534 / 4	Busara	FEMALE	1984-10-08 01:00:00-04	31	.Daughter in law	f	Married	6	\N	f	t	t	117	f	f		\N	f	H.W	Local	f		0
408	1	1	7	ER / 0001 / 534 / 5	Riyash Kan	MALE	1999-10-08 01:00:00-04	16	Grand Son	f	Single	10	\N	f	t	f	117	f	f		\N	f	Student	Local	f		0
409	1	1	7	ER / 0001 / 534 / 6	Safthiya Farsath	FEMALE	2009-10-08 01:00:00-04	6	.Grand Daughter	f	Single	U.KG	\N	f	t	f	117	f	f		\N	f	Student	Local	f		0
410	1	1	7	ER / 0001 / 534 / 7	Sarjath	MALE	2012-10-08 01:00:00-04	3	Grand Son	f	Single		\N	f	t	f	117	f	f		\N	f		Local	f		0
411	1	1	7	ER / 0001 / 535 / 1	Balkees	FEMALE	1944-10-08 01:00:00-04	71	Family Head	t	Married		\N	f	t	t	118	f	f		\N	f	H.W	Local	f		0
412	1	1	7	ER / 0001 / 536 / 1	Meharaj Begum	FEMALE	1966-10-08 01:00:00-04	49	Family Head	t	Widow		\N	f	t	t	119	f	f		\N	f	Labour	Local	f		0
413	1	1	7	ER / 0001 / 537 / 1	Nagoor Meeran	MALE	1977-10-08 01:00:00-04	38	Family Head	t	Married		\N	f	t	t	120	f	f		\N	f	Labour	Local	f		0
414	1	1	7	ER / 0001 / 537 / 2	N.Katheeja	FEMALE	1981-10-08 01:00:00-04	34	Wife	f	Married		\N	f	t	t	120	f	f		\N	f	Labour	Local	f		0
415	1	1	7	ER / 0001 / 537 / 3	N.Jereena	FEMALE	2005-10-08 01:00:00-04	10	Daughter	f	Single	4	\N	f	t	f	120	f	f		\N	f	Student	Local	f		0
416	1	1	7	ER / 0001 / 537 / 4	N.Muhammed Kaseem	MALE	2002-10-08 01:00:00-04	13	Son	f	Single	7	\N	f	t	f	120	f	f		\N	f	Student	Local	f		0
417	1	1	7	ER / 0001 / 538 / 		MALE	2014-10-08 01:00:00-04	1		f	Single		\N	f	t	f	121	f	f		\N	f		Local	f		0
418	1	1	7	ER / 0001 / 539 / 1	Gulzar Beeve.J	FEMALE	1959-10-08 01:00:00-04	56	Family Head	t	Widow		\N	f	t	t	122	f	f		\N	f	.H.R	Local	f		0
419	1	1	7	ER / 0001 / 539 / 2	Badhusha.J	MALE	1995-10-08 01:00:00-04	20	Grand Son	f	Single	8	\N	f	t	t	122	f	f		\N	f	Labour	Local	f		0
420	1	1	7	ER / 0001 / 539 / 3	Hakeem.J	MALE	1999-10-08 01:00:00-04	16	Grand Son	f	Single	8	\N	f	t	f	122	f	f		\N	f	Labour	Local	f		0
421	1	1	7	ER / 0001 / 540 / 1	Habeesa Beeve	FEMALE	1939-10-08 01:00:00-05	76	Family Head	t	Married		\N	f	t	t	123	f	f		\N	f	.H.R	Local	f		0
422	1	1	7	ER / 0001 / 540 / 2	S.Jamaruth Begum	FEMALE	1960-10-08 01:00:00-04	55	Daughter	f	Married	5	\N	f	t	t	123	f	f		\N	f	H.W	Local	f		0
423	1	1	7	ER / 0001 / 540 / 3	T.Sheik Dhavuth	MALE	1950-10-08 01:00:00-05	65	.Son in law	f	Married	7	\N	f	t	t	123	f	f		\N	f	Painter	Local	f		0
424	1	1	7	ER / 0001 / 541 / 1	K.Shajath	MALE	1958-10-08 01:00:00-04	57	Family Head	t	Married		\N	f	t	t	124	f	f		\N	f	Labour	Local	f		0
425	1	1	7	ER / 0001 / 541 / 2	K.Mohathambi	FEMALE	1988-10-08 01:00:00-04	27	Daughter	f	Married	3	\N	f	t	t	124	f	f		\N	f	H.W	Local	f		0
426	1	1	7	ER / 0001 / 541 / 3	Abdul Kadher	MALE	1954-10-08 01:00:00-05	61	.Son in law	f	Married		\N	f	t	t	124	f	f		\N	f		Local	f		0
427	1	1	7	ER / 0001 / 542 / 1	A.Murualeen	MALE	1977-10-08 01:00:00-04	38	Family Head	t	Married	5	\N	f	t	t	125	f	f		\N	f	Labour	Local	f		0
428	1	1	7	ER / 0001 / 542 / 2	M.Kamarunisha	FEMALE	1980-10-08 01:00:00-04	35	Wife	f	Married	5	\N	f	t	t	125	f	f		\N	f	Sales	Local	f		0
429	1	1	7	ER / 0001 / 542 / 3	M.Mehatab Begum	FEMALE	2002-10-08 01:00:00-04	13	Son	f	Married	7	\N	f	t	f	125	f	f		\N	f	Student	Local	f		0
430	1	1	7	ER / 0001 / 542 / 4	M.Benazeer Begum	FEMALE	2004-10-08 01:00:00-04	11	Daughter	f	Single	5	\N	f	t	f	125	f	f		\N	f	Student	Local	f		0
431	1	1	7	ER / 0001 / 543 / 		MALE	2014-10-08 01:00:00-04	1		f	Single		\N	f	t	f	126	f	f		\N	f		Local	f		0
432	1	1	7	ER / 0001 / 544 / 1	P.Salamath	MALE	1979-10-08 01:00:00-04	36	Family Head	t	Married	6	\N	f	t	f	127	f	f		\N	f	Labour	Local	f		0
433	1	1	7	ER / 0001 / 544 / 2	S.Sakeelabanu	FEMALE	1986-10-08 01:00:00-04	29	Wife	f	Married	8	\N	f	t	t	127	f	f		\N	f	H.W	Local	f		0
434	1	1	7	ER / 0001 / 544 / 3	S.Sajjeetha Banu	FEMALE	2006-10-08 01:00:00-04	9	Daughter	f	Single	9	\N	f	t	f	127	f	f		\N	f	Student	Local	f		0
435	1	1	7	ER / 0001 / 544 / 4	Fayash Basha.S	MALE	2009-10-08 01:00:00-04	6	Son	f	Single	1	\N	f	t	f	127	f	f		\N	f	Student	Local	f		0
437	1	1	7	ER / 0001 / 546 / 1	Ashraf ali.A	MALE	1974-10-08 01:00:00-04	41	Family Head	t	Married	5	\N	f	t	t	129	f	f		\N	f	Labour	Local	f		0
438	1	1	7	ER / 0001 / 546 / 2	A.Aabitha Begum	FEMALE	1977-10-08 01:00:00-04	38	Wife	f	Married	5	\N	f	t	t	129	f	f		\N	f	H.W	Local	f		0
439	1	1	7	ER / 0001 / 546 / 3	A.Mushretna Parveen	FEMALE	1996-10-08 01:00:00-04	19	Daughter	f	Single	12	\N	f	t	f	129	f	f		\N	f	Alim	Local	t	Interest in Aalim/Hifz	0
440	1	1	7	ER / 0001 / 546 / 4	A.Sumaiya Parveen	FEMALE	2000-10-08 01:00:00-04	15	Daughter	f	Single	9	\N	f	t	f	129	f	f		\N	f	Student	Local	t	Interest in Aalim/Hifz	0
441	1	1	7	ER / 0001 / 546 / 5	A.Inool arafath	FEMALE	2002-10-08 01:00:00-04	13	Daughter	f	Single	7	\N	f	t	f	129	f	f		\N	f	Student	Local	t	Interest in Aalim/Hifz	0
442	1	1	7	ER / 0001 / 547 / 1	Ayisha bee	FEMALE	1964-10-08 01:00:00-04	51	Family Head	t	Widow	3	\N	f	t	t	130	f	f		\N	f	H.W	Local	f		0
443	1	1	7	ER / 0001 / 548 / 1	Abitha.A	FEMALE	1956-10-08 01:00:00-04	59	Family Head	t	Married	2	\N	f	t	t	131	f	f		\N	f	H.W	Local	f		0
444	1	1	7	ER / 0001 / 548 / 2	Ayisha.A	FEMALE	1986-10-08 01:00:00-04	29	Daughter	f	Married	12	\N	f	t	t	131	f	f		\N	f	Sipcot(Salaryed)	Local	f		0
445	1	1	7	ER / 0001 / 548 / 3	Shebaara.A	FEMALE	2012-10-08 01:00:00-04	3	.Grand Daughter	f	Single		\N	f	t	f	131	f	f		\N	f	Student	Local	f		0
446	1	1	7	ER / 0001 / 549 / 1	Syed Baseer.S	MALE	1954-10-08 01:00:00-05	61	Family Head	t	Married	10	\N	f	t	t	132	f	f		\N	f		Local	f		0
447	1	1	7	ER / 0001 / 549 / 2	Tara Bagum.S	FEMALE	1963-10-08 01:00:00-04	52	Wife	f	Married	2	\N	f	t	t	132	f	f		\N	f	H.W	Local	f		0
448	1	1	7	ER / 0001 / 549 / 3	Sarbudeen.S	MALE	1984-10-08 01:00:00-04	31	Son	f	Married	BBM	\N	f	t	t	132	f	f		\N	f	Manager	Local	f		0
449	1	1	7	ER / 0001 / 549 / 4	Yasmeen.S	FEMALE	1989-10-08 01:00:00-04	26	.Daughter in law	f	Married	BA	\N	f	t	t	132	f	f		\N	f	H.W	Local	f		0
450	1	1	7	ER / 0001 / 549 / 5	Syed Ariya.S	MALE	2010-10-08 01:00:00-04	5	Grand Son	f	Single	LKG	\N	f	t	f	132	f	f		\N	f	Student	Local	f		0
451	1	1	7	ER / 0001 / 550 / 1	K.Sarbudeen	MALE	1984-10-08 01:00:00-04	31	Family Head	t	Married	10	\N	f	t	t	133	f	f		\N	f	Painter	Local	f		0
402	1	1	7	ER / 0001 / 533 / 5	Thaheera	FEMALE	2004-10-08 01:00:00-04	11	.Grand Daughter	f	Single	6	\N	f	t	f	116	f	f		\N	f	Student	Local	f		0
490	1	1	7	ER / 0001 / 125 / 		MALE	2014-09-08 01:00:00-04	1		f	Single		\N	f	t	f	145	f	f		\N	f		Local	f		0
467	1	1	7	ER / 0001 / 555 / 2	Mumtaaj.S	FEMALE	1957-10-08 01:00:00-04	58	Wife	f	Married		\N	f	t	f	138	f	f		\N	f	H.W	Local	f		0
477	1	1	7	ER / 0001 / 121 / 2	Shakkila Begam	FEMALE	1965-09-08 01:00:00-04	50	Wife	f	Aged Unmarried Woman	5	\N	f	t	t	141	f	f		\N	f	House Wife	Local	f		0
454	1	1	7	ER / 0001 / 550 / 4	S.Sanarfarharshin	FEMALE	2011-10-08 01:00:00-04	4	Daughter	f	Single		\N	f	t	f	133	f	f		\N	f		Local	f		0
455	1	1	7	ER / 0001 / 551 / 1	Mumtaj	FEMALE	1965-10-08 01:00:00-04	50	Family Head	t	Married	3	\N	f	t	t	134	f	f		\N	f	Labour	Local	f		0
457	1	1	7	ER / 0001 / 552 / 1	Muhammed Rafeek.J	MALE	1972-10-08 01:00:00-04	43	Family Head	t	Married	10	\N	f	t	t	135	f	f		\N	f	Own Mixer Company	Local	f		0
458	1	1	7	ER / 0001 / 552 / 2	Ajeemnisha.M	FEMALE	1975-10-08 01:00:00-04	40	Wife	f	Married	5	\N	f	t	t	135	f	f		\N	f	H.W	Local	f		0
459	1	1	7	ER / 0001 / 552 / 3	Jansugeel.M	MALE	1998-10-08 01:00:00-04	17	Son	f	Single	10	\N	f	t	f	135	f	f		\N	f	Student	Local	f		0
460	1	1	7	ER / 0001 / 552 / 4	Sujeeth.M	MALE	2000-10-08 01:00:00-04	15	Son	f	Single	9	\N	f	t	f	135	f	f		\N	f	Student	Local	f		0
461	1	1	7	ER / 0001 / 552 / 5	Shajeeth.M	MALE	2002-10-08 01:00:00-04	13	Son	f	Single	7	\N	f	t	f	135	f	f		\N	f	Student	Local	f		0
462	1	1	7	ER / 0001 / 553 / 1	Alavudeen Basha	MALE	1974-10-08 01:00:00-04	41	Family Head	t	Married	4	\N	f	t	t	136	f	f		\N	f	Driver	Local	f		0
463	1	1	7	ER / 0001 / 553 / 2	Nishana.A	FEMALE	1980-10-08 01:00:00-04	35	Wife	f	Married	8	\N	f	t	t	136	f	f		\N	f	H.W	Local	f		0
464	1	1	7	ER / 0001 / 553 / 3	Ganija Faathima.A	FEMALE	1999-10-08 01:00:00-04	16	Son	f	Single	10	\N	f	t	f	136	f	f		\N	f	Student	Local	f		0
465	1	1	7	ER / 0001 / 554 / 		MALE	2014-10-08 01:00:00-04	1		f	Single		\N	f	t	f	137	f	f		\N	f		Local	f		0
466	1	1	7	ER / 0001 / 555 / 1	B.M.Sheik Ameed	MALE	1947-10-08 01:00:00-05	68	Family Head	t	Married	8	\N	f	t	f	138	f	f		\N	f	Driver	Local	f		0
468	1	1	7	ER / 0001 / 555 / 3	Mujefar Nisha.S	FEMALE	1981-10-08 01:00:00-04	34	Daughter	f	Single	5	\N	f	t	f	138	f	f		\N	f	H.R	Local	f		0
469	1	1	7	ER / 0001 / 555 / 4	Hussain Beevee	FEMALE	1984-10-08 01:00:00-04	31	Daughter	f	Married	5	\N	f	t	f	138	f	f		\N	f	Labour	Local	f		0
470	1	1	7	ER / 0001 / 555 / 5	Sheik Musthan	MALE	1986-10-08 01:00:00-04	29	Son	f	Single	5	\N	f	t	f	138	f	f		\N	f	Labour	Local	f		0
471	1	1	7	ER / 0001 / 119 / 1	M.Abdul Rahman	MALE	1964-09-08 01:00:00-04	51	Husband	t	Aged Unmarried Woman	5	\N	f	t	t	139	f	f		\N	f		Local	f		0
472	1	1	7	ER / 0001 / 119 / 2	Dilshath Begam	FEMALE	1972-09-08 01:00:00-04	43	Wife	f	Aged Unmarried Woman	5	\N	f	t	t	139	f	f		\N	f	Kitchen Labour	Local	f		0
473	1	1	7	ER / 0001 / 119 / 3	Mohamed Basheer	MALE	1993-09-08 01:00:00-04	22	Son	f	Aged Unmarried Woman	12	\N	f	t	t	139	f	f		\N	f	Searching For Job	Local	f		0
474	1	1	7	ER / 0001 / 119 / 4	Nausath Ali	MALE	1995-09-08 01:00:00-04	20	Son	f	Aged Unmarried Woman	D.ECE	\N	f	t	t	139	f	f		\N	f	Student	Local	f		0
475	1	1	7	ER / 0001 / 120 / 		MALE	2014-09-08 01:00:00-04	1		f	Single		\N	f	t	f	140	f	f		\N	f		Local	f		0
476	1	1	7	ER / 0001 / 121 / 1	K.Kaja Mohideen	MALE	1957-09-08 01:00:00-04	58	Husband	t	Aged Unmarried Woman	7	\N	f	t	t	141	f	f		\N	f	Motor Shop	Local	f		0
478	1	1	7	ER / 0001 / 121 / 3	Mohamed Ismail	MALE	1989-09-08 01:00:00-04	26	Son	f	Aged Unmarried Woman	B.E	\N	f	t	t	141	f	f		\N	f	Searching For Job	Local	f		0
479	1	1	7	ER / 0001 / 122 / 1	Kalifullah Saet	MALE	1952-09-08 01:00:00-04	63	Husband	t	Aged Unmarried Woman	10	\N	f	t	t	142	f	f		\N	f	Arun Icecream Business	Local	f		0
480	1	1	7	ER / 0001 / 122 / 2	Afrose Begam	FEMALE	1962-09-08 01:00:00-04	53	Wife	f	Aged Unmarried Woman	10	\N	f	t	t	142	f	f		\N	f	House Wife	Local	f		0
481	1	1	7	ER / 0001 / 123 / 1	K.Syed Abuthahir	MALE	1981-09-08 01:00:00-04	34	Husband	t	Aged Unmarried Woman	12	\N	f	t	t	143	f	f		\N	f	Agency Business	Local	f		0
482	1	1	7	ER / 0001 / 123 / 2	Fairose Banu	FEMALE	1988-09-08 01:00:00-04	27	Wife	f	Aged Unmarried Woman	10	\N	f	t	t	143	f	f		\N	f	House Wife	Local	f		0
483	1	1	7	ER / 0001 / 123 / 3	Kathija Fathima	FEMALE	2009-09-08 01:00:00-04	6	Daughter	f	Aged Unmarried Woman	LKG	\N	f	t	f	143	f	f		\N	f	Student	Local	f		0
484	1	1	7	ER / 0001 / 123 / 4	Althaf Ahmed	MALE	2010-09-08 01:00:00-04	5	Son	f	Aged Unmarried Woman	UKG	\N	f	t	f	143	f	f		\N	f	Student	Local	f		0
485	1	1	7	ER / 0001 / 124 / 1	S.Mahboob Nisha	MALE	1974-09-08 01:00:00-04	41	Husband	t	Aged Unmarried Woman	10	\N	f	t	t	144	f	f		\N	f	Mirror Shop	Local	f		0
486	1	1	7	ER / 0001 / 124 / 2	Rabiya	FEMALE	1977-09-08 01:00:00-04	38	Wife	f	Aged Unmarried Woman		\N	f	t	t	144	f	f		\N	f	House Wife	Local	f		0
487	1	1	7	ER / 0001 / 124 / 3	Rizwan	MALE	2005-09-08 01:00:00-04	10	Son	f	Aged Unmarried Woman	5	\N	f	t	f	144	f	f		\N	f	Student	Local	f		0
488	1	1	7	ER / 0001 / 124 / 4	Abdul Rahamn	MALE	2007-09-08 01:00:00-04	8	Son	f	Aged Unmarried Woman	1	\N	f	t	f	144	f	f		\N	f	Student	Local	f		0
489	1	1	7	ER / 0001 / 124 / 5	Shakkina Beevi	FEMALE	1934-09-08 01:00:00-04	81	Mother	f	Widow		\N	f	t	t	144	f	f		\N	f	House Wife	Local	f		0
491	1	1	7	ER / 0001 / 126 / 1	M.Sattar	MALE	1951-09-08 01:00:00-04	64	Husband	t	Aged Unmarried Woman		\N	f	t	t	146	f	f		\N	f	 Tailor	Local	f		0
492	1	1	7	ER / 0001 / 126 / 2	Salima Beevi	FEMALE	1961-09-08 01:00:00-04	54	Wife	f	Aged Unmarried Woman	4	\N	f	t	t	146	f	f		\N	f	House Wife	Local	f		0
493	1	1	7	ER / 0001 / 127 / 1	K.Soobi	MALE	1976-09-08 01:00:00-04	39	Husband	t	Aged Unmarried Woman	10	\N	f	t	t	147	f	f		\N	f	Bakery Business	Local	f		0
495	1	1	7	ER / 0001 / 127 / 3	Mohamed Shahil	MALE	2006-09-08 01:00:00-04	9	Son	f	Aged Unmarried Woman	3	\N	f	t	f	147	f	f		\N	f	Student	Local	f		0
496	1	1	7	ER / 0001 / 127 / 4	Mohamed Shamil	MALE	2011-09-08 01:00:00-04	4	Son	f	Aged Unmarried Woman		\N	f	t	f	147	f	f		\N	f	Student	Local	f		0
497	1	1	7	ER / 0001 / 128 / 1	A.Mohamed Shareff	MALE	1932-09-08 01:00:00-04	83	Husband	t	Aged Unmarried Woman	5	\N	f	t	t	148	f	f		\N	f	H.R	Local	f		0
498	1	1	7	ER / 0001 / 128 / 2	shaliha Beevi	FEMALE	1942-09-08 01:00:00-04	73	Wife	f	Aged Unmarried Woman	4	\N	f	t	t	148	f	f		\N	f	House Wife	Local	f		0
499	1	1	7	ER / 0001 / 128 / 3	Shakkila Banu	FEMALE	1970-09-08 01:00:00-04	45	Daughter	f	Widow	9	\N	f	t	t	148	f	f		\N	f		Local	f		0
500	1	1	7	ER / 0001 / 128 / 4	Syed Ibrahim	MALE	1990-09-08 01:00:00-04	25	Daughter	f	Aged Unmarried Woman	B.E	\N	f	t	t	148	f	f		\N	f	Searching For Job	Local	f		0
501	1	1	7	ER / 0001 / 129 / 1	Sheik Murshida	MALE	1959-09-08 01:00:00-04	56	Husband	t	Aged Unmarried Woman		\N	f	t	t	149	f	f		\N	f	H.R	Local	f		0
453	1	1	7	ER / 0001 / 550 / 3	S.Moubeka	FEMALE	2009-10-08 01:00:00-04	6	Daughter	f	Single	1	\N	f	t	f	133	f	f		\N	f	Student	Local	f		0
532	1	1	7	ER / 0001 / 135 / 		MALE	2014-09-08 01:00:00-04	1		f	Single		\N	f	t	f	155	f	f		\N	f		Local	f		0
535	1	1	7	ER / 0001 / 137 / 2	Ayeshamma	FEMALE	1962-09-08 01:00:00-04	53	Mother	f	Aged Unmarried Woman	6	\N	f	t	t	157	f	f		\N	f	House Wife	Local	f		0
504	1	1	7	ER / 0001 / 129 / 4	Hayath	FEMALE	1996-09-08 01:00:00-04	19	Daughter	f	Aged Unmarried Woman	5	\N	f	t	f	149	f	f		\N	f		Outstation	f		0
505	1	1	7	ER / 0001 / 130 / 1	R.Shakkil Ahmed	MALE	1960-09-08 01:00:00-04	55	Husband	t	Aged Unmarried Woman	5	\N	f	t	f	150	f	f		\N	f	Hotel Labour	Local	f		0
506	1	1	7	ER / 0001 / 130 / 2	S.Irfath Begam	FEMALE	1965-09-08 01:00:00-04	50	Wife	f	Aged Unmarried Woman	8	\N	f	t	f	150	f	f		\N	f	House Wife	Local	f		0
507	1	1	7	ER / 0001 / 130 / 3	S.Navith Ahmed	MALE	1995-09-08 01:00:00-04	20	Son	f	Aged Unmarried Woman	8	\N	f	t	f	150	f	f		\N	f	Baniyan Company Labour	Local	f		0
508	1	1	7	ER / 0001 / 130 / 4	S.Shahith Ahmed	MALE	1997-09-08 01:00:00-04	18	Son	f	Aged Unmarried Woman	5	\N	f	t	f	150	f	f		\N	f	Hifz course	Outstation	f		0
509	1	1	7	ER / 0001 / 130 / 5	S.Shahith Ahmed	MALE	1999-09-08 01:00:00-04	16	Son	f	Aged Unmarried Woman	3	\N	f	t	f	150	f	f		\N	f		Local	f		0
510	1	1	7	ER / 0001 / 130 / 6	B.S.Abdul Matthin	MALE	1940-09-08 01:00:00-04	75	Uncle	f	Widow		\N	f	t	f	150	f	f		\N	f	H.R	Local	f		0
511	1	1	7	ER / 0001 / 131 / 1	Abbas	MALE	1982-09-08 01:00:00-04	33	Father	t	Aged Unmarried Woman		\N	f	t	t	151	f	f		\N	f	Flower Shop	Local	f		0
512	1	1	7	ER / 0001 / 131 / 2	Kanija Begam	FEMALE	1985-09-08 01:00:00-04	30	Mother	f	Aged Unmarried Woman	5	\N	f	t	t	151	f	f		\N	f	House Wife	Local	f		0
513	1	1	7	ER / 0001 / 131 / 3	Anis fathima	FEMALE	2004-09-08 01:00:00-04	11	Daughter	f	Single	5	\N	f	t	f	151	f	f		\N	f		Local	f		0
514	1	1	7	ER / 0001 / 131 / 4	Abuthahir	MALE	2006-09-08 01:00:00-04	9	Daughter	f	Single	3	\N	f	t	f	151	f	f		\N	f		Local	f		0
515	1	1	7	ER / 0001 / 132 / 1	M.Mohamed Aniba	MALE	1943-09-08 01:00:00-04	72	Husband	t	Aged Unmarried Woman	8	\N	f	t	t	152	f	f		\N	f	Fruits Shop	Local	f		0
516	1	1	7	ER / 0001 / 132 / 2	Zaithoon	FEMALE	1954-09-08 01:00:00-04	61	Wife	f	Aged Unmarried Woman	10	\N	f	t	t	152	f	f		\N	f	House Wife	Local	f		0
517	1	1	7	ER / 0001 / 132 / 3	Fairose khan	MALE	1984-09-08 01:00:00-04	31	Son	f	Aged Unmarried Woman	B.COM	\N	f	t	t	152	f	f		\N	f	Fruits Shop	Local	f		0
518	1	1	7	ER / 0001 / 132 / 4	Parveen	FEMALE	1990-09-08 01:00:00-04	25	Daughter In Law	f	Aged Unmarried Woman	M.COM	\N	f	t	t	152	f	f		\N	f	House Wife	Local	f		0
519	1	1	7	ER / 0001 / 132 / 5	Irfan	FEMALE	2012-09-08 01:00:00-04	3	Grand Daughter	f	Single		\N	f	t	f	152	f	f		\N	f		Local	f		0
520	1	1	7	ER / 0001 / 132 / 6	Sameena	FEMALE	1986-09-08 01:00:00-04	29	Daughter In Law	f	Aged Unmarried Woman	B.ED	\N	f	t	t	152	f	f		\N	f	House Wife	Local	f		0
521	1	1	7	ER / 0001 / 132 / 7	Syed Abuthahir	MALE	1982-09-08 01:00:00-04	33	Son	f	Aged Unmarried Woman	B.E	\N	f	t	t	152	f	f		\N	f	Computer Engineer	Local	f		0
522	1	1	7	ER / 0001 / 133 / 1	H.Abdul Muthalib	MALE	1967-09-08 01:00:00-04	48	Father	t	Aged Unmarried Woman	8	\N	f	t	t	153	f	f		\N	f	Machine Mechanicer	Local	f		0
523	1	1	7	ER / 0001 / 133 / 2	A.Samshath Begam	FEMALE	1971-09-08 01:00:00-04	44	Mother	f	Aged Unmarried Woman	3	\N	f	t	t	153	f	f		\N	f	House Wife	Local	f		0
524	1	1	7	ER / 0001 / 133 / 3	A.Mohamed Yousuf	MALE	1989-09-08 01:00:00-04	26	Son	f	Aged Unmarried Woman	9	\N	f	t	t	153	f	f		\N	f	Machine Opearter	Local	f		0
525	1	1	7	ER / 0001 / 133 / 4	M.Jarina Begam	FEMALE	1989-09-08 01:00:00-04	26	Daughter In Law	f	Aged Unmarried Woman	B.COM	\N	f	t	t	153	f	f		\N	f	Casheir	Local	f		0
526	1	1	7	ER / 0001 / 133 / 5	M.Mohamed Diagh	MALE	2011-09-08 01:00:00-04	4	Grand Son	f	Single		\N	f	t	f	153	f	f		\N	f		Local	f		0
527	1	1	7	ER / 0001 / 134 / 1	S.Mohamed Akbar	MALE	1962-09-08 01:00:00-04	53	Father	t	Aged Unmarried Woman		\N	f	t	t	154	f	f		\N	f	Painter	Local	f		0
528	1	1	7	ER / 0001 / 134 / 2	Jamrooth	FEMALE	1967-09-08 01:00:00-04	48	Mother	f	Aged Unmarried Woman		\N	f	t	t	154	f	f		\N	f	House Wife	Local	f		0
529	1	1	7	ER / 0001 / 134 / 3	Abdur Rahman	MALE	1984-09-08 01:00:00-04	31	Brother	f	Single		\N	f	t	f	154	f	f		\N	f	Painter	Local	f		0
530	1	1	7	ER / 0001 / 134 / 4	Mohamed Ishaq	MALE	2001-09-08 01:00:00-04	14	Son	f	Single		\N	f	t	f	154	f	f		\N	f	Madrasa Student	Local	f		0
531	1	1	7	ER / 0001 / 134 / 5	mohamed Hakeem	MALE	2003-09-08 01:00:00-04	12	Son	f	Single		\N	f	t	f	154	f	f		\N	f	Madrasa Student	Local	f		0
533	1	1	7	ER / 0001 / 136 / 		MALE	2014-09-08 01:00:00-04	1		f	Single		\N	f	t	f	156	f	f		\N	f		Local	f		0
534	1	1	7	ER / 0001 / 137 / 1	E.Rahmathullah	MALE	1956-09-08 01:00:00-04	59	Father	t	Aged Unmarried Woman	SSLC	\N	f	t	t	157	f	f		\N	f	Market Shop	Local	f		0
536	1	1	7	ER / 0001 / 137 / 3	R.Mohamed Riyaz Ali	MALE	1992-09-08 01:00:00-04	23	Son	f	Single	DME	\N	f	t	t	157	f	f		\N	f	Auto Driver	Local	f		0
537	1	1	7	ER / 0001 / 137 / 4	R.Mubarak Ali	MALE	1994-09-08 01:00:00-04	21	Son	f	Single	MBA	\N	f	t	f	157	f	f		\N	f	Student	Local	f		0
538	1	1	7	ER / 0001 / 137 / 5	R.Marliyya banu	FEMALE	1995-09-08 01:00:00-04	20	Daughter	f	Single	B.A	\N	f	t	f	157	f	f		\N	f	Student	Local	f		0
539	1	1	7	ER / 0001 / 137 / 6	R.Jabarullah	MALE	1998-09-08 01:00:00-04	17	Son	f	Single	10	\N	f	t	f	157	f	f		\N	f	Baniyan Company Labour	Local	f		0
540	1	1	7	ER / 0001 / 137 / 7	Jainu Muthu	FEMALE	1934-09-08 01:00:00-04	81	Mother	f	Aged Unmarried Woman		\N	f	t	f	157	f	f		\N	f	House Wife	Local	f		0
541	1	1	7	ER / 0001 / 138 / 1	Syed Musthafa	MALE	1978-09-08 01:00:00-04	37	Father	t	Aged Unmarried Woman		\N	f	t	t	158	f	f		\N	f	Tailor	Local	f		0
542	1	1	7	ER / 0001 / 138 / 2	Aneesha	FEMALE	1983-09-08 01:00:00-04	32	Mother	f	Aged Unmarried Woman	6	\N	f	t	t	158	f	f		\N	f	House Wife	Local	f		0
543	1	1	7	ER / 0001 / 138 / 3	Sheik Dawood	MALE	1998-09-08 01:00:00-04	17	Daughter	f	Single	12	\N	f	t	f	158	f	f		\N	f	Student	Local	f		0
544	1	1	7	ER / 0001 / 138 / 4	Madina	FEMALE	2002-09-08 01:00:00-04	13	Daughter	f	Single	8	\N	f	t	f	158	f	f		\N	f	Student	Local	f		0
546	1	1	7	ER / 0001 / 139 / 2	Rabiya Begam	FEMALE	1977-09-08 01:00:00-04	38	Mother	f	Aged Unmarried Woman	7	\N	f	t	t	159	f	f		\N	f	Steel Shop	Local	f		0
547	1	1	7	ER / 0001 / 139 / 3	Sheik Mohamed	MALE	1995-09-08 01:00:00-04	20	Son	f	Single	B.COM	\N	f	t	f	159	f	f		\N	f	Student	Local	f		0
548	1	1	7	ER / 0001 / 140 / 1	Kaja Mohamed	MALE	1969-09-08 01:00:00-04	46	Father	t	Aged Unmarried Woman		\N	f	t	t	160	f	f		\N	f	Tea Shop	Local	f		0
549	1	1	7	ER / 0001 / 140 / 2	Aariba	FEMALE	1976-09-08 01:00:00-04	39	Mother	f	Aged Unmarried Woman		\N	f	t	t	160	f	f		\N	f	House Wife	Local	f		0
2945	1	1	7	ER / 0001 / 714 / 		MALE	2014-11-08 01:00:00-05	1		f	Single		\N	f	t	f	864	f	f		\N	f		Local	f		0
503	1	1	7	ER / 0001 / 129 / 3	Sheik Masthan	MALE	1994-09-08 01:00:00-04	21	Son	f	Aged Unmarried Woman	10	\N	f	t	t	149	f	f		\N	f	Medical Labour	Local	f		0
2946	1	1	7	ER / 0001 / 715 / 1	Rahema Beve	FEMALE	1949-11-08 01:00:00-05	66	Head	t	Widow		\N	f	t	t	865	f	f		\N	f	.Home	Local	f		0
561	1	1	7	ER / 0001 / 144 / 		MALE	2014-09-08 01:00:00-04	1		f	Single		\N	f	t	f	164	f	f		\N	f		Local	f		0
574	1	1	7	ER / 0001 / 149 / 2	Saveer	MALE	1979-09-08 01:00:00-04	36	Mother	f	Aged Unmarried Woman		\N	f	t	t	169	f	f		\N	f	Labour	Local	f		0
552	1	1	7	ER / 0001 / 141 / 3	Sheik Mohamed	MALE	2012-09-08 01:00:00-04	3	Son	f	Single		\N	f	t	f	161	f	f		\N	f		Local	f		0
553	1	1	7	ER / 0001 / 142 / 1	A.Abdul Majeed	MALE	1960-09-08 01:00:00-04	55	Father	t	Aged Unmarried Woman	6	\N	f	t	t	162	f	f		\N	f	Lorry Cleaner	Local	f		0
554	1	1	7	ER / 0001 / 142 / 2	A.Shehanas	FEMALE	1970-09-08 01:00:00-04	45	Mother	f	Aged Unmarried Woman	7	\N	f	t	t	162	f	f		\N	f	Tailor	Local	f		0
555	1	1	7	ER / 0001 / 142 / 3	A.Aarif Basha	MALE	1991-09-08 01:00:00-04	24	Daughter	f	Single	B.E	\N	f	t	t	162	f	f		\N	f	Temporary Job	Local	f		0
556	1	1	7	ER / 0001 / 142 / 4	A.Sayira Banu	FEMALE	1997-09-08 01:00:00-04	18	Daughter	f	Single	12	\N	f	t	f	162	f	f		\N	f	Student	Local	f		0
557	1	1	7	ER / 0001 / 143 / 1	Alaudeen	MALE	1969-09-08 01:00:00-04	46	Father	t	Aged Unmarried Woman	4	\N	f	t	t	163	f	f		\N	f	Tailor	Local	f		0
558	1	1	7	ER / 0001 / 143 / 2	Jasmeen	FEMALE	1978-09-08 01:00:00-04	37	Mother	f	Aged Unmarried Woman	10	\N	f	t	t	163	f	f		\N	f	House Wife	Local	f		0
559	1	1	7	ER / 0001 / 143 / 3	Mohamed Arsath	MALE	2001-09-08 01:00:00-04	14	Daughter	f	Single	8	\N	f	t	f	163	f	f		\N	f	Student	Local	f		0
560	1	1	7	ER / 0001 / 143 / 4	Fathima	FEMALE	2007-09-08 01:00:00-04	8	Daughter	f	Single	2	\N	f	t	f	163	f	f		\N	f	Student	Local	f		0
562	1	1	7	ER / 0001 / 145 / 1	Syed Musthafa	MALE	1974-09-08 01:00:00-04	41	Father	t	Aged Unmarried Woman	5	\N	f	t	t	165	f	f		\N	f	Baniyan Company Labour	Local	f		0
563	1	1	7	ER / 0001 / 145 / 2	Ramzan Begam	FEMALE	1979-09-08 01:00:00-04	36	Mother	f	Aged Unmarried Woman	5	\N	f	t	t	165	f	f		\N	f	House Wife	Local	f		0
564	1	1	7	ER / 0001 / 145 / 3	Safana Begam	FEMALE	1999-09-08 01:00:00-04	16	Daughter	f	Single	5	\N	f	t	f	165	f	f		\N	f	Baniyan Company Labour	Local	f		0
565	1	1	7	ER / 0001 / 145 / 4	Asmila Banu	FEMALE	2003-09-08 01:00:00-04	12	Daughter	f	Single	8	\N	f	t	f	165	f	f		\N	f	Student	Local	f		0
566	1	1	7	ER / 0001 / 146 / 1	S.Jeenath	FEMALE	1961-09-08 01:00:00-04	54	Mother	t	Widow	5	\N	f	t	t	166	f	f		\N	f	Tailor Shop	Local	f		0
567	1	1	7	ER / 0001 / 146 / 2	S.Faizun Nisha	FEMALE	1989-09-08 01:00:00-04	26	Daughter	f	Single	B.COM	\N	f	t	t	166	f	f		\N	f		Local	f		0
568	1	1	7	ER / 0001 / 146 / 3	S.Noorun Nisha	FEMALE	1991-09-08 01:00:00-04	24	Daughter	f	Single	B.COM	\N	f	t	t	166	f	f		\N	f		Local	f		0
569	1	1	7	ER / 0001 / 147 / 1	Basheer	MALE	1968-09-08 01:00:00-04	47	Father	t	Aged Unmarried Woman		\N	f	t	t	167	f	f		\N	f	Lock Repair	Local	f		0
570	1	1	7	ER / 0001 / 147 / 2	Aajira	FEMALE	1974-09-08 01:00:00-04	41	Mother	f	Aged Unmarried Woman	5	\N	f	t	t	167	f	f		\N	f	House Wife	Local	f		0
571	1	1	7	ER / 0001 / 147 / 3	Abbas	MALE	1996-09-08 01:00:00-04	19	Son	f	Single	8	\N	f	t	f	167	f	f		\N	f	Bike Mechanical	Local	f		0
572	1	1	7	ER / 0001 / 148 / 		MALE	2014-09-08 01:00:00-04	1		f	Single		\N	f	t	f	168	f	f		\N	f		Local	f		0
573	1	1	7	ER / 0001 / 149 / 1	Fathima Beevi	FEMALE	1959-09-08 01:00:00-04	56	Father	t	Widow		\N	f	t	t	169	f	f		\N	f	Rest	Local	f		0
575	1	1	7	ER / 0001 / 149 / 3	Jarina Begam	FEMALE	1984-09-08 01:00:00-04	31	Son In Law	f	Aged Unmarried Woman	5	\N	f	t	t	169	f	f		\N	f	Tailoring	Local	f		0
576	1	1	7	ER / 0001 / 149 / 4	Mohamed Begam	FEMALE	2004-09-08 01:00:00-04	11	Grand Son	f	Single	6	\N	f	t	f	169	f	f		\N	f	Student	Local	f		0
577	1	1	7	ER / 0001 / 149 / 5	Mohamed 	MALE	2010-09-08 01:00:00-04	5	Grand Son	f	Single		\N	f	t	f	169	f	f		\N	f	Student	Local	f		0
578	1	1	7	ER / 0001 / 149 / 6	Thoufiya Begam	FEMALE	2012-09-08 01:00:00-04	3		f	Single		\N	f	t	f	169	f	f		\N	f		Local	f		0
579	1	1	7	ER / 0001 / 150 / 1	Kamal Basha	MALE	1934-09-08 01:00:00-04	81	Father	t	Aged Unmarried Woman		\N	f	t	t	170	f	f		\N	f	Fruits Shop	Local	f		0
581	1	1	7	ER / 0001 / 151 / 1	Meera Mohideeen	MALE	1954-09-08 01:00:00-04	61	Father	t	Aged Unmarried Woman	3	\N	f	t	t	171	f	f		\N	f	Chicken Shop 	Local	f		0
582	1	1	7	ER / 0001 / 151 / 2	Rahina Begam	FEMALE	1962-09-08 01:00:00-04	53	Mother	f	Aged Unmarried Woman	7	\N	f	t	t	171	f	f		\N	f	HouseWife	Local	f		0
583	1	1	7	ER / 0001 / 151 / 3	Mansoor Ahmed	MALE	1987-09-08 01:00:00-04	28	Son	f	Single	10	\N	f	t	t	171	f	f		\N	f	Tailoring	Local	f		0
584	1	1	7	ER / 0001 / 151 / 4	Salsabila Begam	FEMALE	1993-09-08 01:00:00-04	22	Daughter In Law	f	Single	5	\N	f	t	f	171	f	f		\N	f	HouseWife	Local	f		0
585	1	1	7	ER / 0001 / 151 / 5	Ansar Fathima	FEMALE	2010-09-08 01:00:00-04	5	Grand Daughter	f	Single	LKG	\N	f	t	f	171	f	f		\N	f		Local	f		0
586	1	1	7	ER / 0001 / 152 / 1	Sawkath Ali	MALE	1979-09-08 01:00:00-04	36	Husband	t	Aged Unmarried Woman	4	\N	f	t	t	172	f	f		\N	f	Steel Shop	Local	f		0
587	1	1	7	ER / 0001 / 152 / 2	Umaira Banu	FEMALE	1980-09-08 01:00:00-04	35	Wife	f	Aged Unmarried Woman	6	\N	f	t	t	172	f	f		\N	f	House Wife	Local	f		0
588	1	1	7	ER / 0001 / 152 / 3	Mahbopob Khan	FEMALE	1959-09-08 01:00:00-04	56	Father	f	Aged Unmarried Woman		\N	f	t	t	172	f	f		\N	f		Local	f		0
589	1	1	7	ER / 0001 / 152 / 4	Syed Mohamed	MALE	2001-09-08 01:00:00-04	14	Son	f	Single	8	\N	f	t	f	172	f	f		\N	f	Student	Local	f		0
590	1	1	7	ER / 0001 / 152 / 5	Asin Thaj	FEMALE	2005-09-08 01:00:00-04	10	Daughter	f	Single	4	\N	f	t	f	172	f	f		\N	f	Student	Local	f		0
591	1	1	7	ER / 0001 / 153 / 1	Saliya Junaithi	MALE	1958-09-08 01:00:00-04	57	Father	t	Aged Unmarried Woman	6	\N	f	t	t	173	f	f		\N	f	Business	Local	f		0
592	1	1	7	ER / 0001 / 153 / 2	Thilsath Begam	FEMALE	1970-09-08 01:00:00-04	45	Mother	f	Aged Unmarried Woman	8	\N	f	t	t	173	f	f		\N	f	House Wife	Local	f		0
593	1	1	7	ER / 0001 / 153 / 3	Abuthahir Junaithi	MALE	1988-09-08 01:00:00-04	27	Son	f	Single	Auto Mobile 	\N	f	t	t	173	f	f		\N	f	Hotel Supervisor	Local	f		0
594	1	1	7	ER / 0001 / 153 / 4	Alaudeen Junaithi	MALE	1991-09-08 01:00:00-04	24	Son	f	Single	ITI	\N	f	t	t	173	f	f		\N	f	Student	Local	f		0
595	1	1	7	ER / 0001 / 154 / 1	Mohamed Abdul Muthalib	MALE	1978-09-08 01:00:00-04	37	Husband	t	Aged Unmarried Woman		\N	f	t	t	174	f	f		\N	f	Lorry Driver	Local	f		0
596	1	1	7	ER / 0001 / 154 / 2	Rasheedha Begam	FEMALE	1985-09-08 01:00:00-04	30	Wife	f	Aged Unmarried Woman	8	\N	f	t	t	174	f	f		\N	f	Tailoring	Local	f		0
597	1	1	7	ER / 0001 / 154 / 3	Habibun Nisha	FEMALE	2007-09-08 01:00:00-04	8	Daughter	f	Single	2	\N	f	t	t	174	f	f		\N	f	Student	Local	f		0
598	1	1	7	ER / 0001 / 154 / 4	Habibul Baskar	MALE	2010-09-08 01:00:00-04	5	Son	f	Single	L.K.G	\N	f	t	f	174	f	f		\N	f	Student	Local	f		0
551	1	1	7	ER / 0001 / 141 / 2	Aafrin Banu	FEMALE	1982-09-08 01:00:00-04	33	Mother	f	Aged Unmarried Woman	5	\N	f	t	t	161	f	f		\N	f	House Wife	Local	f		0
607	1	1	7	ER / 0001 / 157 / 		MALE	2014-09-08 01:00:00-04	1		f	Single		\N	f	t	f	177	f	f		\N	f		Local	f		0
608	1	1	7	ER / 0001 / 158 / 		MALE	2014-09-08 01:00:00-04	1		f	Single		\N	f	t	f	178	f	f		\N	f		Local	f		0
609	1	1	7	ER / 0001 / 159 / 		MALE	2014-09-08 01:00:00-04	1		f	Single		\N	f	t	f	179	f	f		\N	f		Local	f		0
610	1	1	7	ER / 0001 / 160 / 		MALE	2014-09-08 01:00:00-04	1		f	Single		\N	f	t	f	180	f	f		\N	f		Local	f		0
633	1	1	7	ER / 0001 / 169 / 		MALE	2014-09-08 01:00:00-04	1		f	Single		\N	f	t	f	189	f	f		\N	f		Local	f		0
615	1	1	7	ER / 0001 / 162 / 		MALE	2014-09-08 01:00:00-04	1		f	Single		\N	f	t	f	182	f	f		\N	f		Local	f		0
634	1	1	7	ER / 0001 / 170 / 		MALE	2014-09-08 01:00:00-04	1		f	Single		\N	f	t	f	190	f	f		\N	f		Local	f		0
618	1	1	7	ER / 0001 / 164 / 2	Asma Beevi	FEMALE	1976-09-08 01:00:00-04	39	Wife	f	Aged Unmarried Woman	8	\N	f	t	t	184	f	f		\N	f	House Wife	Local	f		0
626	1	1	7	ER / 0001 / 167 / 2	Naseema	FEMALE	2005-09-08 01:00:00-04	10		f	Single		\N	f	t	f	187	f	f		\N	f		Local	f		0
635	1	1	7	ER / 0001 / 171 / 		MALE	2014-09-08 01:00:00-04	1		f	Single		\N	f	t	f	191	f	f		\N	f		Local	f		0
637	1	1	7	ER / 0001 / 173 / 		MALE	2014-09-08 01:00:00-04	1		f	Single		\N	f	t	f	193	f	f		\N	f		Local	f		0
601	1	1	7	ER / 0001 / 155 / 2	Mumtaj Begam	FEMALE	1971-09-08 01:00:00-04	44	Mother	f	Aged Unmarried Woman	3	\N	f	t	t	175	f	f		\N	f	Labour	Local	f		0
602	1	1	7	ER / 0001 / 155 / 3	Mohamed Khan	MALE	1996-09-08 01:00:00-04	19	Son	f	Single	Diploma	\N	f	t	f	175	f	f		\N	f	Student	Local	f		0
603	1	1	7	ER / 0001 / 155 / 4	Narkis Banu	FEMALE	1997-09-08 01:00:00-04	18	Son	f	Single	12	\N	f	t	f	175	f	f		\N	f	Student	Local	f		0
604	1	1	7	ER / 0001 / 155 / 5	Kathija Beevi	FEMALE	1998-09-08 01:00:00-04	17	Daughter	f	Single	9	\N	f	t	f	175	f	f		\N	f	Student	Local	f		0
605	1	1	7	ER / 0001 / 156 / 1	Ansari	MALE	1954-09-08 01:00:00-04	61	Husband	t	Aged Unmarried Woman	3	\N	f	t	t	176	f	f		\N	f	Flower Shop	Local	f		0
606	1	1	7	ER / 0001 / 156 / 2	Bathurun Nisha Begam	FEMALE	1961-09-08 01:00:00-04	54	Wife	f	Aged Unmarried Woman	3	\N	f	t	t	176	f	f		\N	f	House Wife	Local	f		0
611	1	1	7	ER / 0001 / 161 / 1	M.Kadar Basha	MALE	1968-09-08 01:00:00-04	47	Father	t	Aged Unmarried Woman	M.SC	\N	f	t	t	181	f	f		\N	f	Lab Tech	Local	f		0
613	1	1	7	ER / 0001 / 161 / 3	K.Mohamed Aarif	MALE	1998-09-08 01:00:00-04	17	Son	f	Single	11	\N	f	t	f	181	f	f		\N	f	Student	Local	f		0
614	1	1	7	ER / 0001 / 161 / 4	K.Mohamed Maideen	MALE	2008-09-08 01:00:00-04	7	Son	f	Single	LKG	\N	f	t	f	181	f	f		\N	f	Student	Local	f		0
616	1	1	7	ER / 0001 / 163 / 		MALE	2014-09-08 01:00:00-04	1		f	Single		\N	f	t	f	183	f	f		\N	f		Local	f		0
617	1	1	7	ER / 0001 / 164 / 1	P.S.Raheem	MALE	1952-09-08 01:00:00-04	63	Husband	t	Aged Unmarried Woman	4	\N	f	t	t	184	f	f		\N	f	Tooth Power Shop	Local	f		0
619	1	1	7	ER / 0001 / 164 / 3	Dilsath Begam	FEMALE	2004-09-08 01:00:00-04	11	Daughter	f	Single	5	\N	f	t	f	184	f	f		\N	f	Daughter	Local	f		0
620	1	1	7	ER / 0001 / 165 / 1	Abdus Salam	MALE	1980-09-08 01:00:00-04	35	Husband	t	Aged Unmarried Woman	2	\N	f	t	t	185	f	f		\N	f	Flower Shop	Local	f		0
621	1	1	7	ER / 0001 / 165 / 2	Shakkila Banu	FEMALE	1984-09-08 01:00:00-04	31	Wife	f	Aged Unmarried Woman	5	\N	f	t	t	185	f	f		\N	f	Labour	Local	f		0
622	1	1	7	ER / 0001 / 165 / 3	Rahmathun Nisha	FEMALE	1998-09-08 01:00:00-04	17	Daughter	f	Single	12	\N	f	t	f	185	f	f		\N	f	Labour	Local	f		0
623	1	1	7	ER / 0001 / 165 / 4	Fairose Banu	FEMALE	2000-09-08 01:00:00-04	15	Daughter	f	Single	11	\N	f	t	f	185	f	f		\N	f	Student	Local	f		0
624	1	1	7	ER / 0001 / 166 / 		MALE	2014-09-08 01:00:00-04	1		f	Single		\N	f	t	f	186	f	f		\N	f		Local	f		0
625	1	1	7	ER / 0001 / 167 / 1	Jannath	MALE	1977-09-08 01:00:00-04	38	Mother	t	Widow		\N	f	t	t	187	f	f		\N	f		Local	f		0
627	1	1	7	ER / 0001 / 168 / 1	A.S.Aamina Beevi	FEMALE	1957-09-08 01:00:00-04	58	Mother	t	Widow	3	\N	f	t	t	188	f	f		\N	f	H.R	Local	f		0
628	1	1	7	ER / 0001 / 168 / 2	A.S.Jowhar Ali	MALE	1975-09-08 01:00:00-04	40	Son	f	Single	6	\N	f	t	t	188	f	f		\N	f	Labour	Local	f		0
629	1	1	7	ER / 0001 / 168 / 3	A.S.Rafeeq Ali	MALE	1979-09-08 01:00:00-04	36	Daughter	f	Aged Unmarried Woman	5	\N	f	t	t	188	f	f		\N	f	Vegetables Shop	Local	f		0
630	1	1	7	ER / 0001 / 168 / 4	R.Haseena Begam	FEMALE	1986-09-08 01:00:00-04	29	Daughter In Law	f	Aged Unmarried Woman	7	\N	f	t	t	188	f	f		\N	f		Local	f		0
631	1	1	7	ER / 0001 / 168 / 5	R.Mohamed Arsath	MALE	2006-09-08 01:00:00-04	9	Grand Son	f	Single	3	\N	f	t	f	188	f	f		\N	f	Student	Local	f		0
632	1	1	7	ER / 0001 / 168 / 6	R.Raswana Fathima	FEMALE	2008-09-08 01:00:00-04	7	Grand Daughter	f	Single	1	\N	f	t	f	188	f	f		\N	f	Student	Local	f		0
636	1	1	7	ER / 0001 / 172 / 1	Beevi Khan	FEMALE	1944-09-08 01:00:00-04	71	Mother	t	Widow		\N	f	t	t	192	f	f		\N	f		Local	f		0
638	1	1	7	ER / 0001 / 174 / 1	A.Abdul Sattar	MALE	1974-09-08 01:00:00-04	41	Husband	t	Aged Unmarried Woman		\N	f	t	t	194	f	f		\N	f	Sweet Shop	Local	f		0
639	1	1	7	ER / 0001 / 174 / 2	Ramlath Banu	FEMALE	1978-09-08 01:00:00-04	37	Wife	f	Aged Unmarried Woman	5	\N	f	t	t	194	f	f		\N	f	House Wife	Local	f		0
640	1	1	7	ER / 0001 / 174 / 3	Yasmeen	FEMALE	1998-09-08 01:00:00-04	17	Daughter	f	Single	11	\N	f	t	f	194	f	f		\N	f	Student	Local	f		0
641	1	1	7	ER / 0001 / 174 / 4	Habeebur Rahman	MALE	2000-09-08 01:00:00-04	15	Son	f	Single	9	\N	f	t	f	194	f	f		\N	f	Student	Local	f		0
643	1	1	7	ER / 0001 / 175 / 2	Aysha	FEMALE	1988-09-08 01:00:00-04	27	Mother	f	Married	5 Std	\N	f	t	t	195	f	f		\N	f	Home Maker	Local	f		0
644	1	1	7	ER / 0001 / 175 / 3	Salavudin	MALE	2009-09-08 01:00:00-04	6	Son	f	Single	LKG	\N	f	t	f	195	f	f		\N	f	Student	Local	f		0
645	1	1	7	ER / 0001 / 175 / 4	sahabudin	MALE	2011-09-08 01:00:00-04	4	Son	f	Single		\N	f	t	f	195	f	f		\N	f	Baby	Local	f		0
646	2	2	26	TP / 0001 / 96 / 1	A.K.Syed Ibrahim	MALE	1943-06-20 01:00:00-04	72	Father	t	Aged Unmarried Woman	10	\N	f	t	t	196	f	f		\N	f	No Job	Local	f		0
647	2	2	26	TP / 0001 / 96 / 2	S.Hameeda Begam	FEMALE	1949-11-13 09:48:54.802449-05	66	Mother	f	Aged Unmarried Woman	5	\N	f	t	t	196	f	f		\N	f	House Wife	Local	f		0
648	2	2	26	TP / 0001 / 96 / 3	S.Habbeebur Rahman	MALE	1991-11-13 09:48:54.827603-05	24	Son	f	Single	10	\N	f	t	f	196	f	f		\N	f	Labour	Local	f		0
649	2	2	26	TP / 0001 / 96 / 4	S.Jaffer Sathick	MALE	1981-11-13 09:48:54.848689-05	34	Son	f	Aged Unmarried Woman	10	\N	f	t	t	196	f	f		\N	f	Labour	Local	f		0
642	1	1	7	ER / 0001 / 175 / 1	Habeeb Mohamed	MALE	1981-09-08 01:00:00-04	34	Father	t	Married	5 Std	\N	f	t	t	195	f	f		\N	f	Supply	Local	f		0
599	1	1	7	ER / 0001 / 154 / 5	Habeebur Rahman	MALE	2011-09-08 01:00:00-04	4	Son	f	Single		\N	f	t	f	174	f	f		\N	f		Local	f		0
654	2	2	26	TP / 0001 / 98 / 4	Mohamed Abbas	MALE	1994-11-13 09:48:54.987802-05	21	Daughter	f	Single	12	\N	f	t	f	198	f	f		\N	f	Labour	Local	f		0
655	2	2	26	TP / 0001 / 98 / 5	Shajidha Thahsin	FEMALE	1996-11-13 09:48:55.009225-05	19	Daughter In Law	f	Aged Unmarried Woman	12	\N	f	t	f	198	f	f		\N	f	House Wife	Local	f		0
656	2	2	26	TP / 0001 / 99 / 1	Aarif Ali	MALE	1987-11-13 09:48:55.030778-05	28	Father	t	Aged Unmarried Woman	5	\N	f	t	t	199	f	f		\N	f	Labour	Local	f		0
657	2	2	26	TP / 0001 / 99 / 2	Mansoora Banu	FEMALE	1990-11-13 09:48:55.051611-05	25	Mother	f	Aged Unmarried Woman	5	\N	f	t	t	199	f	f		\N	f	House Wife	Local	f		0
658	2	2	26	TP / 0001 / 99 / 3	Asma Parveen	FEMALE	2009-11-13 09:48:55.072806-05	6	Daughter	f	Single	1	\N	f	t	f	199	f	f		\N	f		Local	f		0
659	2	2	26	TP / 0001 / 100 / 1	Rahmathullah	MALE	1958-11-13 09:48:55.118954-05	57	Father	t	Aged Unmarried Woman	8	\N	f	t	t	200	f	f		\N	f	Labour	Local	f		0
660	2	2	26	TP / 0001 / 100 / 2	Aarif Nisha	FEMALE	1963-11-13 09:48:55.160292-05	52	Mother	f	Aged Unmarried Woman	5	\N	f	t	t	200	f	f		\N	f	House Wife	Local	f		0
661	2	2	26	TP / 0001 / 100 / 3	Hidayathullah	MALE	1986-11-13 09:48:55.209316-05	29	Son	f	Aged Unmarried Woman	9	\N	f	t	t	200	f	f		\N	f	Labour	Local	f		0
662	2	2	26	TP / 0001 / 100 / 4	Malick Nisha	FEMALE	1993-11-13 09:48:55.252209-05	22	Daughter In Law	f	Aged Unmarried Woman	10	\N	f	t	t	200	f	f		\N	f	House Wife	Local	f		0
663	2	2	26	TP / 0001 / 100 / 5	Mohamed Jahangir	MALE	2012-11-13 09:48:55.294316-05	3	Daughter In Son	f	Single		\N	f	t	f	200	f	f		\N	f		Local	f		0
664	2	2	26	TP / 0001 / 101 / 1	Mohamed Hasan	MALE	1978-11-13 09:48:55.341233-05	37	Father	t	Aged Unmarried Woman	10	\N	f	t	t	201	f	f		\N	f	Labour	Local	f		0
665	2	2	26	TP / 0001 / 101 / 2	Taj Nisha	FEMALE	1990-11-13 09:48:55.385228-05	25	Mother	f	Aged Unmarried Woman	5	\N	f	t	f	201	f	f		\N	f	House Wife	Local	f		0
666	2	2	26	TP / 0001 / 101 / 3	Asma Parveen	FEMALE	2008-11-13 09:48:55.42457-05	7	Daughter	f	Single	3	\N	f	t	f	201	f	f		\N	f	Student	Local	f		0
667	2	2	26	TP / 0001 / 102 / 1	J.Aariba	MALE	1987-11-13 09:48:55.474156-05	28	Father	t	Aged Unmarried Woman	6	\N	f	t	t	202	f	f		\N	f	Labour	Local	f		0
668	2	2	26	TP / 0001 / 102 / 2	A.Rashhda Banu	FEMALE	1989-11-13 09:48:55.515284-05	26	Mother	f	Aged Unmarried Woman	5	\N	f	t	t	202	f	f		\N	f	House Wife	Local	f		0
669	2	2	26	TP / 0001 / 102 / 3	Mohamed Thanveer	MALE	2008-11-13 09:48:55.556588-05	7	Son	f	Single	2	\N	f	t	f	202	f	f		\N	f	Student	Local	f		0
670	2	2	26	TP / 0001 / 103 / 1	Noor Deen	MALE	1988-11-13 09:48:55.608234-05	27	Father	t	Aged Unmarried Woman	5	\N	f	t	t	203	f	f		\N	f	Labour	Local	f		0
671	2	2	26	TP / 0001 / 103 / 2	Nasreen	FEMALE	1988-11-13 09:48:55.65919-05	27	Mother	f	Aged Unmarried Woman	9	\N	f	t	t	203	f	f		\N	f	House Wife	Local	f		0
672	2	2	26	TP / 0001 / 103 / 3	Syed Asfiya	FEMALE	2011-11-13 09:48:55.691129-05	4	Son	f	Single		\N	f	t	f	203	f	f		\N	f	Student	Local	f		0
673	2	2	26	TP / 0001 / 104 / 1	Anwar Ali	MALE	1959-11-13 09:48:55.742244-05	56	Father	t	Aged Unmarried Woman	5	\N	f	t	t	204	f	f		\N	f	Labour	Local	f		0
675	2	2	26	TP / 0001 / 104 / 3	Mohamed Shareef	MALE	1991-11-13 09:48:55.819956-05	24	Son	f	Single	9	\N	f	t	t	204	f	f		\N	f	Tailor	Local	f		0
676	2	2	26	TP / 0001 / 104 / 4	Meharunn Nisha	FEMALE	2001-11-13 09:48:55.859222-05	14	Daughter	f	Single	10	\N	f	t	f	204	f	f		\N	f	Student	Local	f		0
677	2	2	26	TP / 0001 / 104 / 5	Balkis Sulthana	FEMALE	2006-11-13 09:48:55.908806-05	9	Daughter	f	Single	4	\N	f	t	f	204	f	f		\N	f	Student	Local	f		0
678	2	2	26	TP / 0001 / 105 / 1	Habeebullah	MALE	1956-11-13 09:48:55.957727-05	59	Father	t	Aged Unmarried Woman	10	\N	f	t	t	205	f	f		\N	f	House Rest	Local	f		0
679	2	2	26	TP / 0001 / 105 / 2	Mahmooda Beevi	FEMALE	1965-11-13 09:48:56.007376-05	50	Mother	f	Aged Unmarried Woman	8	\N	f	t	t	205	f	f		\N	f	House Wife	Local	f		0
680	2	2	26	TP / 0001 / 105 / 3	Mohamed Rizwan	MALE	1987-11-13 09:48:56.048198-05	28	Son	f	Single	12	\N	f	t	f	205	f	f		\N	f	Footwear Labour	Local	f		0
681	2	2	26	TP / 0001 / 106 / 1	Raliya Kathoon	FEMALE	1946-11-13 09:48:56.088371-05	69	Mother	t	Aged Unmarried Woman		\N	f	t	t	206	f	f		\N	f	House Wife	Local	f		0
682	2	2	26	TP / 0001 / 106 / 2	Sheik Bacha	MALE	1976-11-13 09:48:56.12897-05	39	Son	f	Aged Unmarried Woman	12	\N	f	t	t	206	f	f		\N	f	Labour	Local	f		0
683	2	2	26	TP / 0001 / 106 / 3	S.Jasmeen	FEMALE	1985-11-13 09:48:56.169261-05	30	Daughter In Law	f	Aged Unmarried Woman	12	\N	f	t	f	206	f	f		\N	f	House Wife	Local	f		0
684	2	2	26	TP / 0001 / 107 / 1	Saleema Beevi	FEMALE	1953-11-13 09:48:56.210548-05	62	Mother	t	Aged Unmarried Woman		\N	f	t	t	207	f	f		\N	f		Local	f		0
685	2	2	26	TP / 0001 / 108 / 1	Kaja Mohideen	MALE	1979-11-13 09:48:56.260151-05	36	Father	t	Aged Unmarried Woman	5	\N	f	t	t	208	f	f		\N	f	Shop	Local	f		0
686	2	2	26	TP / 0001 / 108 / 2	Yasmeen	FEMALE	1986-11-13 09:48:56.317972-05	29	Mother	f	Aged Unmarried Woman	7	\N	f	t	t	208	f	f		\N	f	House Wife	Local	f		0
687	2	2	26	TP / 0001 / 108 / 3	Mohamed Firdous	FEMALE	2007-11-13 09:48:56.366827-05	8	Daughter	f	Single	4	\N	f	t	f	208	f	f		\N	f	Student	Local	f		0
688	2	2	26	TP / 0001 / 108 / 4	Mohmaed Manasir	FEMALE	2008-11-13 09:48:56.418179-05	7	Daughter	f	Single	2	\N	f	t	f	208	f	f		\N	f	Student	Local	f		0
689	2	2	26	TP / 0001 / 109 / 1	A.M.Mubarak	MALE	1965-11-13 09:48:56.469161-05	50	Father	t	Aged Unmarried Woman	5	\N	f	t	t	209	f	f		\N	f	Labour	Local	f		0
690	2	2	26	TP / 0001 / 109 / 2	Barusha	FEMALE	1968-11-13 09:48:56.509088-05	47	Mother	f	Aged Unmarried Woman	5	\N	f	t	t	209	f	f		\N	f	House Wife	Local	f		0
691	2	2	26	TP / 0001 / 109 / 3	Ismail	MALE	1992-11-13 09:48:56.548441-05	23	Son	f	Single	7	\N	f	t	t	209	f	f		\N	f	Labour	Local	f		0
692	2	2	26	TP / 0001 / 109 / 4	Yasmeen	FEMALE	1994-11-13 09:48:56.598174-05	21	Daughter	f	Single	TT	\N	f	t	t	209	f	f		\N	f	Teacher Training Completed	Local	f		0
693	2	2	26	TP / 0001 / 109 / 5	Ishaq	MALE	1995-11-13 09:48:56.665078-05	20	Son	f	Single	6	\N	f	t	t	209	f	f		\N	f	Driver	Local	f		0
694	2	2	26	TP / 0001 / 110 / 1	Sabar Nisha	FEMALE	1959-11-13 09:48:56.708803-05	56	Husband	t	Widow		\N	f	t	f	210	f	f		\N	f	House Rest	Local	f		0
695	2	2	26	TP / 0001 / 111 / 1	Fathima	FEMALE	1980-11-13 09:48:56.778248-05	35	Mother	t	Widow	6	\N	f	t	t	211	f	f		\N	f	House Wife 	Local	f		0
696	2	2	26	TP / 0001 / 111 / 2	Habeebu Nisha	FEMALE	1999-11-13 09:48:56.827255-05	16	Daughter	f	Single	11	\N	f	t	f	211	f	f		\N	f	Student	Local	f		0
697	2	2	26	TP / 0001 / 111 / 3	Mohamed Aashiq	MALE	2002-11-13 09:48:56.885616-05	13	Son	f	Single	9	\N	f	t	f	211	f	f		\N	f	Student	Local	f		0
698	2	2	26	TP / 0001 / 112 / 1	Adam Saet	MALE	1965-11-13 09:48:56.93413-05	50	Father	t	Aged Unmarried Woman	9	\N	f	t	t	212	f	f		\N	f	Labour	Local	f		0
699	2	2	26	TP / 0001 / 112 / 2	Madina Begam	FEMALE	1975-11-13 09:48:56.974452-05	40	Mother	f	Aged Unmarried Woman	8	\N	f	t	t	212	f	f		\N	f	House Wife	Local	f		0
700	2	2	26	TP / 0001 / 112 / 3	Sadam Hussain	MALE	1994-11-13 09:48:57.016112-05	21	Son	f	Single	DME	\N	f	t	t	212	f	f		\N	f	Job Searching	Local	f		0
653	2	2	26	TP / 0001 / 98 / 3	Mohamed Jahir Hussain	MALE	1993-11-13 09:48:54.960165-05	22	Son	f	Aged Unmarried Woman	11	\N	f	t	f	198	f	f		\N	f	Labour	Local	f		0
703	2	2	26	TP / 0001 / 114 / 3	Yasmeen	FEMALE	2001-11-13 09:48:57.138096-05	14	Daughter	f	Single	11	\N	f	t	f	213	f	f		\N	f	Student	Local	f		0
704	2	2	26	TP / 0001 / 115 / 1	Najimudeen	MALE	1960-11-13 09:48:57.180793-05	55	Father	t	Aged Unmarried Woman	5	\N	f	t	t	214	f	f		\N	f	Labour	Local	f		0
705	2	2	26	TP / 0001 / 115 / 2	Shahideen	FEMALE	1970-11-13 09:48:57.215718-05	45	Mother	f	Aged Unmarried Woman	4	\N	f	t	t	214	f	f		\N	f	House Wife	Local	f		0
706	2	2	26	TP / 0001 / 115 / 3	Mohamed Yasdeen	MALE	1994-11-13 09:48:57.250306-05	21	Son	f	Single	DEG	\N	f	t	f	214	f	f		\N	f	Student	Local	f		0
707	2	2	26	TP / 0001 / 115 / 4	Mohamed Azar	MALE	1997-11-13 09:48:57.285002-05	18	Son	f	Single	DEG	\N	f	t	f	214	f	f		\N	f	Student	Local	f		0
708	2	2	26	TP / 0001 / 115 / 5	Mohamed Faizal	MALE	2003-11-13 09:48:57.328537-05	12	Son	f	Single	8	\N	f	t	f	214	f	f		\N	f	Student	Local	f		0
709	2	2	26	TP / 0001 / 116 / 1	Ummu Salma	MALE	1960-11-13 09:48:57.370968-05	55	Mother	t	Aged Unmarried Woman	5	\N	f	t	t	215	f	f		\N	f	Labour	Local	f		0
710	2	2	26	TP / 0001 / 116 / 2	Syed Ali Fathima	FEMALE	1980-11-13 09:48:57.402201-05	35	Daughter	f	Aged Unmarried Woman	3	\N	f	t	t	215	f	f		\N	f	House Wife	Local	f		0
711	2	2	26	TP / 0001 / 117 / 1	Rukman Saet	MALE	1982-11-13 09:48:57.436056-05	33	Father	t	Aged Unmarried Woman	4	\N	f	t	t	216	f	f		\N	f	Labour	Outstation	f		0
712	2	2	26	TP / 0001 / 117 / 2	Fairose Begam	FEMALE	1986-11-13 09:48:57.466593-05	29	Mother	f	Aged Unmarried Woman	9	\N	f	t	t	216	f	f		\N	f	House Wife	Local	f		0
713	2	2	26	TP / 0001 / 117 / 3	Mubassira	FEMALE	2006-11-13 09:48:57.49729-05	9	Daughter	f	Single	5	\N	f	t	f	216	f	f		\N	f	Student	Local	f		0
714	2	2	26	TP / 0001 / 117 / 4	Mohamed Thoufeek	MALE	2014-11-13 09:48:57.535043-05	1	Son	f	Single		\N	f	t	f	216	f	f		\N	f		Local	f		0
715	2	2	26	TP / 0001 / 118 / 1	Kamar Nisha	FEMALE	1950-11-13 09:48:57.556759-05	65	Mother	t	Widow		\N	f	t	t	217	f	f		\N	f	Vadakam Shop	Local	f		0
716	2	2	26	TP / 0001 / 118 / 2	Nisak Kani	MALE	1985-11-13 09:48:57.577747-05	30	Son	f	Aged Unmarried Woman	6	\N	f	t	t	217	f	f		\N	f	Tailor	Local	f		0
717	2	2	26	TP / 0001 / 118 / 3	Sabur Nisha	FEMALE	1994-11-13 09:48:57.609483-05	21	Daughter In Law	f	Aged Unmarried Woman	8	\N	f	t	t	217	f	f		\N	f	Labour	Local	f		0
718	2	2	26	TP / 0001 / 118 / 4	Sanbiya Parveen	FEMALE	2005-11-13 09:48:57.640839-05	10	Daughter	f	Single	5	\N	f	t	f	217	f	f		\N	f	Student	Local	f		0
719	2	2	26	TP / 0001 / 118 / 5	Mohamed Aarif	MALE	2011-11-13 09:48:57.67872-05	4	Son	f	Single	1	\N	f	t	f	217	f	f		\N	f	Student	Local	f		0
720	2	2	26	TP / 0001 / 119 / 1	Jai Bunnisha	FEMALE	1952-11-13 09:48:57.705897-05	63	Mother	t	Widow	5	\N	f	t	t	218	f	f		\N	f	House Wife	Local	f		0
721	2	2	26	TP / 0001 / 119 / 2	Kaleel Rahman	MALE	1974-11-13 09:48:57.73209-05	41	Son	f	Aged Unmarried Woman	10	\N	f	t	t	218	f	f		\N	f	Labour	Local	f		0
722	2	2	26	TP / 0001 / 119 / 3	Shahathathun Nisha	FEMALE	1975-11-13 09:48:57.753641-05	40	Daughter In Law	f	Aged Unmarried Woman	5	\N	f	t	t	218	f	f		\N	f	House Wife	Local	f		0
723	2	2	26	TP / 0001 / 119 / 4	Mohamed Ibrahim	MALE	2000-11-13 09:48:57.775287-05	15	Grand Son	f	Single	10	\N	f	t	f	218	f	f		\N	f	Student	Local	f		0
724	2	2	26	TP / 0001 / 119 / 5	Zuvairiya Banu	FEMALE	2002-11-13 09:48:57.802737-05	13	Grand Daughter	f	Single	7	\N	f	t	f	218	f	f		\N	f	Student	Local	f		0
725	2	2	26	TP / 0001 / 120 / 1	Shahul Hameed 	MALE	1954-11-13 09:48:57.836697-05	61	Husband	t	Aged Unmarried Woman	8	\N	f	t	t	219	f	f		\N	f	Labour	Local	f		0
726	2	2	26	TP / 0001 / 120 / 2	Saliha Beevi	FEMALE	1955-11-13 09:48:57.858943-05	60	Wife	f	Aged Unmarried Woman	8	\N	f	t	t	219	f	f		\N	f	Labour	Local	f		0
727	2	2	26	TP / 0001 / 121 / 1	Mohamed Rafeeq	MALE	1990-11-13 09:48:57.878949-05	25	Brother	t	Aged Unmarried Woman	10	\N	f	t	t	220	f	f		\N	f	Baniyan Company Labour	Local	f		0
728	2	2	26	TP / 0001 / 121 / 2	Fairose Banu	FEMALE	1995-11-13 09:48:57.899431-05	20	Sister	f	Single	10	\N	f	t	t	220	f	f		\N	f	H.R	Local	f		0
729	2	2	26	TP / 0001 / 121 / 3	Kathija Beevi	FEMALE	1939-11-13 09:48:57.933077-05	76	Nanni	f	Aged Unmarried Woman		\N	f	t	f	220	f	f		\N	f	H.R	Local	f		0
730	2	2	26	TP / 0001 / 122 / 1	Jaffer Ali	MALE	1970-11-13 09:48:57.961031-05	45	Husband	t	Aged Unmarried Woman	3	\N	f	t	t	221	f	f		\N	f	Labour	Outstation	f		0
732	2	2	26	TP / 0001 / 122 / 3	Mumtaj Beevi	FEMALE	1950-11-13 09:48:58.000888-05	65	Mother	f	Aged Unmarried Woman		\N	f	t	t	221	f	f		\N	f	House Wife	Local	f		0
733	2	2	26	TP / 0001 / 122 / 4	Mansoor Ali	MALE	2003-11-13 09:48:58.021508-05	12	Son	f	Single	7	\N	f	t	f	221	f	f		\N	f	Student	Outstation	f		0
734	2	2	26	TP / 0001 / 123 / 1	Savara Beevi	FEMALE	1955-11-13 09:48:58.04134-05	60	Mother	t	Aged Unmarried Woman		\N	f	t	f	222	f	f		\N	f	Rest	Local	f		0
735	2	2	26	TP / 0001 / 123 / 2	Roohu Shashan	MALE	1982-11-13 09:48:58.061027-05	33	Son	f	Aged Unmarried Woman	6	\N	f	t	t	222	f	f		\N	f	Labour	Local	f		0
736	2	2	26	TP / 0001 / 123 / 3	Sajitha	FEMALE	1987-11-13 09:48:58.080822-05	28	Daughter In Law	f	Aged Unmarried Woman	7	\N	f	t	t	222	f	f		\N	f	Labour	Local	f		0
737	2	2	26	TP / 0001 / 123 / 4	Farsana Parveen	FEMALE	2008-11-13 09:48:58.105153-05	7	Grand Daughter	f	Single	2	\N	f	t	f	222	f	f		\N	f	Student	Local	f		0
738	2	2	26	TP / 0001 / 123 / 5	Mohamed Uvais	MALE	2010-11-13 09:48:58.151501-05	5	Grand Son	f	Single	1	\N	f	t	f	222	f	f		\N	f	Student	Local	f		0
739	2	2	26	TP / 0001 / 126 / 1	Mohamed Ali	MALE	1970-11-13 09:48:58.178691-05	45	Father	t	Aged Unmarried Woman	2	\N	f	t	t	223	f	f		\N	f	Labour	Local	f		0
740	2	2	26	TP / 0001 / 126 / 2	Shakira Banu	FEMALE	1980-11-13 09:48:58.199173-05	35	Mother	f	Aged Unmarried Woman	6	\N	f	t	t	223	f	f		\N	f	House Wife	Local	f		0
741	2	2	26	TP / 0001 / 126 / 3	Sumaiya Sulthana	FEMALE	1999-11-13 09:48:58.219493-05	16	Daughter	f	Single	10	\N	f	t	t	223	f	f		\N	f		Local	f		0
742	2	2	26	TP / 0001 / 126 / 4	Haidar Ali	MALE	2005-11-13 09:48:58.245976-05	10	Son	f	Single	7	\N	f	t	f	223	f	f		\N	f		Local	f		0
743	2	2	26	TP / 0001 / 127 / 1	Rameeza Beevi	FEMALE	1965-11-13 09:48:58.271784-05	50	Mother	t	Aged Unmarried Woman	5	\N	f	t	t	224	f	f		\N	f	House Wife	Local	f		0
744	2	2	26	TP / 0001 / 127 / 2	Ayub Khan	MALE	1955-11-13 09:48:58.292214-05	60	Father	f	Aged Unmarried Woman	6	\N	f	t	t	224	f	f		\N	f	Labour	Local	f		0
745	2	2	26	TP / 0001 / 127 / 3	Anis Fathima	FEMALE	1990-11-13 09:48:58.312853-05	25	Daughter	f	Single	B.COM	\N	f	t	f	224	f	f		\N	f	Student	Local	f		0
746	2	2	26	TP / 0001 / 127 / 4	Sabeena Parveen	FEMALE	1999-11-13 09:48:58.333087-05	16	Son	f	Single	12	\N	f	t	f	224	f	f		\N	f	Student	Local	f		0
747	2	2	26	TP / 0001 / 128 / 1	Masooda Beevi	FEMALE	1960-11-13 09:48:58.353348-05	55	Mother	t	Widow	3	\N	f	t	t	225	f	f		\N	f	House Wife	Local	f		0
748	2	2	26	TP / 0001 / 128 / 2	Kaja Mohideen	MALE	1980-11-13 09:48:58.378314-05	35	Son	f	Aged Unmarried Woman	9	\N	f	t	t	225	f	f		\N	f	Labour	Local	f		0
749	2	2	26	TP / 0001 / 128 / 3	Noorjahan	FEMALE	1985-11-13 09:48:58.398724-05	30	Son In Law	f	Aged Unmarried Woman	10	\N	f	t	t	225	f	f		\N	f	House Wife	Local	f		0
702	2	2	26	TP / 0001 / 114 / 2	Niyaz Begam	FEMALE	1985-11-13 09:48:57.103401-05	30	Mother	f	Aged Unmarried Woman	7	\N	f	t	t	213	f	f		\N	f	House Wife	Local	f		0
2998	1	1	7	ER / 0001 / 734 / 		MALE	2014-11-08 01:00:00-05	1		f	Single		\N	f	t	f	885	f	f		\N	f		Local	f		0
752	2	2	26	TP / 0001 / 129 / 1	Abdul Kadar	MALE	1960-11-13 09:48:58.472661-05	55	Father	t	Aged Unmarried Woman	10	\N	f	t	t	226	f	f		\N	f	Labour	Local	f		0
753	2	2	26	TP / 0001 / 129 / 2	Madina Beevi	FEMALE	1965-11-13 09:48:58.49347-05	50	Mother	f	Aged Unmarried Woman	5	\N	f	t	t	226	f	f		\N	f	House Wife	Local	f		0
754	2	2	26	TP / 0001 / 129 / 3	Aleefdin	MALE	1993-11-13 09:48:58.513818-05	22	Daughter	f	Single	Civil	\N	f	t	t	226	f	f		\N	f		Local	f		0
755	2	2	26	TP / 0001 / 129 / 4	Ayesha Navra	FEMALE	1998-11-13 09:48:58.534075-05	17	Daughter	f	Single		\N	f	t	f	226	f	f		\N	f		Local	f		0
756	2	2	26	TP / 0001 / 129 / 5	Muhaidir Mohamed 	MALE	1999-11-13 09:48:58.555079-05	16	Son	f	Single		\N	f	t	f	226	f	f		\N	f		Local	f		0
757	2	2	26	TP / 0001 / 130 / 1	Akbar Ali	MALE	1968-11-13 09:48:58.580328-05	47	Father	t	Aged Unmarried Woman	5	\N	f	t	t	227	f	f		\N	f	Labour	Local	f		0
758	2	2	26	TP / 0001 / 130 / 2	Ayesha Beevi	FEMALE	1973-11-13 09:48:58.600718-05	42	Mother	f	Aged Unmarried Woman	5	\N	f	t	t	227	f	f		\N	f	House Wife	Local	f		0
759	2	2	26	TP / 0001 / 130 / 3	Soubiya Parveen Banu	FEMALE	1994-11-13 09:48:58.620686-05	21	Daughter	f	Single	10	\N	f	t	t	227	f	f		\N	f	House Wife	Local	f		0
761	2	2	26	TP / 0001 / 132 / 1	Ummusalma Beevi	FEMALE	1944-11-13 09:48:58.670344-04	71	Mother	t	Aged Unmarried Woman		\N	f	t	t	229	f	f		\N	f		Local	f		0
762	2	2	26	TP / 0001 / 132 / 2	Rahumathun Nisha	FEMALE	1954-11-13 09:48:58.701568-05	61	Daughter	f	Aged Unmarried Woman		\N	f	t	t	229	f	f		\N	f		Local	f		0
763	2	2	26	TP / 0001 / 133 / 1	Noorjahan	FEMALE	1965-11-13 09:48:58.728034-05	50	Wife	t	Aged Unmarried Woman		\N	f	t	t	230	f	f		\N	f	Labour	Local	f		0
764	2	2	26	TP / 0001 / 133 / 2	Shahul Hameed 	MALE	1957-11-13 09:48:58.7481-05	58	Husband	f	Aged Unmarried Woman	3	\N	f	t	t	230	f	f		\N	f	Labour	Local	f		0
765	2	2	26	TP / 0001 / 134 / 1	A.Farook	MALE	1983-11-13 09:48:58.768527-05	32	Husband	t	Aged Unmarried Woman	5	\N	f	t	t	231	f	f		\N	f	Labour	Local	f		0
766	2	2	26	TP / 0001 / 134 / 2	M.Fathima	FEMALE	1985-11-13 09:48:58.788875-05	30	Wife	f	Aged Unmarried Woman		\N	f	t	t	231	f	f		\N	f	House Wife	Local	f		0
767	2	2	26	TP / 0001 / 134 / 3	Mohmaed Abuthahir	MALE	2002-11-13 09:48:58.808764-05	13	Son	f	Single	8	\N	f	t	f	231	f	f		\N	f	Student	Local	f		0
768	2	2	26	TP / 0001 / 134 / 4	Jannathul Firdous	FEMALE	2008-11-13 09:48:58.834015-05	7	Daughter	f	Single	3	\N	f	t	f	231	f	f		\N	f	Student	Local	f		0
769	2	2	26	TP / 0001 / 135 / 1	Abdul Kadar	MALE	1955-11-13 09:48:58.862733-05	60	Father	t	Aged Unmarried Woman	3	\N	f	t	t	232	f	f		\N	f	Labour	Local	f		0
770	2	2	26	TP / 0001 / 135 / 2	Fareeda Banu	FEMALE	1965-11-13 09:48:58.88341-05	50	Mother	f	Aged Unmarried Woman		\N	f	t	t	232	f	f		\N	f	House Wife	Local	f		0
771	2	2	26	TP / 0001 / 135 / 3	Batkath Nisha	FEMALE	1995-11-13 09:48:58.903911-05	20	Daughter	f	Single	8	\N	f	t	t	232	f	f		\N	f	H.R	Local	f		0
772	2	2	26	TP / 0001 / 135 / 4	Doulath Nisha	FEMALE	1996-11-13 09:48:58.927335-05	19	Daughter	f	Single	10	\N	f	t	t	232	f	f		\N	f	H.R	Local	f		0
773	2	2	26	TP / 0001 / 135 / 5	Aaris Hakkim	MALE	2002-11-13 09:48:58.960567-05	13	Son	f	Single	9	\N	f	t	f	232	f	f		\N	f	Student	Local	f		0
774	2	2	26	TP / 0001 / 136 / 1	Rahmathullah	MALE	1964-11-13 09:48:58.987699-05	51	Father	t	Aged Unmarried Woman	8	\N	f	t	t	233	f	f		\N	f	Labour	Local	f		0
776	2	2	26	TP / 0001 / 136 / 3	Mansoor Ali	MALE	1993-11-13 09:48:59.058751-05	22	Son	f	Single	8	\N	f	t	f	233	f	f		\N	f	Labour	Local	f		0
777	2	2	26	TP / 0001 / 136 / 4	Asraf Ali	MALE	2002-11-13 09:48:59.091809-05	13	Son	f	Single	8	\N	f	t	f	233	f	f		\N	f	Student	Local	f		0
778	2	2	26	TP / 0001 / 136 / 5	Barkath Ali	MALE	2004-11-13 09:48:59.117945-05	11	Son	f	Single	7	\N	f	t	f	233	f	f		\N	f	Student	Local	f		0
779	2	2	26	TP / 0001 / 137 / 1	S.Ayesha Beevi	FEMALE	1950-11-13 09:48:59.14378-05	65	Mother	t	Aged Unmarried Woman	4	\N	f	t	t	234	f	f		\N	f	House Wife	Local	f		0
780	2	2	26	TP / 0001 / 138 / 1	Sabirammal	FEMALE	1950-11-13 09:48:59.17133-05	65	Mother	t	Widow	3	\N	f	t	t	235	f	f		\N	f	H.R	Local	f		0
781	2	2	26	TP / 0001 / 138 / 2	Mehraj	FEMALE	1975-11-13 09:48:59.191772-05	40	Daughter	f	Widow	5	\N	f	t	t	235	f	f		\N	f	House Wife	Local	f		0
782	2	2	26	TP / 0001 / 138 / 3	Mohamed Ali	MALE	1993-11-13 09:48:59.217281-05	22	Son	f	Single	6	\N	f	t	t	235	f	f		\N	f	Enter Prise Work	Outstation	f		0
783	2	2	26	TP / 0001 / 138 / 4	Mohamed Sulthan	MALE	1995-11-13 09:48:59.2378-05	20	Son	f	Single	7	\N	f	t	f	235	f	f		\N	f	Enter Prise Work	Outstation	f		0
784	2	2	26	TP / 0001 / 138 / 5	Rahmath Nisha	FEMALE	2000-11-13 09:48:59.267903-05	15	Daughter	f	Single	10	\N	f	t	f	235	f	f		\N	f	H.R	Local	f		0
785	2	2	26	TP / 0001 / 139 / 1	Mohmaed Ilyas	MALE	1977-11-13 09:48:59.317884-05	38	Father	t	Aged Unmarried Woman	12	\N	f	t	t	236	f	f		\N	f	Labour	Outstation	f		0
786	2	2	26	TP / 0001 / 139 / 2	Rahmath Nisha	FEMALE	1981-11-13 09:48:59.358099-05	34	Mother	f	Aged Unmarried Woman	8	\N	f	t	t	236	f	f		\N	f	House Wife	Local	f		0
787	2	2	26	TP / 0001 / 139 / 3	Mohamed Yahya	MALE	2006-11-13 09:48:59.386627-05	9	Son	f	Single	5	\N	f	t	f	236	f	f		\N	f	Student	Local	f		0
788	2	2	26	TP / 0001 / 139 / 4	Mohmaed Younus Fazil	MALE	2007-11-13 09:48:59.411907-05	8	Son	f	Single	3	\N	f	t	f	236	f	f		\N	f	Student	Local	f		0
789	2	2	26	TP / 0001 / 140 / 1	Jahir Hussain	MALE	1973-11-13 09:48:59.437675-05	42	Father	t	Aged Unmarried Woman	10	\N	f	t	t	237	f	f		\N	f	Departmental Store	Local	f		0
790	2	2	26	TP / 0001 / 140 / 2	Mehraj Begam	FEMALE	1977-11-13 09:48:59.462935-05	38	Mother	f	Aged Unmarried Woman	5	\N	f	t	t	237	f	f		\N	f	House Wife	Local	f		0
791	2	2	26	TP / 0001 / 140 / 3	Ajmeer Badhusha	MALE	1990-11-13 09:48:59.493839-05	25	Son	f	Single	5	\N	f	t	t	237	f	f		\N	f	Aalim	Local	f		0
792	2	2	26	TP / 0001 / 140 / 4	Aashik Basha	MALE	1997-11-13 09:48:59.514499-05	18	Son	f	Single	B.SC	\N	f	t	t	237	f	f		\N	f	Student	Local	f		0
793	2	2	26	TP / 0001 / 141 / 1	Asina Beevi	FEMALE	1965-11-13 09:48:59.534869-05	50	Mother	t	Widow	5	\N	f	t	t	238	f	f		\N	f	House Wife	Local	f		0
794	2	2	26	TP / 0001 / 141 / 2	Mohamed Ibrahim	MALE	1982-11-13 09:48:59.556086-05	33	Son	f	Aged Unmarried Woman	10	\N	f	t	t	238	f	f		\N	f	Labour	Local	f		0
795	2	2	26	TP / 0001 / 141 / 3	Salman Faris	FEMALE	1994-11-13 09:48:59.586655-05	21	Son	f	Aged Unmarried Woman	10	\N	f	t	t	238	f	f		\N	f	House Wife	Local	f		0
796	2	2	26	TP / 0001 / 141 / 4	Ruzwana Banu	FEMALE	1988-11-13 09:48:59.614634-05	27	Daughter	f	Aged Unmarried Woman	6	\N	f	t	t	238	f	f		\N	f	House Wife	Local	f		0
797	2	2	26	TP / 0001 / 142 / 1	S.Mohamed Abbas	MALE	1987-11-13 09:48:59.635216-05	28	Father	t	Aged Unmarried Woman	10	\N	f	t	t	239	f	f		\N	f	Labour	Local	f		0
798	2	2	26	TP / 0001 / 142 / 2	Rajabu Nisha	FEMALE	1989-11-13 09:48:59.656754-05	26	Mother	f	Aged Unmarried Woman	8	\N	f	t	t	239	f	f		\N	f	House Wife	Local	f		0
799	2	2	26	TP / 0001 / 142 / 3	Nawba	FEMALE	2013-11-13 09:48:59.678074-05	2	Daughter	f	Single		\N	f	t	f	239	f	f		\N	f		Local	f		0
751	2	2	26	TP / 0001 / 128 / 5	Firdous	FEMALE	2005-11-13 09:48:58.446434-05	10	Grand Daughter	f	Single	4	\N	f	t	f	225	f	f		\N	f	Student	Local	f		0
802	2	2	26	TP / 0001 / 143 / 2	Ayishamma	FEMALE	1979-11-13 09:48:59.760264-05	36	Mother	f	Aged Unmarried Woman	25	\N	f	t	t	240	f	f		\N	f	House Wife	Local	f		0
803	2	2	26	TP / 0001 / 143 / 3	Aashiq Ali	MALE	1997-11-13 09:48:59.780672-05	18	Son	f	Single	11	\N	f	t	f	240	f	f		\N	f	Student	Local	f		0
804	2	2	26	TP / 0001 / 143 / 4	Fasim Parveen	FEMALE	2001-11-13 09:48:59.801203-05	14	Son	f	Single	9	\N	f	t	f	240	f	f		\N	f	Student	Local	f		0
806	2	2	26	TP / 0001 / 144 / 2	S.Raziya Begam	FEMALE	1990-11-13 09:48:59.840931-05	25	Mother	f	Aged Unmarried Woman	10	\N	f	t	t	241	f	f		\N	f	House Wife	Local	f		0
807	2	2	26	TP / 0001 / 144 / 3	Mohamed Zubair	MALE	2005-11-13 09:48:59.861294-05	10	Son	f	Single	5	\N	f	t	f	241	f	f		\N	f	Student	Local	f		0
808	2	2	26	TP / 0001 / 145 / 1	Fathima	FEMALE	1945-11-13 09:48:59.886022-05	70	Mother	t	Widow		\N	f	t	f	242	f	f		\N	f	H.R	Local	f		0
809	2	2	26	TP / 0001 / 145 / 2	Sabar Nisha	FEMALE	1959-11-13 09:48:59.910746-05	56	Daughter	f	Widow	3	\N	f	t	f	242	f	f		\N	f	H.R	Local	f		0
810	2	2	26	TP / 0001 / 146 / 1	Ihsanullah	MALE	1965-11-13 09:48:59.936073-05	50	Father	t	Aged Unmarried Woman	12	\N	f	t	t	243	f	f		\N	f	Labour	Local	f		0
811	2	2	26	TP / 0001 / 146 / 2	Satthaj Begam	FEMALE	1972-11-13 09:48:59.956904-05	43	Mother	f	Aged Unmarried Woman	9	\N	f	t	t	243	f	f		\N	f	House Wife	Local	f		0
812	2	2	26	TP / 0001 / 146 / 3	Inzamamul Haq	MALE	1995-11-13 09:48:59.998567-05	20	Son	f	Single	I.T	\N	f	t	f	243	f	f		\N	f	Job Searching	Local	f		0
813	2	2	26	TP / 0001 / 148 / 1	A.S.Kaja Maideen	MALE	1967-11-13 09:49:00.025367-05	48	Father	t	Aged Unmarried Woman	9	\N	f	t	t	244	f	f		\N	f	Labour	Local	f		0
814	2	2	26	TP / 0001 / 148 / 2	Thoulath nisha	FEMALE	1970-11-13 09:49:00.047063-05	45	Mother	f	Aged Unmarried Woman	5	\N	f	t	t	244	f	f		\N	f	House Wife	Local	f		0
815	2	2	26	TP / 0001 / 148 / 3	Jaffer Sathick	MALE	1993-11-13 09:49:00.068603-05	22	Son	f	Single	8	\N	f	t	t	244	f	f		\N	f	Labour	Local	f		0
816	2	2	26	TP / 0001 / 148 / 4	Fairoza Banu	FEMALE	1996-11-13 09:49:00.088781-05	19	Daughter	f	Single	10	\N	f	t	t	244	f	f		\N	f		Local	f		0
817	2	2	26	TP / 0001 / 149 / 1	Mohamed Hussain	MALE	1952-11-13 09:49:00.119688-05	63	Father	t	Aged Unmarried Woman		\N	f	t	t	245	f	f		\N	f	Labour	Local	f		0
818	2	2	26	TP / 0001 / 149 / 2	Aaminammal	FEMALE	1957-11-13 09:49:00.146597-05	58	Mother	f	Aged Unmarried Woman		\N	f	t	t	245	f	f		\N	f	Labour	Local	f		0
819	2	2	26	TP / 0001 / 150 / 1	Sakkarai Bava	MALE	1987-11-13 09:49:00.168724-05	28	Father	t	Aged Unmarried Woman		\N	f	t	t	246	f	f		\N	f	Labour	Local	f		0
820	2	2	26	TP / 0001 / 150 / 2	Rabiyamma	FEMALE	1989-11-13 09:49:00.207261-05	26	Mother	f	Aged Unmarried Woman	10	\N	f	t	t	246	f	f		\N	f	House Wife	Local	f		0
821	2	2	26	TP / 0001 / 150 / 3	Rubina Parveen	FEMALE	2007-11-13 09:49:00.227242-05	8	Daughter	f	Single	3	\N	f	t	f	246	f	f		\N	f	Student	Local	f		0
822	2	2	26	TP / 0001 / 150 / 4	Akbar Badhusha	MALE	2010-11-13 09:49:00.253151-05	5	Daughter	f	Single	1	\N	f	t	f	246	f	f		\N	f	Student	Local	f		0
823	2	2	26	TP / 0001 / 152 / 1	Syed Ibrahim	MALE	1950-11-13 09:49:00.279761-05	65	Husband	t	Aged Unmarried Woman		\N	f	t	t	247	f	f		\N	f	H.R	Local	f		0
824	2	2	26	TP / 0001 / 152 / 2	Aajira Beevi	FEMALE	1960-11-13 09:49:00.305849-05	55	Wife	f	Aged Unmarried Woman	5	\N	f	t	t	247	f	f		\N	f	H.R	Local	f		0
825	2	2	26	TP / 0001 / 153 / 1	Aaminammal	FEMALE	1965-11-13 09:49:00.332055-05	50	Mother	t	Aged Unmarried Woman	5	\N	f	t	t	248	f	f		\N	f	HOuse Wife	Local	f		0
826	2	2	26	TP / 0001 / 155 / 1	M.Basheer Ahmed 	MALE	1945-11-13 09:49:00.35842-05	70	Father	t	Aged Unmarried Woman	5	\N	f	t	t	249	f	f		\N	f	H.R	Local	f		0
827	2	2	26	TP / 0001 / 155 / 2	Ajmud Nisha	FEMALE	1950-11-13 09:49:00.392999-05	65	Mother	f	Aged Unmarried Woman		\N	f	t	t	249	f	f		\N	f	House Wife	Local	f		0
828	2	2	26	TP / 0001 / 155 / 3	Doulath Nisha	FEMALE	1985-11-13 09:49:00.418968-05	30	Daughter	f	Single	7	\N	f	t	f	249	f	f		\N	f	H.R	Local	f		0
829	2	2	26	TP / 0001 / 155 / 4	Sheik Fareed	MALE	1988-11-13 09:49:00.439927-05	27	Son	f	Single	10	\N	f	t	t	249	f	f		\N	f	Labour	Local	f		0
830	2	2	26	TP / 0001 / 156 / 1	Umar Haron	MALE	1979-11-13 09:49:00.460857-05	36	Father	t	Aged Unmarried Woman	10	\N	f	t	t	250	f	f		\N	f	Labour	Outstation	f		0
831	2	2	26	TP / 0001 / 156 / 2	Rizwana	FEMALE	1986-11-13 09:49:00.482199-05	29	Mother	f	Aged Unmarried Woman	8	\N	f	t	t	250	f	f		\N	f	House Wife	Local	f		0
832	2	2	26	TP / 0001 / 156 / 3	Henna Hairoon	FEMALE	2012-11-13 09:49:00.502731-05	3	Daughter	f	Single		\N	f	t	f	250	f	f		\N	f		Local	f		0
833	2	2	26	TP / 0001 / 156 / 4	Mohamed Rizwan	FEMALE	2012-11-13 09:49:00.52821-05	3	Daughter	f	Single		\N	f	t	f	250	f	f		\N	f		Local	f		0
834	2	2	26	TP / 0001 / 157 / 1	Faizur Rahman	MALE	1945-11-13 09:49:00.554995-05	70	Father	t	Aged Unmarried Woman	5	\N	f	t	t	251	f	f		\N	f	Labour	Outstation	f		0
835	2	2	26	TP / 0001 / 157 / 2	Jameela Begam	FEMALE	1960-11-13 09:49:00.587149-05	55	Mother	f	Aged Unmarried Woman	8	\N	f	t	t	251	f	f		\N	f	House Wife	Local	f		0
836	2	2	26	TP / 0001 / 157 / 3	Mohamed Umar Shareef	MALE	1981-11-13 09:49:00.630444-05	34	Son	f	Single	10	\N	f	t	t	251	f	f		\N	f	Labour	Outstation	f		0
837	2	2	26	TP / 0001 / 158 / 1	Kaka Mohideen	MALE	1975-11-13 09:49:00.672275-05	40	Father	t	Aged Unmarried Woman	5	\N	f	t	t	252	f	f		\N	f	Labour	Local	f		0
838	2	2	26	TP / 0001 / 158 / 2	Thahira Banu	FEMALE	1979-11-13 09:49:00.723705-05	36	Mother	f	Aged Unmarried Woman	8	\N	f	t	t	252	f	f		\N	f	House Wife	Local	f		0
839	2	2	26	TP / 0001 / 158 / 3	Thahsin Banu	FEMALE	1995-11-13 09:49:00.744856-05	20	Daughter	f	Aged Unmarried Woman	12	\N	f	t	f	252	f	f		\N	f	House Wife	Local	f		0
840	2	2	26	TP / 0001 / 158 / 4	Thowfeeq	MALE	2000-11-13 09:49:00.765943-05	15	Son	f	Single	11	\N	f	t	f	252	f	f		\N	f	Student	Local	f		0
841	2	2	26	TP / 0001 / 160 / 1	Faizal Haq	MALE	1978-11-13 09:49:00.791604-05	37	Father	t	Single	10	\N	f	t	t	253	f	f		\N	f	Bakery Labour	Local	f		0
842	2	2	26	TP / 0001 / 162 / 1	Sarappa	FEMALE	1970-11-13 09:49:00.819222-05	45	Wife	t	Aged Unmarried Woman	4	\N	f	t	t	254	f	f		\N	f	House Wife	Local	f		0
843	2	2	26	TP / 0001 / 162 / 2	Fazlul Haq	MALE	1962-11-13 09:49:00.849869-05	53	Husband	f	Aged Unmarried Woman	8	\N	f	t	t	254	f	f		\N	f	Labour	Local	f		0
844	2	2	26	TP / 0001 / 162 / 3	Maman Sayawu	MALE	1993-11-13 09:49:00.876375-05	22	Son	f	Single	12	\N	f	t	t	254	f	f		\N	f	Labour	Local	f		0
845	2	2	26	TP / 0001 / 162 / 4	Mohamed Yaseen	MALE	1999-11-13 09:49:00.897844-05	16	Son	f	Single	10	\N	f	t	f	254	f	f		\N	f	Student	Local	f		0
846	2	2	26	TP / 0001 / 162 / 5	Abdul Hakeem	MALE	2001-11-13 09:49:00.924263-05	14	Son	f	Single	9	\N	f	t	f	254	f	f		\N	f	Student	Local	f		0
848	2	2	26	TP / 0001 / 163 / 2	Shahul Hameed 	MALE	1980-11-13 09:49:00.971018-05	35	Father	f	Aged Unmarried Woman		\N	f	t	t	255	f	f		\N	f	Painting	Outstation	f		0
849	2	2	26	TP / 0001 / 163 / 3	Mohamed Sabeer	FEMALE	2006-11-13 09:49:01.001163-05	9	Daughter	f	Single	4	\N	f	t	f	255	f	f		\N	f	Student	Local	f		0
801	2	2	26	TP / 0001 / 143 / 1	Mohamed Rabik	MALE	1969-11-13 09:48:59.739349-05	46	Father	t	Aged Unmarried Woman	8	\N	f	t	t	240	f	f		\N	f	Labour	Local	f		0
856	2	2	26	TP / 0001 / 166 / 3	Sabira 	FEMALE	1992-11-13 09:49:01.22574-05	23	Daughter In Law	f	Aged Unmarried Woman	10	\N	f	t	f	258	f	f		\N	f	House Wife	Local	f		0
852	2	2	26	TP / 0001 / 164 / 2	Mohamed Asen	MALE	1999-11-13 09:49:01.091069-05	16	Son	f	Single	10	\N	f	t	f	256	f	f		\N	f	Job Searching	Local	f		0
853	2	2	26	TP / 0001 / 165 / 		MALE	2015-11-13 09:49:01.159815-05	0		f	Single		\N	f	t	f	257	f	f		\N	f		Local	f		0
854	2	2	26	TP / 0001 / 166 / 1	Saliya Beevi	FEMALE	1955-11-13 09:49:01.179475-05	60	Mother	t	Widow		\N	f	t	t	258	f	f		\N	f	H.R	Local	f		0
857	2	2	26	TP / 0001 / 166 / 4	Syed Ibrahim	MALE	1993-11-13 09:49:01.247915-05	22	Son	f	Single	B.CA	\N	f	t	t	258	f	f		\N	f	Job Searching	Local	f		0
858	2	2	26	TP / 0001 / 167 / 1	S.M.Asraf Ali	MALE	1951-11-13 09:49:01.274758-05	64	Father	t	Aged Unmarried Woman	5	\N	f	t	t	259	f	f		\N	f	H.R	Local	f		0
859	2	2	26	TP / 0001 / 167 / 2	Asna Begam	FEMALE	1961-11-13 09:49:01.296021-05	54	Mother	f	Aged Unmarried Woman	5	\N	f	t	t	259	f	f		\N	f	House Wife	Local	f		0
860	2	2	26	TP / 0001 / 167 / 3	Mohamed Rafeeq	MALE	1984-11-13 09:49:01.317124-05	31	Son	f	Aged Unmarried Woman	9	\N	f	t	t	259	f	f		\N	f	Textile Labour	Local	f		0
861	2	2	26	TP / 0001 / 167 / 4	Mohamed Riyaz	MALE	1986-11-13 09:49:01.337823-05	29	Son	f	Aged Unmarried Woman	10	\N	f	t	t	259	f	f		\N	f	Textile Labour	Local	f		0
862	2	2	26	TP / 0001 / 167 / 5	Firthous	FEMALE	1993-11-13 09:49:01.360315-05	22	Daughter	f	Aged Unmarried Woman	8	\N	f	t	t	259	f	f		\N	f	House Wife	Local	f		0
863	2	2	26	TP / 0001 / 167 / 6	Fathima Beevi	FEMALE	1992-11-13 09:49:01.382536-05	23	Daughter	f	Aged Unmarried Woman	10	\N	f	t	t	259	f	f		\N	f	House Wife	Local	f		0
864	2	2	26	TP / 0001 / 168 / 1	Abubakkar	MALE	1940-11-13 09:49:01.403789-05	75	Father	t	Aged Unmarried Woman	5	\N	f	t	t	260	f	f		\N	f	Usthad	Local	f		0
865	2	2	26	TP / 0001 / 168 / 2	Kairun Nisha	FEMALE	1943-11-13 09:49:01.425086-04	72	Mother	f	Aged Unmarried Woman	2	\N	f	t	t	260	f	f		\N	f	House Wife	Local	f		0
866	2	2	26	TP / 0001 / 169 / 1	Liyakath Ali	MALE	1968-11-13 09:49:01.445932-05	47	Father	t	Aged Unmarried Woman	10	\N	f	t	t	261	f	f		\N	f	Labour	Local	f		0
867	2	2	26	TP / 0001 / 169 / 2	Noorun Nisha	FEMALE	1972-11-13 09:49:01.468381-05	43	Mother	f	Aged Unmarried Woman	5	\N	f	t	t	261	f	f		\N	f	House Wife	Local	f		0
868	2	2	26	TP / 0001 / 169 / 3	Seeriter Hana	FEMALE	2002-11-13 09:49:01.490311-05	13	Daughter	f	Single	9	\N	f	t	f	261	f	f		\N	f	Student	Local	f		0
869	2	2	26	TP / 0001 / 170 / 1	Sajitha Banu	FEMALE	1976-11-13 09:49:01.522015-05	39	Mother	t	Aged Unmarried Woman	5	\N	f	t	t	262	f	f		\N	f	Labour	Local	f		0
870	2	2	26	TP / 0001 / 170 / 2	Balkis Banu	FEMALE	1997-11-13 09:49:01.542764-05	18	Daughter	f	Single	12	\N	f	t	f	262	f	f		\N	f		Local	f		0
871	2	2	26	TP / 0001 / 170 / 3	Rajab Mohamed	MALE	1999-11-13 09:49:01.56388-05	16	Daughter	f	Single		\N	f	t	f	262	f	f		\N	f	Labour	Local	f		0
872	2	2	26	TP / 0001 / 171 / 1	M.S.Jahir Hussain	MALE	1971-11-13 09:49:01.590692-05	44	Father	t	Aged Unmarried Woman	12	\N	f	t	t	263	f	f		\N	f	Labour	Local	f		0
873	2	2	26	TP / 0001 / 171 / 2	Aarifa Begam	FEMALE	1979-11-13 09:49:01.612498-05	36	Mother	f	Aged Unmarried Woman	5	\N	f	t	t	263	f	f		\N	f	House Wife	Local	f		0
874	2	2	26	TP / 0001 / 171 / 3	Narkis Banu	FEMALE	1998-11-13 09:49:01.634071-05	17	Daughter	f	Single	12	\N	f	t	f	263	f	f		\N	f	College Student	Local	f		0
875	2	2	26	TP / 0001 / 171 / 4	Mohamed Sulthan Yaseen	MALE	2005-11-13 09:49:01.664652-05	10	Daughter	f	Single	5	\N	f	t	f	263	f	f		\N	f	Student	Local	f		0
876	2	2	26	TP / 0001 / 172 / 1	Musthaq Ali	MALE	1973-11-13 09:49:01.690299-05	42	Father	t	Aged Unmarried Woman	5	\N	f	t	t	264	f	f		\N	f	Ice Shop	Local	f		0
877	2	2	26	TP / 0001 / 172 / 2	Ajmun Nisha	FEMALE	1979-11-13 09:49:01.719821-05	36	Mother	f	Aged Unmarried Woman	5	\N	f	t	t	264	f	f		\N	f	House Wife	Local	f		0
878	2	2	26	TP / 0001 / 172 / 3	Jasmeen	FEMALE	1998-11-13 09:49:01.741299-05	17	Daughter	f	Single	12	\N	f	t	f	264	f	f		\N	f	H.R	Local	f		0
879	2	2	26	TP / 0001 / 172 / 4	Mohamed Hakeem	MALE	2003-11-13 09:49:01.763096-05	12	Son	f	Single	8	\N	f	t	f	264	f	f		\N	f	Aalim In Progress	Local	f		0
880	2	2	26	TP / 0001 / 173 / 1	Haji Kaja Maideen	MALE	1950-11-13 09:49:01.785269-05	65	Father	t	Aged Unmarried Woman	5	\N	f	t	t	265	f	f		\N	f	Labour	Local	f		0
881	2	2	26	TP / 0001 / 173 / 2	Hajiya Sowthammal	FEMALE	1960-11-13 09:49:01.806955-05	55	Mother	f	Aged Unmarried Woman	5	\N	f	t	t	265	f	f		\N	f	House Wife	Local	f		0
882	2	2	26	TP / 0001 / 174 / 1	Shahul Hameed 	MALE	1974-11-13 09:49:01.827067-05	41	Father	t	Aged Unmarried Woman	12	\N	f	t	t	266	f	f		\N	f	Mechanical	Local	f		0
883	2	2	26	TP / 0001 / 174 / 2	Jamsheena	FEMALE	1979-11-13 09:49:01.847992-05	36	Mother	f	Aged Unmarried Woman	8	\N	f	t	t	266	f	f		\N	f	House Wife	Local	f		0
884	2	2	26	TP / 0001 / 174 / 3	Mohamed Jubair	MALE	1998-11-13 09:49:01.867976-05	17	Son	f	Single	8	\N	f	t	f	266	f	f		\N	f	Aalim In Progress	Local	f		0
885	2	2	26	TP / 0001 / 174 / 4	Junaitha	FEMALE	2003-11-13 09:49:01.887908-05	12	Daughter	f	Single	7	\N	f	t	f	266	f	f		\N	f	Student	Local	f		0
886	2	2	26	TP / 0001 / 175 / 1	Kairun Nisha	FEMALE	1960-11-13 09:49:01.913078-05	55	Mother	t	Aged Unmarried Woman		\N	f	t	t	267	f	f		\N	f	Idli Shop	Local	f		0
887	2	2	26	TP / 0001 / 175 / 2	Mohamed Sathick	MALE	1990-11-13 09:49:01.933772-05	25	Grand Son	f	Single		\N	f	t	t	267	f	f		\N	f	H.R	Local	f		0
888	2	2	26	TP / 0001 / 178 / 1	Kadhar Maideen	MALE	1978-11-13 09:49:01.955376-05	37	Husband	t	Aged Unmarried Woman	10	\N	f	t	f	268	f	f		\N	f	Painter	Local	f		0
889	2	2	26	TP / 0001 / 178 / 2	Shajitha Banu	FEMALE	1982-11-13 09:49:01.98197-05	33	Wife	f	Aged Unmarried Woman	6	\N	f	t	t	268	f	f		\N	f	House Wife	Local	f		0
891	2	2	26	TP / 0001 / 179 / 2	Thowlath Nisha	FEMALE	1970-11-13 09:49:02.032359-05	45	Mother	f	Aged Unmarried Woman	8	\N	f	t	t	269	f	f		\N	f	House Wife	Local	f		0
892	2	2	26	TP / 0001 / 179 / 3	Mohamed Aashiq	MALE	1990-11-13 09:49:02.052865-05	25	Son	f	Aged Unmarried Woman	10	\N	f	t	t	269	f	f		\N	f	Own Business	Outstation	f		0
893	2	2	26	TP / 0001 / 179 / 4	Mohamed Aslam	MALE	1993-11-13 09:49:02.072917-05	22	Son	f	Aged Unmarried Woman	10	\N	f	t	t	269	f	f		\N	f	Own Business	Local	f		0
894	2	2	26	TP / 0001 / 180 / 1	A.M.Sathick	MALE	1952-11-13 09:49:02.09358-05	63	Father	t	Aged Unmarried Woman	11	\N	f	t	t	270	f	f		\N	f	Labour	Outstation	f		0
895	2	2	26	TP / 0001 / 180 / 2	Afrose Begam	FEMALE	1964-11-13 09:49:02.11931-05	51	Mother	f	Aged Unmarried Woman	6	\N	f	t	t	270	f	f		\N	f	House Wife	Local	f		0
896	2	2	26	TP / 0001 / 180 / 3	Hakeem	MALE	1987-11-13 09:49:02.14016-05	28	Son	f	Aged Unmarried Woman	B.SC	\N	f	t	t	270	f	f		\N	f	Labour	Local	f		0
897	2	2	26	TP / 0001 / 180 / 4	Noorul Aslam	MALE	1995-11-13 09:49:02.165738-05	20	Son	f	Single	12	\N	f	t	f	270	f	f		\N	f	Student	Local	f		0
898	2	2	26	TP / 0001 / 181 / 1	A.Shahul Hameed	MALE	1970-11-13 09:49:02.197504-05	45	Father	t	Aged Unmarried Woman	10	\N	f	t	t	271	f	f		\N	f	Slipper Shop	Outstation	f		0
851	2	2	26	TP / 0001 / 164 / 1	Sabar Nisha	FEMALE	1968-11-13 09:49:01.054792-05	47	Father	t	Aged Unmarried Woman	7	\N	f	t	f	256	f	f		\N	f	Labour	Local	f		0
901	2	2	26	TP / 0001 / 181 / 4	Mohamed Aarilkin	MALE	2000-11-13 09:49:02.280528-05	15	Son	f	Single	9	\N	f	t	f	271	f	f		\N	f	Student	Local	f		0
902	2	2	26	TP / 0001 / 181 / 5	Abuyameen	MALE	2004-11-13 09:49:02.310813-05	11	Son	f	Single	6	\N	f	t	f	271	f	f		\N	f	Student	Local	f		0
903	2	2	26	TP / 0001 / 182 / 1	A.Rahmath Nisha	FEMALE	1947-11-13 09:49:02.335828-05	68	Mother	t	Widow	3	\N	f	t	t	272	f	f		\N	f	House Wife	Local	f		0
904	2	2	26	TP / 0001 / 182 / 2	A.Mohamed Jailani	MALE	1979-11-13 09:49:02.360758-05	36	Son	f	Aged Unmarried Woman	10	\N	f	t	t	272	f	f		\N	f	Slipper Shop	Outstation	f		0
905	2	2	26	TP / 0001 / 182 / 3	Fareeda Begam	FEMALE	1983-11-13 09:49:02.386297-05	32	Daughter In Law	f	Aged Unmarried Woman	10	\N	f	t	t	272	f	f		\N	f	House Wife	Local	f		0
906	2	2	26	TP / 0001 / 182 / 4	Kaja Mohideen	MALE	1981-11-13 09:49:02.406819-05	34	Son	f	Aged Unmarried Woman	10	\N	f	t	t	272	f	f		\N	f	Slipper Shop	Outstation	f		0
907	2	2	26	TP / 0001 / 182 / 5	Sariba Banu	FEMALE	1985-11-13 09:49:02.431335-05	30	Daughter In Law	f	Aged Unmarried Woman	9	\N	f	t	t	272	f	f		\N	f	House Wife	Local	f		0
908	2	2	26	TP / 0001 / 183 / 1	A.Abuthahir	MALE	1977-11-13 09:49:02.451096-05	38	Father	t	Aged Unmarried Woman	8	\N	f	t	t	273	f	f		\N	f	Labour	Outstation	f		0
909	2	2	26	TP / 0001 / 183 / 2	Sabiya Banu	FEMALE	1979-11-13 09:49:02.47085-05	36	Mother	f	Aged Unmarried Woman	10	\N	f	t	t	273	f	f		\N	f	House Wife	Local	f		0
910	2	2	26	TP / 0001 / 183 / 3	Anoj Babu	MALE	1997-11-13 09:49:02.491278-05	18	Son	f	Single	B.SC	\N	f	t	f	273	f	f		\N	f	Student	Local	f		0
911	2	2	26	TP / 0001 / 186 / 1	Nagoor Picchai	MALE	1970-11-13 09:49:02.516967-05	45	Husband	t	Aged Unmarried Woman	5	\N	f	t	t	274	f	f		\N	f	Cloth Shop	Outstation	f		0
912	2	2	26	TP / 0001 / 186 / 2	Sabirammal	FEMALE	1945-11-13 09:49:02.537491-05	70	Mother In Law	f	Aged Unmarried Woman		\N	f	t	t	274	f	f		\N	f	H.R	Local	f		0
913	2	2	26	TP / 0001 / 186 / 3	Noorul Bashar	FEMALE	1980-11-13 09:49:02.557541-05	35	Wife	f	Aged Unmarried Woman	8	\N	f	t	t	274	f	f		\N	f	House Wife	Local	f		0
914	2	2	26	TP / 0001 / 186 / 4	Mohamed Aashih	MALE	2009-11-13 09:49:02.577168-05	6	Son	f	Single	1	\N	f	t	f	274	f	f		\N	f	Student	Local	f		0
915	2	2	26	TP / 0001 / 186 / 5	Mohamed Musthafa	MALE	2010-11-13 09:49:02.601795-05	5	Son	f	Single		\N	f	t	f	274	f	f		\N	f	L.K.G	Local	f		0
916	2	2	26	TP / 0001 / 186 / 6	Alyas	MALE	1973-11-13 09:49:02.621777-05	42	Mother In Law	f	Aged Unmarried Woman	5	\N	f	t	t	274	f	f		\N	f	Departmental Store	Outstation	f		0
917	2	2	26	TP / 0001 / 186 / 7	Rabiyathul Basariya	FEMALE	1983-11-13 09:49:02.641201-05	32	Sister	f	Aged Unmarried Woman	5	\N	f	t	t	274	f	f		\N	f	House Wife	Outstation	f		0
918	2	2	26	TP / 0001 / 186 / 8	Syed Sameera	FEMALE	2010-11-13 09:49:02.662836-05	5	Daughter In Law	f	Single	LKG	\N	f	t	f	274	f	f		\N	f	Student	Outstation	f		0
919	2	2	26	TP / 0001 / 186 / 9	Saliha Asma	FEMALE	2012-11-13 09:49:02.682949-05	3	Daughter In Law	f	Single		\N	f	t	f	274	f	f		\N	f	Children	Outstation	f		0
920	2	2	26	TP / 0001 / 187 / 1	A.H.Mohamed Ali	MALE	1977-11-13 09:49:02.70299-05	38	Husband	t	Aged Unmarried Woman	8	\N	f	t	t	275	f	f		\N	f	Labour	Outstation	f		0
921	2	2	26	TP / 0001 / 187 / 2	M.Sakkeela Banu	FEMALE	1982-11-13 09:49:02.727046-05	33	Wife	f	Aged Unmarried Woman	8	\N	f	t	t	275	f	f		\N	f	House Wife	Local	f		0
922	2	2	26	TP / 0001 / 187 / 3	M.Noorul Huda	MALE	2000-11-13 09:49:02.747698-05	15	Son	f	Single	11	\N	f	t	f	275	f	f		\N	f	Student	Local	f		0
923	2	2	26	TP / 0001 / 187 / 4	M.Thameemul Ansari	MALE	2002-11-13 09:49:02.772437-05	13	Son	f	Single	8	\N	f	t	f	275	f	f		\N	f	Student	Local	f		0
924	2	2	26	TP / 0001 / 187 / 5	.Sinsila Parveen	FEMALE	2002-11-13 09:49:02.796868-05	13	Daughter	f	Single	10	\N	f	t	f	275	f	f		\N	f	Student	Local	f		0
925	2	2	26	TP / 0001 / 188 / 1	Ayesha beevi	FEMALE	1938-11-13 09:49:02.821404-05	77	Mother	t	Aged Unmarried Woman	2	\N	f	t	t	276	f	f		\N	f	House Wife	Local	f		0
926	2	2	26	TP / 0001 / 189 / 1	Sirajudeen	MALE	1970-11-13 09:49:02.84135-05	45	Father	t	Aged Unmarried Woman	8	\N	f	t	t	277	f	f		\N	f	Kitchen Master	Outstation	f		0
927	2	2	26	TP / 0001 / 189 / 2	Habeebun Nisha Banu	FEMALE	1972-11-13 09:49:02.860778-05	43	M	f	Aged Unmarried Woman	5	\N	f	t	t	277	f	f		\N	f	House Wife	Local	f		0
928	2	2	26	TP / 0001 / 189 / 3	Juhiroshma	FEMALE	2000-11-13 09:49:02.880116-05	15	Daughter	f	Single	10	\N	f	t	f	277	f	f		\N	f	Student	Local	f		0
929	2	2	26	TP / 0001 / 190 / 1	Liyakath Ali	MALE	1973-11-13 09:49:02.904833-05	42	Husband	t	Aged Unmarried Woman	4	\N	f	t	t	278	f	f		\N	f	Labour	Local	f		0
930	2	2	26	TP / 0001 / 190 / 2	Baby Shakeela	FEMALE	1977-11-13 09:49:02.926735-05	38	Wife	f	Aged Unmarried Woman	5	\N	f	t	t	278	f	f		\N	f	House Wife	Local	f		0
931	2	2	26	TP / 0001 / 190 / 3	Shafana	FEMALE	1992-11-13 09:49:02.949003-05	23	Daughter	f	Aged Unmarried Woman	8	\N	f	t	t	278	f	f		\N	f	House Wife	Outstation	f		0
932	2	2	26	TP / 0001 / 190 / 4	Mohamed Ilyas	MALE	1993-11-13 09:49:02.969472-05	22	Son	f	Single	8	\N	f	t	t	278	f	f		\N	f	Labour	Outstation	f		0
933	2	2	26	TP / 0001 / 190 / 5	Jahir Hussain	MALE	1995-11-13 09:49:02.989858-05	20	Son	f	Single	11	\N	f	t	t	278	f	f		\N	f	Labour	Outstation	f		0
934	2	2	26	TP / 0001 / 190 / 6	Sima Parveen	FEMALE	1999-11-13 09:49:03.010547-05	16	Daughter	f	Single	12	\N	f	t	t	278	f	f		\N	f	Aalima In Progress	Local	f		0
935	2	2	26	TP / 0001 / 191 / 1	Fathima	FEMALE	1970-11-13 09:49:03.030659-05	45	Mother	t	Aged Unmarried Woman	5	\N	f	t	t	279	f	f		\N	f	Labour	Local	f		0
936	2	2	26	TP / 0001 / 191 / 2	Kaja Mohideen	MALE	2002-11-13 09:49:03.055908-05	13	Son	f	Single	7	\N	f	t	f	279	f	f		\N	f	Student	Local	f		0
937	2	2	26	TP / 0001 / 192 / 1	A.Kalifullah	MALE	1959-11-13 09:49:03.081174-05	56	Father	t	Aged Unmarried Woman	12	\N	f	t	t	280	f	f		\N	f	Agent	Local	f		0
939	2	2	26	TP / 0001 / 192 / 3	Mishariya Begam	FEMALE	1988-11-13 09:49:03.125356-05	27	Daughter	f	Single	MSC 	\N	f	t	t	280	f	f		\N	f	Assistant Professor	Local	f		0
940	2	2	26	TP / 0001 / 192 / 4	Benasir	FEMALE	1991-11-13 09:49:03.150512-05	24	Daughter	f	Single	MSC 	\N	f	t	t	280	f	f		\N	f	Teacher HOD	Local	f		0
941	2	2	26	TP / 0001 / 193 / 1	Ayesha Beevi	FEMALE	1955-11-13 09:49:03.171434-05	60	Mother	t	Aged Unmarried Woman		\N	f	t	t	281	f	f		\N	f	H.R	Local	f		0
942	2	2	26	TP / 0001 / 194 / 1	Mohamed Farook	MALE	1970-11-13 09:49:03.191641-05	45	Father	t	Aged Unmarried Woman	10	\N	f	t	t	282	f	f		\N	f	Medical Sales Man	Local	f		0
943	2	2	26	TP / 0001 / 194 / 2	Ummul Asanath	FEMALE	1977-11-13 09:49:03.212061-05	38	Mother	f	Aged Unmarried Woman	5	\N	f	t	t	282	f	f		\N	f	House Wife	Local	f		0
944	2	2	26	TP / 0001 / 194 / 3	Mohamed Riyaz	MALE	1995-11-13 09:49:03.235515-05	20	Son	f	Single	ECE	\N	f	t	f	282	f	f		\N	f	Student	Local	f		0
945	2	2	26	TP / 0001 / 194 / 4	Thasleema Parveen	FEMALE	1996-11-13 09:49:03.265251-05	19	Daughter	f	Single	B.COM	\N	f	t	f	282	f	f		\N	f	Student	Local	f		0
946	2	2	26	TP / 0001 / 195 / 1	Haidar Ali	MALE	1979-11-13 09:49:03.291113-05	36	Father	t	Aged Unmarried Woman	8	\N	f	t	t	283	f	f		\N	f	Baniyan Business	Local	f		0
900	2	2	26	TP / 0001 / 181 / 3	Mohamed Noorani	MALE	1998-11-13 09:49:02.238439-05	17	Son	f	Single	11	\N	f	t	f	271	f	f		\N	f	Student	Local	f		0
3208	2	2	26	TP / 0001 / 201 / 1	Baher Ahamed	MALE	1972-06-21 01:00:00-04	43	HUSBAND	t	Aged Unmarried Woman	Y 	\N	f	t	f	957	f	f		\N	f	Sunnambu tholil	Local	f		0
3207	1	1	7	ER / 0001 / 658 / 		MALE	2014-10-08 01:00:00-04	1		f	Single		\N	f	t	f	956	f	f		\N	f		Local	f		0
949	2	2	26	TP / 0001 / 196 / 1	Abdul Hameed	MALE	1944-11-13 09:49:03.360339-04	71	Father	t	Aged Unmarried Woman	4	\N	f	t	t	284	f	f		\N	f	Labour	Local	f		0
950	2	2	26	TP / 0001 / 196 / 2	Aamina Beevi	FEMALE	1954-11-13 09:49:03.380128-05	61	Mother	f	Aged Unmarried Woman	3	\N	f	t	t	284	f	f		\N	f	House Wife	Local	f		0
951	2	2	26	TP / 0001 / 197 / 1	S.Jahir Hussain	MALE	1977-11-13 09:49:03.400645-05	38	Father	t	Aged Unmarried Woman	8	\N	f	t	t	285	f	f		\N	f	Labour	Local	f		0
952	2	2	26	TP / 0001 / 197 / 2	Benasir	FEMALE	1991-11-13 09:49:03.422721-05	24	Mother	f	Aged Unmarried Woman	8	\N	f	t	t	285	f	f		\N	f	House Wife	Local	f		0
953	2	2	26	TP / 0001 / 197 / 3	Alfiya	FEMALE	2014-11-13 09:49:03.444037-05	1	Daughter	f	Single		\N	f	t	f	285	f	f		\N	f		Local	f		0
954	2	2	26	TP / 0001 / 198 / 1	A.K.Mohamed Ibrahim	MALE	1972-11-13 09:49:03.465408-05	43	Father	t	Aged Unmarried Woman	8	\N	f	t	t	286	f	f		\N	f	Imam In Masjid	Local	f		0
955	2	2	26	TP / 0001 / 198 / 2	Hoorul Ayn	FEMALE	1982-11-13 09:49:03.486049-05	33	Mother	f	Aged Unmarried Woman	10	\N	f	t	t	286	f	f		\N	f	House Wife	Local	f		0
956	2	2	26	TP / 0001 / 198 / 3	Rukkaiyya Jalwa	FEMALE	2001-11-13 09:49:03.508893-05	14	Daughter	f	Single	9	\N	f	t	f	286	f	f		\N	f	Student	Local	f		0
957	2	2	26	TP / 0001 / 198 / 4	Mohamed 	MALE	2002-11-13 09:49:03.533996-05	13	Son	f	Single	7	\N	f	t	f	286	f	f		\N	f	Student	Local	f		0
958	2	2	26	TP / 0001 / 198 / 5	Mohamed Abdal	MALE	2008-11-13 09:49:03.560229-05	7	Son	f	Single	2	\N	f	t	f	286	f	f		\N	f	Student	Local	f		0
960	2	2	26	TP / 0001 / 199 / 2	S.Aasiya Begam	FEMALE	1973-11-13 09:49:03.606982-05	42	Mother	f	Aged Unmarried Woman	10	\N	f	t	t	287	f	f		\N	f	House Wife	Local	f		0
961	2	2	26	TP / 0001 / 199 / 3	S.Benasir Banu	FEMALE	1992-11-13 09:49:03.628496-05	23	Daughter	f	Single	B.SC	\N	f	t	t	287	f	f		\N	f	H.R	Local	f		0
962	2	2	26	TP / 0001 / 199 / 4	S.Imthathus Salam	MALE	1995-11-13 09:49:03.650205-05	20	Son	f	Single	B.E	\N	f	t	f	287	f	f		\N	f	Student	Local	f		0
963	2	2	26	TP / 0001 / 200 / 1	Ayishamma	FEMALE	1954-11-13 09:49:03.677443-05	61	Mother	t	Widow		\N	f	t	f	288	f	f		\N	f	Labour	Local	f		0
964	2	2	26	TP / 0001 / 200 / 2	Saudamma	FEMALE	1986-11-13 09:49:03.703024-05	29	Daughter	f	Single		\N	f	t	f	288	f	f		\N	f		Local	f		0
965	1	1	7	ER / 0001 / 430 / 1	A.Nazeen Banu	FEMALE	1959-10-08 01:00:00-04	56	Family Head	t	Widow		\N	f	t	t	289	f	f		\N	f	H.W	Local	f		0
966	1	1	7	ER / 0001 / 430 / 2	A.Ahagamath ali	MALE	1987-10-08 01:00:00-04	28	son	f	Single	D.T.P	\N	f	t	t	289	f	f		\N	f		Local	f		0
967	1	1	7	ER / 0001 / 431 / 1	Alavudeen	MALE	1982-10-08 01:00:00-04	33	Family Head	t	Married	10	\N	f	t	t	290	f	f		\N	f	Labour	Local	f		0
968	1	1	7	ER / 0001 / 431 / 2	Naseema	FEMALE	1987-10-08 01:00:00-04	28	Wife	f	Married	10	\N	f	t	t	290	f	f		\N	f	H.W	Local	f		0
969	1	1	7	ER / 0001 / 431 / 3	Asarudeen	MALE	2007-10-08 01:00:00-04	8	Son	f	Single	2	\N	f	t	f	290	f	f		\N	f	Student	Local	t	Interest in Aalim/Hifz	0
970	1	1	7	ER / 0001 / 431 / 4	Saniya	FEMALE	2008-10-08 01:00:00-04	7	Daughter	f	Single	1	\N	f	t	f	290	f	f		\N	f	Student	Local	t	Interest in Aalim/Hifz	0
971	1	1	7	ER / 0001 / 432 / 1	Shagul Ameed	MALE	1979-10-08 01:00:00-04	36	Family Head	t	Married	10	\N	f	t	f	291	f	f		\N	f	Cement Sheet Fitting	Local	f		0
972	1	1	7	ER / 0001 / 432 / 2	Noor Jahan	FEMALE	1980-10-08 01:00:00-04	35	Wife	f	Married	6	\N	f	t	t	291	f	f		\N	f	H.W	Local	f		0
973	1	1	7	ER / 0001 / 432 / 3	Tasleem	FEMALE	1999-10-08 01:00:00-04	16	Daughter	f	Single	10	\N	f	t	f	291	f	f		\N	f	Student	Local	t	Interest in Aalim/Hifz	0
974	1	1	7	ER / 0001 / 432 / 4	Tapseena	FEMALE	2003-10-08 01:00:00-04	12	Daughter	f	Single	7	\N	f	t	f	291	f	f		\N	f	Student	Local	t	Interest in Aalim/Hifz	0
975	1	1	7	ER / 0001 / 433 / 1	Babu(A) Abdul Kadher	MALE	1986-10-08 01:00:00-04	29	Family Head	t	Married	4	\N	f	t	t	292	f	f		\N	f	Mineral Water Supply	Local	f		0
976	1	1	7	ER / 0001 / 433 / 2	Shakeela Banu	FEMALE	1989-10-08 01:00:00-04	26	Wife	f	Married	7	\N	f	t	t	292	f	f		\N	f	H.W	Local	f		0
977	1	1	7	ER / 0001 / 433 / 3	Ayaisha Refana	FEMALE	2011-10-08 01:00:00-04	4	Daughter	f	Single		\N	f	t	f	292	f	f		\N	f		Local	f		0
978	1	1	7	ER / 0001 / 434 / 1	Mumtaj	FEMALE	1966-10-08 01:00:00-04	49	Family Head	t	Married	3	\N	f	t	f	293	f	f		\N	f	Labour	Local	f		0
979	1	1	7	ER / 0001 / 434 / 2	Idyathulla	MALE	1986-10-08 01:00:00-04	29	son	f	Single	6	\N	f	t	t	293	f	f		\N	f	Driver	Local	f		0
980	1	1	7	ER / 0001 / 435 / 1	Mumtaj	FEMALE	1954-10-08 01:00:00-05	61	Family Head	t	Married	2	\N	f	t	t	294	f	f		\N	f	H.W	Local	f		0
981	1	1	7	ER / 0001 / 435 / 2	P.S.Jaheer Ussain	MALE	1981-10-08 01:00:00-04	34	son	f	Married	12	\N	f	t	t	294	f	f		\N	f	Labour	Local	f		0
982	1	1	7	ER / 0001 / 435 / 3	M.Dillshath Begam	FEMALE	1989-10-08 01:00:00-04	26	.Daughter In Law	f	Married	12	\N	f	t	t	294	f	f		\N	f	H.W	Local	f		0
983	1	1	7	ER / 0001 / 435 / 4	Z.JuBairiya	FEMALE	2011-10-08 01:00:00-04	4	.Grand Daughter	f	Single	L.K.G	\N	f	t	f	294	f	f		\N	f		Local	f		0
984	1	1	7	ER / 0001 / 436 / 1	Noorjahan	FEMALE	1954-10-08 01:00:00-05	61	Family Head	t	Married	3	\N	f	t	t	295	f	f		\N	f	H.W	Local	f		0
985	1	1	7	ER / 0001 / 436 / 2	Kaja moideen	MALE	1989-10-08 01:00:00-04	26	son	f	Married	9	\N	f	t	f	295	f	f		\N	f	Tailor	Local	f		0
986	1	1	7	ER / 0001 / 436 / 3	Aneesh Fathima	FEMALE	1989-10-08 01:00:00-04	26	.Daughter In Law	f	Married	12	\N	f	t	f	295	f	f		\N	f	Tailor	Local	f		0
987	1	1	7	ER / 0001 / 436 / 4	Barkeethuneesha	MALE	2011-10-08 01:00:00-04	4	.Grand Daughter	f	Single		\N	f	t	f	295	f	f		\N	f		Local	f		0
988	1	1	7	ER / 0001 / 437 / 1	K.N.Tashtageen	MALE	1967-10-08 01:00:00-04	48	Family Head	t	Married	5	\N	f	t	f	296	f	f		\N	f	Vegitable Seller	Local	f		0
989	1	1	7	ER / 0001 / 437 / 2	Hajeera Begam	FEMALE	1974-10-08 01:00:00-04	41	Wife	f	Married	5	\N	f	t	f	296	f	f		\N	f	H.W	Local	f		0
990	1	1	7	ER / 0001 / 438 / 1	M.K.Abdul Vahab	MALE	1942-10-08 01:00:00-04	73	Family Head	t	Married	P.U.C	\N	f	t	t	297	f	f		\N	f	pon sales	Local	f		0
991	1	1	7	ER / 0001 / 438 / 2	A.Rahamathunisha	FEMALE	1949-10-08 01:00:00-05	66	Wife	f	Married	7	\N	f	t	t	297	f	f		\N	f	H.W	Local	f		0
992	1	1	7	ER / 0001 / 438 / 3	A.Agamatu Ali	MALE	1984-10-08 01:00:00-04	31	son	f	Married	10	\N	f	t	t	297	f	f		\N	f	pon sales	Local	f		0
993	1	1	7	ER / 0001 / 438 / 4	A.Jannathunisha	FEMALE	1992-10-08 01:00:00-04	23	.Daughter In Law	f	Married	8	\N	f	t	t	297	f	f		\N	f	H.W	Local	f		0
994	1	1	7	ER / 0001 / 439 / 1	G.E.Kaja mydeen	MALE	1954-10-08 01:00:00-05	61	Family Head	t	Married	5	\N	f	t	t	298	f	f		\N	f	pon sales	Local	f		0
995	1	1	7	ER / 0001 / 439 / 2	Sarbunisha	FEMALE	1959-10-08 01:00:00-04	56	Wife	f	Married	10	\N	f	t	t	298	f	f		\N	f	H.W	Local	f		0
996	1	1	7	ER / 0001 / 440 / 1	Ammanulla 	MALE	1979-10-08 01:00:00-04	36	Family Head	t	Married	6	\N	f	t	t	299	f	f		\N	f	Labour	Local	f		0
948	2	2	26	TP / 0001 / 195 / 3	Aynul Afrha	FEMALE	1998-11-13 09:49:03.335607-05	17	Daughter	f	Single	3	\N	f	t	f	283	f	f		\N	f	Student	Local	f		0
999	1	1	7	ER / 0001 / 441 / 1	A.Siraj Muhaideen	MALE	1965-10-08 01:00:00-04	50	Family Head	t	Married	B.Com	\N	f	t	t	300	f	f		\N	f	Dresh Retail Shop	Local	f		0
1000	1	1	7	ER / 0001 / 441 / 2	A.Reajiya	FEMALE	1972-10-08 01:00:00-04	43	Wife	f	Married	B.Sc	\N	f	t	t	300	f	f		\N	f	Match Teacher Govt.	Outstation	f		0
1001	1	1	7	ER / 0001 / 441 / 3	R.S.Arsath Ahammed	MALE	1999-10-08 01:00:00-04	16	son	f	Single	11	\N	f	t	f	300	f	f		\N	f	Student	Local	f		0
1002	1	1	7	ER / 0001 / 442 / 1	N.Syed Saleem	MALE	1957-10-08 01:00:00-04	58	Family Head	t	Married	10	\N	f	t	t	301	f	f		\N	f	O.A/High Way	Local	f		0
1003	1	1	7	ER / 0001 / 442 / 2	S.Beagum	FEMALE	1967-10-08 01:00:00-04	48	Wife	f	Married	8	\N	f	t	t	301	f	f		\N	f	H.W	Local	f		0
1004	1	1	7	ER / 0001 / 442 / 3	S.Nizaar	MALE	1987-10-08 01:00:00-04	28	son	f	Married	12	\N	f	t	t	301	f	f		\N	f	Dyeing Fabric Supervisor	Local	f		0
1005	1	1	7	ER / 0001 / 442 / 4	N.Ayisha	FEMALE	1991-10-08 01:00:00-04	24	.Daughter In Law	f	Married	8	\N	f	t	f	301	f	f		\N	f	Alima Deg. Holder	Local	f		0
1006	1	1	7	ER / 0001 / 442 / 5	S.Mathlub	MALE	1992-10-08 01:00:00-04	23	son	f	Single	B.Bm	\N	f	t	t	301	f	f		\N	f	Dyeing Fabric Supervisor	Local	f		0
1007	1	1	7	ER / 0001 / 443 / 1	K.Abu Kani	MALE	1960-10-08 01:00:00-04	55	Family Head	t	Married	3	\N	f	t	t	302	f	f		\N	f	Labour	Local	f		0
1008	1	1	7	ER / 0001 / 443 / 2	A.Jabbar Nisha	FEMALE	1969-10-08 01:00:00-04	46	Wife	f	Married	6	\N	f	t	t	302	f	f		\N	f	H.W	Local	f		0
1009	1	1	7	ER / 0001 / 443 / 3	A.Azarudeen	MALE	1987-10-08 01:00:00-04	28	son	f	Single	10	\N	f	t	t	302	f	f		\N	f	Labour	Local	f		0
1010	1	1	7	ER / 0001 / 443 / 4	A.Anisha Fathima	FEMALE	1993-10-08 01:00:00-04	22	Daughter	f	Single	B.A	\N	f	t	t	302	f	f		\N	f		Local	f		0
1012	1	1	7	ER / 0001 / 444 / 2	S.Sharmeela Begam	FEMALE	1985-10-08 01:00:00-04	30	Wife	f	Married	7	\N	f	t	t	303	f	f		\N	f	Tailor	Local	f		0
1013	1	1	7	ER / 0001 / 444 / 3	S.Afrin Banu	FEMALE	2006-10-08 01:00:00-04	9	Daughter	f	Single	3	\N	f	t	f	303	f	f		\N	f	Student	Local	f		0
1014	1	1	7	ER / 0001 / 444 / 4	S.Ashifa	FEMALE	2008-10-08 01:00:00-04	7	Daughter	f	Single	1	\N	f	t	f	303	f	f		\N	f	Student	Local	f		0
1015	1	1	7	ER / 0001 / 445 / 1	A.J.Tameem Ansaree	MALE	1985-10-08 01:00:00-04	30	Family Head	t	Married	10	\N	f	t	f	304	f	f		\N	f	Auto Driver	Local	f		0
1016	1	1	7	ER / 0001 / 445 / 2	T.Rehana	FEMALE	1987-10-08 01:00:00-04	28	Wife	f	Married	12	\N	f	t	f	304	f	f		\N	f	Crocury Shop	Local	f		0
1017	1	1	7	ER / 0001 / 445 / 3	T.Fathima	FEMALE	2009-10-08 01:00:00-04	6	Daughter	f	Single	`1	\N	f	t	f	304	f	f		\N	f	Student	Local	f		0
1018	1	1	7	ER / 0001 / 446 / 1	S.Syed Ali	MALE	1962-10-08 01:00:00-04	53	Family Head	t	Married	3	\N	f	t	t	305	f	f		\N	f	Frout Shop	Local	f		0
1019	1	1	7	ER / 0001 / 446 / 2	S.Vaheetha Banu	FEMALE	1967-10-08 01:00:00-04	48	Wife	f	Married	8	\N	f	t	t	305	f	f		\N	f	H.W	Local	f		0
1020	1	1	7	ER / 0001 / 446 / 3	S.Syed Fauzulla	MALE	1987-10-08 01:00:00-04	28	son	f	Single	10	\N	f	t	t	305	f	f		\N	f	Frout Shop	Local	f		0
1021	1	1	7	ER / 0001 / 447 / 1	K.S.Saisa	MALE	1952-10-08 01:00:00-05	63	Family Head	t	Married	M.Sc	\N	f	t	t	306	f	f		\N	f	Ret.	Local	f		0
1022	1	1	7	ER / 0001 / 447 / 2	M.Mahaboobnisha	FEMALE	1959-10-08 01:00:00-04	56	Wife	f	Married	8	\N	f	t	t	306	f	f		\N	f	H.W	Local	f		0
1023	1	1	7	ER / 0001 / 447 / 3	K.S. Syed Afsal	MALE	1987-10-08 01:00:00-04	28	son	f	Single	MBA	\N	f	t	t	306	f	f		\N	f		Local	f		0
1024	1	1	7	ER / 0001 / 447 / 4	K.S.Yaseen Nikar	FEMALE	1993-10-08 01:00:00-04	22	Daughter	f	Single	BSc	\N	f	t	t	306	f	f		\N	f		Local	f		0
1025	1	1	7	ER / 0001 / 448 / 1	B.Jawed Basha	MALE	1981-10-08 01:00:00-04	34	Family Head	t	Married	12	\N	f	t	t	307	f	f		\N	f	Cloth Sales	Local	f		0
1026	1	1	7	ER / 0001 / 448 / 2	J.Rehana	FEMALE	1986-10-08 01:00:00-04	29	Wife	f	Married	12	\N	f	t	t	307	f	f		\N	f	Labour	Local	f		0
1027	1	1	7	ER / 0001 / 448 / 3	J.Rubiha	FEMALE	2005-10-08 01:00:00-04	10	Daughter	f	Single	4	\N	f	t	f	307	f	f		\N	f	Student	Local	f		0
1028	1	1	7	ER / 0001 / 448 / 4	J.Sabana	FEMALE	2007-10-08 01:00:00-04	8	Daughter	f	Single	2	\N	f	t	f	307	f	f		\N	f	Student	Local	f		0
1029	1	1	7	ER / 0001 / 449 / 1	A.Asraf Ali	MALE	1978-10-08 01:00:00-04	37	Family Head	t	Married		\N	f	t	t	308	f	f		\N	f	Tincer	Local	f		0
1030	1	1	7	ER / 0001 / 449 / 2	A.Hajira	FEMALE	1986-10-08 01:00:00-04	29	Wife	f	Married	12	\N	f	t	t	308	f	f		\N	f	Labour	Local	f		0
1031	1	1	7	ER / 0001 / 449 / 3	A.Muhammed Harsath	MALE	2005-10-08 01:00:00-04	10	son	f	Single	3	\N	f	t	f	308	f	f		\N	f	Student	Local	f		0
1032	1	1	7	ER / 0001 / 450 / 1	A.Jameel Ahamad	MALE	1952-10-08 01:00:00-05	63	Family Head	t	Married	B.A	\N	f	t	f	309	f	f		\N	f	Hotel Server	Local	f		0
1033	1	1	7	ER / 0001 / 450 / 2	A.J.Subeara Beagam	FEMALE	1962-10-08 01:00:00-04	53	Wife	f	Married	9	\N	f	t	f	309	f	f		\N	f	H.W	Local	f		0
1034	1	1	7	ER / 0001 / 450 / 3	A.J.Muhammed Saleeya	MALE	1994-10-08 01:00:00-04	21	son	f	Single	10	\N	f	t	f	309	f	f		\N	f	Labour	Local	f		0
1035	1	1	7	ER / 0001 / 451 / 1	I.Kamal Batsha	MALE	1961-10-08 01:00:00-04	54	Family Head	t	Married	PUC	\N	f	t	t	310	f	f		\N	f		Local	f		0
1036	1	1	7	ER / 0001 / 451 / 2	K.Aasia Beagam	FEMALE	1969-10-08 01:00:00-04	46	Wife	f	Married	8	\N	f	t	t	310	f	f		\N	f	Tailor	Local	f		0
1037	1	1	7	ER / 0001 / 451 / 3	K.Muhamadu Shabe	MALE	1989-10-08 01:00:00-04	26	son	f	Single	B.Tech	\N	f	t	t	310	f	f		\N	f		Local	f		0
1038	1	1	7	ER / 0001 / 451 / 4	K.Rizwan	MALE	1994-10-08 01:00:00-04	21	Daughter	f	Single	DME	\N	f	t	f	310	f	f		\N	f	Machion Operater	Local	f		0
1039	1	1	7	ER / 0001 / 452 / 1	Jannathu nisha	FEMALE	1953-10-08 01:00:00-05	62	Family Head	t	Married	5	\N	f	t	t	311	f	f		\N	f		Local	f		0
1040	1	1	7	ER / 0001 / 452 / 2	M.Samsudeen	MALE	1974-10-08 01:00:00-04	41	son	f	Married	7	\N	f	t	t	311	f	f		\N	f	Driver	Local	f		0
1041	1	1	7	ER / 0001 / 452 / 3	S.Shakeela Banu	FEMALE	1982-10-08 01:00:00-04	33	.Daughter In Law	f	Married	3	\N	f	t	t	311	f	f		\N	f	Tailor	Local	f		0
1042	1	1	7	ER / 0001 / 452 / 4	S.Thaheera	FEMALE	2011-10-08 01:00:00-04	4	.Grand Daughter	f	Single		\N	f	t	f	311	f	f		\N	f		Local	f		0
1043	1	1	7	ER / 0001 / 452 / 5	Musthafa	MALE	1984-10-08 01:00:00-04	31	son	f	Married	3	\N	f	t	t	311	f	f		\N	f	Tailor	Local	f		0
1044	1	1	7	ER / 0001 / 452 / 6	Sura Beev	FEMALE	1987-10-08 01:00:00-04	28	.Daughter In Law	f	Married	10	\N	f	t	f	311	f	f		\N	f	H.W	Local	f		0
1045	1	1	7	ER / 0001 / 452 / 7	Shajudeen	MALE	2008-10-08 01:00:00-04	7	Grand son	f	Single	1	\N	f	t	f	311	f	f		\N	f	Student	Local	f		0
1046	1	1	7	ER / 0001 / 452 / 8	Fasid	MALE	2010-10-08 01:00:00-04	5	Grand son	f	Single	U.KG	\N	f	t	f	311	f	f		\N	f	Student	Local	f		0
1047	1	1	7	ER / 0001 / 453 / 1	Muhammed Saleem.R	MALE	1975-10-08 01:00:00-04	40	Family Head	t	Married	6	\N	f	t	t	312	f	f		\N	f	Labour	Local	f		0
998	1	1	7	ER / 0001 / 440 / 3	ILLmunisha	FEMALE	2004-10-08 01:00:00-04	11	Daughter	f	Single	7	\N	f	t	f	299	f	f		\N	f		Local	f		0
1070	1	1	7	ER / 0001 / 776 / 		MALE	2014-08-08 01:00:00-04	1		f	Single		\N	f	t	f	318	f	f		\N	f		Local	f		0
1082	1	1	7	ER / 0001 / 782 / 		MALE	2014-08-08 01:00:00-04	1		f	Single		\N	f	t	f	324	f	f		\N	f		Local	f		0
1087	1	1	7	ER / 0001 / 784 / 		MALE	2014-08-17 01:00:00-04	1		f	Single		\N	f	t	f	326	f	f		\N	f		Local	f		0
1051	1	1	7	ER / 0001 / 454 / 1	Jaheer Hussain.B	MALE	1983-10-08 01:00:00-04	32	Family Head	t	Married	6	\N	f	t	t	313	f	f		\N	f	Agar pathi	Local	f		0
1052	1	1	7	ER / 0001 / 454 / 2	Azmathul Aseena.J	FEMALE	1986-10-08 01:00:00-04	29	Wife	f	Married	5	\N	f	t	t	313	f	f		\N	f	Tailor	Local	f		0
1053	1	1	7	ER / 0001 / 454 / 3	AgamathBllal	MALE	2009-10-08 01:00:00-04	6	son	f	Single	U.KG	\N	f	t	f	313	f	f		\N	f	Student	Local	f		0
1054	1	1	7	ER / 0001 / 455 / 1	A.Kadher	MALE	1976-10-08 01:00:00-04	39	Family Head	t	Married		\N	f	t	t	314	f	f		\N	f	T.V Service Center	Local	f		0
1055	1	1	7	ER / 0001 / 455 / 2	M.Mehar Banu	FEMALE	1979-10-08 01:00:00-04	36	Wife	f	Married	10	\N	f	t	t	314	f	f		\N	f	H.W	Local	f		0
1056	1	1	7	ER / 0001 / 456 / 1	E.Kadher Hussain	MALE	1984-10-08 01:00:00-04	31	Family Head	t	Married	8	\N	f	t	t	315	f	f		\N	f	Auto Driver	Local	f		0
1057	1	1	7	ER / 0001 / 456 / 2	Jearina Beagam	FEMALE	1987-10-08 01:00:00-04	28	Wife	f	Married	5	\N	f	t	t	315	f	f		\N	f	Labour	Local	f		0
1058	1	1	7	ER / 0001 / 456 / 3	Anwar Basha.K	MALE	2008-10-08 01:00:00-04	7	son	f	Single	1	\N	f	t	f	315	f	f		\N	f	Student	Local	f		0
1059	1	1	7	ER / 0001 / 456 / 4	Asma	FEMALE	2014-10-08 01:00:00-04	1	Daughter	f	Single		\N	f	t	f	315	f	f		\N	f		Local	f		0
1060	1	1	7	ER / 0001 / 456 / 5	Reshma	FEMALE	2014-10-08 01:00:00-04	1	Daughter	f	Single		\N	f	t	f	315	f	f		\N	f		Local	f		0
1061	1	1	7	ER / 0001 / 457 / 1	A.Saleem	MALE	1980-10-08 01:00:00-04	35	Family Head	t	Married	4	\N	f	t	t	316	f	f		\N	f	.Leather Work	Local	f		0
1062	1	1	7	ER / 0001 / 457 / 2	S.Sarmeela Banu	FEMALE	1988-10-08 01:00:00-04	27	Wife	f	Married	3	\N	f	t	f	316	f	f		\N	f	Tailor	Local	f		0
1063	1	1	7	ER / 0001 / 457 / 3	S.Mohammed Arshed	MALE	2005-10-08 01:00:00-04	10	son	f	Single	3	\N	f	t	f	316	f	f		\N	f	Student	Local	f		0
1064	1	1	7	ER / 0001 / 457 / 4	S.Aafrin Nisha	FEMALE	2008-10-08 01:00:00-04	7	Daughter	f	Single	1	\N	f	t	f	316	f	f		\N	f	Student	Local	f		0
1065	1	1	7	ER / 0001 / 458 / 1	N.Abdul Razak	MALE	1944-10-08 01:00:00-04	71	Family Head	t	Married	5	\N	f	t	t	317	f	f		\N	f		Local	f		0
1066	1	1	7	ER / 0001 / 458 / 2	Raveyath Beagam	FEMALE	1964-10-08 01:00:00-04	51	Wife	f	Married	2	\N	f	t	t	317	f	f		\N	f		Local	f		0
1067	1	1	7	ER / 0001 / 458 / 3	Abuthaheer	MALE	1984-10-08 01:00:00-04	31	Son	f	Single	7	\N	f	t	f	317	f	f		\N	f	Briyani Shop	Local	f		0
1068	1	1	7	ER / 0001 / 458 / 4	Muhammed Hakeem	MALE	1995-10-08 01:00:00-04	20	Son	f	Single	B.E	\N	f	t	f	317	f	f		\N	f	Student	Local	f		0
1069	1	1	7	ER / 0001 / 458 / 5	Sheela Muthu Nisha	FEMALE	1988-10-08 01:00:00-04	27	Daughter	f	Single	9	\N	f	t	t	317	f	f		\N	f	Tailor	Local	f		0
1071	1	1	7	ER / 0001 / 777 / 		MALE	2014-08-08 01:00:00-04	1	.	f	Single	.	\N	f	t	f	319	f	f		\N	f		Local	f		0
1072	1	1	7	ER / 0001 / 778 / 1	A.Zaker hussain	MALE	1982-08-08 01:00:00-04	33	Head	t	Married	10	\N	f	t	t	320	f	f		\N	f	Vegetabel sales	Local	f		0
1073	1	1	7	ER / 0001 / 778 / 2	K.Rahela	FEMALE	1984-08-08 01:00:00-04	31	Wife	f	Married	12	\N	f	t	t	320	f	f		\N	f	House wife	Local	f		0
1074	1	1	7	ER / 0001 / 778 / 3	Z.Surshath Hagamath	MALE	2007-08-08 01:00:00-04	8	M	f	Single	2	\N	f	t	f	320	f	f		\N	f	Student	Local	f		0
1075	1	1	7	ER / 0001 / 778 / 4	Z.mohammed Sukil	MALE	2012-08-08 01:00:00-04	3	M	f	Single	Kid	\N	f	t	f	320	f	f		\N	f	Kid	Local	f		0
1076	1	1	7	ER / 0001 / 779 / 		MALE	2014-08-08 01:00:00-04	1	.	f	Single		\N	f	t	f	321	f	f		\N	f		Local	f		0
1077	1	1	7	ER / 0001 / 780 / 1	A.Sadiq basha	MALE	1976-08-08 01:00:00-04	39	Head	t	Married	9	\N	f	t	t	322	f	f		\N	f	Moter strein workes	Local	f		0
1078	1	1	7	ER / 0001 / 780 / 2	S.sameem	FEMALE	1984-08-08 01:00:00-04	31	Wife	f	Married	9	\N	f	t	t	322	f	f		\N	f	House wife	Local	f		0
1079	1	1	7	ER / 0001 / 780 / 3	S.Anil fathima	FEMALE	2003-08-08 01:00:00-04	12	Doughter	f	Single	6	\N	f	t	f	322	f	f		\N	f	Student	Local	f		0
1080	1	1	7	ER / 0001 / 780 / 4	S.younis	MALE	2007-08-08 01:00:00-04	8	Son	f	Single	2	\N	f	t	f	322	f	f		\N	f	Student	Local	f		0
1081	1	1	7	ER / 0001 / 781 / 		MALE	2014-08-08 01:00:00-04	1	.	f	Single		\N	f	t	f	323	f	f		\N	f		Local	f		0
1083	1	1	7	ER / 0001 / 783 / 1	S.Abdul aziz	MALE	1970-08-08 01:00:00-04	45	Head	t	Married	10	\N	f	t	t	325	f	f		\N	f	Electriction	Local	f		0
1084	1	1	7	ER / 0001 / 783 / 2	A.Mannera bagem	FEMALE	1976-08-08 01:00:00-04	39	Wife	f	Married	6	\N	f	t	t	325	f	f		\N	f	.Home 	Local	f		0
1085	1	1	7	ER / 0001 / 783 / 3	A.imran	MALE	1995-08-08 01:00:00-04	20	Son	f	Single	BE	\N	f	t	t	325	f	f		\N	f	Student	Local	f		0
1086	1	1	7	ER / 0001 / 783 / 4	A.ILLyas	MALE	1996-08-08 01:00:00-04	19	Son	f	Single	DME	\N	f	t	f	325	f	f		\N	f	Student	Local	f		0
1089	1	1	7	ER / 0001 / 785 / 2	A.Jasmeen parveen	FEMALE	1986-08-08 01:00:00-04	29	Wife	f	Married		\N	f	t	f	327	f	f		\N	f	House wife	Local	f		0
1090	1	1	7	ER / 0001 / 785 / 3	Mohammed Toufick	MALE	2008-08-08 01:00:00-04	7	Son	f	Single	1	\N	f	t	f	327	f	f		\N	f	Student	Local	f		0
1091	1	1	7	ER / 0001 / 785 / 4	Afsana Assareen	FEMALE	2011-08-08 01:00:00-04	4	Doughter	f	Single	Kid	\N	f	t	f	327	f	f		\N	f	Kid	Local	f		0
1092	1	1	7	ER / 0001 / 786 / 1	Abdula	MALE	1982-08-19 01:00:00-04	33	Head	t	Married		\N	f	t	f	328	f	f		\N	f	SIPCOT	Local	f		0
1093	1	1	7	ER / 0001 / 786 / 2	Mariyam bevee	FEMALE	1988-08-19 01:00:00-04	27	Wife	f	Married	10	\N	f	t	f	328	f	f		\N	f	House wife	Local	f		0
1094	1	1	7	ER / 0001 / 786 / 3	Rabiga fathima	FEMALE	2008-08-19 01:00:00-04	7	Doughter	f	Single	UKG	\N	f	t	f	328	f	f		\N	f	Student	Local	f		0
1095	1	1	7	ER / 0001 / 786 / 4	Shifana Fathima	FEMALE	2012-08-19 01:00:00-04	3	Doughter	f	Single	Kid	\N	f	t	f	328	f	f		\N	f	Kid	Local	f		0
1096	1	1	7	ER / 0001 / 787 / 1	Abdul kadher	MALE	1984-08-19 01:00:00-04	31	Head	t	Married	BA	\N	f	t	t	329	f	f		\N	f	Immamat sales	Local	f		0
1097	1	1	7	ER / 0001 / 787 / 2	Imrana thasleem	FEMALE	1990-08-19 01:00:00-04	25	Wife	f	Married	BA	\N	f	t	t	329	f	f		\N	f	House wife	Local	f		0
1098	1	1	7	ER / 0001 / 787 / 3	Rubitha	FEMALE	2011-08-19 01:00:00-04	4	Doughter	f	Single	Prekg	\N	f	t	f	329	f	f		\N	f	Student	Local	f		0
1099	1	1	7	ER / 0001 / 787 / 4	Mohammed Ammar	MALE	2012-08-19 01:00:00-04	3	Son	f	Single	Kid	\N	f	t	f	329	f	f		\N	f	Kid	Local	f		0
1100	1	1	7	ER / 0001 / 787 / 5	Julga bevee	FEMALE	1944-08-19 01:00:00-04	71	Mother	f	Married	4	\N	f	t	t	329	f	f		\N	f	.Home 	Local	f		0
1050	1	1	7	ER / 0001 / 453 / 4	Sheik Ashraf.M.S	MALE	2006-10-08 01:00:00-04	9	son	f	Single	3	\N	f	t	f	312	f	f		\N	f	Student	Local	f		0
1109	1	1	7	ER / 0001 / 790 / 		MALE	2014-08-19 01:00:00-04	1		f	Single		\N	f	t	f	332	f	f		\N	f		Local	f		0
173	1	1	7	ER / 0001 / 31 / 1	Nizar Ahmed 	MALE	1974-09-08 01:00:00-04	41	Father 	t	Aged Unmarried Woman	6	\N	f	t	t	52	f	f		\N	f	Baniyan Company Labour	Local	f		0
1120	1	1	7	ER / 0001 / 794 / 3	M.Mohammed abubaker sideq	MALE	2007-08-08 01:00:00-04	8	Son	f	Single	2	\N	f	t	f	336	f	f		\N	f	Student	Local	f		0
27	1	1	7	ER / 0001 / 670 / 1	S.Syed Noor	MALE	1983-10-08 01:00:00-04	32	Family Head	t	Married	SSLC	\N	f	t	t	12	f	f		\N	f	Baniyan Contractor	Local	t	Interest in Aalim/Hifz	0
103	1	1	7	ER / 0001 / 7 / 1	R.Rahman	MALE	1975-09-08 01:00:00-04	40	Husband	t	Aged Unmarried Woman	6	\N	f	t	t	33	f	f		\N	f	Labour	Local	f		0
102	1	1	7	ER / 0001 / 5 / 4	Aasif Ibrahim	MALE	2003-08-09 01:00:00-04	12	Daughter	f	Aged Unmarried Woman	6	\N	f	t	f	32	f	f		\N	f	Student	Local	f		0
117	1	1	7	ER / 0001 / 10 / 4	Mohamed Yasar	MALE	1987-08-09 01:00:00-04	28	Son	f	Aged Unmarried Woman	8	\N	f	t	f	36	f	f		\N	f	Private Employmer	Foreign	f		0
1103	1	1	7	ER / 0001 / 788 / 3	K.Mohamed rizwan	MALE	2008-08-08 01:00:00-04	7	Son	f	Married	1	\N	f	t	f	330	f	f		\N	f	Student	Local	f		0
1104	1	1	7	ER / 0001 / 789 / 1	P.A.Nizar ahamad	MALE	1964-08-08 01:00:00-04	51	Head	t	Married	9	\N	f	t	f	331	f	f		\N	f	Paan sales	Local	f		0
1105	1	1	7	ER / 0001 / 789 / 2	Nooril fasiriya	FEMALE	2014-08-08 01:00:00-04	1	Wife	f	Married		\N	f	t	f	331	f	f		\N	f		Local	f		0
1106	1	1	7	ER / 0001 / 789 / 3	N.Yasmen	FEMALE	1994-08-08 01:00:00-04	21	Doughter	f	Single	12	\N	f	t	f	331	f	f		\N	f	computer	Local	f		0
1107	1	1	7	ER / 0001 / 789 / 4	Mohammed mustafa	MALE	1995-08-08 01:00:00-04	20	Son	f	Single	10	\N	f	t	f	331	f	f		\N	f	Machinice	Local	f		0
1108	1	1	7	ER / 0001 / 789 / 5	Mohammed asif	MALE	1999-08-08 01:00:00-04	16	Son	f	Single	10	\N	f	t	f	331	f	f		\N	f	Student	Local	f		0
1110	1	1	7	ER / 0001 / 791 / 1	M.Mohammed husain	MALE	1952-08-19 01:00:00-04	63	Head	t	Married	5	\N	f	t	t	333	f	f		\N	f	Pical sales	Local	f		0
1111	1	1	7	ER / 0001 / 791 / 2	M.Avamal	FEMALE	1962-08-19 01:00:00-04	53	Wife	f	Married	5	\N	f	t	t	333	f	f		\N	f	Tailar	Local	f		0
1112	1	1	7	ER / 0001 / 791 / 3	M.Magamutha	FEMALE	1988-08-19 01:00:00-04	27	Doughter	f	Single	B.LIT	\N	f	t	t	333	f	f		\N	f	b.lit	Local	f		0
1113	1	1	7	ER / 0001 / 792 / 1	M.Rabiudeen	MALE	1965-08-08 01:00:00-04	50	Head	t	Married	10	\N	f	t	t	334	f	f		\N	f	sleper shop	Local	f		0
1114	1	1	7	ER / 0001 / 792 / 2	R.Sajitha banu	FEMALE	1977-08-08 01:00:00-04	38	Wife	f	Married	8	\N	f	t	t	334	f	f		\N	f	covering gold sales	Local	f		0
1115	1	1	7	ER / 0001 / 792 / 3	R.mohammed salman	MALE	1996-08-08 01:00:00-04	19	Son	f	Single	B.tec	\N	f	t	f	334	f	f		\N	f	Student	Local	f		0
1116	1	1	7	ER / 0001 / 792 / 4	R.nasela parveen	FEMALE	2004-08-08 01:00:00-04	11	Doughter	f	Single	5	\N	f	t	f	334	f	f		\N	f	Student	Local	f		0
1117	1	1	7	ER / 0001 / 793 / 		MALE	2014-08-21 01:00:00-04	1		f	Single		\N	f	t	f	335	f	f		\N	f		Local	f		0
1119	1	1	7	ER / 0001 / 794 / 2	Samsath bagem	FEMALE	1985-08-08 01:00:00-04	30	Wife	f	Married	5	\N	f	t	f	336	f	f		\N	f	Tailar	Local	f		0
1121	1	1	7	ER / 0001 / 794 / 4	M.Ayesha fathema	FEMALE	2009-08-08 01:00:00-04	6	Son	f	Single	1	\N	f	t	f	336	f	f		\N	f	Student	Local	f		0
1122	1	1	7	ER / 0001 / 794 / 5	M.Mohammed yousuf	MALE	2012-08-08 01:00:00-04	3	Son	f	Single	Kid	\N	f	t	f	336	f	f		\N	f	Kid	Local	f		0
1123	1	1	7	ER / 0001 / 795 / 		MALE	2014-08-08 01:00:00-04	1	.	f	Single		\N	f	t	f	337	f	f		\N	f	.	Local	f		0
1124	1	1	7	ER / 0001 / 796 / 1	N.Amer basha	MALE	1962-08-08 01:00:00-04	53	Head	t	Married	2	\N	f	t	t	338	f	f		\N	f	Lorry Driver	Local	f		0
1	1	1	7	ER / 0001 / 659 / 		MALE	2014-10-08 01:00:00-04	1		t	Single		\N	f	t	f	1	f	f		\N	f		Local	f		0
11	1	1	7	ER / 0001 / 664 / 1	S.Jaker Hussain	MALE	1975-10-08 01:00:00-04	40	Family Head	t	Married	SSLC	\N	f	t	t	6	f	f		\N	f	.Sticker Shope	Local	f		0
74	1	1	7	ER / 0001 / 681 / 1	S.Farok Ali	MALE	1986-10-08 01:00:00-04	29	Family Head	t	Married	10	\N	f	t	t	23	f	f		\N	f	A.C.Mechanic	Local	f		0
148	1	1	7	ER / 0001 / 18 / 2	M.Jameela	FEMALE	1972-09-08 01:00:00-04	43	Mother	f	Aged Unmarried Woman	8	\N	f	t	t	44	f	f		\N	f	Tailor	Local	f		0
144	1	1	7	ER / 0001 / 16 / 3	S.Musthafa	MALE	1992-08-09 01:00:00-04	23	Son	f	Aged Unmarried Woman	B.E	\N	f	t	t	42	f	f		\N	f	Student	Local	f		0
288	1	1	7	ER / 0001 / 404 / 3	Haneefa 	MALE	1950-10-08 01:00:00-05	65	Brother in Law	f	Aged Unmarried Woman	Nill	\N	f	t	f	81	f	f		\N	f	No job	Local	f		0
204	1	1	7	ER / 0001 / 41 / 1	A.Rahmathullah	MALE	1965-09-08 01:00:00-04	50	Father 	t	Aged Unmarried Woman	5	\N	f	t	t	62	f	f		\N	f	LIC Agent	Local	f		0
88	1	1	7	ER / 0001 / 2 / 1	P.M.Abdur Rahman	MALE	1958-09-08 01:00:00-04	57	Father	t	Aged Unmarried Woman	7	\N	f	t	t	29	f	f		\N	f	Small Shop	Local	f		0
297	1	1	7	ER / 0001 / 408 / 1	Mahaboo Bhasha	MALE	1968-10-08 01:00:00-04	47	Family Head	t	Married	Nill	\N	f	t	t	85	f	f		\N	f	Labour	Local	f		0
302	1	1	7	ER / 0001 / 408 / 6	Yashmeen	FEMALE	2005-10-08 01:00:00-04	10	Daughter	f	Single	4	\N	f	t	f	85	f	f		\N	f	Student	Local	f		0
343	1	1	7	ER / 0001 / 420 / 1	S.Jaffer ali	MALE	1953-10-08 01:00:00-05	62	Family Head	t	Married	8	\N	f	t	t	97	f	f		\N	f	Tailor	Local	f		0
349	1	1	7	ER / 0001 / 422 / 3	Muhammed Yasar Arafath	MALE	1989-10-08 01:00:00-04	26	Son	f	Married	B.E Mech	\N	f	t	t	99	f	f		\N	f	Lectturer	Local	f		0
373	1	1	7	ER / 0001 / 525 / 1	U.Nagoor Meeran	MALE	1983-10-08 01:00:00-04	32	Family Head	t	Married	3	\N	f	t	t	108	f	f		\N	f	Labour	Local	f		0
401	1	1	7	ER / 0001 / 533 / 4	Aynul Innaya	FEMALE	2001-10-08 01:00:00-04	14	.Grand Daughter	f	Single	8	\N	f	t	f	116	f	f		\N	f	Student	Local	f		0
436	1	1	7	ER / 0001 / 545 / 1	AyishaBeeve.M	FEMALE	1939-10-08 01:00:00-05	76	Family Head	t	Married	2	\N	f	t	t	128	f	f		\N	f	H.W	Local	f		0
452	1	1	7	ER / 0001 / 550 / 2	S.Sabeena Parveen	FEMALE	1988-10-08 01:00:00-04	27	Wife	f	Married	10	\N	f	t	f	133	f	f		\N	f	Tailor	Local	f		0
456	1	1	7	ER / 0001 / 551 / 2	Jannath Beeve	FEMALE	1939-10-08 01:00:00-05	76	Mother	f	Devorced		\N	f	t	t	134	f	f		\N	f	H.W	Local	f		0
494	1	1	7	ER / 0001 / 127 / 2	Shameema	FEMALE	1986-09-08 01:00:00-04	29	Wife	f	Aged Unmarried Woman	10	\N	f	t	t	147	f	f		\N	f	House Wife	Local	f		0
502	1	1	7	ER / 0001 / 129 / 2	Kamarun Nisha	FEMALE	1964-09-08 01:00:00-04	51	Wife	f	Aged Unmarried Woman		\N	f	t	t	149	f	f		\N	f	House Wife	Local	f		0
545	1	1	7	ER / 0001 / 139 / 1	Kaja Maideen	MALE	1970-09-08 01:00:00-04	45	Father	t	Aged Unmarried Woman	7	\N	f	t	t	159	f	f		\N	f	Steel Shop	Local	f		0
550	1	1	7	ER / 0001 / 141 / 1	Akbar Ali	MALE	1976-09-08 01:00:00-04	39	Father	t	Aged Unmarried Woman	6	\N	f	t	t	161	f	f		\N	f	Hotel Servent	Local	f		0
1102	1	1	7	ER / 0001 / 788 / 2	K.Najera	FEMALE	1980-08-08 01:00:00-04	35	Wife	f	Married		\N	f	t	t	330	f	f		\N	f	Nerus	Local	f		0
198	1	1	7	ER / 0001 / 40 / 1	E.Jameela Beevi	FEMALE	1950-09-08 01:00:00-04	65	Mother	t	Aged Unmarried Woman		\N	f	t	t	61	f	f		\N	f		Local	f		0
580	1	1	7	ER / 0001 / 150 / 2	Mubeena Beevi	FEMALE	1954-09-08 01:00:00-04	61	Mother	f	Aged Unmarried Woman		\N	f	t	t	170	f	f		\N	f	House Wife	Local	f		0
600	1	1	7	ER / 0001 / 155 / 1	Abdur Razak	MALE	1955-09-08 01:00:00-04	60	Father	t	Aged Unmarried Woman	6	\N	f	t	t	175	f	f		\N	f	Auto Driver	Local	f		0
612	1	1	7	ER / 0001 / 161 / 2	K.Parveen Banu	FEMALE	1974-09-08 01:00:00-04	41	Mother	f	Aged Unmarried Woman		\N	f	t	t	181	f	f		\N	f	House Wife	Local	f		0
652	2	2	26	TP / 0001 / 98 / 2	Sameem Banu	FEMALE	1991-11-13 09:48:54.937839-05	24	Mother	f	Single	10	\N	f	t	f	198	f	f		\N	f	Rest	Local	f		0
674	2	2	26	TP / 0001 / 104 / 2	Sukkuriar Begam	FEMALE	1966-11-13 09:48:55.781274-05	49	Mother	f	Aged Unmarried Woman	6	\N	f	t	t	204	f	f		\N	f	House Wife	Local	f		0
701	2	2	26	TP / 0001 / 114 / 1	Syed Abuthahir	MALE	1979-11-13 09:48:57.066811-05	36	Father	t	Aged Unmarried Woman	7	\N	f	t	t	213	f	f		\N	f	Labour	Local	f		0
731	2	2	26	TP / 0001 / 122 / 2	Rukkaiyya Begam	FEMALE	1983-11-13 09:48:57.980889-05	32	Wife	f	Aged Unmarried Woman	6	\N	f	t	t	221	f	f		\N	f	House Wife	Outstation	f		0
750	2	2	26	TP / 0001 / 128 / 4	Mohamed Ibrahim	MALE	2007-11-13 09:48:58.419204-05	8	Grand Son	f	Single	3	\N	f	t	f	225	f	f		\N	f	Student	Local	f		0
760	2	2	26	TP / 0001 / 131 / 1	Asraf Begam	FEMALE	1993-11-13 09:48:58.640403-05	22	Mother	t	Aged Unmarried Woman	3	\N	f	t	t	228	f	f		\N	f	House Wife	Local	f		0
775	2	2	26	TP / 0001 / 136 / 2	Maimoon Beevi	FEMALE	1970-11-13 09:48:59.022781-05	45	Mother	f	Aged Unmarried Woman	6	\N	f	t	t	233	f	f		\N	f	House Wife	Local	f		0
800	2	2	26	TP / 0001 / 142 / 4	Nazriya	FEMALE	2013-11-13 09:48:59.710608-05	2	Daughter	f	Single		\N	f	t	f	239	f	f		\N	f		Local	f		0
805	2	2	26	TP / 0001 / 144 / 1	H.Syed Ibrahim	MALE	1980-11-13 09:48:59.820831-05	35	Father	t	Aged Unmarried Woman	10	\N	f	t	t	241	f	f		\N	f	Labour	Local	f		0
847	2	2	26	TP / 0001 / 163 / 1	Rahmath Nisha	FEMALE	1983-11-13 09:49:00.950247-05	32	Mother	t	Aged Unmarried Woman	5	\N	f	t	t	255	f	f		\N	f	House Wife	Outstation	f		0
850	2	2	26	TP / 0001 / 163 / 4	Sowmiya Parveen	FEMALE	2008-11-13 09:49:01.028808-05	7	Daughter	f	Single	2	\N	f	t	f	255	f	f		\N	f	Student	Local	f		0
855	2	2	26	TP / 0001 / 166 / 2	Syed Abuthahir	MALE	1982-11-13 09:49:01.204927-05	33	Son	f	Aged Unmarried Woman	B.B.A	\N	f	t	t	258	f	f		\N	f	Labour	Local	f		0
890	2	2	26	TP / 0001 / 179 / 1	A.R.Syed Ibrahim	MALE	1965-11-13 09:49:02.003791-05	50	Father	t	Aged Unmarried Woman	8	\N	f	t	t	269	f	f		\N	f	Own Business	Outstation	f		0
899	2	2	26	TP / 0001 / 181 / 2	Tahhira Banu	FEMALE	1980-11-13 09:49:02.218161-05	35	Mother	f	Aged Unmarried Woman	8	\N	f	t	t	271	f	f		\N	f	House Wife	Local	f		0
938	2	2	26	TP / 0001 / 192 / 2	Fowziya Begam	FEMALE	1963-11-13 09:49:03.103878-05	52	Mother	f	Aged Unmarried Woman	6	\N	f	t	t	280	f	f		\N	f	House Wife	Local	f		0
947	2	2	26	TP / 0001 / 195 / 2	Sajitha 	FEMALE	1984-11-13 09:49:03.311271-05	31	Mother	f	Aged Unmarried Woman	6	\N	f	t	t	283	f	f		\N	f	House Wife	Local	f		0
959	2	2	26	TP / 0001 / 199 / 1	A.Shahul Hameed	MALE	1954-11-13 09:49:03.586778-05	61	Father	t	Aged Unmarried Woman	B.SC	\N	f	t	t	287	f	f		\N	f	Officer	Local	f		0
997	1	1	7	ER / 0001 / 440 / 2	Sahitha Bana	FEMALE	1984-10-08 01:00:00-04	31	Wife	f	Married		\N	f	t	t	299	f	f		\N	f	Beauty Parler	Local	f		0
1011	1	1	7	ER / 0001 / 444 / 1	K.V.Sheik Abdul Kadher	MALE	1974-10-08 01:00:00-04	41	Family Head	t	Married	B.M.E	\N	f	t	t	303	f	f		\N	f	Mechanic work	Local	f		0
1048	1	1	7	ER / 0001 / 453 / 2	Sabeeya.N.A	FEMALE	1980-10-08 01:00:00-04	35	Wife	f	Married	12	\N	f	t	t	312	f	f		\N	f	Tailor	Local	f		0
1049	1	1	7	ER / 0001 / 453 / 3	Sheik Parvesh.M.S	MALE	2005-10-08 01:00:00-04	10	son	f	Single	4	\N	f	t	f	312	f	f		\N	f	Student	Local	f		0
1088	1	1	7	ER / 0001 / 785 / 1	K.Abuthager	MALE	1980-08-08 01:00:00-04	35	Head	t	Married	BBM	\N	f	t	t	327	f	f		\N	f	Cloth and cell shop	Local	f		0
1101	1	1	7	ER / 0001 / 788 / 1	M.Kaja moiunudeen	MALE	1977-08-08 01:00:00-04	38	Head	t	Married	10	\N	f	t	t	330	f	f		\N	f	Auto driver	Local	f		0
1118	1	1	7	ER / 0001 / 794 / 1	R.mohammed ismail	MALE	1979-08-08 01:00:00-04	36	Head	t	Married	8	\N	f	t	t	336	f	f		\N	f	Mutten shop and Driver	Local	f		0
1125	1	1	7	ER / 0001 / 796 / 2	A.anarkali	FEMALE	1965-08-08 01:00:00-04	50	Wife	f	Married	4	\N	f	t	t	338	f	f		\N	f	House wife	Local	f		0
1126	1	1	7	ER / 0001 / 796 / 3	A.parveen banu	FEMALE	1991-08-08 01:00:00-04	24	Doughter	f	Single	8	\N	f	t	t	338	f	f		\N	f	Tailar	Local	f		0
1127	1	1	7	ER / 0001 / 796 / 4	A.Nejam	MALE	1993-08-08 01:00:00-04	22	Son	f	Single	12	\N	f	t	f	338	f	f		\N	f	steal paterai	Local	f		0
1128	1	1	7	ER / 0001 / 796 / 5	A.Refana	FEMALE	1995-08-08 01:00:00-04	20	Doughter	f	Single	12	\N	f	t	f	338	f	f		\N	f	System Work	Local	f		0
1129	1	1	7	ER / 0001 / 797 / 		MALE	2014-08-21 01:00:00-04	1		f	Single		\N	f	t	f	339	f	f		\N	f		Local	f		0
1130	1	1	7	ER / 0001 / 798 / 1	K.shagul hamed	MALE	1951-08-08 01:00:00-04	64	Head	t	Married	4	\N	f	t	t	340	f	f		\N	f	.Home 	Local	f		0
1131	1	1	7	ER / 0001 / 798 / 2	S.Nagemunisha	FEMALE	1959-08-08 01:00:00-04	56	Wife	f	Married		\N	f	t	t	340	f	f		\N	f	House wife	Local	f		0
1132	1	1	7	ER / 0001 / 798 / 3	S.Saber hamad	MALE	1983-08-08 01:00:00-04	32	Son	f	Married	10	\N	f	t	t	340	f	f		\N	f	Fance store	Local	f		0
1133	1	1	7	ER / 0001 / 798 / 4	S.Bevee jon	FEMALE	1985-08-08 01:00:00-04	30	.Doughter in law	f	Married	10	\N	f	t	t	340	f	f		\N	f		Local	f		0
1134	1	1	7	ER / 0001 / 798 / 5	S.Vameha fathima	FEMALE	2011-08-08 01:00:00-04	4	.Grand doughter	f	Single	Kid	\N	f	t	f	340	f	f		\N	f	Kid	Local	f		0
1135	1	1	7	ER / 0001 / 799 / 1	Mohammed ismail	MALE	1967-08-16 01:00:00-04	48	Head	t	Married	12	\N	f	t	f	341	f	f		\N	f	Laber	Local	f		0
1136	1	1	7	ER / 0001 / 799 / 2	Narkes banu	FEMALE	1975-08-16 01:00:00-04	40	Wife	f	Married	7	\N	f	t	f	341	f	f		\N	f	House wife	Local	f		0
1137	1	1	7	ER / 0001 / 799 / 3	Mohammed musthfa	MALE	1995-08-16 01:00:00-04	20	Son	f	Single	BE	\N	f	t	f	341	f	f		\N	f	Student	Local	f		0
1138	1	1	7	ER / 0001 / 799 / 4	Mohammed ibrahim	MALE	1997-08-16 01:00:00-04	18	Son	f	Single	12	\N	f	t	f	341	f	f		\N	f	Student	Local	f		0
1139	1	1	7	ER / 0001 / 799 / 5	Jamela thabeya	FEMALE	2000-08-16 01:00:00-04	15	Doughter	f	Single	10	\N	f	t	f	341	f	f		\N	f	Student	Local	f		0
1140	1	1	7	ER / 0001 / 799 / 6	Barkat fiysenisha	FEMALE	2010-08-16 01:00:00-04	5	Doughter	f	Single	LKG	\N	f	t	f	341	f	f		\N	f	Student	Local	f		0
1141	1	1	7	ER / 0001 / 51 / 1	Jamruth	FEMALE	1979-09-08 01:00:00-04	36	Mother	t	Widow	8 Std	\N	f	t	f	342	f	f		\N	f	Company worker	Local	f		0
1142	1	1	7	ER / 0001 / 51 / 2	Nasar	MALE	1995-11-13 09:49:09.797534-05	20	Son	f	Single	8 Std	\N	f	t	t	342	f	f		\N	f	Weider	Local	f		0
1143	1	1	7	ER / 0001 / 52 / 1	Mahabub	MALE	1957-11-13 09:49:09.820995-05	58	Father	t	Married	3 Std	\N	f	t	t	343	f	f		\N	f	Cycle Shop	Local	f		0
1144	1	1	7	ER / 0001 / 52 / 2	Fathima	FEMALE	1975-11-13 09:49:09.840477-05	40	Mother	f	Married		\N	f	t	t	343	f	f		\N	f	Home maker	Local	f		0
1145	1	1	7	ER / 0001 / 52 / 3	Sheik Dawood	MALE	1998-11-13 09:49:09.859109-05	17	Son	f	Single	8 Std	\N	f	t	f	343	f	f		\N	f	Company worker	Local	f		0
1146	1	1	7	ER / 0001 / 52 / 4	Ammaji	FEMALE	1945-11-13 09:49:09.886645-05	70	G.mother	f	Widow		\N	f	t	f	343	f	f		\N	f	Rest	Local	f		0
1147	1	1	7	ER / 0001 / 53 / 1	Mohamed Ali	MALE	1963-11-13 09:49:09.922059-05	52	Father	t	Married	8 Std	\N	f	t	t	344	f	f		\N	f	Consiler	Local	f		0
1148	1	1	7	ER / 0001 / 53 / 2	Nasrin	FEMALE	1970-11-13 09:49:09.941862-05	45	Mother	f	Married	8 Std	\N	f	t	t	344	f	f		\N	f	Home maker	Local	f		0
1149	1	1	7	ER / 0001 / 53 / 3	Thasleema	FEMALE	1993-11-13 09:49:09.960765-05	22	Daugter	f	Single	UG	\N	f	t	t	344	f	f		\N	f		Local	f		0
1150	1	1	7	ER / 0001 / 53 / 4	sakid Ahmed	MALE	1995-11-13 09:49:09.979595-05	20	Son	f	Single	DME	\N	f	t	f	344	f	f		\N	f	Search Job	Local	f		0
1151	1	1	7	ER / 0001 / 53 / 5	Ujath Ahmed	MALE	1998-11-13 09:49:10.002808-05	17	Son	f	Single	11 Std	\N	f	t	f	344	f	f		\N	f	Student	Local	f		0
1152	1	1	7	ER / 0001 / 53 / 6	Mohamed Riyaz	MALE	1992-11-13 09:49:10.026525-05	23		f	Single	10 Std	\N	f	t	f	344	f	f		\N	f	Shop	Local	f		0
1153	1	1	7	ER / 0001 / 54 / 1	Sahul Hameed	MALE	1972-11-13 09:49:10.048154-05	43	Father	t	Married	10 Std	\N	f	t	t	345	f	f		\N	f	Tailoring	Local	f		0
1154	1	1	7	ER / 0001 / 54 / 2	Rizwan Parveen	FEMALE	1981-11-13 09:49:10.064523-05	34	Mother	f	Married	6 Std	\N	f	t	t	345	f	f		\N	f	Know Tailoring	Local	f		0
1155	1	1	7	ER / 0001 / 54 / 3	Mohamed Wasil	MALE	1997-11-13 09:49:10.083078-05	18	Son	f	Single	UG	\N	f	t	f	345	f	f		\N	f	Student	Local	f		0
1156	1	1	7	ER / 0001 / 54 / 4	Fathima	FEMALE	1998-11-13 09:49:10.105398-05	17	Daugter	f	Single	12 Std	\N	f	t	f	345	f	f		\N	f	Student	Local	f		0
1157	1	1	7	ER / 0001 / 54 / 5	Firose	FEMALE	2002-11-13 09:49:10.12769-05	13	Daugter	f	Single	8 Std	\N	f	t	f	345	f	f		\N	f	Student	Local	f		0
1158	1	1	7	ER / 0001 / 55 / 1	Babu John 	MALE	1968-11-13 09:49:10.150288-05	47	Father	t	Married		\N	f	t	t	346	f	f		\N	f	Painter	Local	f		0
1159	1	1	7	ER / 0001 / 55 / 2	Jarina	FEMALE	1970-11-13 09:49:10.174968-05	45	Mother	f	Married	8 Std	\N	f	t	t	346	f	f		\N	f	Home maker	Local	f		0
1160	1	1	7	ER / 0001 / 56 / 1	shakirudin	FEMALE	1952-11-13 09:49:10.193725-05	63	Mother	t	Widow	11 Std	\N	f	t	t	347	f	f		\N	f	Rest	Local	f		0
1161	1	1	7	ER / 0001 / 56 / 2	Rasool	MALE	1991-11-13 09:49:10.218088-05	24	Son	f	Single	10 Std	\N	f	t	t	347	f	f		\N	f	Typing Work	Local	f		0
1162	1	1	7	ER / 0001 / 57 / 1	alavudin	MALE	1978-11-13 09:49:10.2364-05	37	Father	t	Married	4 std	\N	f	t	t	348	f	f		\N	f	Cooli	Local	f		0
1163	1	1	7	ER / 0001 / 57 / 2	Mubarak Begam	FEMALE	1980-11-13 09:49:10.260319-05	35	Mother	f	Married	2 Std	\N	f	t	t	348	f	f		\N	f	Home maker	Local	f		0
1164	1	1	7	ER / 0001 / 57 / 3	Narkis Begam	FEMALE	2002-11-13 09:49:10.278558-05	13	Daugter	f	Single	7 Std	\N	f	t	f	348	f	f		\N	f	Student	Local	f		0
1165	1	1	7	ER / 0001 / 57 / 4	Kadar Basha	MALE	2010-11-13 09:49:10.297107-05	5	Son	f	Single		\N	f	t	f	348	f	f		\N	f	Baby	Local	f		0
1166	1	1	7	ER / 0001 / 58 / 1	Sulthan	MALE	1967-11-13 09:49:10.31465-05	48	Father	t	Married	10 Std	\N	f	t	t	349	f	f		\N	f	Weider	Local	f		0
1167	1	1	7	ER / 0001 / 58 / 2	Shakila Banu	FEMALE	1969-11-13 09:49:10.334423-05	46	Mother	f	Married	12 Std	\N	f	t	t	349	f	f		\N	f	Account work	Local	f		0
1168	1	1	7	ER / 0001 / 58 / 3	Sameer Ahmed	MALE	1993-11-13 09:49:10.352528-05	22	Son	f	Single	10 Std	\N	f	t	t	349	f	f		\N	f	Medical Store work	Local	f		0
1169	1	1	7	ER / 0001 / 58 / 4	sahanas	FEMALE	1994-11-13 09:49:10.375258-05	21	Daugter	f	Single	12 Std	\N	f	t	t	349	f	f		\N	f	Tailoring	Local	f		0
1170	1	1	7	ER / 0001 / 59 / 1	Habeebull	MALE	1951-11-13 09:49:10.39786-05	64	Father	t	Married	6 Std	\N	f	t	t	350	f	f		\N	f	Rest	Local	f		0
1171	1	1	7	ER / 0001 / 60 / 1	Mohamed Musthafa	MALE	1975-11-13 09:49:10.422968-05	40	Father	t	Married	6 Std	\N	f	t	t	351	f	f		\N	f	Puncher Shop	Local	f		0
1172	1	1	7	ER / 0001 / 60 / 2	Masthan Begam	FEMALE	1985-11-13 09:49:10.442268-05	30	Mother	f	Married	12 Std	\N	f	t	t	351	f	f		\N	f	Know Tailoring	Local	f		0
1173	1	1	7	ER / 0001 / 60 / 3	Ribana Begam	FEMALE	2003-11-13 09:49:10.459988-05	12	Daugter	f	Single	6 Std	\N	f	t	f	351	f	f		\N	f	Student	Local	f		0
1174	1	1	7	ER / 0001 / 60 / 4	Rasitha Begam	FEMALE	2006-11-13 09:49:10.477961-05	9	Daugter	f	Single	3 Std	\N	f	t	f	351	f	f		\N	f	Student	Local	f		0
1175	1	1	7	ER / 0001 / 61 / 1	Jamila Bevi	FEMALE	1955-11-13 09:49:10.495668-05	60	Mother	t	Widow		\N	f	t	t	352	f	f		\N	f	Home maker	Local	f		0
1176	1	1	7	ER / 0001 / 61 / 2	Sathik Basha	MALE	1980-11-13 09:49:10.520155-05	35	Son	f	Married	8 Std	\N	f	t	t	352	f	f		\N	f	Auto Driver	Local	f		0
1177	1	1	7	ER / 0001 / 61 / 3	Rajina	FEMALE	1987-11-13 09:49:10.538863-05	28	Dau.In.Law	f	Married	8 Std	\N	f	t	t	352	f	f		\N	f	Home maker	Local	f		0
1178	1	1	7	ER / 0001 / 61 / 4	Mohamed Thoufeeq	MALE	2005-11-13 09:49:10.557281-05	10	G.Son	f	Single	4 std	\N	f	t	f	352	f	f		\N	f	Student	Local	f		0
1179	1	1	7	ER / 0001 / 62 / 1	Mohamed Ibrahim	MALE	1982-11-13 09:49:10.57773-05	33	Father	t	Married	4 std	\N	f	t	t	353	f	f		\N	f	Electrical	Local	f		0
1180	1	1	7	ER / 0001 / 62 / 2	Rahamath Nisha	FEMALE	1988-11-13 09:49:10.593764-05	27	Mother	f	Married	10 Std	\N	f	t	t	353	f	f		\N	f	Tailoring	Local	f		0
1181	1	1	7	ER / 0001 / 63 / 1	Babu 	MALE	1967-11-13 09:49:10.613585-05	48	Father	t	Married	5 Std	\N	f	t	t	354	f	f		\N	f	Cycle Shop	Local	f		0
1182	1	1	7	ER / 0001 / 63 / 2	Banu	FEMALE	1980-11-13 09:49:10.635495-05	35	Mother	f	Married	6 Std	\N	f	t	t	354	f	f		\N	f	Home maker	Local	f		0
1183	1	1	7	ER / 0001 / 63 / 3	Barakath Nisha	FEMALE	2001-11-13 09:49:10.654747-05	14	Daugter	f	Single	10 Std	\N	f	t	f	354	f	f		\N	f	Student	Local	f		0
1184	1	1	7	ER / 0001 / 64 / 1	Mohamed Moideen	MALE	1942-11-13 09:49:10.684393-04	73	Father	t	Married	5 Std	\N	f	t	t	355	f	f		\N	f	Watch Man	Local	f		0
1185	1	1	7	ER / 0001 / 64 / 2	Jaka Jothi Nisha	FEMALE	1946-11-13 09:49:10.709902-05	69	Mother	f	Married		\N	f	t	t	355	f	f		\N	f	Home maker	Local	f		0
1186	1	1	7	ER / 0001 / 65 / 1	Syed Ali	MALE	1964-11-13 09:49:10.728289-05	51	Father	t	Married		\N	f	t	t	356	f	f		\N	f	Fruit Sales Man	Local	f		0
1187	1	1	7	ER / 0001 / 65 / 2	Samsath	FEMALE	1973-11-13 09:49:10.749017-05	42	Mother	f	Married		\N	f	t	t	356	f	f		\N	f	Home maker	Local	f		0
1188	1	1	7	ER / 0001 / 65 / 3	Masoor Ali	MALE	1993-11-13 09:49:10.771487-05	22	Son	f	Single	Diplomo	\N	f	t	t	356	f	f		\N	f	training	Local	f		0
1189	1	1	7	ER / 0001 / 66 / 1	Kulfeer	MALE	1960-11-13 09:49:10.7899-05	55	Father	t	Married	5 Std	\N	f	t	t	357	f	f		\N	f	Shoper	Local	f		0
1190	1	1	7	ER / 0001 / 66 / 2	Kursik	FEMALE	1970-11-13 09:49:10.81-05	45	Mother	f	Married		\N	f	t	t	357	f	f		\N	f	Home maker	Local	f		0
1191	1	1	7	ER / 0001 / 67 / 1	Syed Yunus	MALE	1948-11-13 09:49:10.830788-05	67	Father	t	Married	5 Std	\N	f	t	t	358	f	f		\N	f	Watch Man	Local	f		0
1192	1	1	7	ER / 0001 / 67 / 2	Haleema	FEMALE	1959-11-13 09:49:10.847412-05	56	Mother	f	Married	5 Std	\N	f	t	t	358	f	f		\N	f	Home maker	Local	f		0
1193	1	1	7	ER / 0001 / 68 / 1	Mabu	MALE	1952-11-13 09:49:10.868471-05	63	Father	t	Married	1 Std	\N	f	t	t	359	f	f		\N	f	Cycle Shop	Local	f		0
1194	1	1	7	ER / 0001 / 68 / 2	Mumthaj	FEMALE	1960-11-13 09:49:10.89618-05	55	Mother	f	Married	1 Std	\N	f	t	t	359	f	f		\N	f	Home maker	Local	f		0
1195	1	1	7	ER / 0001 / 69 / 1	Syed	MALE	1970-11-13 09:49:10.91545-05	45	Father	t	Married		\N	f	t	t	360	f	f		\N	f	Cycle Shop	Local	f		0
1196	1	1	7	ER / 0001 / 69 / 2	Banu Begam	FEMALE	1975-11-13 09:49:10.930956-05	40	Mother	f	Married		\N	f	t	t	360	f	f		\N	f	Home maker	Local	f		0
1197	1	1	7	ER / 0001 / 69 / 3	Sheik Dawood	MALE	1994-11-13 09:49:10.949259-05	21	Son	f	Married	8 Std	\N	f	t	t	360	f	f		\N	f	Tailoring	Local	f		0
1198	1	1	7	ER / 0001 / 69 / 4	Faritha	FEMALE	1995-11-13 09:49:10.967275-05	20	Dau.In.Law	f	Married		\N	f	t	f	360	f	f		\N	f	Know Tailoring	Local	f		0
1199	1	1	7	ER / 0001 / 69 / 5	Mohamed Anas	MALE	2004-11-13 09:49:10.985376-05	11	G.Son	f	Single		\N	f	t	f	360	f	f		\N	f	Baby	Local	f		0
1200	1	1	7	ER / 0001 / 70 / 1	Kaleel Rahman	MALE	1962-11-13 09:49:11.003461-05	53	Father	t	Married	10 Std	\N	f	t	t	361	f	f		\N	f	Tele Caller	Local	f		0
1201	1	1	7	ER / 0001 / 70 / 2	Mumthaj	FEMALE	1971-11-13 09:49:11.023357-05	44	Mother	f	Married	10 Std	\N	f	t	t	361	f	f		\N	f	Home maker	Local	f		0
1202	1	1	7	ER / 0001 / 70 / 3	Mohamed Azad	MALE	1995-11-13 09:49:11.041818-05	20	Son	f	Single	UG	\N	f	t	f	361	f	f		\N	f	Student	Local	f		0
1203	1	1	7	ER / 0001 / 70 / 4	Inul Ribana	FEMALE	2001-11-13 09:49:11.064549-05	14	Daugter	f	Single	9 Std	\N	f	t	f	361	f	f		\N	f	Student	Local	f		0
1204	1	1	7	ER / 0001 / 71 / 1	Maraikayar	MALE	1985-11-13 09:49:11.082491-05	30	Father	t	Married	6 Std	\N	f	t	t	362	f	f		\N	f	Weider	Local	f		0
1205	1	1	7	ER / 0001 / 71 / 2	Farjana	FEMALE	1996-11-13 09:49:11.09805-05	19	Mother	f	Married	12 Std	\N	f	t	t	362	f	f		\N	f	Home maker	Local	f		0
1206	1	1	7	ER / 0001 / 71 / 3	Mohamed Arif	MALE	2013-11-13 09:49:11.117394-05	2	Son	f	Single		\N	f	t	f	362	f	f		\N	f	Baby	Local	f		0
1207	1	1	7	ER / 0001 / 72 / 1	Mohamed Ali	MALE	1958-11-13 09:49:11.136737-05	57	Father	t	Married	7 Std	\N	f	t	t	363	f	f		\N	f	Real Estate	Local	f		0
1208	1	1	7	ER / 0001 / 72 / 2	Mumthaj	FEMALE	1961-11-13 09:49:11.152689-05	54	Mother	f	Married	5 Std	\N	f	t	t	363	f	f		\N	f	Home maker	Local	f		0
1209	1	1	7	ER / 0001 / 72 / 3	aleef Rose	FEMALE	1992-11-13 09:49:11.173265-05	23	Daugter	f	Single	7 Std	\N	f	t	f	363	f	f		\N	f		Local	f		0
1210	1	1	7	ER / 0001 / 73 / 1	Noor Mohamed	MALE	1965-11-13 09:49:11.191601-05	50	Father	t	Married	8 Std	\N	f	t	t	364	f	f		\N	f	Cooli	Local	f		0
1211	1	1	7	ER / 0001 / 73 / 2	Shakila Banu	FEMALE	1975-11-13 09:49:11.2073-05	40	Mother	f	Married	7 Std	\N	f	t	t	364	f	f		\N	f	Home maker	Local	f		0
1212	1	1	7	ER / 0001 / 73 / 3	Mohamed Saleem	MALE	1980-11-13 09:49:11.283824-05	35	Son	f	Married	10 Std	\N	f	t	t	364	f	f		\N	f	Driver	Local	f		0
1213	1	1	7	ER / 0001 / 73 / 4	sabuthama	FEMALE	1990-11-13 09:49:11.304205-05	25	Dau.In.Law	f	Married	10 Std	\N	f	t	t	364	f	f		\N	f	Know Tailoring	Local	f		0
1214	1	1	7	ER / 0001 / 73 / 5	Mohamed Anwar	MALE	2008-11-13 09:49:11.329613-05	7	G.Son	f	Single	2 Std	\N	f	t	f	364	f	f		\N	f	Student	Local	f		0
1215	1	1	7	ER / 0001 / 74 / 1	sharif Khan	MALE	1961-11-13 09:49:11.349734-05	54	Father	t	Married	5 Std	\N	f	t	t	365	f	f		\N	f	Weider	Local	f		0
1216	1	1	7	ER / 0001 / 74 / 2	Kalimu Nisha	FEMALE	1969-11-13 09:49:11.369467-05	46	Mother	f	Married	6 Std	\N	f	t	t	365	f	f		\N	f	Home maker	Local	f		0
1217	1	1	7	ER / 0001 / 74 / 3	Barakathull	MALE	1984-11-13 09:49:11.388109-05	31	Son	f	Married	10 Std	\N	f	t	t	365	f	f		\N	f	Cell service	Local	f		0
1218	1	1	7	ER / 0001 / 74 / 4	Najiya	FEMALE	1988-11-13 09:49:11.407866-05	27	Dau.In.Law	f	Aged Unmarried Woman	PG	\N	f	t	t	365	f	f		\N	f	Beauty Parlar	Local	f		0
1219	1	1	7	ER / 0001 / 74 / 5	Tholath Najinin	MALE	2012-11-13 09:49:11.426937-05	3	G.Son	f	Single	PKG	\N	f	t	f	365	f	f		\N	f	Student	Local	f		0
1220	1	1	7	ER / 0001 / 75 / 1	Meera Sayib	MALE	1938-11-13 09:49:11.445102-05	77	Father	t	Married		\N	f	t	t	366	f	f		\N	f	Cooli	Local	f		0
1221	1	1	7	ER / 0001 / 75 / 2	Joharama	FEMALE	1950-11-13 09:49:11.464894-05	65	Mother	f	Married	2 Std	\N	f	t	t	366	f	f		\N	f	Home maker	Local	f		0
1222	1	1	7	ER / 0001 / 75 / 3	Hakim	MALE	1980-11-13 09:49:11.483373-05	35	Son	f	Married	7 Std	\N	f	t	t	366	f	f		\N	f	Car Parking work	Local	f		0
1223	1	1	7	ER / 0001 / 75 / 4	Subaitha	FEMALE	1990-11-13 09:49:11.501945-05	25	Dau.In.Law	f	Married	5 Std	\N	f	t	t	366	f	f		\N	f	Home maker	Local	f		0
1224	1	1	7	ER / 0001 / 76 / 1	Musthafa	MALE	1954-11-13 09:49:11.51988-05	61	Father	t	Married	11 Std	\N	f	t	t	367	f	f		\N	f	Rest	Local	f		0
1226	1	1	7	ER / 0001 / 76 / 3	Abbas	MALE	1994-11-13 09:49:11.562365-05	21	Son	f	Single	Diplomo	\N	f	t	t	367	f	f		\N	f	Cooli (company work	Local	f		0
1227	1	1	7	ER / 0001 / 77 / 1	Korima Bevi	FEMALE	1953-11-13 09:49:11.580054-05	62	Mother	t	Widow	5 Std	\N	f	t	t	368	f	f		\N	f	Self Work	Local	f		0
1228	1	1	7	ER / 0001 / 78 / 1	Asraf Ali	MALE	1972-11-13 09:49:11.616493-05	43	Father	t	Married	7 Std	\N	f	t	t	369	f	f		\N	f	Machanic	Local	f		0
1229	1	1	7	ER / 0001 / 78 / 2	Safiya Banu	FEMALE	1980-11-13 09:49:11.654202-05	35	Mother	f	Married	8 Std	\N	f	t	t	369	f	f		\N	f	Know Tailoring	Local	f		0
1230	1	1	7	ER / 0001 / 78 / 3	Barakath Nisha	FEMALE	1998-11-13 09:49:11.68912-05	17	Daugter	f	Single	12 Std	\N	f	t	f	369	f	f		\N	f	Student	Local	f		0
1231	1	1	7	ER / 0001 / 78 / 4	Thasleema	FEMALE	2004-11-13 09:49:11.733133-05	11	Daugter	f	Single	7 Std	\N	f	t	f	369	f	f		\N	f	Student	Local	f		0
1232	1	1	7	ER / 0001 / 79 / 1	Babu	MALE	1975-11-13 09:49:11.774929-05	40	Father	t	Married	7 Std	\N	f	t	t	370	f	f		\N	f	Auto Driver	Local	f		0
1233	1	1	7	ER / 0001 / 79 / 2	Savitha Banu	FEMALE	1976-11-13 09:49:11.812365-05	39	Mother	f	Married		\N	f	t	t	370	f	f		\N	f	Self Work	Local	f		0
1234	1	1	7	ER / 0001 / 79 / 3	Yasmeen	FEMALE	1997-11-13 09:49:11.848462-05	18	Daugter	f	Single	12 Std	\N	f	t	f	370	f	f		\N	f		Local	f		0
1235	1	1	7	ER / 0001 / 79 / 4	Anisha Banu	FEMALE	1999-11-13 09:49:11.883391-05	16	Daugter	f	Single	11 Std	\N	f	t	f	370	f	f		\N	f	Student	Local	f		0
1236	1	1	7	ER / 0001 / 80 / 1	Sahul Hameed	MALE	1950-11-13 09:49:11.9209-05	65	Father	t	Married	7 Std	\N	f	t	t	371	f	f		\N	f	Paku Business	Local	f		0
1237	1	1	7	ER / 0001 / 80 / 2	Fathima Bevi	FEMALE	1960-11-13 09:49:11.963051-05	55	Mother	f	Married	3 Std	\N	f	t	t	371	f	f		\N	f	Home maker	Local	f		0
1238	1	1	7	ER / 0001 / 81 / 1	Mohamed Rafiq	MALE	1980-11-13 09:49:12.000299-05	35	Father	t	Married	10 Std	\N	f	t	t	372	f	f		\N	f	Electrical	Local	f		0
1239	1	1	7	ER / 0001 / 81 / 2	Aysha Meharu Banu	FEMALE	1989-11-13 09:49:12.029522-05	26	Mother	f	Married	10 Std	\N	f	t	t	372	f	f		\N	f	Home maker	Local	f		0
1240	1	1	7	ER / 0001 / 81 / 3	Abdul Kadar	MALE	2010-11-13 09:49:12.064348-05	5	Son	f	Single	3 Std	\N	f	t	f	372	f	f		\N	f	Student	Local	f		0
1241	1	1	7	ER / 0001 / 81 / 4	Ajirin	FEMALE	2012-11-13 09:49:12.096217-05	3	Daugter	f	Single		\N	f	t	f	372	f	f		\N	f	Baby	Local	f		0
1242	1	1	7	ER / 0001 / 82 / 1	Kalibull	MALE	1974-11-13 09:49:12.124924-05	41	Father	t	Married	6 Std	\N	f	t	t	373	f	f		\N	f	Paku Business	Local	f		0
1243	1	1	7	ER / 0001 / 82 / 2	Shakila	FEMALE	1984-11-13 09:49:12.155059-05	31	Mother	f	Married	6 Std	\N	f	t	t	373	f	f		\N	f	Home maker	Local	f		0
1244	1	1	7	ER / 0001 / 82 / 3	Sofiya	FEMALE	1999-11-13 09:49:12.183612-05	16	Daugter	f	Single	11 Std	\N	f	t	f	373	f	f		\N	f	Student	Local	f		0
1245	1	1	7	ER / 0001 / 82 / 4	Nafiya	FEMALE	2009-11-13 09:49:12.225153-05	6	Daugter	f	Single	1 Std	\N	f	t	f	373	f	f		\N	f	Student	Local	f		0
1246	1	1	7	ER / 0001 / 83 / 1	Fasurull	MALE	1970-11-13 09:49:12.260788-05	45	Father	t	Married	6 Std	\N	f	t	t	374	f	f		\N	f	Worker In Shop	Local	f		0
1247	1	1	7	ER / 0001 / 83 / 2	Shakira Banu	FEMALE	1973-11-13 09:49:12.299807-05	42	Mother	f	Married	3 Std	\N	f	t	t	374	f	f		\N	f	Know Tailoring	Local	f		0
1248	1	1	7	ER / 0001 / 83 / 3	asiya Begam	FEMALE	1999-11-13 09:49:12.336035-05	16	Daugter	f	Single	10 Std	\N	f	t	f	374	f	f		\N	f	Student	Local	f		0
1249	1	1	7	ER / 0001 / 83 / 4	Ameena Begam	FEMALE	2003-11-13 09:49:12.370582-05	12	Daugter	f	Single	7 Std	\N	f	t	f	374	f	f		\N	f	Student	Local	f		0
1250	1	1	7	ER / 0001 / 84 / 1	Mohamed Rafiq	MALE	1970-11-13 09:49:12.406472-05	45	Father	t	Married	7 Std	\N	f	t	t	375	f	f		\N	f	Painter	Local	f		0
1251	1	1	7	ER / 0001 / 84 / 2	Rajiya Banu	FEMALE	1972-11-13 09:49:12.436556-05	43	Mother	f	Married	5 Std	\N	f	t	t	375	f	f		\N	f	Home maker	Local	f		0
1252	1	1	7	ER / 0001 / 84 / 3	Sha Nawas	MALE	1991-11-13 09:49:12.464702-05	24	Son	f	Single	UG	\N	f	t	t	375	f	f		\N	f	Machanic Eng	Outstation	f		0
1253	1	1	7	ER / 0001 / 85 / 1	Mohamed Yusuf	MALE	1953-11-13 09:49:12.492963-05	62	Father	t	Married	5 Std	\N	f	t	t	376	f	f		\N	f	Bag Shop	Local	f		0
1254	1	1	7	ER / 0001 / 85 / 2	Johara Bevi	FEMALE	1963-11-13 09:49:12.51725-05	52	Mother	f	Married	7 Std	\N	f	t	t	376	f	f		\N	f	Home maker	Local	f		0
1255	1	1	7	ER / 0001 / 85 / 3	Saleem Abthar	MALE	1980-11-13 09:49:12.554612-05	35	Son	f	Married	12 Std	\N	f	t	t	376	f	f		\N	f	Fancy store	Local	f		0
1256	1	1	7	ER / 0001 / 85 / 4	Famitha Nasrin	FEMALE	1989-11-13 09:49:12.583065-05	26	Dau.In.Law	f	Married	PG	\N	f	t	t	376	f	f		\N	f	Home maker	Local	f		0
1257	1	1	7	ER / 0001 / 85 / 5	Fazil hAq	MALE	1986-11-13 09:49:12.606874-05	29	Son	f	Single	10 Std	\N	f	t	t	376	f	f		\N	f	Bag Shop	Local	f		0
1258	1	1	7	ER / 0001 / 86 / 1	Sabeer Ahmed	MALE	1977-11-13 09:49:12.636685-05	38	Father	t	Married	UG	\N	f	t	t	377	f	f		\N	f	Fancy store	Local	f		0
1259	1	1	7	ER / 0001 / 86 / 2	Sajitha Yasmin	FEMALE	1986-11-13 09:49:12.657264-05	29	Mother	f	Married	UG	\N	f	t	t	377	f	f		\N	f	Home maker	Local	f		0
1260	1	1	7	ER / 0001 / 86 / 3	Samiha Sahin	FEMALE	2007-11-13 09:49:12.681316-05	8	Daugter	f	Single	3 Std	\N	f	t	f	377	f	f		\N	f	Student	Local	f		0
1261	1	1	7	ER / 0001 / 86 / 4	Mohamed Safvan	MALE	2014-11-13 09:49:12.704374-05	1	Son	f	Single		\N	f	t	f	377	f	f		\N	f	Baby	Local	f		0
1262	1	1	7	ER / 0001 / 87 / 1	Rahman	MALE	1950-11-13 09:49:12.728524-05	65	Father	t	Married	12 Std	\N	f	t	t	378	f	f		\N	f	Worker In Store	Local	f		0
1263	1	1	7	ER / 0001 / 87 / 2	Jinath Bevi	FEMALE	1960-11-13 09:49:12.756813-05	55	Mother	f	Married	8 Std	\N	f	t	t	378	f	f		\N	f	Home maker	Local	f		0
1264	1	1	7	ER / 0001 / 87 / 3	Asima	FEMALE	1980-11-13 09:49:12.791278-05	35	Daugter	f	Single	12 Std	\N	f	t	t	378	f	f		\N	f	Body Problem	Local	f		0
1265	1	1	7	ER / 0001 / 87 / 4	Sahul Hameed	MALE	1983-11-13 09:49:12.815492-05	32	Son	f	Married	UG	\N	f	t	t	378	f	f		\N	f	Search Job	Local	f		0
1266	1	1	7	ER / 0001 / 87 / 5	Sahar Banu	FEMALE	1948-11-13 09:49:12.845269-05	67	G.mother	f	Widow	12 Std	\N	f	t	t	378	f	f		\N	f	Home maker	Local	f		0
1267	1	1	7	ER / 0001 / 87 / 6	Jasmeen Rajiya	FEMALE	1987-11-13 09:49:12.882873-05	28	Dau.In.Law	f	Married	UG	\N	f	t	t	378	f	f		\N	f	Home maker	Local	f		0
1268	1	1	7	ER / 0001 / 88 / 1	Sheik Dawood	MALE	1951-11-13 09:49:12.907277-05	64	Father	t	Married	4 std	\N	f	t	t	379	f	f		\N	f	Rest	Local	f		0
1269	1	1	7	ER / 0001 / 88 / 2	Ameena  	FEMALE	1963-11-13 09:49:12.932261-05	52	Mother	f	Married		\N	f	t	t	379	f	f		\N	f	Rest	Local	f		0
1270	1	1	7	ER / 0001 / 89 / 1	Kul Mohamed	MALE	1942-11-13 09:49:12.955206-04	73	Father	t	Married	3 Std	\N	f	t	t	380	f	f		\N	f		Local	f		0
1271	1	1	7	ER / 0001 / 89 / 2	Rahima Bevi	FEMALE	1955-11-13 09:49:12.988559-05	60	Mother	f	Married		\N	f	t	t	380	f	f		\N	f		Local	f		0
1272	1	1	7	ER / 0001 / 90 / 1	Rahamathull	MALE	1965-11-13 09:49:13.023689-05	50	Father	t	Married	6 Std	\N	f	t	t	381	f	f		\N	f	Work In Store	Local	f		0
1273	1	1	7	ER / 0001 / 90 / 2	Lailama	FEMALE	1971-11-13 09:49:13.048427-05	44	Mother	f	Married	10 Std	\N	f	t	t	381	f	f		\N	f	Home maker	Local	f		0
1274	1	1	7	ER / 0001 / 90 / 3	Mohamed Meera	MALE	1995-11-13 09:49:13.076863-05	20	Son	f	Single	DME	\N	f	t	f	381	f	f		\N	f	No Job	Local	f		0
1275	1	1	7	ER / 0001 / 90 / 4	Thasleema	FEMALE	1998-11-13 09:49:13.127947-05	17	Daugter	f	Single	12 Std	\N	f	t	f	381	f	f		\N	f	Student	Local	f		0
1276	1	1	7	ER / 0001 / 91 / 1	Sameema	MALE	1961-11-13 09:49:13.173617-05	54	Father	t	Married	6 Std	\N	f	t	t	382	f	f		\N	f	Work In Store	Local	f		0
1277	1	1	7	ER / 0001 / 91 / 2	Naseera Banu	FEMALE	1970-11-13 09:49:13.211727-05	45	Mother	f	Married	Alima	\N	f	t	t	382	f	f		\N	f	Tuson	Local	f		0
1278	1	1	7	ER / 0001 / 91 / 3	Mohamed Yahya	MALE	1997-11-13 09:49:13.24646-05	18	Son	f	Single	UG	\N	f	t	f	382	f	f		\N	f	Student	Local	f		0
1279	1	1	7	ER / 0001 / 91 / 4	Mariyamul Aysha	FEMALE	2000-11-13 09:49:13.281138-05	15	Daugter	f	Single	10 Std	\N	f	t	f	382	f	f		\N	f	Student	Local	f		0
1280	1	1	7	ER / 0001 / 92 / 1	Syed Musthafa	MALE	1985-11-13 09:49:13.316248-05	30	Father	t	Married	6 Std	\N	f	t	t	383	f	f		\N	f	Cell service	Local	f		0
1281	1	1	7	ER / 0001 / 92 / 2	Rosan Banu	FEMALE	1988-11-13 09:49:13.356548-05	27	Mother	f	Married	12 Std	\N	f	t	f	383	f	f		\N	f	Home maker	Local	f		0
1282	1	1	7	ER / 0001 / 92 / 3	Muvbika	FEMALE	2008-11-13 09:49:13.392392-05	7	Son	f	Single	2 Std	\N	f	t	f	383	f	f		\N	f	Student	Local	f		0
1283	1	1	7	ER / 0001 / 92 / 4	Safiya thasleem	FEMALE	2010-11-13 09:49:13.43953-05	5	Daugter	f	Single		\N	f	t	f	383	f	f		\N	f	Baby	Local	f		0
1284	1	1	7	ER / 0001 / 92 / 5	Samiya Thasleem	FEMALE	2010-11-13 09:49:13.475507-05	5	Daugter	f	Single		\N	f	t	f	383	f	f		\N	f	Baby	Local	f		0
1285	1	1	7	ER / 0001 / 93 / 1	Sathik Basha	MALE	1978-11-13 09:49:13.510593-05	37	Father	t	Married	8 Std	\N	f	t	t	384	f	f		\N	f	Electrical	Local	f		0
1286	1	1	7	ER / 0001 / 93 / 2	Pathi Muthu 	FEMALE	1987-11-13 09:49:13.540934-05	28	Mother	f	Married	12 Std	\N	f	t	t	384	f	f		\N	f	Home maker	Local	f		0
1287	1	1	7	ER / 0001 / 93 / 3	Abdul Rahman	MALE	2008-11-13 09:49:13.577632-05	7	Son	f	Single	2 Std	\N	f	t	f	384	f	f		\N	f	Student	Local	f		0
1288	1	1	7	ER / 0001 / 93 / 4	Aysha Ameena	FEMALE	2009-11-13 09:49:13.618793-05	6	Daugter	f	Single	1 Std	\N	f	t	f	384	f	f		\N	f	Student	Local	f		0
1289	1	1	7	ER / 0001 / 94 / 1	Kaleel Rahman	MALE	1964-11-13 09:49:13.659682-05	51	Father	t	Married	11 Std	\N	f	t	t	385	f	f		\N	f	Work In Store	Local	f		0
1290	1	1	7	ER / 0001 / 94 / 2	Saithama	FEMALE	1972-11-13 09:49:13.699075-05	43	Mother	f	Married	8 Std	\N	f	t	t	385	f	f		\N	f	Home maker	Local	f		0
1291	1	1	7	ER / 0001 / 94 / 3	Mohamed	MALE	2005-11-13 09:49:13.738512-05	10	Son	f	Single	6 Std	\N	f	t	f	385	f	f		\N	f	Student	Local	f		0
1292	1	1	7	ER / 0001 / 95 / 1	Sarthar	MALE	1961-11-13 09:49:13.785374-05	54	Father	t	Married	8 Std	\N	f	t	t	386	f	f		\N	f	Cell Shop	Local	f		0
1293	1	1	7	ER / 0001 / 95 / 2	Sameema	FEMALE	1968-11-13 09:49:13.82063-05	47	Mother	f	Married	10 Std	\N	f	t	t	386	f	f		\N	f	Home maker	Local	f		0
1294	1	1	7	ER / 0001 / 96 / 1	Habeebull	MALE	1968-11-13 09:49:13.853889-05	47	Father	t	Married	5 Std	\N	f	t	t	387	f	f		\N	f	Ciothing	Local	f		0
1295	1	1	7	ER / 0001 / 96 / 2	farisa Banu	FEMALE	1975-11-13 09:49:13.880223-05	40	Mother	f	Married	8 Std	\N	f	t	t	387	f	f		\N	f	Tailoring	Local	f		0
1296	1	1	7	ER / 0001 / 96 / 3	Mohamed Yasar	MALE	1991-11-13 09:49:13.913207-05	24	Son	f	Single	PG	\N	f	t	f	387	f	f		\N	f	Marketer	Local	f		0
1297	1	1	7	ER / 0001 / 97 / 1	Abdul Kadar	MALE	1952-11-13 09:49:13.953566-05	63	Father	t	Married	3 Std	\N	f	t	t	388	f	f		\N	f	Rest	Local	f		0
1298	1	1	7	ER / 0001 / 97 / 2	Kamarun Nisha	FEMALE	1962-11-13 09:49:13.989626-05	53	Mother	f	Married		\N	f	t	t	388	f	f		\N	f	Rest	Local	f		0
1299	1	1	7	ER / 0001 / 97 / 3	Akbar Aliu	MALE	1977-11-13 09:49:14.028678-05	38	Son	f	Married	10 Std	\N	f	t	t	388	f	f		\N	f	Machanic	Local	f		0
1300	1	1	7	ER / 0001 / 97 / 4	Rabiyathul Basariya	FEMALE	1984-11-13 09:49:14.061128-05	31	Dau.In.Law	f	Married	6 Std	\N	f	t	t	388	f	f		\N	f	Home maker	Local	f		0
1301	1	1	7	ER / 0001 / 97 / 5	Aysa Begam	FEMALE	2003-11-13 09:49:14.096625-05	12	G.Daugter	f	Single	9 Std	\N	f	t	f	388	f	f		\N	f	Student	Local	f		0
1302	1	1	7	ER / 0001 / 97 / 6	Rizwan Parveen	MALE	2005-11-13 09:49:14.132588-05	10	G.Son	f	Single	6 Std	\N	f	t	f	388	f	f		\N	f	Student	Local	f		0
1303	1	1	7	ER / 0001 / 98 / 1	Mohamed Ali	MALE	1957-11-13 09:49:14.169213-05	58	Father	t	Married	5 Std	\N	f	t	t	389	f	f		\N	f	Cooli	Local	f		0
1304	1	1	7	ER / 0001 / 98 / 2	Jinath Begam	FEMALE	1967-11-13 09:49:14.209431-05	48	Mother	f	Married	3 Std	\N	f	t	f	389	f	f		\N	f	Cooli	Local	f		0
1305	1	1	7	ER / 0001 / 98 / 3	Sahul Hameed	MALE	1987-11-13 09:49:14.246603-05	28	Son	f	Single	3 Std	\N	f	t	t	389	f	f		\N	f	Auto Driver	Local	f		0
1306	1	1	7	ER / 0001 / 99 / 1	alavudin	MALE	1965-11-13 09:49:14.282121-05	50	Father	t	Married	12 Std	\N	f	t	t	390	f	f		\N	f	Clothing	Local	f		0
1307	1	1	7	ER / 0001 / 99 / 2	Bairoja Begam	FEMALE	1977-11-13 09:49:14.31168-05	38	Mother	f	Married	8 Std	\N	f	t	t	390	f	f		\N	f	Tailoring	Local	f		0
1308	1	1	7	ER / 0001 / 99 / 3	Jannath Nisha	FEMALE	1940-11-13 09:49:14.347537-05	75	G.mother	f	Widow	5 Std	\N	f	t	t	390	f	f		\N	f	Home maker	Local	f		0
1309	1	1	7	ER / 0001 / 99 / 4	Abdul Rahman	MALE	1993-11-13 09:49:14.392038-05	22	Son	f	Single	PG	\N	f	t	f	390	f	f		\N	f	Search Job	Local	f		0
1310	1	1	7	ER / 0001 / 99 / 5	aysa Banu	FEMALE	1997-11-13 09:49:14.442088-05	18	Daugter	f	Single	12 Std	\N	f	t	f	390	f	f		\N	f	Home maker	Local	f		0
1311	1	1	7	ER / 0001 / 100 / 1	Noor mohamed	MALE	1975-11-13 09:49:14.479932-05	40	Father	t	Married	5 Std	\N	f	t	t	391	f	f		\N	f	Cooli	Local	f		0
1312	1	1	7	ER / 0001 / 100 / 2	salma	FEMALE	1980-11-13 09:49:14.523185-05	35	Mother	f	Married	10 Std	\N	f	t	t	391	f	f		\N	f	Home maker	Local	f		0
1313	1	1	7	ER / 0001 / 100 / 3	Haseen	FEMALE	2005-11-13 09:49:14.559677-05	10	Daugter	f	Single	4 std	\N	f	t	f	391	f	f		\N	f	Student	Local	f		0
1314	1	1	7	ER / 0001 / 100 / 4	Hasib	MALE	2008-11-13 09:49:14.593462-05	7	Son	f	Single	3 Std	\N	f	t	f	391	f	f		\N	f	Student	Local	f		0
1315	1	1	7	ER / 0001 / 301 / 1	Siddiq Ali	MALE	1980-09-08 01:00:00-04	35	Husband	t	Married	10 Std	\N	f	t	t	392	f	f		\N	f	Medical Shop Labour	Local	f		0
1316	1	1	7	ER / 0001 / 301 / 2	Madina Begam	FEMALE	1991-11-13 09:49:14.665341-05	24	Wife	f	Married	10 Std	\N	f	t	t	392	f	f		\N	f	Vegitable Business	Local	f		0
1317	1	1	7	ER / 0001 / 301 / 3	Mohamed Adhil	MALE	2011-11-13 09:49:14.699723-05	4	Son	f	Single	LKG	\N	f	t	f	392	f	f		\N	f	Student	Local	f		0
1318	1	1	7	ER / 0001 / 302 / 1	Sirajudin	MALE	1976-11-13 09:49:14.734628-05	39	Husband	t	Married	10 Std	\N	f	t	t	393	f	f		\N	f	Driver	Local	f		0
1319	1	1	7	ER / 0001 / 302 / 2	Shagitha Parveen	FEMALE	1980-11-13 09:49:14.762969-05	35	Wife	f	Married	10 Std	\N	f	t	t	393	f	f		\N	f	Home Maker	Local	f		0
1320	1	1	7	ER / 0001 / 302 / 3	Mousiya	FEMALE	2002-11-13 09:49:14.803819-05	13	Daugter	f	Single	8 Std	\N	f	t	f	393	f	f		\N	f	Student	Local	f		0
1324	1	1	7	ER / 0001 / 303 / 4	Tharves	MALE	2008-11-13 09:49:14.954211-05	7	Son	f	Single	2 Std	\N	f	t	f	394	f	f		\N	f	Student	Local	f		0
1321	1	1	7	ER / 0001 / 303 / 1	Mohamed Musthafa	MALE	1941-11-13 09:49:15.008613-05	74	Father	t	Married	10 Std	\N	f	t	t	394	f	f		\N	f	Teacher Rest	Local	f		0
1322	1	1	7	ER / 0001 / 303 / 2	Rasitha Begam	FEMALE	1953-11-13 09:49:15.051854-05	62	Mother	f	Married	10 Std	\N	f	t	t	394	f	f		\N	f	Home Maker	Local	f		0
1323	1	1	7	ER / 0001 / 303 / 3	Jafer Sathik	MALE	1982-11-13 09:49:15.092548-05	33	Son	f	Single	10 Std	\N	f	t	t	394	f	f		\N	f		Local	f		0
1325	1	1	7	ER / 0001 / 305 / 1	Dawood	MALE	1949-11-13 09:49:15.134722-05	66	Father	t	Married	3 Std	\N	f	t	t	395	f	f		\N	f	Tailoer	Local	f		0
1326	1	1	7	ER / 0001 / 305 / 2	Rasooiun Nisha	FEMALE	1965-11-13 09:49:15.185689-05	50	Mother	f	Married	7 Std	\N	f	t	t	395	f	f		\N	f	Home Maker	Local	f		0
1327	1	1	7	ER / 0001 / 305 / 3	Mohamed Ibrahim	MALE	1986-11-13 09:49:15.23178-05	29	Son	f	Married	7 Std	\N	f	t	t	395	f	f		\N	f	Mobile Service	Local	f		0
1328	1	1	7	ER / 0001 / 305 / 4	Resma	FEMALE	1991-11-13 09:49:15.269293-05	24	Dau.In.Law	f	Married	PG	\N	f	t	t	395	f	f		\N	f	Home Maker	Local	f		0
1329	1	1	7	ER / 0001 / 306 / 1	Syed Rafiq	MALE	1971-11-13 09:49:15.314162-05	44	Husband	t	Married	5 Std	\N	f	t	t	396	f	f		\N	f	Painter	Local	f		0
1330	1	1	7	ER / 0001 / 306 / 2	Arifa	FEMALE	1977-11-13 09:49:15.342934-05	38	Wife	f	Married		\N	f	t	t	396	f	f		\N	f	Home Maker	Local	f		0
1331	1	1	7	ER / 0001 / 306 / 3	Thaju Nisha	FEMALE	1995-11-13 09:49:15.379298-05	20	Daugter	f	Single	12 Std	\N	f	t	f	396	f	f		\N	f	Company	Local	f		0
1332	1	1	7	ER / 0001 / 306 / 4	Sabina	FEMALE	1999-11-13 09:49:15.426594-05	16	Daugter	f	Single	10 Std	\N	f	t	f	396	f	f		\N	f	Student	Local	f		0
1333	1	1	7	ER / 0001 / 306 / 5	Syed Ibrahim	MALE	2002-11-13 09:49:15.474356-05	13	Son	f	Single	7 Std	\N	f	t	f	396	f	f		\N	f	Student	Local	f		0
1334	1	1	7	ER / 0001 / 306 / 6	Rajiya	FEMALE	2008-11-13 09:49:15.520051-05	7	Daugter	f	Single	3 Std	\N	f	t	f	396	f	f		\N	f	Student	Local	f		0
1335	1	1	7	ER / 0001 / 307 / 1	Ammu	FEMALE	1955-11-13 09:49:15.562824-05	60	Mother	t	Widow	Alima	\N	f	t	f	397	f	f		\N	f	Rest	Local	f		0
1336	1	1	7	ER / 0001 / 307 / 2	Sheik Dawood	MALE	1972-11-13 09:49:15.608553-05	43	Son	f	Married	5 Std	\N	f	t	t	397	f	f		\N	f	Cooli	Local	f		0
1337	1	1	7	ER / 0001 / 307 / 3	Methab	FEMALE	1977-11-13 09:49:15.643876-05	38	Dau.In.Law	f	Married	10 Std	\N	f	t	t	397	f	f		\N	f	Tailoer	Local	f		0
1338	1	1	7	ER / 0001 / 307 / 4	Navas	MALE	1996-11-13 09:49:15.683954-05	19	G.Son	f	Married	9 Std	\N	f	t	f	397	f	f		\N	f	Cooli	Local	f		0
1339	1	1	7	ER / 0001 / 307 / 5	Najiya	FEMALE	1998-11-13 09:49:15.720246-05	17	G.Daugter	f	Single	12 Std	\N	f	t	f	397	f	f		\N	f	Student	Local	f		0
1340	1	1	7	ER / 0001 / 308 / 1	Nawab John	MALE	1971-11-13 09:49:15.765054-05	44	Husband	t	Married	8 Std	\N	f	t	t	398	f	f		\N	f	Welder	Local	f		0
1341	1	1	7	ER / 0001 / 308 / 2	Mumthaj	FEMALE	1977-11-13 09:49:15.79709-05	38	Wife	f	Married	5 Std	\N	f	t	t	398	f	f		\N	f	Home Maker	Local	f		0
1342	1	1	7	ER / 0001 / 308 / 3	Nisama	FEMALE	1994-11-13 09:49:15.848164-05	21	Daugter	f	Single	12 Std	\N	f	t	t	398	f	f		\N	f	Medical Shop Labour	Local	f		0
1343	1	1	7	ER / 0001 / 308 / 4	John Basha	MALE	1995-11-13 09:49:15.892794-05	20	Daugter	f	Single	Diplomo	\N	f	t	t	398	f	f		\N	f	Student	Local	f		0
1344	1	1	7	ER / 0001 / 308 / 5	Sathik Basha	MALE	1996-11-13 09:49:15.935801-05	19	Son	f	Single	UG	\N	f	t	t	398	f	f		\N	f	Student	Local	f		0
1345	1	1	7	ER / 0001 / 309 / 1	Sathik Basha	MALE	1985-11-13 09:49:15.970489-05	30	Husband	t	Married	5 Std	\N	f	t	t	399	f	f		\N	f	Cooli	Local	f		0
1346	1	1	7	ER / 0001 / 309 / 2	Amrin	FEMALE	1986-11-13 09:49:16.007491-05	29	Wife	f	Married	8 Std	\N	f	t	t	399	f	f		\N	f	Home Maker	Local	f		0
1347	1	1	7	ER / 0001 / 309 / 3	Adhil	MALE	2008-11-13 09:49:16.044366-05	7	Son	f	Single	1 Std	\N	f	t	f	399	f	f		\N	f	Student	Local	f		0
1348	1	1	7	ER / 0001 / 309 / 4	Haroon	MALE	2010-11-13 09:49:16.087584-05	5	Son	f	Single	LKG	\N	f	t	f	399	f	f		\N	f	Student	Local	f		0
1349	1	1	7	ER / 0001 / 310 / 1	Yousuf	MALE	1951-11-13 09:49:16.129979-05	64	Husband	t	Married	4 Std	\N	f	t	t	400	f	f		\N	f	Rest	Local	f		0
1350	1	1	7	ER / 0001 / 310 / 2	Najumun Nisha	FEMALE	1965-11-13 09:49:16.166463-05	50	Wife	f	Married	6 Std	\N	f	t	t	400	f	f		\N	f	Home Maker	Local	f		0
1351	1	1	7	ER / 0001 / 310 / 3	Shavali Khan	MALE	1990-11-13 09:49:16.200555-05	25	Son	f	Married	DME	\N	f	t	t	400	f	f		\N	f	Machanic	Local	f		0
1352	1	1	7	ER / 0001 / 310 / 4	Mehara Banu	FEMALE	1993-11-13 09:49:16.234887-05	22	Dau.In.Law	f	Married	PG	\N	f	t	t	400	f	f		\N	f	Tution	Local	f		0
1353	1	1	7	ER / 0001 / 310 / 5	Sathik Basha	MALE	1998-11-13 09:49:16.279132-05	17	Son	f	Single	12 Std	\N	f	t	f	400	f	f		\N	f	Opereter	Local	f		0
1354	1	1	7	ER / 0001 / 311 / 1	Rahman	MALE	1979-11-13 09:49:16.315074-05	36	Husband	t	Married	5 Std	\N	f	t	t	401	f	f		\N	f	Tailoer	Local	f		0
1355	1	1	7	ER / 0001 / 311 / 2	Mallika Begam	FEMALE	1985-11-13 09:49:16.344831-05	30	Wife	f	Married	5 Std	\N	f	t	t	401	f	f		\N	f	Tailoer	Local	f		0
1356	1	1	7	ER / 0001 / 311 / 3	Umar Farook	MALE	1999-11-13 09:49:16.389947-05	16	Son	f	Single	11 Std	\N	f	t	f	401	f	f		\N	f	Student	Local	f		0
1357	1	1	7	ER / 0001 / 311 / 4	Mohamed Basith	MALE	2003-11-13 09:49:16.433944-05	12	Son	f	Single	7 Std	\N	f	t	f	401	f	f		\N	f	Student	Local	f		0
1358	1	1	7	ER / 0001 / 312 / 1	Shahul Hameed	MALE	1970-11-13 09:49:16.478165-05	45	Husband	t	Married	8 Std	\N	f	t	t	402	f	f		\N	f	Labour	Local	f		0
1359	1	1	7	ER / 0001 / 312 / 2	Mahamutha	FEMALE	1976-11-13 09:49:16.516596-05	39	Wife	f	Married	7 Std	\N	f	t	t	402	f	f		\N	f	Tailoer	Local	f		0
1360	1	1	7	ER / 0001 / 312 / 3	Mohamed 	MALE	1996-11-13 09:49:16.553342-05	19	Son	f	Single	ECE	\N	f	t	f	402	f	f		\N	f	Cell Shop	Local	f		0
1361	1	1	7	ER / 0001 / 312 / 4	Abilama	FEMALE	1999-11-13 09:49:16.591665-05	16	Daugter	f	Single	9 Std	\N	f	t	f	402	f	f		\N	f	dropout	Local	f		0
1362	1	1	7	ER / 0001 / 312 / 5	Safilama	FEMALE	2000-11-13 09:49:16.627502-05	15	Daugter	f	Single	8 Std	\N	f	t	f	402	f	f		\N	f	dropout	Local	f		0
1363	1	1	7	ER / 0001 / 313 / 1	kader Moideen	MALE	1956-11-13 09:49:16.663142-05	59	Husband	t	Married	10 Std	\N	f	t	t	403	f	f		\N	f	TNSTC	Local	f		0
1364	1	1	7	ER / 0001 / 313 / 2	Shakila Banu	FEMALE	1967-11-13 09:49:16.698989-05	48	Wife	f	Married	12 Std	\N	f	t	t	403	f	f		\N	f	Home Maker	Local	f		0
1365	1	1	7	ER / 0001 / 313 / 3	Meraj Banu	FEMALE	1990-11-13 09:49:16.732621-05	25	Daugter	f	Single	PG	\N	f	t	t	403	f	f		\N	f	Teacher	Outstation	f		0
1366	1	1	7	ER / 0001 / 314 / 1	wahira Bevi	FEMALE	1947-11-13 09:49:16.760135-05	68	Mother	t	Widow		\N	f	t	t	404	f	f		\N	f	Home Maker	Local	f		0
1367	1	1	7	ER / 0001 / 314 / 2	Navshad	MALE	1974-11-13 09:49:16.801963-05	41	Son	f	Married	PG	\N	f	t	t	404	f	f		\N	f	Sales Man	Local	f		0
1368	1	1	7	ER / 0001 / 314 / 3	Sabira Begam	FEMALE	1978-11-13 09:49:16.836876-05	37	Dau.In.Law	f	Married	10 Std	\N	f	t	t	404	f	f		\N	f	Home Maker	Local	f		0
1369	1	1	7	ER / 0001 / 314 / 4	Suhaib	MALE	2004-11-13 09:49:16.866139-05	11	G.Son	f	Single	7 Std	\N	f	t	f	404	f	f		\N	f	Student	Local	f		0
1370	1	1	7	ER / 0001 / 315 / 1	Mohamed Ali	MALE	1975-11-13 09:49:16.894659-05	40	Father	t	Married	ITI	\N	f	t	t	405	f	f		\N	f	Steel Business	Local	f		0
1371	1	1	7	ER / 0001 / 315 / 2	Shakila Banu	FEMALE	1982-11-13 09:49:16.918204-05	33	Mother	f	Married	5 Std	\N	f	t	t	405	f	f		\N	f	Home Maker	Local	f		0
1372	1	1	7	ER / 0001 / 315 / 3	Basitha Banu	FEMALE	1996-11-13 09:49:16.94623-05	19	Daugter	f	Single	UG	\N	f	t	f	405	f	f		\N	f	Student	Local	f		0
1373	1	1	7	ER / 0001 / 315 / 4	Thilsath	FEMALE	1999-11-13 09:49:16.981218-05	16	Daugter	f	Single	10 Std	\N	f	t	f	405	f	f		\N	f	Student	Local	f		0
1374	1	1	7	ER / 0001 / 315 / 5	shajira	MALE	2002-11-13 09:49:17.015154-05	13	Son	f	Single	9 Std	\N	f	t	f	405	f	f		\N	f	Student	Local	f		0
1375	1	1	7	ER / 0001 / 316 / 1	Soukath Ali	MALE	1973-11-13 09:49:17.050431-05	42	Husband	t	Married	5 Std	\N	f	t	t	406	f	f		\N	f	Painter	Local	f		0
1376	1	1	7	ER / 0001 / 316 / 2	Ibsha Banu	FEMALE	1975-11-13 09:49:17.080737-05	40	Wife	f	Married	4 Std	\N	f	t	t	406	f	f		\N	f	Home Maker	Local	f		0
1377	1	1	7	ER / 0001 / 316 / 3	shanall	MALE	1994-11-13 09:49:17.108981-05	21	Son	f	Single	8 Std	\N	f	t	t	406	f	f		\N	f	Painter	Local	f		0
1378	1	1	7	ER / 0001 / 317 / 1	Ismail	MALE	1982-11-13 09:49:17.131399-05	33	Husband	t	Married	9 Std	\N	f	t	t	407	f	f		\N	f	Machanic	Local	f		0
1379	1	1	7	ER / 0001 / 317 / 2	Fasila Banu	FEMALE	1989-11-13 09:49:17.15011-05	26	Wife	f	Married	8 Std	\N	f	t	t	407	f	f		\N	f	Home Maker	Local	f		0
1380	1	1	7	ER / 0001 / 317 / 3	Abin Sinsiya	FEMALE	2006-11-13 09:49:17.172372-05	9	Daugter	f	Single	4 Std	\N	f	t	f	407	f	f		\N	f	Student	Local	f		0
1381	1	1	7	ER / 0001 / 317 / 4	Mehasin Firthose	FEMALE	2009-11-13 09:49:17.23438-05	6	Daugter	f	Single	1 Std	\N	f	t	f	407	f	f		\N	f	Student	Local	f		0
1382	1	1	7	ER / 0001 / 318 / 1	Mohamed Ali	MALE	1974-11-13 09:49:17.267909-05	41	Husband	t	Married	4 Std	\N	f	t	t	408	f	f		\N	f	Welder	Local	f		0
1383	1	1	7	ER / 0001 / 318 / 2	Yasmeen	FEMALE	1982-11-13 09:49:17.293339-05	33	Wife	f	Married	10 Std	\N	f	t	t	408	f	f		\N	f	Know Tailoring	Local	f		0
1384	1	1	7	ER / 0001 / 318 / 3	Abeeb Rahman	MALE	2000-11-13 09:49:17.321436-05	15	Son	f	Single	11 Std	\N	f	t	f	408	f	f		\N	f	Student	Local	f		0
1385	1	1	7	ER / 0001 / 318 / 4	Benasir	FEMALE	2004-11-13 09:49:17.349919-05	11	Daugter	f	Single	8 Std	\N	f	t	f	408	f	f		\N	f	Student	Local	f		0
1386	1	1	7	ER / 0001 / 319 / 1	Badusha	MALE	1985-11-13 09:49:17.373899-05	30	Husband	t	Married		\N	f	t	t	409	f	f		\N	f	Machanic	Local	f		0
1387	1	1	7	ER / 0001 / 319 / 2	Bairoja	FEMALE	1991-11-13 09:49:17.403885-05	24	Wife	f	Married	6 Std	\N	f	t	t	409	f	f		\N	f	Home Maker	Local	f		0
1388	1	1	7	ER / 0001 / 319 / 3	Althaf	MALE	2008-11-13 09:49:17.428892-05	7	Son	f	Aged Unmarried Woman	2 Std	\N	f	t	f	409	f	f		\N	f	Student	Local	f		0
1389	1	1	7	ER / 0001 / 319 / 4	Minmshiya Sarin	FEMALE	2010-11-13 09:49:17.453867-05	5	Daugter	f	Single	UKG	\N	f	t	f	409	f	f		\N	f	Student	Local	f		0
1390	1	1	7	ER / 0001 / 320 / 1	Soukath Ali	FEMALE	1971-11-13 09:49:17.478035-05	44	Father	t	Married	2 Std	\N	f	t	t	410	f	f		\N	f	Steel Business	Local	f		0
1391	1	1	7	ER / 0001 / 320 / 2	Jesima	FEMALE	1976-11-13 09:49:17.50304-05	39	Mother	f	Married	10 Std	\N	f	t	t	410	f	f		\N	f	Home Maker	Local	f		0
1392	1	1	7	ER / 0001 / 320 / 3	Resaan	FEMALE	1996-11-13 09:49:17.532332-05	19	Daugter	f	Married	10 Std	\N	f	t	t	410	f	f		\N	f	Home Maker	Local	f		0
1393	1	1	7	ER / 0001 / 320 / 4	Rumaani	FEMALE	1997-11-13 09:49:17.556667-05	18	Daugter	f	Married	10 Std	\N	f	t	t	410	f	f		\N	f	Home Maker	Local	f		0
1394	1	1	7	ER / 0001 / 320 / 5	sarkin	MALE	1985-11-13 09:49:17.581201-05	30	Marumagan	f	Married	12 Std	\N	f	t	t	410	f	f		\N	f	Steel Business	Local	f		0
1395	1	1	7	ER / 0001 / 320 / 6	arafath	MALE	1985-11-13 09:49:17.607724-05	30	Marumagan	f	Married	12 Std	\N	f	t	t	410	f	f		\N	f	Travels	Local	f		0
1396	1	1	7	ER / 0001 / 321 / 1	Iqbal	MALE	1965-11-13 09:49:17.633868-05	50	Father	t	Married	7 Std	\N	f	t	t	411	f	f		\N	f	Painter	Local	f		0
1397	1	1	7	ER / 0001 / 321 / 2	Jannathu Nisha	FEMALE	1970-11-13 09:49:17.668603-05	45	Mother	f	Married	7 Std	\N	f	t	t	411	f	f		\N	f	Home Maker	Local	f		0
1398	1	1	7	ER / 0001 / 321 / 3	sanbar Ali	MALE	2001-11-13 09:49:17.69405-05	14	Son	f	Single	8 Std	\N	f	t	f	411	f	f		\N	f	Lorry Work Shop Cooli	Local	f		0
1399	1	1	7	ER / 0001 / 321 / 4	Ashik Ali	MALE	1999-11-13 09:49:17.718882-05	16	Son	f	Single	9 Std	\N	f	t	f	411	f	f		\N	f	Steel Business	Local	f		0
1400	1	1	7	ER / 0001 / 322 / 1	Asraf Basha	MALE	1984-11-13 09:49:17.743723-05	31	Father	t	Married	5 Std	\N	f	t	t	412	f	f		\N	f	Company Worker	Local	f		0
1401	1	1	7	ER / 0001 / 322 / 2	Shafika Banu	FEMALE	1987-11-13 09:49:17.770286-05	28	Mother	f	Married	6 Std	\N	f	t	t	412	f	f		\N	f	Home Maker	Local	f		0
1402	1	1	7	ER / 0001 / 322 / 3	Fazil	MALE	2006-11-13 09:49:17.795499-05	9	Son	f	Single	4 Std	\N	f	t	f	412	f	f		\N	f	Student	Local	f		0
1403	1	1	7	ER / 0001 / 322 / 4	Rajabu Nisha	FEMALE	2010-11-13 09:49:17.83154-05	5	Daugter	f	Single	1 Std	\N	f	t	f	412	f	f		\N	f	Student	Local	f		0
1404	1	1	7	ER / 0001 / 323 / 1	Abeebu Nisha	FEMALE	1965-11-13 09:49:17.864576-05	50	Mother	t	Widow		\N	f	t	t	413	f	f		\N	f	Rest	Local	f		0
1405	1	1	7	ER / 0001 / 323 / 2	Fakir Masthan	MALE	1989-11-13 09:49:17.897881-05	26	Son	f	Single	2 Std	\N	f	t	t	413	f	f		\N	f	Labour	Local	f		0
1406	1	1	7	ER / 0001 / 323 / 3	Meharaj	FEMALE	1988-11-13 09:49:17.923954-05	27	Daugter	f	Single	4 Std	\N	f	t	t	413	f	f		\N	f	Labour	Local	f		0
1407	1	1	7	ER / 0001 / 323 / 4	Mohamed Boi	MALE	1990-11-13 09:49:17.948661-05	25	Son	f	Single	6 Std	\N	f	t	t	413	f	f		\N	f	Labour	Local	f		0
1408	1	1	7	ER / 0001 / 324 / 1	Rasoola	MALE	1983-11-13 09:49:17.974074-05	32	Husband	t	Married	7 Std	\N	f	t	t	414	f	f		\N	f	Cooli	Local	f		0
1409	1	1	7	ER / 0001 / 324 / 2	Noor Jahan	FEMALE	1987-11-13 09:49:17.997573-05	28	Wife	f	Married	7 Std	\N	f	t	t	414	f	f		\N	f	Tailoer	Local	f		0
1410	1	1	7	ER / 0001 / 324 / 3	Reenu Fathima	FEMALE	2003-11-13 09:49:18.0233-05	12	Daugter	f	Single	6 Std	\N	f	t	f	414	f	f		\N	f	Student	Local	f		0
1411	1	1	7	ER / 0001 / 325 / 1	Saithama	FEMALE	1978-11-13 09:49:18.054753-05	37	Mother	t	Devorced	8 Std	\N	f	t	t	415	f	f		\N	f	Company Worker	Local	f		0
1412	1	1	7	ER / 0001 / 325 / 2	Fathima	FEMALE	1998-11-13 09:49:18.081497-05	17	Daugter	f	Single	12 Std	\N	f	t	f	415	f	f		\N	f	Student	Local	f		0
1413	1	1	7	ER / 0001 / 325 / 3	Abbas	MALE	1999-11-13 09:49:18.127639-05	16	Son	f	Single	ITI	\N	f	t	f	415	f	f		\N	f	Student	Local	f		0
1414	1	1	7	ER / 0001 / 325 / 4	Mohamed Musthak	MALE	2002-11-13 09:49:18.173514-05	13	Son	f	Single	9 Std	\N	f	t	f	415	f	f		\N	f	Student	Local	f		0
1415	1	1	7	ER / 0001 / 326 / 1	Seat	MALE	1966-11-13 09:49:18.212358-05	49	Father	t	Married		\N	f	t	t	416	f	f		\N	f	Cutting	Local	f		0
1416	1	1	7	ER / 0001 / 326 / 2	najma	FEMALE	1977-11-13 09:49:18.26046-05	38	Mother	f	Married	8 Std	\N	f	t	t	416	f	f		\N	f	Tailoer	Local	f		0
1417	1	1	7	ER / 0001 / 326 / 3	Asiya	FEMALE	2003-11-13 09:49:18.297322-05	12	Daugter	f	Single	7 Std	\N	f	t	f	416	f	f		\N	f	Student	Local	f		0
1418	1	1	7	ER / 0001 / 327 / 1	Raja Mohamed	MALE	1983-11-13 09:49:18.349026-05	32	Father	t	Married		\N	f	t	t	417	f	f		\N	f	Tailoer	Local	f		0
1419	1	1	7	ER / 0001 / 327 / 2	Ather John	FEMALE	1986-11-13 09:49:18.378571-05	29	Mother	f	Married	8 Std	\N	f	t	t	417	f	f		\N	f	Home Maker	Local	f		0
1420	1	1	7	ER / 0001 / 327 / 3	Jafer Sathik	MALE	2003-11-13 09:49:18.413714-05	12	Son	f	Single	7 Std	\N	f	t	f	417	f	f		\N	f	Student	Local	f		0
1421	1	1	7	ER / 0001 / 327 / 4	Ashik Ali	MALE	2013-11-13 09:49:18.457195-05	2	Son	f	Single		\N	f	t	f	417	f	f		\N	f	Baby	Local	f		0
1422	1	1	7	ER / 0001 / 328 / 1	Noorullah	MALE	1971-11-13 09:49:18.493988-05	44	Father	t	Married	UG	\N	f	t	t	418	f	f		\N	f	Manager	Local	f		0
1423	1	1	7	ER / 0001 / 328 / 2	Shakina Parveen	FEMALE	1980-11-13 09:49:18.533818-05	35	Mother	f	Married	UG	\N	f	t	t	418	f	f		\N	f	Home Maker	Local	f		0
1424	1	1	7	ER / 0001 / 328 / 3	Nasrin	FEMALE	2004-11-13 09:49:18.57069-05	11	Daugter	f	Single	8 Std	\N	f	t	f	418	f	f		\N	f	Student	Local	f		0
1425	1	1	7	ER / 0001 / 328 / 4	Nabrin Banu	FEMALE	2004-11-13 09:49:18.613811-05	11	Daugter	f	Single	8 Std	\N	f	t	f	418	f	f		\N	f	Student	Local	f		0
1426	1	1	7	ER / 0001 / 329 / 1	Mohamed Siddiq	MALE	1979-11-13 09:49:18.659131-05	36	Father	t	Married	5 Std	\N	f	t	t	419	f	f		\N	f	Contracter	Local	f		0
1427	1	1	7	ER / 0001 / 329 / 2	Fathima	FEMALE	1980-11-13 09:49:18.69005-05	35	Mother	f	Married	10 Std	\N	f	t	t	419	f	f		\N	f	Tailoer	Local	f		0
1428	1	1	7	ER / 0001 / 329 / 3	Jasmeen	FEMALE	1999-11-13 09:49:18.726904-05	16	Daugter	f	Single	12 Std	\N	f	t	f	419	f	f		\N	f	Student	Local	f		0
1429	1	1	7	ER / 0001 / 329 / 4	Mohamed Yasin	MALE	2001-11-13 09:49:18.769961-05	14	Son	f	Single	10 Std	\N	f	t	f	419	f	f		\N	f	Student	Local	f		0
1430	1	1	7	ER / 0001 / 329 / 5	Miohamed Kani	MALE	1935-11-13 09:49:18.805541-05	80	G.Father	f	Married		\N	f	t	t	419	f	f		\N	f	Rest	Local	f		0
1431	1	1	7	ER / 0001 / 330 / 1	abdul Kaleel	MALE	1952-11-13 09:49:18.848638-05	63	Husband	t	Married		\N	f	t	t	420	f	f		\N	f	Cooli	Local	f		0
1432	1	1	7	ER / 0001 / 330 / 2	Farika Begam	FEMALE	1972-11-13 09:49:18.917101-05	43	Wife	f	Married	8 Std	\N	f	t	t	420	f	f		\N	f	Home Maker	Local	f		0
1433	1	1	7	ER / 0001 / 331 / 1	Alavudin	MALE	1979-11-13 09:49:18.956299-05	36	Husband	t	Married		\N	f	t	t	421	f	f		\N	f	Bakari worker	Local	f		0
1434	1	1	7	ER / 0001 / 331 / 2	jesima	FEMALE	1987-11-13 09:49:18.986002-05	28	Wife	f	Married	5 Std	\N	f	t	t	421	f	f		\N	f	Home Maker	Local	f		0
1435	1	1	7	ER / 0001 / 331 / 3	barajon	MALE	2003-11-13 09:49:19.022138-05	12	Son	f	Single	7 Std	\N	f	t	f	421	f	f		\N	f	Student	Local	f		0
1436	1	1	7	ER / 0001 / 331 / 4	Rikana	FEMALE	2007-11-13 09:49:19.065574-05	8	Daugter	f	Single	3 Std	\N	f	t	f	421	f	f		\N	f	Student	Local	f		0
1437	1	1	7	ER / 0001 / 332 / 1	Kader Basha	MALE	1978-11-13 09:49:19.109325-05	37	Father	t	Married	9 Std	\N	f	t	t	422	f	f		\N	f	Cooli	Local	f		0
1438	1	1	7	ER / 0001 / 332 / 2	Mumthaj	FEMALE	1986-11-13 09:49:19.138425-05	29	Mother	f	Married	10 Std	\N	f	t	t	422	f	f		\N	f	Home Maker	Local	f		0
1439	1	1	7	ER / 0001 / 332 / 3	Afrina	FEMALE	2010-11-13 09:49:19.172894-05	5	Daugter	f	Single	1 Std	\N	f	t	f	422	f	f		\N	f	Student	Local	f		0
1440	1	1	7	ER / 0001 / 332 / 4	Asfiya	FEMALE	2014-11-13 09:49:19.219278-05	1	Daugter	f	Single		\N	f	t	f	422	f	f		\N	f	Baby	Local	f		0
1441	1	1	7	ER / 0001 / 333 / 1	Babu	MALE	1969-11-13 09:49:19.257055-05	46	Husband	t	Married	8 Std	\N	f	t	t	423	f	f		\N	f	Welder	Local	f		0
1442	1	1	7	ER / 0001 / 333 / 2	Mehathab Banu	FEMALE	1979-11-13 09:49:19.295315-05	36	Wife	f	Married	8 Std	\N	f	t	t	423	f	f		\N	f	Home Maker	Local	f		0
1443	1	1	7	ER / 0001 / 333 / 3	Sheik Moideen	MALE	1995-11-13 09:49:19.331385-05	20	Son	f	Single	EEE	\N	f	t	t	423	f	f		\N	f	No job	Local	f		0
1444	1	1	7	ER / 0001 / 333 / 4	sheik Ashik	MALE	1997-11-13 09:49:19.375603-05	18	Son	f	Single	UG	\N	f	t	f	423	f	f		\N	f	Student	Local	f		0
1445	1	1	7	ER / 0001 / 334 / 1	Mumthaj	FEMALE	1950-11-13 09:49:19.42915-05	65	Mother	t	Widow		\N	f	t	t	424	f	f		\N	f	Rest	Local	f		0
1446	1	1	7	ER / 0001 / 335 / 1	Shakila Banu	FEMALE	1983-11-13 09:49:19.487953-05	32	Mother	t	Widow	8 Std	\N	f	t	t	425	f	f		\N	f	Company Worker	Local	f		0
1447	1	1	7	ER / 0001 / 335 / 2	Sajina	FEMALE	1997-11-13 09:49:19.526042-05	18	Daugter	f	Single	UG	\N	f	t	f	425	f	f		\N	f	Student	Local	f		0
1448	1	1	7	ER / 0001 / 335 / 3	Liyakath Ali	MALE	1999-11-13 09:49:19.568583-05	16	Son	f	Single	10 Std	\N	f	t	f	425	f	f		\N	f	Student	Local	f		0
1449	1	1	7	ER / 0001 / 336 / 1	Peer Basha	MALE	1981-11-13 09:49:19.62661-05	34	Husband	t	Married	9 Std	\N	f	t	t	426	f	f		\N	f	Tailoer	Local	f		0
1450	1	1	7	ER / 0001 / 336 / 2	Shakira Begam	FEMALE	1989-11-13 09:49:19.664964-05	26	Wife	f	Married	6 Std	\N	f	t	t	426	f	f		\N	f	Home Maker	Local	f		0
1451	1	1	7	ER / 0001 / 336 / 3	Mubarak	MALE	2006-11-13 09:49:19.701428-05	9	Son	f	Single	3 Std	\N	f	t	f	426	f	f		\N	f	Student	Local	f		0
1452	1	1	7	ER / 0001 / 336 / 4	Sarifa Begam	FEMALE	2007-11-13 09:49:19.738491-05	8	Daugter	f	Single	2 Std	\N	f	t	f	426	f	f		\N	f	Student	Local	f		0
1453	1	1	7	ER / 0001 / 337 / 1	thajun Nisha	FEMALE	1965-11-13 09:49:19.786042-05	50	Mother	t	Widow		\N	f	t	t	427	f	f		\N	f	Rest	Local	f		0
1454	1	1	7	ER / 0001 / 337 / 2	Hahim Basha	MALE	1984-11-13 09:49:19.852764-05	31	Son	f	Married	7 Std	\N	f	t	t	427	f	f		\N	f	Welder	Local	f		0
1455	1	1	7	ER / 0001 / 337 / 3	Thasleema	FEMALE	1986-11-13 09:49:19.88737-05	29	Dau.In.Law	f	Married	10 Std	\N	f	t	f	427	f	f		\N	f	Tailoer	Local	f		0
1456	1	1	7	ER / 0001 / 337 / 4	Mohamed Anas	MALE	2007-11-13 09:49:19.921415-05	8	G.Son	f	Single	3 Std	\N	f	t	f	427	f	f		\N	f	Student	Local	f		0
1457	1	1	7	ER / 0001 / 337 / 5	Mohamed ansath	MALE	2012-11-13 09:49:19.965244-05	3	G	f	Single		\N	f	t	f	427	f	f		\N	f		Local	f		0
1458	1	1	7	ER / 0001 / 338 / 1	Syed Musthafa	MALE	1967-11-13 09:49:20.000857-05	48	Husband	t	Married	5 Std	\N	f	t	t	428	f	f		\N	f	Cooli	Local	f		0
1459	1	1	7	ER / 0001 / 338 / 2	John Begam	FEMALE	1976-11-13 09:49:20.040563-05	39	Wife	f	Married	10 Std	\N	f	t	t	428	f	f		\N	f	Home Maker	Local	f		0
1460	1	1	7	ER / 0001 / 338 / 3	Azarudin	MALE	1995-11-13 09:49:20.075986-05	20	Son	f	Single	PG	\N	f	t	t	428	f	f		\N	f	Student	Local	f		0
1461	1	1	7	ER / 0001 / 339 / 1	Harees	MALE	1981-11-13 09:49:20.12797-05	34	Husband	t	Married	DME	\N	f	t	t	429	f	f		\N	f	Company Worker	Local	f		0
1462	1	1	7	ER / 0001 / 339 / 2	Sabana	FEMALE	1987-11-13 09:49:20.157518-05	28	Wife	f	Married	10 Std	\N	f	t	t	429	f	f		\N	f	Know Basic Computer	Local	f		0
1463	1	1	7	ER / 0001 / 339 / 3	Shakina Parveen	FEMALE	2000-11-13 09:49:20.197705-05	15	Sister	f	Married	12 Std	\N	f	t	f	429	f	f		\N	f	Student	Local	f		0
1464	1	1	7	ER / 0001 / 340 / 1	Mohamed Iqbal	MALE	1982-11-13 09:49:20.252974-05	33	Husband	t	Married	EEE	\N	f	t	t	430	f	f		\N	f	Electical	Local	f		0
1465	1	1	7	ER / 0001 / 340 / 2	Jenath Begam	FEMALE	1986-11-13 09:49:20.284087-05	29	Wife	f	Married	10 Std	\N	f	t	t	430	f	f		\N	f	Tailoer	Local	f		0
1466	1	1	7	ER / 0001 / 340 / 3	Mohamed Ezas	MALE	2005-11-13 09:49:20.320966-05	10	Son	f	Single	5 Std	\N	f	t	f	430	f	f		\N	f	Student	Local	f		0
1467	1	1	7	ER / 0001 / 340 / 4	Irfana	FEMALE	2011-11-13 09:49:20.367013-05	4	Daugter	f	Single	UKG	\N	f	t	f	430	f	f		\N	f	Student	Local	f		0
1468	1	1	7	ER / 0001 / 341 / 1	Saithani Bevi	FEMALE	1977-11-13 09:49:20.411604-05	38	Mother	t	Widow	UG	\N	f	t	t	431	f	f		\N	f	Tailoer	Local	f		0
1469	1	1	7	ER / 0001 / 341 / 2	Thilrath	FEMALE	2000-11-13 09:49:20.468755-05	15	Daugter	f	Single	10 Std	\N	f	t	f	431	f	f		\N	f	Student	Local	f		0
1470	1	1	7	ER / 0001 / 342 / 1	Haan Basha	MALE	1951-11-13 09:49:20.509821-05	64	Father	t	Married		\N	f	t	t	432	f	f		\N	f	Rest	Local	f		0
1471	1	1	7	ER / 0001 / 342 / 2	Juleka Bevi	FEMALE	1963-11-13 09:49:20.55942-05	52	Mother	f	Married	5 Std	\N	f	t	t	432	f	f		\N	f	Home Maker	Local	f		0
1472	1	1	7	ER / 0001 / 342 / 3	Abdul Sathar	MALE	1979-11-13 09:49:20.614407-05	36	Son	f	Married	5 Std	\N	f	t	t	432	f	f		\N	f	Driver	Local	f		0
1473	1	1	7	ER / 0001 / 342 / 4	Rajiya Sulthana	FEMALE	1988-11-13 09:49:20.650943-05	27	Dau.In.Law	f	Married	10 Std	\N	f	t	t	432	f	f		\N	f	Home Maker	Local	f		0
1474	1	1	7	ER / 0001 / 342 / 5	Sajitha	FEMALE	2006-11-13 09:49:20.686557-05	9	Daugter	f	Single	4 Std	\N	f	t	f	432	f	f		\N	f	Student	Local	f		0
1475	1	1	7	ER / 0001 / 342 / 6	Abubaker	MALE	2009-11-13 09:49:20.733207-05	6	Son	f	Single	1 Std	\N	f	t	f	432	f	f		\N	f	Student	Local	f		0
1476	1	1	7	ER / 0001 / 343 / 1	Sheik Dawood	MALE	1966-11-13 09:49:20.777213-05	49	Father	t	Married	Ug	\N	f	t	t	433	f	f		\N	f	Mobile Service	Local	f		0
1477	1	1	7	ER / 0001 / 343 / 2	sulthana	FEMALE	1975-11-13 09:49:20.818075-05	40	Mother	f	Married	12 Std	\N	f	t	t	433	f	f		\N	f	Home Maker	Local	f		0
1478	1	1	7	ER / 0001 / 343 / 3	anees Fathima	FEMALE	1994-11-13 09:49:20.86884-05	21	Daugter	f	Single	UG	\N	f	t	t	433	f	f		\N	f	Student	Local	f		0
1479	1	1	7	ER / 0001 / 343 / 4	Sheik	MALE	2002-11-13 09:49:20.90664-05	13	Son	f	Single	6 Std	\N	f	t	f	433	f	f		\N	f	Student	Local	f		0
1480	1	1	7	ER / 0001 / 344 / 1	Mohamed Ali	MALE	1979-11-13 09:49:20.942549-05	36	Father	t	Married	10 Std	\N	f	t	t	434	f	f		\N	f	Tailoer	Local	f		0
1481	1	1	7	ER / 0001 / 344 / 2	sabina	FEMALE	1987-11-13 09:49:20.988394-05	28	Mother	f	Married	10 Std	\N	f	t	t	434	f	f		\N	f	Home Maker	Local	f		0
1482	1	1	7	ER / 0001 / 344 / 3	Shibana	FEMALE	2003-11-13 09:49:21.022744-05	12	Daugter	f	Single	7 Std	\N	f	t	f	434	f	f		\N	f	Student	Local	f		0
1483	1	1	7	ER / 0001 / 344 / 4	Sahana	FEMALE	2008-11-13 09:49:21.056741-05	7	Daugter	f	Single	2 Std	\N	f	t	f	434	f	f		\N	f	Student	Local	f		0
1484	1	1	7	ER / 0001 / 345 / 1	Ameer	MALE	1953-11-13 09:49:21.090872-05	62	Father	t	Married	5 Std	\N	f	t	t	435	f	f		\N	f	Pigal Business	Local	f		0
1485	1	1	7	ER / 0001 / 345 / 2	Ajira	FEMALE	1961-11-13 09:49:21.127123-05	54	Mother	f	Married		\N	f	t	t	435	f	f		\N	f	Home Maker	Local	f		0
1486	1	1	7	ER / 0001 / 346 / 1	Kadar Kani	MALE	1957-11-13 09:49:21.161751-05	58	Father	t	Married	5 Std	\N	f	t	t	436	f	f		\N	f	Electical	Local	f		0
1487	1	1	7	ER / 0001 / 346 / 2	Rahamath Nisha	FEMALE	1962-11-13 09:49:21.198435-05	53	Mother	f	Married		\N	f	t	t	436	f	f		\N	f	Home Maker	Local	f		0
1488	1	1	7	ER / 0001 / 346 / 3	Jafer Sathik	MALE	1990-11-13 09:49:21.242372-05	25	Son	f	Married	UG	\N	f	t	t	436	f	f		\N	f	Cell Shop	Local	f		0
1489	1	1	7	ER / 0001 / 346 / 4	Shafiya Bevi	FEMALE	1996-11-13 09:49:21.285596-05	19	Daugter	f	Married	12 Std	\N	f	t	f	436	f	f		\N	f	Need High Study	Local	f		0
1490	1	1	7	ER / 0001 / 347 / 1	Akbar Ali	MALE	1973-11-13 09:49:21.339024-05	42	Father	t	Married	UG	\N	f	t	t	437	f	f		\N	f	Business	Outstation	f		0
1491	1	1	7	ER / 0001 / 347 / 2	Shamina Farjana	FEMALE	1981-11-13 09:49:21.369234-05	34	Mother	f	Married	PG	\N	f	t	t	437	f	f		\N	f	No job	Local	f		0
1492	1	1	7	ER / 0001 / 347 / 3	Shamil	MALE	2004-11-13 09:49:21.412998-05	11	Son	f	Single	8 Std	\N	f	t	f	437	f	f		\N	f	Student	Local	f		0
1493	1	1	7	ER / 0001 / 347 / 4	Asil Unis	MALE	2010-11-13 09:49:21.456314-05	5	Son	f	Single	UKG	\N	f	t	f	437	f	f		\N	f	Student	Local	f		0
1494	1	1	7	ER / 0001 / 348 / 1	Alavudin	MALE	1950-11-13 09:49:21.499128-05	65	Father	t	Married	PUC	\N	f	t	t	438	f	f		\N	f	Sarveyar	Local	f		0
1495	1	1	7	ER / 0001 / 348 / 2	Meharun Nisha	FEMALE	1965-11-13 09:49:21.538452-05	50	Mother	f	Married	6 Std	\N	f	t	t	438	f	f		\N	f	Home Maker	Local	f		0
1496	1	1	7	ER / 0001 / 348 / 3	Sheik Jahankir	MALE	1991-11-13 09:49:21.580712-05	24	Son	f	Married	UG	\N	f	t	t	438	f	f		\N	f	Team Leader	Local	f		0
1497	1	1	7	ER / 0001 / 348 / 4	Sabna Begam	FEMALE	1993-11-13 09:49:21.61141-05	22	Dau.In.Law	f	Married	BCA	\N	f	t	t	438	f	f		\N	f	Computer Opearter	Local	f		0
1498	1	1	7	ER / 0001 / 349 / 1	Nasirull	MALE	1958-11-13 09:49:21.643248-05	57	Father	t	Married	5 Std	\N	f	t	t	439	f	f		\N	f	Rest	Local	f		0
1499	1	1	7	ER / 0001 / 349 / 2	Shakila Banu	FEMALE	1965-11-13 09:49:21.675481-05	50	Mother	f	Married	11 Std	\N	f	t	t	439	f	f		\N	f	Home Maker	Local	f		0
1500	1	1	7	ER / 0001 / 349 / 3	Laskar Bahadur	MALE	1983-11-13 09:49:21.705453-05	32	Son	f	Married	10 Std	\N	f	t	t	439	f	f		\N	f	Government	Local	f		0
1501	1	1	7	ER / 0001 / 349 / 4	Barkath	FEMALE	1990-11-13 09:49:21.735054-05	25	Daugter	f	Married	12 Std	\N	f	t	t	439	f	f		\N	f	Home Maker	Local	f		0
1502	1	1	7	ER / 0001 / 349 / 5	Ubidull	MALE	1985-11-13 09:49:21.765652-05	30	Son	f	Married	UG	\N	f	t	t	439	f	f		\N	f	Electical	Local	f		0
1503	1	1	7	ER / 0001 / 349 / 6	Bousiya	FEMALE	1992-11-13 09:49:21.798398-05	23	Dau.In.Law	f	Married	UG	\N	f	t	t	439	f	f		\N	f	Home Maker	Local	f		0
1504	1	1	7	ER / 0001 / 349 / 7	Sheik Mujeeb	MALE	1987-11-13 09:49:21.830508-05	28	Son	f	Single	5 Std	\N	f	t	t	439	f	f		\N	f	Labour	Local	f		0
1505	1	1	7	ER / 0001 / 349 / 8	Mohamed Fakath	MALE	2012-11-13 09:49:21.860463-05	3	G.Son	f	Single		\N	f	t	f	439	f	f		\N	f	Baby	Local	f		0
1506	1	1	7	ER / 0001 / 349 / 9	Mohamed Numar	MALE	2014-11-13 09:49:21.895621-05	1	G.Son	f	Single		\N	f	t	f	439	f	f		\N	f	Baby	Local	f		0
1507	1	1	7	ER / 0001 / 349 / 10	Ameena	FEMALE	2014-11-13 09:49:21.925003-05	1	G.Daugter	f	Single		\N	f	t	f	439	f	f		\N	f	Baby	Local	f		0
1508	1	1	7	ER / 0001 / 350 / 1	Mohamed Jakir	MALE	1985-11-13 09:49:21.95487-05	30	Father	t	Married	DME	\N	f	t	t	440	f	f		\N	f	Superviser	Local	f		0
1509	1	1	7	ER / 0001 / 350 / 2	Safiya Banu	FEMALE	1987-11-13 09:49:21.981132-05	28	Mother	f	Married	Alima	\N	f	t	t	440	f	f		\N	f	Know Tailoring	Local	f		0
1510	1	1	7	ER / 0001 / 350 / 3	Sabana	FEMALE	2007-11-13 09:49:22.011066-05	8	Daugter	f	Single	4 Std	\N	f	t	f	440	f	f		\N	f	Student	Local	f		0
1511	1	1	7	ER / 0001 / 350 / 4	Mohamed Sakil	MALE	2011-11-13 09:49:22.04253-05	4	Son	f	Single	UKG	\N	f	t	f	440	f	f		\N	f	Student	Local	f		0
1512	1	1	7	ER / 0001 / 351 / 1	Syedull	MALE	1976-11-13 09:49:22.077562-05	39	Father	t	Married	5 Std	\N	f	t	t	441	f	f		\N	f	Cooli	Local	f		0
1513	1	1	7	ER / 0001 / 351 / 2	Kayasar Jaha	FEMALE	1980-11-13 09:49:22.104504-05	35	Mother	f	Married	5 Std	\N	f	t	t	441	f	f		\N	f	Home Maker	Local	f		0
1514	1	1	7	ER / 0001 / 351 / 3	Salman	MALE	2008-11-13 09:49:22.137817-05	7	Son	f	Single	2 Std	\N	f	t	f	441	f	f		\N	f	Student	Local	f		0
1515	1	1	7	ER / 0001 / 351 / 4	Vasivull	MALE	2007-11-13 09:49:22.169551-05	8	Son	f	Single	6 Std	\N	f	t	f	441	f	f		\N	f	Student	Local	f		0
1516	1	1	7	ER / 0001 / 351 / 5	Noorjahan	FEMALE	2002-11-13 09:49:22.202938-05	13	Son	f	Single	5 Std	\N	f	t	f	441	f	f		\N	f	Student	Local	f		0
1517	1	1	7	ER / 0001 / 351 / 6	Shajahan	MALE	2005-11-13 09:49:22.237214-05	10	Son	f	Single	4 Std	\N	f	t	f	441	f	f		\N	f	Student	Local	f		0
1518	1	1	7	ER / 0001 / 351 / 7	Hasina	FEMALE	2010-11-13 09:49:22.268797-05	5	Daugter	f	Single	LKG	\N	f	t	f	441	f	f		\N	f	Student	Local	f		0
1519	1	1	7	ER / 0001 / 351 / 8	Mubasira	FEMALE	2012-11-13 09:49:22.299555-05	3	Daugter	f	Single		\N	f	t	f	441	f	f		\N	f	Baby	Local	f		0
1520	1	1	7	ER / 0001 / 352 / 1	Bajid Rahman	MALE	1972-11-13 09:49:22.324724-05	43	Father	t	Married	10 Std	\N	f	t	t	442	f	f		\N	f	Company Worker	Local	f		0
1521	1	1	7	ER / 0001 / 352 / 2	Saliha Badul	FEMALE	1977-11-13 09:49:22.352806-05	38	Mother	f	Married	PG	\N	f	t	t	442	f	f		\N	f	Teacher	Local	f		0
1522	1	1	7	ER / 0001 / 352 / 3	Farha Safrin	FEMALE	2003-11-13 09:49:22.384368-05	12	Daugter	f	Single	7 Std	\N	f	t	f	442	f	f		\N	f	Student	Local	f		0
1523	1	1	7	ER / 0001 / 352 / 4	Salman Farisi	MALE	2005-11-13 09:49:22.41555-05	10	Son	f	Single	5 Std	\N	f	t	f	442	f	f		\N	f	Student	Local	f		0
1524	1	1	7	ER / 0001 / 353 / 1	Afsal	MALE	1989-11-13 09:49:22.446492-05	26	Father	t	Married	3 Std	\N	f	t	t	443	f	f		\N	f	Tailoer	Local	f		0
1525	1	1	7	ER / 0001 / 353 / 2	Anisha	FEMALE	1992-11-13 09:49:22.468005-05	23	Mother	f	Married		\N	f	t	t	443	f	f		\N	f	Teacher	Local	f		0
1526	1	1	7	ER / 0001 / 353 / 3	Mathina	FEMALE	1985-11-13 09:49:22.49966-05	30	Sister	f	Married	10 Std	\N	f	t	t	443	f	f		\N	f	Home Maker	Local	f		0
1527	1	1	7	ER / 0001 / 353 / 4	Kairun	FEMALE	1987-11-13 09:49:22.525676-05	28	Sister	f	Married	10 Std	\N	f	t	t	443	f	f		\N	f	Home Maker	Local	f		0
1528	1	1	7	ER / 0001 / 353 / 5	Farjana	FEMALE	2001-11-13 09:49:22.556642-05	14	Sister	f	Single	10 Std	\N	f	t	f	443	f	f		\N	f	Student	Local	f		0
1529	1	1	7	ER / 0001 / 353 / 6	Abdul Kalam	MALE	2003-11-13 09:49:22.589485-05	12	G.Son	f	Single	7 Std	\N	f	t	f	443	f	f		\N	f	Student	Local	f		0
1530	1	1	7	ER / 0001 / 353 / 7	Salima	FEMALE	1975-11-13 09:49:22.631614-05	40	G.Mother	f	Married		\N	f	t	t	443	f	f		\N	f	Home Maker	Local	f		0
1531	1	1	7	ER / 0001 / 354 / 1	Anwardin	MALE	1978-11-13 09:49:22.666988-05	37	Husband	t	Married	10 Std	\N	f	t	t	444	f	f		\N	f	Auto Driver	Local	f		0
1532	1	1	7	ER / 0001 / 354 / 2	Aseena Banu	FEMALE	1981-11-13 09:49:22.70409-05	34	Wife	f	Married	10 Std	\N	f	t	t	444	f	f		\N	f	Home Maker	Local	f		0
1533	1	1	7	ER / 0001 / 354 / 3	Mohamed Arsath	MALE	2002-11-13 09:49:22.752231-05	13	Son	f	Single	6 Std	\N	f	t	f	444	f	f		\N	f	Student	Local	f		0
1534	1	1	7	ER / 0001 / 354 / 4	Afrith	FEMALE	2009-11-13 09:49:22.797503-05	6	Daugter	f	Single	1 Std	\N	f	t	f	444	f	f		\N	f	Student	Local	f		0
1535	1	1	7	ER / 0001 / 355 / 1	Musthafa	MALE	1982-11-13 09:49:22.843341-05	33	Husband	t	Married	6 Std	\N	f	t	t	445	f	f		\N	f	Machanic	Local	f		0
1536	1	1	7	ER / 0001 / 355 / 2	Suhara	FEMALE	1988-11-13 09:49:22.888455-05	27	Wife	f	Married	8 Std	\N	f	t	t	445	f	f		\N	f	Home Maker	Local	f		0
1537	1	1	7	ER / 0001 / 355 / 3	sajudin	MALE	2008-11-13 09:49:22.931689-05	7	Son	f	Single	1 Std	\N	f	t	f	445	f	f		\N	f	Student	Local	f		0
1538	1	1	7	ER / 0001 / 355 / 4	Basith  	MALE	2010-11-13 09:49:22.966168-05	5	Son	f	Single	UKG	\N	f	t	f	445	f	f		\N	f	Student	Local	f		0
1539	1	1	7	ER / 0001 / 356 / 1	Shakila Begam	FEMALE	1970-11-13 09:49:23.005031-05	45	Mother	t	Single	5 Std	\N	f	t	f	446	f	f		\N	f	Home Maker	Local	f		0
1540	1	1	7	ER / 0001 / 356 / 2	Arsath Khan	MALE	1994-11-13 09:49:23.042013-05	21	Son	f	Single	10 Std	\N	f	t	f	446	f	f		\N	f	Tailoer	Local	f		0
1541	1	1	7	ER / 0001 / 357 / 1	Sathik Basha	MALE	1981-11-13 09:49:23.078832-05	34	Husband	t	Married	8 Std	\N	f	t	t	447	f	f		\N	f	Business	Local	f		0
1542	1	1	7	ER / 0001 / 357 / 2	Noor Jahan	FEMALE	1989-11-13 09:49:23.128396-05	26	Wife	f	Married	UG	\N	f	t	t	447	f	f		\N	f	Teacher	Local	f		0
1543	1	1	7	ER / 0001 / 357 / 3	Mohamed Asif	MALE	2008-11-13 09:49:23.176687-05	7	Son	f	Single	2 Std	\N	f	t	f	447	f	f		\N	f	Student	Local	f		0
1544	1	1	7	ER / 0001 / 358 / 1	Narkis Begam	FEMALE	1960-11-13 09:49:23.233544-05	55	Mother	t	Married	4 Std	\N	f	t	t	448	f	f		\N	f	Home Maker	Local	f		0
1545	1	1	7	ER / 0001 / 358 / 2	Thvsith	MALE	1991-11-13 09:49:23.268289-05	24	Son	f	Single	10 Std	\N	f	t	t	448	f	f		\N	f	Painter	Local	f		0
1546	1	1	7	ER / 0001 / 359 / 1	Aslam	MALE	1991-11-13 09:49:23.339475-05	24	Husband	t	Married	8 Std	\N	f	t	t	449	f	f		\N	f	Cooli	Local	f		0
1547	1	1	7	ER / 0001 / 359 / 2	Aseena  	FEMALE	1992-11-13 09:49:23.389298-05	23	Wife	f	Married	5 Std	\N	f	t	t	449	f	f		\N	f	Tailoer	Local	f		0
1548	1	1	7	ER / 0001 / 360 / 1	Azam	MALE	1972-11-13 09:49:23.428327-05	43	Husband	t	Married	5 Std	\N	f	t	t	450	f	f		\N	f	Painter	Local	f		0
1549	1	1	7	ER / 0001 / 360 / 2	Mumthaj	FEMALE	1974-11-13 09:49:23.475899-05	41	Wife	f	Married	3 Std	\N	f	t	t	450	f	f		\N	f	Home Maker	Local	f		0
1550	1	1	7	ER / 0001 / 360 / 3	Jarina	FEMALE	2000-11-13 09:49:23.51162-05	15	Daugter	f	Single	10 Std	\N	f	t	f	450	f	f		\N	f	Student	Local	f		0
1551	1	1	7	ER / 0001 / 361 / 1	Abdull	MALE	1977-11-13 09:49:23.567498-05	38	Husband	t	Married	5 Std	\N	f	t	t	451	f	f		\N	f	Tea Master	Local	f		0
1552	1	1	7	ER / 0001 / 361 / 2	John Sulthana	FEMALE	1991-11-13 09:49:23.608107-05	24	Wife	f	Married	5 Std	\N	f	t	t	451	f	f		\N	f	Home Maker	Local	f		0
1553	1	1	7	ER / 0001 / 361 / 3	Abdul Rihan	MALE	2007-11-13 09:49:23.644398-05	8	Son	f	Single	2 Std	\N	f	t	f	451	f	f		\N	f	Student	Local	f		0
1554	1	1	7	ER / 0001 / 361 / 4	Abdul Rahim	MALE	2013-11-13 09:49:23.681998-05	2	Son	f	Single		\N	f	t	f	451	f	f		\N	f	Baby	Local	f		0
1555	1	1	7	ER / 0001 / 362 / 1	Piyaru	MALE	1955-11-13 09:49:23.719299-05	60	Father	t	Married	8 Std	\N	f	t	t	452	f	f		\N	f	Rest	Local	f		0
1556	1	1	7	ER / 0001 / 362 / 2	Amina	FEMALE	1960-11-13 09:49:23.761748-05	55	Mother	f	Married	3 Std	\N	f	t	t	452	f	f		\N	f	Home Maker	Local	f		0
1557	1	1	7	ER / 0001 / 362 / 3	Nasrin Sulthana	FEMALE	1991-11-13 09:49:23.811329-05	24	Daugter	f	Single	UG	\N	f	t	t	452	f	f		\N	f	Search Job	Local	f		0
1558	1	1	7	ER / 0001 / 362 / 4	Thahira Banu	FEMALE	1991-11-13 09:49:23.855443-05	24	Daugter	f	Single	UG	\N	f	t	t	452	f	f		\N	f	Search Job	Local	f		0
1559	1	1	7	ER / 0001 / 362 / 5	Sadam Usain	MALE	1995-11-13 09:49:23.915416-05	20	Son	f	Single	UG	\N	f	t	t	452	f	f		\N	f	Search Job	Local	f		0
1560	1	1	7	ER / 0001 / 363 / 1	John Basha	MALE	1966-11-13 09:49:23.961276-05	49	Father	t	Married	4 Std	\N	f	t	t	453	f	f		\N	f	Cycle Shop	Local	f		0
1561	1	1	7	ER / 0001 / 363 / 2	Jinath Nisha	FEMALE	1971-11-13 09:49:23.991628-05	44	Mother	f	Married		\N	f	t	t	453	f	f		\N	f	Home Maker	Local	f		0
1562	1	1	7	ER / 0001 / 363 / 3	Hasan	MALE	1990-11-13 09:49:24.038242-05	25	Son	f	Married	6 Std	\N	f	t	t	453	f	f		\N	f	Tailoer	Local	f		0
1563	1	1	7	ER / 0001 / 363 / 4	Ummu Salama	FEMALE	1993-11-13 09:49:24.073217-05	22	Dau.In.Law	f	Married	10 Std	\N	f	t	t	453	f	f		\N	f	Home Maker	Local	f		0
1564	1	1	7	ER / 0001 / 363 / 5	Mohamed Saif	MALE	2014-11-13 09:49:24.108829-05	1	G.Son	f	Single		\N	f	t	f	453	f	f		\N	f	Baby	Local	f		0
1565	1	1	7	ER / 0001 / 364 / 1	Ameer	MALE	1930-11-13 09:49:24.144158-05	85	Father	t	Married		\N	f	t	t	454	f	f		\N	f	Rest	Local	f		0
1566	1	1	7	ER / 0001 / 365 / 1	Mohamed Ali	MALE	1980-11-13 09:49:24.190781-05	35	Husband	t	Married	6 Std	\N	f	t	t	455	f	f		\N	f	Painter	Local	f		0
1567	1	1	7	ER / 0001 / 365 / 2	Najiya	FEMALE	1989-11-13 09:49:24.227837-05	26	Wife	f	Married		\N	f	t	t	455	f	f		\N	f	Home Maker	Local	f		0
1568	1	1	7	ER / 0001 / 366 / 1	Jamsha	MALE	1960-11-13 09:49:24.266583-05	55	Father	t	Married	10 Std	\N	f	t	t	456	f	f		\N	f	Rest	Local	f		0
1569	1	1	7	ER / 0001 / 366 / 2	Noorjahan	FEMALE	1970-11-13 09:49:24.308817-05	45	Mother	f	Married	10 Std	\N	f	t	t	456	f	f		\N	f	Home Maker	Local	f		0
1570	1	1	7	ER / 0001 / 366 / 3	Mohamed Irfan	MALE	1990-11-13 09:49:24.352746-05	25	Son	f	Married	10 Std	\N	f	t	t	456	f	f		\N	f	Cooli	Local	f		0
1571	1	1	7	ER / 0001 / 366 / 4	Sabana Yasmin	FEMALE	1993-11-13 09:49:24.390975-05	22	Dau.In.Law	f	Married	8 Std	\N	f	t	t	456	f	f		\N	f	Cooli	Local	f		0
1572	1	1	7	ER / 0001 / 366 / 5	Mohamed Samir	MALE	2011-11-13 09:49:24.431059-05	4	G.Son	f	Single	LKG	\N	f	t	f	456	f	f		\N	f	Student	Local	f		0
1573	1	1	7	ER / 0001 / 367 / 1	Shahul Hameed	MALE	1978-11-13 09:49:24.468332-05	37	Husband	t	Married	9 Std	\N	f	t	t	457	f	f		\N	f	Emraidu Shop	Local	f		0
1574	1	1	7	ER / 0001 / 367 / 2	Jannathul Firthose	FEMALE	1983-11-13 09:49:24.498463-05	32	Wife	f	Married	7 Std	\N	f	t	t	457	f	f		\N	f	Home Maker	Local	f		0
1575	1	1	7	ER / 0001 / 367 / 3	Mohamed Ashik	MALE	2011-11-13 09:49:24.534245-05	4	Son	f	Single	LKG	\N	f	t	f	457	f	f		\N	f	Student	Local	f		0
1576	1	1	7	ER / 0001 / 367 / 4	nasrin Fathima	FEMALE	2009-11-13 09:49:24.578803-05	6	Daugter	f	Single	1 Std	\N	f	t	f	457	f	f		\N	f	Student	Local	f		0
1577	1	1	7	ER / 0001 / 368 / 1	Mohamed Rahamathull	MALE	1985-11-13 09:49:24.603719-05	30	Husband	t	Married	5 Std	\N	f	t	t	458	f	f		\N	f	Business	Local	f		0
1578	1	1	7	ER / 0001 / 368 / 2	Nilofer Nisha	FEMALE	1986-11-13 09:49:24.621011-05	29	Wife	f	Married	6 Std	\N	f	t	t	458	f	f		\N	f	Home Maker	Local	f		0
1579	1	1	7	ER / 0001 / 368 / 3	Mohamed Rajik	MALE	2007-11-13 09:49:24.641608-05	8	Son	f	Single	3 Std	\N	f	t	f	458	f	f		\N	f	Student	Local	f		0
1580	1	1	7	ER / 0001 / 369 / 1	Alavudin	MALE	1971-11-13 09:49:24.665358-05	44	Husband	t	Married	6 Std	\N	f	t	t	459	f	f		\N	f	Hotel worker	Local	f		0
1581	1	1	7	ER / 0001 / 369 / 2	Rahamath Nisha	FEMALE	1982-11-13 09:49:24.685729-05	33	Wife	f	Married	6 Std	\N	f	t	t	459	f	f		\N	f	Tailoer	Local	f		0
1582	1	1	7	ER / 0001 / 369 / 3	Syed Ali Fathima	FEMALE	2005-11-13 09:49:24.709311-05	10	Daugter	f	Single	5 Std	\N	f	t	f	459	f	f		\N	f	Student	Local	f		0
1583	1	1	7	ER / 0001 / 369 / 4	Jailani	MALE	2006-11-13 09:49:24.728533-05	9	Son	f	Single	4 Std	\N	f	t	f	459	f	f		\N	f	Student	Local	f		0
1584	1	1	7	ER / 0001 / 370 / 1	Dahima	FEMALE	1959-11-13 09:49:24.747873-05	56	Mother	t	Married	5 Std	\N	f	t	t	460	f	f		\N	f	Home Maker	Local	f		0
1585	1	1	7	ER / 0001 / 370 / 2	Sirajudin	MALE	1982-11-13 09:49:24.768611-05	33	Son	f	Married	8 Std	\N	f	t	t	460	f	f		\N	f	Opticals Shop	Local	f		0
1586	1	1	7	ER / 0001 / 370 / 3	samsath Begam	FEMALE	1983-11-13 09:49:24.787536-05	32	Dau.In.Law	f	Married	UG	\N	f	t	t	460	f	f		\N	f	Home Maker	Local	f		0
1587	1	1	7	ER / 0001 / 370 / 4	Afrina	FEMALE	2006-11-13 09:49:24.80771-05	9	G.Daugter	f	Single	3 Std	\N	f	t	f	460	f	f		\N	f	Student	Local	f		0
1588	1	1	7	ER / 0001 / 370 / 5	Adhil	MALE	2011-11-13 09:49:24.832964-05	4	G.Son	f	Single	LKG	\N	f	t	f	460	f	f		\N	f	Student	Local	f		0
1589	1	1	7	ER / 0001 / 371 / 1	Muthalib	MALE	1966-11-13 09:49:24.857297-05	49	Husband	t	Married	6 Std	\N	f	t	t	461	f	f		\N	f	Painter	Local	f		0
1590	1	1	7	ER / 0001 / 371 / 2	Jarina	FEMALE	1972-11-13 09:49:24.877859-05	43	Wife	f	Married	6 Std	\N	f	t	t	461	f	f		\N	f	Home Maker	Local	f		0
1591	1	1	7	ER / 0001 / 371 / 3	Abdul Rahim	MALE	1988-11-13 09:49:24.900885-05	27	Son	f	Single	12 Std	\N	f	t	t	461	f	f		\N	f	Company Worker	Local	f		0
1592	1	1	7	ER / 0001 / 372 / 1	Mohamed Kabrul Akbar	MALE	1986-11-13 09:49:24.924686-05	29	Husband	t	Married	12 Std	\N	f	t	t	462	f	f		\N	f	Cell Shop Worker	Local	f		0
1593	1	1	7	ER / 0001 / 372 / 2	Sabrin BaNU	FEMALE	1992-11-13 09:49:24.940985-05	23	Wife	f	Married		\N	f	t	t	462	f	f		\N	f	Home Maker	Local	f		0
1594	1	1	7	ER / 0001 / 372 / 3	Mohamed Siddiq	MALE	2010-11-13 09:49:24.96194-05	5	Son	f	Single	1 Std	\N	f	t	f	462	f	f		\N	f	Student	Local	f		0
1595	1	1	7	ER / 0001 / 372 / 4	Mohamed Kathija	FEMALE	2013-11-13 09:49:24.980976-05	2	Daugter	f	Single		\N	f	t	f	462	f	f		\N	f	Baby	Local	f		0
1596	1	1	7	ER / 0001 / 373 / 1	Shajahan	MALE	1983-11-13 09:49:25.000226-05	32	Husband	t	Married	8 Std	\N	f	t	t	463	f	f		\N	f	Rediter Works	Local	f		0
1597	1	1	7	ER / 0001 / 373 / 2	Balkis	FEMALE	1995-11-13 09:49:25.016893-05	20	Wife	f	Married	10 Std	\N	f	t	t	463	f	f		\N	f	Home Maker	Local	f		0
1598	1	1	7	ER / 0001 / 374 / 1	Ismail	MALE	1982-11-13 09:49:25.035162-05	33	Husband	t	Married	10 Std	\N	f	t	t	464	f	f		\N	f	Tailoer	Local	f		0
1599	1	1	7	ER / 0001 / 374 / 2	Jannathul Firthose	FEMALE	1985-11-13 09:49:25.060943-05	30	Wife	f	Married	6 Std	\N	f	t	t	464	f	f		\N	f	Tailoer	Local	f		0
1600	1	1	7	ER / 0001 / 374 / 3	Nilofer Nisha	FEMALE	2012-11-13 09:49:25.085589-05	3	Daugter	f	Single		\N	f	t	f	464	f	f		\N	f	Baby	Local	f		0
1601	1	1	7	ER / 0001 / 375 / 1	Kaja Moidin	MALE	1950-11-13 09:49:25.105673-05	65	Husband	t	Married	10 Std	\N	f	t	t	465	f	f		\N	f	Rest	Local	f		0
1602	1	1	7	ER / 0001 / 375 / 2	Shakila Banu	FEMALE	1959-11-13 09:49:25.126727-05	56	Wife	f	Married		\N	f	t	t	465	f	f		\N	f	Home Maker	Local	f		0
1603	1	1	7	ER / 0001 / 376 / 1	Rahim	MALE	1951-11-13 09:49:25.144873-05	64	Husband	t	Married		\N	f	t	t	466	f	f		\N	f	Rest	Local	f		0
1604	1	1	7	ER / 0001 / 376 / 2	Piyari	FEMALE	1957-11-13 09:49:25.172521-05	58	Wife	f	Married		\N	f	t	t	466	f	f		\N	f	Home Maker	Local	f		0
1605	1	1	7	ER / 0001 / 377 / 1	Noor Mohamed	MALE	1987-11-13 09:49:25.191041-05	28	Husband	t	Married	5 Std	\N	f	t	t	467	f	f		\N	f	Emraidu Shop Worker	Local	f		0
1606	1	1	7	ER / 0001 / 377 / 2	sulthana	FEMALE	1989-11-13 09:49:25.210745-05	26	Wife	f	Married	8 Std	\N	f	t	t	467	f	f		\N	f	Tailoer	Local	f		0
1607	1	1	7	ER / 0001 / 377 / 3	Arshiya	FEMALE	2009-11-13 09:49:25.233735-05	6	Daugter	f	Single	1 Std	\N	f	t	f	467	f	f		\N	f	Student	Local	f		0
1608	1	1	7	ER / 0001 / 377 / 4	Amjiya	FEMALE	2012-11-13 09:49:25.262488-05	3	Daugter	f	Single		\N	f	t	f	467	f	f		\N	f	Baby	Local	f		0
1609	1	1	7	ER / 0001 / 378 / 1	Mohamed Sharif	MALE	1972-11-13 09:49:25.282978-05	43	Husband	t	Married	5 Std	\N	f	t	t	468	f	f		\N	f	Cooli	Local	f		0
1610	1	1	7	ER / 0001 / 378 / 2	Sabura	FEMALE	1984-11-13 09:49:25.303643-05	31	Wife	f	Married	5 Std	\N	f	t	t	468	f	f		\N	f	Tailoer	Local	f		0
1611	1	1	7	ER / 0001 / 378 / 3	Mohamed Novfal	MALE	2006-11-13 09:49:25.327395-05	9	Son	f	Single	4 Std	\N	f	t	f	468	f	f		\N	f	Student	Local	f		0
1612	1	1	7	ER / 0001 / 378 / 4	Habeeb Nasrudin	MALE	2009-11-13 09:49:25.3521-05	6	Son	f	Single	1 Std	\N	f	t	f	468	f	f		\N	f	Student	Local	f		0
1613	1	1	7	ER / 0001 / 379 / 1	Mahamutha	FEMALE	1961-11-13 09:49:25.376992-05	54	Mother	t	Single		\N	f	t	t	469	f	f		\N	f	Home Maker	Local	f		0
1614	1	1	7	ER / 0001 / 379 / 2	sheik Mohamed	MALE	1985-11-13 09:49:25.397026-05	30	Son	f	Married	4 Std	\N	f	t	t	469	f	f		\N	f	Auto Driver	Local	f		0
1615	1	1	7	ER / 0001 / 379 / 3	Jarina	FEMALE	1992-11-13 09:49:25.41634-05	23	Dau.In.Law	f	Married	11 Std	\N	f	t	t	469	f	f		\N	f	Tailoer	Local	f		0
1616	1	1	7	ER / 0001 / 379 / 4	Jasmitha Thasnim	FEMALE	2011-11-13 09:49:25.440135-05	4	Daugter	f	Single	LKG	\N	f	t	f	469	f	f		\N	f	Student	Local	f		0
1617	1	1	7	ER / 0001 / 380 / 1	Anwar Basha	MALE	1972-11-13 09:49:25.464407-05	43	Husband	t	Married	8 Std	\N	f	t	t	470	f	f		\N	f	Cooli	Local	f		0
1618	1	1	7	ER / 0001 / 380 / 2	Aseena Banu	FEMALE	1980-11-13 09:49:25.484654-05	35	Wife	f	Married	12 Std	\N	f	t	t	470	f	f		\N	f	Know Tailoring	Local	f		0
1619	1	1	7	ER / 0001 / 380 / 3	Aifiya	FEMALE	2001-11-13 09:49:25.502828-05	14	Daugter	f	Single	9 Std	\N	f	t	f	470	f	f		\N	f	Student	Local	f		0
1620	1	1	7	ER / 0001 / 380 / 4	anees Fathima	FEMALE	2007-11-13 09:49:25.530754-05	8	Daugter	f	Single	4 Std	\N	f	t	f	470	f	f		\N	f	Student	Local	f		0
1621	1	1	7	ER / 0001 / 381 / 1	Shajahan	MALE	1969-11-13 09:49:25.558861-05	46	Husband	t	Married	7 Std	\N	f	t	t	471	f	f		\N	f	Lorry Painter	Local	f		0
1622	1	1	7	ER / 0001 / 381 / 2	Sabana	FEMALE	1979-11-13 09:49:25.584572-05	36	Wife	f	Married	10 Std	\N	f	t	t	471	f	f		\N	f	Home Maker	Local	f		0
1623	1	1	7	ER / 0001 / 381 / 3	Salman	MALE	1999-11-13 09:49:25.603801-05	16	Son	f	Single	EEE	\N	f	t	f	471	f	f		\N	f	Student	Local	f		0
1624	1	1	7	ER / 0001 / 381 / 4	Jakir	MALE	2003-11-13 09:49:25.628938-05	12	Son	f	Single	8 Std	\N	f	t	f	471	f	f		\N	f	Student	Local	f		0
1625	1	1	7	ER / 0001 / 381 / 5	Sakina	FEMALE	2006-11-13 09:49:25.654329-05	9	Daugter	f	Single	4 Std	\N	f	t	f	471	f	f		\N	f	Student	Local	f		0
1626	1	1	7	ER / 0001 / 381 / 6	Najmudin	MALE	1960-11-13 09:49:25.678876-05	55	G.Father	f	Married	10 Std	\N	f	t	t	471	f	f		\N	f	Writer	Local	f		0
1627	1	1	7	ER / 0001 / 382 / 1	Sirajudin	MALE	1958-11-13 09:49:25.698077-05	57	Husband	t	Married	6 Std	\N	f	t	t	472	f	f		\N	f	Driver	Local	f		0
1628	1	1	7	ER / 0001 / 382 / 2	Rabiya Banu	FEMALE	1962-11-13 09:49:25.718583-05	53	Wife	f	Married	5 Std	\N	f	t	t	472	f	f		\N	f	Know Tailoring	Local	f		0
1629	1	1	7	ER / 0001 / 383 / 1	Subetha	FEMALE	1947-11-13 09:49:25.741613-05	68	Mother	t	Widow		\N	f	t	t	473	f	f		\N	f	Home Work	Local	f		0
1630	1	1	7	ER / 0001 / 383 / 2	Syed Ahmed	MALE	1972-11-13 09:49:25.77065-05	43	Son	f	Married	5 Std	\N	f	t	t	473	f	f		\N	f	Painter	Local	f		0
1631	1	1	7	ER / 0001 / 383 / 3	Jinath Begam	FEMALE	1984-11-13 09:49:25.789472-05	31	Dau.In.Law	f	Married	5 Std	\N	f	t	t	473	f	f		\N	f	Home Maker	Local	f		0
1632	1	1	7	ER / 0001 / 384 / 1	Saleem Basha	MALE	1988-11-13 09:49:25.808318-05	27	Husband	t	Married	UG	\N	f	t	t	474	f	f		\N	f	Company Worker	Local	f		0
1633	1	1	7	ER / 0001 / 384 / 2	Mubeen Sulthana	FEMALE	1991-11-13 09:49:25.824374-05	24	Wife	f	Married	10 Std	\N	f	t	t	474	f	f		\N	f	Home Maker	Local	f		0
1634	1	1	7	ER / 0001 / 384 / 3	Thamana Thasneem	FEMALE	2009-11-13 09:49:25.843322-05	6	Daugter	f	Single	1 Std	\N	f	t	f	474	f	f		\N	f	Student	Local	f		0
1635	1	1	7	ER / 0001 / 385 / 1	Ahmed Basha	MALE	1965-11-13 09:49:25.866545-05	50	Husband	t	Married	DMLT	\N	f	t	t	475	f	f		\N	f	Lab Machanic	Local	f		0
1636	1	1	7	ER / 0001 / 385 / 2	Savura Begam	FEMALE	1969-11-13 09:49:25.882278-05	46	Wife	f	Married		\N	f	t	t	475	f	f		\N	f	Home Maker	Local	f		0
1637	1	1	7	ER / 0001 / 385 / 3	Aslam Basha	MALE	1990-11-13 09:49:25.901173-05	25	Son	f	Married	UG	\N	f	t	t	475	f	f		\N	f	Search Job	Local	f		0
1638	1	1	7	ER / 0001 / 385 / 4	Farsana	FEMALE	1993-11-13 09:49:25.929006-05	22	Dau.In.Law	f	Married	PG	\N	f	t	t	475	f	f		\N	f	Search Job	Local	f		0
1639	1	1	7	ER / 0001 / 386 / 1	Bava	MALE	1988-11-13 09:49:25.953176-05	27	Husband	t	Married	5 Std	\N	f	t	t	476	f	f		\N	f	Tea Master	Local	f		0
1640	1	1	7	ER / 0001 / 386 / 2	Samsiya	FEMALE	1990-11-13 09:49:25.96954-05	25	Wife	f	Married	10 Std	\N	f	t	t	476	f	f		\N	f	Home Maker	Local	f		0
1641	1	1	7	ER / 0001 / 386 / 3	Shibana	FEMALE	2012-11-13 09:49:25.994407-05	3	Daugter	f	Single		\N	f	t	f	476	f	f		\N	f		Local	f		0
1642	1	1	7	ER / 0001 / 387 / 1	Mohamed Nabi	MALE	1967-11-13 09:49:26.013911-05	48	Husband	t	Married	ITI	\N	f	t	t	477	f	f		\N	f	Electical	Local	f		0
1643	1	1	7	ER / 0001 / 387 / 2	Kadar Bevi	FEMALE	1969-11-13 09:49:26.034166-05	46	Wife	f	Married	7 Std	\N	f	t	t	477	f	f		\N	f	Know Tailoring	Local	f		0
1644	1	1	7	ER / 0001 / 387 / 3	Shahana	FEMALE	2006-11-13 09:49:26.05332-05	9	Daugter	f	Single	4 Std	\N	f	t	f	477	f	f		\N	f	Student	Local	f		0
1645	1	1	7	ER / 0001 / 388 / 1	John Basha	MALE	1950-11-13 09:49:26.077377-05	65	Father	t	Married		\N	f	t	t	478	f	f		\N	f	Lorry Tinger	Local	f		0
1646	1	1	7	ER / 0001 / 388 / 2	Makbul	FEMALE	1967-11-13 09:49:26.097138-05	48	Mother	f	Married		\N	f	t	t	478	f	f		\N	f	Home Maker	Local	f		0
1647	1	1	7	ER / 0001 / 388 / 3	Banu	FEMALE	1985-11-13 09:49:26.119577-05	30	Daugter	f	Devorced	5 Std	\N	f	t	t	478	f	f		\N	f	Company Worker	Local	f		0
1648	1	1	7	ER / 0001 / 388 / 4	Areef	MALE	2002-11-13 09:49:26.143591-05	13	G.Son	f	Single	9 Std	\N	f	t	f	478	f	f		\N	f	Student	Local	f		0
1649	1	1	7	ER / 0001 / 388 / 5	Meera Jasmin	FEMALE	2005-11-13 09:49:26.171432-05	10	G.Daugter	f	Single	7 Std	\N	f	t	f	478	f	f		\N	f	Student	Local	f		0
1650	1	1	7	ER / 0001 / 389 / 1	Parveen	FEMALE	1971-11-13 09:49:26.199179-05	44	Mother	t	Widow		\N	f	t	t	479	f	f		\N	f	Tailoer	Local	f		0
1651	1	1	7	ER / 0001 / 389 / 2	Ashik Ali	MALE	2000-11-13 09:49:26.231844-05	15	Son	f	Single	10 Std	\N	f	t	f	479	f	f		\N	f	Student	Local	f		0
1652	1	1	7	ER / 0001 / 390 / 1	Arivu Moosa	MALE	1985-11-13 09:49:26.255456-05	30	Husband	t	Married	9 Std	\N	f	t	t	480	f	f		\N	f	Tailoer	Local	f		0
1653	1	1	7	ER / 0001 / 390 / 2	Sabana Begam	FEMALE	1991-11-13 09:49:26.279625-05	24	Wife	f	Married	12 Std	\N	f	t	t	480	f	f		\N	f	Tailoer	Local	f		0
1654	1	1	7	ER / 0001 / 390 / 3	Sajitha	FEMALE	2013-11-13 09:49:26.318165-05	2	Daugter	f	Single		\N	f	t	f	480	f	f		\N	f	Baby	Local	f		0
1655	1	1	7	ER / 0001 / 391 / 1	Musthafa	MALE	1961-11-13 09:49:26.339403-05	54	Husband	t	Married		\N	f	t	t	481	f	f		\N	f	Cooli	Local	f		0
1656	1	1	7	ER / 0001 / 391 / 2	Piyari	FEMALE	1970-11-13 09:49:26.361244-05	45	Wife	f	Married		\N	f	t	t	481	f	f		\N	f	Home Maker	Local	f		0
1657	1	1	7	ER / 0001 / 391 / 3	Mohamed Saleem	MALE	1990-11-13 09:49:26.380649-05	25	Son	f	Single	6 Std	\N	f	t	t	481	f	f		\N	f	Pinnal	Local	f		0
1658	1	1	7	ER / 0001 / 392 / 1	Nijam Basha	MALE	1972-11-13 09:49:26.405116-05	43	Husband	t	Married	10 Std	\N	f	t	t	482	f	f		\N	f	Driver	Local	f		0
1659	1	1	7	ER / 0001 / 392 / 2	Thajira Banu	FEMALE	1976-11-13 09:49:26.423601-05	39	Wife	f	Married	10 Std	\N	f	t	t	482	f	f		\N	f	Know Tailoring	Local	f		0
1660	1	1	7	ER / 0001 / 392 / 3	Farhana	FEMALE	1997-11-13 09:49:26.4482-05	18	Daugter	f	Single	12 Std	\N	f	t	f	482	f	f		\N	f	Student	Local	f		0
1661	1	1	7	ER / 0001 / 392 / 4	Thajdeen	MALE	2000-11-13 09:49:26.475776-05	15	Son	f	Single	11 Std	\N	f	t	f	482	f	f		\N	f	Student	Local	f		0
1662	1	1	7	ER / 0001 / 393 / 1	Mohamed Sareef	MALE	1963-11-13 09:49:26.502642-05	52	Husband	t	Married	7 Std	\N	f	t	t	483	f	f		\N	f	Tailoer	Local	f		0
1663	1	1	7	ER / 0001 / 393 / 2	Shakila	FEMALE	1975-11-13 09:49:26.525948-05	40	Wife	f	Married	8 Std	\N	f	t	t	483	f	f		\N	f	Rest	Local	f		0
1664	1	1	7	ER / 0001 / 393 / 3	Rizwan	MALE	1990-11-13 09:49:26.555927-05	25	Son	f	Single	8 Std	\N	f	t	t	483	f	f		\N	f	Labour	Local	f		0
1665	1	1	7	ER / 0001 / 393 / 4	Irfan 	MALE	1994-11-13 09:49:26.576005-05	21	Son	f	Single	9 Std	\N	f	t	t	483	f	f		\N	f	Labour	Local	f		0
1666	1	1	7	ER / 0001 / 394 / 1	Jakir Husain	MALE	1974-11-13 09:49:26.595051-05	41	Husband	t	Married	7 Std	\N	f	t	t	484	f	f		\N	f	Machanic	Local	f		0
1667	1	1	7	ER / 0001 / 394 / 2	Shakila Banu	FEMALE	1983-11-13 09:49:26.615068-05	32	Wife	f	Married	9 Std	\N	f	t	t	484	f	f		\N	f	Home Maker	Local	f		0
1668	1	1	7	ER / 0001 / 394 / 3	Rakila Parveen	FEMALE	1998-11-13 09:49:26.634253-05	17	Daugter	f	Single	10 Std	\N	f	t	f	484	f	f		\N	f	Student	Local	f		0
1669	1	1	7	ER / 0001 / 394 / 4	sabiya Banu	FEMALE	2004-11-13 09:49:26.657838-05	11	Daugter	f	Single	9 Std	\N	f	t	f	484	f	f		\N	f	Student	Local	f		0
1670	1	1	7	ER / 0001 / 394 / 5	Sikanther	MALE	2006-11-13 09:49:26.682708-05	9	Son	f	Single	7 Std	\N	f	t	f	484	f	f		\N	f	Student	Local	f		0
1671	1	1	7	ER / 0001 / 395 / 1	Shahul Hameed	MALE	1952-11-13 09:49:26.707557-05	63	Husband	t	Married	5 Std	\N	f	t	t	485	f	f		\N	f	Bag Business	Local	f		0
1672	1	1	7	ER / 0001 / 395 / 2	Najmu Nisha	FEMALE	1955-11-13 09:49:26.732161-05	60	Wife	f	Married	3 Std	\N	f	t	t	485	f	f		\N	f	Home Maker	Local	f		0
1673	1	1	7	ER / 0001 / 395 / 3	Shajahan	MALE	1988-11-13 09:49:26.756788-05	27	Son	f	Married	10 Std	\N	f	t	t	485	f	f		\N	f	Bag Business	Local	f		0
1674	1	1	7	ER / 0001 / 395 / 4	Inul Marliya	FEMALE	1993-11-13 09:49:26.777477-05	22	Dau.In.Law	f	Married	10 Std	\N	f	t	t	485	f	f		\N	f	Home Maker	Local	f		0
1675	1	1	7	ER / 0001 / 395 / 5	Saliha Fathima	FEMALE	2012-11-13 09:49:26.796405-05	3	G.Daugter	f	Single		\N	f	t	f	485	f	f		\N	f	Baby	Local	f		0
1676	1	1	7	ER / 0001 / 395 / 6	Mohamed sufyan	MALE	2014-11-13 09:49:26.815396-05	1	G.Son	f	Single		\N	f	t	f	485	f	f		\N	f	Baby	Local	f		0
1677	1	1	7	ER / 0001 / 396 / 1	Amanull	MALE	1940-11-13 09:49:26.834174-05	75	Husband	t	Married	5 Std	\N	f	t	t	486	f	f		\N	f	Rest	Local	f		0
1678	1	1	7	ER / 0001 / 396 / 2	Mumthaj	FEMALE	1950-11-13 09:49:26.854465-05	65	Wife	f	Married	10 Std	\N	f	t	t	486	f	f		\N	f	Home Maker	Local	f		0
1679	1	1	7	ER / 0001 / 396 / 3	tharves Moideen	MALE	1973-11-13 09:49:26.873314-05	42	Son	f	Married	10 Std	\N	f	t	t	486	f	f		\N	f	Police	Local	f		0
1680	1	1	7	ER / 0001 / 396 / 4	Sharmila	FEMALE	1980-11-13 09:49:26.891731-05	35	Dau.In.Law	f	Married	6 Std	\N	f	t	t	486	f	f		\N	f	Home Maker	Local	f		0
1681	1	1	7	ER / 0001 / 396 / 5	Parvees	MALE	2004-11-13 09:49:26.911062-05	11	G.Son	f	Single	5 Std	\N	f	t	f	486	f	f		\N	f	Student	Local	f		0
1682	1	1	7	ER / 0001 / 396 / 6	Rahamathull	MALE	2005-11-13 09:49:26.935436-05	10	G.Son	f	Single	3 Std	\N	f	t	f	486	f	f		\N	f	Student	Local	f		0
1683	1	1	7	ER / 0001 / 397 / 1	Silar Saibu	MALE	1965-11-13 09:49:26.954404-05	50	Father	t	Married		\N	f	t	t	487	f	f		\N	f	Rest	Local	f		0
1684	1	1	7	ER / 0001 / 398 / 1	Kadar Basha	MALE	1970-11-13 09:49:26.97547-05	45	Husband	t	Married	5 Std	\N	f	t	t	488	f	f		\N	f	Cooli	Local	f		0
1685	1	1	7	ER / 0001 / 398 / 2	Rajiya Begam	FEMALE	1975-11-13 09:49:26.996068-05	40	Wife	f	Married	3 Std	\N	f	t	t	488	f	f		\N	f	Home Maker	Local	f		0
1686	1	1	7	ER / 0001 / 398 / 3	Sathik Basha	MALE	1994-11-13 09:49:27.021384-05	21	Son	f	Single	12 Std	\N	f	t	f	488	f	f		\N	f	Steel Work	Local	f		0
1687	1	1	7	ER / 0001 / 398 / 4	Kaibir	MALE	1995-11-13 09:49:27.048203-05	20	Son	f	Single	12 Std	\N	f	t	f	488	f	f		\N	f	Welder	Local	f		0
1688	1	1	7	ER / 0001 / 399 / 1	Muthuja	MALE	1983-11-13 09:49:27.07264-05	32	Husband	t	Married	ITI	\N	f	t	t	489	f	f		\N	f	Manager	Local	f		0
1689	1	1	7	ER / 0001 / 399 / 2	sheik Sameena	FEMALE	1990-11-13 09:49:27.088084-05	25	Wife	f	Married	UG	\N	f	t	t	489	f	f		\N	f	Home Maker	Local	f		0
1690	1	1	7	ER / 0001 / 399 / 3	Fahima	FEMALE	2010-11-13 09:49:27.112551-05	5	Daugter	f	Single	UKG	\N	f	t	f	489	f	f		\N	f	Student	Local	f		0
1691	1	1	7	ER / 0001 / 399 / 4	Mohamed Arsath	MALE	2013-11-13 09:49:27.136171-05	2	Son	f	Single		\N	f	t	f	489	f	f		\N	f	Baby	Local	f		0
1692	1	1	7	ER / 0001 / 400 / 1	Shakila	FEMALE	1967-11-13 09:49:27.154617-05	48	Mother	t	Widow		\N	f	t	t	490	f	f		\N	f	Home Maker	Local	f		0
1693	1	1	7	ER / 0001 / 400 / 2	Mohamed Kasim	MALE	1993-11-13 09:49:27.181801-05	22	Son	f	Single		\N	f	t	f	490	f	f		\N	f	Medical Training	Local	f		0
1694	1	1	7	ER / 0001 / 590 / 1	Asreef.A	FEMALE	1962-10-08 01:00:00-04	53	Family Head	t	Married	6	\N	f	t	t	491	f	f		\N	f	Labour	Local	f		0
1695	1	1	7	ER / 0001 / 591 / 		MALE	2014-10-08 01:00:00-04	1		f	Single		\N	f	t	f	492	f	f		\N	f	.	Local	f		0
1696	1	1	7	ER / 0001 / 592 / 1	Sahul Hameed.M	MALE	1972-10-08 01:00:00-04	43	Family Head	t	Married	B.E	\N	f	t	t	493	f	f		\N	f	Engeneering	Local	f		0
1697	1	1	7	ER / 0001 / 592 / 2	Anes Fathima.S	FEMALE	1977-10-08 01:00:00-04	38	wife	f	Married	B.Com	\N	f	t	t	493	f	f		\N	f	H.W	Local	f		0
1698	1	1	7	ER / 0001 / 592 / 3	Muhammed Hasem.S	MALE	1998-10-08 01:00:00-04	17	Son	f	Single	11	\N	f	t	f	493	f	f		\N	f	Student	Local	f		0
1699	1	1	7	ER / 0001 / 592 / 4	Juhaina Fathima.S	FEMALE	2005-10-08 01:00:00-04	10	Doughter	f	Single	4	\N	f	t	f	493	f	f		\N	f	Student	Local	f		0
1700	1	1	7	ER / 0001 / 593 / 1	Meharaj Banu	FEMALE	1984-10-08 01:00:00-04	31	Family Head	t	Widow	5	\N	f	t	t	494	f	f		\N	f	Tailor	Local	f		0
1701	1	1	7	ER / 0001 / 593 / 2	Aarif	MALE	2001-10-08 01:00:00-04	14	Son	f	Single	9	\N	f	t	f	494	f	f		\N	f	Student	Local	f		0
1702	1	1	7	ER / 0001 / 593 / 3	Meera Jasmeen	FEMALE	2003-10-08 01:00:00-04	12	Doughter	f	Single	7	\N	f	t	f	494	f	f		\N	f	Student	Local	f		0
1703	1	1	7	ER / 0001 / 594 / 		MALE	2014-10-08 01:00:00-04	1		f	Single		\N	f	t	f	495	f	f		\N	f		Local	f		0
1705	1	1	7	ER / 0001 / 596 / 1	Aasiya Begum.P	FEMALE	1961-10-08 01:00:00-04	54	Family Head	t	Widow	4	\N	f	t	t	497	f	f		\N	f	H.W	Local	f		0
1704	1	1	7	ER / 0001 / 595 / 		MALE	2014-10-08 01:00:00-04	1		f	Single		\N	f	t	f	496	f	f		\N	f		Local	f		0
1706	1	1	7	ER / 0001 / 596 / 2	Fyroze Begum.A	FEMALE	1977-10-08 01:00:00-04	38	Doughter	f	Married	8	\N	f	t	f	497	f	f		\N	f	Labour	Local	f		0
1707	1	1	7	ER / 0001 / 596 / 3	Rashma.S	FEMALE	1996-10-08 01:00:00-04	19	.Grand Doughter	f	Single	7	\N	f	t	f	497	f	f		\N	f	Labour	Local	f		0
1708	1	1	7	ER / 0001 / 596 / 4	Ajara Banu.S	FEMALE	1999-10-08 01:00:00-04	16	.Grand Doughter	f	Single	10	\N	f	t	f	497	f	f		\N	f	Student	Local	f		0
1709	1	1	7	ER / 0001 / 597 / 1	A.sheik Hussain	MALE	1978-10-08 01:00:00-04	37	Family Head	t	Married	4	\N	f	t	t	498	f	f		\N	f	Bick lock kee maker	Local	f		0
1710	1	1	7	ER / 0001 / 597 / 2	S.Dill Shath Begum	FEMALE	1980-10-08 01:00:00-04	35	wife	f	Married	7	\N	f	t	t	498	f	f		\N	f	H.W	Local	f		0
1711	1	1	7	ER / 0001 / 597 / 3	S.Sheik Abdul Rahuman	MALE	1998-10-08 01:00:00-04	17	Son	f	Single	11	\N	f	t	f	498	f	f		\N	f	Student	Local	f		0
1712	1	1	7	ER / 0001 / 597 / 4	S.Jasmeen Banu	FEMALE	2004-10-08 01:00:00-04	11	Doughter	f	Single	5	\N	f	t	f	498	f	f		\N	f	Student	Local	f		0
1713	1	1	7	ER / 0001 / 598 / 1	K.Moulana	MALE	1977-10-08 01:00:00-04	38	Family Head	t	Married	12	\N	f	t	t	499	f	f		\N	f	STALL	Local	f		0
1714	1	1	7	ER / 0001 / 598 / 2	M.Nasrath Banu	FEMALE	1988-10-08 01:00:00-04	27	wife	f	Married	6	\N	f	t	t	499	f	f		\N	f	Tailor	Local	f		0
1715	1	1	7	ER / 0001 / 598 / 3	M.Muhammed Anus	MALE	2001-10-08 01:00:00-04	14	Son	f	Single	8	\N	f	t	f	499	f	f		\N	f	Student	Local	f		0
1716	1	1	7	ER / 0001 / 598 / 4	M.Mohammed Irfaan	MALE	2002-10-08 01:00:00-04	13	Son	f	Single	6	\N	f	t	f	499	f	f		\N	f	Student	Local	f		0
1717	1	1	7	ER / 0001 / 599 / 1	Y.Sheik Mydeenya	MALE	1965-10-08 01:00:00-04	50	Family Head	t	Married	4	\N	f	t	t	500	f	f		\N	f	Bick Machinic	Local	f		0
1718	1	1	7	ER / 0001 / 599 / 2	S.Shakeela Banu	FEMALE	1977-10-08 01:00:00-04	38	wife	f	Married	10	\N	f	t	t	500	f	f		\N	f	H.W	Local	f		0
1719	1	1	7	ER / 0001 / 599 / 3	S.Muhammed Naafic	MALE	1995-10-08 01:00:00-04	20	Son	f	Single	10	\N	f	t	f	500	f	f		\N	f	Labour	Local	f		0
1720	1	1	7	ER / 0001 / 599 / 4	S.Mohammed Nouffill	MALE	2003-10-08 01:00:00-04	12	Son	f	Single	7	\N	f	t	f	500	f	f		\N	f	Student	Local	f		0
1721	1	1	7	ER / 0001 / 600 / 1	A.Alavudeen	MALE	1987-10-08 01:00:00-04	28	Family Head	t	Married	DECE	\N	f	t	t	501	f	f		\N	f	Mobile Service	Local	f		0
1722	1	1	7	ER / 0001 / 600 / 2	A.Jaseema Parveen	FEMALE	1991-10-08 01:00:00-04	24	wife	f	Married	12	\N	f	t	t	501	f	f		\N	f	H.W	Local	f		0
1723	1	1	7	ER / 0001 / 600 / 3	A.Arisiya	FEMALE	2013-10-08 01:00:00-04	2	Doughter	f	Single		\N	f	t	f	501	f	f		\N	f		Local	f		0
1724	2	2	26	TP / 0001 / 1 / 1	Sheck Mohammed	MALE	1952-06-20 01:00:00-04	63	Family Head	t	Married	B.E	\N	f	t	t	502	f	f		\N	f	Retired	Local	f		0
1725	2	2	26	TP / 0001 / 1 / 2	Madhina Munavara	FEMALE	1960-11-13 09:49:27.958935-05	55	Wife	f	Married	5	\N	f	t	t	502	f	f		\N	f	Housewife	Local	f		0
1726	2	2	26	TP / 0001 / 2 / 1	Mujibur Rahman	MALE	1983-11-13 09:49:27.978762-05	32	Family Head	t	Married	MBA	\N	f	t	t	503	f	f		\N	f	Own Business	Local	f		0
1727	2	2	26	TP / 0001 / 2 / 2	Rasitha Banu	FEMALE	1991-11-13 09:49:27.995349-05	24	Wife	f	Married	6	\N	f	t	t	503	f	f		\N	f	Housewife	Local	f		0
1728	2	2	26	TP / 0001 / 2 / 3	Mohammed Abrith	MALE	2008-11-13 09:49:28.01433-05	7	Son	f	Single	2	\N	f	t	f	503	f	f		\N	f	Student	Local	f		0
1729	2	2	26	TP / 0001 / 3 / 1	Abusam bee	FEMALE	1944-11-13 09:49:28.037687-04	71	Family Head	t	Married		\N	f	t	t	504	f	f		\N	f	Retired	Local	f		0
1730	2	2	26	TP / 0001 / 4 / 1	Asiya Beevi	FEMALE	1948-11-13 09:49:28.058703-05	67	MOTHER	t	Married	3	\N	f	t	f	505	f	f		\N	f	Housewife	Local	f		0
1731	2	2	26	TP / 0001 / 4 / 2	Fazilur Rahman	MALE	1958-11-13 09:49:28.074556-05	57	Son	f	Married	10	\N	f	t	t	505	f	f		\N	f	Medical Shop	Local	f		0
1732	2	2	26	TP / 0001 / 4 / 3	Sheck Alaudeen	MALE	1975-11-13 09:49:28.092936-05	40	Son	f	Married	10	\N	f	t	t	505	f	f		\N	f	Maligai Store	Local	f		0
1733	2	2	26	TP / 0001 / 4 / 4	Ashik Basha	MALE	1987-11-13 09:49:28.112174-05	28	Son	f	Married	BABL	\N	f	t	t	505	f	f		\N	f	Advocate	Local	f		0
1734	2	2	26	TP / 0001 / 4 / 5	Hairun nisha	FEMALE	1977-11-13 09:49:28.130976-05	38	Daughter in law	f	Married	10	\N	f	t	t	505	f	f		\N	f	Housewife	Local	f		0
1735	2	2	26	TP / 0001 / 4 / 6	Samina	FEMALE	1989-11-13 09:49:28.149581-05	26	Daughter in law	f	Married	10	\N	f	t	f	505	f	f		\N	f	Housewife	Local	f		0
1736	2	2	26	TP / 0001 / 4 / 7	Mohammed imthyajulla	MALE	1995-11-13 09:49:28.168485-05	20	Grandchild	f	Single	Diploma	\N	f	t	f	505	f	f		\N	f	Unemploye	Local	f		0
1737	2	2	26	TP / 0001 / 4 / 8	Abdul Masjid	MALE	2004-11-13 09:49:28.19306-05	11	Grandchild	f	Single	7	\N	f	t	f	505	f	f		\N	f	Student	Local	f		0
1738	2	2	26	TP / 0001 / 5 / 1	Abbas Ali	MALE	1972-11-13 09:49:28.21708-05	43	Family Head	t	Married	5	\N	f	t	t	506	f	f		\N	f	Labourar	Local	f		0
1739	2	2	26	TP / 0001 / 5 / 2	Asiammal	FEMALE	1975-11-13 09:49:28.233425-05	40	Wife	f	Married	5	\N	f	t	t	506	f	f		\N	f	Housewife	Local	f		0
1740	2	2	26	TP / 0001 / 5 / 3	Mohammed Mustafa	MALE	1993-11-13 09:49:28.254026-05	22	Son	f	Married	5	\N	f	t	t	506	f	f		\N	f	Labourar	Local	f		0
1741	2	2	26	TP / 0001 / 5 / 4	Firoz	FEMALE	1996-11-13 09:49:28.27567-05	19	Daughter in law	f	Married	7	\N	f	t	f	506	f	f		\N	f	Housewife	Local	f		0
1742	2	2	26	TP / 0001 / 6 / 1	Mohammed fazulur rahman	MALE	1942-11-13 09:49:28.294312-04	73	Family Head	t	Married	B.A	\N	f	t	t	507	f	f		\N	f	REST	Local	f		0
1743	2	2	26	TP / 0001 / 6 / 2	Sabiya Beevi	FEMALE	1955-11-13 09:49:28.315525-05	60	Wife	f	Married	6	\N	f	t	t	507	f	f		\N	f	REST	Local	f		0
1744	2	2	26	TP / 0001 / 6 / 3	Akbar ali	MALE	1975-11-13 09:49:28.335462-05	40	Son	f	Married	12	\N	f	t	t	507	f	f		\N	f	Cooly	Local	f		0
1745	2	2	26	TP / 0001 / 6 / 4	Nasera Banu	FEMALE	1980-11-13 09:49:28.354583-05	35	Daughter in law	f	Married	10	\N	f	t	t	507	f	f		\N	f	Housewife	Local	f		0
1746	2	2	26	TP / 0001 / 7 / 1	Mohammed amin	MALE	1973-11-13 09:49:28.3733-05	42	Family Head	t	Married	10	\N	f	t	t	508	f	f		\N	f	Cooly	Foreign	f		0
1747	2	2	26	TP / 0001 / 7 / 2	Ramzan Begam	FEMALE	1979-11-13 09:49:28.389265-05	36	Wife	f	Married	6	\N	f	t	t	508	f	f		\N	f	Housewife	Local	f		0
1748	2	2	26	TP / 0001 / 7 / 3	Asma Fathima	FEMALE	2000-11-13 09:49:28.413018-05	15	Daughter 	f	Single	9	\N	f	t	f	508	f	f		\N	f	Student	Local	f		0
1749	2	2	26	TP / 0001 / 7 / 4	Nawsath gani	FEMALE	2003-11-13 09:49:28.436638-05	12	DAUGHTER	f	Single	7	\N	f	t	f	508	f	f		\N	f	Student	Local	f		0
1750	2	2	26	TP / 0001 / 7 / 5	Albiya	FEMALE	2005-11-13 09:49:28.460152-05	10	Daughter	f	Single	5	\N	f	t	f	508	f	f		\N	f	Student	Local	f		0
1751	2	2	26	TP / 0001 / 7 / 6	Syed Rabyammal	FEMALE	1952-11-13 09:49:28.482723-05	63	Mother in law	f	Single	5	\N	f	t	f	508	f	f		\N	f	REST	Local	f		0
1752	2	2	26	TP / 0001 / 8 / 1	Sirajudeen	MALE	1961-11-13 09:49:28.508113-05	54	Family Head	t	Married	4	\N	f	t	t	509	f	f		\N	f	Vegetable	Foreign	f		0
1753	2	2	26	TP / 0001 / 8 / 2	Wahidha Banu	FEMALE	1973-11-13 09:49:28.529066-05	42	Wife	f	Married	4	\N	f	t	t	509	f	f		\N	f	Housewife	Local	f		0
1754	2	2	26	TP / 0001 / 8 / 3	Jaffer Sadhik	MALE	1990-11-13 09:49:28.548714-05	25	Son	f	Single	B.E	\N	f	t	f	509	f	f		\N	f	Software Engineer	Foreign	f		0
1755	2	2	26	TP / 0001 / 9 / 1	Fazlur Haq	MALE	1968-11-13 09:49:28.568173-05	47	Family Head	t	Married	12	\N	f	t	t	510	f	f		\N	f	Cooly	Local	f		0
1756	2	2	26	TP / 0001 / 9 / 2	Samsira Begam	FEMALE	1979-11-13 09:49:28.583678-05	36	Wife	f	Married	6	\N	f	t	t	510	f	f		\N	f	Housewife	Local	f		0
1757	2	2	26	TP / 0001 / 9 / 3	Najla Safrin	FEMALE	2002-11-13 09:49:28.602531-05	13	DAUGHTER	f	Single	8	\N	f	t	f	510	f	f		\N	f	Student	Local	f		0
1758	2	2	26	TP / 0001 / 9 / 4	Mohammed Absan	MALE	1999-11-13 09:49:28.626395-05	16	Son	f	Single	11	\N	f	t	f	510	f	f		\N	f	Student	Local	f		0
1759	2	2	26	TP / 0001 / 10 / 1	Sadhik Basha	MALE	1975-11-13 09:49:28.654709-05	40	Family Head	t	Married	6	\N	f	t	t	511	f	f		\N	f	Vegetable	Local	f		0
1760	2	2	26	TP / 0001 / 10 / 2	Arifa Banu	FEMALE	1988-11-13 09:49:28.671265-05	27	Wife	f	Married	10	\N	f	t	t	511	f	f		\N	f	Housewife	Local	f		0
1761	2	2	26	TP / 0001 / 10 / 3	Mohammed arsath	MALE	2004-11-13 09:49:28.692003-05	11	Son	f	Single	6	\N	f	t	f	511	f	f		\N	f	Student	Local	f		0
1762	2	2	26	TP / 0001 / 10 / 4	Arsitha Banu	FEMALE	2006-11-13 09:49:28.716867-05	9	DAUGHTER	f	Single	4	\N	f	t	f	511	f	f		\N	f	Student	Local	f		0
1763	2	2	26	TP / 0001 / 11 / 1	Sajitha Begam	FEMALE	1970-11-13 09:49:28.741948-05	45	Family Head	t	Married	12	\N	f	t	f	512	f	f		\N	f	REST	Local	f		0
1764	2	2	26	TP / 0001 / 11 / 2	Abdul Salam	MALE	1993-11-13 09:49:28.75956-05	22	Son	f	Single	B.E	\N	f	t	f	512	f	f		\N	f	SHOP	Local	f		0
1765	2	2	26	TP / 0001 / 11 / 3	Jannathul firdhouse	FEMALE	1999-11-13 09:49:28.783086-05	16	DAUGHTER	f	Single	9	\N	f	t	f	512	f	f		\N	f	Aalima	Local	f		0
1766	2	2	26	TP / 0001 / 12 / 1	Mohammed Iqbal	MALE	1969-11-13 09:49:28.80132-05	46	Family Head	t	Married	M.com	\N	f	t	t	513	f	f		\N	f	Cooly	Local	f		0
1767	2	2	26	TP / 0001 / 12 / 2	Ummul habiba	FEMALE	1975-11-13 09:49:28.817348-05	40	Wife	f	Married	10	\N	f	t	t	513	f	f		\N	f	Housewife	Local	f		0
1768	2	2	26	TP / 0001 / 12 / 3	Mohammed sahid	MALE	1997-11-13 09:49:28.83592-05	18	Son	f	Single	Civil	\N	f	t	f	513	f	f		\N	f	Student	Local	f		0
1769	2	2	26	TP / 0001 / 12 / 4	Mohammed taha	MALE	2000-11-13 09:49:28.86034-05	15	Son	f	Single	DME	\N	f	t	f	513	f	f		\N	f	Student	Local	f		0
1770	2	2	26	TP / 0001 / 13 / 1	Aameena Beevi	FEMALE	1965-11-13 09:49:28.883555-05	50	Family Head	t	Married	5	\N	f	t	t	514	f	f		\N	f	HR	Local	f		0
1771	2	2	26	TP / 0001 / 13 / 2	Ashiq Ali	MALE	1984-11-13 09:49:28.899884-05	31	Son	f	Married	10	\N	f	t	t	514	f	f		\N	f	ENTERPRISES	Local	f		0
1772	2	2	26	TP / 0001 / 13 / 3	Madheena Begam	FEMALE	1987-11-13 09:49:28.918689-05	28	Daughter in law	f	Married	8	\N	f	t	t	514	f	f		\N	f	Housewife	Local	f		0
1773	2	2	26	TP / 0001 / 14 / 1	Joraira beevi	FEMALE	1950-11-13 09:49:28.941507-05	65	Family Head	t	Married	3	\N	f	t	t	515	f	f		\N	f	Housewife	Local	f		0
1774	2	2	26	TP / 0001 / 15 / 1	Mohammed Ismaeal	MALE	1974-11-13 09:49:28.961905-05	41	Family Head	t	Married	9	\N	f	t	t	516	f	f		\N	f	Cooly	Local	f		0
1775	2	2	26	TP / 0001 / 15 / 2	Wahidha banu	FEMALE	1981-11-13 09:49:28.977719-05	34	Wife	f	Married	7	\N	f	t	t	516	f	f		\N	f	Housewife	Local	f		0
1776	2	2	26	TP / 0001 / 15 / 3	Rabiyathul Basaria	FEMALE	2002-11-13 09:49:28.995695-05	13	DAUGHTER	f	Single	9	\N	f	t	f	516	f	f		\N	f	Student	Local	f		0
1777	2	2	26	TP / 0001 / 15 / 4	Sakkinath Parveen	FEMALE	2005-11-13 09:49:29.020503-05	10	DAUGHTER	f	Single	7	\N	f	t	f	516	f	f		\N	f	Student	Local	f		0
1778	2	2	26	TP / 0001 / 16 / 1	Noorul haq	MALE	1968-11-13 09:49:29.04308-05	47	Family Head	t	Married	12	\N	f	t	t	517	f	f		\N	f	Agriculture	Local	f		0
1779	2	2	26	TP / 0001 / 16 / 2	Sabeena Begam	FEMALE	1980-11-13 09:49:29.058366-05	35	Wife	f	Married	5	\N	f	t	t	517	f	f		\N	f	REST	Local	f		0
1780	2	2	26	TP / 0001 / 16 / 3	Anas	MALE	1998-11-13 09:49:29.076742-05	17	Son	f	Single	8	\N	f	t	f	517	f	f		\N	f	Aalim	Local	f		0
1781	2	2	26	TP / 0001 / 16 / 4	Thahira	FEMALE	2000-11-13 09:49:29.108621-05	15	DAUGHTER	f	Single	8	\N	f	t	f	517	f	f		\N	f	Aalim	Local	f		0
1782	2	2	26	TP / 0001 / 16 / 5	Taiba	FEMALE	2003-11-13 09:49:29.144378-05	12	DAUGHTER	f	Single	7	\N	f	t	f	517	f	f		\N	f	Aalim	Local	f		0
1783	2	2	26	TP / 0001 / 17 / 1	abdul ajiz	MALE	1940-11-13 09:49:29.179785-05	75	Family Head	t	Married	5	\N	f	t	t	518	f	f		\N	f	Maligai Store	Local	f		0
1784	2	2	26	TP / 0001 / 17 / 2	Jalimma	FEMALE	1960-11-13 09:49:29.217928-05	55	Wife	f	Married	5	\N	f	t	t	518	f	f		\N	f	Housewife	Local	f		0
1785	2	2	26	TP / 0001 / 18 / 1	Sadham Hussain	MALE	1991-11-13 09:49:29.263359-05	24	Family Head	t	Married	10	\N	f	t	t	519	f	f		\N	f	CELL PHONE SERVICE	Local	f		0
1786	2	2	26	TP / 0001 / 18 / 2	sajana Fathima	FEMALE	1996-11-13 09:49:29.298539-05	19	HOUSE WIFE	f	Married	12	\N	f	t	t	519	f	f		\N	f	Housewife	Local	f		0
1787	2	2	26	TP / 0001 / 19 / 1	Zakkir Hussain	MALE	1973-11-13 09:49:29.334257-05	42	Family Head	t	Married	10	\N	f	t	t	520	f	f		\N	f	Maligai Store	Local	f		0
1788	2	2	26	TP / 0001 / 19 / 2	Mahaboob Nisha	FEMALE	1985-11-13 09:49:29.365336-05	30	Wife	f	Married	10	\N	f	t	t	520	f	f		\N	f	Housewife	Local	f		0
1789	2	2	26	TP / 0001 / 19 / 3	Mohammed talha	MALE	2001-11-13 09:49:29.400926-05	14	Son	f	Single	10	\N	f	t	f	520	f	f		\N	f	Student	Local	f		0
1790	2	2	26	TP / 0001 / 20 / 1	Zakir Hussain	MALE	1970-11-13 09:49:29.445648-05	45	Family Head	t	Married	5	\N	f	t	t	521	f	f		\N	f	Meat stall	Local	f		0
1791	2	2	26	TP / 0001 / 20 / 2	Juvairia  Banu	FEMALE	1985-11-13 09:49:29.476064-05	30	Wife	f	Married	8	\N	f	t	t	521	f	f		\N	f	Housewife	Local	f		0
1792	2	2	26	TP / 0001 / 20 / 3	Asiya dasrin	FEMALE	2010-11-13 09:49:29.512302-05	5	DAUGHTER	f	Single	12	\N	f	t	f	521	f	f		\N	f	Student	Local	f		0
1793	2	2	26	TP / 0001 / 20 / 4	Mohammed fazil	MALE	2012-11-13 09:49:29.557614-05	3	Son	f	Single		\N	f	t	f	521	f	f		\N	f	Student	Local	f		0
1794	2	2	26	TP / 0001 / 21 / 1	LIYAKATH ALI	MALE	1955-11-13 09:49:29.59193-05	60	Family Head	t	Married		\N	f	t	t	522	f	f		\N	f	REST	Local	f		0
1795	2	2	26	TP / 0001 / 21 / 2	Noor Nisha	FEMALE	1965-11-13 09:49:29.616993-05	50	Wife	f	Married	5	\N	f	t	t	522	f	f		\N	f	Housewife	Local	f		0
1796	2	2	26	TP / 0001 / 22 / 1	Akbar Basha	MALE	1968-11-13 09:49:29.647577-05	47	Family Head	t	Married	5	\N	f	t	t	523	f	f		\N	f	Own Business	Local	f		0
1797	2	2	26	TP / 0001 / 22 / 2	Zeenath Nisha	FEMALE	1980-11-13 09:49:29.672946-05	35	Wife	f	Married	5	\N	f	t	t	523	f	f		\N	f	Housewife	Local	f		0
1798	2	2	26	TP / 0001 / 22 / 3	Mohammed Musaraf	MALE	2001-11-13 09:49:29.705503-05	14	Son	f	Single	10	\N	f	t	f	523	f	f		\N	f	Student	Local	f		0
1799	2	2	26	TP / 0001 / 22 / 4	Mohammed afsal	MALE	2003-11-13 09:49:29.745307-05	12	Son	f	Single	8	\N	f	t	f	523	f	f		\N	f	Student	Local	f		0
1800	2	2	26	TP / 0001 / 23 / 1	Shajahan	MALE	1942-11-13 09:49:29.790235-04	73	Family Head	t	Married	5	\N	f	t	t	524	f	f		\N	f	REST	Local	f		0
1801	2	2	26	TP / 0001 / 23 / 2	Fathimaa	FEMALE	1966-11-13 09:49:29.82482-05	49	Wife	f	Married	5	\N	f	t	t	524	f	f		\N	f	Housewife	Local	f		0
1802	2	2	26	TP / 0001 / 23 / 3	Barakath ali	MALE	1996-11-13 09:49:29.864195-05	19	Son	f	Single	10	\N	f	t	f	524	f	f		\N	f	Sighbour Sleeping	Local	f		0
1803	2	2	26	TP / 0001 / 23 / 4	Akbar Sali	MALE	2000-11-13 09:49:29.894643-05	15	Son	f	Single	10	\N	f	t	f	524	f	f		\N	f	Student	Local	f		0
1804	2	2	26	TP / 0001 / 24 / 1	Qudubu deen	MALE	1963-11-13 09:49:29.939435-05	52		t	Married	5	\N	f	t	t	525	f	f		\N	f	Cooly	Local	f		0
1805	2	2	26	TP / 0001 / 24 / 2	Arif roja	FEMALE	1973-11-13 09:49:29.975545-05	42		f	Married		\N	f	t	t	525	f	f		\N	f	Housewife	Local	f		0
1806	2	2	26	TP / 0001 / 24 / 3	Mohammed ali	MALE	1989-11-13 09:49:30.017635-05	26		f	Married	5	\N	f	t	t	525	f	f		\N	f	Cooly	Foreign	f		0
1807	2	2	26	TP / 0001 / 24 / 4	Wahidha banu	FEMALE	1996-11-13 09:49:30.0484-05	19		f	Married	11	\N	f	t	t	525	f	f		\N	f		Local	f		0
1808	2	2	26	TP / 0001 / 24 / 5	Rasiya Begam	FEMALE	2014-11-13 09:49:30.082245-05	1		f	Single		\N	f	t	f	525	f	f		\N	f		Local	f		0
1809	2	2	26	TP / 0001 / 25 / 1	Jaffer ali	MALE	1961-11-13 09:49:30.120456-05	54	Family Head	t	Married	8	\N	f	t	t	526	f	f		\N	f	Religious	Local	f		0
1810	2	2	26	TP / 0001 / 25 / 2	Noorjahan	FEMALE	1969-11-13 09:49:30.150592-05	46	Wife	f	Married	8	\N	f	t	t	526	f	f		\N	f	house wife	Local	f		0
1811	2	2	26	TP / 0001 / 25 / 3	Amjath khan	MALE	1996-11-13 09:49:30.196415-05	19	Son	f	Single	10	\N	f	t	t	526	f	f		\N	f	Driver	Local	f		0
1812	2	2	26	TP / 0001 / 25 / 4	Wasim khan	MALE	1998-11-13 09:49:30.243082-05	17	Son	f	Single	12	\N	f	t	f	526	f	f		\N	f	Student	Local	f		0
1813	2	2	26	TP / 0001 / 25 / 5	Salman khan	MALE	2000-11-13 09:49:30.28804-05	15	Son	f	Single	10	\N	f	t	f	526	f	f		\N	f	Student	Local	f		0
1814	2	2	26	TP / 0001 / 25 / 6	Sardar Khan	MALE	2002-11-13 09:49:30.333336-05	13	Son	f	Single	8	\N	f	t	f	526	f	f		\N	f	Student	Local	f		0
1815	2	2	26	TP / 0001 / 25 / 7	Nazeera begam	FEMALE	2007-11-13 09:49:30.37817-05	8	DAUGHTER	f	Single	4	\N	f	t	f	526	f	f		\N	f	Student	Local	f		0
1816	2	2	26	TP / 0001 / 26 / 1	Sadhik Basha	MALE	1970-11-13 09:49:30.421443-05	45	Family Head	t	Married		\N	f	t	t	527	f	f		\N	f	Tea shop	Local	f		0
1817	2	2	26	TP / 0001 / 26 / 2	Aysha beevi	FEMALE	1977-11-13 09:49:30.459655-05	38	Wife	f	Married	5	\N	f	t	t	527	f	f		\N	f	Flour business	Local	f		0
1818	2	2	26	TP / 0001 / 26 / 3	Balqis Banu	FEMALE	2002-11-13 09:49:30.496833-05	13	DAUGHTER	f	Single	8	\N	f	t	f	527	f	f		\N	f	Student	Local	f		0
1819	2	2	26	TP / 0001 / 26 / 4	Mansoor ali	MALE	2007-11-13 09:49:30.544973-05	8	Son	f	Single	3	\N	f	t	f	527	f	f		\N	f	Student	Local	f		0
1820	2	2	26	TP / 0001 / 27 / 		MALE	2015-11-13 09:49:30.598155-05	0		f	Single		\N	f	t	f	528	f	f		\N	f		Local	f		0
1821	2	2	26	TP / 0001 / 28 / 1	Sadhullah basha	MALE	1954-11-13 09:49:30.625774-05	61	FAMILY HEAD	t	Married	11	\N	f	t	t	529	f	f		\N	f	RETIRED	Local	f		0
1822	2	2	26	TP / 0001 / 28 / 2	Fathima	FEMALE	1963-11-13 09:49:30.658281-05	52	WIFE	f	Married	5	\N	f	t	t	529	f	f		\N	f	House wife	Local	f		0
1823	2	2	26	TP / 0001 / 28 / 3	Syed Abuthahir	MALE	1993-11-13 09:49:30.695325-05	22	SON	f	Single	11	\N	f	t	f	529	f	f		\N	f	Cooly	Local	f		0
1824	2	2	26	TP / 0001 /  / 		MALE	2015-11-13 09:49:30.732895-05	0		f	Single		\N	f	t	f	530	f	f		\N	f		Local	f		0
1825	2	2	26	TP / 0001 / 30 / 1	Ameenammal	FEMALE	1957-11-13 09:49:30.762246-05	58	FAMILY HEAD	t	Married		\N	f	t	t	531	f	f		\N	f		Local	f		0
1826	2	2	26	TP / 0001 / 31 / 1	Kamar nisha	FEMALE	1941-11-13 09:49:30.800015-05	74	FAMILY HEAD	t	Married		\N	f	t	t	532	f	f		\N	f		Local	f		0
1827	2	2	26	TP / 0001 / 32 / 		MALE	2015-11-13 09:49:30.838217-05	0		f	Single		\N	f	t	f	533	f	f		\N	f		Local	f		0
1828	2	2	26	TP / 0001 / 33 / 1	Sabeer ahmed	MALE	1980-11-13 09:49:30.866434-05	35	FAMILY HEAD	t	Married	5	\N	f	t	t	534	f	f		\N	f	Cooly	Local	f		0
1829	2	2	26	TP / 0001 / 33 / 2	Rasiya begam	FEMALE	1982-11-13 09:49:30.897727-05	33	WIFE	f	Married	5	\N	f	t	t	534	f	f		\N	f	house wife	Local	f		0
1830	2	2	26	TP / 0001 / 33 / 3	Riswan Banu	FEMALE	2000-11-13 09:49:30.934697-05	15	Daughter	f	Single	10	\N	f	t	f	534	f	f		\N	f	Student	Local	f		0
1831	2	2	26	TP / 0001 / 33 / 4	Azaira Banu	FEMALE	2002-11-13 09:49:30.988073-05	13	Daughter	f	Single	8	\N	f	t	f	534	f	f		\N	f	Student	Local	f		0
1832	2	2	26	TP / 0001 / 33 / 5	Mohammed Hakim	MALE	2004-11-13 09:49:31.029649-05	11	Son	f	Single	6	\N	f	t	f	534	f	f		\N	f	Student	Local	f		0
1833	2	2	26	TP / 0001 / 34 / 1	Abbas	MALE	1987-11-13 09:49:31.076384-05	28	FAMILY HEAD	t	Married	10	\N	f	t	t	535	f	f		\N	f	Provision	Local	f		0
1835	2	2	26	TP / 0001 / 35 / 1	Shajahan	MALE	1981-11-13 09:49:31.140541-05	34	FAMILY HEAD	t	Married	8	\N	f	t	t	536	f	f		\N	f	Cooly	Local	f		0
1834	2	2	26	TP / 0001 / 34 / 2	Sabeer Begam	FEMALE	1986-11-13 09:49:31.169006-05	29	WIFE	f	Married	8	\N	f	t	t	535	f	f		\N	f	house wife	Local	f		0
1836	2	2	26	TP / 0001 / 34 / 3	Aysha sydhica	FEMALE	2007-11-13 09:49:31.222596-05	8	Daughter	f	Single	5	\N	f	t	f	535	f	f		\N	f	Student	Local	f		0
1837	2	2	26	TP / 0001 / 34 / 4	Mohammed haris	MALE	2012-11-13 09:49:31.267677-05	3	Son	f	Single		\N	f	t	f	535	f	f		\N	f		Local	f		0
1838	2	2	26	TP / 0001 / 36 / 1	Mubarak ali	MALE	1960-11-13 09:49:31.312783-05	55	FAMILY HEAD	t	Married		\N	f	t	t	537	f	f		\N	f	Cooly	Outstation	f		0
1839	2	2	26	TP / 0001 / 36 / 2	Nilofar	FEMALE	1973-11-13 09:49:31.342878-05	42	WIFE	f	Married		\N	f	t	t	537	f	f		\N	f	house wife	Local	f		0
1840	2	2	26	TP / 0001 / 36 / 3	Rifayath ali	MALE	1990-11-13 09:49:31.386956-05	25	Son	f	Single	P.HD	\N	f	t	t	537	f	f		\N	f	Student	Local	f		0
1841	2	2	26	TP / 0001 / 36 / 4	Arafath Ali	MALE	1995-11-13 09:49:31.450136-05	20	Son	f	Single	BA	\N	f	t	t	537	f	f		\N	f	Student	Local	f		0
1842	2	2	26	TP / 0001 / 37 / 1	Mohammed ali	MALE	1957-11-13 09:49:31.488998-05	58	FAMILY HEAD	t	Married	6	\N	f	t	t	538	f	f		\N	f	ENTERPROCESS LAB	Local	f		0
1843	2	2	26	TP / 0001 / 37 / 2	Samsath Begam	FEMALE	1965-11-13 09:49:31.519597-05	50	WIFE	f	Married	6	\N	f	t	t	538	f	f		\N	f	house wife	Local	f		0
1844	2	2	26	TP / 0001 / 37 / 3	Syed	MALE	1983-11-13 09:49:31.563113-05	32	Son	f	Married	10	\N	f	t	t	538	f	f		\N	f	ENTERPROCESS LAB	Local	f		0
1845	2	2	26	TP / 0001 / 37 / 4	Thameem	FEMALE	1980-11-13 09:49:31.598838-05	35	Daughter	f	Married		\N	f	t	t	538	f	f		\N	f	house wife	Local	f		0
1846	2	2	26	TP / 0001 / 37 / 5	Athifa	FEMALE	1998-11-13 09:49:31.634402-05	17	Daughter	f	Single		\N	f	t	f	538	f	f		\N	f		Local	f		0
1847	2	2	26	TP / 0001 / 38 / 1	Bawa moideen	MALE	1975-11-13 09:49:31.670617-05	40	FAMILY HEAD	t	Married	5	\N	f	t	t	539	f	f		\N	f	Cooly	Outstation	f		0
1848	2	2	26	TP / 0001 / 38 / 2	Noorjahan	FEMALE	1978-11-13 09:49:31.705463-05	37	WIFE	f	Married		\N	f	t	t	539	f	f		\N	f	house wife	Local	f		0
1849	2	2	26	TP / 0001 / 38 / 3	Mohammed tawfiq	MALE	1996-11-13 09:49:31.74185-05	19	Son	f	Single	B.E	\N	f	t	f	539	f	f		\N	f	Student	Local	f		0
1850	2	2	26	TP / 0001 / 38 / 4	Arifa Parveen	FEMALE	1999-11-13 09:49:31.787428-05	16	Daughter	f	Single	11	\N	f	t	f	539	f	f		\N	f	Student	Local	f		0
1851	2	2	26	TP / 0001 / 39 / 1	Aameena beevi	FEMALE	1935-11-13 09:49:31.847551-05	80	FAMILY HEAD	t	Married		\N	f	t	t	540	f	f		\N	f	REST	Local	f		0
1852	2	2	26	TP / 0001 / 40 / 1	Jaffer Sadhik	MALE	1967-11-13 09:49:31.887572-05	48	FAMILY HEAD	t	Married	2	\N	f	t	t	541	f	f		\N	f	Cooly	Local	f		0
1853	2	2	26	TP / 0001 / 40 / 2	Ramala	FEMALE	1985-11-13 09:49:31.918288-05	30	WIFE	f	Married	10	\N	f	t	t	541	f	f		\N	f	house wife	Local	f		0
1854	2	2	26	TP / 0001 / 40 / 3	Sheik alavudeen	MALE	1985-11-13 09:49:31.962239-05	30	FAMILY HEAD	f	Married	5	\N	f	t	t	541	f	f		\N	f	Cooly	Local	f		0
1855	2	2	26	TP / 0001 / 41 / 1	Mohammed ali	MALE	1968-11-13 09:49:31.997719-05	47	FAMILY HEAD	t	Married	12	\N	f	t	t	542	f	f		\N	f	OWN Business	Local	f		0
1856	2	2	26	TP / 0001 / 41 / 2	Fairoja	FEMALE	1975-11-13 09:49:32.027179-05	40	WIFE	f	Married	5	\N	f	t	t	542	f	f		\N	f	house wife	Local	f		0
1857	2	2	26	TP / 0001 / 41 / 3	Mohammed Ismaeal	MALE	1992-11-13 09:49:32.062377-05	23	Son	f	Single	12	\N	f	t	t	542	f	f		\N	f	Cooly	Local	f		0
1858	2	2	26	TP / 0001 / 41 / 4	Mohammed Imam ali	MALE	1994-11-13 09:49:32.106937-05	21	Son	f	Single	DME	\N	f	t	t	542	f	f		\N	f	Cooly	Local	f		0
1859	2	2	26	TP / 0001 / 41 / 5	Sharmila Parveen	FEMALE	1991-11-13 09:49:32.155312-05	24	Daughter	f	Married	12	\N	f	t	t	542	f	f		\N	f	house wife	Local	f		0
1860	2	2	26	TP / 0001 / 42 / 1	Syed ali	MALE	1956-11-13 09:49:32.190318-05	59	FAMILY HEAD	t	Married		\N	f	t	t	543	f	f		\N	f	Cooly	Local	f		0
1861	2	2	26	TP / 0001 / 42 / 2	Hairun nisha	FEMALE	1966-11-13 09:49:32.219843-05	49	WIFE	f	Married		\N	f	t	t	543	f	f		\N	f	house wife	Local	f		0
1862	2	2	26	TP / 0001 / 42 / 3	Jaffer ali	MALE	1986-11-13 09:49:32.257464-05	29	Daughter	f	Single	12	\N	f	t	t	543	f	f		\N	f	Cooly	Local	f		0
1863	2	2	26	TP / 0001 / 42 / 4	Mohammed taha	MALE	2005-11-13 09:49:32.292702-05	10	Grandchild	f	Single	6	\N	f	t	f	543	f	f		\N	f		Local	f		0
1864	2	2	26	TP / 0001 / 43 / 1	Mohammed Ismaeal	MALE	1957-11-13 09:49:32.338418-05	58	FAMILY HEAD	t	Married		\N	f	t	t	544	f	f		\N	f	Petty shop	Local	f		0
1865	2	2	26	TP / 0001 / 43 / 2	Yasmin	FEMALE	1985-11-13 09:49:32.377815-05	30	WIFE	f	Married	10	\N	f	t	t	544	f	f		\N	f	house wife	Local	f		0
1866	2	2	26	TP / 0001 / 43 / 3	Ibrahim	MALE	1983-11-13 09:49:32.413144-05	32	Son	f	Married	12	\N	f	t	t	544	f	f		\N	f	Salaried	Local	f		0
1867	2	2	26	TP / 0001 / 44 / 1	Habibullah	MALE	1951-11-13 09:49:32.459175-05	64	FAMILY HEAD	t	Married	M.A	\N	f	t	t	545	f	f		\N	f	Business	Local	f		0
1868	2	2	26	TP / 0001 / 44 / 2	sakila	FEMALE	1971-11-13 09:49:32.497218-05	44	WIFE	f	Married		\N	f	t	t	545	f	f		\N	f	house wife	Local	f		0
1869	2	2	26	TP / 0001 / 44 / 3	Riyaz ahmed	MALE	1992-11-13 09:49:32.530803-05	23	Son	f	Single	B.E	\N	f	t	t	545	f	f		\N	f	Unemployed	Local	f		0
1870	2	2	26	TP / 0001 / 45 / 1	Mohammed anifa	MALE	1970-11-13 09:49:32.56515-05	45	FAMILY HEAD	t	Married	5	\N	f	t	t	546	f	f		\N	f	Cooly	Outstation	f		0
1871	2	2	26	TP / 0001 / 45 / 2	Ummul barakath	FEMALE	1975-11-13 09:49:32.592427-05	40	WIFE	f	Married	5	\N	f	t	t	546	f	f		\N	f	house wife	Outstation	f		0
1872	2	2	26	TP / 0001 / 45 / 3	Nasreen banu	FEMALE	2000-11-13 09:49:32.619466-05	15	Daughter	f	Single	11	\N	f	t	f	546	f	f		\N	f		Outstation	f		0
1873	2	2	26	TP / 0001 / 45 / 4	Yasir arafat	MALE	2002-11-13 09:49:32.672405-05	13	Son	f	Single	9	\N	f	t	f	546	f	f		\N	f		Outstation	f		0
1874	2	2	26	TP / 0001 / 46 / 1	Hajila Banu	FEMALE	1975-11-13 09:49:32.714055-05	40	FAMILY HEAD	t	Devorced	5	\N	f	t	t	547	f	f		\N	f	Cooly	Local	f		0
1875	2	2	26	TP / 0001 / 46 / 2	Abbas	MALE	1999-11-13 09:49:32.750737-05	16	Son	f	Single	IT	\N	f	t	f	547	f	f		\N	f	Student	Local	f		0
1876	2	2	26	TP / 0001 / 46 / 3	Dilhar Banu	FEMALE	2001-11-13 09:49:32.778466-05	14	Daughter	f	Single	11	\N	f	t	f	547	f	f		\N	f	Student	Local	f		0
1877	2	2	26	TP / 0001 / 46 / 4	Nasrin Farhana	FEMALE	2007-11-13 09:49:32.814322-05	8	Daughter	f	Single	4	\N	f	t	f	547	f	f		\N	f	Student	Local	f		0
1878	2	2	26	TP / 0001 / 47 / 1	Abdul Samad	MALE	1945-11-13 09:49:32.84268-05	70	FAMILY HEAD	t	Married		\N	f	t	t	548	f	f		\N	f		Local	f		0
1879	2	2	26	TP / 0001 / 47 / 2	Sybathu Nisha	FEMALE	1955-11-13 09:49:32.883265-05	60	WIFE	f	Married		\N	f	t	t	548	f	f		\N	f		Local	f		0
1880	2	2	26	TP / 0001 / 48 / 1	Anwardeen	MALE	1960-11-13 09:49:32.92578-05	55	FAMILY HEAD	t	Married	8	\N	f	t	t	549	f	f		\N	f	Cooly	Outstation	f		0
1881	2	2	26	TP / 0001 / 48 / 2	Faridha Begam	FEMALE	1967-11-13 09:49:32.949717-05	48	WIFE	f	Married	5	\N	f	t	t	549	f	f		\N	f	house wife	Local	f		0
1882	2	2	26	TP / 0001 / 48 / 3	Ramzan Parveen	FEMALE	1988-11-13 09:49:32.993271-05	27	Daughter	f	Single		\N	f	t	f	549	f	f		\N	f		Local	f		0
1883	2	2	26	TP / 0001 / 49 / 1	Syed ibrahim	MALE	1979-11-13 09:49:33.029325-05	36	FAMILY HEAD	t	Married	7	\N	f	t	t	550	f	f		\N	f	Sweet Stall	Local	f		0
1884	2	2	26	TP / 0001 / 49 / 2	Roja banu	FEMALE	1983-11-13 09:49:33.052082-05	32	WIFE	f	Married	7	\N	f	t	t	550	f	f		\N	f	house wife	Local	f		0
1885	2	2	26	TP / 0001 / 49 / 3	Mohammed aashiq	MALE	1996-11-13 09:49:33.078338-05	19	Son	f	Single		\N	f	t	f	550	f	f		\N	f	Student	Local	f		0
1886	2	2	26	TP / 0001 / 49 / 4	Mubina Parveen	FEMALE	1999-11-13 09:49:33.100516-05	16	Daughter	f	Single		\N	f	t	f	550	f	f		\N	f	REST	Local	f		0
1887	2	2	26	TP / 0001 / 50 / 1	Mohammed Shafiq	MALE	1980-11-13 09:49:33.122899-05	35	FAMILY HEAD	t	Married	9	\N	f	t	t	551	f	f		\N	f	Medical Shop	Local	f		0
1888	2	2	26	TP / 0001 / 50 / 2	Sawthamma	FEMALE	1990-11-13 09:49:33.141443-05	25	WIFE	f	Married	9	\N	f	t	t	551	f	f		\N	f	house wife	Local	f		0
1889	2	2	26	TP / 0001 / 50 / 3	Mohammed jahid	MALE	2009-11-13 09:49:33.163288-05	6	Son	f	Single	3	\N	f	t	f	551	f	f		\N	f	Student	Local	f		0
1890	2	2	26	TP / 0001 / 50 / 4	Mohammed abeeth	MALE	2011-11-13 09:49:33.19121-05	4	Son	f	Single	LKG	\N	f	t	f	551	f	f		\N	f	Student	Local	f		0
1891	2	2	26	TP / 0001 / 51 / 1	Mohammed Idhris	MALE	1974-11-13 09:49:33.218897-05	41	FAMILY HEAD	t	Married	10	\N	f	t	t	552	f	f		\N	f	Cooly	Local	f		0
1892	2	2	26	TP / 0001 / 51 / 2	Mohammed Parveen	FEMALE	1980-11-13 09:49:33.238324-05	35	WIFE	f	Married	8	\N	f	t	t	552	f	f		\N	f	house wife	Local	f		0
1893	2	2	26	TP / 0001 / 51 / 3	Wilhaj Fathima	FEMALE	2002-11-13 09:49:33.261074-05	13	Daughter	f	Single	8	\N	f	t	f	552	f	f		\N	f	Student	Local	f		0
1894	2	2	26	TP / 0001 / 52 / 1	Hairunnisha	FEMALE	1950-11-13 09:49:33.283013-05	65	FAMILY HEAD	t	Married	5	\N	f	t	t	553	f	f		\N	f	REST	Local	f		0
1895	2	2	26	TP / 0001 / 52 / 2	Syed Mohammed	MALE	1985-11-13 09:49:33.306843-05	30	Son	f	Married	10	\N	f	t	t	553	f	f		\N	f	Cooly	Local	f		0
1896	2	2	26	TP / 0001 / 52 / 3	Arifa begam	FEMALE	1987-11-13 09:49:33.329267-05	28	DAUGHTER IN LAW	f	Married	12	\N	f	t	t	553	f	f		\N	f	house wife	Local	f		0
1897	2	2	26	TP / 0001 / 52 / 4	Mohammed Irsaq	MALE	2010-11-13 09:49:33.35178-05	5	Grandchild	f	Single	1	\N	f	t	f	553	f	f		\N	f	Student	Local	f		0
1898	2	2	26	TP / 0001 / 52 / 5	Shifa	FEMALE	2013-11-13 09:49:33.380106-05	2	Grandchild	f	Single		\N	f	t	f	553	f	f		\N	f		Local	f		0
1899	2	2	26	TP / 0001 / 53 / 1	Noordeen 	MALE	1971-11-13 09:49:33.402417-05	44	FAMILY HEAD	t	Married	12	\N	f	t	t	554	f	f		\N	f	Cooly	Outstation	f		0
1900	2	2	26	TP / 0001 / 53 / 2	Sirajudeen	MALE	1981-11-13 09:49:33.427455-05	34	WIFE	f	Married	6	\N	f	t	t	554	f	f		\N	f	Cooly	Local	f		0
1901	2	2	26	TP / 0001 / 53 / 3	Saira Sarbu nIsa	FEMALE	2002-11-13 09:49:33.450635-05	13	Son	f	Single	9	\N	f	t	f	554	f	f		\N	f	Student	Local	f		0
1902	2	2	26	TP / 0001 / 53 / 4	Mohammed Yasin	MALE	2006-11-13 09:49:33.479282-05	9	DAUGHTER	f	Single	5	\N	f	t	f	554	f	f		\N	f	Student	Local	f		0
1903	2	2	26	TP / 0001 / 53 / 5	Fahima	FEMALE	2007-11-13 09:49:33.507818-05	8	DAUGHTER	f	Single	4	\N	f	t	f	554	f	f		\N	f	Student	Local	f		0
1904	2	2	26	TP / 0001 / 54 / 1	Shafiulla	MALE	1965-11-13 09:49:33.53564-05	50	FAMILY HEAD	t	Married	5	\N	f	t	t	555	f	f		\N	f	Cooly	Local	f		0
1905	2	2	26	TP / 0001 / 54 / 2	Hairu nisha	FEMALE	1970-11-13 09:49:33.554593-05	45	WIFE	f	Married	4	\N	f	t	t	555	f	f		\N	f	house wife	Local	f		0
1906	2	2	26	TP / 0001 / 54 / 3	Raja Mohammed	MALE	1991-11-13 09:49:33.576469-05	24	Son	f	Single	7	\N	f	t	t	555	f	f		\N	f	Cooly	Outstation	f		0
1907	2	2	26	TP / 0001 / 55 / 1	Umar Farook	MALE	1973-11-13 09:49:33.597325-05	42	FAMILY HEAD	t	Married	5	\N	f	t	t	556	f	f		\N	f	Cooly	Outstation	f		0
1908	2	2	26	TP / 0001 / 55 / 2	Thasleema Begam	FEMALE	1982-11-13 09:49:33.613451-05	33	WIFE	f	Married	7	\N	f	t	t	556	f	f		\N	f	house wife	Local	f		0
1909	2	2	26	TP / 0001 / 55 / 3	Safrin Jasmin	FEMALE	2004-11-13 09:49:33.632504-05	11	DAUGHTER	f	Single	7	\N	f	t	f	556	f	f		\N	f	Student	Local	f		0
1910	2	2	26	TP / 0001 / 55 / 4	Mujjira Meeran	FEMALE	2009-11-13 09:49:33.656969-05	6	DAUGHTER	f	Single	2	\N	f	t	f	556	f	f		\N	f	Student	Local	f		0
1911	2	2	26	TP / 0001 / 56 / 		MALE	2015-11-13 09:49:33.680551-05	0		f	Single		\N	f	t	f	557	f	f		\N	f		Local	f		0
1912	2	2	26	TP / 0001 / 57 / 1	Sheik Alavudeen	MALE	1973-11-13 09:49:33.696541-05	42	Family head	t	Married	7	\N	f	t	t	558	f	f		\N	f	Cooly	Local	f		0
1913	2	2	26	TP / 0001 / 57 / 2	Mumtaj Bvegam	FEMALE	1975-11-13 09:49:33.71192-05	40	Wife	f	Married	8	\N	f	t	t	558	f	f		\N	f	house wife	Local	f		0
1914	2	2	26	TP / 0001 / 57 / 3	Afrin Kathija	FEMALE	1998-11-13 09:49:33.735569-05	17	Daughter	f	Single	12	\N	f	t	f	558	f	f		\N	f	Student	Local	f		0
1915	2	2	26	TP / 0001 / 58 / 1	Kachamma 	FEMALE	1955-11-13 09:49:33.763507-05	60	Mother	t	Married	8	\N	f	t	t	559	f	f		\N	f	house wife	Local	f		0
1916	2	2	26	TP / 0001 / 58 / 2	Anwar Basha	MALE	1967-11-13 09:49:33.779207-05	48	Family head	f	Married	6	\N	f	t	t	559	f	f		\N	f	Cooly	Outstation	f		0
1917	2	2	26	TP / 0001 / 58 / 3	Sajidha Banu	FEMALE	1982-11-13 09:49:33.797573-05	33	Wife	f	Married	10	\N	f	t	t	559	f	f		\N	f	house wife	Outstation	f		0
1918	2	2	26	TP / 0001 / 59 / 1	Syed Nisha	FEMALE	1965-11-13 09:49:33.815885-05	50	Family head	t	Married	5	\N	f	t	t	560	f	f		\N	f	Rest	Local	f		0
1919	2	2	26	TP / 0001 / 60 / 1	Moideen Basha	MALE	1988-11-13 09:49:33.836616-05	27	Family head	t	Married	9	\N	f	t	t	561	f	f		\N	f	Cooly	Outstation	f		0
1920	2	2	26	TP / 0001 / 60 / 2	samseera Banu	FEMALE	1991-11-13 09:49:33.852198-05	24	Wife	f	Married	10	\N	f	t	t	561	f	f		\N	f	house wife	Local	f		0
1921	2	2	26	TP / 0001 / 60 / 3	Mohammed Hafil	FEMALE	2013-11-13 09:49:33.870804-05	2	Daughter	f	Single		\N	f	t	f	561	f	f		\N	f		Local	f		0
1922	2	2	26	TP / 0001 / 61 / 1	Najmudeen	MALE	1953-11-13 09:49:33.889303-05	62	Family head	t	Married	5	\N	f	t	t	562	f	f		\N	f	Rest	Local	f		0
1923	2	2	26	TP / 0001 / 61 / 2	Madheena	FEMALE	1960-11-13 09:49:33.913201-05	55	Wife	f	Married	2	\N	f	t	t	562	f	f		\N	f	Cooly	Local	f		0
1924	2	2	26	TP / 0001 / 62 / 1	Rajabunisha	MALE	1962-11-13 09:49:33.937455-05	53	Family head	t	Married	5	\N	f	t	t	563	f	f		\N	f	house wife	Local	f		0
1925	2	2	26	TP / 0001 / 62 / 2	Yasir ahmad	FEMALE	1986-11-13 09:49:33.957376-05	29	Wife	f	Single	9	\N	f	t	t	563	f	f		\N	f	Cooly	Local	f		0
1926	2	2	26	TP / 0001 / 63 / 1	Abdul Hameed	MALE	1948-11-13 09:49:33.980574-05	67	Family head	t	Married	6	\N	f	t	t	564	f	f		\N	f	Petty Shop	Local	f		0
1927	2	2	26	TP / 0001 / 63 / 2	Mahamoodha Beevi	FEMALE	1957-11-13 09:49:34.001052-05	58	Wife	f	Married	4	\N	f	t	t	564	f	f		\N	f	house wife	Local	f		0
1928	2	2	26	TP / 0001 / 64 / 		MALE	2015-11-13 09:49:34.024838-05	0		f	Single		\N	f	t	f	565	f	f		\N	f		Local	f		0
1929	2	2	26	TP / 0001 / 65 / 1	Mohammed ismaeal	FEMALE	1960-11-13 09:49:34.040078-05	55	Family Head	t	Married		\N	f	t	t	566	f	f		\N	f	Cooly	Local	f		0
1930	2	2	26	TP / 0001 / 65 / 2	Mumtaj	FEMALE	1955-11-13 09:49:34.055325-05	60	wife	f	Married		\N	f	t	t	566	f	f		\N	f	house wife	Local	f		0
1931	2	2	26	TP / 0001 / 65 / 3	Amanulla	FEMALE	1990-11-13 09:49:34.07354-05	25	Son	f	Married	8	\N	f	t	t	566	f	f		\N	f	Driver	Local	f		0
1932	2	2	26	TP / 0001 / 65 / 4	Sarmila Banu	FEMALE	1996-11-13 09:49:34.091321-05	19	Daughter in law	f	Married	10	\N	f	t	t	566	f	f		\N	f	House wife	Local	f		0
1933	2	2	26	TP / 0001 / 68 / 1	Shajahan	MALE	1970-11-13 09:49:34.108879-05	45	Family Head	t	Married	9	\N	f	t	t	567	f	f		\N	f	Provision	Outstation	f		0
1934	2	2	26	TP / 0001 / 68 / 2	Fathima	FEMALE	1982-11-13 09:49:34.123604-05	33	wife	f	Married	8	\N	f	t	t	567	f	f		\N	f	house wife	Outstation	f		0
1935	2	2	26	TP / 0001 / 68 / 3	barakathun nasiya	MALE	1998-11-13 09:49:34.145969-05	17	Daughter 	f	Single	12	\N	f	t	f	567	f	f		\N	f	Unemployed	Local	f		0
1936	2	2	26	TP / 0001 / 68 / 4	Mohammed Tamimun nisha	MALE	2000-11-13 09:49:34.17245-05	15	Daughter	f	Single	10	\N	f	t	f	567	f	f		\N	f	Student	Local	f		0
1937	2	2	26	TP / 0001 / 69 / 1	JALALUDEEN	MALE	1954-11-13 09:49:34.190747-05	61	Family Head	t	Married	10	\N	f	t	t	568	f	f		\N	f	Cooly	Local	f		0
1938	2	2	26	TP / 0001 / 69 / 2	taj nisha	FEMALE	1970-11-13 09:49:34.205433-05	45	wife	f	Married	5	\N	f	t	t	568	f	f		\N	f	house wife	Outstation	f		0
1939	2	2	26	TP / 0001 / 69 / 3	Shahabudeen	MALE	1982-11-13 09:49:34.223502-05	33	Son	f	Married	8	\N	f	t	t	568	f	f		\N	f	Electrican	Local	f		0
1940	2	2	26	TP / 0001 / 69 / 4	Sharmil;a Parveen	FEMALE	1985-11-13 09:49:34.241105-05	30	Daughter in law	f	Married	12	\N	f	t	t	568	f	f		\N	f	house wife	Local	f		0
1941	2	2	26	TP / 0001 / 69 / 5	Yasmin Banu	FEMALE	1997-11-13 09:49:34.263668-05	18	Daughter	f	Single	12	\N	f	t	f	568	f	f		\N	f	Engagement 	Local	f		0
1942	2	2	26	TP / 0001 / 69 / 6	Mohammed Riyaz	MALE	2011-11-13 09:49:34.285849-05	4	Grand child	f	Single		\N	f	t	f	568	f	f		\N	f		Local	f		0
1943	2	2	26	TP / 0001 / 69 / 7	Sanofar	FEMALE	2014-11-13 09:49:34.303432-05	1	Grand child	f	Single		\N	f	t	f	568	f	f		\N	f		Local	f		0
1944	2	2	26	TP / 0001 / 70 / 1	Chellakannu	MALE	1955-11-13 09:49:34.321022-05	60	Family Head	t	Married	5	\N	f	t	t	569	f	f		\N	f	Cooly	Outstation	f		0
1945	2	2	26	TP / 0001 / 70 / 2	Fathima	FEMALE	1960-11-13 09:49:34.340278-05	55	wife	f	Married	3	\N	f	t	t	569	f	f		\N	f	house wife	Local	f		0
1946	2	2	26	TP / 0001 / 71 / 1	Mohammed yakoob	MALE	1980-11-13 09:49:34.362736-05	35	Family Head	t	Married	5	\N	f	t	t	570	f	f		\N	f	Cooly	Local	f		0
1947	2	2	26	TP / 0001 / 71 / 2	Sajidha Banu	FEMALE	1982-11-13 09:49:34.378678-05	33	wife	f	Married	5	\N	f	t	t	570	f	f		\N	f	house wife	Local	f		0
1948	2	2	26	TP / 0001 / 71 / 3	Mohammed Riyaz	MALE	2001-11-13 09:49:34.39651-05	14	Son	f	Single	9	\N	f	t	f	570	f	f		\N	f	Student	Local	f		0
1949	2	2	26	TP / 0001 / 71 / 4	Sharmila Banu	FEMALE	2004-11-13 09:49:34.418186-05	11	Daughter	f	Single	7	\N	f	t	f	570	f	f		\N	f	Student	Local	f		0
1950	2	2	26	TP / 0001 / 72 / 1	Sidhik	MALE	1946-11-13 09:49:34.440786-05	69	Family Head	t	Married	5	\N	f	t	t	571	f	f		\N	f	Rest	Local	f		0
1951	2	2	26	TP / 0001 / 72 / 2	Jennath Nisha	FEMALE	1960-11-13 09:49:34.455727-05	55	wife	f	Married		\N	f	t	t	571	f	f		\N	f	100 day cooly	Local	f		0
1952	2	2	26	TP / 0001 / 73 / 1	Abdul hai	MALE	1964-11-13 09:49:34.473812-05	51	Family Head	t	Married	5	\N	f	t	t	572	f	f		\N	f	Cooly	Local	f		0
1953	2	2	26	TP / 0001 / 73 / 2	Mehraj Begam	FEMALE	1977-11-13 09:49:34.488511-05	38	wife	f	Married	8	\N	f	t	t	572	f	f		\N	f	house wife	Local	f		0
1954	2	2	26	TP / 0001 / 73 / 3	Mohammed Asif	MALE	2007-11-13 09:49:34.506405-05	8	Son	f	Single	4	\N	f	t	f	572	f	f		\N	f	Student	Local	f		0
1955	2	2	26	TP / 0001 / 74 / 1	Mustaq ali	MALE	1977-11-13 09:49:34.529648-05	38	Family Head	t	Married	3	\N	f	t	t	573	f	f		\N	f	Cooly	Local	f		0
1956	2	2	26	TP / 0001 / 74 / 2	Mumtaj	FEMALE	1987-11-13 09:49:34.544474-05	28	wife	f	Married	10	\N	f	t	t	573	f	f		\N	f	house wife	Local	f		0
1957	2	2	26	TP / 0001 / 74 / 3	Syed Abuthahir	MALE	2003-11-13 09:49:34.562175-05	12	Son	f	Single	7	\N	f	t	f	573	f	f		\N	f	Student	Local	f		0
1958	2	2	26	TP / 0001 / 74 / 4	Mohammed Arsad	MALE	2008-11-13 09:49:34.584283-05	7	Son	f	Single	3	\N	f	t	f	573	f	f		\N	f	Student	Local	f		0
1959	2	2	26	TP / 0001 / 75 / 1	Sadhik Basha	MALE	1967-11-13 09:49:34.605949-05	48	Family Head	t	Married	DME	\N	f	t	t	574	f	f		\N	f	Occupation	Local	f		0
1960	2	2	26	TP / 0001 / 75 / 2	Nusrath Begam	FEMALE	1977-11-13 09:49:34.620592-05	38	wife	f	Married	DEEE	\N	f	t	t	574	f	f		\N	f	house wife	Local	f		0
1961	2	2	26	TP / 0001 / 75 / 3	famidha Begam	FEMALE	1999-11-13 09:49:34.639446-05	16	DAUGHTER	f	Single	11	\N	f	t	f	574	f	f		\N	f	Student	Local	f		0
1962	2	2	26	TP / 0001 / 75 / 4	Barzina rasiya	FEMALE	2008-11-13 09:49:34.663207-05	7	DAUGHTER	f	Single	3	\N	f	t	f	574	f	f		\N	f	Student	Local	f		0
1963	2	2	26	TP / 0001 / 76 / 1	Liyakath ali	MALE	1967-11-13 09:49:34.688325-05	48	Family Head	t	Married	6	\N	f	t	t	575	f	f		\N	f	Cooly	Local	f		0
1964	2	2	26	TP / 0001 / 76 / 2	Fathima	FEMALE	1975-11-13 09:49:34.704695-05	40	wife	f	Married	11	\N	f	t	t	575	f	f		\N	f	house wife	Local	f		0
1965	2	2	26	TP / 0001 / 76 / 3	Mohammed Abbas	MALE	1998-11-13 09:49:34.723551-05	17	Son	f	Single	B.A	\N	f	t	f	575	f	f		\N	f	Student	Local	f		0
1966	2	2	26	TP / 0001 / 76 / 4	Mohammed rafi	MALE	2003-11-13 09:49:34.746924-05	12	Son	f	Single	8	\N	f	t	f	575	f	f		\N	f	Student	Local	f		0
1967	2	2	26	TP / 0001 / 77 / 		MALE	2015-11-13 09:49:34.769588-05	0		f	Single		\N	f	t	f	576	f	f		\N	f		Local	f		0
1968	2	2	26	TP / 0001 / 78 / 1	Abdul hakim	MALE	1965-11-13 09:49:34.784211-05	50	Family head	t	Married		\N	f	t	t	577	f	f		\N	f	Cooly	Local	f		0
1969	2	2	26	TP / 0001 / 78 / 2	Raja nisha	FEMALE	1970-11-13 09:49:34.799783-05	45	Wife	f	Married		\N	f	t	t	577	f	f		\N	f	house wife	Local	f		0
1970	2	2	26	TP / 0001 / 78 / 3	syed Rabiyamma	FEMALE	1994-11-13 09:49:34.817851-05	21	Daughter	f	Single	12	\N	f	t	t	577	f	f		\N	f	rest	Local	f		0
1971	2	2	26	TP / 0001 / 78 / 4	Asifa	FEMALE	1997-11-13 09:49:34.84074-05	18	Daughter	f	Single	12	\N	f	t	t	577	f	f		\N	f	rest	Local	f		0
1972	2	2	26	TP / 0001 / 79 / 1	Noor Mohammed	MALE	1965-11-13 09:49:34.863848-05	50	Family head	t	Married	6	\N	f	t	t	578	f	f		\N	f	Petty Shop	Local	f		0
1973	2	2	26	TP / 0001 / 79 / 2	Afroze BaNU	FEMALE	1980-11-13 09:49:34.884092-05	35	Wife	f	Married	8	\N	f	t	t	578	f	f		\N	f	house wife	Local	f		0
1974	2	2	26	TP / 0001 / 80 / 1	Habibulla	MALE	1980-11-13 09:49:34.906833-05	35	Family head	t	Married	6	\N	f	t	t	579	f	f		\N	f	Cooly	Local	f		0
1975	2	2	26	TP / 0001 / 80 / 2	Hajara Beevi	FEMALE	1970-11-13 09:49:34.926016-05	45	Wife	f	Married	5	\N	f	t	t	579	f	f		\N	f	house wife	Local	f		0
1976	2	2	26	TP / 0001 / 80 / 3	Asarafali	MALE	1990-11-13 09:49:34.94501-05	25	Son	f	Married	8	\N	f	t	t	579	f	f		\N	f	Cooly	Local	f		0
1977	2	2	26	TP / 0001 / 80 / 4	Usman ali	MALE	1991-11-13 09:49:34.964111-05	24	Son	f	Married	6	\N	f	t	t	579	f	f		\N	f	Cooly	Local	f		0
1978	2	2	26	TP / 0001 / 80 / 5	Mahmoodha	FEMALE	1992-11-13 09:49:34.98772-05	23	Daughter in law	f	Married	11	\N	f	t	t	579	f	f		\N	f	house wife	Local	f		0
1979	2	2	26	TP / 0001 / 81 / 		MALE	2015-11-13 09:49:35.006426-05	0		f	Single		\N	f	t	f	580	f	f		\N	f		Local	f		0
1980	2	2	26	TP / 0001 / 82 / 1	Abdul Hakim	MALE	1972-11-13 09:49:35.021663-05	43	Famil head	t	Married	9	\N	f	t	t	581	f	f		\N	f	Fancy Store	Local	f		0
1981	2	2	26	TP / 0001 / 82 / 2	Syed Rabiya	FEMALE	1980-11-13 09:49:35.036926-05	35	Wife	f	Married	8	\N	f	t	t	581	f	f		\N	f	House wife	Local	f		0
1982	2	2	26	TP / 0001 / 82 / 3	Salsath banu	FEMALE	1999-11-13 09:49:35.055288-05	16	Daughjter	f	Single	12	\N	f	t	f	581	f	f		\N	f	Student	Local	f		0
1983	2	2	26	TP / 0001 / 82 / 4	Balqis Begam	FEMALE	1998-11-13 09:49:35.077699-05	17	Daughjter	f	Single	Degree	\N	f	t	f	581	f	f		\N	f	Student	Local	f		0
1984	2	2	26	TP / 0001 / 83 / 1	Sawkath ali	MALE	1950-11-13 09:49:35.117573-05	65	Famil head	t	Married	5	\N	f	t	t	582	f	f		\N	f	Cooly	Local	f		0
1985	2	2	26	TP / 0001 / 83 / 2	Saira banu	FEMALE	1958-11-13 09:49:35.145844-05	57	Wife	f	Married	4	\N	f	t	t	582	f	f		\N	f	House wife	Local	f		0
1986	2	2	26	TP / 0001 / 83 / 3	Sharmila Banu	FEMALE	1990-11-13 09:49:35.188363-05	25	Daughjter	f	Single	10	\N	f	t	f	582	f	f		\N	f		Local	f		0
1987	2	2	26	TP / 0001 / 83 / 4	Mohammed abdulla	MALE	1997-11-13 09:49:35.231917-05	18	SON	f	Single	DME	\N	f	t	f	582	f	f		\N	f	Student	Local	f		0
1988	2	2	26	TP / 0001 / 84 / 1	Nasrudeen	MALE	1967-11-13 09:49:35.276233-05	48	Famil head	t	Married	5	\N	f	t	t	583	f	f		\N	f	Cooly	Local	f		0
1989	2	2	26	TP / 0001 / 84 / 2	Hajara Beevi	FEMALE	1968-11-13 09:49:35.305365-05	47	Wife	f	Married	5	\N	f	t	t	583	f	f		\N	f	House wife	Local	f		0
1990	2	2	26	TP / 0001 / 84 / 3	Sheik fareedh	MALE	1994-11-13 09:49:35.340442-05	21	SON	f	Single	12	\N	f	t	f	583	f	f		\N	f		Local	f		0
1991	2	2	26	TP / 0001 / 84 / 4	Mohammed Sadhik	MALE	1997-11-13 09:49:35.375049-05	18	SON	f	Single	10	\N	f	t	f	583	f	f		\N	f		Local	f		0
1992	2	2	26	TP / 0001 / 85 / 1	Basheer ahamed	MALE	1970-11-13 09:49:35.409659-05	45	Famil head	t	Married	5	\N	f	t	t	584	f	f		\N	f	Cooly	Local	f		0
1993	2	2	26	TP / 0001 / 85 / 2	Rajina Begam	FEMALE	1967-11-13 09:49:35.438264-05	48	Wife	f	Married	10	\N	f	t	t	584	f	f		\N	f	House wife	Local	f		0
1994	2	2	26	TP / 0001 / 85 / 3	Sajidha	FEMALE	1993-11-13 09:49:35.475684-05	22	Daughter	f	Single	College	\N	f	t	f	584	f	f		\N	f	Student	Local	f		0
1995	2	2	26	TP / 0001 / 85 / 4	Aysha	FEMALE	1994-11-13 09:49:35.521295-05	21	daughter	f	Single	College	\N	f	t	f	584	f	f		\N	f	Student	Local	f		0
1996	2	2	26	TP / 0001 / 86 / 		MALE	2015-11-13 09:49:35.571185-05	0		f	Single		\N	f	t	f	585	f	f		\N	f		Local	f		0
1997	2	2	26	TP / 0001 / 87 / 1	Rahmathulla	MALE	1972-11-13 09:49:35.598874-05	43	Family head	t	Married	10	\N	f	t	t	586	f	f		\N	f	Cooly	Local	f		0
1998	2	2	26	TP / 0001 / 87 / 2	Taj nisha	FEMALE	1985-11-13 09:49:35.627005-05	30	House wife	f	Married	5	\N	f	t	t	586	f	f		\N	f	House wife	Local	f		0
1999	2	2	26	TP / 0001 / 87 / 3	Ruksana Begam	FEMALE	2008-11-13 09:49:35.661415-05	7	Dauhter	f	Single	3	\N	f	t	f	586	f	f		\N	f	Student	Local	f		0
2000	2	2	26	TP / 0001 / 87 / 4	Rubina Begam	FEMALE	2009-11-13 09:49:35.711344-05	6	Dauhter	f	Single	1	\N	f	t	f	586	f	f		\N	f	Student	Local	f		0
2001	2	2	26	TP / 0001 / 88 / 		MALE	2015-11-13 09:49:35.759512-05	0		f	Single		\N	f	t	f	587	f	f		\N	f		Local	f		0
2002	2	2	26	TP / 0001 / 89 / 1	Rabiyathu Basariya	FEMALE	1950-11-13 09:49:35.789416-05	65	Family head	t	Married	6	\N	f	t	f	588	f	f		\N	f	Rest	Local	f		0
2003	1	1	7	ER / 0001 / 201 / 1	Paasu	MALE	1934-09-08 01:00:00-04	81	Father	t	Married	8 Std	\N	f	t	t	589	f	f		\N	f	Rest	Local	f		0
2004	1	1	7	ER / 0001 / 201 / 2	Shahul john	FEMALE	1945-11-13 09:49:35.877922-05	70	Mother	f	Married	10 Std	\N	f	t	t	589	f	f		\N	f	Home Maker	Local	f		0
2005	1	1	7	ER / 0001 / 201 / 3	Syed John	MALE	1966-11-13 09:49:35.915616-05	49	Son	f	Married	12 Std	\N	f	t	t	589	f	f		\N	f	Foot Shoper	Local	f		0
2006	1	1	7	ER / 0001 / 201 / 4	Janath	FEMALE	1975-11-13 09:49:35.959136-05	40	Dau.in.Law	f	Married	9 Std	\N	f	t	t	589	f	f		\N	f	Home Maker	Local	f		0
2007	1	1	7	ER / 0001 / 201 / 5	Barkath Nilofer	FEMALE	1997-11-13 09:49:36.002297-05	18	G.Daugter	f	Single	UG 	\N	f	t	t	589	f	f		\N	f	Student	Local	f		0
2008	1	1	7	ER / 0001 / 201 / 6	Syed Fazil	MALE	1999-11-13 09:49:36.038885-05	16	G.Son	f	Single	11 Std	\N	f	t	f	589	f	f		\N	f	Student	Local	f		0
2009	1	1	7	ER / 0001 / 202 / 1	Basha	MALE	1945-11-13 09:49:36.074517-05	70	Father	t	Married	2 Std	\N	f	t	t	590	f	f		\N	f	Driver	Local	f		0
2010	1	1	7	ER / 0001 / 202 / 2	Afrose Begam	FEMALE	1970-11-13 09:49:36.113838-05	45	Mother	f	Married	6 Std	\N	f	t	t	590	f	f		\N	f	Home Maker	Local	f		0
2011	1	1	7	ER / 0001 / 202 / 3	Noor Mohamed	MALE	1994-11-13 09:49:36.151505-05	21	Son	f	Married	9 Std	\N	f	t	t	590	f	f		\N	f	Cooli	Local	f		0
2012	1	1	7	ER / 0001 / 202 / 4	Yasmin	FEMALE	1995-11-13 09:49:36.194528-05	20	Dau.in.Law	f	Married	10 Std	\N	f	t	t	590	f	f		\N	f	Home Maker	Local	f		0
2013	1	1	7	ER / 0001 / 202 / 5	Basith	MALE	1997-11-13 09:49:36.238203-05	18	Brother	f	Single	9 Std	\N	f	t	f	590	f	f		\N	f	Driver	Local	f		0
2014	1	1	7	ER / 0001 / 203 / 1	Mohamed Muthu	MALE	1981-11-13 09:49:36.274841-05	34	Father	t	Married	10 Std	\N	f	t	t	591	f	f		\N	f	Store Labour	Local	f		0
2015	1	1	7	ER / 0001 / 203 / 2	Shakila Banu	FEMALE	1983-11-13 09:49:36.303819-05	32	Mother	f	Married	8 Std	\N	f	t	t	591	f	f		\N	f	Home Maker	Local	f		0
2016	1	1	7	ER / 0001 / 203 / 3	Salman	MALE	2005-11-13 09:49:36.339592-05	10	Son	f	Single	5 Std	\N	f	t	f	591	f	f		\N	f	Student	Local	f		0
2017	1	1	7	ER / 0001 / 203 / 4	Rizwan	MALE	2009-11-13 09:49:36.375658-05	6	Son	f	Single	2 Std	\N	f	t	f	591	f	f		\N	f	Student	Local	f		0
2018	1	1	7	ER / 0001 / 203 / 5	Mumthaj	FEMALE	1960-11-13 09:49:36.414704-05	55	G.Mother	f	Widow		\N	f	t	t	591	f	f		\N	f	Home Maker	Local	f		0
2019	1	1	7	ER / 0001 / 204 / 1	Subitha Begam	FEMALE	1959-11-13 09:49:36.458032-05	56	Mother	t	Widow		\N	f	t	t	592	f	f		\N	f	Home Maker	Local	f		0
2020	1	1	7	ER / 0001 / 204 / 2	Sakila Banu	FEMALE	1984-11-13 09:49:36.503896-05	31	Daugter	f	Devorced	8 Std	\N	f	t	t	592	f	f		\N	f	Home Maker	Local	f		0
2021	1	1	7	ER / 0001 / 204 / 3	Kaja	MALE	1985-11-13 09:49:36.547113-05	30	Sister	f	Single	UG 	\N	f	t	t	592	f	f		\N	f	Cooli	Local	f		0
2022	1	1	7	ER / 0001 / 204 / 4	Faritha 	FEMALE	1987-11-13 09:49:36.58146-05	28	Daugter	f	Single	12 Std	\N	f	t	t	592	f	f		\N	f	Rest	Local	f		0
2023	1	1	7	ER / 0001 / 204 / 5	Jinkiliya Fazila	FEMALE	1991-11-13 09:49:36.629735-05	24	Daugter	f	Single	PG	\N	f	t	t	592	f	f		\N	f	Alima	Local	f		0
2024	1	1	7	ER / 0001 / 205 / 1	Abdul Kani	MALE	1945-11-13 09:49:36.671576-05	70	Father	t	Married		\N	f	t	t	593	f	f		\N	f	Sikaret Labour	Local	f		0
2025	1	1	7	ER / 0001 / 205 / 2	Saburama	FEMALE	1955-11-13 09:49:36.704351-05	60	Mother	f	Married		\N	f	t	t	593	f	f		\N	f	Home Maker	Local	f		0
2026	1	1	7	ER / 0001 / 205 / 3	Mahabu Nisha	FEMALE	1981-11-13 09:49:36.732858-05	34	Daugter	f	Married	9 Std	\N	f	t	t	593	f	f		\N	f	Home Maker	Local	f		0
2027	1	1	7	ER / 0001 / 205 / 4	Rimaa Thanzil	FEMALE	2012-11-13 09:49:36.76033-05	3	G.Son	f	Single	LKG	\N	f	t	f	593	f	f		\N	f	Student	Local	f		0
2028	1	1	7	ER / 0001 / 205 / 5	Sahul Hameed	MALE	1985-11-13 09:49:36.796954-05	30	Son	f	Married	9 Std	\N	f	t	t	593	f	f		\N	f	Work In Company	Local	f		0
2029	1	1	7	ER / 0001 / 205 / 6	Alimath	FEMALE	1997-11-13 09:49:36.824556-05	18	G.Daugter	f	Single	UG 	\N	f	t	f	593	f	f		\N	f	Student	Local	f		0
2030	1	1	7	ER / 0001 / 206 / 1	Jahir husain	MALE	1969-11-13 09:49:36.858789-05	46	Father	t	Married	8 Std	\N	f	t	t	594	f	f		\N	f	Seat Covers	Local	f		0
2031	1	1	7	ER / 0001 / 206 / 2	Mubarak Begam	FEMALE	1983-11-13 09:49:36.889622-05	32	Mother	f	Married	8 Std	\N	f	t	t	594	f	f		\N	f	Home Maker	Local	f		0
2032	1	1	7	ER / 0001 / 206 / 3	Samisath Begam	FEMALE	1997-11-13 09:49:36.917684-05	18	Daugter	f	Single	UG 	\N	f	t	t	594	f	f		\N	f	Student	Local	f		0
2033	1	1	7	ER / 0001 / 206 / 4	Saif Ali Khan	MALE	1999-11-13 09:49:36.952144-05	16	Son	f	Single	10 Std	\N	f	t	f	594	f	f		\N	f	Student	Local	f		0
2034	1	1	7	ER / 0001 / 207 / 1	Abdul Sathar	MALE	1957-11-13 09:49:36.987465-05	58	Father	t	Married		\N	f	t	t	595	f	f		\N	f	Lorry Macanic	Local	f		0
2035	1	1	7	ER / 0001 / 207 / 2	Naajira	FEMALE	1970-11-13 09:49:37.017245-05	45	Mother	f	Married	7 Std	\N	f	t	t	595	f	f		\N	f	Home Maker	Local	f		0
2036	1	1	7	ER / 0001 / 207 / 3	Kurbaan	MALE	1989-11-13 09:49:37.045274-05	26	Son	f	Single	UG 	\N	f	t	f	595	f	f		\N	f	Officer	Local	f		0
2037	1	1	7	ER / 0001 / 208 / 1	Jaithun Bevi	FEMALE	1955-11-13 09:49:37.079314-05	60	Mother	t	Widow		\N	f	t	t	596	f	f		\N	f	Home Maker	Local	f		0
2038	1	1	7	ER / 0001 / 208 / 2	Kaja Moideen	MALE	1969-11-13 09:49:37.098947-05	46	Son	f	Married	9 Std	\N	f	t	t	596	f	f		\N	f	Driver	Local	f		0
2039	1	1	7	ER / 0001 / 208 / 3	Rajiya Begam	FEMALE	1975-11-13 09:49:37.122455-05	40	Dau.in.Law	f	Married	8 Std	\N	f	t	t	596	f	f		\N	f	Home Maker	Local	f		0
2040	1	1	7	ER / 0001 / 208 / 4	Sajitha Banu	FEMALE	1998-11-13 09:49:37.145277-05	17	Daugter	f	Single	12 Std	\N	f	t	f	596	f	f		\N	f	Student	Local	f		0
2041	1	1	7	ER / 0001 / 208 / 5	Mohamed Umar	MALE	2001-11-13 09:49:37.174821-05	14	Son	f	Single	9 Std	\N	f	t	f	596	f	f		\N	f	Student	Local	f		0
2042	1	1	7	ER / 0001 / 208 / 6	Ahmed Kabeer	MALE	1970-11-13 09:49:37.205263-05	45	Brother	f	Single	9 Std	\N	f	t	t	596	f	f		\N	f	Labour	Local	f		0
2043	1	1	7	ER / 0001 / 209 / 1	Sailani Babu	FEMALE	1955-11-13 09:49:37.228591-05	60	Father	t	Widow	2 Std	\N	f	t	t	597	f	f		\N	f	Business	Local	f		0
2044	1	1	7	ER / 0001 / 209 / 2	Mohamed Farook	MALE	1985-11-13 09:49:37.266927-05	30	Son	f	Married	UG 	\N	f	t	t	597	f	f		\N	f	Driver	Local	f		0
2045	1	1	7	ER / 0001 / 209 / 3	Fathima	FEMALE	1990-11-13 09:49:37.290762-05	25	Dau.in.Law	f	Married	8 Std	\N	f	t	t	597	f	f		\N	f	Home Maker	Local	f		0
2046	1	1	7	ER / 0001 / 209 / 4	Ibrahim	MALE	2012-11-13 09:49:37.314097-05	3	G.Son	f	Single		\N	f	t	f	597	f	f		\N	f	Baby	Local	f		0
2047	1	1	7	ER / 0001 / 209 / 5	Abdull	MALE	2014-11-13 09:49:37.337101-05	1	G.Son	f	Single		\N	f	t	f	597	f	f		\N	f	Baby	Local	f		0
2048	1	1	7	ER / 0001 / 210 / 1	Suliman	MALE	1974-11-13 09:49:37.36107-05	41	Father	t	Married	3 Std	\N	f	t	t	598	f	f		\N	f	Machanic	Local	f		0
2049	1	1	7	ER / 0001 / 210 / 2	Sailani Babu	FEMALE	1985-11-13 09:49:37.380689-05	30	Mother	f	Married	7 Std	\N	f	t	t	598	f	f		\N	f	Home Maker	Local	f		0
2050	1	1	7	ER / 0001 / 210 / 3	Parveen Banu	FEMALE	2000-11-13 09:49:37.404353-05	15	Daugter	f	Single	10 Std	\N	f	t	f	598	f	f		\N	f	Student	Local	f		0
2051	1	1	7	ER / 0001 / 210 / 4	Afrin Banu	FEMALE	2002-11-13 09:49:37.433667-05	13	Daugter	f	Single	7 Std	\N	f	t	f	598	f	f		\N	f	Student	Local	f		0
2052	1	1	7	ER / 0001 / 211 / 1	Bakurudin	MALE	1980-11-13 09:49:37.462663-05	35	Father	t	Married	5 Std	\N	f	t	t	599	f	f		\N	f	Driver	Local	f		0
2053	1	1	7	ER / 0001 / 211 / 2	Arifa Begam	FEMALE	1987-11-13 09:49:37.481899-05	28	Mother	f	Married	8 Std	\N	f	t	t	599	f	f		\N	f	Tailoring	Local	f		0
2054	1	1	7	ER / 0001 / 211 / 3	Mohamed Ayub	MALE	2009-11-13 09:49:37.510204-05	6	Son	f	Single	1 Std	\N	f	t	f	599	f	f		\N	f	Student	Local	f		0
2055	1	1	7	ER / 0001 / 211 / 4	Yousuf	MALE	2013-11-13 09:49:37.538671-05	2	Son	f	Single		\N	f	t	f	599	f	f		\N	f	Baby	Local	f		0
2056	1	1	7	ER / 0001 / 212 / 1	Jailami	FEMALE	1953-11-13 09:49:37.563116-05	62	Father	t	Widow	2 Std	\N	f	t	t	600	f	f		\N	f	Rest	Local	f		0
2057	1	1	7	ER / 0001 / 212 / 2	Nasr ali	MALE	1983-11-13 09:49:37.591836-05	32	Son	f	Married	8 Std	\N	f	t	t	600	f	f		\N	f	Machanic	Local	f		0
2058	1	1	7	ER / 0001 / 212 / 3	Rabiya	FEMALE	1992-11-13 09:49:37.614971-05	23	Dau.in.Law	f	Married	10 Std	\N	f	t	t	600	f	f		\N	f	Tailoring	Local	f		0
2059	1	1	7	ER / 0001 / 212 / 4	Navas	MALE	2010-11-13 09:49:37.638566-05	5	G.Son	f	Single	1 Std	\N	f	t	f	600	f	f		\N	f	Student	Local	f		0
2060	1	1	7	ER / 0001 / 212 / 5	Nabiha	FEMALE	2012-11-13 09:49:37.66148-05	3	G.Daugter	f	Single		\N	f	t	f	600	f	f		\N	f	Baby	Local	f		0
2061	1	1	7	ER / 0001 / 212 / 6	Mohamed Siddiqa	FEMALE	2000-11-13 09:49:37.680204-05	15	G.Daugter	f	Single	10 Std	\N	f	t	f	600	f	f		\N	f	Student	Local	f		0
2062	1	1	7	ER / 0001 / 213 / 1	Kairun Nisha	FEMALE	1945-11-13 09:49:37.700955-05	70	Mother	t	Married	3 Std	\N	f	t	t	601	f	f		\N	f	Home Maker	Local	f		0
2063	1	1	7	ER / 0001 / 213 / 2	Najmudeen	MALE	1968-11-13 09:49:37.721476-05	47	Son	f	Married	10 Std	\N	f	t	t	601	f	f		\N	f	Sales Man	Local	f		0
2064	1	1	7	ER / 0001 / 213 / 3	Kamila	FEMALE	1975-11-13 09:49:37.740046-05	40	Dau.in.Law	f	Married	8 Std	\N	f	t	t	601	f	f		\N	f	Home Maker	Local	f		0
2065	1	1	7	ER / 0001 / 213 / 4	Mohamed Rizwan	MALE	1999-11-13 09:49:37.759238-05	16	G.Son	f	Single	1 Std	\N	f	t	f	601	f	f		\N	f	Student	Local	f		0
2066	1	1	7	ER / 0001 / 213 / 5	Ayisha	FEMALE	2006-11-13 09:49:37.782482-05	9	G.Daugter	f	Single	4 Std	\N	f	t	f	601	f	f		\N	f	Student	Local	f		0
2067	1	1	7	ER / 0001 / 214 / 1	Hidayathull	MALE	1947-11-13 09:49:37.80633-05	68	Father	t	Married	5 Std	\N	f	t	t	602	f	f		\N	f	Cooli	Local	f		0
2068	1	1	7	ER / 0001 / 214 / 2	Sabira Bevi	FEMALE	1953-11-13 09:49:37.831579-05	62	Mother	f	Married	3 Std	\N	f	t	t	602	f	f		\N	f	Home Maker	Local	f		0
2069	1	1	7	ER / 0001 / 214 / 3	Syed Abuthahir	MALE	1985-11-13 09:49:37.850786-05	30	Son	f	Married	10 Std	\N	f	t	t	602	f	f		\N	f	Officer	Local	f		0
2070	1	1	7	ER / 0001 / 214 / 4	Parveen  	FEMALE	1996-11-13 09:49:37.872453-05	19	Dau.in.Law	f	Married	10 Std	\N	f	t	t	602	f	f		\N	f	Home Maker	Local	f		0
2071	1	1	7	ER / 0001 / 214 / 5	Arsiya Fathima	FEMALE	2013-11-13 09:49:37.895909-05	2	G.Daugter	f	Single		\N	f	t	f	602	f	f		\N	f	Baby	Local	f		0
2072	1	1	7	ER / 0001 / 215 / 1	Sheik Sulaiman	MALE	1965-11-13 09:49:37.914928-05	50	Father	t	Married	6 Std	\N	f	t	t	603	f	f		\N	f	Painter	Local	f		0
2073	1	1	7	ER / 0001 / 215 / 2	Resma Banu	FEMALE	1984-11-13 09:49:37.935316-05	31	Mother	f	Married	10 Std	\N	f	t	t	603	f	f		\N	f	Home Maker	Local	f		0
2074	1	1	7	ER / 0001 / 215 / 3	Rekana	FEMALE	2007-11-13 09:49:37.954508-05	8	Daugter	f	Single	3 Std	\N	f	t	f	603	f	f		\N	f	Student	Local	f		0
2075	1	1	7	ER / 0001 / 215 / 4	Rizwan	MALE	2009-11-13 09:49:37.979698-05	6	Son	f	Single	1 Std	\N	f	t	f	603	f	f		\N	f	Student	Local	f		0
2076	1	1	7	ER / 0001 / 216 / 1	Mohamed Sulthan	MALE	1950-11-13 09:49:38.007298-05	65	Father	t	Married	UG 	\N	f	t	t	604	f	f		\N	f	Rest	Local	f		0
2077	1	1	7	ER / 0001 / 216 / 2	Pousiya Begam	FEMALE	1962-11-13 09:49:38.027704-05	53	Mother	f	Married	7 Std	\N	f	t	t	604	f	f		\N	f	Home Maker	Local	f		0
2078	1	1	7	ER / 0001 / 216 / 3	Mohamed Hasan	MALE	1987-11-13 09:49:38.04619-05	28	Son	f	Single	UG 	\N	f	t	t	604	f	f		\N	f	No Job	Local	f		0
2079	1	1	7	ER / 0001 / 216 / 4	Mohamed Umar	MALE	1988-11-13 09:49:38.069322-05	27	Daugter	f	Single	D.C.E	\N	f	t	t	604	f	f		\N	f	Computer Sales Man	Outstation	f		0
2080	1	1	7	ER / 0001 / 216 / 5	Mohamed Shahul	MALE	1990-11-13 09:49:38.092374-05	25	Son	f	Single	UG 	\N	f	t	t	604	f	f		\N	f	No Job	Local	f		0
2081	1	1	7	ER / 0001 / 217 / 1	Abbas Ali	MALE	1952-11-13 09:49:38.115245-05	63	Father	t	Married	4 Std	\N	f	t	t	605	f	f		\N	f	Fancy Store	Outstation	f		0
2082	1	1	7	ER / 0001 / 217 / 2	Rasitha Begam	FEMALE	1965-11-13 09:49:38.134554-05	50	Mother	f	Married	10 Std	\N	f	t	t	605	f	f		\N	f	Home Maker	Local	f		0
2083	1	1	7	ER / 0001 / 217 / 3	Syed Musthafa	MALE	1987-11-13 09:49:38.157422-05	28	Son	f	Married	9 Std	\N	f	t	t	605	f	f		\N	f	Tailoring	Local	f		0
2084	1	1	7	ER / 0001 / 217 / 4	Raikan Parveen	FEMALE	1994-11-13 09:49:38.175482-05	21	Dau.in.Law	f	Married	12 Std	\N	f	t	f	605	f	f		\N	f	Home Maker	Local	f		0
2085	1	1	7	ER / 0001 / 217 / 5	Mursitha	FEMALE	2014-11-13 09:49:38.19453-05	1	G.Daugter	f	Single		\N	f	t	f	605	f	f		\N	f	Baby	Local	f		0
2086	1	1	7	ER / 0001 / 218 / 1	Mohamed Jafer	MALE	1971-11-13 09:49:38.212408-05	44	Father	t	Married	8 Std	\N	f	t	t	606	f	f		\N	f	Bag Shop	Local	f		0
2087	1	1	7	ER / 0001 / 218 / 2	Pousiya Begam	FEMALE	1973-11-13 09:49:38.227361-05	42	Mother	f	Married	8 Std	\N	f	t	t	606	f	f		\N	f	Home Maker	Local	f		0
2088	1	1	7	ER / 0001 / 218 / 3	Julbikar Ali	MALE	1997-11-13 09:49:38.245366-05	18	Son	f	Single	D.C.E	\N	f	t	f	606	f	f		\N	f	Student	Outstation	f		0
2089	1	1	7	ER / 0001 / 218 / 4	Mahamutha afrin	FEMALE	2002-11-13 09:49:38.26769-05	13	Daugter	f	Single	9 Std	\N	f	t	f	606	f	f		\N	f	Student	Local	f		0
2090	1	1	7	ER / 0001 / 219 / 1	Tajdeen	MALE	1979-11-13 09:49:38.290052-05	36	Father	t	Married	8 Std	\N	f	t	t	607	f	f		\N	f	Hotel	Local	f		0
2091	1	1	7	ER / 0001 / 219 / 2	Mubeena	FEMALE	1987-11-13 09:49:38.305299-05	28	Mother	f	Married	10 Std	\N	f	t	t	607	f	f		\N	f	No Job	Local	f		0
2092	1	1	7	ER / 0001 / 219 / 3	Huana Marliya	FEMALE	2004-11-13 09:49:38.327691-05	11	Daugter	f	Single	6 Std	\N	f	t	f	607	f	f		\N	f	Student	Local	f		0
2093	1	1	7	ER / 0001 / 219 / 4	Thahira Thasneem	FEMALE	2009-11-13 09:49:38.349918-05	6	Daugter	f	Single	1 Std	\N	f	t	f	607	f	f		\N	f	Student	Local	f		0
2094	1	1	7	ER / 0001 / 220 / 1	Mohamed Anwarudeen	MALE	1977-11-13 09:49:38.373451-05	38	Father	t	Married	8 Std	\N	f	t	t	608	f	f		\N	f	Sales Man	Outstation	f		0
2095	1	1	7	ER / 0001 / 220 / 2	Asarafunisha	FEMALE	1981-11-13 09:49:38.392752-05	34	Mother	f	Married	10 Std	\N	f	t	t	608	f	f		\N	f	No Job	Local	f		0
2096	1	1	7	ER / 0001 / 220 / 3	Aysha	FEMALE	2002-11-13 09:49:38.415803-05	13	Daugter	f	Single	7 Std	\N	f	t	f	608	f	f		\N	f	Student	Local	f		0
2097	1	1	7	ER / 0001 / 220 / 4	Nathira	FEMALE	2014-11-13 09:49:38.438605-05	1	Daugter	f	Single		\N	f	t	f	608	f	f		\N	f	Baby	Local	f		0
2098	1	1	7	ER / 0001 / 221 / 1	Nasrull	MALE	1975-11-13 09:49:38.456694-05	40	Father	t	Married	3 Std	\N	f	t	t	609	f	f		\N	f	Painter	Local	f		0
2099	1	1	7	ER / 0001 / 221 / 2	Usen Banu	FEMALE	1988-11-13 09:49:38.482439-05	27	Mother	f	Married	7 Std	\N	f	t	t	609	f	f		\N	f	Home Maker	Local	f		0
2100	1	1	7	ER / 0001 / 221 / 3	Rizwan	MALE	2009-11-13 09:49:38.505104-05	6	Son	f	Single	2 Std	\N	f	t	f	609	f	f		\N	f	Student	Local	f		0
2101	1	1	7	ER / 0001 / 222 / 1	Raja Mohamed	MALE	1938-11-13 09:49:38.527458-05	77	Father	t	Married	5 Std	\N	f	t	t	610	f	f		\N	f	Rest	Local	f		0
2102	1	1	7	ER / 0001 / 222 / 2	Jaibun Bee	FEMALE	1948-11-13 09:49:38.555275-05	67	Mother	f	Married		\N	f	t	t	610	f	f		\N	f	Home Maker	Local	f		0
2103	1	1	7	ER / 0001 / 222 / 3	Anwar Basha	MALE	1986-11-13 09:49:38.58476-05	29	Son	f	Married	ITI	\N	f	t	t	610	f	f		\N	f	Supraviser	Local	f		0
2104	1	1	7	ER / 0001 / 222 / 4	Rizwana	FEMALE	1987-11-13 09:49:38.628157-05	28	Dau.in.Law	f	Married	10 Std	\N	f	t	t	610	f	f		\N	f	Know Tailoring	Local	f		0
2105	1	1	7	ER / 0001 / 222 / 5	Umar Mukthar	MALE	2013-11-13 09:49:38.671624-05	2	G.Son	f	Single		\N	f	t	f	610	f	f		\N	f	Baby	Local	f		0
2106	1	1	7	ER / 0001 / 223 / 1	Nijamudeen	MALE	1975-11-13 09:49:38.711301-05	40	Father	t	Married	10 Std	\N	f	t	t	611	f	f		\N	f	Store  	Local	f		0
2107	1	1	7	ER / 0001 / 223 / 2	jahira Banu	FEMALE	1977-11-13 09:49:38.739567-05	38	Mother	f	Married	10 Std	\N	f	t	t	611	f	f		\N	f	Home Maker	Local	f		0
2108	1	1	7	ER / 0001 / 223 / 3	Mohamed Suhail	MALE	2002-11-13 09:49:38.782881-05	13	Son	f	Single	8 Std	\N	f	t	f	611	f	f		\N	f	Student	Local	f		0
2109	1	1	7	ER / 0001 / 223 / 4	Hasna Saba	FEMALE	2003-11-13 09:49:38.828034-05	12	Daugter	f	Single	7 Std	\N	f	t	f	611	f	f		\N	f	Student	Local	f		0
2110	1	1	7	ER / 0001 / 224 / 1	Mohamed Ibrahim	MALE	1963-11-13 09:49:38.873273-05	52	Father	t	Married	10 Std	\N	f	t	t	612	f	f		\N	f	Sikaret Labour	Local	f		0
2111	1	1	7	ER / 0001 / 224 / 2	Abitha Begam	FEMALE	1971-11-13 09:49:38.911641-05	44	Mother	f	Married	8 Std	\N	f	t	t	612	f	f		\N	f	Home Maker	Local	f		0
2112	1	1	7	ER / 0001 / 224 / 3	Mursitha	FEMALE	1992-11-13 09:49:38.947027-05	23	Daugter	f	Single	UG 	\N	f	t	t	612	f	f		\N	f	No Job	Local	f		0
2113	1	1	7	ER / 0001 / 224 / 4	Arshath	MALE	1998-11-13 09:49:39.000008-05	17	Son	f	Single	12 Std	\N	f	t	f	612	f	f		\N	f	Student	Local	f		0
2114	1	1	7	ER / 0001 / 225 / 1	Shahul Hameed	MALE	1952-11-13 09:49:39.054013-05	63	Father	t	Married	5 Std	\N	f	t	t	613	f	f		\N	f	Rest	Local	f		0
2115	1	1	7	ER / 0001 / 225 / 2	Najmunisha	FEMALE	1954-11-13 09:49:39.096791-05	61	Mother	f	Married		\N	f	t	t	613	f	f		\N	f	Home Maker	Local	f		0
2116	1	1	7	ER / 0001 / 225 / 3	Shajakan	MALE	1988-11-13 09:49:39.14219-05	27	Son	f	Married	10 Std	\N	f	t	t	613	f	f		\N	f	Bug Shop	Local	f		0
2117	1	1	7	ER / 0001 / 225 / 4	Aynul Marliya	FEMALE	1992-11-13 09:49:39.172079-05	23	Dau.in.Law	f	Married	10 Std	\N	f	t	t	613	f	f		\N	f	Home Maker	Local	f		0
2118	1	1	7	ER / 0001 / 225 / 5	Salika Fathima	FEMALE	2012-11-13 09:49:39.203267-05	3	G.Daugter	f	Single		\N	f	t	f	613	f	f		\N	f	Baby	Local	f		0
2119	1	1	7	ER / 0001 / 225 / 6	Mohamed Sufyan	MALE	2014-11-13 09:49:39.233897-05	1	G.Son	f	Single		\N	f	t	f	613	f	f		\N	f	Baby	Local	f		0
2120	1	1	7	ER / 0001 / 226 / 1	Rafiyudin	MALE	1966-11-13 09:49:39.265074-05	49	Father	t	Married	10 Std	\N	f	t	t	614	f	f		\N	f	Work In Shop	Local	f		0
2121	1	1	7	ER / 0001 / 226 / 2	Shajitha Banu	FEMALE	1978-11-13 09:49:39.307861-05	37	Mother	f	Married	8 Std	\N	f	t	t	614	f	f		\N	f	Fancy Store	Local	f		0
2122	1	1	7	ER / 0001 / 226 / 3	Mohamed Salman	MALE	1997-11-13 09:49:39.346017-05	18	Son	f	Single	B.tech	\N	f	t	f	614	f	f		\N	f	Student	Outstation	f		0
2123	1	1	7	ER / 0001 / 226 / 4	Nasila Parveen	FEMALE	2005-11-13 09:49:39.384188-05	10	Daugter	f	Single	5 Std	\N	f	t	f	614	f	f		\N	f	Student	Local	f		0
2124	1	1	7	ER / 0001 / 227 / 1	Maimun Bevi	FEMALE	1955-11-13 09:49:39.421445-05	60	Mother	t	Widow		\N	f	t	t	615	f	f		\N	f	Home Maker	Local	f		0
2125	1	1	7	ER / 0001 / 227 / 2	Sheik Dawood	MALE	1982-11-13 09:49:39.475536-05	33	Son	f	Married	4 Std	\N	f	t	t	615	f	f		\N	f	Driver	Local	f		0
2126	1	1	7	ER / 0001 / 227 / 3	Siraj Nisha	FEMALE	1987-11-13 09:49:39.509134-05	28	Dau.in.Law	f	Married	12 Std	\N	f	t	t	615	f	f		\N	f	Know Tailoring	Local	f		0
2127	1	1	7	ER / 0001 / 227 / 4	Asmath Begam	FEMALE	2005-11-13 09:49:39.575797-05	10	G.Daugter	f	Single	5 Std	\N	f	t	f	615	f	f		\N	f	Student	Local	f		0
2128	1	1	7	ER / 0001 / 227 / 5	Ameera	FEMALE	2012-11-13 09:49:39.642968-05	3	G.Daugter	f	Single	PKG	\N	f	t	f	615	f	f		\N	f	Student	Local	f		0
2129	1	1	7	ER / 0001 / 228 / 1	Imam Sha	MALE	1964-11-13 09:49:39.728086-05	51	Father	t	Married		\N	f	t	t	616	f	f		\N	f	Pical Business	Local	f		0
2130	1	1	7	ER / 0001 / 228 / 2	Jaibun Bee	FEMALE	1973-11-13 09:49:39.779067-05	42	Mother	f	Married		\N	f	t	t	616	f	f		\N	f	Home Maker	Local	f		0
2131	1	1	7	ER / 0001 / 228 / 3	Parveen	FEMALE	1989-11-13 09:49:39.83887-05	26	Daugter	f	Single	8 Std	\N	f	t	t	616	f	f		\N	f	No Job	Local	f		0
2132	1	1	7	ER / 0001 / 228 / 4	John Basha	MALE	1991-11-13 09:49:39.912244-05	24	Son	f	Single	8 Std	\N	f	t	t	616	f	f		\N	f	Tailoring	Local	f		0
2133	1	1	7	ER / 0001 / 228 / 5	Yasmeen	FEMALE	1992-11-13 09:49:39.974922-05	23	Daugter	f	Single	11 Std	\N	f	t	t	616	f	f		\N	f	No Job	Local	f		0
2134	1	1	7	ER / 0001 / 228 / 6	Mabu Basha	MALE	1995-11-13 09:49:40.069052-05	20	Son	f	Single	8 Std	\N	f	t	t	616	f	f		\N	f	Tailoring	Local	f		0
2135	1	1	7	ER / 0001 / 229 / 1	Syed Abdul Kader	MALE	1928-11-13 09:49:40.110415-05	87	Father	t	Married		\N	f	t	t	617	f	f		\N	f	No Job	Local	f		0
2136	1	1	7	ER / 0001 / 230 / 1	Abdul Munaf	MALE	1962-11-13 09:49:40.156527-05	53	Father	t	Married	UG 	\N	f	t	t	618	f	f		\N	f	Teacher	Outstation	f		0
2137	1	1	7	ER / 0001 / 230 / 2	Faritha 	FEMALE	1963-11-13 09:49:40.18572-05	52	Mother	f	Married	PG	\N	f	t	t	618	f	f		\N	f	Call Center	Local	f		0
2138	1	1	7	ER / 0001 / 231 / 1	Mubarak Ali	MALE	1983-11-13 09:49:40.209664-05	32	Father	t	Married	12 Std	\N	f	t	t	619	f	f		\N	f	Installment	Local	f		0
2139	1	1	7	ER / 0001 / 231 / 2	Julbitar Farhana	FEMALE	1993-11-13 09:49:40.229665-05	22	Mother	f	Married	12 Std	\N	f	t	t	619	f	f		\N	f	Home Maker	Local	f		0
2140	1	1	7	ER / 0001 / 231 / 3	Faritha 	FEMALE	1953-11-13 09:49:40.247974-05	62	G.Mother	f	Widow		\N	f	t	t	619	f	f		\N	f	Home Maker	Local	f		0
2141	1	1	7	ER / 0001 / 231 / 4	Afsaan	FEMALE	1992-11-13 09:49:40.275851-05	23	Daugter	f	Single		\N	f	t	t	619	f	f		\N	f		Local	f		0
2142	1	1	7	ER / 0001 / 232 / 1	Hidayathull	MALE	1930-11-13 09:49:40.294246-05	85	G.Father	t	Married		\N	f	t	f	620	f	f		\N	f	Rest	Local	f		0
2143	1	1	7	ER / 0001 / 232 / 2	Nagur Meeran	MALE	1980-11-13 09:49:40.309692-05	35	Son	f	Married	7 Std	\N	f	t	f	620	f	f		\N	f	Driver	Local	f		0
2144	1	1	7	ER / 0001 / 232 / 3	Noor Jahan	FEMALE	1987-11-13 09:49:40.328363-05	28	Dau.in.Law	f	Married	8 Std	\N	f	t	f	620	f	f		\N	f	Home Maker	Local	f		0
2145	1	1	7	ER / 0001 / 232 / 4	Nasira Begam	FEMALE	2002-11-13 09:49:40.346592-05	13	Daugter	f	Single	8 Std	\N	f	t	f	620	f	f		\N	f	Student	Local	f		0
2146	1	1	7	ER / 0001 / 232 / 5	Sameena	FEMALE	2005-11-13 09:49:40.369516-05	10	Daugter	f	Single	6 Std	\N	f	t	f	620	f	f		\N	f	Student	Local	f		0
2147	1	1	7	ER / 0001 / 233 / 1	Mohamed Ibrahim	MALE	1961-11-13 09:49:40.392477-05	54	Father	t	Married	9 Std	\N	f	t	t	621	f	f		\N	f	Furniture Shop	Local	f		0
2148	1	1	7	ER / 0001 / 233 / 2	Jafar Nisha	FEMALE	1970-11-13 09:49:40.419772-05	45	Mother	f	Married	6 Std	\N	f	t	t	621	f	f		\N	f	Home Maker	Local	f		0
2149	1	1	7	ER / 0001 / 233 / 3	Mohamed Ismail	MALE	1989-11-13 09:49:40.439015-05	26	Son	f	Married	10 Std	\N	f	t	t	621	f	f		\N	f	Benar Maker	Local	f		0
2150	1	1	7	ER / 0001 / 233 / 4	Parveen Begam	FEMALE	1995-11-13 09:49:40.458044-05	20	Dau.in.Law	f	Married		\N	f	t	t	621	f	f		\N	f	Home Maker	Local	f		0
2151	1	1	7	ER / 0001 / 233 / 5		FEMALE	2014-11-13 09:49:40.477741-05	1	G.Daugter	f	Single		\N	f	t	f	621	f	f		\N	f	Baby	Local	f		0
2152	1	1	7	ER / 0001 / 233 / 6	Mohamed idris	MALE	2001-11-13 09:49:40.496466-05	14	Son	f	Single	9 Std	\N	f	t	f	621	f	f		\N	f	Student	Local	f		0
2153	1	1	7	ER / 0001 / 234 / 1	Mohamed Sareef	MALE	1937-11-13 09:49:40.515949-05	78	Father	t	Married	3 Std	\N	f	t	t	622	f	f		\N	f	Rest	Local	f		0
2154	1	1	7	ER / 0001 / 234 / 2	Adam Kani	MALE	1972-11-13 09:49:40.542832-05	43	Son	f	Married	ITI	\N	f	t	t	622	f	f		\N	f	Engineer	Local	f		0
2155	1	1	7	ER / 0001 / 234 / 3	Parveen Begam	FEMALE	1976-11-13 09:49:40.56232-05	39	Dau.in.Law	f	Married	10 Std	\N	f	t	t	622	f	f		\N	f	Home Maker	Local	f		0
2156	1	1	7	ER / 0001 / 234 / 4	Afreen Nisha	FEMALE	2003-11-13 09:49:40.581493-05	12	G.Daugter	f	Single	6 Std	\N	f	t	f	622	f	f		\N	f	Student	Local	f		0
2157	1	1	7	ER / 0001 / 234 / 5	Mohamed Fayaz	MALE	2008-11-13 09:49:40.604797-05	7	G.Son	f	Single	2 Std	\N	f	t	f	622	f	f		\N	f	Student	Local	f		0
2158	1	1	7	ER / 0001 / 235 / 1	Jaleel Basha	MALE	1952-11-13 09:49:40.630255-05	63	Father	t	Married		\N	f	t	t	623	f	f		\N	f	Welder	Local	f		0
2159	1	1	7	ER / 0001 / 235 / 2	Shareefa	FEMALE	1965-11-13 09:49:40.646503-05	50	Mother	f	Married		\N	f	t	t	623	f	f		\N	f	Home Maker	Local	f		0
2160	1	1	7	ER / 0001 / 235 / 3	Rajita	FEMALE	1985-11-13 09:49:40.669262-05	30	Daugter	f	Devorced	B.tech	\N	f	t	t	623	f	f		\N	f	Teacher	Local	f		0
2161	1	1	7	ER / 0001 / 235 / 4	Shajakan	MALE	1984-11-13 09:49:40.697508-05	31	Son	f	Married	9 Std	\N	f	t	t	623	f	f		\N	f	Welder	Local	f		0
2162	1	1	7	ER / 0001 / 235 / 5	Almass	FEMALE	1995-11-13 09:49:40.71678-05	20	Dau.in.Law	f	Married	9 Std	\N	f	t	t	623	f	f		\N	f	Home Maker	Local	f		0
2163	1	1	7	ER / 0001 / 236 / 1	Syed Mustafa	MALE	1973-11-13 09:49:40.737689-05	42	Father	t	Married	5 Std	\N	f	t	t	624	f	f		\N	f	Shop	Local	f		0
2164	1	1	7	ER / 0001 / 236 / 2	Husaina	FEMALE	1977-11-13 09:49:40.753558-05	38	Mother	f	Married	6 Std	\N	f	t	t	624	f	f		\N	f	Home Maker	Local	f		0
2165	1	1	7	ER / 0001 / 236 / 3	Kathija	FEMALE	1998-11-13 09:49:40.772303-05	17	Daugter	f	Single	12 Std	\N	f	t	f	624	f	f		\N	f	Student	Local	f		0
2166	1	1	7	ER / 0001 / 236 / 4	Badusah	MALE	1996-11-13 09:49:40.795169-05	19	Son	f	Single	10 Std	\N	f	t	f	624	f	f		\N	f	Welder	Local	f		0
2167	1	1	7	ER / 0001 / 237 / 1	Thasthkir	MALE	1960-11-13 09:49:40.815328-05	55	Father	t	Married	3 Std	\N	f	t	t	625	f	f		\N	f	Cooli	Local	f		0
2168	1	1	7	ER / 0001 / 237 / 2	Maimun  	FEMALE	1966-11-13 09:49:40.83633-05	49	Mother	f	Married	5 Std	\N	f	t	t	625	f	f		\N	f	Home Maker	Local	f		0
2169	1	1	7	ER / 0001 / 237 / 3	Moideen	MALE	1925-11-13 09:49:40.864339-05	90	G.Father	f	Married		\N	f	t	t	625	f	f		\N	f	Rest	Local	f		0
2170	1	1	7	ER / 0001 / 238 / 1	Noor Mohamed	MALE	1953-11-13 09:49:40.894406-05	62	Father	t	Married	5 Std	\N	f	t	t	626	f	f		\N	f	Dress Business	Local	f		0
2171	1	1	7	ER / 0001 / 238 / 2	Jaibunisha	FEMALE	1957-11-13 09:49:40.919249-05	58	Mother	f	Married	2 Std	\N	f	t	t	626	f	f		\N	f	Home Maker	Local	f		0
2172	1	1	7	ER / 0001 / 239 / 1	Moideen Abdul Kadar	MALE	1978-11-13 09:49:40.947119-05	37	Husband	t	Married	9 Std	\N	f	t	t	627	f	f		\N	f	Dress Business	Local	f		0
2173	1	1	7	ER / 0001 / 239 / 2	Yasmeen	FEMALE	1993-11-13 09:49:40.963229-05	22	Wife	f	Married	10 Std	\N	f	t	t	627	f	f		\N	f	Know Tailoring	Local	f		0
2174	1	1	7	ER / 0001 / 239 / 3	Novsiya Banu	FEMALE	2011-11-13 09:49:40.986532-05	4	Daugter	f	Single	LKG	\N	f	t	f	627	f	f		\N	f	Student	Local	f		0
2175	1	1	7	ER / 0001 / 240 / 1	Sathik Basha	MALE	1980-11-13 09:49:41.010156-05	35	Husband	t	Married	D.M.E	\N	f	t	t	628	f	f		\N	f	Company Worker	Local	f		0
2176	1	1	7	ER / 0001 / 240 / 2	Sharbina Banu	FEMALE	1990-11-13 09:49:41.026281-05	25	Wife	f	Married	BCA	\N	f	t	t	628	f	f		\N	f	Teacher	Local	f		0
2177	1	1	7	ER / 0001 / 240 / 3	Sharook	MALE	2011-11-13 09:49:41.050324-05	4	Son	f	Single	UKG	\N	f	t	f	628	f	f		\N	f	Student	Local	f		0
2178	1	1	7	ER / 0001 / 241 / 1	Jabar	MALE	1980-11-13 09:49:41.076405-05	35	Husband	t	Married	10 Std	\N	f	t	t	629	f	f		\N	f	Machanic	Local	f		0
2179	1	1	7	ER / 0001 / 241 / 2	Jamila Banu	FEMALE	1987-11-13 09:49:41.098719-05	28	Wife	f	Married	6 Std	\N	f	t	t	629	f	f		\N	f	Know Tailoring	Local	f		0
2180	1	1	7	ER / 0001 / 241 / 3	Haseena	FEMALE	2005-11-13 09:49:41.127146-05	10	Daugter	f	Single	6 Std	\N	f	t	f	629	f	f		\N	f	Student	Local	f		0
2181	1	1	7	ER / 0001 / 241 / 4	Aslam	MALE	2007-11-13 09:49:41.15044-05	8	Son	f	Single	4 Std	\N	f	t	f	629	f	f		\N	f	Student	Local	f		0
2182	1	1	7	ER / 0001 / 242 / 1	kamaludin	MALE	1950-11-13 09:49:41.173047-05	65	Husband	t	Married	9 Std	\N	f	t	t	630	f	f		\N	f	Worker	Local	f		0
2183	1	1	7	ER / 0001 / 242 / 2	Jaibunnisha	FEMALE	1959-11-13 09:49:41.198951-05	56	Wife	f	Married	5 Std	\N	f	t	t	630	f	f		\N	f	Home Maker	Local	f		0
2184	1	1	7	ER / 0001 / 242 / 3	Basheer	MALE	1982-11-13 09:49:41.222117-05	33	Son	f	Married	9 Std	\N	f	t	t	630	f	f		\N	f	Dress Business	Local	f		0
2185	1	1	7	ER / 0001 / 242 / 4	Wajiha Banu	FEMALE	1990-11-13 09:49:41.24076-05	25	Dau.in.Law	f	Married	7 Std	\N	f	t	t	630	f	f		\N	f	Home Maker	Local	f		0
2186	1	1	7	ER / 0001 / 243 / 1	Mohamed Seat	MALE	1972-11-13 09:49:41.260514-05	43	Husband	t	Married	5 Std	\N	f	t	t	631	f	f		\N	f	Fish Shop	Local	f		0
2187	1	1	7	ER / 0001 / 243 / 2	Farijan	FEMALE	1975-11-13 09:49:41.280079-05	40	Wife	f	Married	5 Std	\N	f	t	t	631	f	f		\N	f	Home Maker	Local	f		0
2188	1	1	7	ER / 0001 / 243 / 3	Anees	MALE	1993-11-13 09:49:41.304241-05	22	Son	f	Married	12 Std	\N	f	t	t	631	f	f		\N	f	Painter	Local	f		0
2189	1	1	7	ER / 0001 / 243 / 4	Nijana	FEMALE	1995-11-13 09:49:41.323271-05	20	Dau.in.Law	f	Married	12 Std	\N	f	t	t	631	f	f		\N	f	Home Maker	Local	f		0
2190	1	1	7	ER / 0001 / 243 / 5	Hajira	FEMALE	1996-11-13 09:49:41.341918-05	19	Daugter	f	Single	12 Std	\N	f	t	t	631	f	f		\N	f	Rest	Local	f		0
2191	1	1	7	ER / 0001 / 244 / 1	Munavar	MALE	1977-11-13 09:49:41.360319-05	38	Husband	t	Married	5 Std	\N	f	t	t	632	f	f		\N	f	Driver	Local	f		0
2192	1	1	7	ER / 0001 / 244 / 2	Rahamathnnisa	FEMALE	1983-11-13 09:49:41.384323-05	32	Wife	f	Married	7 Std	\N	f	t	t	632	f	f		\N	f	Home Maker	Local	f		0
2193	1	1	7	ER / 0001 / 244 / 3	Kathija	FEMALE	2009-11-13 09:49:41.404244-05	6	Daugter	f	Single	3 Std	\N	f	t	f	632	f	f		\N	f	Student	Local	f		0
2194	1	1	7	ER / 0001 / 245 / 1	Mumthaj	FEMALE	1965-11-13 09:49:41.428125-05	50	Mother	t	Widow		\N	f	t	t	633	f	f		\N	f	Home Maker	Local	f		0
2195	1	1	7	ER / 0001 / 245 / 2	Raja Moideen	MALE	1983-11-13 09:49:41.457005-05	32	Son	f	Married	9 Std	\N	f	t	t	633	f	f		\N	f	Cooli	Local	f		0
2196	1	1	7	ER / 0001 / 245 / 3	Wajiha Banu	FEMALE	1990-11-13 09:49:41.476397-05	25	Dau.in.Law	f	Married	5 Std	\N	f	t	t	633	f	f		\N	f	Home Maker	Local	f		0
2197	1	1	7	ER / 0001 / 245 / 4	Sheik Ali	MALE	2014-11-13 09:49:41.495731-05	1	G.Son	f	Single		\N	f	t	f	633	f	f		\N	f	Baby	Local	f		0
2198	1	1	7	ER / 0001 / 246 / 1	Nagur Kani	MALE	1982-11-13 09:49:41.515141-05	33	Husband	t	Married	8 Std	\N	f	t	t	634	f	f		\N	f	Oil Shop	Local	f		0
2199	1	1	7	ER / 0001 / 246 / 2	Mumthaj	FEMALE	1985-11-13 09:49:41.530749-05	30	Wife	f	Married		\N	f	t	t	634	f	f		\N	f	Home Maker	Local	f		0
2200	1	1	7	ER / 0001 / 246 / 3	Syed	MALE	2008-11-13 09:49:41.550031-05	7	Son	f	Single	1 Std	\N	f	t	f	634	f	f		\N	f	Student	Local	f		0
2201	1	1	7	ER / 0001 / 247 / 1	Soukath Ali	MALE	1963-11-13 09:49:41.573483-05	52	Husband	t	Married	9 Std	\N	f	t	t	635	f	f		\N	f	Cooli	Local	f		0
2202	1	1	7	ER / 0001 / 247 / 2	Thilsath	FEMALE	1973-11-13 09:49:41.593998-05	42	Wife	f	Married	5 Std	\N	f	t	t	635	f	f		\N	f	Home Maker	Local	f		0
2203	1	1	7	ER / 0001 / 247 / 3	Syed Abbas	MALE	1996-11-13 09:49:41.614104-05	19	Son	f	Single	UG 	\N	f	t	f	635	f	f		\N	f	Student	Local	f		0
2204	1	1	7	ER / 0001 / 248 / 1	Saithani Bevi	FEMALE	1945-11-13 09:49:41.637521-05	70	Mother	t	Widow		\N	f	t	t	636	f	f		\N	f	Rest	Local	f		0
2205	1	1	7	ER / 0001 / 248 / 2	Mohamed Shareef	MALE	1965-11-13 09:49:41.666474-05	50	Son	f	Married	7 Std	\N	f	t	t	636	f	f		\N	f	Government Work	Local	f		0
2206	1	1	7	ER / 0001 / 248 / 3	Jakirunnisha	FEMALE	1973-11-13 09:49:41.685649-05	42	Dau.in.Law	f	Married	5 Std	\N	f	t	t	636	f	f		\N	f	Home Maker	Local	f		0
2207	1	1	7	ER / 0001 / 248 / 4	Jamsitha	FEMALE	1995-11-13 09:49:41.704833-05	20	G.Daugter	f	Single	ECE	\N	f	t	f	636	f	f		\N	f	Student	Local	f		0
2208	1	1	7	ER / 0001 / 248 / 5	Mohamed Umar	MALE	2001-11-13 09:49:41.728048-05	14	G.Son	f	Single	9 Std	\N	f	t	f	636	f	f		\N	f	Student	Local	f		0
2209	1	1	7	ER / 0001 / 249 / 1	Mohamed Farook	MALE	1980-11-13 09:49:41.752937-05	35	Husband	t	Married	6 Std	\N	f	t	t	637	f	f		\N	f	Machanic	Local	f		0
2210	1	1	7	ER / 0001 / 249 / 2	Shameem Nisha	FEMALE	1985-11-13 09:49:41.769127-05	30	Wife	f	Married	8 Std	\N	f	t	t	637	f	f		\N	f	Home Maker	Local	f		0
2211	1	1	7	ER / 0001 / 249 / 3	Farves	MALE	2000-11-13 09:49:41.790327-05	15	Son	f	Single	10 Std	\N	f	t	f	637	f	f		\N	f	Student	Local	f		0
2212	1	1	7	ER / 0001 / 249 / 4	Mohamed Fareed	MALE	2002-11-13 09:49:41.814596-05	13	Son	f	Single	8 Std	\N	f	t	f	637	f	f		\N	f	Student	Local	f		0
2213	1	1	7	ER / 0001 / 250 / 1	Sabeer Ahmed	MALE	1984-11-13 09:49:41.837911-05	31	Husband	t	Married	10 Std	\N	f	t	t	638	f	f		\N	f	Fancy Store	Local	f		0
2214	1	1	7	ER / 0001 / 250 / 2	Beevi John	FEMALE	1988-11-13 09:49:41.854074-05	27	Wife	f	Married	10 Std	\N	f	t	t	638	f	f		\N	f	Know Tailoring	Local	f		0
2215	1	1	7	ER / 0001 / 250 / 3	Shamiha Fathima	FEMALE	2012-11-13 09:49:41.877521-05	3	Daugter	f	Single		\N	f	t	f	638	f	f		\N	f	Baby	Local	f		0
2216	1	1	7	ER / 0001 / 251 / 1	Basheer Ahmed	MALE	1967-11-13 09:49:41.896077-05	48	Husband	t	Married	5 Std	\N	f	t	t	639	f	f		\N	f	Sikaret Labour	Local	f		0
2217	1	1	7	ER / 0001 / 251 / 2	Barakath Nisha	FEMALE	1977-11-13 09:49:41.921256-05	38	Wife	f	Married	5 Std	\N	f	t	t	639	f	f		\N	f	Home Maker	Local	f		0
2218	1	1	7	ER / 0001 / 251 / 3	Muhasira	FEMALE	1998-11-13 09:49:41.939783-05	17	Daugter	f	Single	UG 	\N	f	t	f	639	f	f		\N	f	Student	Local	f		0
2219	1	1	7	ER / 0001 / 251 / 4	Jabar	MALE	1999-11-13 09:49:41.963147-05	16	Son	f	Single	Alim	\N	f	t	f	639	f	f		\N	f	Student	Local	f		0
2220	1	1	7	ER / 0001 / 252 / 1	Raja Mohamed	MALE	1976-11-13 09:49:41.987673-05	39	Husband	t	Married	3 Std	\N	f	t	t	640	f	f		\N	f	Lorry Work Shop	Local	f		0
2221	1	1	7	ER / 0001 / 252 / 2	Amira	FEMALE	1987-11-13 09:49:42.009743-05	28	Wife	f	Married	10 Std	\N	f	t	t	640	f	f		\N	f	Home Maker	Local	f		0
2222	1	1	7	ER / 0001 / 252 / 3	Afreen Nisha	FEMALE	2002-11-13 09:49:42.029203-05	13	Daugter	f	Single		\N	f	t	f	640	f	f		\N	f	No Job	Local	f		0
2223	1	1	7	ER / 0001 / 252 / 4	Haseena	FEMALE	2004-11-13 09:49:42.057983-05	11	Daugter	f	Single	7 Std	\N	f	t	f	640	f	f		\N	f	Student	Local	f		0
2224	1	1	7	ER / 0001 / 253 / 1	Javid	MALE	1986-11-13 09:49:42.079814-05	29	Husband	t	Married	8 Std	\N	f	t	t	641	f	f		\N	f	Tailoring Labour	Local	f		0
2225	1	1	7	ER / 0001 / 253 / 2	Shanuja	FEMALE	1988-11-13 09:49:42.100287-05	27	Wife	f	Married	8 Std	\N	f	t	t	641	f	f		\N	f	Tailoring	Local	f		0
2226	1	1	7	ER / 0001 / 253 / 3	Mohamed Arif	MALE	2007-11-13 09:49:42.118944-05	8	Son	f	Single	3 Std	\N	f	t	f	641	f	f		\N	f	Student	Local	f		0
2227	1	1	7	ER / 0001 / 253 / 4	Mohamed Akil	MALE	2010-11-13 09:49:42.137335-05	5	Son	f	Single	2 Std	\N	f	t	f	641	f	f		\N	f	Student	Local	f		0
2228	1	1	7	ER / 0001 / 253 / 5	Mohamed Adhil	MALE	2013-11-13 09:49:42.15559-05	2	Son	f	Single		\N	f	t	f	641	f	f		\N	f	Baby	Local	f		0
2229	1	1	7	ER / 0001 / 254 / 1	Rahamathull	MALE	1955-11-13 09:49:42.174014-05	60	Father	t	Married	10 Std	\N	f	t	t	642	f	f		\N	f	Rest	Local	f		0
2230	1	1	7	ER / 0001 / 254 / 2	Kathija	FEMALE	1965-11-13 09:49:42.19881-05	50	Mother	f	Married	10 Std	\N	f	t	t	642	f	f		\N	f	Home Maker	Local	f		0
2231	1	1	7	ER / 0001 / 254 / 3	Ashik Ali	MALE	1981-11-13 09:49:42.221805-05	34	Son	f	Married	10 Std	\N	f	t	t	642	f	f		\N	f	Bag Shop	Local	f		0
2232	1	1	7	ER / 0001 / 254 / 4	Thaslima	FEMALE	1990-11-13 09:49:42.240618-05	25	Dau.in.Law	f	Married	8 Std	\N	f	t	t	642	f	f		\N	f	Teacher Training	Local	f		0
2233	1	1	7	ER / 0001 / 254 / 5	Sathik Ali	MALE	1983-11-13 09:49:42.260007-05	32	Son	f	Married	10 Std	\N	f	t	t	642	f	f		\N	f	Fancy Store	Local	f		0
2234	1	1	7	ER / 0001 / 254 / 6	Bagumitha Bevi	FEMALE	1992-11-13 09:49:42.284414-05	23	Dau.in.Law	f	Married	8 Std	\N	f	t	t	642	f	f		\N	f	Home Maker	Local	f		0
2235	1	1	7	ER / 0001 / 254 / 7	Asmara Parveen	FEMALE	2013-11-13 09:49:42.302618-05	2	G.Daugter	f	Single		\N	f	t	f	642	f	f		\N	f	Baby	Local	f		0
2236	1	1	7	ER / 0001 / 254 / 8	Afrose Begam	FEMALE	2013-11-13 09:49:42.32079-05	2	G.Daugter	f	Single		\N	f	t	f	642	f	f		\N	f	Baby	Local	f		0
2237	1	1	7	ER / 0001 / 254 / 9	Siddiq Ali	MALE	1985-11-13 09:49:42.369646-05	30	Son	f	Married	8 Std	\N	f	t	t	642	f	f		\N	f	Sales Man	Local	f		0
2238	1	1	7	ER / 0001 / 254 / 10	Firthos	FEMALE	1994-11-13 09:49:42.387768-05	21	Dau.in.Law	f	Married	10 Std	\N	f	t	t	642	f	f		\N	f	Home Maker	Local	f		0
2239	1	1	7	ER / 0001 / 255 / 1	Abubakar Siddiq	MALE	1973-11-13 09:49:42.405316-05	42	Father	t	Married	8 Std	\N	f	t	t	643	f	f		\N	f	Machanic	Local	f		0
2240	1	1	7	ER / 0001 / 255 / 2	Najmunisha	FEMALE	1981-11-13 09:49:42.429684-05	34	Mother	f	Married	12 Std	\N	f	t	t	643	f	f		\N	f	Typing	Local	f		0
2241	1	1	7	ER / 0001 / 255 / 3	Sofiya	FEMALE	2012-11-13 09:49:42.45185-05	3	Daugter	f	Single		\N	f	t	f	643	f	f		\N	f	Baby	Local	f		0
2242	1	1	7	ER / 0001 / 256 / 1	Syed Musthafa	MALE	1975-11-13 09:49:42.469481-05	40	Father	t	Married	PG	\N	f	t	t	644	f	f		\N	f	Manajer	Local	f		0
2243	1	1	7	ER / 0001 / 256 / 2	Shakila Banu	FEMALE	1981-11-13 09:49:42.484545-05	34	Mother	f	Married	UG 	\N	f	t	t	644	f	f		\N	f	Company Worker	Local	f		0
2244	1	1	7	ER / 0001 / 257 / 1	Salim	MALE	1963-11-13 09:49:42.50858-05	52	Husband	t	Married	5 Std	\N	f	t	t	645	f	f		\N	f	TVS Company Labour	Local	f		0
2245	1	1	7	ER / 0001 / 257 / 2	Naseem Sulthana	FEMALE	1972-11-13 09:49:42.528181-05	43	Wife	f	Married	12 Std	\N	f	t	t	645	f	f		\N	f	Bill Work	Local	f		0
2246	1	1	7	ER / 0001 / 257 / 3	Mohamed Jamir	MALE	1996-11-13 09:49:42.553075-05	19	Son	f	Married	Dipiomo	\N	f	t	t	645	f	f		\N	f	Work At Sipcot	Local	f		0
2247	1	1	7	ER / 0001 / 258 / 1	Azath	MALE	1974-11-13 09:49:42.575853-05	41	Father	t	Married	10 Std	\N	f	t	t	646	f	f		\N	f	Shop	Local	f		0
2248	1	1	7	ER / 0001 / 258 / 2	Sabika	FEMALE	1975-11-13 09:49:42.595107-05	40	Mother	f	Married	UG 	\N	f	t	t	646	f	f		\N	f	Teacher	Local	f		0
2249	1	1	7	ER / 0001 / 258 / 3	Seema Siddiqa	FEMALE	2000-11-13 09:49:42.613345-05	15	Daugter	f	Single	10 Std	\N	f	t	f	646	f	f		\N	f	Student	Local	f		0
2250	1	1	7	ER / 0001 / 258 / 4	Seeba Siddiqa	FEMALE	2007-11-13 09:49:42.635279-05	8	Daugter	f	Single	4 Std	\N	f	t	f	646	f	f		\N	f	Student	Local	f		0
2251	1	1	7	ER / 0001 / 258 / 5	Shahul Hameed	MALE	1945-11-13 09:49:42.657616-05	70	G.Father	f	Married		\N	f	t	t	646	f	f		\N	f	Rest	Local	f		0
2252	1	1	7	ER / 0001 / 259 / 1	Mubarak Ali	MALE	1981-11-13 09:49:42.684863-05	34	Father	t	Married	7 Std	\N	f	t	t	647	f	f		\N	f	Lorry Macanic	Local	f		0
2253	1	1	7	ER / 0001 / 259 / 2	Shakila Banu	FEMALE	1981-11-13 09:49:42.706529-05	34	Mother	f	Married	10 Std	\N	f	t	t	647	f	f		\N	f	Home Maker	Local	f		0
2254	1	1	7	ER / 0001 / 259 / 3	Syed Asif	MALE	2008-11-13 09:49:42.724081-05	7	Son	f	Single	3 Std	\N	f	t	f	647	f	f		\N	f	Student	Local	f		0
2255	1	1	7	ER / 0001 / 259 / 4	Syed Akmal	MALE	2010-11-13 09:49:42.746148-05	5	Son	f	Single	1 Std	\N	f	t	f	647	f	f		\N	f	Student	Local	f		0
2256	1	1	7	ER / 0001 / 260 / 1	Syed Ali	MALE	1976-11-13 09:49:42.76812-05	39	Father	t	Married	5 Std	\N	f	t	t	648	f	f		\N	f	Cooli	Local	f		0
2257	1	1	7	ER / 0001 / 260 / 2	Sharmila	FEMALE	1983-11-13 09:49:42.783631-05	32	Mother	f	Married	10 Std	\N	f	t	t	648	f	f		\N	f	Know Tailoring	Local	f		0
2258	1	1	7	ER / 0001 / 260 / 3	Syed Yasin	MALE	2003-11-13 09:49:42.805561-05	12	Son	f	Single	7 Std	\N	f	t	f	648	f	f		\N	f	Student	Local	f		0
2259	1	1	7	ER / 0001 / 260 / 4	Syed Fazil	MALE	2004-11-13 09:49:42.827807-05	11	Son	f	Single	6 Std	\N	f	t	f	648	f	f		\N	f	Student	Local	f		0
2260	1	1	7	ER / 0001 / 261 / 1	Shahul Hameed	MALE	1981-11-13 09:49:42.850503-05	34	Husband	t	Married	10 Std	\N	f	t	t	649	f	f		\N	f	Cooli	Local	f		0
2261	1	1	7	ER / 0001 / 261 / 2	Haseena	FEMALE	1986-11-13 09:49:42.870573-05	29	Wife	f	Married	6 Std	\N	f	t	t	649	f	f		\N	f	Know Tailoring	Local	f		0
2262	1	1	7	ER / 0001 / 261 / 3	Vuhana	FEMALE	2009-11-13 09:49:42.893214-05	6	Daugter	f	Single	1 Std	\N	f	t	f	649	f	f		\N	f	Student	Local	f		0
2263	1	1	7	ER / 0001 / 262 / 1	Mohamed Husain	MALE	1975-11-13 09:49:42.916092-05	40	Father	t	Married	8 Std	\N	f	t	t	650	f	f		\N	f	Installment	Local	f		0
2264	1	1	7	ER / 0001 / 262 / 2	farisa Begam	FEMALE	1986-11-13 09:49:42.940645-05	29	Mother	f	Married	10 Std	\N	f	t	t	650	f	f		\N	f	Know Tailoring	Local	f		0
2265	1	1	7	ER / 0001 / 262 / 3	Pavmitha Fathima	FEMALE	2005-11-13 09:49:42.963073-05	10	Daugter	f	Single	6 Std	\N	f	t	f	650	f	f		\N	f	Student	Local	f		0
2266	1	1	7	ER / 0001 / 262 / 4	Mohamed Farhaan	MALE	2009-11-13 09:49:42.986323-05	6	Son	f	Single	1 Std	\N	f	t	f	650	f	f		\N	f	Student	Local	f		0
2267	1	1	7	ER / 0001 / 263 / 1	Syed Musthafa	MALE	1969-11-13 09:49:43.009784-05	46	Husband	t	Married	8 Std	\N	f	t	t	651	f	f		\N	f	Driver	Local	f		0
2268	1	1	7	ER / 0001 / 263 / 2	Juharamma	FEMALE	1945-11-13 09:49:43.034054-05	70	G.Mother	f	Married		\N	f	t	t	651	f	f		\N	f	Rest	Local	f		0
2269	1	1	7	ER / 0001 / 263 / 3	Kairu Nisha	FEMALE	1977-11-13 09:49:43.060937-05	38	Daugter	f	Single	5 Std	\N	f	t	t	651	f	f		\N	f	No Job	Local	f		0
2270	1	1	7	ER / 0001 / 263 / 4	Bathrun Nisha	FEMALE	1980-11-13 09:49:43.085718-05	35	Daugter	f	Single	5 Std	\N	f	t	t	651	f	f		\N	f	Company Worker	Local	f		0
2271	1	1	7	ER / 0001 / 264 / 1	Mohamed Ali	MALE	1969-11-13 09:49:43.126963-05	46	Husband	t	Married	4 Std	\N	f	t	t	652	f	f		\N	f	Steel Worker	Local	f		0
2272	1	1	7	ER / 0001 / 264 / 2	Kathija	FEMALE	1977-11-13 09:49:43.163356-05	38	Wife	f	Married	10 Std	\N	f	t	t	652	f	f		\N	f	Home Maker	Local	f		0
2273	1	1	7	ER / 0001 / 265 / 1	Mohamed Basha	MALE	1965-11-13 09:49:43.201309-05	50	Husband	t	Married	7 Std	\N	f	t	t	653	f	f		\N	f	Store Work	Local	f		0
2274	1	1	7	ER / 0001 / 265 / 2	sakila Begam	FEMALE	1973-11-13 09:49:43.237914-05	42	Wife	f	Married	7 Std	\N	f	t	t	653	f	f		\N	f	Home Maker	Local	f		0
2275	1	1	7	ER / 0001 / 265 / 3	parveen	FEMALE	1991-11-13 09:49:43.281948-05	24	Daugter	f	Single	6 Std	\N	f	t	f	653	f	f		\N	f	No Job	Local	f		0
2276	1	1	7	ER / 0001 / 265 / 4	Yasar Ali	MALE	1992-11-13 09:49:43.324734-05	23	Son	f	Single	6 Std	\N	f	t	f	653	f	f		\N	f	Non-Weg Shoper	Local	f		0
2277	1	1	7	ER / 0001 / 266 / 1	abdul Rahim	MALE	1970-11-13 09:49:43.358155-05	45	Father	t	Married	2 Std	\N	f	t	t	654	f	f		\N	f	Sweet Business	Local	f		0
2278	1	1	7	ER / 0001 / 266 / 2	Parveen Banu	FEMALE	1980-11-13 09:49:43.394866-05	35	Mother	f	Married	5 Std	\N	f	t	t	654	f	f		\N	f	Home Maker	Local	f		0
2279	1	1	7	ER / 0001 / 266 / 3	Jesima Banu	FEMALE	2001-11-13 09:49:43.428552-05	14	Daugter	f	Single	9 Std	\N	f	t	f	654	f	f		\N	f	Student	Local	f		0
2280	1	1	7	ER / 0001 / 266 / 4	Nasima Banu	FEMALE	2001-11-13 09:49:43.461949-05	14	Daugter	f	Single	9 Std	\N	f	t	f	654	f	f		\N	f	Student	Local	f		0
2281	1	1	7	ER / 0001 / 266 / 5	Mohamed Habeeb	MALE	2006-11-13 09:49:43.495673-05	9	Son	f	Single	4 Std	\N	f	t	f	654	f	f		\N	f	Student	Local	f		0
2282	1	1	7	ER / 0001 / 267 / 1	Nisar Ahmed	MALE	1967-11-13 09:49:43.532519-05	48	Husband	t	Married		\N	f	t	t	655	f	f		\N	f	Sales Man	Local	f		0
2283	1	1	7	ER / 0001 / 267 / 2	Fathima John	FEMALE	1969-11-13 09:49:43.561571-05	46	Wife	f	Married	5 Std	\N	f	t	t	655	f	f		\N	f	Home Maker	Local	f		0
2284	1	1	7	ER / 0001 / 267 / 3	Mujibu Nisha	FEMALE	1996-11-13 09:49:43.60189-05	19	Daugter	f	Single	UG 	\N	f	t	t	655	f	f		\N	f	Dis Continue	Local	f		0
2285	1	1	7	ER / 0001 / 268 / 1	Sirajudeen	MALE	1979-11-13 09:49:43.647036-05	36	Husband	t	Married	5 Std	\N	f	t	t	656	f	f		\N	f	Tailoring	Local	f		0
2286	1	1	7	ER / 0001 / 268 / 2	Baby	FEMALE	1983-11-13 09:49:43.671655-05	32	Wife	f	Married	7 Std	\N	f	t	t	656	f	f		\N	f	Home Maker	Local	f		0
2287	1	1	7	ER / 0001 / 268 / 3	Mohamed Althaf	MALE	2005-11-13 09:49:43.701551-05	10	Son	f	Single	4 Std	\N	f	t	f	656	f	f		\N	f	Student	Local	f		0
2288	1	1	7	ER / 0001 / 268 / 4	Fathima	FEMALE	2008-11-13 09:49:43.738605-05	7	Daugter	f	Aged Unmarried Woman	3 Std	\N	f	t	f	656	f	f		\N	f	Student	Local	f		0
2289	1	1	7	ER / 0001 / 269 / 1	Syed Musthafa	MALE	1969-11-13 09:49:43.776162-05	46	Husband	t	Married	ECE	\N	f	t	t	657	f	f		\N	f	Pancher Shop	Local	f		0
2290	1	1	7	ER / 0001 / 269 / 2	rashya Banu	FEMALE	1983-11-13 09:49:43.808565-05	32	Wife	f	Married	2 Std	\N	f	t	t	657	f	f		\N	f	Home Maker	Local	f		0
2291	1	1	7	ER / 0001 / 269 / 3	Albiya Sabana	FEMALE	2006-11-13 09:49:43.846016-05	9	Daugter	f	Single	5 Std	\N	f	t	f	657	f	f		\N	f	Student	Local	f		0
2292	1	1	7	ER / 0001 / 270 / 1	Kadar Moideen	MALE	1947-11-13 09:49:43.883313-05	68	Father	t	Married		\N	f	t	t	658	f	f		\N	f	Pancher Shop	Local	f		0
2293	1	1	7	ER / 0001 / 270 / 2	Mahabu Nisha	FEMALE	1955-11-13 09:49:43.915413-05	60	Mother	f	Married		\N	f	t	t	658	f	f		\N	f	Home Maker	Local	f		0
2294	1	1	7	ER / 0001 / 270 / 3	Fairose Begam	FEMALE	1983-11-13 09:49:43.952302-05	32	G.Daugter	f	Devorced	10 Std	\N	f	t	t	658	f	f		\N	f	Tailoring	Local	f		0
2295	1	1	7	ER / 0001 / 270 / 4	Thasneem Fathima	FEMALE	2008-11-13 09:49:43.997594-05	7	G.Daugter	f	Single	2 Std	\N	f	t	f	658	f	f		\N	f	Student	Local	f		0
2296	1	1	7	ER / 0001 / 271 / 1	Sheik Dawood	MALE	1957-11-13 09:49:44.036086-05	58	Father	t	Married	3 Std	\N	f	t	t	659	f	f		\N	f	Cooli	Local	f		0
2297	1	1	7	ER / 0001 / 271 / 2	Rajiya Begam	FEMALE	1991-11-13 09:49:44.068531-05	24	Daugter	f	Devorced	7 Std	\N	f	t	t	659	f	f		\N	f	Company Worker	Local	f		0
2298	1	1	7	ER / 0001 / 272 / 1	Akbar Ali	MALE	1952-11-13 09:49:44.113642-05	63	Husband	t	Married	8 Std	\N	f	t	t	660	f	f		\N	f	Frurit Shop	Local	f		0
2299	1	1	7	ER / 0001 / 272 / 2	Safiya	FEMALE	1965-11-13 09:49:44.14664-05	50	Wife	f	Married	4 Std	\N	f	t	t	660	f	f		\N	f	Home Maker	Local	f		0
2300	1	1	7	ER / 0001 / 272 / 3	Mohamed Yasin	MALE	1984-11-13 09:49:44.184048-05	31	Son	f	Married	10 Std	\N	f	t	t	660	f	f		\N	f	Company Worker	Local	f		0
2301	1	1	7	ER / 0001 / 272 / 4	Jainul Arab	FEMALE	1989-11-13 09:49:44.214471-05	26	Dau.in.Law	f	Married	12 Std	\N	f	t	t	660	f	f		\N	f	Teacher	Local	f		0
2302	1	1	7	ER / 0001 / 272 / 5	Rahman	MALE	1988-11-13 09:49:44.245408-05	27	Brother	f	Single	6 Std	\N	f	t	t	660	f	f		\N	f	Company Worker	Local	f		0
2303	1	1	7	ER / 0001 / 272 / 6	Aysa Wahima	FEMALE	2014-11-13 09:49:44.276204-05	1	G.Daugter	f	Single		\N	f	t	f	660	f	f		\N	f	Baby	Local	f		0
2304	1	1	7	ER / 0001 / 273 / 1	Kathija Bevi	FEMALE	1955-11-13 09:49:44.306278-05	60	Mother	t	Devorced		\N	f	t	t	661	f	f		\N	f	Home Maker	Local	f		0
2305	1	1	7	ER / 0001 / 274 / 1	Syed Mohamed	MALE	1975-11-13 09:49:44.345761-05	40	Father	t	Married	10 Std	\N	f	t	t	662	f	f		\N	f	Government Work	Local	f		0
2306	1	1	7	ER / 0001 / 274 / 2	Fathima Bevi	FEMALE	1979-11-13 09:49:44.378868-05	36	Mother	f	Married	12 Std	\N	f	t	t	662	f	f		\N	f	Home Maker	Local	f		0
2307	1	1	7	ER / 0001 / 274 / 3	Riyaz Mohamed	MALE	2002-11-13 09:49:44.407991-05	13	Son	f	Single	7 Std	\N	f	t	f	662	f	f		\N	f	Student	Local	f		0
2308	1	1	7	ER / 0001 / 274 / 4	Jesima  	FEMALE	2008-11-13 09:49:44.446667-05	7	Daugter	f	Single	2 Std	\N	f	t	f	662	f	f		\N	f	Student	Local	f		0
2309	1	1	7	ER / 0001 / 275 / 1	Govse Moideen	MALE	1960-11-13 09:49:44.486069-05	55	Husband	t	Married	3 Std	\N	f	t	t	663	f	f		\N	f	Cooli	Local	f		0
2310	1	1	7	ER / 0001 / 275 / 2	Fathima Bevi	FEMALE	1975-11-13 09:49:44.519887-05	40	Wife	f	Married		\N	f	t	t	663	f	f		\N	f	Home Maker	Local	f		0
2311	1	1	7	ER / 0001 / 275 / 3	Mohamed Ali	MALE	1997-11-13 09:49:44.551709-05	18	Son	f	Single	7 Std	\N	f	t	t	663	f	f		\N	f	Driver	Local	f		0
2312	1	1	7	ER / 0001 / 275 / 4	Mouziya Banu	FEMALE	1990-11-13 09:49:44.582536-05	25	Daugter	f	Single	10 Std	\N	f	t	t	663	f	f		\N	f	No Job	Local	f		0
2313	1	1	7	ER / 0001 / 275 / 5	Samira Banu	FEMALE	1997-11-13 09:49:44.627257-05	18	Daugter	f	Single	9 Std	\N	f	t	t	663	f	f		\N	f	Dress  Shoper	Local	f		0
2314	1	1	7	ER / 0001 / 276 / 1	Habeebullah	MALE	1981-11-13 09:49:44.66355-05	34	Husband	t	Married	5 Std	\N	f	t	t	664	f	f		\N	f	Cooli	Local	f		0
2315	1	1	7	ER / 0001 / 276 / 2	Mehabub	FEMALE	1990-11-13 09:49:44.695504-05	25	Wife	f	Married	4 Std	\N	f	t	t	664	f	f		\N	f	Home Maker	Local	f		0
2316	1	1	7	ER / 0001 / 276 / 3	Abdul Salam	MALE	2004-11-13 09:49:44.732404-05	11	Son	f	Single	7 Std	\N	f	t	f	664	f	f		\N	f	Student	Local	f		0
2317	1	1	7	ER / 0001 / 276 / 4	Almass	FEMALE	2005-11-13 09:49:44.775646-05	10	Daugter	f	Single	6 Std	\N	f	t	f	664	f	f		\N	f	Student	Local	f		0
2318	1	1	7	ER / 0001 / 277 / 1	alla Baji	MALE	1972-11-13 09:49:44.820465-05	43	Husband	t	Married	12 Std	\N	f	t	t	665	f	f		\N	f	Watch Man	Local	f		0
2319	1	1	7	ER / 0001 / 277 / 2	Shakila  	FEMALE	1975-11-13 09:49:44.849607-05	40	Wife	f	Married		\N	f	t	t	665	f	f		\N	f	Home Maker	Local	f		0
2320	1	1	7	ER / 0001 / 277 / 3	Iraab	MALE	1999-11-13 09:49:44.884519-05	16	Son	f	Single	12 Std	\N	f	t	f	665	f	f		\N	f	Student	Local	f		0
2321	1	1	7	ER / 0001 / 278 / 1	Syed Ismail	MALE	1965-11-13 09:49:44.929566-05	50	Husband	t	Married	5 Std	\N	f	t	t	666	f	f		\N	f	Rest	Local	f		0
2322	1	1	7	ER / 0001 / 278 / 2	Asiya Banu	FEMALE	1973-11-13 09:49:44.970832-05	42	Wife	f	Married	5 Std	\N	f	t	t	666	f	f		\N	f	Home Maker	Local	f		0
2323	1	1	7	ER / 0001 / 278 / 3	Abuthahir	MALE	1995-11-13 09:49:45.018304-05	20	Son	f	Single	UG 	\N	f	t	t	666	f	f		\N	f	No Job	Local	f		0
2324	1	1	7	ER / 0001 / 279 / 1	Raja Mohamed	MALE	1983-11-13 09:49:45.072249-05	32	Husband	t	Married	7 Std	\N	f	t	t	667	f	f		\N	f	Driver	Local	f		0
2325	1	1	7	ER / 0001 / 279 / 2	Sahar Banu	FEMALE	1985-11-13 09:49:45.103926-05	30	Wife	f	Married	8 Std	\N	f	t	t	667	f	f		\N	f	Know Tailoring	Local	f		0
2326	1	1	7	ER / 0001 / 279 / 3	Samira Fathima	FEMALE	2003-11-13 09:49:45.149514-05	12	Daugter	f	Single	6 Std	\N	f	t	f	667	f	f		\N	f	Student	Local	f		0
2327	1	1	7	ER / 0001 / 279 / 4	Alavudeen	MALE	2008-11-13 09:49:45.185899-05	7	Son	f	Single	2 Std	\N	f	t	f	667	f	f		\N	f	Student	Local	f		0
2328	1	1	7	ER / 0001 / 279 / 5	Mohamed Khan	MALE	1957-11-13 09:49:45.223123-05	58	Father	f	Married		\N	f	t	t	667	f	f		\N	f	Driver	Local	f		0
2329	1	1	7	ER / 0001 / 280 / 1	John Basheer	MALE	1969-11-13 09:49:45.260152-05	46	Husband	t	Married	7 Std	\N	f	t	t	668	f	f		\N	f	Driver	Local	f		0
2330	1	1	7	ER / 0001 / 280 / 2	Samsath	FEMALE	1978-11-13 09:49:45.29883-05	37	Wife	f	Married	11 Std	\N	f	t	t	668	f	f		\N	f	Home Maker	Local	f		0
2331	1	1	7	ER / 0001 / 280 / 3	Suhena	FEMALE	1998-11-13 09:49:45.334454-05	17	Daugter	f	Single	12 Std	\N	f	t	f	668	f	f		\N	f	Student	Local	f		0
2332	1	1	7	ER / 0001 / 280 / 4	Farvees	MALE	2001-11-13 09:49:45.37872-05	14	Son	f	Single	9 Std	\N	f	t	f	668	f	f		\N	f	Student	Local	f		0
2333	1	1	7	ER / 0001 / 281 / 1	Mohamed Rasool	MALE	1981-11-13 09:49:45.420277-05	34	Father	t	Married	5 Std	\N	f	t	t	669	f	f		\N	f	Auto Driver	Local	f		0
2334	1	1	7	ER / 0001 / 281 / 2	Sharmila Banu	FEMALE	1987-11-13 09:49:45.450536-05	28	Mother	f	Married	7 Std	\N	f	t	t	669	f	f		\N	f	Home Maker	Local	f		0
2335	1	1	7	ER / 0001 / 281 / 3	Shakitha Banu	FEMALE	2002-11-13 09:49:45.487669-05	13	Daugter	f	Single	8 Std	\N	f	t	f	669	f	f		\N	f	Student	Local	f		0
2336	1	1	7	ER / 0001 / 281 / 4	Sarfudin	MALE	2004-11-13 09:49:45.533912-05	11	Son	f	Single	6 Std	\N	f	t	f	669	f	f		\N	f	Student	Local	f		0
2337	1	1	7	ER / 0001 / 281 / 5	Sajina Banu	FEMALE	2006-11-13 09:49:45.57792-05	9	Daugter	f	Single	4 Std	\N	f	t	f	669	f	f		\N	f	Student	Local	f		0
2338	1	1	7	ER / 0001 / 281 / 6	Faritha Begam	FEMALE	1997-11-13 09:49:45.622044-05	18	Daugter	f	Single	UG 	\N	f	t	f	669	f	f		\N	f	Student	Local	f		0
2339	1	1	7	ER / 0001 / 282 / 1	Abitha Begam	FEMALE	1951-11-13 09:49:45.657209-05	64	Mother	t	Widow	11 Std	\N	f	t	t	670	f	f		\N	f	Home Maker	Local	f		0
2340	1	1	7	ER / 0001 / 282 / 2	Sajan Sulthan	MALE	1976-11-13 09:49:45.698579-05	39	Son	f	Married	UG 	\N	f	t	t	670	f	f		\N	f	Company Worker	Local	f		0
2341	1	1	7	ER / 0001 / 282 / 3	Barakath Nisha	FEMALE	1983-11-13 09:49:45.737004-05	32	Dau.in.Law	f	Married	10 Std	\N	f	t	t	670	f	f		\N	f	Know Tailoring	Local	f		0
2342	1	1	7	ER / 0001 / 282 / 4	Salik Sulthan	MALE	2003-11-13 09:49:45.772529-05	12	G.Son	f	Single	7 Std	\N	f	t	f	670	f	f		\N	f	Student	Local	f		0
2343	1	1	7	ER / 0001 / 282 / 5	Afiya	FEMALE	2009-11-13 09:49:45.816431-05	6	G.Daugter	f	Single	1 Std	\N	f	t	f	670	f	f		\N	f	Student	Local	f		0
2344	1	1	7	ER / 0001 / 283 / 1	Liyakath Ali	MALE	1955-11-13 09:49:45.860284-05	60	Father	t	Married	5 Std	\N	f	t	t	671	f	f		\N	f	Security	Local	f		0
2345	1	1	7	ER / 0001 / 283 / 2	Shakila	FEMALE	1965-11-13 09:49:45.907717-05	50	Mother	f	Married	8 Std	\N	f	t	t	671	f	f		\N	f	Home Maker	Local	f		0
2346	1	1	7	ER / 0001 / 283 / 3	Ummul Fazila	FEMALE	1997-11-13 09:49:45.942406-05	18	Daugter	f	Single	11 Std	\N	f	t	f	671	f	f		\N	f	Student	Local	f		0
2347	1	1	7	ER / 0001 / 284 / 1	Abu Thahir	MALE	1985-11-13 09:49:45.984452-05	30	Father	t	Married	10 Std	\N	f	t	t	672	f	f		\N	f	Security	Local	f		0
2348	1	1	7	ER / 0001 / 284 / 2	Naseeba	FEMALE	1988-11-13 09:49:46.013994-05	27	Mother	f	Married	12 Std	\N	f	t	t	672	f	f		\N	f	Home Maker	Local	f		0
2349	1	1	7	ER / 0001 / 284 / 3	Thamina	FEMALE	2010-11-13 09:49:46.050468-05	5	Daugter	f	Single	LKG	\N	f	t	f	672	f	f		\N	f	Student	Local	f		0
2350	1	1	7	ER / 0001 / 285 / 1	Kadar Husain	MALE	1983-11-13 09:49:46.103512-05	32	Father	t	Married	6 Std	\N	f	t	t	673	f	f		\N	f	Biriyani Shop	Local	f		0
2351	1	1	7	ER / 0001 / 285 / 2	Fathima Bevi	FEMALE	1987-11-13 09:49:46.13319-05	28	Mother	f	Married	8 Std	\N	f	t	t	673	f	f		\N	f	Home Maker	Local	f		0
2352	1	1	7	ER / 0001 / 285 / 3	Ashik 	MALE	2010-11-13 09:49:46.168327-05	5	Son	f	Single	LKG	\N	f	t	f	673	f	f		\N	f	Student	Local	f		0
2353	1	1	7	ER / 0001 / 286 / 1	Alavudeen	MALE	1965-11-13 09:49:46.205982-05	50	Father	t	Married	6 Std	\N	f	t	t	674	f	f		\N	f	Paku Business	Local	f		0
2354	1	1	7	ER / 0001 / 286 / 2	Siddiqa	FEMALE	1970-11-13 09:49:46.245757-05	45	Mother	f	Married	5 Std	\N	f	t	t	674	f	f		\N	f	Work House	Local	f		0
2355	1	1	7	ER / 0001 / 286 / 3	Sara	FEMALE	1995-11-13 09:49:46.291377-05	20	Daugter	f	Single	B.tech	\N	f	t	t	674	f	f		\N	f	No Job	Local	f		0
2356	1	1	7	ER / 0001 / 286 / 4	Saburama	FEMALE	1995-11-13 09:49:46.344752-05	20	Daugter	f	Single	12 Std	\N	f	t	t	674	f	f		\N	f	Narse	Local	f		0
2357	1	1	7	ER / 0001 / 287 / 1	Mohamed Rahamath	MALE	1978-11-13 09:49:46.389363-05	37	Father	t	Married	9 Std	\N	f	t	t	675	f	f		\N	f	Shop work	Local	f		0
2358	1	1	7	ER / 0001 / 287 / 2	Jarina Banu	FEMALE	1987-11-13 09:49:46.418854-05	28	Mother	f	Married	5 Std	\N	f	t	t	675	f	f		\N	f	Store Work	Local	f		0
2359	1	1	7	ER / 0001 / 287 / 3	Siddiqa	FEMALE	2011-11-13 09:49:46.453442-05	4	Daugter	f	Single	UKG	\N	f	t	f	675	f	f		\N	f	Student	Local	f		0
2360	1	1	7	ER / 0001 / 287 / 4	Shibana	FEMALE	2012-11-13 09:49:46.49754-05	3	Daugter	f	Single	PKG	\N	f	t	f	675	f	f		\N	f	Student	Local	f		0
2361	1	1	7	ER / 0001 / 288 / 1	Syed Musthafa	MALE	1976-11-13 09:49:46.541377-05	39	Father	t	Married	5 Std	\N	f	t	t	676	f	f		\N	f	Machanic	Local	f		0
2362	1	1	7	ER / 0001 / 288 / 2	Parveen	FEMALE	1979-11-13 09:49:46.579393-05	36	Mother	f	Married	6 Std	\N	f	t	t	676	f	f		\N	f	Tailoring	Local	f		0
2363	1	1	7	ER / 0001 / 288 / 3	Maimun	FEMALE	1996-11-13 09:49:46.607306-05	19	Daugter	f	Single	UG 	\N	f	t	f	676	f	f		\N	f	Student	Local	f		0
2364	1	1	7	ER / 0001 / 289 / 1	Abdul Azees	MALE	1971-11-13 09:49:46.642195-05	44	Father	t	Married	10 Std	\N	f	t	t	677	f	f		\N	f	Electrical	Local	f		0
2365	1	1	7	ER / 0001 / 289 / 2	Mansoora Begam	FEMALE	1977-11-13 09:49:46.67371-05	38	Mother	f	Married	6 Std	\N	f	t	t	677	f	f		\N	f	Tailoring	Local	f		0
2366	1	1	7	ER / 0001 / 289 / 3	Imran	MALE	1996-11-13 09:49:46.70175-05	19	Son	f	Single	UG 	\N	f	t	t	677	f	f		\N	f	Student	Local	f		0
2367	1	1	7	ER / 0001 / 289 / 4	Ilyas	MALE	1997-11-13 09:49:46.737371-05	18	Son	f	Single	DME	\N	f	t	f	677	f	f		\N	f	Student	Local	f		0
2368	1	1	7	ER / 0001 / 290 / 1	Syed	MALE	1983-11-13 09:49:46.77304-05	32	Father	t	Married	4 Std	\N	f	t	t	678	f	f		\N	f	Car Machanic	Local	f		0
2369	1	1	7	ER / 0001 / 290 / 2	Sharmila	FEMALE	1989-11-13 09:49:46.796044-05	26	Mother	f	Married	12 Std	\N	f	t	t	678	f	f		\N	f	Know Tailoring	Local	f		0
2370	1	1	7	ER / 0001 / 290 / 3	Azeeba	FEMALE	2010-11-13 09:49:46.830134-05	5	Daugter	f	Single	1 Std	\N	f	t	f	678	f	f		\N	f	Student	Local	f		0
2371	1	1	7	ER / 0001 / 290 / 4	Asmitha	FEMALE	2012-11-13 09:49:46.861353-05	3	Daugter	f	Single		\N	f	t	f	678	f	f		\N	f	Baby	Local	f		0
2372	1	1	7	ER / 0001 / 291 / 1	Abdul Kalam	MALE	1973-11-13 09:49:46.893176-05	42	Father	t	Married	9 Std	\N	f	t	t	679	f	f		\N	f	Car Machanic	Local	f		0
2373	1	1	7	ER / 0001 / 291 / 2	Jannathul Nisha	FEMALE	1983-11-13 09:49:46.924827-05	32	Mother	f	Married	8 Std	\N	f	t	t	679	f	f		\N	f	Tailoring	Local	f		0
2374	1	1	7	ER / 0001 / 291 / 3	jasmeen	FEMALE	2005-11-13 09:49:46.953005-05	10	Daugter	f	Single	4 Std	\N	f	t	f	679	f	f		\N	f	Student	Local	f		0
2375	1	1	7	ER / 0001 / 292 / 1	Abdul Navas	MALE	1980-11-13 09:49:46.986962-05	35	Father	t	Married	10 Std	\N	f	t	t	680	f	f		\N	f	Frurit Shop	Local	f		0
2376	1	1	7	ER / 0001 / 292 / 2	Jarina Banu	FEMALE	1985-11-13 09:49:47.009997-05	30	Mother	f	Married	UG 	\N	f	t	t	680	f	f		\N	f	Home Maker	Local	f		0
2377	1	1	7	ER / 0001 / 292 / 3	Mohamed Adhil	MALE	2009-11-13 09:49:47.037888-05	6	Son	f	Single	1 Std	\N	f	t	f	680	f	f		\N	f	Student	Local	f		0
2378	1	1	7	ER / 0001 / 292 / 4	Mohamed Anees	MALE	2013-11-13 09:49:47.065863-05	2	Son	f	Single		\N	f	t	f	680	f	f		\N	f	Baby	Local	f		0
2379	1	1	7	ER / 0001 / 293 / 1	Mohamed Sathik	MALE	1979-11-13 09:49:47.095823-05	36	Father	t	Married	6 Std	\N	f	t	t	681	f	f		\N	f	Painter	Local	f		0
2380	1	1	7	ER / 0001 / 293 / 2	Sharmila	FEMALE	1982-11-13 09:49:47.120925-05	33	Mother	f	Married	6 Std	\N	f	t	t	681	f	f		\N	f	Home Maker	Local	f		0
2381	1	1	7	ER / 0001 / 293 / 3	Suhail	MALE	2002-11-13 09:49:47.144129-05	13	Son	f	Single	8 Std	\N	f	t	f	681	f	f		\N	f	Student	Local	f		0
2382	1	1	7	ER / 0001 / 293 / 4	Benasir	FEMALE	2005-11-13 09:49:47.172934-05	10	Daugter	f	Single	5 Std	\N	f	t	f	681	f	f		\N	f	Student	Local	f		0
2383	1	1	7	ER / 0001 / 294 / 1	Syed Musthafa	MALE	1969-11-13 09:49:47.201293-05	46	Father	t	Married	8 Std	\N	f	t	t	682	f	f		\N	f	Tailoring	Local	f		0
2384	1	1	7	ER / 0001 / 294 / 2	Shamila Banu	FEMALE	1973-11-13 09:49:47.220158-05	42	Mother	f	Married	ECE	\N	f	t	t	682	f	f		\N	f	Pancher Shop	Local	f		0
2385	1	1	7	ER / 0001 / 294 / 3	Rahman	MALE	1994-11-13 09:49:47.242918-05	21	Son	f	Single	DME	\N	f	t	t	682	f	f		\N	f	Mill Job	Local	f		0
2386	1	1	7	ER / 0001 / 294 / 4	Abul Hasan	MALE	1998-11-13 09:49:47.276511-05	17	Son	f	Single	DME	\N	f	t	f	682	f	f		\N	f	Student	Local	f		0
2387	1	1	7	ER / 0001 / 295 / 1	Sirajdeen	MALE	1998-11-13 09:49:47.310969-05	17		t	Single		\N	f	t	f	683	f	f		\N	f		Local	f		0
2388	1	1	7	ER / 0001 / 556 / 1	S.M.A.Salam Saibu	MALE	1927-10-08 01:00:00-05	88	Family Head	t	Married	10	\N	f	t	t	684	f	f		\N	f	.H.R	Local	f		0
2389	1	1	7	ER / 0001 / 556 / 2	S.Jaipoon	FEMALE	1946-10-08 01:00:00-05	69	Wife	f	Married		\N	f	t	t	684	f	f		\N	f	H.W	Local	f		0
2390	1	1	7	ER / 0001 / 557 / 1	Mammutha.M	FEMALE	1973-10-08 01:00:00-04	42	Family Head	t	Married	10	\N	f	t	t	685	f	f		\N	f	Labour	Local	f		0
2391	1	1	7	ER / 0001 / 557 / 2	Azarudeen.M	MALE	1998-10-08 01:00:00-04	17	Son	f	Single	IT	\N	f	t	f	685	f	f		\N	f	Sreching Job	Local	f		0
2392	1	1	7	ER / 0001 / 557 / 3	Sajeena.M	FEMALE	2000-10-08 01:00:00-04	15	Doughter	f	Single	11	\N	f	t	f	685	f	f		\N	f	Student	Local	t	Interest in Aalim/Hifz	0
2393	1	1	7	ER / 0001 / 558 / 1	A.Syed Hussain	MALE	1974-10-08 01:00:00-04	41	Family Head	t	Married	5	\N	f	t	t	686	f	f		\N	f	Labour	Local	f		0
2394	1	1	7	ER / 0001 / 558 / 2	S.Najira	FEMALE	1976-10-08 01:00:00-04	39	Wife	f	Married	5	\N	f	t	t	686	f	f		\N	f	H.W	Local	f		0
2395	1	1	7	ER / 0001 / 558 / 3	S.Rashma	FEMALE	2000-10-08 01:00:00-04	15	Doughter	f	Single	7	\N	f	t	f	686	f	f		\N	f	Student	Local	f		0
2396	1	1	7	ER / 0001 / 558 / 4	S.Imran	MALE	2001-10-08 01:00:00-04	14	Son	f	Single	8	\N	f	t	f	686	f	f		\N	f	Student	Local	f		0
2397	1	1	7	ER / 0001 / 559 / 1	Fathima.A	FEMALE	1960-10-08 01:00:00-04	55	Family Head	t	Widow	7	\N	f	t	t	687	f	f		\N	f	Rold Gold Jewell Sales At home	Local	f		0
2398	1	1	7	ER / 0001 / 560 / 1	Tasthageer.A	MALE	1971-10-08 01:00:00-04	44	Family Head	t	Married	4	\N	f	t	t	688	f	f		\N	f	Labour	Local	f		0
2399	1	1	7	ER / 0001 / 560 / 2	Hadeer Beeve.T	FEMALE	1972-10-08 01:00:00-04	43	Wife	f	Married	6	\N	f	t	t	688	f	f		\N	f	Labour	Local	f		0
2400	1	1	7	ER / 0001 / 560 / 3	Aasha.T	FEMALE	2009-10-08 01:00:00-04	6	Doughter	f	Single	1	\N	f	t	f	688	f	f		\N	f	Student	Local	f		0
2423	1	1	7	ER / 0001 / 569 / 4	R.Sarbudeen	MALE	2013-10-08 01:00:00-04	2	Son	f	Single		\N	f	t	f	697	f	f		\N	f		Local	f		0
2424	1	1	7	ER / 0001 / 570 / 1	Sheik Abdul Kadher	MALE	1976-10-08 01:00:00-04	39	Family Head	t	Married	3	\N	f	t	t	698	f	f		\N	f	Hotel supplyar	Local	f		0
2425	1	1	7	ER / 0001 / 570 / 2	Fathima	FEMALE	1979-10-08 01:00:00-04	36	Wife	f	Married		\N	f	t	t	698	f	f		\N	f	Labour	Local	f		0
2401	1	1	7	ER / 0001 / 561 / 		MALE	2014-10-08 01:00:00-04	1		f	Single		\N	f	t	f	689	f	f		\N	f		Local	f		0
2402	1	1	7	ER / 0001 / 562 / 1	Muhammed Rafi.S	MALE	1965-10-08 01:00:00-04	50	Family Head	t	Married	2	\N	f	t	f	690	f	f		\N	f	Sandai	Local	f		0
2403	1	1	7	ER / 0001 / 562 / 2	Famitha	MALE	2014-10-08 01:00:00-04	1		f	Single		\N	f	t	f	690	f	f		\N	f		Local	f		0
2404	1	1	7	ER / 0001 / 562 / 3	Saherabanu.m	FEMALE	1991-10-08 01:00:00-04	24	Doughter	f	Single	8	\N	f	t	f	690	f	f		\N	f		Local	f		0
2405	1	1	7	ER / 0001 / 563 / 1	Kaidunisha.A	FEMALE	1926-10-08 01:00:00-05	89	Family Head	t	Married		\N	f	t	f	691	f	f		\N	f		Local	f		0
2406	1	1	7	ER / 0001 / 563 / 2	Megurunesa.A	FEMALE	1960-10-08 01:00:00-04	55	Doughter	f	Married		\N	f	t	t	691	f	f		\N	f	Labour	Local	f		0
2407	1	1	7	ER / 0001 / 564 / 1	Fathima Beeve	FEMALE	1941-10-08 01:00:00-05	74	Family Head	t	Married	6	\N	f	t	t	692	f	f		\N	f		Local	f		0
2408	1	1	7	ER / 0001 / 565 / 1	A.Mubarak	MALE	1986-10-08 01:00:00-04	29	Family Head	t	Married	10	\N	f	t	t	693	f	f		\N	f	Driver	Local	f		0
2409	1	1	7	ER / 0001 / 565 / 2	M.Rabiya basheer	FEMALE	1990-10-08 01:00:00-04	25	Wife	f	Married	MSc	\N	f	t	t	693	f	f		\N	f	Ass.Professor	Local	f		0
2410	1	1	7	ER / 0001 / 565 / 3	M.Riyhan	MALE	2013-10-08 01:00:00-04	2	Son	f	Single		\N	f	t	f	693	f	f		\N	f		Local	f		0
2411	1	1	7	ER / 0001 / 566 / 1	Beerambeer	FEMALE	1939-10-08 01:00:00-05	76	Family Head	t	Widow		\N	f	t	t	694	f	f		\N	f	H.W	Local	f		0
2412	1	1	7	ER / 0001 / 567 / 1	A.Aboobakker	MALE	1954-10-08 01:00:00-05	61	Family Head	t	Married	2	\N	f	t	t	695	f	f		\N	f	Cooking Master	Local	f		0
2413	1	1	7	ER / 0001 / 567 / 2	A.Pasriyabanu	FEMALE	1976-10-08 01:00:00-04	39	Wife	f	Married	2	\N	f	t	t	695	f	f		\N	f	Labour	Local	f		0
2414	1	1	7	ER / 0001 / 567 / 3	A.Abdulvahab	MALE	1996-10-08 01:00:00-04	19	Son	f	Single	Diplomo	\N	f	t	f	695	f	f		\N	f	Student	Local	f		0
2415	1	1	7	ER / 0001 / 567 / 4	A.HaseenaBanu	FEMALE	2000-10-08 01:00:00-04	15	Doughter	f	Single	9	\N	f	t	f	695	f	f		\N	f	Student	Local	f		0
2416	1	1	7	ER / 0001 / 568 / 1	Muhammed Hussain.M	MALE	1976-10-08 01:00:00-04	39	Family Head	t	Married	2	\N	f	t	t	696	f	f		\N	f	Helper	Local	f		0
2417	1	1	7	ER / 0001 / 568 / 2	M.Subaidha	FEMALE	1985-10-08 01:00:00-04	30	Wife	f	Married	5	\N	f	t	t	696	f	f		\N	f	H.W	Local	f		0
2418	1	1	7	ER / 0001 / 568 / 3	M.Sulbiya	FEMALE	2003-10-08 01:00:00-04	12	Doughter	f	Single	6	\N	f	t	f	696	f	f		\N	f	Student	Local	f		0
2419	1	1	7	ER / 0001 / 568 / 4	M.Sujana	FEMALE	2004-10-08 01:00:00-04	11	Doughter	f	Single	5	\N	f	t	f	696	f	f		\N	f	Student	Local	f		0
2420	1	1	7	ER / 0001 / 569 / 1	B.Rafi	MALE	1987-10-08 01:00:00-04	28	Family Head	t	Married	3	\N	f	t	f	697	f	f		\N	f	Painter	Local	f		0
2421	1	1	7	ER / 0001 / 569 / 2	R.Nisha	FEMALE	1990-10-08 01:00:00-04	25	Wife	f	Married	6	\N	f	t	t	697	f	f		\N	f	H.W	Local	f		0
2422	1	1	7	ER / 0001 / 569 / 3	R.Samsudeen	MALE	2008-10-08 01:00:00-04	7	Son	f	Single	1	\N	f	t	f	697	f	f		\N	f	Student	Local	f		0
2426	1	1	7	ER / 0001 / 570 / 3	Muhammataras	MALE	2001-10-08 01:00:00-04	14	Son	f	Single	8	\N	f	t	f	698	f	f		\N	f	Student	Local	f		0
2427	1	1	7	ER / 0001 / 570 / 4	Muhammeth Ayisha	FEMALE	2002-10-08 01:00:00-04	13	Doughter	f	Single	7	\N	f	t	f	698	f	f		\N	f	Student	Local	f		0
2428	1	1	7	ER / 0001 / 570 / 5	Yaseen Ahamath	MALE	2003-10-08 01:00:00-04	12	Son	f	Single	6	\N	f	t	f	698	f	f		\N	f	Student	Local	f		0
2429	1	1	7	ER / 0001 / 571 / 1	N.Jazeer Hussain	MALE	1973-10-08 01:00:00-04	42	Family Head	t	Married	9	\N	f	t	t	699	f	f		\N	f	Labour	Local	f		0
2430	1	1	7	ER / 0001 / 571 / 2	J.Saleema	FEMALE	1976-10-08 01:00:00-04	39	Wife	f	Married	6	\N	f	t	t	699	f	f		\N	f	Labour	Local	f		0
2431	1	1	7	ER / 0001 / 571 / 3	Muhammed Jafer Sadeek	MALE	1994-10-08 01:00:00-04	21	Son	f	Single	10	\N	f	t	f	699	f	f		\N	f	Driver	Local	f		0
2432	1	1	7	ER / 0001 / 571 / 4	J.Mehatabbanu	FEMALE	1998-10-08 01:00:00-04	17	Doughter	f	Single	11	\N	f	t	f	699	f	f		\N	f	Student	Local	f		0
2433	1	1	7	ER / 0001 / 571 / 5	J.Yasar Arafath	MALE	2002-10-08 01:00:00-04	13	Son	f	Single	9	\N	f	t	f	699	f	f		\N	f	Student	Local	f		0
2434	1	1	7	ER / 0001 / 572 / 1	T.P.Abdul Saleem	MALE	1973-10-08 01:00:00-04	42	Family Head	t	Married	10	\N	f	t	f	700	f	f		\N	f	Labour	Local	f		0
2435	1	1	7	ER / 0001 / 572 / 2	A.Johara Abdul Saleem	FEMALE	1978-10-08 01:00:00-04	37	Wife	f	Married	10	\N	f	t	f	700	f	f		\N	f	H.W	Local	f		0
2436	1	1	7	ER / 0001 / 572 / 3	A.Hamaas Sulthan	FEMALE	2006-10-08 01:00:00-04	9	Doughter	f	Single	3	\N	f	t	f	700	f	f		\N	f	Student	Local	f		0
2437	1	1	7	ER / 0001 / 572 / 4	A.Rowla Sulthan	MALE	2010-10-08 01:00:00-04	5	Doughter	f	Single	L.KG	\N	f	t	f	700	f	f		\N	f	Student	Local	f		0
2438	1	1	7	ER / 0001 / 573 / 1	Kadher.T	MALE	1957-10-08 01:00:00-04	58	Family Head	t	Married	5	\N	f	t	t	701	f	f		\N	f	Driver	Local	f		0
2439	1	1	7	ER / 0001 / 573 / 2	Suguna Beeve.K	FEMALE	1961-10-08 01:00:00-04	54	Wife	f	Married	3	\N	f	t	t	701	f	f		\N	f	H.W	Local	f		0
2440	1	1	7	ER / 0001 / 574 / 1	Nagoor Mydeen.K	MALE	1976-10-08 01:00:00-04	39	Family Head	t	Married	10	\N	f	t	t	702	f	f		\N	f	Driver	Local	f		0
2441	1	1	7	ER / 0001 / 574 / 2	Rabeeyathtunisha.N	FEMALE	1982-10-08 01:00:00-04	33	Wife	f	Married	10	\N	f	t	t	702	f	f		\N	f	H.W	Local	f		0
2442	1	1	7	ER / 0001 / 574 / 3	Nauffal.N	MALE	2005-10-08 01:00:00-04	10	Son	f	Single	4	\N	f	t	f	702	f	f		\N	f	Student	Local	f		0
2443	1	1	7	ER / 0001 / 574 / 4	Saliha.N	FEMALE	2009-10-08 01:00:00-04	6	Doughter	f	Single	1	\N	f	t	f	702	f	f		\N	f	Student	Local	f		0
2444	1	1	7	ER / 0001 / 575 / 1	Jannathunisha.B	FEMALE	1973-10-08 01:00:00-04	42	Family Head	t	Devorced	2	\N	f	t	t	703	f	f		\N	f	Labour	Local	f		0
2445	1	1	7	ER / 0001 / 575 / 2	Sharmela Begum.B	FEMALE	1995-10-08 01:00:00-04	20	Doughter	f	Single	12	\N	f	t	t	703	f	f		\N	f	Tailor	Local	f		0
2446	1	1	7	ER / 0001 / 575 / 3	Aakeela Begum.B	FEMALE	1998-10-08 01:00:00-04	17	Doughter	f	Single	B.Com	\N	f	t	f	703	f	f		\N	f	Student	Local	f		0
2447	1	1	7	ER / 0001 / 576 / 1	Sarifa.M	FEMALE	1946-10-08 01:00:00-05	69	Family Head	t	Widow		\N	f	t	t	704	f	f		\N	f	H.W	Local	f		0
2448	1	1	7	ER / 0001 / 576 / 2	AbuSama.M	FEMALE	1979-10-08 01:00:00-04	36	Doughter	f	Married	5	\N	f	t	t	704	f	f		\N	f	Labour	Local	f		0
2449	1	1	7	ER / 0001 / 577 / 1	Mahaboob Jan.S	MALE	1964-10-08 01:00:00-04	51	Family Head	t	Married	6	\N	f	t	t	705	f	f		\N	f	Painter	Local	f		0
2450	1	1	7	ER / 0001 / 577 / 2	M.Dillshath	FEMALE	1974-10-08 01:00:00-04	41	Wife	f	Married	8	\N	f	t	t	705	f	f		\N	f	H.W	Local	f		0
2451	1	1	7	ER / 0001 / 577 / 3	Shakeerabanu	FEMALE	1995-10-08 01:00:00-04	20	Doughter	f	Single	Diplomo	\N	f	t	t	705	f	f		\N	f	Student	Local	f		0
2452	1	1	7	ER / 0001 / 577 / 4	Shabaanaa	FEMALE	2003-10-08 01:00:00-04	12	Doughter	f	Single	7	\N	f	t	f	705	f	f		\N	f	Student	Local	f		0
2453	1	1	7	ER / 0001 / 578 / 		MALE	2014-10-08 01:00:00-04	1		f	Single		\N	f	t	f	706	f	f		\N	f		Local	f		0
2454	1	1	7	ER / 0001 / 579 / 1	T.Tameem ulla	MALE	1979-10-08 01:00:00-04	36	Family Head	t	Married	10	\N	f	t	t	707	f	f		\N	f	Sticker Shop	Local	f		0
2455	1	1	7	ER / 0001 / 579 / 2	T.Aneesfathima	FEMALE	1982-10-08 01:00:00-04	33	Wife	f	Married	U.G (PSDCA)	\N	f	t	t	707	f	f		\N	f	H.W	Local	f		0
2456	1	1	7	ER / 0001 / 579 / 3	T.Muhamaduyunus	MALE	2006-10-08 01:00:00-04	9	Son	f	Single	3	\N	f	t	f	707	f	f		\N	f	Student	Local	f		0
2457	1	1	7	ER / 0001 / 579 / 4	T.Thabasum Taj	FEMALE	2009-10-08 01:00:00-04	6	Doughter	f	Single	U.KG	\N	f	t	f	707	f	f		\N	f	Student	Local	f		0
2458	1	1	7	ER / 0001 / 580 / 1	Jareena Bagum	FEMALE	1982-10-08 01:00:00-04	33	Family Head	t	Devorced	B.Com	\N	f	t	t	708	f	f		\N	f	Tailor	Local	f		0
2459	1	1	7	ER / 0001 / 580 / 2	Afreen Nisha	FEMALE	2006-10-08 01:00:00-04	9	Doughter	f	Single	3	\N	f	t	f	708	f	f		\N	f	Student	Local	f		0
2460	1	1	7	ER / 0001 / 581 / 1	Subakathulla.A	MALE	1979-10-08 01:00:00-04	36	Family Head	t	Married	8	\N	f	t	t	709	f	f		\N	f	Cutting Master	Local	f		0
2461	1	1	7	ER / 0001 / 581 / 2	Shakeerabanu.S	FEMALE	1985-10-08 01:00:00-04	30	Wife	f	Married	5	\N	f	t	t	709	f	f		\N	f	H.W	Local	f		0
2462	1	1	7	ER / 0001 / 581 / 3	Shameema.S	FEMALE	2001-10-08 01:00:00-04	14	Doughter	f	Single	9	\N	f	t	f	709	f	f		\N	f	Student	Local	f		0
2463	1	1	7	ER / 0001 / 581 / 4	Shajuna banu.S	FEMALE	2005-10-08 01:00:00-04	10	Doughter	f	Single	8	\N	f	t	f	709	f	f		\N	f	Student	Local	f		0
2464	1	1	7	ER / 0001 / 582 / 1	Syed barketh.S	MALE	1968-10-08 01:00:00-04	47	Family Head	t	Married	8	\N	f	t	t	710	f	f		\N	f	Labour	Local	f		0
2465	1	1	7	ER / 0001 / 582 / 2	Shanavas Banu	FEMALE	1983-10-08 01:00:00-04	32	Wife	f	Married	8	\N	f	t	t	710	f	f		\N	f	H.W	Local	f		0
2466	1	1	7	ER / 0001 / 582 / 3	Sakeeulla.S	MALE	2006-10-08 01:00:00-04	9	Son	f	Single	3	\N	f	t	f	710	f	f		\N	f	Student	Local	f		0
2467	1	1	7	ER / 0001 / 582 / 4	Salhasabeeha.S	FEMALE	2008-10-08 01:00:00-04	7	Doughter	f	Single	1	\N	f	t	f	710	f	f		\N	f	Student	Local	f		0
2468	1	1	7	ER / 0001 / 583 / 1	Abubakker Sideeq	MALE	1980-10-08 01:00:00-04	35	Family Head	t	Married	5	\N	f	t	t	711	f	f		\N	f	Labour	Local	f		0
2469	1	1	7	ER / 0001 / 583 / 2	Meharunesha	FEMALE	1985-10-08 01:00:00-04	30	Wife	f	Married	7	\N	f	t	t	711	f	f		\N	f	Labour	Local	f		0
2470	1	1	7	ER / 0001 / 583 / 3	Ayisha Mariyam	FEMALE	2005-10-08 01:00:00-04	10	Doughter	f	Single	5	\N	f	t	f	711	f	f		\N	f	Student	Local	f		0
2471	1	1	7	ER / 0001 / 583 / 4	Muhammed Ismail	MALE	2008-10-08 01:00:00-04	7	Son	f	Single	1	\N	f	t	f	711	f	f		\N	f	Student	Local	f		0
2472	1	1	7	ER / 0001 / 584 / 1	Jameela beeve	FEMALE	1951-10-08 01:00:00-05	64	Family Head	t	Married		\N	f	t	t	712	f	f		\N	f	H.W	Local	f		0
2473	1	1	7	ER / 0001 / 585 / 1	Beejan Bee	FEMALE	1959-10-08 01:00:00-04	56	Family Head	t	Married		\N	f	t	t	713	f	f		\N	f	Labour	Local	f		0
2474	1	1	7	ER / 0001 / 586 / 1	Muhammed ali zeenna	MALE	1954-10-08 01:00:00-05	61	Family Head	t	Married	5	\N	f	t	t	714	f	f		\N	f	OLD Box Sales	Local	f		0
2475	1	1	7	ER / 0001 / 586 / 2	Inayaththunisha	FEMALE	1961-10-08 01:00:00-04	54	Wife	f	Married	5	\N	f	t	t	714	f	f		\N	f	H.W	Local	f		0
2476	1	1	7	ER / 0001 / 587 / 		MALE	2014-10-08 01:00:00-04	1		f	Single		\N	f	t	f	715	f	f		\N	f		Local	f		0
2477	1	1	7	ER / 0001 / 588 / 1	Ameena Beeve	FEMALE	1939-10-08 01:00:00-05	76	Family Head	t	Widow		\N	f	t	t	716	f	f		\N	f	H.W	Local	f		0
2478	1	1	7	ER / 0001 / 588 / 2	Mahaboob Basha	MALE	1995-10-08 01:00:00-04	20	Grand Son	f	Single	9	\N	f	t	t	716	f	f		\N	f	Sticker Shop	Local	f		0
2479	1	1	7	ER / 0001 / 589 / 1	Mymoona beeve	FEMALE	1944-10-08 01:00:00-04	71	Family Head	t	Married		\N	f	t	t	717	f	f		\N	f	H.W	Local	f		0
2480	1	1	7	ER / 0001 / 589 / 2	Javageera	FEMALE	1972-10-08 01:00:00-04	43	Wife	f	Married	6	\N	f	t	t	717	f	f		\N	f	Labour	Local	f		0
2481	1	1	7	ER / 0001 / 589 / 3	Mujebull Rahuman	MALE	1968-10-08 01:00:00-04	47	.Son in law	f	Married	6	\N	f	t	f	717	f	f		\N	f	Two wheeler whater service	Local	f		0
2482	1	1	7	ER / 0001 / 589 / 4	Sameera	FEMALE	2006-10-08 01:00:00-04	9	Doughter	f	Single	3	\N	f	t	f	717	f	f		\N	f	Student	Local	f		0
2483	1	1	7	ER / 0001 / 486 / 1	S.Vaheetha Banu	FEMALE	1980-10-08 01:00:00-04	35	Family Head	t	Married	2	\N	f	t	t	718	f	f		\N	f	Labour	Local	f		0
2484	1	1	7	ER / 0001 / 486 / 2	S.Sadham Hussain	MALE	1998-10-08 01:00:00-04	17	Son	f	Single	12	\N	f	t	f	718	f	f		\N	f	Student	Local	f		0
2485	1	1	7	ER / 0001 / 486 / 3	S.Taj Nisha	FEMALE	1999-10-08 01:00:00-04	16	Daughter	f	Single	11	\N	f	t	f	718	f	f		\N	f	Student	Local	f		0
2486	1	1	7	ER / 0001 / 487 / 1	Fakrulla	MALE	1951-10-08 01:00:00-05	64	Family Head	t	Married	8	\N	f	t	t	719	f	f		\N	f	"""Tea Master"	Local	f		0
2487	1	1	7	ER / 0001 / 487 / 2	Vahidunisha	FEMALE	1954-10-08 01:00:00-05	61	Wife	f	Married	5	\N	f	t	t	719	f	f		\N	f	H.W	Local	f		0
2488	1	1	7	ER / 0001 / 487 / 3	B.Sheik Hussain	MALE	1988-10-08 01:00:00-04	27	Son	f	Single	12	\N	f	t	t	719	f	f		\N	f	Mobile Shop Salared	Local	f		0
2525	1	1	7	ER / 0001 / 504 / 1	Parveen Banu.K	FEMALE	1978-10-08 01:00:00-04	37	Family Head	t	Widow	5	\N	f	t	f	736	f	f		\N	f	Tailor	Local	f		0
2526	1	1	7	ER / 0001 / 504 / 2	Sabaraama.K	FEMALE	1999-10-08 01:00:00-04	16	Daughter	f	Single	11	\N	f	t	f	736	f	f		\N	f	Student	Local	f		0
2489	1	1	7	ER / 0001 / 488 / 		MALE	2014-10-08 01:00:00-04	1		f	Single		\N	f	t	f	720	f	f		\N	f		Local	f		0
2527	1	1	7	ER / 0001 / 504 / 3	Madeena.K	FEMALE	2001-10-08 01:00:00-04	14	Daughter	f	Single	10	\N	f	t	f	736	f	f		\N	f	Student	Local	f		0
2490	1	1	7	ER / 0001 / 489 / 		MALE	2014-10-08 01:00:00-04	1		f	Single		\N	f	t	f	721	f	f		\N	f		Local	f		0
2491	1	1	7	ER / 0001 / 490 / 1	Noor Jahan	FEMALE	1952-10-08 01:00:00-05	63	Family Head	t	Widow	5	\N	f	t	t	722	f	f		\N	f	H.W	Local	f		0
2492	1	1	7	ER / 0001 / 490 / 2	Muhammed Sadhakathtulla	MALE	1982-10-08 01:00:00-04	33	Son	f	Married	10	\N	f	t	t	722	f	f		\N	f	no job	Local	f		0
2493	1	1	7	ER / 0001 / 490 / 3	Aiyashamma	FEMALE	1984-10-08 01:00:00-04	31	.Daughter in law	f	Married	B.Tech	\N	f	t	t	722	f	f		\N	f	H.W	Local	f		0
2494	1	1	7	ER / 0001 / 490 / 4	MohammednYunus	MALE	2006-10-08 01:00:00-04	9	Grand Son	f	Single	3	\N	f	t	f	722	f	f		\N	f	Student	Local	f		0
2495	1	1	7	ER / 0001 / 490 / 5	Abubakker hafsha	FEMALE	2011-10-08 01:00:00-04	4	.Grand Daughter	f	Single	L.KG	\N	f	t	f	722	f	f		\N	f	Student	Local	f		0
2496	1	1	7	ER / 0001 / 491 / 1	Sagarban Beeve	FEMALE	1948-10-08 01:00:00-05	67	Family Head	t	Widow	3	\N	f	t	t	723	f	f		\N	f		Local	f		0
2497	1	1	7	ER / 0001 / 492 / 1	Sulaimaan.N.K	MALE	1945-10-08 01:00:00-05	70	Family Head	t	Married	5	\N	f	t	f	724	f	f		\N	f	Pon Sales	Local	f		0
2498	1	1	7	ER / 0001 / 492 / 2	Faridha Beagam.s	FEMALE	1956-10-08 01:00:00-04	59	Wife	f	Married	6	\N	f	t	f	724	f	f		\N	f	H.W	Local	f		0
2499	1	1	7	ER / 0001 / 493 / 1	Aasiya	FEMALE	1967-10-08 01:00:00-04	48	Family Head	t	Married	4	\N	f	t	t	725	f	f		\N	f	H.W	Local	f		0
2500	1	1	7	ER / 0001 / 493 / 2	Aarif Basha	MALE	1986-10-08 01:00:00-04	29	Son	f	Married	4	\N	f	t	t	725	f	f		\N	f		Local	f		0
2501	1	1	7	ER / 0001 / 493 / 3	Tharic Basha	MALE	1991-10-08 01:00:00-04	24	Son	f	Single	2	\N	f	t	t	725	f	f		\N	f	Labour	Local	f		0
2502	1	1	7	ER / 0001 / 494 / 1	Fathima Beeve	FEMALE	1959-10-08 01:00:00-04	56	Family Head	t	Widow	5	\N	f	t	t	726	f	f		\N	f	H.W	Local	f		0
2503	1	1	7	ER / 0001 / 495 / 1	Parveen Bagam	FEMALE	1984-10-08 01:00:00-04	31	Family Head	t	Widow		\N	f	t	t	727	f	f		\N	f	Labour	Local	f		0
2504	1	1	7	ER / 0001 / 495 / 2	Fayasdeen	MALE	2000-10-08 01:00:00-04	15	Son	f	Single	8	\N	f	t	f	727	f	f		\N	f	Student	Local	f		0
2505	1	1	7	ER / 0001 / 495 / 3	Rahuman	MALE	2006-10-08 01:00:00-04	9	Son	f	Single	4	\N	f	t	f	727	f	f		\N	f	Student	Local	f		0
2506	1	1	7	ER / 0001 / 496 / 1	Ibrahim	MALE	1949-10-08 01:00:00-05	66	Family Head	t	Married		\N	f	t	t	728	f	f		\N	f	Labour	Local	f		0
2507	1	1	7	ER / 0001 / 496 / 2	Noor Jahan	FEMALE	1954-10-08 01:00:00-05	61	Wife	f	Married		\N	f	t	t	728	f	f		\N	f	Labour	Local	f		0
2508	1	1	7	ER / 0001 / 496 / 3	Sumsath Baegam	FEMALE	1984-10-08 01:00:00-04	31	Daughter	f	Married	10	\N	f	t	t	728	f	f		\N	f		Local	f		0
2509	1	1	7	ER / 0001 / 497 / 1	J.Gowsara Baegam	FEMALE	1966-10-08 01:00:00-04	49	Family Head	t	Married	5	\N	f	t	t	729	f	f		\N	f	H.W	Local	f		0
2510	1	1	7	ER / 0001 / 497 / 2	J.Meharaj Nisha	FEMALE	1991-10-08 01:00:00-04	24	Daughter	f	Single	B.A	\N	f	t	t	729	f	f		\N	f	Net work job	Local	f		0
2511	1	1	7	ER / 0001 / 497 / 3	J.Sadeeq Basha	MALE	1993-10-08 01:00:00-04	22	Daughter	f	Single	B.Tech	\N	f	t	t	729	f	f		\N	f		Local	f		0
2512	1	1	7	ER / 0001 / 498 / 1	Sabeer Basha	MALE	1988-10-08 01:00:00-04	27	Family Head	t	Married	6	\N	f	t	t	730	f	f		\N	f	Labour	Local	f		0
2513	1	1	7	ER / 0001 / 498 / 2	S.Ayisha Amren	FEMALE	1992-10-08 01:00:00-04	23	Wife	f	Married	12	\N	f	t	t	730	f	f		\N	f	Tailor	Local	f		0
2514	1	1	7	ER / 0001 / 499 / 1	Mymoona Beeve	FEMALE	1956-10-08 01:00:00-04	59	Family Head	t	Widow	3	\N	f	t	t	731	f	f		\N	f	Labour	Local	f		0
2515	1	1	7	ER / 0001 / 500 / 1	Meharunisha.A	FEMALE	1967-10-08 01:00:00-04	48	Family Head	t	Widow		\N	f	t	t	732	f	f		\N	f	Labour	Local	f		0
2516	1	1	7	ER / 0001 / 501 / 1	Abdul Nazer.M	MALE	1974-10-08 01:00:00-04	41	Family Head	t	Married	4	\N	f	t	t	733	f	f		\N	f	Tailor	Local	f		0
2517	1	1	7	ER / 0001 / 501 / 2	Jaibunisha.A	FEMALE	1976-10-08 01:00:00-04	39	Wife	f	Married	8	\N	f	t	t	733	f	f		\N	f	H.W	Local	f		0
2518	1	1	7	ER / 0001 / 501 / 3	Suhitha Banu.A	FEMALE	2006-10-08 01:00:00-04	9	Daughter	f	Single	3	\N	f	t	f	733	f	f		\N	f	Student	Local	f		0
2519	1	1	7	ER / 0001 / 501 / 4	Sajna Banu.A	FEMALE	2008-10-08 01:00:00-04	7	Daughter	f	Single	1	\N	f	t	f	733	f	f		\N	f	Student	Local	f		0
2520	1	1	7	ER / 0001 / 502 / 1	Amanulla.K	MALE	1959-10-08 01:00:00-04	56	Family Head	t	Married	5	\N	f	t	t	734	f	f		\N	f	Labour	Local	f		0
2521	1	1	7	ER / 0001 / 502 / 2	Inthiyas Baegam.A	FEMALE	1966-10-08 01:00:00-04	49	Wife	f	Married	6	\N	f	t	t	734	f	f		\N	f	H.W	Local	f		0
2522	1	1	7	ER / 0001 / 502 / 3	Aayub Khan.A	MALE	1990-10-08 01:00:00-04	25	Son	f	Single	7	\N	f	t	t	734	f	f		\N	f	Company	Local	f		0
2523	1	1	7	ER / 0001 / 503 / 1	Mahaboob Khan.A	MALE	1945-10-08 01:00:00-05	70	Family Head	t	Married	5	\N	f	t	t	735	f	f		\N	f	Market	Local	f		0
2524	1	1	7	ER / 0001 / 503 / 2	Mahaboob khan	FEMALE	1954-10-08 01:00:00-05	61	Wife	f	Married	5	\N	f	t	t	735	f	f		\N	f	H.W	Local	f		0
2528	1	1	7	ER / 0001 / 504 / 4	Udumaan Akkeem.K	MALE	2002-10-08 01:00:00-04	13	Son	f	Single	6	\N	f	t	f	736	f	f		\N	f	Student	Local	f		0
2529	1	1	7	ER / 0001 / 505 / 		MALE	2014-10-08 01:00:00-04	1		f	Single		\N	f	t	f	737	f	f		\N	f		Local	f		0
2530	1	1	7	ER / 0001 / 506 / 1	A.K.Mymuna Beeve	FEMALE	1953-10-08 01:00:00-05	62	Family Head	t	Married	5	\N	f	t	t	738	f	f		\N	f	Labour	Local	f		0
2531	1	1	7	ER / 0001 / 507 / 		MALE	2014-10-08 01:00:00-04	1		f	Single		\N	f	t	f	739	f	f		\N	f		Local	f		0
2532	1	1	7	ER / 0001 / 508 / 1	Mohhammed Rabedeen.A	MALE	1966-10-08 01:00:00-04	49	Family Head	t	Married	9	\N	f	t	t	740	f	f		\N	f	Driver	Local	f		0
2533	1	1	7	ER / 0001 / 508 / 2	Minnhaj Begum.M	FEMALE	1976-10-08 01:00:00-04	39	Wife	f	Married	6	\N	f	t	t	740	f	f		\N	f	H.W	Local	f		0
2534	1	1	7	ER / 0001 / 508 / 3	Mohammed Hussain.M	MALE	2000-10-08 01:00:00-04	15	Son	f	Single	9	\N	f	t	f	740	f	f		\N	f	Student	Local	f		0
2535	1	1	7	ER / 0001 / 508 / 4	Ajiba Tasleem.M	FEMALE	2003-10-08 01:00:00-04	12	Daughter	f	Single	6	\N	f	t	f	740	f	f		\N	f	Student	Local	f		0
2536	1	1	7	ER / 0001 / 509 / 1	Noor Jahan.S	FEMALE	1954-10-08 01:00:00-05	61	Family Head	t	Widow	9	\N	f	t	t	741	f	f		\N	f	H.W	Local	f		0
2537	1	1	7	ER / 0001 / 510 / 1	A.Rahamathtulla	MALE	1954-10-08 01:00:00-05	61	Family Head	t	Married	10	\N	f	t	t	742	f	f		\N	f	Enterpeises	Local	f		0
2538	1	1	7	ER / 0001 / 510 / 2	Noorunisha Begum.R	FEMALE	1965-10-08 01:00:00-04	50	Wife	f	Married	9	\N	f	t	t	742	f	f		\N	f	H.W	Local	f		0
2539	1	1	7	ER / 0001 / 510 / 3	Shereen Taj.R	FEMALE	1991-10-08 01:00:00-04	24	Daughter	f	Single	B.E	\N	f	t	t	742	f	f		\N	f	Company/Salaryed	Local	f		0
2540	1	1	7	ER / 0001 / 511 / 1	Hamsa.M	MALE	1967-10-08 01:00:00-04	48	Family Head	t	Married	7	\N	f	t	t	743	f	f		\N	f	Labour	Local	f		0
2541	1	1	7	ER / 0001 / 511 / 2	Nishita.H	FEMALE	1974-10-08 01:00:00-04	41	Wife	f	Married	11	\N	f	t	t	743	f	f		\N	f	H.W	Local	f		0
2542	1	1	7	ER / 0001 / 511 / 3	Aashika.H	FEMALE	1997-10-08 01:00:00-04	18	Daughter	f	Single	12	\N	f	t	f	743	f	f		\N	f	Student	Local	f		0
2543	1	1	7	ER / 0001 / 511 / 4	Arshath.H	MALE	2008-10-08 01:00:00-04	7	Son	f	Single	1	\N	f	t	f	743	f	f		\N	f	Student	Local	f		0
2544	1	1	7	ER / 0001 / 512 / 1	Sabura Begum	FEMALE	1987-10-08 01:00:00-04	28	Family Head	t	Widow	5	\N	f	t	t	744	f	f		\N	f	Labour	Local	f		0
2545	1	1	7	ER / 0001 / 512 / 2	Mohammed Haleeh.S	MALE	2005-10-08 01:00:00-04	10	Son	f	Single	4	\N	f	t	f	744	f	f		\N	f	Student	Local	f		0
2546	1	1	7	ER / 0001 / 512 / 3	Muhammed Sulaimman.S	MALE	2007-10-08 01:00:00-04	8	Son	f	Single	2	\N	f	t	f	744	f	f		\N	f	Student	Local	f		0
2547	1	1	7	ER / 0001 / 513 / 1	Aashamball.M	FEMALE	1951-10-08 01:00:00-05	64	Family Head	t	Widow	5	\N	f	t	t	745	f	f		\N	f	Labour	Local	f		0
2548	1	1	7	ER / 0001 / 513 / 2	Sarammal	FEMALE	1986-10-08 01:00:00-04	29	.Daughter in law	f	Widow	5	\N	f	t	t	745	f	f		\N	f	H.W	Local	f		0
2549	1	1	7	ER / 0001 / 513 / 3	Jafer Sadeeq	MALE	2002-10-08 01:00:00-04	13	Grand Son	f	Single	8	\N	f	t	f	745	f	f		\N	f	Student	Local	f		0
2550	1	1	7	ER / 0001 / 513 / 4	Yasmeen Farjana	FEMALE	2004-10-08 01:00:00-04	11	.Grand Daughter	f	Single	5	\N	f	t	f	745	f	f		\N	f	Student	Local	t	Interest in Aalim/Hifz	0
2551	1	1	7	ER / 0001 / 514 / 1	Abdur Rahuman	MALE	1974-10-08 01:00:00-04	41	Family Head	t	Married	5	\N	f	t	f	746	f	f		\N	f	Labour	Local	f		0
2552	1	1	7	ER / 0001 / 514 / 2	Barkath Nisha	FEMALE	1979-10-08 01:00:00-04	36	Wife	f	Married	3	\N	f	t	f	746	f	f		\N	f	Labour	Local	f		0
2553	1	1	7	ER / 0001 / 514 / 3	Madan Saiboo	MALE	2000-10-08 01:00:00-04	15	Son	f	Single	9	\N	f	t	f	746	f	f		\N	f	Student	Local	f		0
2554	1	1	7	ER / 0001 / 514 / 4	Sahul Ameed	MALE	2001-10-08 01:00:00-04	14	Son	f	Single	7	\N	f	t	f	746	f	f		\N	f	Student	Local	f		0
2555	1	1	7	ER / 0001 / 515 / 1	Mumtaj Begum	FEMALE	1966-10-08 01:00:00-04	49	Family Head	t	Widow	8	\N	f	t	t	747	f	f		\N	f		Local	f		0
2556	1	1	7	ER / 0001 / 515 / 2	Fathima Beeve(Amudha)	FEMALE	1992-10-08 01:00:00-04	23	Son	f	Single	6	\N	f	t	f	747	f	f		\N	f	Labour	Local	f		0
2557	1	1	7	ER / 0001 / 516 / 		MALE	2014-10-08 01:00:00-04	1		f	Single		\N	f	t	f	748	f	f		\N	f		Local	f		0
2558	1	1	7	ER / 0001 / 517 / 1	S.Pathi Muthu	FEMALE	1958-10-08 01:00:00-04	57	Family Head	t	Widow	2	\N	f	t	t	749	f	f		\N	f	H.W	Local	f		0
2559	1	1	7	ER / 0001 / 517 / 2	M.Salma Beeve	FEMALE	1927-10-08 01:00:00-05	88	Mother	f	Widow		\N	f	t	t	749	f	f		\N	f	H.W	Local	f		0
2560	1	1	7	ER / 0001 / 518 / 1	Aazer Beeve.A	FEMALE	1939-10-08 01:00:00-05	76	Family Head	t	Widow		\N	f	t	t	750	f	f		\N	f	H.W	Local	f		0
2561	1	1	7	ER / 0001 / 518 / 2	Rahammath Beeve.A	FEMALE	1954-10-08 01:00:00-05	61	Daughter	f	Widow	5	\N	f	t	f	750	f	f		\N	f	H.W	Local	f		0
2562	1	1	7	ER / 0001 / 519 / 1	Sameem	MALE	1985-10-08 01:00:00-04	30	Family Head	t	Married	B.Com	\N	f	t	t	751	f	f		\N	f	Office Work	Local	f		0
2563	1	1	7	ER / 0001 / 519 / 2	Sharma	FEMALE	1989-10-08 01:00:00-04	26	Wife	f	Married	B.Sc	\N	f	t	t	751	f	f		\N	f		Local	f		0
2564	1	1	7	ER / 0001 / 519 / 3	Sanaboo Sajna	FEMALE	2013-10-08 01:00:00-04	2	Daughter	f	Single		\N	f	t	f	751	f	f		\N	f		Local	f		0
2565	1	1	7	ER / 0001 / 520 / 1	Muhammed Rafeek.M	MALE	1982-10-08 01:00:00-04	33	Family Head	t	Married	10	\N	f	t	t	752	f	f		\N	f	Labour	Local	f		0
2566	1	1	7	ER / 0001 / 520 / 2	Janaafee.A	FEMALE	1987-10-08 01:00:00-04	28	Wife	f	Married	10	\N	f	t	t	752	f	f		\N	f	H.W	Local	f		0
2567	1	1	7	ER / 0001 / 520 / 3	Muhammed Hussain.M	MALE	2010-10-08 01:00:00-04	5	Son	f	Single	L.KG	\N	f	t	f	752	f	f		\N	f	Student	Local	f		0
2568	1	1	7	ER / 0001 / 521 / 1	Anarkali	FEMALE	1969-10-08 01:00:00-04	46	Family Head	t	Married		\N	f	t	f	753	f	f		\N	f	H.W	Local	f		0
2569	1	1	7	ER / 0001 / 521 / 2	SakeelaBanu	FEMALE	1987-10-08 01:00:00-04	28	Daughter	f	Single	8	\N	f	t	f	753	f	f		\N	f	Labour	Local	f		0
2570	1	1	7	ER / 0001 / 522 / 1	A.Saleem	MALE	1980-10-08 01:00:00-04	35	Family Head	t	Married	9	\N	f	t	t	754	f	f		\N	f	Old Scrap Merchant	Local	f		0
2571	1	1	7	ER / 0001 / 522 / 2	S.Naseema Parveen	FEMALE	1983-10-08 01:00:00-04	32	Wife	f	Married	9	\N	f	t	t	754	f	f		\N	f	H.W	Local	f		0
2572	1	1	7	ER / 0001 / 522 / 3	S.Yasar Arafath	MALE	2005-10-08 01:00:00-04	10	Son	f	Single	5	\N	f	t	f	754	f	f		\N	f	Student	Local	f		0
2573	1	1	7	ER / 0001 / 522 / 4	S.Ayisha	FEMALE	2008-10-08 01:00:00-04	7	Daughter	f	Single	2	\N	f	t	f	754	f	f		\N	f	Student	Local	f		0
2574	1	1	7	ER / 0001 / 523 / 1	Sulthan Basha.I	MALE	1969-10-08 01:00:00-04	46	Family Head	t	Devorced		\N	f	t	t	755	f	f		\N	f	One Hotle	Local	f		0
2575	1	1	7	ER / 0001 / 523 / 2	S.Nargeesh Banu	FEMALE	1974-10-08 01:00:00-04	41	Wife	f	Devorced	5	\N	f	t	t	755	f	f		\N	f	Labour	Local	f		0
2576	1	1	7	ER / 0001 / 523 / 3	S.Kadher Mydeen	MALE	1990-10-08 01:00:00-04	25	Son	f	Single	8	\N	f	t	t	755	f	f		\N	f	Labour	Local	f		0
2577	1	1	7	ER / 0001 / 523 / 4	S.Parveen Banu	FEMALE	1992-10-08 01:00:00-04	23	Daughter	f	Single	B.Sc	\N	f	t	t	755	f	f		\N	f		Local	f		0
2578	1	1	7	ER / 0001 / 459 / 1	S.Syed ali	MALE	1984-10-08 01:00:00-04	31	Family Head	t	Married	5	\N	f	t	t	756	f	f		\N	f	Labour	Local	f		0
2579	1	1	7	ER / 0001 / 459 / 2	S.Rabiyathul Pasariya	FEMALE	1989-10-08 01:00:00-04	26	Wife	f	Married	7	\N	f	t	t	756	f	f		\N	f	Tailor	Local	f		0
2580	1	1	7	ER / 0001 / 459 / 3	S.Muhammed Arfath	MALE	2008-10-08 01:00:00-04	7	Son	f	Single	1	\N	f	t	f	756	f	f		\N	f	Student	Local	f		0
2581	1	1	7	ER / 0001 / 460 / 1	Thajudeen	MALE	1966-10-08 01:00:00-04	49	Family Head	t	Married		\N	f	t	t	757	f	f		\N	f	Painter	Local	f		0
2582	1	1	7	ER / 0001 / 460 / 2	Rukiya	FEMALE	1971-10-08 01:00:00-04	44	Wife	f	Married		\N	f	t	f	757	f	f		\N	f	H.W	Local	f		0
2583	1	1	7	ER / 0001 / 460 / 3	Rabiya	FEMALE	1992-10-08 01:00:00-04	23	Daughter	f	Single		\N	f	t	t	757	f	f		\N	f		Local	f		0
2584	1	1	7	ER / 0001 / 460 / 4	Ashraf	MALE	2000-10-08 01:00:00-04	15	Son	f	Single		\N	f	t	f	757	f	f		\N	f	Student	Local	f		0
2585	1	1	7	ER / 0001 / 461 / 1	Shabiyulla 	MALE	1986-10-08 01:00:00-04	29	Family Head	t	Married	7	\N	f	t	t	758	f	f		\N	f	K.M.C.Hospital 	Outstation	f		0
2586	1	1	7	ER / 0001 / 461 / 2	Suraiya Baegam	FEMALE	1989-10-08 01:00:00-04	26	Wife	f	Married	7	\N	f	t	t	758	f	f		\N	f	H.W	Local	f		0
2587	1	1	7	ER / 0001 / 461 / 3	Asma Nasreen	FEMALE	2011-10-08 01:00:00-04	4	Daughter	f	Single		\N	f	t	f	758	f	f		\N	f		Local	f		0
2588	1	1	7	ER / 0001 / 462 / 1	M.Sikender Babu	MALE	1981-10-08 01:00:00-04	34	Family Head	t	Married	4	\N	f	t	t	759	f	f		\N	f	Thallu Vandi Kadai	Local	f		0
2589	1	1	7	ER / 0001 / 462 / 2	S.Mumtaj Beagum	FEMALE	1988-10-08 01:00:00-04	27	Wife	f	Married	8	\N	f	t	t	759	f	f		\N	f	H.W	Local	f		0
2590	1	1	7	ER / 0001 / 462 / 3	S.Muhammed Yusuf	MALE	2013-10-08 01:00:00-04	2	Son	f	Single		\N	f	t	f	759	f	f		\N	f		Local	f		0
2591	1	1	7	ER / 0001 / 462 / 4	M.Jaibunissha	FEMALE	1959-10-08 01:00:00-04	56	Mother	f	Married		\N	f	t	f	759	f	f		\N	f		Local	f		0
2592	1	1	7	ER / 0001 / 463 / 1	Alavudeen Basha	MALE	1974-10-08 01:00:00-04	41	Family Head	t	Married	9	\N	f	t	t	760	f	f		\N	f	Driver	Local	f		0
2593	1	1	7	ER / 0001 / 463 / 2	A.Monagi Beagam	FEMALE	1979-10-08 01:00:00-04	36	Wife	f	Married	7	\N	f	t	t	760	f	f		\N	f	Labour	Local	f		0
2594	1	1	7	ER / 0001 / 463 / 3	A.Anwer Basha	MALE	1996-10-08 01:00:00-04	19	Son	f	Single	10	\N	f	t	f	760	f	f		\N	f		Local	f		0
2595	1	1	7	ER / 0001 / 463 / 4	A.Shareen Taj	FEMALE	2003-10-08 01:00:00-04	12	Daughter	f	Single	6	\N	f	t	f	760	f	f		\N	f	Student	Local	f		0
2596	1	1	7	ER / 0001 / 464 / 1	A.Ammanulla	MALE	1953-10-08 01:00:00-05	62	Family Head	t	Married	10	\N	f	t	t	761	f	f		\N	f	Labour	Local	f		0
2597	1	1	7	ER / 0001 / 464 / 2	A.Sabura Beagam	FEMALE	1969-10-08 01:00:00-04	46	Wife	f	Married	8	\N	f	t	t	761	f	f		\N	f	H.W	Local	f		0
2598	1	1	7	ER / 0001 / 464 / 3	A.Rabiyathul Ramkan	FEMALE	1989-10-08 01:00:00-04	26	Daughter	f	Single	M.Sc	\N	f	t	t	761	f	f		\N	f		Local	f		0
2599	1	1	7	ER / 0001 / 464 / 4	A.Muhammed Arafsha	MALE	1993-10-08 01:00:00-04	22	Son	f	Single	B.CA	\N	f	t	t	761	f	f		\N	f		Local	f		0
2600	1	1	7	ER / 0001 / 465 / 1	Aameena beeve	FEMALE	1944-10-08 01:00:00-04	71	Family Head	t	Married		\N	f	t	t	762	f	f		\N	f		Local	f		0
2601	1	1	7	ER / 0001 / 465 / 2	Rajabuneesha	FEMALE	1976-10-08 01:00:00-04	39	Daughter	f	Single	2	\N	f	t	t	762	f	f		\N	f		Local	f		0
2602	1	1	7	ER / 0001 / 465 / 3	Kamarunisha	FEMALE	1979-10-08 01:00:00-04	36	Daughter	f	Single	2	\N	f	t	t	762	f	f		\N	f		Local	f		0
2603	1	1	7	ER / 0001 / 465 / 4	Jameela	FEMALE	1984-10-08 01:00:00-04	31	Daughter	f	Single		\N	f	t	t	762	f	f		\N	f		Local	f		0
2604	1	1	7	ER / 0001 / 465 / 5	Rasiya	FEMALE	1985-10-08 01:00:00-04	30	Daughter	f	Single		\N	f	t	t	762	f	f		\N	f	labour	Local	f		0
2605	1	1	7	ER / 0001 / 465 / 6	Jannathunisha	FEMALE	1987-10-08 01:00:00-04	28	Daughter	f	Single		\N	f	t	f	762	f	f		\N	f		Local	f		0
2606	1	1	7	ER / 0001 / 465 / 7	Shakeela Banu	FEMALE	1989-10-08 01:00:00-04	26	Daughter	f	Single		\N	f	t	f	762	f	f		\N	f	Labour	Local	f		0
2607	1	1	7	ER / 0001 / 465 / 8	Rahamath Nisha	FEMALE	1992-10-08 01:00:00-04	23	Daughter	f	Single		\N	f	t	f	762	f	f		\N	f	Labour	Local	f		0
2608	1	1	7	ER / 0001 / 466 / 1	Kulfeer.K	MALE	1966-10-08 01:00:00-04	49	Family Head	t	Married	5	\N	f	t	t	763	f	f		\N	f	Labour	Local	f		0
2609	1	1	7	ER / 0001 / 466 / 2	Jaereena Banu.S	FEMALE	1979-10-08 01:00:00-04	36	Wife	f	Married	3	\N	f	t	t	763	f	f		\N	f	H.W	Local	f		0
2610	1	1	7	ER / 0001 / 466 / 3	Anbar saren	FEMALE	2009-10-08 01:00:00-04	6	Daughter	f	Single	U.KG	\N	f	t	f	763	f	f		\N	f	Student	Local	f		0
2611	1	1	7	ER / 0001 / 467 / 1	S.A. Kaleel  Thinnai Thzolar	MALE	1969-10-08 01:00:00-04	46	Family Head	t	Married		\N	f	t	f	764	f	f		\N	f	Labour	Local	f		0
2612	1	1	7	ER / 0001 / 467 / 2	S.Jutha Banu	FEMALE	1979-10-08 01:00:00-04	36	Wife	f	Married	8	\N	f	t	f	764	f	f		\N	f	H.W	Local	f		0
2613	1	1	7	ER / 0001 / 467 / 3	Subiya Banu	FEMALE	1995-10-08 01:00:00-04	20	Daughter	f	Single	BE	\N	f	t	f	764	f	f		\N	f	Student	Local	f		0
2614	1	1	7	ER / 0001 / 467 / 4	Jaffar Sadeeq	MALE	1996-10-08 01:00:00-04	19	Son	f	Single	BA	\N	f	t	f	764	f	f		\N	f		Local	f		0
2615	1	1	7	ER / 0001 / 468 / 1	Hakeem	MALE	1979-10-08 01:00:00-04	36	Family Head	t	Married	6	\N	f	t	t	765	f	f		\N	f	Tailor	Local	f		0
2616	1	1	7	ER / 0001 / 468 / 2	Jameela	FEMALE	1984-10-08 01:00:00-04	31	Wife	f	Married	10	\N	f	t	t	765	f	f		\N	f	H.W	Local	f		0
2617	1	1	7	ER / 0001 / 468 / 3	Anseela Fathima	FEMALE	2006-10-08 01:00:00-04	9	Son	f	Single	4	\N	f	t	f	765	f	f		\N	f	Student	Local	f		0
2618	1	1	7	ER / 0001 / 468 / 4	Afrin Fathima	FEMALE	2008-10-08 01:00:00-04	7	Daughter	f	Single	2	\N	f	t	f	765	f	f		\N	f	Student	Local	f		0
2619	1	1	7	ER / 0001 / 469 / 1	A.Mubarak ali Thinnai Thzolar	MALE	1977-10-08 01:00:00-04	38	Family Head	t	Married	5	\N	f	t	t	766	f	f		\N	f	Manager	Local	f		0
2620	1	1	7	ER / 0001 / 469 / 2	M.Saidha Banu	FEMALE	1984-10-08 01:00:00-04	31	Wife	f	Married		\N	f	t	t	766	f	f		\N	f	H.W	Local	f		0
2621	1	1	7	ER / 0001 / 469 / 3	M.Muhammed Rabek	MALE	2001-10-08 01:00:00-04	14	Son	f	Single	8	\N	f	t	f	766	f	f		\N	f	Student	Local	f		0
2622	1	1	7	ER / 0001 / 469 / 4	M.Raseena	FEMALE	2004-10-08 01:00:00-04	11	Daughter	f	Single	6	\N	f	t	f	766	f	f		\N	f	Student	Local	f		0
2623	1	1	7	ER / 0001 / 470 / 1	Mehaboob Basha.M	MALE	1954-10-08 01:00:00-05	61	Family Head	t	Married		\N	f	t	f	767	f	f		\N	f	Tailor	Local	f		0
2624	1	1	7	ER / 0001 / 470 / 2	Rehana.M	FEMALE	1963-10-08 01:00:00-04	52	Wife	f	Married		\N	f	t	f	767	f	f		\N	f	.H.W	Local	f		0
2625	1	1	7	ER / 0001 / 470 / 3	Farhana.M	FEMALE	1985-10-08 01:00:00-04	30	Daughter	f	Single	10	\N	f	t	f	767	f	f		\N	f	labour	Local	f		0
2626	1	1	7	ER / 0001 / 470 / 4	Rizwana.M	FEMALE	1987-10-08 01:00:00-04	28	Daughter	f	Single	Teacher Training	\N	f	t	f	767	f	f		\N	f	.Teacher	Local	f		0
2627	1	1	7	ER / 0001 / 470 / 5	Sharmila.M	FEMALE	1990-10-08 01:00:00-04	25	Daughter	f	Single	7	\N	f	t	f	767	f	f		\N	f	Labour	Local	f		0
2628	1	1	7	ER / 0001 / 471 / 1	M.Raja Mohamadu	MALE	1978-10-08 01:00:00-04	37	Family Head	t	Married	7	\N	f	t	t	768	f	f		\N	f	Thallu Vandi tiffen Kadai	Local	f		0
2629	1	1	7	ER / 0001 / 471 / 2	R.Parveen	FEMALE	1979-10-08 01:00:00-04	36	Wife	f	Married	5	\N	f	t	t	768	f	f		\N	f	Labour	Local	f		0
2630	1	1	7	ER / 0001 / 471 / 3	Mahaboob Basha	MALE	1997-10-08 01:00:00-04	18	Son	f	Single	10	\N	f	t	f	768	f	f		\N	f	Drop out	Local	f		0
2631	1	1	7	ER / 0001 / 471 / 4	R.Dill Shat	FEMALE	1999-10-08 01:00:00-04	16	Daughter	f	Single	Aalim	\N	f	t	f	768	f	f		\N	f	Student	Local	t	Interest in Aalim/Hifz	0
2632	1	1	7	ER / 0001 / 472 / 1	T.Nazer Ali	MALE	1976-10-08 01:00:00-04	39	Family Head	t	Married	8	\N	f	t	t	769	f	f		\N	f	Labour	Local	f		0
2633	1	1	7	ER / 0001 / 472 / 2	N.Mubhashera	FEMALE	1982-10-08 01:00:00-04	33	Wife	f	Married	10	\N	f	t	t	769	f	f		\N	f	H.W	Local	f		0
2634	1	1	7	ER / 0001 / 472 / 3	N.Muhammed Suhail	MALE	2003-10-08 01:00:00-04	12	Son	f	Single	6	\N	f	t	f	769	f	f		\N	f	Student	Local	f		0
2635	1	1	7	ER / 0001 / 472 / 4	N.Muhammed Aashif	MALE	2008-10-08 01:00:00-04	7	Son	f	Single	1	\N	f	t	f	769	f	f		\N	f	Student	Local	f		0
2636	1	1	7	ER / 0001 / 473 / 		MALE	2014-10-08 01:00:00-04	1		f	Single		\N	f	t	f	770	f	f		\N	f		Local	f		0
2637	1	1	7	ER / 0001 / 474 / 1	S.Sahul Hameed	MALE	1970-10-08 01:00:00-04	45	Family Head	t	Married	5	\N	f	t	t	771	f	f		\N	f		Local	f		0
2638	1	1	7	ER / 0001 / 474 / 2	S.Kursheeth Baegam	FEMALE	1976-10-08 01:00:00-04	39	Wife	f	Married		\N	f	t	t	771	f	f		\N	f	H.W	Local	f		0
2639	1	1	7	ER / 0001 / 474 / 3	Abdul Sathar	MALE	1947-10-08 01:00:00-05	68	.Father in law	f	Widow		\N	f	t	t	771	f	f		\N	f	H.R	Local	f		0
2640	1	1	7	ER / 0001 / 474 / 4	S.Ansar	MALE	1997-10-08 01:00:00-04	18	Son	f	Single	10	\N	f	t	f	771	f	f		\N	f	Drop out	Local	f		0
2641	1	1	7	ER / 0001 / 475 / 1	Jannathunisha B	FEMALE	1954-10-08 01:00:00-05	61	Family Head	t	Married	6	\N	f	t	t	772	f	f		\N	f	H.W	Local	f		0
2642	1	1	7	ER / 0001 / 475 / 2	Najuma Banu.A	FEMALE	1987-10-08 01:00:00-04	28	Daughter	f	Married	5	\N	f	t	f	772	f	f		\N	f	Labour	Local	f		0
2643	1	1	7	ER / 0001 / 475 / 3	Femina Hasleen.A	FEMALE	2008-10-08 01:00:00-04	7	.Grand daughter	f	Single		\N	f	t	f	772	f	f		\N	f		Local	f		0
2644	1	1	7	ER / 0001 / 475 / 4	Ansar Ali	FEMALE	1979-10-08 01:00:00-04	36	.Son in law	f	Married	7	\N	f	t	f	772	f	f		\N	f	Labour	Outstation	f		0
2645	1	1	7	ER / 0001 / 476 / 1	Piyarejaan	FEMALE	1949-10-08 01:00:00-05	66	Family Head	t	Married		\N	f	t	t	773	f	f		\N	f		Local	f		0
1225	1	1	7	ER / 0001 / 76 / 2	Maboo Basha	MALE	1969-10-08 01:00:00-04	46	Son	f	Married	5	\N	f	t	t	367	f	f		\N	f	Labour	Local	f		0
2646	1	1	7	ER / 0001 / 476 / 3	Noor Jahan	FEMALE	1979-10-08 01:00:00-04	36	.Daughter in law	f	Married	5	\N	f	t	t	773	f	f		\N	f	Labour	Local	f		0
2647	1	1	7	ER / 0001 / 476 / 4	Nadiya	FEMALE	2004-10-08 01:00:00-04	11	.Grand daughter	f	Single	6	\N	f	t	f	773	f	f		\N	f		Local	f		0
2648	1	1	7	ER / 0001 / 477 / 		MALE	2014-10-08 01:00:00-04	1		f	Single		\N	f	t	f	774	f	f		\N	f		Local	f		0
2649	1	1	7	ER / 0001 / 478 / 1	Fathima beeve	FEMALE	1934-10-08 01:00:00-05	81	Family Head	t	Married		\N	f	t	t	775	f	f		\N	f	H.W	Local	f		0
2650	1	1	7	ER / 0001 / 479 / 1	Aarokuba BeeBee	FEMALE	1934-10-08 01:00:00-05	81	Family Head	t	Married		\N	f	t	t	776	f	f		\N	f	H.W	Local	f		0
2651	1	1	7	ER / 0001 / 480 / 1	Raziya Banu.J	FEMALE	1976-10-08 01:00:00-04	39	Family Head	t	Married	5	\N	f	t	t	777	f	f		\N	f	H.W	Local	f		0
2652	1	1	7	ER / 0001 / 480 / 2	Kulzar Baegam	FEMALE	1995-10-08 01:00:00-04	20	Daughter	f	Single	BCA	\N	f	t	f	777	f	f		\N	f	Student	Local	f		0
2653	1	1	7	ER / 0001 / 480 / 3	Habeebnisha.J	FEMALE	1996-10-08 01:00:00-04	19	Daughter	f	Single	12	\N	f	t	f	777	f	f		\N	f	Student	Local	f		0
2654	1	1	7	ER / 0001 / 480 / 4	Muhammed Harish.J	FEMALE	1997-10-08 01:00:00-04	18	Son	f	Single	10	\N	f	t	f	777	f	f		\N	f	Student	Local	f		0
2655	1	1	7	ER / 0001 / 481 / 1	Abdul Raheem	MALE	1970-10-08 01:00:00-04	45	Family Head	t	Married	12	\N	f	t	t	778	f	f		\N	f	Labour	Local	f		0
2656	1	1	7	ER / 0001 / 481 / 2	A.Rasheetha Banu	FEMALE	1980-10-08 01:00:00-04	35	wife	f	Married	4	\N	f	t	t	778	f	f		\N	f	.labour	Local	f		0
2657	1	1	7	ER / 0001 / 481 / 3	A.Sheva Fathima	FEMALE	1999-10-08 01:00:00-04	16	Daughter	f	Single	11	\N	f	t	f	778	f	f		\N	f	Student	Local	f		0
2658	1	1	7	ER / 0001 / 481 / 4	A.Abdul Khader	MALE	1996-10-08 01:00:00-04	19	Son	f	Single	12	\N	f	t	f	778	f	f		\N	f	Student	Local	f		0
2659	1	1	7	ER / 0001 / 481 / 5	Abul Hasan	MALE	2013-10-08 01:00:00-04	2	Sister son	f	Single		\N	f	t	f	778	f	f		\N	f		Local	f		0
2660	1	1	7	ER / 0001 / 482 / 1	Pandiyan(a) Eliyas	MALE	1966-10-08 01:00:00-04	49	Family Head	t	Married	10	\N	f	t	t	779	f	f		\N	f	Tea Shop Salary	Local	f		0
2661	1	1	7	ER / 0001 / 482 / 2	Meharaj Banu	FEMALE	1979-10-08 01:00:00-04	36	wife	f	Married		\N	f	t	t	779	f	f		\N	f	Labour	Local	f		0
2662	1	1	7	ER / 0001 / 482 / 3	Ismail	MALE	2003-10-08 01:00:00-04	12	Son	f	Single	7	\N	f	t	f	779	f	f		\N	f	Student	Local	t	Interest in Aalim/Hifz	0
2663	1	1	7	ER / 0001 / 482 / 4	Ibrahim	MALE	1999-10-08 01:00:00-04	16	Son	f	Single	11	\N	f	t	f	779	f	f		\N	f	Student	Local	f		0
2664	1	1	7	ER / 0001 / 483 / 1	Fathima Banu	FEMALE	1990-10-08 01:00:00-04	25	Family Head	t	Married	8	\N	f	t	t	780	f	f		\N	f	Poo Kattuthal	Local	f		0
2665	1	1	7	ER / 0001 / 483 / 2	Alavudeen Azees I	MALE	2009-10-08 01:00:00-04	6	Son	f	Single	L.KG	\N	f	t	f	780	f	f		\N	f	Student	Local	f		0
2666	1	1	7	ER / 0001 / 483 / 3	Muhammed Aasath.I	MALE	2012-10-08 01:00:00-04	3	Son	f	Single		\N	f	t	f	780	f	f		\N	f		Local	f		0
2667	1	1	7	ER / 0001 / 484 / 1	Sathar	MALE	1964-10-08 01:00:00-04	51	Family Head	t	Married		\N	f	t	t	781	f	f		\N	f		Local	f		0
2668	1	1	7	ER / 0001 / 484 / 2	Faritha.S	FEMALE	1969-10-08 01:00:00-04	46	wife	f	Married		\N	f	t	t	781	f	f		\N	f		Local	f		0
2669	1	1	7	ER / 0001 / 484 / 3	Ansari.S	MALE	2000-10-08 01:00:00-04	15	Son	f	Single	9	\N	f	t	f	781	f	f		\N	f	Student	Local	f		0
2670	1	1	7	ER / 0001 / 485 / 1	P.K.M.Muhammed Basha	MALE	1957-10-08 01:00:00-04	58	Family Head	t	Married	6	\N	f	t	t	782	f	f		\N	f	Coffe Dust Sales	Local	f		0
2671	1	1	7	ER / 0001 / 485 / 2	Ayisha Beeve	FEMALE	1965-10-08 01:00:00-04	50	wife	f	Married	6	\N	f	t	t	782	f	f		\N	f	H.W	Local	f		0
2672	1	1	7	ER / 0001 / 485 / 3	Rubiya Banu	FEMALE	1990-10-08 01:00:00-04	25	Daughter	f	Single	12	\N	f	t	t	782	f	f		\N	f	N't Work	Local	f		0
2673	1	1	7	ER / 0001 / 485 / 4	Anwar Basha	MALE	1993-10-08 01:00:00-04	22	Son	f	Single	8	\N	f	t	t	782	f	f		\N	f	Decoration	Local	f		0
2674	1	1	7	ER / 0001 / 601 / 1	Mohammed Hakiem	MALE	1967-10-08 01:00:00-04	48	family head	t	Married	SSLC	\N	f	t	t	783	f	f		\N	f	Brick seals	Local	f		0
2675	1	1	7	ER / 0001 / 601 / 2	Afroge Banu	FEMALE	1975-10-08 01:00:00-04	40	Wife	f	Married	8'th	\N	f	t	t	783	f	f		\N	f	House Wife	Local	f		0
2676	1	1	7	ER / 0001 / 601 / 3	Abdul Rahaman	MALE	1995-10-08 01:00:00-04	20	Son	f	Single	B.E	\N	f	t	f	783	f	f		\N	f	Student	Local	f		0
2677	1	1	7	ER / 0001 / 602 / 1	Hidayathullah	MALE	1984-10-08 01:00:00-04	31	family head	t	Married	5'th	\N	f	t	t	784	f	f		\N	f	labour	Local	f		0
2678	1	1	7	ER / 0001 / 602 / 2	Shaila banu	FEMALE	1985-10-08 01:00:00-04	30	Wife	f	Married	N	\N	f	t	t	784	f	f		\N	f	labour	Local	f		0
2679	1	1	7	ER / 0001 / 603 / 1	Noorjagan	FEMALE	1941-10-08 01:00:00-05	74	family head	t	Married	5'th	\N	f	t	t	785	f	f		\N	f	Rest	Local	f		0
2680	1	1	7	ER / 0001 / 603 / 2	Abdul kadher	MALE	1970-10-08 01:00:00-04	45	Son	f	Married	8'th	\N	f	t	t	785	f	f		\N	f	Driver	Local	f		0
2681	1	1	7	ER / 0001 / 604 / 1	Parveen banu	FEMALE	1985-10-08 01:00:00-04	30	family head	t	Devorced	N	\N	f	t	t	786	f	f		\N	f	Tailor	Local	f		0
2682	1	1	7	ER / 0001 / 604 / 2	Pharishya bagam	FEMALE	2011-10-08 01:00:00-04	4	Daughter	f	Single	N	\N	f	t	f	786	f	f		\N	f	N	Local	f		0
2683	1	1	7	ER / 0001 / 605 / 1	M.Abdul muthalif	MALE	1969-10-08 01:00:00-04	46	family head	t	Married	SSLC	\N	f	t	t	787	f	f		\N	f	Pickl sales 	Local	f		0
2684	1	1	7	ER / 0001 / 605 / 2	A.Rahamath Nisha	FEMALE	1987-10-08 01:00:00-04	28	Wife	f	Married	SSLC	\N	f	t	t	787	f	f		\N	f	House Wife	Local	f		0
2685	1	1	7	ER / 0001 / 605 / 3	Mahamudhu Nadeer	MALE	2013-10-08 01:00:00-04	2	Son	f	Single	N	\N	f	t	f	787	f	f		\N	f	N	Local	f		0
2686	1	1	7	ER / 0001 / 606 / 1	V.K.Mohammed hanifa	MALE	1934-10-08 01:00:00-05	81	family head	t	Married	5'th	\N	f	t	t	788	f	f		\N	f	N	Local	f		0
2687	1	1	7	ER / 0001 / 606 / 2	M.Pathi muthu	FEMALE	1939-10-08 01:00:00-05	76	Wife	f	Married	n	\N	f	t	t	788	f	f		\N	f	House Wife	Local	f		0
2688	1	1	7	ER / 0001 / 607 / 1	M.Iqbal	MALE	1979-10-08 01:00:00-04	36	family head	t	Married	7'th	\N	f	t	t	789	f	f		\N	f	labour	Local	f		0
2689	1	1	7	ER / 0001 / 607 / 2	E.Aasiya Bagam	FEMALE	1984-10-08 01:00:00-04	31	Wife	f	Married	N	\N	f	t	t	789	f	f		\N	f	House Wife	Local	f		0
2690	1	1	7	ER / 0001 / 607 / 3	E.Riyaz khan	MALE	2005-10-08 01:00:00-04	10	Son	f	Single	4'th	\N	f	t	f	789	f	f		\N	f	Student	Local	f		0
2691	1	1	7	ER / 0001 / 607 / 4	E.Ameer khan	MALE	2010-10-08 01:00:00-04	5	Son	f	Single	N	\N	f	t	f	789	f	f		\N	f	N	Local	f		0
2731	1	1	7	ER / 0001 / 619 / 1	Akbar Basha	MALE	1959-10-08 01:00:00-04	56	family head	t	Married	5'th	\N	f	t	t	801	f	f		\N	f	.hotel Business	Local	f		0
2692	1	1	7	ER / 0001 / 608 / 		MALE	2014-10-08 01:00:00-04	1		f	Single		\N	f	t	f	790	f	f		\N	f		Local	f		0
2693	1	1	7	ER / 0001 / 609 / 1	A.Haji Alli	MALE	1983-08-08 01:00:00-04	32	family head	t	Married	SSLC	\N	f	t	t	791	f	f		\N	f	 panbeeda seller	Local	f		0
2694	1	1	7	ER / 0001 / 609 / 2	H.Rajbnisha	FEMALE	1984-08-08 01:00:00-04	31	Wife	f	Married	8'th	\N	f	t	t	791	f	f		\N	f	House Wife	Local	f		0
2695	1	1	7	ER / 0001 / 609 / 3	H.Parina	FEMALE	2009-08-08 01:00:00-04	6	Daughter	f	Single	UKG	\N	f	t	f	791	f	f		\N	f	Student	Local	f		0
2696	1	1	7	ER / 0001 / 610 / 1	A.Ogamathulla	MALE	1981-10-08 01:00:00-04	34	family head	t	Married	8'th	\N	f	t	t	792	f	f		\N	f	Tailor	Local	f		0
2697	1	1	7	ER / 0001 / 610 / 2	R.Mumthaj Bagam	FEMALE	1985-10-08 01:00:00-04	30	Wife	f	Married	8'th	\N	f	t	t	792	f	f		\N	f	House Wife	Local	f		0
2698	1	1	7	ER / 0001 / 610 / 3	R.Mohammed Ribath	MALE	2007-10-08 01:00:00-04	8	Daughter	f	Single	2'nd	\N	f	t	f	792	f	f		\N	f	Student	Local	t	Interest in Aalim/Hifz	0
2699	1	1	7	ER / 0001 / 611 / 1	M.leyakath Alli	MALE	1961-10-08 01:00:00-04	54	family head	t	Married	12'th	\N	f	t	t	793	f	f		\N	f	Civil Supply Officer	Local	f		0
2700	1	1	7	ER / 0001 / 611 / 2	Asrafunisha	FEMALE	1967-10-08 01:00:00-04	48	Wife	f	Married	9'th	\N	f	t	t	793	f	f		\N	f	House Wife	Local	f		0
2701	1	1	7	ER / 0001 / 611 / 3	Ushan	MALE	1987-10-08 01:00:00-04	28	Son	f	Married	DME	\N	f	t	t	793	f	f		\N	f	Cipcot Boylor oprator	Local	f		0
2702	1	1	7	ER / 0001 / 611 / 4	Anisha	FEMALE	1993-10-08 01:00:00-04	22	.Daughter Law	f	Married	BSC	\N	f	t	t	793	f	f		\N	f	House Wife	Local	f		0
2703	1	1	7	ER / 0001 / 611 / 5	Ajmal	MALE	2012-10-08 01:00:00-04	3	Grand Son	f	Single	N	\N	f	t	f	793	f	f		\N	f	N	Local	f		0
2704	1	1	7	ER / 0001 / 612 / 1	M.Feros khan	MALE	1982-10-08 01:00:00-04	33	family head	t	Married	6'th	\N	f	t	t	794	f	f		\N	f	Driver	Local	f		0
2705	1	1	7	ER / 0001 / 612 / 2	B.Rahamath Nisha	FEMALE	1986-10-08 01:00:00-04	29	Wife	f	Married	7'th	\N	f	t	t	794	f	f		\N	f	House Wife	Local	f		0
2706	1	1	7	ER / 0001 / 612 / 3	B.Basila	FEMALE	2009-10-08 01:00:00-04	6	Daughter	f	Single	1'th	\N	f	t	f	794	f	f		\N	f	Student	Local	f		0
2707	1	1	7	ER / 0001 / 613 / 1	Syed yasin.J	MALE	1982-10-08 01:00:00-04	33	family head	t	Married	ITI	\N	f	t	t	795	f	f		\N	f	Quality Controlar	Local	f		0
2708	1	1	7	ER / 0001 / 613 / 2	Gowsar Mubina.S	FEMALE	1989-10-08 01:00:00-04	26	Wife	f	Married	DTED	\N	f	t	t	795	f	f		\N	f	House Wife	Local	f		0
2709	1	1	7	ER / 0001 / 613 / 3	Syed Anas.S	MALE	2013-10-08 01:00:00-04	2	Son	f	Single	N	\N	f	t	f	795	f	f		\N	f	N	Local	f		0
2710	1	1	7	ER / 0001 / 614 / 1	A.Abdul Rhaman	MALE	1954-10-08 01:00:00-05	61	family head	t	Married	N	\N	f	t	t	796	f	f		\N	f	Pon Sales	Local	f		0
2711	1	1	7	ER / 0001 / 614 / 2	A.Aameen	FEMALE	1964-10-08 01:00:00-04	51	Wife	f	Married	5'th	\N	f	t	t	796	f	f		\N	f	House Wife	Local	f		0
2712	1	1	7	ER / 0001 / 614 / 3	A.Abdul khader	MALE	1985-10-08 01:00:00-04	30	Son	f	Married	6'th	\N	f	t	t	796	f	f		\N	f	Panchar shope	Local	f		0
2713	1	1	7	ER / 0001 / 614 / 4	A.Aasina	FEMALE	1989-10-08 01:00:00-04	26	.Daughter Law	f	Married	7'th	\N	f	t	f	796	f	f		\N	f	House Wife	Local	f		0
2714	1	1	7	ER / 0001 / 614 / 5	A.Arsath	MALE	2012-10-08 01:00:00-04	3	Grand Son	f	Single	N	\N	f	t	f	796	f	f		\N	f	N	Local	f		0
2715	1	1	7	ER / 0001 / 615 / 1	B.Masthan	MALE	1952-10-08 01:00:00-05	63	family head	t	Married	N	\N	f	t	t	797	f	f		\N	f	labour	Local	f		0
2716	1	1	7	ER / 0001 / 615 / 2	M.Aamen	FEMALE	1956-10-08 01:00:00-04	59	Wife	f	Married	N	\N	f	t	t	797	f	f		\N	f	House Wife	Local	f		0
2717	1	1	7	ER / 0001 / 615 / 3	M.Saleem	MALE	1975-10-08 01:00:00-04	40	Son	f	Married	7'th	\N	f	t	t	797	f	f		\N	f	Painter	Local	f		0
2718	1	1	7	ER / 0001 / 615 / 4	M.Feroj Bagam	FEMALE	1987-10-08 01:00:00-04	28	Daughter	f	Aged Unmarried Woman	M.com	\N	f	t	t	797	f	f		\N	f	Student	Local	f		0
2719	1	1	7	ER / 0001 / 616 / 1	P.S. Basha	MALE	1954-10-08 01:00:00-05	61	family head	t	Married	3rd	\N	f	t	t	798	f	f		\N	f	Tobaco Sales	Local	f		0
2720	1	1	7	ER / 0001 / 616 / 2	B.Suriya Bagam	FEMALE	1964-10-08 01:00:00-04	51	Wife	f	Married	2nd	\N	f	t	t	798	f	f		\N	f	House Wife	Local	f		0
2721	1	1	7	ER / 0001 / 616 / 3	B.Emran	MALE	1987-10-08 01:00:00-04	28	Son	f	Married	7'th	\N	f	t	t	798	f	f		\N	f	Froot sales	Local	f		0
2722	1	1	7	ER / 0001 / 616 / 4	E.Birkat Nisha	FEMALE	1992-10-08 01:00:00-04	23	.Daughter Law	f	Married	BSC	\N	f	t	t	798	f	f		\N	f	House Wife	Local	f		0
2723	1	1	7	ER / 0001 / 617 / 1	S.Mohammed Jakriya	MALE	1972-10-08 01:00:00-04	43	family head	t	Married	9'th	\N	f	t	t	799	f	f		\N	f	.Dry Fish sales	Local	f		0
2724	1	1	7	ER / 0001 / 617 / 2	M.Narkees Banu	FEMALE	1979-10-08 01:00:00-04	36	Wife	f	Married	5'th	\N	f	t	t	799	f	f		\N	f	House Wife	Local	f		0
2725	1	1	7	ER / 0001 / 617 / 3	M.Javagira Bagam	FEMALE	1998-10-08 01:00:00-04	17	Daughter	f	Single	11'th	\N	f	t	f	799	f	f		\N	f	Student	Local	f		0
2726	1	1	7	ER / 0001 / 617 / 4	M.Mujimil	MALE	2003-10-08 01:00:00-04	12	Son	f	Single	6'th	\N	f	t	f	799	f	f		\N	f	Student	Local	f		0
2727	1	1	7	ER / 0001 / 618 / 1	Syed Abdul Kadher	MALE	1960-10-08 01:00:00-04	55	family head	t	Married	Puc	\N	f	t	t	800	f	f		\N	f	Froot account	Local	f		0
2728	1	1	7	ER / 0001 / 618 / 2	Dilshat	FEMALE	1969-10-08 01:00:00-04	46	Wife	f	Married	9'th	\N	f	t	t	800	f	f		\N	f	House Wife	Local	f		0
2729	1	1	7	ER / 0001 / 618 / 3	Syed Abu Thagir	MALE	1991-10-08 01:00:00-04	24	Son	f	Single	Diplomo	\N	f	t	t	800	f	f		\N	f	Aircel office	Local	f		0
2730	1	1	7	ER / 0001 / 618 / 4	Syed ibrhim	MALE	2002-10-08 01:00:00-04	13	Son	f	Single	7'th	\N	f	t	f	800	f	f		\N	f	Student	Local	f		0
2732	1	1	7	ER / 0001 / 619 / 2	Ragamath Bagam	FEMALE	1962-10-08 01:00:00-04	53	Wife	f	Married	5'th	\N	f	t	t	801	f	f		\N	f	.hotel Business	Local	f		0
2733	1	1	7	ER / 0001 / 619 / 3	Abdul Rahaman	MALE	1990-10-08 01:00:00-04	25	Son	f	Married	SSLC	\N	f	t	t	801	f	f		\N	f	.hotel Business	Local	f		0
2734	1	1	7	ER / 0001 / 619 / 4	Sakira	FEMALE	1992-10-08 01:00:00-04	23	.Daughter Law	f	Married	SSLC	\N	f	t	t	801	f	f		\N	f	.hotel Business	Local	f		0
2735	1	1	7	ER / 0001 / 619 / 5	Mohammed Imthiyas 	MALE	2008-10-08 01:00:00-04	7	.grand daughter	f	Single	1'st	\N	f	t	f	801	f	f		\N	f	Student	Local	f		0
2736	1	1	7	ER / 0001 / 619 / 6	Anis fathima	FEMALE	2011-10-08 01:00:00-04	4	Grand Son	f	Single	N	\N	f	t	f	801	f	f		\N	f	N	Local	f		0
2737	1	1	7	ER / 0001 / 620 / 1	Hajimudeen	MALE	1967-10-08 01:00:00-04	48	family head	t	Married	SSLC	\N	f	t	t	802	f	f		\N	f	Cookin contractor	Local	f		0
2738	1	1	7	ER / 0001 / 620 / 2	Faritha Bagam	FEMALE	1978-10-08 01:00:00-04	37	Wife	f	Married	SSLC	\N	f	t	t	802	f	f		\N	f	House Wife	Local	f		0
2739	1	1	7	ER / 0001 / 620 / 3	Kadher Mydeen	MALE	1990-10-08 01:00:00-04	25	Son	f	Single	8'th	\N	f	t	f	802	f	f		\N	f	Driver	Local	f		0
2740	1	1	7	ER / 0001 / 620 / 4	Nasurdeen	MALE	2002-10-08 01:00:00-04	13	Son	f	Single	7'th	\N	f	t	f	802	f	f		\N	f	Student	Local	f		0
2741	1	1	7	ER / 0001 / 620 / 5	Ayisha Sideq	FEMALE	2003-10-08 01:00:00-04	12	Daughter	f	Single	6'th	\N	f	t	f	802	f	f		\N	f	Student	Local	f		0
2742	1	1	7	ER / 0001 / 620 / 6	Nageer	MALE	1974-10-08 01:00:00-04	41	.Son in Law	f	Single	SSLC	\N	f	t	f	802	f	f		\N	f	N	Local	f		0
2743	1	1	7	ER / 0001 / 621 / 1	M.Ameen	MALE	1954-10-08 01:00:00-05	61	family head	t	Married	SSLC	\N	f	t	t	803	f	f		\N	f	.Security	Local	f		0
2744	1	1	7	ER / 0001 / 621 / 2	Amma Ponu	FEMALE	1964-10-08 01:00:00-04	51	Wife	f	Married	6'th	\N	f	t	t	803	f	f		\N	f		Local	f		0
2745	1	1	7	ER / 0001 / 621 / 3	A.Kaja Mydeen	MALE	1988-10-08 01:00:00-04	27	Son	f	Single	SSLC	\N	f	t	t	803	f	f		\N	f	Tailor	Local	f		0
2746	1	1	7	ER / 0001 / 621 / 4	A.Nasar	MALE	1991-10-08 01:00:00-04	24	Son	f	Single	SSLC	\N	f	t	f	803	f	f		\N	f	Driver	Local	f		0
2747	1	1	7	ER / 0001 / 622 / 1	Moideen	MALE	1964-10-08 01:00:00-04	51	family head	t	Married	N	\N	f	t	t	804	f	f		\N	f	Painter	Local	f		0
2748	1	1	7	ER / 0001 / 622 / 2	Pathur Nisha	FEMALE	1969-10-08 01:00:00-04	46	Wife	f	Married	N	\N	f	t	t	804	f	f		\N	f	labour	Local	f		0
2749	1	1	7	ER / 0001 / 622 / 3	Sadam Usian	MALE	1990-10-08 01:00:00-04	25	Son	f	Single	8'th	\N	f	t	t	804	f	f		\N	f	labour	Local	f		0
2750	1	1	7	ER / 0001 / 622 / 4	Fyroze	FEMALE	1995-10-08 01:00:00-04	20	Daughter	f	Single	BSC	\N	f	t	f	804	f	f		\N	f	Student	Local	f		0
2751	1	1	7	ER / 0001 / 623 / 1	A.Sikender Ali	MALE	1979-10-08 01:00:00-04	36	Son	t	Married	SSLC	\N	f	t	t	805	f	f		\N	f	Tailor	Local	f		0
2752	1	1	7	ER / 0001 / 623 / 2	S.Narkees	FEMALE	1984-10-08 01:00:00-04	31	.Daughter Law	f	Married	BBM	\N	f	t	t	805	f	f		\N	f	House Wife	Local	f		0
2753	1	1	7	ER / 0001 / 623 / 3	S.Imran	MALE	2010-10-08 01:00:00-04	5	.grand son	f	Single	4'th	\N	f	t	f	805	f	f		\N	f	Student	Local	f		0
2754	1	1	7	ER / 0001 / 623 / 4	E.B.Anvar Ali	MALE	1949-10-08 01:00:00-05	66	family head	f	Married	SSLC	\N	f	t	t	805	f	f		\N	f	Tailor	Local	f		0
2755	1	1	7	ER / 0001 / 623 / 5	A.Noorjagan	FEMALE	1952-10-08 01:00:00-05	63	Wife	f	Married	"5""th"	\N	f	t	t	805	f	f		\N	f	House Wife	Local	f		0
2756	1	1	7	ER / 0001 / 624 / 1	A.Idayathulla	MALE	1973-10-08 01:00:00-04	42	family head	t	Married	Bcom	\N	f	t	t	806	f	f		\N	f	Froot sales	Local	f		0
2757	1	1	7	ER / 0001 / 624 / 2	E.Lila	FEMALE	1978-10-08 01:00:00-04	37	Wife	f	Married	7'th	\N	f	t	t	806	f	f		\N	f	House Wife	Local	f		0
2758	1	1	7	ER / 0001 / 624 / 3	E.Afreen	FEMALE	2002-10-08 01:00:00-04	13	Daughter	f	Single	7'th	\N	f	t	f	806	f	f		\N	f	Student	Local	f		0
2759	1	1	7	ER / 0001 / 624 / 4	E.Afsal	MALE	2005-10-08 01:00:00-04	10	Son	f	Single	3rd	\N	f	t	f	806	f	f		\N	f	Student	Local	f		0
2760	1	1	7	ER / 0001 / 625 / 1	S. Muthu Bava	MALE	1953-10-08 01:00:00-05	62	family head	t	Married	Puc	\N	f	t	t	807	f	f		\N	f	Bsnl/Ret	Local	f		0
2761	1	1	7	ER / 0001 / 625 / 2	K.Fyrose Banu	FEMALE	1962-10-08 01:00:00-04	53	Wife	f	Married	8'th	\N	f	t	t	807	f	f		\N	f	House Wife	Local	f		0
2762	1	1	7	ER / 0001 / 625 / 3	M.Nasar Ali	MALE	1987-10-08 01:00:00-04	28	Son	f	Single	M.sc	\N	f	t	t	807	f	f		\N	f	IBM/ Admin 	Local	f		0
2763	1	1	7	ER / 0001 / 625 / 4	M.Asha Banu	FEMALE	1990-10-08 01:00:00-04	25	Daughter	f	Single	M.com	\N	f	t	t	807	f	f		\N	f	N	Local	f		0
2764	1	1	7	ER / 0001 / 626 / 1	M.Mohammed hanifa	MALE	1959-10-08 01:00:00-04	56	family head	t	Married	N	\N	f	t	t	808	f	f		\N	f	Flower sales in cycle	Local	f		0
2765	1	1	7	ER / 0001 / 626 / 2	M.Ragamath Bevi	FEMALE	1974-10-08 01:00:00-04	41	Wife	f	Married	N	\N	f	t	t	808	f	f		\N	f	House Wife	Local	f		0
2766	1	1	7	ER / 0001 / 627 / 1	Shagul Hamid	MALE	1960-10-08 01:00:00-04	55	family head	t	Married	6'th	\N	f	t	t	809	f	f		\N	f	Tea Master	Local	f		0
2767	1	1	7	ER / 0001 / 627 / 2	Thaheru Nesha	FEMALE	1968-10-08 01:00:00-04	47	Wife	f	Married	5'th	\N	f	t	t	809	f	f		\N	f	House Wife	Local	f		0
2768	1	1	7	ER / 0001 / 627 / 3	Faysudeen	MALE	1991-10-08 01:00:00-04	24	Son	f	Single	SSLC	\N	f	t	t	809	f	f		\N	f	Froot gudown Account	Local	f		0
2769	1	1	7	ER / 0001 / 627 / 4	Mohammed Rafiq	MALE	1995-10-08 01:00:00-04	20	Son	f	Single	Bcom	\N	f	t	t	809	f	f		\N	f	Student	Local	f		0
2770	1	1	7	ER / 0001 / 628 / 1	Mohammed Suliman	MALE	1949-10-08 01:00:00-05	66	family head	t	Married	6'th	\N	f	t	t	810	f	f		\N	f	labour	Local	f		0
2771	1	1	7	ER / 0001 / 628 / 2	Janath Beev	FEMALE	1954-10-08 01:00:00-05	61	Wife	f	Married	5'th	\N	f	t	t	810	f	f		\N	f	House Wife	Local	f		0
2772	1	1	7	ER / 0001 / 628 / 3	Arribunisha	FEMALE	1981-10-08 01:00:00-04	34	Daughter	f	Single	12'th	\N	f	t	f	810	f	f		\N	f	N	Local	f		0
2773	1	1	7	ER / 0001 / 628 / 4	Mohammed Mustafa	MALE	1983-10-08 01:00:00-04	32	Son	f	Single	12'th	\N	f	t	t	810	f	f		\N	f	labour	Local	f		0
2774	1	1	7	ER / 0001 / 628 / 5	Thahera Phathima	FEMALE	1986-10-08 01:00:00-04	29	Daughter	f	Single	12'th	\N	f	t	t	810	f	f		\N	f	N	Local	f		0
2775	1	1	7	ER / 0001 / 628 / 6	Mohammed Irshath	MALE	1988-10-08 01:00:00-04	27	Son	f	Single	BE	\N	f	t	t	810	f	f		\N	f	Web desiner	Local	f		0
2776	1	1	7	ER / 0001 / 176 / 1	Hithathull	MALE	1946-09-08 01:00:00-04	69	Father	t	Married	5 Std	\N	f	t	t	811	f	f		\N	f	Rest	Local	f		0
2777	1	1	7	ER / 0001 / 176 / 2	Jeenath	FEMALE	1958-09-08 01:00:00-04	57	Mother	f	Married	8 Std	\N	f	t	t	811	f	f		\N	f	Home Maker	Local	f		0
2778	1	1	7	ER / 0001 / 176 / 3	Mohamed Rafiq	MALE	1983-09-08 01:00:00-04	32	Son	f	Single	10 Std	\N	f	t	t	811	f	f		\N	f	Driver	Local	f		0
2779	1	1	7	ER / 0001 / 176 / 4	Haribu	MALE	1988-09-08 01:00:00-04	27	Son	f	Single	PG	\N	f	t	t	811	f	f		\N	f	Search Job	Local	f		0
2780	1	1	7	ER / 0001 / 176 / 5	Rabiya	FEMALE	1990-09-08 01:00:00-04	25	Daugter	f	Single	PG	\N	f	t	f	811	f	f		\N	f	Search Job	Local	f		0
2781	1	1	7	ER / 0001 / 176 / 6	Nasid Mohamed	MALE	2010-09-08 01:00:00-04	5	Son	f	Single	LKG	\N	f	t	f	811	f	f		\N	f	Student	Local	f		0
2782	1	1	7	ER / 0001 / 177 / 1	Alavudin	MALE	1965-09-08 01:00:00-04	50	Father	t	Married	6 Std	\N	f	t	t	812	f	f		\N	f	Fruit Saler	Local	f		0
2783	1	1	7	ER / 0001 / 177 / 2	Rajiya	FEMALE	1978-09-08 01:00:00-04	37	Mother	f	Married	5 Std	\N	f	t	t	812	f	f		\N	f	Know Tailoring	Local	f		0
2784	1	1	7	ER / 0001 / 177 / 3	Shajahan	MALE	1995-09-08 01:00:00-04	20	Son	f	Single	10 Std	\N	f	t	f	812	f	f		\N	f	Helping Father	Local	f		0
2785	1	1	7	ER / 0001 / 178 / 1	Abdull	MALE	1944-09-08 01:00:00-04	71	Father	t	Married		\N	f	t	t	813	f	f		\N	f	Rest	Local	f		0
2786	1	1	7	ER / 0001 / 178 / 2	Haminathu Nisha	FEMALE	1954-09-08 01:00:00-04	61	Mother	f	Married	3 Std	\N	f	t	t	813	f	f		\N	f	Home Maker	Local	f		0
2787	1	1	7	ER / 0001 / 179 / 1	Kadar Moidin	MALE	1993-09-08 01:00:00-04	22	Father	t	Married	7 Std	\N	f	t	t	814	f	f		\N	f	Work Shop	Local	f		0
2788	1	1	7	ER / 0001 / 179 / 2	Shakila Banu	FEMALE	1994-09-08 01:00:00-04	21	Mother	f	Married	EEE	\N	f	t	t	814	f	f		\N	f	Student	Local	f		0
2789	1	1	7	ER / 0001 / 179 / 3	Ibrahim	MALE	2012-09-08 01:00:00-04	3	Son	f	Single		\N	f	t	f	814	f	f		\N	f	Baby	Local	f		0
2790	1	1	7	ER / 0001 / 180 / 1	shareef	MALE	1954-09-08 01:00:00-04	61	Father	t	Married		\N	f	t	t	815	f	f		\N	f	Rest	Local	f		0
2791	1	1	7	ER / 0001 / 180 / 2	Saina Bevi	FEMALE	1974-09-08 01:00:00-04	41	Mother	f	Married		\N	f	t	t	815	f	f		\N	f	Cooker	Local	f		0
2792	1	1	7	ER / 0001 / 180 / 3	Safiq	MALE	1996-09-08 01:00:00-04	19	Son	f	Single	9 Std	\N	f	t	t	815	f	f		\N	f	Petrol Bank Worker	Local	f		0
2793	1	1	7	ER / 0001 / 181 / 1	Thajdin	MALE	1984-09-08 01:00:00-04	31	Father	t	Married	5 Std	\N	f	t	t	816	f	f		\N	f	Bakari	Local	f		0
2794	1	1	7	ER / 0001 / 181 / 2	Ummu Hani	FEMALE	1986-09-08 01:00:00-04	29	Mother	f	Married	8 Std	\N	f	t	t	816	f	f		\N	f	Know Tailoring	Local	f		0
2795	1	1	7	ER / 0001 / 181 / 3	Riyaz	MALE	2007-09-08 01:00:00-04	8	Son	f	Single	2 Std	\N	f	t	f	816	f	f		\N	f	Student	Local	f		0
2796	1	1	7	ER / 0001 / 181 / 4	Ajmal	MALE	2010-09-08 01:00:00-04	5	Son	f	Single		\N	f	t	f	816	f	f		\N	f	Baby	Local	f		0
2797	1	1	7	ER / 0001 / 182 / 1	Mohamed Iqbal	MALE	1969-09-08 01:00:00-04	46	Father	t	Married		\N	f	t	t	817	f	f		\N	f	Cooli	Local	f		0
2798	1	1	7	ER / 0001 / 182 / 2	Haleema	FEMALE	1971-09-08 01:00:00-04	44	Mother	f	Married	6 Std	\N	f	t	t	817	f	f		\N	f	Home Maker	Local	f		0
2799	1	1	7	ER / 0001 / 182 / 3	Azarudin	MALE	1995-09-08 01:00:00-04	20	Son	f	Single	UG	\N	f	t	f	817	f	f		\N	f	Student	Local	f		0
2800	1	1	7	ER / 0001 / 183 / 1	Basha	MALE	1977-09-08 01:00:00-04	38	Father	t	Married	8 Std	\N	f	t	t	818	f	f		\N	f	Cooli	Local	f		0
2801	1	1	7	ER / 0001 / 183 / 2	Rahamath	FEMALE	1982-09-08 01:00:00-04	33	Mother	f	Married	5 Std	\N	f	t	t	818	f	f		\N	f	Tailoer	Local	f		0
2802	1	1	7	ER / 0001 / 183 / 3	Mohamed Aharath	MALE	2000-09-08 01:00:00-04	15	Son	f	Single	10 Std	\N	f	t	f	818	f	f		\N	f	Student	Local	f		0
2803	1	1	7	ER / 0001 / 184 / 1	Mumthaj	FEMALE	1964-09-08 01:00:00-04	51	Mother	t	Widow	5 Std	\N	f	t	t	819	f	f		\N	f	Home Maker	Local	f		0
2804	1	1	7	ER / 0001 / 184 / 2	Shahul Hameed	MALE	1984-09-08 01:00:00-04	31	Son	f	Married	10 Std	\N	f	t	t	819	f	f		\N	f	Cooli	Local	f		0
2805	1	1	7	ER / 0001 / 184 / 3	afrose	FEMALE	1991-09-08 01:00:00-04	24	Dau.In.Law	f	Married	12 Std	\N	f	t	f	819	f	f		\N	f	Home Maker	Local	f		0
2806	1	1	7	ER / 0001 / 184 / 4	Mohamed Shiban	MALE	2011-09-08 01:00:00-04	4	G.Son	f	Single		\N	f	t	f	819	f	f		\N	f	Baby	Local	f		0
2807	1	1	7	ER / 0001 / 185 / 1	Asen	MALE	1975-09-08 01:00:00-04	40	Father	t	Married	10 Std	\N	f	t	t	820	f	f		\N	f	Tea vShop	Local	f		0
2808	1	1	7	ER / 0001 / 185 / 2	Kamarun Nisha	FEMALE	1980-09-08 01:00:00-04	35	Mother	f	Married	12 Std	\N	f	t	t	820	f	f		\N	f	Know Tailoring	Local	f		0
2809	1	1	7	ER / 0001 / 185 / 3	Navfila	FEMALE	2001-09-08 01:00:00-04	14	Daugter	f	Single	9 Std	\N	f	t	f	820	f	f		\N	f	Student	Local	f		0
2810	1	1	7	ER / 0001 / 185 / 4	Nasira	FEMALE	2008-09-08 01:00:00-04	7	Daugter	f	Single	2 Std	\N	f	t	f	820	f	f		\N	f	Student	Local	f		0
2811	1	1	7	ER / 0001 / 186 / 1	Jinath Nisha	FEMALE	1969-09-08 01:00:00-04	46	Mother	t	Widow		\N	f	t	t	821	f	f		\N	f	Tex Work	Local	f		0
2812	1	1	7	ER / 0001 / 186 / 2	Basariya	FEMALE	1992-09-08 01:00:00-04	23	Daugter	f	Single	UG	\N	f	t	t	821	f	f		\N	f	Company Work	Local	f		0
2813	1	1	7	ER / 0001 / 186 / 3	Fathima Benasir	FEMALE	1993-09-08 01:00:00-04	22	Daugter	f	Single	UG	\N	f	t	t	821	f	f		\N	f	Student	Local	f		0
2814	1	1	7	ER / 0001 / 186 / 4	Asiyama	FEMALE	1947-09-08 01:00:00-04	68	G	f	Single		\N	f	t	f	821	f	f		\N	f		Local	f		0
2815	1	1	7	ER / 0001 / 187 / 1	Kaja	MALE	1969-09-08 01:00:00-04	46	Father	t	Married	5 Std	\N	f	t	t	822	f	f		\N	f	Xerox Worker	Local	f		0
2816	1	1	7	ER / 0001 / 187 / 2	thiba Begam	FEMALE	1975-09-08 01:00:00-04	40	Mother	f	Married	7 Std	\N	f	t	t	822	f	f		\N	f	Home Maker	Local	f		0
2817	1	1	7	ER / 0001 / 187 / 3	Badurudin Ahmed	MALE	1994-09-08 01:00:00-04	21	Son	f	Single	DME	\N	f	t	t	822	f	f		\N	f	Xerox Worker	Local	f		0
2818	1	1	7	ER / 0001 / 187 / 4	Fathima Begam	FEMALE	1995-09-08 01:00:00-04	20	Daugter	f	Single	12 Std	\N	f	t	t	822	f	f		\N	f	Search Job	Local	f		0
2819	1	1	7	ER / 0001 / 188 / 1	abdul Rajaq	MALE	1966-09-08 01:00:00-04	49	Father	t	Married	4 Std	\N	f	t	t	823	f	f		\N	f	Biriyani Worker	Local	f		0
2820	1	1	7	ER / 0001 / 188 / 2	saitha Banu	FEMALE	1969-09-08 01:00:00-04	46	Mother	f	Married		\N	f	t	t	823	f	f		\N	f	Home Maker	Local	f		0
2821	1	1	7	ER / 0001 / 188 / 3	sara Bevi	FEMALE	1992-09-08 01:00:00-04	23	Daugter	f	Single	PG	\N	f	t	t	823	f	f		\N	f	Student	Local	f		0
2822	1	1	7	ER / 0001 / 188 / 4	Habiya Bevi	FEMALE	1939-09-08 01:00:00-04	76	G	f	Single		\N	f	t	f	823	f	f		\N	f		Local	f		0
2823	1	1	7	ER / 0001 / 189 / 1	azad	MALE	1969-09-08 01:00:00-04	46	Father	t	Married	5 Std	\N	f	t	t	824	f	f		\N	f	Seat Kawar Work	Local	f		0
2824	1	1	7	ER / 0001 / 189 / 2	Ramija	FEMALE	1974-09-08 01:00:00-04	41	Mother	f	Married	3 Std	\N	f	t	t	824	f	f		\N	f	Home Maker	Local	f		0
2825	1	1	7	ER / 0001 / 189 / 3	Fathima Parveen	FEMALE	1995-09-08 01:00:00-04	20	Daugter	f	Single	10 Std	\N	f	t	t	824	f	f		\N	f		Local	f		0
2826	1	1	7	ER / 0001 / 189 / 4	Mohamed Yasin	MALE	1996-09-08 01:00:00-04	19	Son	f	Single	8 Std	\N	f	t	f	824	f	f		\N	f	Seat Kawar Work	Local	f		0
2827	1	1	7	ER / 0001 / 190 / 1	Shahul Hameed	MALE	1982-09-08 01:00:00-04	33	Father	t	Married	10 Std	\N	f	t	t	825	f	f		\N	f	Cooli	Local	f		0
2828	1	1	7	ER / 0001 / 190 / 2	Sabira Begam	FEMALE	1986-09-08 01:00:00-04	29	Mother	f	Aged Unmarried Woman	10 Std	\N	f	t	t	825	f	f		\N	f	Know Tailoring	Local	f		0
2829	1	1	7	ER / 0001 / 190 / 3	sanofer	FEMALE	2008-09-08 01:00:00-04	7	Daugter	f	Single	1 Std	\N	f	t	f	825	f	f		\N	f	Student	Local	f		0
2830	1	1	7	ER / 0001 / 190 / 4	Sahid	MALE	2010-09-08 01:00:00-04	5	Son	f	Single	LKG	\N	f	t	f	825	f	f		\N	f	Student	Local	f		0
2831	1	1	7	ER / 0001 / 190 / 5	Sohar Banu	FEMALE	1963-09-08 01:00:00-04	52	G.Mother	f	Widow		\N	f	t	t	825	f	f		\N	f	Home Maker	Local	f		0
2832	1	1	7	ER / 0001 / 191 / 1	Thajdin	MALE	1950-09-08 01:00:00-04	65	Father	t	Married	10 Std	\N	f	t	t	826	f	f		\N	f	Rest	Local	f		0
2833	1	1	7	ER / 0001 / 191 / 2	Jarina Banu	FEMALE	1961-09-08 01:00:00-04	54	Mother	f	Married	7 Std	\N	f	t	t	826	f	f		\N	f	Rest	Local	f		0
2834	1	1	7	ER / 0001 / 191 / 3	Nijamudin	MALE	1984-09-08 01:00:00-04	31	Son	f	Married	UG	\N	f	t	t	826	f	f		\N	f	Gold Maker	Local	f		0
2835	1	1	7	ER / 0001 / 191 / 4	Jaina Be	FEMALE	1991-09-08 01:00:00-04	24	Dau.In.Law	f	Married	UG	\N	f	t	t	826	f	f		\N	f	Home Maker	Local	f		0
2836	1	1	7	ER / 0001 / 191 / 5	samavath Fathima	FEMALE	2013-09-08 01:00:00-04	2	G.Daugter	f	Aged Unmarried Woman		\N	f	t	f	826	f	f		\N	f	Baby	Local	f		0
2837	1	1	7	ER / 0001 / 191 / 6	Salimudin	MALE	1987-09-08 01:00:00-04	28	Son	f	Single	UG	\N	f	t	t	826	f	f		\N	f	Gold Maker	Local	f		0
2838	1	1	7	ER / 0001 / 192 / 1	Raja Mohamed	MALE	1984-09-08 01:00:00-04	31	Father	t	Married	4 Std	\N	f	t	t	827	f	f		\N	f	Tea Master	Local	f		0
2839	1	1	7	ER / 0001 / 192 / 2	surja	FEMALE	1985-09-08 01:00:00-04	30	Mother	f	Married	7 Std	\N	f	t	t	827	f	f		\N	f	Home Maker	Local	f		0
2840	1	1	7	ER / 0001 / 192 / 3	sana Nasrin	FEMALE	2006-09-08 01:00:00-04	9	Daugter	f	Single	2 Std	\N	f	t	f	827	f	f		\N	f	Student	Local	f		0
2841	1	1	7	ER / 0001 / 192 / 4	Mohamed Sahal	MALE	2010-09-08 01:00:00-04	5	Son	f	Single	LKG	\N	f	t	f	827	f	f		\N	f	Student	Local	f		0
2842	1	1	7	ER / 0001 / 193 / 1	anwar Basha	MALE	1978-09-08 01:00:00-04	37	Father	t	Married	8 Std	\N	f	t	t	828	f	f		\N	f	Painter	Local	f		0
2843	1	1	7	ER / 0001 / 193 / 2	Sharmila Banu	FEMALE	1982-09-08 01:00:00-04	33	Mother	f	Married	5 Std	\N	f	t	t	828	f	f		\N	f	Home Maker	Local	f		0
2844	1	1	7	ER / 0001 / 193 / 3	Mohamed Malik	MALE	2008-09-08 01:00:00-04	7	Son	f	Single	1 Std	\N	f	t	f	828	f	f		\N	f	Student	Local	f		0
2845	1	1	7	ER / 0001 / 193 / 4	Asma Fathima	FEMALE	2010-09-08 01:00:00-04	5	Daugter	f	Single		\N	f	t	f	828	f	f		\N	f	Baby	Local	f		0
2846	1	1	7	ER / 0001 / 194 / 1	Ibrahim	MALE	1967-09-08 01:00:00-04	48	Father	t	Married		\N	f	t	t	829	f	f		\N	f	Machanic	Local	f		0
2847	1	1	7	ER / 0001 / 194 / 2	Maharaj Banu	FEMALE	1977-09-08 01:00:00-04	38	Mother	f	Married		\N	f	t	t	829	f	f		\N	f	Home Maker	Local	f		0
2848	1	1	7	ER / 0001 / 194 / 3	Ribana Parveen	FEMALE	2000-09-08 01:00:00-04	15	Daugter	f	Single	10 Std	\N	f	t	f	829	f	f		\N	f	Student	Local	f		0
2849	1	1	7	ER / 0001 / 194 / 4	abuthahir	MALE	2001-09-08 01:00:00-04	14	Son	f	Single	9 Std	\N	f	t	f	829	f	f		\N	f	Student	Local	f		0
2850	1	1	7	ER / 0001 / 194 / 5	akbar	MALE	2003-09-08 01:00:00-04	12	Son	f	Single	6 Std	\N	f	t	f	829	f	f		\N	f	Student	Local	f		0
2851	1	1	7	ER / 0001 / 195 / 1	Basheer	MALE	1969-09-08 01:00:00-04	46	Father	t	Married		\N	f	t	t	830	f	f		\N	f	Auto Driver	Local	f		0
2852	1	1	7	ER / 0001 / 195 / 2	Anasar Kali	FEMALE	1979-09-08 01:00:00-04	36	Mother	f	Married		\N	f	t	t	830	f	f		\N	f	Home Maker	Local	f		0
2853	1	1	7	ER / 0001 / 195 / 3	Mohamed Haris	MALE	1994-09-08 01:00:00-04	21	Son	f	Single	UG	\N	f	t	f	830	f	f		\N	f	Student	Local	f		0
2854	1	1	7	ER / 0001 / 195 / 4	anwar Basha	MALE	1997-09-08 01:00:00-04	18	Son	f	Single	12 Std	\N	f	t	f	830	f	f		\N	f	Student	Local	f		0
2855	1	1	7	ER / 0001 / 196 / 1	Kaibar	MALE	1967-09-08 01:00:00-04	48	Father	t	Married	10 Std	\N	f	t	t	831	f	f		\N	f	Cooli	Local	f		0
2856	1	1	7	ER / 0001 / 196 / 2	Ramja Begam	FEMALE	1979-09-08 01:00:00-04	36	Mother	f	Married	8 Std	\N	f	t	t	831	f	f		\N	f	Business	Local	f		0
2857	1	1	7	ER / 0001 / 196 / 3	Mohamed Basith	MALE	1994-09-08 01:00:00-04	21	Son	f	Single	UG	\N	f	t	t	831	f	f		\N	f	Student	Local	f		0
2858	1	1	7	ER / 0001 / 196 / 4	Mohamed Rahman	MALE	1999-09-08 01:00:00-04	16	Son	f	Single	10 Std	\N	f	t	f	831	f	f		\N	f	Student	Local	f		0
2859	1	1	7	ER / 0001 / 197 / 1	Jalaal	MALE	1965-09-08 01:00:00-04	50	Father	t	Married		\N	f	t	t	832	f	f		\N	f	Rest	Local	f		0
2860	1	1	7	ER / 0001 / 197 / 2	Rajiya	FEMALE	1972-09-08 01:00:00-04	43	Mother	f	Married		\N	f	t	t	832	f	f		\N	f	Home Maker	Local	f		0
2861	1	1	7	ER / 0001 / 197 / 3	Thilsath	MALE	1996-09-08 01:00:00-04	19	Daugter	f	Single	12 Std	\N	f	t	f	832	f	f		\N	f	Rest	Local	f		0
2862	1	1	7	ER / 0001 / 197 / 4	Shakira Banu	FEMALE	1997-09-08 01:00:00-04	18	Daugter	f	Single	!2 Std	\N	f	t	f	832	f	f		\N	f	Rest	Local	f		0
2863	1	1	7	ER / 0001 / 197 / 5	ashik	MALE	1999-09-08 01:00:00-04	16	Son	f	Single	9 Std	\N	f	t	f	832	f	f		\N	f	rediyeter	Local	f		0
2864	1	1	7	ER / 0001 / 198 / 1	saleem	MALE	1956-09-08 01:00:00-04	59	Father	t	Married	8 Std	\N	f	t	t	833	f	f		\N	f	Rest	Local	f		0
2865	1	1	7	ER / 0001 / 198 / 2	Najmun Nisha	FEMALE	1965-09-08 01:00:00-04	50	Mother	f	Married	3 Std	\N	f	t	t	833	f	f		\N	f	Rest	Local	f		0
2866	1	1	7	ER / 0001 / 198 / 3	Mohamed Iqbal	MALE	1985-09-08 01:00:00-04	30	Son	f	Single	10 Std	\N	f	t	t	833	f	f		\N	f	Cell shop	Local	f		0
2867	1	1	7	ER / 0001 / 198 / 4	Mohamed Yunus	MALE	1987-09-08 01:00:00-04	28	Son	f	Single	10 Std	\N	f	t	t	833	f	f		\N	f	Cell shop	Local	f		0
2868	1	1	7	ER / 0001 / 199 / 1	Abdul Sathar	MALE	1959-09-08 01:00:00-04	56	Father	t	Married	4 Std	\N	f	t	t	834	f	f		\N	f	Petty Shop	Local	f		0
2869	1	1	7	ER / 0001 / 199 / 2	sakar Banu	FEMALE	1968-09-08 01:00:00-04	47	Mother	f	Married	6 Std	\N	f	t	t	834	f	f		\N	f	Home Maker	Local	f		0
2870	1	1	7	ER / 0001 / 199 / 3	Kaja Moideen	MALE	1987-09-08 01:00:00-04	28	Son	f	Married	UG	\N	f	t	t	834	f	f		\N	f	Computer Eng	Local	f		0
2871	1	1	7	ER / 0001 / 199 / 4	Anees Fathima	FEMALE	1990-09-08 01:00:00-04	25	Dau.In.Law	f	Married	UG	\N	f	t	t	834	f	f		\N	f	Home Maker	Local	f		0
2872	1	1	7	ER / 0001 / 200 / 1	Rafiq	MALE	1975-09-08 01:00:00-04	40	Father	t	Married	10 Std	\N	f	t	t	835	f	f		\N	f	Auto Driver	Local	f		0
2873	1	1	7	ER / 0001 / 200 / 2	Amina	FEMALE	1979-09-08 01:00:00-04	36	Mother	f	Married	5 Std	\N	f	t	t	835	f	f		\N	f	Home Maker	Local	f		0
2874	1	1	7	ER / 0001 / 200 / 3	Jainab Fathima	FEMALE	2007-09-08 01:00:00-04	8	Daugter	f	Single	1 Std	\N	f	t	f	835	f	f		\N	f	Student	Local	f		0
2875	1	1	7	ER / 0001 / 200 / 4	Mohamed Asif	MALE	2011-09-08 01:00:00-04	4	Son	f	Single		\N	f	t	f	835	f	f		\N	f	Baby	Local	f		0
2876	1	1	7	ER / 0001 / 200 / 5	Thahirun Nisha	FEMALE	1949-09-08 01:00:00-04	66	G	f	Single		\N	f	t	f	835	f	f		\N	f		Local	f		0
2886	1	1	7	ER / 0001 / 689 / 3	mohammed Ismail	MALE	1988-10-08 01:00:00-04	27	Son	f	Single	BE	\N	f	t	t	839	f	f		\N	f	Engener	Local	f		0
2887	1	1	7	ER / 0001 / 689 / 4	Yesmath yasmeen	FEMALE	1988-10-08 01:00:00-04	27	Dougther	f	Single	MBA	\N	f	t	t	839	f	f		\N	f	.Home	Local	f		0
2877	1	1	7	ER / 0001 / 686 / 		MALE	2014-10-08 01:00:00-04	1		f	Single		\N	f	t	f	836	f	f		\N	f		Local	f		0
2878	1	1	7	ER / 0001 / 687 / 1	M.Kader Moideen	MALE	1973-10-08 01:00:00-04	42	Head	t	Married	B.com	\N	f	t	t	837	f	f		\N	f	.Home	Local	f		0
2879	1	1	7	ER / 0001 / 687 / 2	K.Rhamath Nish	FEMALE	1976-10-08 01:00:00-04	39	Wife	f	Married		\N	f	t	t	837	f	f		\N	f		Local	f		0
2880	1	1	7	ER / 0001 / 688 / 1	A.Kaibeer	MALE	1970-10-08 01:00:00-04	45	Head	t	Married	5	\N	f	t	t	838	f	f		\N	f	Tailor	Local	f		0
2881	1	1	7	ER / 0001 / 688 / 2	Noorjagan	MALE	1976-10-08 01:00:00-04	39	Wife	f	Married	5	\N	f	t	t	838	f	f		\N	f	Labour	Local	f		0
2882	1	1	7	ER / 0001 / 688 / 3	Sheik Abdul Madeen	MALE	1992-10-08 01:00:00-04	23	Dougther	f	Single	ECE	\N	f	t	t	838	f	f		\N	f	company	Local	f		0
2883	1	1	7	ER / 0001 / 688 / 4	Sheik Abdul Nishar	MALE	1996-10-08 01:00:00-04	19	Son	f	Single	9	\N	f	t	f	838	f	f		\N	f	.Sticker Shope	Local	f		0
2884	1	1	7	ER / 0001 / 689 / 1	Mohammed yakub	MALE	1956-10-08 01:00:00-04	59	Head	t	Married	Diplomo	\N	f	t	t	839	f	f		\N	f	Ret Civil	Local	f		0
2885	1	1	7	ER / 0001 / 689 / 2	Rahetha	FEMALE	1964-10-08 01:00:00-04	51	Wife	f	Married	SSLC	\N	f	t	t	839	f	f		\N	f	.Home	Local	f		0
2888	1	1	7	ER / 0001 / 689 / 5	Fathima beeve	FEMALE	1939-10-08 01:00:00-05	76	Grand mom	f	Married		\N	f	t	t	839	f	f		\N	f	.Home	Local	f		0
2889	1	1	7	ER / 0001 / 689 / 6	RahamathuLila	MALE	1960-10-08 01:00:00-04	55	Uncle	f	Married	SSLC	\N	f	t	t	839	f	f		\N	f	Vinding	Local	f		0
2890	1	1	7	ER / 0001 / 690 / 1	Abubakar	MALE	1960-11-08 01:00:00-05	55	Head	t	Married	SSLC	\N	f	t	t	840	f	f		\N	f	Manager	Local	f		0
2891	1	1	7	ER / 0001 / 690 / 2	Asrabunisha	FEMALE	1968-11-08 01:00:00-05	47	Wife	f	Married	BA	\N	f	t	t	840	f	f		\N	f	Teacher	Local	f		0
2892	1	1	7	ER / 0001 / 690 / 3	Almas Rosen Sobica	FEMALE	1992-11-08 01:00:00-05	23	Dougther	f	Single	Msc	\N	f	t	t	840	f	f		\N	f	Student	Local	f		0
2893	1	1	7	ER / 0001 / 690 / 4	Syed mugaideen	MALE	1996-11-08 01:00:00-05	19	Son	f	Single	BE	\N	f	t	f	840	f	f		\N	f	Student	Local	f		0
2894	1	1	7	ER / 0001 / 691 / 1	Noorjagan	FEMALE	1951-10-08 01:00:00-05	64	Head	t	Married	5	\N	f	t	t	841	f	f		\N	f	.Home	Local	f		0
2895	1	1	7	ER / 0001 / 691 / 2	ilyas	MALE	1985-08-08 01:00:00-04	30	Son	f	Married	BABL	\N	f	t	t	841	f	f		\N	f	Supervicer	Local	f		0
2896	1	1	7	ER / 0001 / 692 / 		MALE	2014-08-08 01:00:00-04	1		f	Single		\N	f	t	f	842	f	f		\N	f		Local	f		0
2931	1	1	7	ER / 0001 / 707 / 2	Shamshat Begam	FEMALE	1961-10-08 01:00:00-04	54	Wife	f	Married	8	\N	f	t	t	857	f	f		\N	f	House Wife	Local	f		0
2897	1	1	7	ER / 0001 / 693 / 		MALE	2014-10-08 01:00:00-04	1		f	Single		\N	f	t	f	843	f	f		\N	f		Local	f		0
2898	1	1	7	ER / 0001 / 694 / 1	Mohammed ilyas	MALE	1986-08-14 01:00:00-04	29	Head	t	Married	12	\N	f	t	t	844	f	f		\N	f	Shoes shope	Local	f		0
2899	1	1	7	ER / 0001 / 694 / 2	Sultana Safreen	FEMALE	1994-08-14 01:00:00-04	21	Wife	f	Married	Bcom	\N	f	t	t	844	f	f		\N	f	House Wife	Local	f		0
2900	1	1	7	ER / 0001 / 694 / 3	Mohammed Farook	MALE	1954-08-14 01:00:00-04	61	Father	f	Married	2	\N	f	t	t	844	f	f		\N	f	Ret 	Local	f		0
2901	1	1	7	ER / 0001 / 694 / 4	Fougeya Bagem	FEMALE	1962-08-14 01:00:00-04	53	mother	f	Married	8	\N	f	t	t	844	f	f		\N	f	House Wife	Local	f		0
2902	1	1	7	ER / 0001 / 695 / 1	K.Alla Pagash	MALE	1982-10-08 01:00:00-04	33	Head	t	Married	5	\N	f	t	f	845	f	f		\N	f	Paan sales	Local	f		0
2903	1	1	7	ER / 0001 / 695 / 2	Rahamathu Nisha.A	FEMALE	1984-10-08 01:00:00-04	31	Wife	f	Married	4	\N	f	t	f	845	f	f		\N	f	House Wife	Local	f		0
2904	1	1	7	ER / 0001 / 695 / 3	A.mohammed nafel	MALE	2000-10-08 01:00:00-04	15	Son	f	Single	9	\N	f	t	f	845	f	f		\N	f	Student	Local	f		0
2905	1	1	7	ER / 0001 / 695 / 4	A.Fasil	MALE	2001-10-08 01:00:00-04	14	Son	f	Single	7	\N	f	t	f	845	f	f		\N	f	Student	Local	f		0
2906	1	1	7	ER / 0001 / 696 / 		MALE	2014-10-08 01:00:00-04	1		f	Single		\N	f	t	f	846	f	f		\N	f		Local	f		0
2907	1	1	7	ER / 0001 / 697 / 1	S.Shaick Alavudeen bathusha	MALE	1986-10-08 01:00:00-04	29	Head	t	Married	6	\N	f	t	t	847	f	f		\N	f	Auto driver	Local	f		0
2908	1	1	7	ER / 0001 / 697 / 2	S.Shakena	FEMALE	1992-10-08 01:00:00-04	23	Wife	f	Married	SSLC	\N	f	t	f	847	f	f		\N	f	House Wife	Local	f		0
2909	1	1	7	ER / 0001 / 697 / 3	S.mohammed Cenan	MALE	2009-10-08 01:00:00-04	6	Son	f	Single	1	\N	f	t	f	847	f	f		\N	f	Student	Local	f		0
2910	1	1	7	ER / 0001 / 697 / 4	S.Jemana	FEMALE	2012-10-08 01:00:00-04	3	Dougther	f	Single		\N	f	t	f	847	f	f		\N	f		Local	f		0
2911	1	1	7	ER / 0001 / 698 / 1	Syed Fyrodeen	MALE	1966-10-08 01:00:00-04	49	Head	t	Married	Diplomo	\N	f	t	t	848	f	f		\N	f	Reyal Estate	Local	f		0
2912	1	1	7	ER / 0001 / 698 / 2	Jaren Taj	FEMALE	1974-10-08 01:00:00-04	41	Wife	f	Married	SSLC	\N	f	t	t	848	f	f		\N	f	House Wife	Local	f		0
2913	1	1	7	ER / 0001 / 698 / 3	Syed ismail	MALE	1996-10-08 01:00:00-04	19	Son	f	Single	SSLC	\N	f	t	f	848	f	f		\N	f	Supervicer	Local	f		0
2914	1	1	7	ER / 0001 / 698 / 4	Sumiya	FEMALE	2000-10-08 01:00:00-04	15	Dougther	f	Single	SSLC	\N	f	t	f	848	f	f		\N	f	Student	Local	f		0
2915	1	1	7	ER / 0001 / 699 / 1	S.Syed sujavudeen	MALE	1980-10-08 01:00:00-04	35	Head	t	Married	MBA	\N	f	t	t	849	f	f		\N	f	Manager	Local	f		0
2916	1	1	7	ER / 0001 / 699 / 2	A.Hamed Nisha	FEMALE	1982-10-08 01:00:00-04	33	Wife	f	Married	Msc	\N	f	t	t	849	f	f		\N	f	..HOD	Local	f		0
2917	1	1	7	ER / 0001 / 699 / 3	S.Thakasen Taj	FEMALE	2006-10-08 01:00:00-04	9	Dougther	f	Single	5	\N	f	t	f	849	f	f		\N	f	Student	Local	f		0
2932	1	1	7	ER / 0001 / 708 / 1	Mydeen Sha	MALE	1976-11-08 01:00:00-05	39	Head	t	Married		\N	f	t	t	858	f	f		\N	f	Labour	Local	f		0
2918	1	1	7	ER / 0001 / 700 / 		MALE	2014-10-08 01:00:00-04	1		f	Single		\N	f	t	f	850	f	f		\N	f		Local	f		0
2919	1	1	7	ER / 0001 / 701 / 1	Ibrahim Basha	MALE	1979-11-08 01:00:00-05	36	Head	t	Married	ITI	\N	f	t	t	851	f	f		\N	f	4 wealer work shope	Local	f		0
2920	1	1	7	ER / 0001 / 701 / 2	Shrmila	FEMALE	1982-11-08 01:00:00-05	33	Wife	f	Married		\N	f	t	t	851	f	f		\N	f	House Wife	Local	f		0
2921	1	1	7	ER / 0001 / 701 / 3	Ismath Nisha	FEMALE	2007-11-08 01:00:00-05	8	Dougther	f	Single		\N	f	t	f	851	f	f		\N	f	Student	Local	f		0
2922	1	1	7	ER / 0001 / 701 / 4	Kathiren	FEMALE	2013-11-08 01:00:00-05	2	Dougther	f	Single		\N	f	t	f	851	f	f		\N	f	kid	Local	f		0
2923	1	1	7	ER / 0001 / 702 / 1	P.Usanmall	FEMALE	1942-11-08 01:00:00-04	73	Head	t	Widow		\N	f	t	t	852	f	f		\N	f	Grean leaf sales	Local	f		0
2933	1	1	7	ER / 0001 / 708 / 2	Parveen	FEMALE	1988-11-08 01:00:00-05	27	Wife	f	Married	5	\N	f	t	t	858	f	f		\N	f	House Wife	Local	f		0
2934	1	1	7	ER / 0001 / 708 / 3	Ashraf Alli	MALE	2009-11-08 01:00:00-05	6	5	f	Single	2	\N	f	t	f	858	f	f		\N	f	Student	Local	f		0
2924	1	1	7	ER / 0001 / 703 / 		MALE	2014-11-08 01:00:00-05	1		f	Single		\N	f	t	f	853	f	f		\N	f		Local	f		0
2925	1	1	7	ER / 0001 / 704 / 1	Mohammed Ali	MALE	1959-11-08 01:00:00-05	56	Head	t	Married	3	\N	f	t	t	854	f	f		\N	f	Labour	Local	f		0
2926	1	1	7	ER / 0001 / 704 / 2	Pyari	FEMALE	1966-11-08 01:00:00-05	49	Wife	f	Married		\N	f	t	t	854	f	f		\N	f	House Wife	Local	f		0
2927	1	1	7	ER / 0001 / 705 / 		MALE	2014-11-08 01:00:00-05	1		f	Single		\N	f	t	f	855	f	f		\N	f		Local	f		0
2928	1	1	7	ER / 0001 / 706 / 1	Fathima Rahem	FEMALE	1937-11-08 01:00:00-05	78	Head	t	Married	SSLC	\N	f	t	t	856	f	f		\N	f	Ret/ G.servent	Local	f		0
2929	1	1	7	ER / 0001 / 706 / 2	Subytha Bevee	FEMALE	1967-11-08 01:00:00-05	48	Dougther	f	Married		\N	f	t	t	856	f	f		\N	f	.Home	Local	f		0
2930	1	1	7	ER / 0001 / 707 / 1	Mohammed Adham	MALE	1950-10-08 01:00:00-05	65	Head	t	Married	Bcom	\N	f	t	t	857	f	f		\N	f	Sudidhar center	Local	f		0
2935	1	1	7	ER / 0001 / 708 / 4	Subatha	FEMALE	2006-11-08 01:00:00-05	9	8	f	Single	8	\N	f	t	f	858	f	f		\N	f	Student	Local	f		0
2936	1	1	7	ER / 0001 / 709 / 		MALE	2014-11-08 01:00:00-05	1		f	Single		\N	f	t	f	859	f	f		\N	f		Local	f		0
2937	1	1	7	ER / 0001 / 710 / 		MALE	2014-11-08 01:00:00-05	1		f	Single		\N	f	t	f	860	f	f		\N	f		Local	f		0
2938	1	1	7	ER / 0001 / 711 / 1	Mohamme Basha	MALE	1968-11-08 01:00:00-05	47	Head	t	Married	6	\N	f	t	t	861	f	f		\N	f	painter	Local	f		0
2939	1	1	7	ER / 0001 / 711 / 2	Nrkes Begam	FEMALE	1978-11-08 01:00:00-05	37	Wife	f	Married		\N	f	t	t	861	f	f		\N	f	Labour	Local	f		0
2940	1	1	7	ER / 0001 / 711 / 3	Yasin Mohammed 	MALE	1995-11-08 01:00:00-05	20	Son	f	Single	ITI	\N	f	t	f	861	f	f		\N	f	Student	Local	f		0
2941	1	1	7	ER / 0001 / 711 / 4	Mubarak	MALE	1998-11-08 01:00:00-05	17	Son	f	Single	ITI	\N	f	t	f	861	f	f		\N	f	Student	Local	f		0
2942	1	1	7	ER / 0001 / 711 / 5	Navab	MALE	2000-11-08 01:00:00-05	15	Son	f	Single	9	\N	f	t	f	861	f	f		\N	f	Student	Local	f		0
2947	1	1	7	ER / 0001 / 715 / 2	Alima beve	FEMALE	1971-11-08 01:00:00-05	44	Dougther	f	Widow	5	\N	f	t	t	865	f	f		\N	f	Tee Shope	Local	f		0
2948	1	1	7	ER / 0001 / 715 / 3	Mohammed sharif	MALE	1990-11-08 01:00:00-05	25	.Grand son	f	Single	5	\N	f	t	t	865	f	f		\N	f	Tailor	Local	f		0
2949	1	1	7	ER / 0001 / 715 / 4	Mohammed ansari	MALE	1991-11-08 01:00:00-05	24	.Grand son	f	Single	Bcom	\N	f	t	t	865	f	f		\N	f	Dying compony	Local	f		0
2950	1	1	7	ER / 0001 / 716 / 1	A.Mohammed mustafa	MALE	1964-11-08 01:00:00-05	51	Head	t	Married	SSLC	\N	f	t	t	866	f	f		\N	f	Labour	Local	f		0
2951	1	1	7	ER / 0001 / 716 / 2	M.Rahamathunisha	FEMALE	1974-11-08 01:00:00-05	41	Wife	f	Married	6	\N	f	t	t	866	f	f		\N	f	Labour	Local	f		0
2952	1	1	7	ER / 0001 / 716 / 3	M.Sadiq Basha	MALE	1995-11-08 01:00:00-05	20	Son	f	Single	Diplomo	\N	f	t	f	866	f	f		\N	f	No job	Local	f		0
2953	1	1	7	ER / 0001 / 716 / 4	M.Noor Moohamed	MALE	2000-11-08 01:00:00-05	15	Son	f	Single	SSLC	\N	f	t	f	866	f	f		\N	f	Student	Local	f		0
2954	1	1	7	ER / 0001 / 717 / 1	S.subya bevee	FEMALE	1944-11-08 01:00:00-04	71	Head	t	Widow		\N	f	t	t	867	f	f		\N	f	.Home	Local	f		0
2955	1	1	7	ER / 0001 / 717 / 2	S.Asrip jon	FEMALE	1969-11-08 01:00:00-05	46	Dougther	f	Single		\N	f	t	t	867	f	f		\N	f	.Home	Local	f		0
2956	1	1	7	ER / 0001 / 718 / 1	S.Jenath Begam	FEMALE	1961-11-08 01:00:00-05	54	Head	t	Married	5	\N	f	t	t	868	f	f		\N	f	Tailor	Local	f		0
2957	1	1	7	ER / 0001 / 718 / 2	S.Samem parveen	FEMALE	1988-11-08 01:00:00-05	27	Dougther	f	Married	SSLC	\N	f	t	t	868	f	f		\N	f	Labour	Local	f		0
2958	1	1	7	ER / 0001 / 718 / 3	S.mohammed sharif	MALE	2007-11-08 01:00:00-05	8	.Grand son	f	Single	1	\N	f	t	f	868	f	f		\N	f	Student	Local	f		0
2959	1	1	7	ER / 0001 / 718 / 4	S.Mohammed harun	MALE	2008-11-08 01:00:00-05	7	.Grand son	f	Single	1	\N	f	t	f	868	f	f		\N	f	Student	Local	f		0
2960	1	1	7	ER / 0001 / 718 / 5	S.Ayisha Begam	FEMALE	2010-11-08 01:00:00-05	5	grand doughter	f	Single	kid	\N	f	t	f	868	f	f		\N	f	kid	Local	f		0
2961	1	1	7	ER / 0001 / 719 / 1	S.Shaick mujier	MALE	1974-11-08 01:00:00-05	41	Head	t	Married	12	\N	f	t	t	869	f	f		\N	f	Labour	Local	f		0
2962	1	1	7	ER / 0001 / 719 / 2	S.Sujitha Bagam	FEMALE	1975-11-08 01:00:00-05	40	Wife	f	Married	12	\N	f	t	t	869	f	f		\N	f	House Wife	Local	f		0
2963	1	1	7	ER / 0001 / 719 / 3	S.Shaik mujan	MALE	1993-11-08 01:00:00-05	22	Son	f	Single	Diplomo	\N	f	t	t	869	f	f		\N	f	No job	Local	f		0
2964	1	1	7	ER / 0001 / 719 / 4	S.Jageriya	MALE	1997-11-08 01:00:00-05	18	Son	f	Single	12	\N	f	t	f	869	f	f		\N	f	Student	Local	f		0
2965	1	1	7	ER / 0001 /  / 		MALE	2015-11-13 09:50:06.634282-05	0		f	Single		\N	f	t	f	870	f	f		\N	f		Local	f		0
2966	1	1	7	ER / 0001 / 720 / 1	Jagerunisha	FEMALE	1949-11-08 01:00:00-05	66	Head	t	Widow		\N	f	t	t	871	f	f		\N	f	.Home	Local	f		0
2967	1	1	7	ER / 0001 / 721 / 1	B.Sheik Ali	MALE	1944-11-08 01:00:00-04	71	Head	t	Married	5	\N	f	t	f	872	f	f		\N	f	Tailor	Local	f		0
2968	1	1	7	ER / 0001 / 722 / 1	Jabarunisha	FEMALE	1954-11-08 01:00:00-05	61	Head	t	Widow		\N	f	t	t	873	f	f		\N	f	Flower sales	Local	f		0
2969	1	1	7	ER / 0001 / 723 / 1	B.A.Baser hamed	MALE	1962-11-08 01:00:00-05	53	Head	t	Married	SLLC	\N	f	t	t	874	f	f		\N	f	Paan sales	Local	f		0
2970	1	1	7	ER / 0001 / 723 / 2	R.Najimunisha	FEMALE	1971-11-08 01:00:00-05	44	Wife	f	Married	8	\N	f	t	t	874	f	f		\N	f	House Wife	Local	f		0
2971	1	1	7	ER / 0001 / 723 / 3	R.Mohammed navas	MALE	2003-11-08 01:00:00-05	12	Son	f	Single	5	\N	f	t	f	874	f	f		\N	f	Student	Local	f		0
2972	1	1	7	ER / 0001 / 724 / 1	A.K.Abdul navas	MALE	1969-11-08 01:00:00-05	46	Head	t	Married	8	\N	f	t	t	875	f	f		\N	f	pani puri shop	Local	f		0
2973	1	1	7	ER / 0001 / 724 / 2	A.B.Shakela Banu	FEMALE	1976-11-08 01:00:00-05	39	Wife	f	Married	10	\N	f	t	t	875	f	f		\N	f	House Wife	Local	f		0
2974	1	1	7	ER / 0001 / 724 / 3	A.N. Segap	MALE	2008-11-08 01:00:00-05	7	Son	f	Single	1	\N	f	t	f	875	f	f		\N	f	Student	Local	f		0
2975	1	1	7	ER / 0001 / 724 / 4	A.N.Ippna	FEMALE	2012-11-08 01:00:00-05	3	Doughter	f	Single	Kid	\N	f	t	f	875	f	f		\N	f	Kid	Local	f		0
2976	1	1	7	ER / 0001 / 725 / 1	M.Sagarpan Beeve	FEMALE	1951-11-08 01:00:00-05	64	Head	t	Widow		\N	f	t	t	876	f	f		\N	f	.Home	Local	f		0
2977	1	1	7	ER / 0001 / 725 / 2	M.Mugaideen	MALE	1984-11-08 01:00:00-05	31	Son	f	Married		\N	f	t	t	876	f	f		\N	f	Laber	Local	f		0
2978	1	1	7	ER / 0001 / 725 / 3	M.Ramalath Nisha	FEMALE	1995-11-08 01:00:00-05	20	.Doughter inlaw	f	Married		\N	f	t	t	876	f	f		\N	f	House Wife	Local	f		0
2979	1	1	7	ER / 0001 / 725 / 4	M.Irshat hagamad	MALE	2014-11-08 01:00:00-05	1	.Grand doughter	f	Single	Kid	\N	f	t	f	876	f	f		\N	f	Kid	Local	f		0
2980	1	1	7	ER / 0001 / 726 / 1	Raja Mohammed 	MALE	1982-11-08 01:00:00-05	33	Head	t	Married	DME	\N	f	t	t	877	f	f		\N	f	Engener	Local	f		0
2981	1	1	7	ER / 0001 / 726 / 2	Sabna Banu	FEMALE	1986-11-08 01:00:00-05	29	Wife	f	Married	12	\N	f	t	t	877	f	f		\N	f	House Wife	Local	f		0
2982	1	1	7	ER / 0001 / 726 / 3	Sanbiya	FEMALE	2009-11-08 01:00:00-05	6	Doughter	f	Single	LKG	\N	f	t	f	877	f	f		\N	f	Student	Local	f		0
2983	1	1	7	ER / 0001 / 726 / 4	Subiya	FEMALE	2012-11-08 01:00:00-05	3	Doughter	f	Single	Kid	\N	f	t	f	877	f	f		\N	f	Kid	Local	f		0
2986	1	1	7	ER / 0001 / 729 / 		MALE	2014-11-08 01:00:00-05	1		f	Single		\N	f	t	f	880	f	f		\N	f		Local	f		0
2984	1	1	7	ER / 0001 / 727 / 		MALE	2014-11-08 01:00:00-05	1		f	Single		\N	f	t	f	878	f	f		\N	f		Local	f		0
2991	1	1	7	ER / 0001 / 731 / 4	A.Muktharunisha	FEMALE	2002-11-08 01:00:00-05	13	Doughter	f	Single	7	\N	f	t	f	882	f	f		\N	f	Student	Local	f		0
2992	1	1	7	ER / 0001 / 732 / 1	M.Mahabobjan	FEMALE	1959-11-08 01:00:00-05	56	Head	t	Widow	6	\N	f	t	t	883	f	f		\N	f	Tailor	Local	f		0
2985	1	1	7	ER / 0001 / 728 / 		MALE	2014-11-08 01:00:00-05	1		f	Single		\N	f	t	f	879	f	f		\N	f		Local	f		0
2987	1	1	7	ER / 0001 / 730 / 		MALE	2014-11-08 01:00:00-05	1		f	Single		\N	f	t	f	881	f	f		\N	f		Local	f		0
2988	1	1	7	ER / 0001 / 731 / 1	J.Abdul Salam	MALE	1972-11-08 01:00:00-05	43	Head	t	Married	5	\N	f	t	t	882	f	f		\N	f	company work	Local	f		0
2993	1	1	7	ER / 0001 / 732 / 2	M.Shahethunisha	FEMALE	1984-11-08 01:00:00-05	31	Doughter	f	Single	9	\N	f	t	t	883	f	f		\N	f	.Home	Local	f		0
2989	1	1	7	ER / 0001 / 731 / 2	A.Sharmila	FEMALE	1977-11-08 01:00:00-05	38	Wife	f	Married	5	\N	f	t	t	882	f	f		\N	f	House Wife	Local	f		0
2990	1	1	7	ER / 0001 / 731 / 3	A.Mujamilunisha	FEMALE	1999-11-08 01:00:00-05	16	Doughter	f	Single	11	\N	f	t	f	882	f	f		\N	f	Student	Local	f		0
2994	1	1	7	ER / 0001 / 732 / 3	M.mohammed Sideq	MALE	1987-11-08 01:00:00-05	28	Son	f	Single	BBM	\N	f	t	t	883	f	f		\N	f	Garment job	Local	f		0
2995	1	1	7	ER / 0001 / 733 / 1	Thasthaker	MALE	1962-11-08 01:00:00-05	53	Head	t	Married		\N	f	t	t	884	f	f		\N	f	Plastic compony	Local	f		0
2996	1	1	7	ER / 0001 / 733 / 2	Subitha	FEMALE	1967-11-08 01:00:00-05	48	Wife	f	Married	SLLC	\N	f	t	t	884	f	f		\N	f	House Wife	Local	f		0
2997	1	1	7	ER / 0001 / 733 / 3	Mubarak	MALE	1987-11-08 01:00:00-05	28	Son	f	Single	7	\N	f	t	t	884	f	f		\N	f	Plastic compony	Local	f		0
2999	1	1	7	ER / 0001 / 735 / 1	K.Abdul rahem	MALE	1949-11-08 01:00:00-05	66	Head	t	Married	6	\N	f	t	t	886	f	f		\N	f	Steal shop	Local	f		0
3000	1	1	7	ER / 0001 / 735 / 2	A.Jamela	FEMALE	1959-11-08 01:00:00-05	56	Wife	f	Married	3	\N	f	t	t	886	f	f		\N	f	House Wife	Local	f		0
3001	1	1	7	ER / 0001 / 735 / 3	A.Saleem	MALE	1984-11-08 01:00:00-05	31	Son	f	Married	SLLC	\N	f	t	t	886	f	f		\N	f	Steal shop	Local	f		0
3002	1	1	7	ER / 0001 / 735 / 4	A.Ammu	FEMALE	1985-11-08 01:00:00-05	30	Doughter	f	Married	9	\N	f	t	t	886	f	f		\N	f	House Wife	Local	f		0
3003	1	1	7	ER / 0001 / 735 / 5	A.Sate	MALE	1986-11-08 01:00:00-05	29	Son	f	Married	7	\N	f	t	t	886	f	f		\N	f	Old Iren sales	Local	f		0
3004	1	1	7	ER / 0001 / 735 / 6	S.Jaget	MALE	2012-11-08 01:00:00-05	3	Grand son	f	Single	Kid	\N	f	t	f	886	f	f		\N	f	Kid	Local	f		0
3005	1	1	7	ER / 0001 / 735 / 7	S.jammema	FEMALE	1988-11-08 01:00:00-05	27	.Son in Law	f	Married	12	\N	f	t	f	886	f	f		\N	f	House Wife	Local	f		0
3006	1	1	7	ER / 0001 / 736 / 1	M.Aslam kan	MALE	1968-11-08 01:00:00-05	47	Head	t	Married	SLLC	\N	f	t	t	887	f	f		\N	f	Driver	Local	f		0
3007	1	1	7	ER / 0001 / 736 / 2	A.Hajira	FEMALE	1978-11-08 01:00:00-05	37	Wife	f	Married	SLLC	\N	f	t	f	887	f	f		\N	f	House Wife	Local	f		0
3008	1	1	7	ER / 0001 / 736 / 3	A.Asin	FEMALE	1998-11-08 01:00:00-05	17	Doughter	f	Single	11	\N	f	t	f	887	f	f		\N	f	Student	Local	f		0
3009	1	1	7	ER / 0001 / 736 / 4	A.Jaleth	MALE	2004-11-08 01:00:00-05	11	Son	f	Single	4	\N	f	t	f	887	f	f		\N	f	Student	Local	f		0
3010	1	1	7	ER / 0001 / 737 / 1	S.Nowseen	MALE	1978-10-08 01:00:00-04	37	Head	t	Married		\N	f	t	t	888	f	f		\N	f	H/D Road Worker	Local	f		0
3011	1	1	7	ER / 0001 / 737 / 2	A.Nadiya janu	FEMALE	1986-10-08 01:00:00-04	29	Wife	f	Married		\N	f	t	t	888	f	f		\N	f	House Wife	Local	f		0
3012	1	1	7	ER / 0001 / 737 / 3	S.Savulath husain	MALE	2007-10-08 01:00:00-04	8	Son	f	Single	2	\N	f	t	f	888	f	f		\N	f	Student	Local	f		0
3013	1	1	7	ER / 0001 / 737 / 4	Sugal	MALE	2013-10-08 01:00:00-04	2	Son	f	Single	Kid	\N	f	t	f	888	f	f		\N	f	Kid	Local	f		0
3041	1	1	7	ER / 0001 / 748 / 1	J.Badusha mydeen	MALE	1964-08-14 01:00:00-04	51	Head	t	Married	3	\N	f	t	t	899	f	f		\N	f	Plastic sales	Local	f		0
3042	1	1	7	ER / 0001 / 748 / 2	B.Faritha Banu	FEMALE	1967-08-14 01:00:00-04	48	Wife	f	Married		\N	f	t	t	899	f	f		\N	f	House Wife	Local	f		0
3014	1	1	7	ER / 0001 / 738 / 		MALE	2014-11-08 01:00:00-05	1		f	Single		\N	f	t	f	889	f	f		\N	f		Local	f		0
3015	1	1	7	ER / 0001 / 739 / 1	M.Jamal moideen	MALE	1951-10-08 01:00:00-05	64	Head	t	Married	Bsc	\N	f	t	t	890	f	f		\N	f	Gov.agre	Local	f		0
3016	1	1	7	ER / 0001 / 739 / 2	S.M.Fathima	FEMALE	1960-10-08 01:00:00-04	55	Wife	f	Married	school	\N	f	t	t	890	f	f		\N	f	government	Local	f		0
3017	1	1	7	ER / 0001 / 739 / 3	J.Mohammed Asik	MALE	1985-10-08 01:00:00-04	30	Son	f	Married	BE	\N	f	t	t	890	f	f		\N	f	IT	Local	f		0
3018	1	1	7	ER / 0001 / 739 / 4	Nasreen Fathima	FEMALE	1987-10-08 01:00:00-04	28	.Doughter inlaw	f	Married	BE	\N	f	t	f	890	f	f		\N	f	House Wife	Local	f		0
3019	1	1	7	ER / 0001 / 740 / 1	A.Abbus Ali	MALE	1954-11-08 01:00:00-05	61	Head	t	Married	SSLC	\N	f	t	t	891	f	f		\N	f	Bsnl staff	Local	f		0
3020	1	1	7	ER / 0001 / 740 / 2	A.Fathima	FEMALE	1962-11-08 01:00:00-05	53	Wife	f	Married	SSLC	\N	f	t	t	891	f	f		\N	f	House Wife	Local	f		0
3021	1	1	7	ER / 0001 / 741 / 1	Lookmanul Hakem	MALE	1966-11-08 01:00:00-05	49	Head	t	Married	8	\N	f	t	t	892	f	f		\N	f	Shope Worker	Local	f		0
3022	1	1	7	ER / 0001 / 741 / 2	L.Safiya	FEMALE	1976-11-08 01:00:00-05	39	Wife	f	Married	12	\N	f	t	t	892	f	f		\N	f	House Wife	Local	f		0
3023	1	1	7	ER / 0001 / 741 / 3	L.Ameena	FEMALE	2003-11-08 01:00:00-05	12	Doughter	f	Single	7	\N	f	t	f	892	f	f		\N	f	Student	Local	f		0
3043	1	1	7	ER / 0001 / 748 / 3	B.Irfan	MALE	1994-08-14 01:00:00-04	21	Son	f	Single	7	\N	f	t	t	899	f	f		\N	f	panjar shop	Local	f		0
3044	1	1	7	ER / 0001 / 748 / 4	B.Irshak	MALE	1996-08-14 01:00:00-04	19	Son	f	Single	8	\N	f	t	f	899	f	f		\N	f	Laber	Local	f		0
3045	1	1	7	ER / 0001 / 749 / 1	K.Kasim	MALE	1940-08-14 01:00:00-04	75	Head	t	Married	3	\N	f	t	t	900	f	f		\N	f	.Home	Local	f		0
3024	1	1	7	ER / 0001 / 742 / 		MALE	2014-11-08 01:00:00-05	1		f	Single		\N	f	t	f	893	f	f		\N	f		Local	f		0
3025	1	1	7	ER / 0001 / 743 / 1	M.Majith	MALE	1968-08-14 01:00:00-04	47	Head	t	Married	M.A	\N	f	t	t	894	f	f		\N	f	Furnicher	Local	f		0
3026	1	1	7	ER / 0001 / 743 / 2	M.Amna Bagem	FEMALE	1972-08-14 01:00:00-04	43	Wife	f	Married	8	\N	f	t	t	894	f	f		\N	f	House Wife	Local	f		0
3027	1	1	7	ER / 0001 / 744 / 1	Mohammed Anifa	MALE	1944-08-14 01:00:00-04	71	Head	t	Married	8	\N	f	t	t	895	f	f		\N	f		Local	f		0
3028	1	1	7	ER / 0001 / 744 / 2	M.Pathumuthu	FEMALE	1950-08-14 01:00:00-04	65	Wife	f	Married		\N	f	t	t	895	f	f		\N	f	House Wife	Local	f		0
3029	1	1	7	ER / 0001 / 745 / 1	S.Nawshath	MALE	1980-08-14 01:00:00-04	35	Head	t	Married	7	\N	f	t	t	896	f	f		\N	f	Watch service	Local	f		0
3030	1	1	7	ER / 0001 / 745 / 2	P.M.Soujeth Nisha	FEMALE	1984-08-14 01:00:00-04	31	Wife	f	Married	SSLC	\N	f	t	f	896	f	f		\N	f	Tailor	Local	f		0
3031	1	1	7	ER / 0001 / 745 / 3	N.Naseya shreen	FEMALE	2006-08-14 01:00:00-04	9	Doughter	f	Single	4	\N	f	t	f	896	f	f		\N	f	Student	Local	f		0
3032	1	1	7	ER / 0001 / 745 / 4	N.Mohammed nabil	MALE	2011-08-14 01:00:00-04	4	Son	f	Single	Kid	\N	f	t	f	896	f	f		\N	f	Kid	Local	f		0
3033	1	1	7	ER / 0001 / 746 / 1	Saleem	MALE	1972-08-14 01:00:00-04	43	Head	t	Married		\N	f	t	t	897	f	f		\N	f	Laber	Local	f		0
3034	1	1	7	ER / 0001 / 746 / 2	Elage	FEMALE	1976-08-14 01:00:00-04	39	Wife	f	Married	6	\N	f	t	t	897	f	f		\N	f	Laber	Local	f		0
3035	1	1	7	ER / 0001 / 746 / 3	S.Baser	MALE	2001-08-14 01:00:00-04	14	Son	f	Single	7	\N	f	t	f	897	f	f		\N	f	Student	Local	f		0
3036	1	1	7	ER / 0001 / 746 / 4	S.Faritha jasmeen	FEMALE	2004-08-14 01:00:00-04	11	Doughter	f	Single	5	\N	f	t	f	897	f	f		\N	f	Student	Local	f		0
3037	1	1	7	ER / 0001 / 747 / 1	K.Noor mohammed 	MALE	1978-08-14 01:00:00-04	37	Head	t	Married	1	\N	f	t	t	898	f	f		\N	f	Shop	Local	f		0
3038	1	1	7	ER / 0001 / 747 / 2	N.Sarmila	FEMALE	1980-08-14 01:00:00-04	35	Wife	f	Married	6	\N	f	t	t	898	f	f		\N	f	House Wife	Local	f		0
3039	1	1	7	ER / 0001 / 747 / 3	N.Asraf	MALE	1998-08-14 01:00:00-04	17	Son	f	Single	11	\N	f	t	f	898	f	f		\N	f	Student	Local	f		0
3040	1	1	7	ER / 0001 / 747 / 4	N.Mohammed Ali	MALE	1999-08-14 01:00:00-04	16	Doughter	f	Single	10	\N	f	t	f	898	f	f		\N	f	Student	Local	f		0
3046	1	1	7	ER / 0001 / 749 / 2	K.Ameena	FEMALE	1949-08-14 01:00:00-04	66	Wife	f	Married		\N	f	t	t	900	f	f		\N	f	.Home	Local	f		0
3047	1	1	7	ER / 0001 / 750 / 1	A.Abdul rajak	MALE	1943-08-14 01:00:00-04	72	Head	t	Married	MBBS	\N	f	t	t	901	f	f		\N	f	Doctor	Local	f		0
3048	1	1	7	ER / 0001 / 750 / 2	A.Bathul rajak	FEMALE	1949-08-14 01:00:00-04	66	Wife	f	Married	PUC	\N	f	t	t	901	f	f		\N	f	House Wife	Local	f		0
3049	1	1	7	ER / 0001 / 750 / 3	A.Kalel parvase	MALE	1970-08-14 01:00:00-04	45	Son	f	Married	MBBS/Dch	\N	f	t	t	901	f	f		\N	f	Doctor	Local	f		0
3050	1	1	7	ER / 0001 / 750 / 4	K.Mubena parvase	FEMALE	1977-08-14 01:00:00-04	38	.Doughter in law	f	Married	SSLC	\N	f	t	t	901	f	f		\N	f	House Wife	Local	f		0
3051	1	1	7	ER / 0001 / 750 / 5	K.Simra muskan	FEMALE	1998-08-14 01:00:00-04	17	.Grand doughter	f	Single	11	\N	f	t	f	901	f	f		\N	f	Student	Local	f		0
3052	1	1	7	ER / 0001 / 750 / 6	K.Mohammed jain	MALE	2003-08-14 01:00:00-04	12	grand son	f	Single	6	\N	f	t	f	901	f	f		\N	f	Student	Local	f		0
3053	1	1	7	ER / 0001 / 750 / 7	A.Hafis thabrose	MALE	1975-08-14 01:00:00-04	40	Doughter	f	Married	D.pham	\N	f	t	t	901	f	f		\N	f	Medical	Local	f		0
3054	1	1	7	ER / 0001 / 750 / 8	H.Shapya thasnem	FEMALE	1981-08-14 01:00:00-04	34	.Doughter in law	f	Married	SSLC	\N	f	t	t	901	f	f		\N	f	House Wife	Local	f		0
3055	1	1	7	ER / 0001 / 750 / 9	H.Sara fathima	FEMALE	2011-08-14 01:00:00-04	4	.Grand doughter	f	Single	Kid	\N	f	t	f	901	f	f		\N	f	Kid	Local	f		0
3095	1	1	7	ER / 0001 / 763 / 2	A.Hanifa bevee	FEMALE	1968-08-15 01:00:00-04	47	Mother	f	Married	6	\N	f	t	t	914	f	f		\N	f	House Wife	Local	f		0
3096	1	1	7	ER / 0001 / 763 / 3	S.Nishar	MALE	1991-08-15 01:00:00-04	24	Son	f	Married	9	\N	f	t	t	914	f	f		\N	f	Mechanic	Local	f		0
3056	1	1	7	ER / 0001 / 751 / 		MALE	2014-08-14 01:00:00-04	1		f	Single		\N	f	t	f	902	f	f		\N	f		Local	f		0
3057	1	1	7	ER / 0001 / 752 / 1	B.Musthafa	MALE	1977-08-14 01:00:00-04	38	Head	t	Married		\N	f	t	t	903	f	f		\N	f	Labor	Local	f		0
3058	1	1	7	ER / 0001 / 752 / 2	M.Mumtaj	FEMALE	1979-08-14 01:00:00-04	36	Wife	f	Married	5	\N	f	t	t	903	f	f		\N	f	House Wife	Local	f		0
3059	1	1	7	ER / 0001 / 752 / 3	M.Rizwana banu	FEMALE	1999-08-14 01:00:00-04	16	Doughter	f	Single	10	\N	f	t	f	903	f	f		\N	f	Student	Local	f		0
3060	1	1	7	ER / 0001 / 752 / 4	M.Jasmin	FEMALE	2004-08-14 01:00:00-04	11	Doughter	f	Single	5	\N	f	t	f	903	f	f		\N	f	Student	Local	f		0
3061	1	1	7	ER / 0001 / 753 / 1	A.Sadiq basha	MALE	1979-08-14 01:00:00-04	36	Head	t	Married	7	\N	f	t	f	904	f	f		\N	f	Labor	Local	f		0
3062	1	1	7	ER / 0001 / 753 / 2	S.Banu	FEMALE	1982-08-14 01:00:00-04	33	Wife	f	Married	SSLC	\N	f	t	t	904	f	f		\N	f	Bangels sales	Local	f		0
3063	1	1	7	ER / 0001 / 753 / 3	S.Sagul hamed	MALE	2007-08-14 01:00:00-04	8	Son	f	Single	2	\N	f	t	f	904	f	f		\N	f	Kid	Local	f		0
3064	1	1	7	ER / 0001 / 754 / 1	A.Javid	MALE	1980-08-14 01:00:00-04	35	Head	t	Married	6	\N	f	t	t	905	f	f		\N	f	Mettal Store	Local	f		0
3065	1	1	7	ER / 0001 / 754 / 2	Z.Megarunisha	FEMALE	1984-08-14 01:00:00-04	31	Wife	f	Married		\N	f	t	t	905	f	f		\N	f	House Wife	Local	f		0
3066	1	1	7	ER / 0001 / 754 / 3	Z.Masera	FEMALE	2009-08-14 01:00:00-04	6	Doughter	f	Single	1	\N	f	t	f	905	f	f		\N	f	Student	Local	f		0
3067	1	1	7	ER / 0001 / 754 / 4	Z.syed moideen	MALE	2010-08-14 01:00:00-04	5	Son	f	Single	Kid	\N	f	t	f	905	f	f		\N	f	Kid	Local	f		0
3068	1	1	7	ER / 0001 / 755 / 1	A.Abdul kader	MALE	1975-08-14 01:00:00-04	40	Head	t	Married	6	\N	f	t	t	906	f	f		\N	f	Tailor	Local	f		0
3069	1	1	7	ER / 0001 / 755 / 2	A.Arif nisha	FEMALE	1976-08-14 01:00:00-04	39	Wife	f	Married	6	\N	f	t	t	906	f	f		\N	f	House Wife	Local	f		0
3070	1	1	7	ER / 0001 / 755 / 3	A.mohammed siraj	MALE	1995-08-14 01:00:00-04	20	Son	f	Single	B.com	\N	f	t	f	906	f	f		\N	f	.Home	Local	f		0
3071	1	1	7	ER / 0001 / 755 / 4	A.Abdul Rahem	MALE	1996-08-14 01:00:00-04	19	Son	f	Single	Diplamo	\N	f	t	f	906	f	f		\N	f	Student	Local	f		0
3072	1	1	7	ER / 0001 / 755 / 5	A.mohammed Anifa	MALE	1997-08-14 01:00:00-04	18	Son	f	Single	Diplamo	\N	f	t	f	906	f	f		\N	f	Student	Local	f		0
3073	1	1	7	ER / 0001 / 756 / 1	Yenayathu nisha	FEMALE	1960-08-14 01:00:00-04	55	Head	t	Widow	9	\N	f	t	t	907	f	f		\N	f	Labor	Local	f		0
3074	1	1	7	ER / 0001 / 757 / 1	A.Seraknasha	FEMALE	1954-12-08 01:00:00-05	61	Head	t	Widow		\N	f	t	t	908	f	f		\N	f	House Wife	Local	f		0
3075	1	1	7	ER / 0001 / 758 / 1	A.Mustafa	MALE	1975-12-08 01:00:00-05	40	Head	t	Married	8	\N	f	t	t	909	f	f		\N	f	Tailor	Local	f		0
3076	1	1	7	ER / 0001 / 758 / 2	M.Parveen	FEMALE	1980-12-08 01:00:00-05	35	Wife	f	Married	5	\N	f	t	t	909	f	f		\N	f	Labor	Local	f		0
3077	1	1	7	ER / 0001 / 758 / 3	M.Imran	MALE	2000-12-08 01:00:00-05	15	Son	f	Single	8	\N	f	t	f	909	f	f		\N	f	Student	Local	f		0
3078	1	1	7	ER / 0001 / 758 / 4	M.Naseer hagamed	MALE	2004-12-08 01:00:00-05	11	Son	f	Single	5	\N	f	t	f	909	f	f		\N	f	Student	Local	f		0
3079	1	1	7	ER / 0001 / 759 / 		MALE	2014-12-08 01:00:00-05	1		f	Single		\N	f	t	f	910	f	f		\N	f		Local	f		0
3080	1	1	7	ER / 0001 / 760 / 1	S.Sheik jainuladeen	MALE	1980-12-08 01:00:00-05	35	Head	t	Married	12	\N	f	t	f	911	f	f		\N	f	Furit shop	Local	f		0
3081	1	1	7	ER / 0001 / 760 / 2	M.Mymun nisha	FEMALE	1959-12-08 01:00:00-05	56	Mother	f	Married	8	\N	f	t	f	911	f	f		\N	f	.Home	Local	f		0
3082	1	1	7	ER / 0001 / 760 / 3	R.Fathima jebyrunisha bagem	FEMALE	1987-12-08 01:00:00-05	28	Wife	f	Married	B.com	\N	f	t	f	911	f	f		\N	f	House Wife	Local	f		0
3083	1	1	7	ER / 0001 / 760 / 4	S.ajim sugail	MALE	2008-12-08 01:00:00-05	7	Son	f	Single	1	\N	f	t	f	911	f	f		\N	f	Student	Local	f		0
3084	1	1	7	ER / 0001 / 760 / 5	S.Fateen hamed	MALE	2011-12-08 01:00:00-05	4	Son	f	Single	Kid	\N	f	t	f	911	f	f		\N	f	Kid	Local	f		0
3085	1	1	7	ER / 0001 / 761 / 1	A.mohammed sarif	MALE	1957-12-08 01:00:00-05	58	Head	t	Married	SSLC	\N	f	t	t	912	f	f		\N	f	Vegetable busness	Local	f		0
3086	1	1	7	ER / 0001 / 761 / 2	M.Salima	FEMALE	1967-12-08 01:00:00-05	48	Wife	f	Married	5	\N	f	t	t	912	f	f		\N	f	House Wife	Local	f		0
3087	1	1	7	ER / 0001 / 762 / 1	S.mohammed ali	MALE	1959-12-08 01:00:00-05	56	Head	t	Married	SSLC	\N	f	t	t	913	f	f		\N	f	Secutrity	Local	f		0
3088	1	1	7	ER / 0001 / 762 / 2	M.Asira banu	FEMALE	1972-12-08 01:00:00-05	43	Wife	f	Married	7	\N	f	t	t	913	f	f		\N	f	House Wife	Local	f		0
3089	1	1	7	ER / 0001 / 762 / 3	M.Jaber hamed	MALE	1988-12-08 01:00:00-05	27	Son	f	Married	12	\N	f	t	t	913	f	f		\N	f	Tailor	Local	f		0
3090	1	1	7	ER / 0001 / 762 / 4	J.fathima	FEMALE	1992-12-08 01:00:00-05	23	.Doughter in law	f	Married	SSLC	\N	f	t	f	913	f	f		\N	f	Labor	Local	f		0
3091	1	1	7	ER / 0001 / 762 / 5	J.Saliga fathima	FEMALE	2011-12-08 01:00:00-05	4	.Grand doughter	f	Single	Kid	\N	f	t	f	913	f	f		\N	f	Kid	Local	f		0
3092	1	1	7	ER / 0001 / 762 / 6	M.Sarmila banu	FEMALE	1990-12-08 01:00:00-05	25	Doughter	f	Married	8	\N	f	t	f	913	f	f		\N	f	Fance store	Local	f		0
3093	1	1	7	ER / 0001 / 762 / 7	M.mohammed Adeep	MALE	2010-12-08 01:00:00-05	5	grand son	f	Single	Kid	\N	f	t	f	913	f	f		\N	f	Kid	Local	f		0
3094	1	1	7	ER / 0001 / 763 / 1	P.Siraj	MALE	1966-08-15 01:00:00-04	49	Father	t	Married	3	\N	f	t	t	914	f	f		\N	f	Labor	Local	f		0
3097	1	1	7	ER / 0001 / 763 / 4	Saru bagem	FEMALE	1993-08-15 01:00:00-04	22	.Doughter in law	f	Married	5	\N	f	t	t	914	f	f		\N	f	House Wife	Local	f		0
3098	1	1	7	ER / 0001 / 764 / 1	K.S.Mohammed yakub	MALE	1976-08-16 01:00:00-04	39	Head	t	Married		\N	f	t	t	915	f	f		\N	f	IMAMM/Perundurai	Local	f		0
3099	1	1	7	ER / 0001 / 764 / 2	Saburamal	FEMALE	1981-08-16 01:00:00-04	34	Wife	f	Married	MA/B.ed	\N	f	t	t	915	f	f		\N	f	House Wife	Local	f		0
3100	1	1	7	ER / 0001 / 764 / 3	Shreba bevee	FEMALE	1939-08-16 01:00:00-04	76	Mother	f	Married		\N	f	t	t	915	f	f		\N	f	.Home	Local	f		0
3101	1	1	7	ER / 0001 / 764 / 4	Aamera fathima	FEMALE	2002-08-16 01:00:00-04	13	Doughter	f	Single	7	\N	f	t	f	915	f	f		\N	f	Kid	Local	f		0
3102	1	1	7	ER / 0001 / 764 / 5	Adep mohammed 	MALE	2004-08-16 01:00:00-04	11	Son	f	Single	5	\N	f	t	f	915	f	f		\N	f	Kid	Local	f		0
3103	1	1	7	ER / 0001 / 765 / 		MALE	2014-08-15 01:00:00-04	1		f	Single		\N	f	t	f	916	f	f		\N	f		Local	f		0
3104	1	1	7	ER / 0001 / 766 / 1	Rukaiyamal	FEMALE	1974-08-16 01:00:00-04	41	Wife	t	Married		\N	f	t	t	917	f	f		\N	f	Labor	Local	f		0
3105	1	1	7	ER / 0001 / 766 / 2	Sadiq basha	MALE	1964-08-16 01:00:00-04	51	Head	f	Married	SSLC	\N	f	t	t	917	f	f		\N	f	Painter	Local	f		0
3106	1	1	7	ER / 0001 / 766 / 3	Shagana banu	FEMALE	1993-08-16 01:00:00-04	22	Doughter	f	Single	Bsc	\N	f	t	t	917	f	f		\N	f	Student	Local	f		0
3107	1	1	7	ER / 0001 / 766 / 4	Aadam saet	MALE	1999-08-16 01:00:00-04	16	Son	f	Single	SSLC	\N	f	t	f	917	f	f		\N	f	Student	Local	f		0
3108	1	1	7	ER / 0001 / 767 / 1	A.Ansar bahsa	MALE	1977-08-16 01:00:00-04	38	Head	t	Married	7	\N	f	t	t	918	f	f		\N	f	Tailor	Local	f		0
3109	1	1	7	ER / 0001 / 767 / 2	Ripaathunisha	FEMALE	1981-08-16 01:00:00-04	34	Wife	f	Married	7	\N	f	t	t	918	f	f		\N	f	Tailor	Local	f		0
3110	1	1	7	ER / 0001 / 767 / 3	A.Farjana	FEMALE	2005-08-16 01:00:00-04	10	Doughter	f	Single	4	\N	f	t	f	918	f	f		\N	f	Student	Local	f		0
3111	1	1	7	ER / 0001 / 767 / 4	A.Asfila	FEMALE	2006-08-16 01:00:00-04	9	Doughter	f	Single	2	\N	f	t	f	918	f	f		\N	f	Student	Local	f		0
3112	1	1	7	ER / 0001 / 767 / 5	A.Asba	FEMALE	2010-08-16 01:00:00-04	5	Doughter	f	Single	Pre.kg	\N	f	t	f	918	f	f		\N	f	Student	Local	f		0
3113	1	1	7	ER / 0001 / 768 / 1	Jailabudeen	MALE	1967-08-16 01:00:00-04	48	Head	t	Married	4	\N	f	t	t	919	f	f		\N	f	Lorry mechanic	Local	f		0
3114	1	1	7	ER / 0001 / 768 / 2	Faridha	FEMALE	1984-08-16 01:00:00-04	31	Wife	f	Married	4	\N	f	t	t	919	f	f		\N	f	Labor	Local	f		0
3115	1	1	7	ER / 0001 / 768 / 3	Nasreen banu	FEMALE	1996-08-16 01:00:00-04	19	Doughter	f	Single	11	\N	f	t	f	919	f	f		\N	f	.Home	Local	f		0
3116	1	1	7	ER / 0001 / 768 / 4	Taj nish	FEMALE	2003-08-16 01:00:00-04	12	Doughter	f	Single	6	\N	f	t	f	919	f	f		\N	f	Student	Local	f		0
3117	1	1	7	ER / 0001 / 768 / 5	Mohammed ismail	MALE	2006-08-16 01:00:00-04	9	Son	f	Single	3	\N	f	t	f	919	f	f		\N	f	Student	Local	f		0
3118	1	1	7	ER / 0001 / 769 / 1	Aameena	FEMALE	1972-08-16 01:00:00-04	43	Mother	t	Married	3	\N	f	t	f	920	f	f		\N	f	Labor	Local	f		0
3119	1	1	7	ER / 0001 / 769 / 2	Aadla	FEMALE	1990-08-16 01:00:00-04	25	Doughter	f	Single	12	\N	f	t	f	920	f	f		\N	f	Student	Local	f		0
3120	1	1	7	ER / 0001 / 770 / 1	Shrena	FEMALE	1982-08-17 01:00:00-04	33	Mother	t	Widow	7	\N	f	t	t	921	f	f		\N	f	House Wife	Local	f		0
3121	1	1	7	ER / 0001 / 770 / 2	Mubena	FEMALE	2001-08-17 01:00:00-04	14	Doughter	f	Single	8	\N	f	t	f	921	f	f		\N	f	Student	Local	f		0
3122	1	1	7	ER / 0001 / 770 / 3	Mulera	FEMALE	2003-08-17 01:00:00-04	12	Doughter	f	Single	7	\N	f	t	f	921	f	f		\N	f	Student	Local	f		0
3123	1	1	7	ER / 0001 / 771 / 1	Mohammed Hanefa	MALE	1945-08-17 01:00:00-04	70	Head	t	Married		\N	f	t	t	922	f	f		\N	f	Pical sales	Local	f		0
3124	1	1	7	ER / 0001 / 771 / 2	Pathu muthu	FEMALE	1950-08-17 01:00:00-04	65	Wife	f	Married		\N	f	t	t	922	f	f		\N	f	House Wife	Local	f		0
3125	1	1	7	ER / 0001 / 772 / 1	Kaja husain	MALE	1965-08-17 01:00:00-04	50	Head	t	Married	7	\N	f	t	t	923	f	f		\N	f	loadman/ Quith	Local	f		0
3126	1	1	7	ER / 0001 / 772 / 2	Fathima	FEMALE	1969-08-17 01:00:00-04	46	Wife	f	Married	8	\N	f	t	t	923	f	f		\N	f	House Wife	Local	f		0
3127	1	1	7	ER / 0001 / 772 / 3	Rihana	FEMALE	1986-08-17 01:00:00-04	29	Doughter	f	Married	SSLC	\N	f	t	f	923	f	f		\N	f	SIPCOT work	Local	f		0
3128	1	1	7	ER / 0001 / 772 / 4	Rubisha	FEMALE	2005-08-17 01:00:00-04	10	.Grand doughter	f	Single	4	\N	f	t	f	923	f	f		\N	f	Student	Local	f		0
3129	1	1	7	ER / 0001 / 772 / 5	Sabana	FEMALE	2007-08-17 01:00:00-04	8	.Grand doughter	f	Single	2	\N	f	t	f	923	f	f		\N	f	Student	Local	f		0
3146	1	1	7	ER / 0001 / 633 / 		MALE	2014-10-08 01:00:00-04	1		f	Single		\N	f	t	f	931	f	f		\N	f		Local	f		0
3143	1	1	7	ER / 0001 / 631 / 		MALE	2014-10-08 01:00:00-04	1		f	Single		\N	f	t	f	929	f	f		\N	f		Local	f		0
3130	1	1	7	ER / 0001 / 773 / 		MALE	2014-08-20 01:00:00-04	1		f	Single		\N	f	t	f	924	f	f		\N	f		Local	f		0
3144	1	1	7	ER / 0001 / 632 / 1	G.E. idhaya Tula	MALE	1962-10-08 01:00:00-04	53	Family head	t	Married	8	\N	f	t	t	930	f	f		\N	f	Auto driver	Local	f		0
3145	1	1	7	ER / 0001 / 632 / 2	M. Alia Begum	FEMALE	1971-10-08 01:00:00-04	44	Wife	f	Married	5	\N	f	t	t	930	f	f		\N	f	House wife	Local	f		0
3131	1	1	7	ER / 0001 / 774 / 		MALE	2014-08-21 01:00:00-04	1		f	Single		\N	f	t	f	925	f	f		\N	f		Local	f		0
3132	1	1	7	ER / 0001 / 775 / 1	Amanulla	MALE	1939-08-21 01:00:00-04	76	Head	t	Married	5	\N	f	t	t	926	f	f		\N	f	.Home	Local	f		0
3133	1	1	7	ER / 0001 / 775 / 2	Bathrunisha	FEMALE	1960-08-21 01:00:00-04	55	Wife	f	Married	SSLC	\N	f	t	t	926	f	f		\N	f	.Home	Local	f		0
3134	1	1	7	ER / 0001 / 775 / 3	Sabeyamal	FEMALE	1987-08-21 01:00:00-04	28	Doughter	f	Married	Diplamo	\N	f	t	t	926	f	f		\N	f	Teacher	Local	f		0
3135	1	1	7	ER / 0001 / 775 / 4	Asath	MALE	1984-08-21 01:00:00-04	31	.Son in law	f	Married	12	\N	f	t	t	926	f	f		\N	f	SAUDEI	Local	f		0
3136	1	1	7	ER / 0001 / 775 / 5	Asima	FEMALE	2012-08-21 01:00:00-04	3	.Grand doughter	f	Single	Kid	\N	f	t	f	926	f	f		\N	f	Kid	Local	f		0
3137	1	1	7	ER / 0001 / 629 / 1	M. Umar Farooq	MALE	1986-10-08 01:00:00-04	29	Family head	t	Married	ECE	\N	f	t	t	927	f	f		\N	f	labour	Local	f		0
3138	1	1	7	ER / 0001 / 629 / 2	U. Shagetha birkis	FEMALE	1990-10-08 01:00:00-04	25	Wife	f	Married	12	\N	f	t	t	927	f	f		\N	f	House wife	Local	f		0
3139	1	1	7	ER / 0001 / 630 / 1	M. Hassan mohammed	MALE	1969-10-08 01:00:00-04	46	Family head	t	Married	9	\N	f	t	t	928	f	f		\N	f	Pickles sales	Local	f		0
3140	1	1	7	ER / 0001 / 630 / 2	A. Poona Yasmin	FEMALE	1979-10-08 01:00:00-04	36	Wife	f	Married	9	\N	f	t	t	928	f	f		\N	f	Labour	Local	f		0
3141	1	1	7	ER / 0001 / 630 / 3	A.Sirajuddin	MALE	2006-10-08 01:00:00-04	9	Son	f	Single	5	\N	f	t	f	928	f	f		\N	f	Student	Local	f		0
3142	1	1	7	ER / 0001 / 630 / 4	A. Reysdein	MALE	2002-10-08 01:00:00-04	13	Son	f	Single	8	\N	f	t	f	928	f	f		\N	f	Student	Local	f		0
3149	1	1	7	ER / 0001 / 636 / 1	M. Abdul Salam	MALE	1952-10-08 01:00:00-05	63	Family head	t	Married	2	\N	f	t	f	934	f	f		\N	f	Rest	Local	f		0
3150	1	1	7	ER / 0001 / 637 / 1	S. Syed Salahuddin	MALE	2014-10-08 01:00:00-04	1	Family head	t	Married	8	\N	f	t	t	935	f	f		\N	f	Tailor	Local	f		0
3147	1	1	7	ER / 0001 / 634 / 		MALE	2014-10-08 01:00:00-04	1		f	Single		\N	f	t	f	932	f	f		\N	f		Local	f		0
3148	1	1	7	ER / 0001 / 635 / 		MALE	2014-10-08 01:00:00-04	1		f	Single		\N	f	t	f	933	f	f		\N	f		Local	f		0
3151	1	1	7	ER / 0001 / 637 / 2	S. Sabiyabi	FEMALE	2014-10-08 01:00:00-04	1	Wife	f	Married	5	\N	f	t	t	935	f	f		\N	f	Usthabi	Local	f		0
3152	1	1	7	ER / 0001 / 638 / 1	Imran Khan	MALE	1989-10-08 01:00:00-04	26	Family head	t	Married	ITI	\N	f	t	t	936	f	f		\N	f	Mobile service	Local	f		0
3153	1	1	7	ER / 0001 / 638 / 2	Mallika Ayesha	FEMALE	1993-10-08 01:00:00-04	22	Wife	f	Married	10	\N	f	t	t	936	f	f		\N	f	House wife	Local	f		0
3154	1	1	7	ER / 0001 / 638 / 3	shimsha dardila	FEMALE	2011-10-08 01:00:00-04	4	Daughter	f	Single	N	\N	f	t	f	936	f	f		\N	f	N	Local	f		0
3155	1	1	7	ER / 0001 / 638 / 4	Mohammad Mujaf	MALE	2013-10-08 01:00:00-04	2	Son	f	Single	N	\N	f	t	f	936	f	f		\N	f	N	Local	f		0
3156	1	1	7	ER / 0001 / 639 / 1	P. mohammed Ilyas	MALE	1964-10-08 01:00:00-04	51	Family head	t	Married	11	\N	f	t	t	937	f	f		\N	f	company	Local	f		0
3157	1	1	7	ER / 0001 / 639 / 2	M.Jaminal beevi	FEMALE	1970-10-08 01:00:00-04	45	Wife	f	Married	8	\N	f	t	t	937	f	f		\N	f	House wife	Local	f		0
3158	1	1	7	ER / 0001 / 639 / 3	M.Ramzan Begum	FEMALE	1992-10-08 01:00:00-04	23	Daughter	f	Single	BCom	\N	f	t	t	937	f	f		\N	f		Local	f		0
3159	1	1	7	ER / 0001 / 639 / 4	H. Jannatul	FEMALE	1994-10-08 01:00:00-04	21	Daughter	f	Single	BCom	\N	f	t	f	937	f	f		\N	f		Local	f		0
3160	1	1	7	ER / 0001 / 640 / 1	Syed Mustafa	MALE	1978-10-08 01:00:00-04	37	Family head	t	Married	10	\N	f	t	t	938	f	f		\N	f	Mechanic	Local	f		0
3161	1	1	7	ER / 0001 / 640 / 2	aasia Parveen Banu	FEMALE	1982-10-08 01:00:00-04	33	Wife	f	Married	BSC	\N	f	t	t	938	f	f		\N	f	House wife	Local	f		0
3162	1	1	7	ER / 0001 / 641 / 1	A. mohammed Jawaharlal	MALE	1974-10-08 01:00:00-04	41	Family head	t	Married	5	\N	f	t	t	939	f	f		\N	f	cheken shope	Local	f		0
3163	1	1	7	ER / 0001 / 641 / 2	M. balkis beve	FEMALE	1979-10-08 01:00:00-04	36	Wife	f	Married	5	\N	f	t	t	939	f	f		\N	f	House wife	Local	f		0
3164	1	1	7	ER / 0001 / 641 / 3	M. Mohammad Hakim	MALE	1998-10-08 01:00:00-04	17	Son	f	Single	11	\N	f	t	f	939	f	f		\N	f	Student	Local	f		0
3165	1	1	7	ER / 0001 / 641 / 4	M. Mohammad Usman	MALE	2001-10-08 01:00:00-04	14	Son	f	Single	6	\N	f	t	f	939	f	f		\N	f	Student	Local	f		0
3166	1	1	7	ER / 0001 / 641 / 5	M. Nasreen	FEMALE	2004-10-08 01:00:00-04	11	Daughter	f	Single	5	\N	f	t	f	939	f	f		\N	f	Student	Local	f		0
3167	1	1	7	ER / 0001 / 642 / 1	A. Jameela beevi	FEMALE	1949-10-08 01:00:00-05	66	Family head	t	Widow	5	\N	f	t	t	940	f	f		\N	f	H.M	Local	f		0
3168	1	1	7	ER / 0001 / 643 / 1	S. Ajgar Ali	MALE	1987-10-08 01:00:00-04	28	Family head	t	Married	6	\N	f	t	t	941	f	f		\N	f	velder	Local	f		0
3169	1	1	7	ER / 0001 / 643 / 2	A. Ashraf Nisha	FEMALE	1991-10-08 01:00:00-04	24	Wife	f	Married	8	\N	f	t	t	941	f	f		\N	f	House wife	Local	f		0
3170	1	1	7	ER / 0001 / 643 / 3	A. Syed Hishug	MALE	2013-10-08 01:00:00-04	2	Son	f	Single	N	\N	f	t	f	941	f	f		\N	f	child	Local	f		0
3195	1	1	7	ER / 0001 / 654 / 2	A.Jarina	FEMALE	1984-10-08 01:00:00-04	31	Wife	f	Married	SSLC	\N	f	t	t	952	f	f		\N	f	Tailor	Local	f		0
3196	1	1	7	ER / 0001 / 654 / 3	A.Mohammed Azarudeen	MALE	2002-10-08 01:00:00-04	13	Son	f	Single	8	\N	f	t	f	952	f	f		\N	f	Student	Local	f		0
3197	1	1	7	ER / 0001 / 654 / 4	A.Anushiya Banu	FEMALE	2005-10-08 01:00:00-04	10	Daughter	f	Single	5	\N	f	t	f	952	f	f		\N	f	Student	Local	f		0
3171	1	1	7	ER / 0001 / 644 / 		MALE	2014-10-08 01:00:00-04	1		f	Single		\N	f	t	f	942	f	f		\N	f		Local	f		0
3172	1	1	7	ER / 0001 / 645 / 1	K. Khaja Mohideen	MALE	1974-10-08 01:00:00-04	41	Family head	t	Married	8	\N	f	t	t	943	f	f		\N	f	Labour	Local	f		0
3173	1	1	7	ER / 0001 / 645 / 2	K. waseela	FEMALE	1977-10-08 01:00:00-04	38	Wife	f	Married	5	\N	f	t	t	943	f	f		\N	f	House wife	Local	f		0
3174	1	1	7	ER / 0001 / 645 / 3	K. Nasreen Fatima	FEMALE	2002-10-08 01:00:00-04	13	Daughter	f	Single	8	\N	f	t	f	943	f	f		\N	f	Student	Local	f		0
3175	1	1	7	ER / 0001 / 645 / 4	K. Nabila Parveen	FEMALE	2003-10-08 01:00:00-04	12	Daughter	f	Single	7	\N	f	t	f	943	f	f		\N	f	Student	Local	f		0
3176	1	1	7	ER / 0001 / 646 / 		MALE	2014-10-08 01:00:00-04	1		f	Single		\N	f	t	f	944	f	f		\N	f		Local	f		0
3177	1	1	7	ER / 0001 / 647 / 1	Tajuddin	MALE	1984-10-08 01:00:00-04	31	Family head	t	Married	5	\N	f	t	t	945	f	f		\N	f	Labour	Local	f		0
3178	1	1	7	ER / 0001 / 647 / 2	ummehani	FEMALE	1986-10-08 01:00:00-04	29	Wife	f	Married	8	\N	f	t	t	945	f	f		\N	f	House wife	Local	f		0
3179	1	1	7	ER / 0001 / 647 / 3	Riyaz	MALE	2007-10-08 01:00:00-04	8	Son	f	Single	1	\N	f	t	f	945	f	f		\N	f	Student	Local	f		0
3180	1	1	7	ER / 0001 / 647 / 4	Ajmal	MALE	2010-10-08 01:00:00-04	5	Son	f	Single	LKG	\N	f	t	f	945	f	f		\N	f	Student	Local	f		0
3181	1	1	7	ER / 0001 / 648 / 1	Abdul Kapoor	MALE	1975-10-08 01:00:00-04	40	Family head	t	Married	12	\N	f	t	t	946	f	f		\N	f	Mobile service	Local	f		0
3182	1	1	7	ER / 0001 / 648 / 2	Rizwana Parveen	FEMALE	1981-10-08 01:00:00-04	34	Wife	f	Married	alima	\N	f	t	t	946	f	f		\N	f	House wife	Local	f		0
3183	1	1	7	ER / 0001 / 648 / 3	Mohammed Adil	MALE	2009-10-08 01:00:00-04	6	Son	f	Single	1	\N	f	t	f	946	f	f		\N	f	child	Local	f		0
3184	1	1	7	ER / 0001 / 649 / 1	O. Salim Ahamed	MALE	1974-10-08 01:00:00-04	41	Family head	t	Married	SSLC	\N	f	t	t	947	f	f		\N	f	telephone operater	Local	f		0
3185	1	1	7	ER / 0001 / 649 / 2	S. RhamuNisha	FEMALE	1984-10-08 01:00:00-04	31	Wife	f	Married	SSLC	\N	f	t	t	947	f	f		\N	f	House wife	Local	f		0
3198	1	1	7	ER / 0001 / 655 / 1	Fathima	FEMALE	1951-10-08 01:00:00-05	64	Family head	t	Married		\N	f	t	t	953	f	f		\N	f		Local	f		0
3199	1	1	7	ER / 0001 / 655 / 2	Babu	MALE	1984-10-08 01:00:00-04	31	Son	f	Married	8	\N	f	t	t	953	f	f		\N	f		Local	f		0
3186	1	1	7	ER / 0001 / 650 / 		MALE	2014-10-08 01:00:00-04	1		f	Single		\N	f	t	f	948	f	f		\N	f		Local	f		0
3187	1	1	7	ER / 0001 / 651 / 1	Rajiya bagam	FEMALE	1954-10-08 01:00:00-05	61	Family head	t	Married		\N	f	t	t	949	f	f		\N	f	House wife	Local	f		0
3188	1	1	7	ER / 0001 / 651 / 2	Aktharunisha	FEMALE	1934-10-08 01:00:00-05	81	mother	f	Married		\N	f	t	t	949	f	f		\N	f	House wife	Local	f		0
3189	1	1	7	ER / 0001 / 652 / 1	Yusuf Alli	MALE	1952-10-08 01:00:00-05	63	Family head	t	Married	9	\N	f	t	t	950	f	f		\N	f	Labour	Local	f		0
3190	1	1	7	ER / 0001 / 652 / 2	Haseena Beeve	FEMALE	1957-10-08 01:00:00-04	58	Wife	f	Married		\N	f	t	t	950	f	f		\N	f		Local	f		0
3191	1	1	7	ER / 0001 / 653 / 1	A.Mumtaj Bagam	FEMALE	1949-10-08 01:00:00-05	66	Family head	t	Married		\N	f	t	t	951	f	f		\N	f		Local	f		0
3192	1	1	7	ER / 0001 / 653 / 2	A.Amjath khan	MALE	1983-10-08 01:00:00-04	32	Son	f	Married	MBA	\N	f	t	t	951	f	f		\N	f	baniyan godown	Local	f		0
3193	1	1	7	ER / 0001 / 653 / 3	A.sofiya parveen	FEMALE	1989-10-08 01:00:00-04	26	.Daughter Law	f	Married	UG	\N	f	t	t	951	f	f		\N	f	House wife	Local	f		0
3194	1	1	7	ER / 0001 / 654 / 1	M.Amerudeen Agamad	MALE	1973-10-08 01:00:00-04	42	Family head	t	Married	6	\N	f	t	t	952	f	f		\N	f	scrap sales	Local	f		0
3200	1	1	7	ER / 0001 / 655 / 3	Mubeena	FEMALE	1992-10-08 01:00:00-04	23	.Daughter Law	f	Married	12	\N	f	t	t	953	f	f		\N	f		Local	f		0
3201	1	1	7	ER / 0001 / 655 / 4	Rajiya bagam	FEMALE	1981-10-08 01:00:00-04	34	Daughter	f	Single		\N	f	t	t	953	f	f		\N	f		Local	f		0
3202	1	1	7	ER / 0001 / 655 / 5	Sagana	FEMALE	2013-10-08 01:00:00-04	2	.Grand Daughter	f	Single		\N	f	t	f	953	f	f		\N	f		Local	f		0
3203	1	1	7	ER / 0001 / 656 / 		MALE	2014-10-08 01:00:00-04	1		f	Single		\N	f	t	f	954	f	f		\N	f		Local	f		0
3204	1	1	7	ER / 0001 / 657 / 1	S.Kajali	MALE	1986-10-08 01:00:00-04	29	Family head	t	Married	6	\N	f	t	t	955	f	f		\N	f	Tailor	Local	f		0
3205	1	1	7	ER / 0001 / 657 / 2	Kurisith Bagam	FEMALE	1991-10-08 01:00:00-04	24	Wife	f	Married	12	\N	f	t	t	955	f	f		\N	f	House wife	Local	f		0
3206	1	1	7	ER / 0001 / 657 / 3	Sadiq	MALE	2012-10-08 01:00:00-04	3	Son	f	Single		\N	f	t	t	955	f	f		\N	f	child	Local	f		0
3209	2	2	26	TP / 0001 / 201 / 2	Abitha Begam	FEMALE	1976-06-21 01:00:00-04	39	WIFE	f	Aged Unmarried Woman	Y 	\N	f	t	f	957	f	f		\N	f	House WIFE	Local	f		0
3210	2	2	26	TP / 0001 / 201 / 3	Syed abuthagir	MALE	1998-06-21 01:00:00-04	17	SON	f	Aged Unmarried Woman		\N	f	t	f	957	f	f		\N	f	Seppel shop	Local	f		0
3211	2	2	26	TP / 0001 / 201 / 4	Mohamed Nishath	MALE	2002-06-21 01:00:00-04	13	SON	f	Aged Unmarried Woman		\N	f	t	f	957	f	f		\N	f	Student	Local	f		0
3212	2	2	26	TP / 0001 / 202 / 1	Sathick Basha	MALE	1971-06-21 01:00:00-04	44	HUSBAND	t	Aged Unmarried Woman	Y 	\N	f	t	f	958	f	f		\N	f	Readymade	Local	f		0
3213	2	2	26	TP / 0001 / 202 / 2	Hajira Banu	FEMALE	1978-06-21 01:00:00-04	37	WIFE	f	Single	Y 	\N	f	t	f	958	f	f		\N	f	House WIFE	Local	f		0
3214	2	2	26	TP / 0001 / 202 / 3	Baijul Islam	MALE	1997-06-21 01:00:00-04	18	SON	f	Aged Unmarried Woman		\N	f	t	f	958	f	f		\N	f	Student	Local	f		0
3215	2	2	26	TP / 0001 / 202 / 4	Bahath al Islam	MALE	2006-06-21 01:00:00-04	9	SON	f	Aged Unmarried Woman		\N	f	t	f	958	f	f		\N	f	Student	Local	f		0
3216	2	2	26	TP / 0001 / 203 / 1	SYED ALI FATHIMA	FEMALE	1971-06-21 01:00:00-04	44	House WIFE	t	Aged Unmarried Woman	Y	\N	f	t	t	959	f	f		\N	f	House Rest	Local	f		0
3217	2	2	26	TP / 0001 / 204 / 1	Syed mydeen	MALE	1953-06-21 01:00:00-04	62	HUSBAND	t	Aged Unmarried Woman	Y 	\N	f	t	f	960	f	f		\N	f	Court - rederd	Local	f		0
3218	2	2	26	TP / 0001 / 204 / 2	Ajima Banu	FEMALE	1970-06-21 01:00:00-04	45	WIFE	f	Aged Unmarried Woman	Y 	\N	f	t	f	960	f	f		\N	f	House WIFE	Local	f		0
3219	2	2	26	TP / 0001 / 204 / 3	Sobiya	FEMALE	1997-06-21 01:00:00-04	18	Daguter	f	Aged Unmarried Woman		\N	f	t	f	960	f	f		\N	f	Student	Local	f		0
3220	2	2	26	TP / 0001 / 204 / 4	Rosiya	FEMALE	1998-06-21 01:00:00-04	17	Daguter	f	Aged Unmarried Woman		\N	f	t	f	960	f	f		\N	f	Student	Local	f		0
3221	2	2	26	TP / 0001 / 205 / 1	Abdul Saththar	MALE	1945-06-21 01:00:00-04	70	HUSBAND	t	Aged Unmarried Woman	Y 	\N	f	t	f	961	f	f		\N	f	Honey Business	Local	f		0
3222	2	2	26	TP / 0001 / 205 / 2	Vagitha	FEMALE	1955-06-21 01:00:00-04	60	WIFE	f	Aged Unmarried Woman	Y 	\N	f	t	f	961	f	f		\N	f	House WIFE	Local	f		0
3223	2	2	26	TP / 0001 / 206 / 1	HABEEB NISHA	FEMALE	1930-06-21 01:00:00-04	85	HEAD	t	Single	Y	\N	f	t	t	962	f	f		\N	f	House Rest	Local	f		0
3224	2	2	26	TP / 0001 / 207 / 1	Mohamed Sameem	MALE	1976-06-21 01:00:00-04	39	Husband	t	Aged Unmarried Woman	Y 	\N	f	t	f	963	f	f		\N	f	Worker	Local	f		0
3225	2	2	26	TP / 0001 / 207 / 2	Kamila Fathima	FEMALE	1985-06-21 01:00:00-04	30	WIFE	f	Aged Unmarried Woman	Y 	\N	f	t	f	963	f	f		\N	f	House WIFE	Local	f		0
3226	2	2	26	TP / 0001 / 207 / 3	Salakutheen	MALE	2006-06-21 01:00:00-04	9	SON	f	Aged Unmarried Woman		\N	f	t	f	963	f	f		\N	f	Student	Local	f		0
3227	2	2	26	TP / 0001 / 207 / 4	Mohamed Sahith	MALE	2010-06-21 01:00:00-04	5	SON	f	Aged Unmarried Woman		\N	f	t	f	963	f	f		\N	f	Student	Local	f		0
3228	2	2	26	TP / 0001 / 207 / 5	Syed Rabiyammal	FEMALE	1945-06-21 01:00:00-04	70	Gmother	f	Single	Y 	\N	f	t	t	963	f	f		\N	f	House Rest	Local	f		0
3229	2	2	26	TP / 0001 / 208 / 1	Jannath nisha	FEMALE	1980-06-21 01:00:00-04	35	House WIFE	t	Aged Unmarried Woman	Y 	\N	f	t	t	964	f	f		\N	f	Teacher	Local	f		0
3230	2	2	26	TP / 0001 / 208 / 2	Mohamed yaser Arafath	MALE	1998-06-21 01:00:00-04	17	SON	f	Aged Unmarried Woman		\N	f	t	f	964	f	f		\N	f	Student	Local	f		0
3231	2	2	26	TP / 0001 / 208 / 3	Mohamed Ansari	MALE	2005-06-21 01:00:00-04	10	SON	f	Aged Unmarried Woman		\N	f	t	f	964	f	f		\N	f	Student	Local	f		0
3232	2	2	26	TP / 0001 / 209 / 1	Mubaral Ali	MALE	1969-06-21 01:00:00-04	46	HUSBAND	t	Aged Unmarried Woman	Y 	\N	f	t	t	965	f	f		\N	f	Accounter	Local	f		0
3233	2	2	26	TP / 0001 / 209 / 2	Faritha Begum	FEMALE	1983-06-21 01:00:00-04	32	WIFE	f	Aged Unmarried Woman	Y 	\N	f	t	t	965	f	f		\N	f	House WIFE	Local	f		0
3234	2	2	26	TP / 0001 / 209 / 3	Ramalan Parveen	FEMALE	2000-06-21 01:00:00-04	15	Daguter	f	Aged Unmarried Woman		\N	f	t	f	965	f	f		\N	f	Student	Local	f		0
3235	2	2	26	TP / 0001 / 209 / 4	Mohamed Nobil	MALE	2004-06-21 01:00:00-04	11	SON	f	Aged Unmarried Woman		\N	f	t	f	965	f	f		\N	f	Student	Local	f		0
3236	2	2	26	TP / 0001 / 210 / 1	Ahamed basha	MALE	1947-06-21 01:00:00-04	68	HUSBAND	t	Aged Unmarried Woman	Y 	\N	f	t	t	966	f	f		\N	f	Worker	Local	f		0
3237	2	2	26	TP / 0001 / 210 / 2	Hamsath Raliya Begum	FEMALE	1957-06-21 01:00:00-04	58	WIFE	f	Aged Unmarried Woman	Y 	\N	f	t	t	966	f	f		\N	f	House WIFE	Local	f		0
3238	2	2	26	TP / 0001 / 211 / 1	Ameer Abbas	MALE	1978-06-21 01:00:00-04	37	HUSBAND	t	Aged Unmarried Woman	N	\N	f	t	t	967	f	f		\N	f	Fashion Shop	Local	f		0
3239	2	2	26	TP / 0001 / 211 / 2	Sakila Banu	FEMALE	1991-06-21 01:00:00-04	24	WIFE	f	Aged Unmarried Woman	Y 	\N	f	t	t	967	f	f		\N	f	House WIFE	Local	f		0
3240	2	2	26	TP / 0001 / 211 / 3	Rabiya	FEMALE	2014-06-21 01:00:00-04	1	Daguter	f	Single	Y	\N	f	t	t	967	f	f		\N	f	Childern	Local	f		0
3241	2	2	26	TP / 0001 / 212 / 1	Mohamed ali	MALE	1953-06-21 01:00:00-04	62	HUSBAND	t	Aged Unmarried Woman	Y	\N	f	t	t	968	f	f		\N	f	Malikai Kadai	Local	f		0
3242	2	2	26	TP / 0001 / 212 / 2	Naseera Begum	FEMALE	1963-06-21 01:00:00-04	52	WIFE	f	Aged Unmarried Woman	Y	\N	f	t	t	968	f	f		\N	f	House WIFE	Local	f		0
3243	2	2	26	TP / 0001 / 212 / 3	Mohamed Samathu Jallath	MALE	1985-06-21 01:00:00-04	30	SON	f	Aged Unmarried Woman	Y	\N	f	t	t	968	f	f		\N	f	Worker	Local	f		0
3244	2	2	26	TP / 0001 / 212 / 4	Mohamed Sahathugal Kalvath	MALE	1986-06-21 01:00:00-04	29	Daguter	f	Aged Unmarried Woman	Y	\N	f	t	t	968	f	f		\N	f	Worker	Local	f		0
3245	2	2	26	TP / 0001 / 212 / 5	Thaj nisha	FEMALE	1944-06-21 01:00:00-04	71	Mamiyar	f	Single		\N	f	t	t	968	f	f		\N	f	House Rest	Local	f		0
3246	2	2	26	TP / 0001 / 212 / 6	Sameetha Jalla	FEMALE	2000-06-21 01:00:00-04	15	Daguter	f	Aged Unmarried Woman		\N	f	t	f	968	f	f		\N	f	Student	Local	f		0
3247	2	2	26	TP / 0001 / 213 / 1	H.Sadiq basha	MALE	1983-06-21 01:00:00-04	32	HUSBAND	t	Aged Unmarried Woman	Y	\N	f	t	f	969	f	f		\N	f	Agiric	Local	f		0
3248	2	2	26	TP / 0001 / 213 / 2	Razia begum	FEMALE	1975-06-21 01:00:00-04	40	Sisiter	f	Aged Unmarried Woman	Y	\N	f	t	f	969	f	f		\N	f	House Rest	Local	f		0
3249	2	2	26	TP / 0001 / 213 / 3	Razhia begum	FEMALE	1980-06-21 01:00:00-04	35	Sisiter	f	Aged Unmarried Woman	Y	\N	f	t	f	969	f	f		\N	f	House Rest	Local	f		0
3250	2	2	26	TP / 0001 / 214 / 1	Basher Ahamed 	MALE	1973-06-21 01:00:00-04	42	HUSBAND	t	Aged Unmarried Woman	N	\N	f	t	t	970	f	f		\N	f	Worker	Local	f		0
3251	2	2	26	TP / 0001 / 214 / 2	Balkes Begum	FEMALE	1981-06-21 01:00:00-04	34	WIFE	f	Aged Unmarried Woman	Y	\N	f	t	t	970	f	f		\N	f	House WIFE	Local	f		0
3252	2	2	26	TP / 0001 / 214 / 3	Yasmin banu	FEMALE	2000-06-21 01:00:00-04	15	Daguter	f	Aged Unmarried Woman	N	\N	f	t	f	970	f	f		\N	f	Student	Local	f		0
3253	2	2	26	TP / 0001 / 214 / 4	Noorul basriya	FEMALE	2001-06-21 01:00:00-04	14	Daguter	f	Aged Unmarried Woman	N	\N	f	t	f	970	f	f		\N	f	Student	Local	f		0
3254	2	2	26	TP / 0001 / 215 / 1	Mohaideen meera shahip	MALE	1965-06-21 01:00:00-04	50	HUSBAND	t	Aged Unmarried Woman	Y	\N	f	t	t	971	f	f		\N	f	Malikai Kadai	Local	f		0
3255	2	2	26	TP / 0001 / 215 / 2	Shipa Begum	FEMALE	1970-06-21 01:00:00-04	45	WIFE	f	Aged Unmarried Woman	Y	\N	f	t	t	971	f	f		\N	f	House WIFE	Local	f		0
3256	2	2	26	TP / 0001 / 215 / 3	Asarutheen	FEMALE	1993-06-21 01:00:00-04	22	SON	f	Aged Unmarried Woman	Y	\N	f	t	f	971	f	f		\N	f	Milk Business	Local	f		0
3257	2	2	26	TP / 0001 / 216 / 1	MOHAMED IBRAHIM	MALE	1935-06-21 01:00:00-04	80	HEAD	t	Single	Y	\N	f	t	t	972	f	f		\N	f	House Rest	Local	f		0
3258	2	2	26	TP / 0001 / 216 / 	SHAHARVAN BEEVI	FEMALE	1952-06-21 01:00:00-04	63	WIFE	f	Single	Y	\N	f	t	t	972	f	f		\N	f	House Rest	Local	f		0
3259	2	2	26	TP / 0001 / 217 / 1	Jaibu nisha	FEMALE	1968-06-21 01:00:00-04	47	WIFE	t	Aged Unmarried Woman	Y	\N	f	t	t	973	f	f		\N	f	House WIFE	Local	f		0
3260	2	2	26	TP / 0001 / 217 / 2	Anwer basha	MALE	1987-06-21 01:00:00-04	28	SON	f	Aged Unmarried Woman	Y	\N	f	t	t	973	f	f		\N	f	Worker	Local	f		0
3261	2	2	26	TP / 0001 / 217 / 3	Jasmin	FEMALE	1995-06-21 01:00:00-04	20	Daguter	f	Aged Unmarried Woman	Y	\N	f	t	f	973	f	f		\N	f	House Rest	Local	f		0
3262	2	2	26	TP / 0001 / 217 / 4	Nisha Fathima	FEMALE	1989-06-21 01:00:00-04	26	Dagutering Law	f	Aged Unmarried Woman	Y	\N	f	t	t	973	f	f		\N	f	House Rest	Local	f		0
3263	2	2	26	TP / 0001 / 217 / 5	Ishera Apsha	FEMALE	2013-06-21 01:00:00-04	2	Grand daguter	f	Single	N	\N	f	t	f	973	f	f		\N	f	Childern	Local	f		0
3264	2	2	26	TP / 0001 / 217 / 6	Ishina Apra	FEMALE	2014-06-21 01:00:00-04	1	Grand daguter	f	Single	N	\N	f	t	f	973	f	f		\N	f	Childern	Local	f		0
3265	2	2	26	TP / 0001 / 218 / 1	MASUTH BEVI	FEMALE	1951-06-21 01:00:00-04	64	House WIFE	t	Single	Y	\N	f	t	t	974	f	f		\N	f	House Rest	Local	f		0
3266	2	2	26	TP / 0001 / 218 / 2	AVAMMA BEGUM	FEMALE	1981-06-21 01:00:00-04	34	SON	f	Aged Unmarried Woman	Y	\N	f	t	t	974	f	f		\N	f	House Rest	Local	f		0
3267	2	2	26	TP / 0001 / 218 / 3	ABBAS	MALE	1999-06-21 01:00:00-04	16	G SON	f	Aged Unmarried Woman		\N	f	t	f	974	f	f		\N	f	STUDENT	Local	f		0
3268	2	2	26	TP / 0001 / 219 / 1	Noorul huq	MALE	1967-06-21 01:00:00-04	48	HUSBAND	t	Aged Unmarried Woman	Y	\N	f	t	t	975	f	f		\N	f	Worker	Local	f		0
3269	2	2	26	TP / 0001 / 219 / 2	FARITHA BANU	FEMALE	1978-06-21 01:00:00-04	37	WIFE	f	Aged Unmarried Woman	Y	\N	f	t	t	975	f	f		\N	f	Worker	Local	f		0
3270	2	2	26	TP / 0001 / 219 / 3	SYED ABUTHAHIR	FEMALE	2000-06-21 01:00:00-04	15	SON	f	Aged Unmarried Woman	N	\N	f	t	f	975	f	f		\N	f	Student	Local	f		0
3271	2	2	26	TP / 0001 / 220 / 1	BASHER AHAMED 	MALE	1953-06-21 01:00:00-04	62	HUSBAND	t	Aged Unmarried Woman	Y	\N	f	t	t	976	f	f		\N	f	Worker	Local	f		0
3272	2	2	26	TP / 0001 / 220 / 2	ASEEYA BEGUM	FEMALE	1963-06-21 01:00:00-04	52	WIFE	f	Aged Unmarried Woman	Y	\N	f	t	t	976	f	f		\N	f	House WIFE	Local	f		0
3273	2	2	26	TP / 0001 / 220 / 3	MOHEMD HAKKIM	MALE	1986-06-21 01:00:00-04	29	SON	f	Aged Unmarried Woman	N	\N	f	t	f	976	f	f		\N	f		Local	f		0
3274	2	2	26	TP / 0001 / 221 / 1	SHAHUL HAMEED	MALE	1966-06-21 01:00:00-04	49	HUSBAND	t	Aged Unmarried Woman	Y	\N	f	t	t	977	f	f		\N	f	Worker	Local	f		0
3275	2	2	26	TP / 0001 / 221 / 2	NOORUL BASHRIYA	FEMALE	1975-06-21 01:00:00-04	40	House WIFE	f	Aged Unmarried Woman	Y	\N	f	t	t	977	f	f		\N	f	House WIFE	Local	f		0
3276	2	2	26	TP / 0001 / 221 / 3	NUSHRATH SULTHANA	FEMALE	2000-06-21 01:00:00-04	15	DAGUTER	f	Aged Unmarried Woman	N	\N	f	t	f	977	f	f		\N	f	Student	Local	f		0
3277	2	2	26	TP / 0001 / 221 / 4	MOHAMED SULAIMAAN	MALE	2003-06-21 01:00:00-04	12	SON	f	Aged Unmarried Woman	N	\N	f	t	f	977	f	f		\N	f	Student	Local	f		0
3278	2	2	26	TP / 0001 / 221 / 5	NAUSIN BARHANA	FEMALE	2004-06-21 01:00:00-04	11	SON	f	Aged Unmarried Woman	N	\N	f	t	f	977	f	f		\N	f	Student	Local	f		0
3279	2	2	26	TP / 0001 / 222 / 1	MD.Tharik	MALE	1981-06-21 01:00:00-04	34	HUSBAND	t	Aged Unmarried Woman	Y	\N	f	t	t	978	f	f		\N	f	Cable Dish	Local	f		0
3280	2	2	26	TP / 0001 / 222 / 2	Ummul Habeeba	FEMALE	1987-06-21 01:00:00-04	28	House WIFE	f	Aged Unmarried Woman	Y	\N	f	t	t	978	f	f		\N	f	House Wife	Local	f		0
3281	2	2	26	TP / 0001 / 222 / 3	MD ABDULLAH	MALE	2006-06-21 01:00:00-04	9	SON	f	Aged Unmarried Woman	N	\N	f	t	f	978	f	f		\N	f	Student 	Local	f		0
3282	2	2	26	TP / 0001 / 222 / 4	Ahamed Alsavuth	MALE	2010-06-21 01:00:00-04	5	SON	f	Aged Unmarried Woman	N	\N	f	t	f	978	f	f		\N	f	Student	Local	f		0
3283	2	2	26	TP / 0001 / 223 / 1	A.MUBARAK ALI	MALE	1981-06-21 01:00:00-04	34	HUSBAND	t	Aged Unmarried Woman	Y	\N	f	t	t	979	f	f		\N	f	ELECTRICAL LINE	Local	f		0
3284	2	2	26	TP / 0001 / 223 / 2	SABIRA BANU	FEMALE	1984-06-21 01:00:00-04	31	House Wife	f	Aged Unmarried Woman	Y	\N	f	t	t	979	f	f		\N	f	House WIFE	Local	f		0
3285	2	2	26	TP / 0001 / 223 / 3	ASBIYA BANU	FEMALE	2009-06-21 01:00:00-04	6	SON	f	Aged Unmarried Woman	N	\N	f	t	f	979	f	f		\N	f	Student	Local	f		0
3286	2	2	26	TP / 0001 / 223 / 4	AFRITH	FEMALE	2014-06-21 01:00:00-04	1	SON	f	Single	N	\N	f	t	f	979	f	f		\N	f	Childern	Local	f		0
3287	2	2	26	TP / 0001 / 224 / 1	Ayshima amma beevi	FEMALE	1945-06-21 01:00:00-04	70	House WIFE	t	Single	Y	\N	f	t	f	980	f	f		\N	f	House Rest	Local	f		0
3288	2	2	26	TP / 0001 / 224 / 2	MOHAMED IBRAHIM	MALE	1960-06-21 01:00:00-04	55	SON	f	Single		\N	f	t	f	980	f	f		\N	f		Local	f		0
3289	2	2	26	TP / 0001 / 225 / 1	IBRAHIM SHA	MALE	1968-06-21 01:00:00-04	47	HUSBAND	t	Aged Unmarried Woman	Y	\N	f	t	t	981	f	f		\N	f	Malikai Kadai	Local	f		0
3290	2	2	26	TP / 0001 / 225 / 2	THOWLATH BEGUM	FEMALE	1973-06-21 01:00:00-04	42	WIFE	f	Aged Unmarried Woman	Y	\N	f	t	t	981	f	f		\N	f	House WIFE	Local	f		0
3291	2	2	26	TP / 0001 / 226 / 1	MOHAMED ABBAS	MALE	1970-06-21 01:00:00-04	45	HUSBAND	t	Aged Unmarried Woman	Y	\N	f	t	t	982	f	f		\N	f	CARPENTER	Local	f		0
3292	2	2	26	TP / 0001 / 226 / 2	PARVEEN BANU	FEMALE	1981-06-21 01:00:00-04	34	WIFE	f	Aged Unmarried Woman	Y	\N	f	t	t	982	f	f		\N	f	House WIFE	Local	f		0
3293	2	2	26	TP / 0001 / 226 / 3	THAJILA BANU	FEMALE	2002-06-21 01:00:00-04	13	DAGUTER	f	Aged Unmarried Woman	N	\N	f	t	f	982	f	f		\N	f	STUDENT	Local	f		0
3294	2	2	26	TP / 0001 / 226 / 4	MOHAMED ABDULLAH	MALE	2003-06-21 01:00:00-04	12	SON	f	Aged Unmarried Woman	N	\N	f	t	f	982	f	f		\N	f	STUDENT	Local	f		0
3295	2	2	26	TP / 0001 / 226 / 5	YASEEN ARAFATH	MALE	2005-06-21 01:00:00-04	10	SON	f	Aged Unmarried Woman	N	\N	f	t	f	982	f	f		\N	f	STUDENT	Local	f		0
3296	2	2	26	TP / 0001 / 226 / 6	MOHAMED IMTHIYAS	MALE	2010-06-21 01:00:00-04	5	SON	f	Aged Unmarried Woman	N	\N	f	t	f	982	f	f		\N	f	STUDENT	Local	f		0
3297	2	2	26	TP / 0001 / 227 / 1	ABDUL HAMED	MALE	1955-06-21 01:00:00-04	60	HUSBAND	t	Aged Unmarried Woman	Y	\N	f	t	t	983	f	f		\N	f	Mettel Steel	Local	f		0
3298	2	2	26	TP / 0001 / 227 / 2	FAREETHA BEGUM	FEMALE	1958-06-21 01:00:00-04	57	WIFE	f	Aged Unmarried Woman	Y	\N	f	t	t	983	f	f		\N	f	House WIFE	Local	f		0
3299	2	2	26	TP / 0001 / 228 / 1	Fazial Rahman	MALE	1979-06-21 01:00:00-04	36	HUSBAND	t	Aged Unmarried Woman	Y	\N	f	t	t	984	f	f		\N	f	A/C MECHANIC	Local	f		0
3300	2	2	26	TP / 0001 / 228 / 2	MAHAMUTHA BEGUM	FEMALE	1984-06-21 01:00:00-04	31	WIFE	f	Aged Unmarried Woman	Y	\N	f	t	t	984	f	f		\N	f	HOUSE WIFE	Local	f		0
3301	2	2	26	TP / 0001 / 228 / 3	MD MUSTAFA	MALE	2002-06-21 01:00:00-04	13	SON	f	Aged Unmarried Woman	N	\N	f	t	f	984	f	f		\N	f	STUDENT	Local	f		0
3302	2	2	26	TP / 0001 / 228 / 4	MD ASAN	MALE	2005-06-21 01:00:00-04	10	SON	f	Aged Unmarried Woman	N	\N	f	t	f	984	f	f		\N	f	STUDENT	Local	f		0
3303	2	2	26	TP / 0001 / 229 / 1	MD THARIK	MALE	1978-06-21 01:00:00-04	37	HUSBAND	t	Aged Unmarried Woman	Y	\N	f	t	t	985	f	f		\N	f	BISCKET COMPNY	Local	f		0
3304	2	2	26	TP / 0001 / 229 / 2	SAHITHA	FEMALE	1981-06-21 01:00:00-04	34	WIFE	f	Aged Unmarried Woman	Y	\N	f	t	t	985	f	f		\N	f	House WIFE	Local	f		0
3305	2	2	26	TP / 0001 / 230 / 1	ABDUL HAMEETH	MALE	1973-06-21 01:00:00-04	42	HUSBAND	t	Aged Unmarried Woman	Y	\N	f	t	t	986	f	f		\N	f	Worker	Local	f		0
3306	2	2	26	TP / 0001 / 230 / 2	THAHITRA BANU	FEMALE	1980-06-21 01:00:00-04	35	WIFE	f	Aged Unmarried Woman	Y	\N	f	t	t	986	f	f		\N	f	House WIFE	Local	f		0
3307	2	2	26	TP / 0001 / 230 / 3	MOHAMED ROASN AKTHAR	MALE	1999-06-21 01:00:00-04	16	SON	f	Aged Unmarried Woman	N	\N	f	t	f	986	f	f		\N	f	STUDENT	Local	f		0
3308	2	2	26	TP / 0001 / 231 / 1	JALEEL RAHMAN	MALE	1962-06-21 01:00:00-04	53	HUSBAND	t	Aged Unmarried Woman	Y	\N	f	t	t	987	f	f		\N	f	Worker	Local	f		0
3309	2	2	26	TP / 0001 / 231 / 2	NAGOOR THAI	FEMALE	1968-06-21 01:00:00-04	47	WIFE	f	Aged Unmarried Woman	Y	\N	f	t	t	987	f	f		\N	f	House WIFE	Local	f		0
3310	2	2	26	TP / 0001 / 231 / 3	SATHIK SAIT	MALE	1986-06-21 01:00:00-04	29	SON	f	Aged Unmarried Woman	Y	\N	f	t	f	987	f	f		\N	f	Worker	Local	f		0
3311	2	2	26	TP / 0001 / 232 / 1	THOWLATH NISHA	FEMALE	1963-06-21 01:00:00-04	52	WIFE	t	Aged Unmarried Woman	Y	\N	f	t	t	988	f	f		\N	f	House WIFE	Local	f		0
3312	2	2	26	TP / 0001 / 232 / 2	ABDUL RASHEET	MALE	1983-06-21 01:00:00-04	32	SON	f	Aged Unmarried Woman	Y	\N	f	t	f	988	f	f		\N	f	House Rest	Local	f		0
3313	2	2	26	TP / 0001 / 232 / 3	ABDUL RAJATH	MALE	1990-06-21 01:00:00-04	25	SON	f	Aged Unmarried Woman	Y	\N	f	t	f	988	f	f		\N	f	Worker	Local	f		0
3314	2	2	26	TP / 0001 / 232 / 4	VAJITHA BANU	FEMALE	1991-06-21 01:00:00-04	24	DAUGTER	f	Aged Unmarried Woman	Y	\N	f	t	f	988	f	f		\N	f	House Rest	Local	f		0
3315	2	2	26	TP / 0001 / 233 / 1	MOHAMED SAIT	MALE	1961-06-21 01:00:00-04	54	HUSBAND	t	Aged Unmarried Woman	Y	\N	f	t	t	989	f	f		\N	f	Worker	Local	f		0
3316	2	2	26	TP / 0001 / 233 / 2	RASEETHA BEGUM	FEMALE	1966-06-21 01:00:00-04	49	WIFE	f	Aged Unmarried Woman	Y	\N	f	t	t	989	f	f		\N	f	House WIFE	Local	f		0
3317	2	2	26	TP / 0001 / 233 / 3	JAHIR HUSSAIN	MALE	1986-06-21 01:00:00-04	29	SON	f	Aged Unmarried Woman	Y	\N	f	t	f	989	f	f		\N	f	Worker	Local	f		0
3318	2	2	26	TP / 0001 / 233 / 4	ARIF ROJA	FEMALE	1997-06-21 01:00:00-04	18	DAUGTER	f	Aged Unmarried Woman	N	\N	f	t	f	989	f	f		\N	f	House Rest	Local	f		0
3319	2	2	26	TP / 0001 / 233 / 5	MUMTHAJ	FEMALE	2000-06-21 01:00:00-04	15	DAUGTER	f	Aged Unmarried Woman	N	\N	f	t	f	989	f	f		\N	f	STUDENT	Local	f		0
3320	2	2	26	TP / 0001 / 233 / 6	ABBAS	MALE	1993-06-21 01:00:00-04	22	SON	f	Aged Unmarried Woman	N	\N	f	t	f	989	f	f		\N	f	Worker	Local	f		0
3321	2	2	26	TP / 0001 / 234 / 1	UBAITHULLAH	MALE	1943-06-21 01:00:00-04	72	HOUSBEND	t	Aged Unmarried Woman	Y	\N	f	t	t	990	f	f		\N	f	House Rest	Local	f		0
3322	2	2	26	TP / 0001 / 234 / 2	RABIYA	FEMALE	1953-06-21 01:00:00-04	62	WIFE	f	Aged Unmarried Woman	Y	\N	f	t	t	990	f	f		\N	f	HOUSE REST	Local	f		0
3323	2	2	26	TP / 0001 / 235 / 1	ANWER ALI	MALE	1962-06-21 01:00:00-04	53	HUSBAND	t	Aged Unmarried Woman	Y	\N	f	t	t	991	f	f		\N	f	BATHARAM BUSINESS	Local	f		0
3324	2	2	26	TP / 0001 / 235 / 2	MEHARAJ BEGUM	FEMALE	1967-06-21 01:00:00-04	48	WIFE	f	Aged Unmarried Woman	Y	\N	f	t	t	991	f	f		\N	f	House WIFE	Local	f		0
3325	2	2	26	TP / 0001 / 235 / 3	ALIF RAJA	MALE	1989-06-21 01:00:00-04	26	SON	f	Aged Unmarried Woman	Y	\N	f	t	t	991	f	f		\N	f	COMPUTER CETER WORK	Local	f		0
3326	2	2	26	TP / 0001 / 235 / 4	YASMIN  	FEMALE	1996-06-21 01:00:00-04	19	DAUGTER LAW	f	Aged Unmarried Woman	Y	\N	f	t	t	991	f	f		\N	f	House WIFE	Local	f		0
3327	2	2	26	TP / 0001 / 235 / 5	AJMAL RIYAAZ	MALE	1993-06-21 01:00:00-04	22	SON	f	Aged Unmarried Woman	Y	\N	f	t	f	991	f	f		\N	f	Worker	Local	f		0
3328	2	2	26	TP / 0001 / 235 / 6	APSARA BANU	FEMALE	1996-06-21 01:00:00-04	19	DAUGTER	f	Aged Unmarried Woman	N	\N	f	t	f	991	f	f		\N	f	STUDENT	Local	f		0
3329	2	2	26	TP / 0001 / 236 / 1	HABEEBULLAH	MALE	1960-06-21 01:00:00-04	55	HUSBAND	t	Aged Unmarried Woman	Y	\N	f	t	t	992	f	f		\N	f	REST	Local	f		0
3330	2	2	26	TP / 0001 / 236 / 2	APROJ	FEMALE	1964-06-21 01:00:00-04	51	WIFE	f	Aged Unmarried Woman	Y	\N	f	t	t	992	f	f		\N	f	House WIFE	Local	f		0
3331	2	2	26	TP / 0001 / 236 / 3	UMMU SALMA BEVI	FEMALE	1933-06-21 01:00:00-04	82	MOTHER	f	Single	Y	\N	f	t	t	992	f	f		\N	f	REST	Local	f		0
3332	2	2	26	TP / 0001 / 237 / 1	MOHAMED ABUTHAHIR	MALE	1982-06-21 01:00:00-04	33	HUSBAND	t	Aged Unmarried Woman	Y	\N	f	t	t	993	f	f		\N	f	FURNICHER SHOP	Local	f		0
3333	2	2	26	TP / 0001 / 237 / 2	HAMAR NISHA	FEMALE	1994-06-21 01:00:00-04	21	WIFE	f	Aged Unmarried Woman	Y	\N	f	t	t	993	f	f		\N	f	House WIFE	Local	f		0
3334	2	2	26	TP / 0001 / 237 / 3	SAJNA	FEMALE	2013-06-21 01:00:00-04	2	DAUGTER	f	Single	N	\N	f	t	f	993	f	f		\N	f	Childern	Local	f		0
3335	2	2	26	TP / 0001 / 238 / 1	ABUTHAHIR	MALE	1985-06-21 01:00:00-04	30	HUSBAND	t	Aged Unmarried Woman	Y	\N	f	t	t	994	f	f		\N	f	HOTEL WORK	Local	f		0
3336	2	2	26	TP / 0001 / 238 / 2	SABINA BEGUM	FEMALE	1990-06-21 01:00:00-04	25	WIFE	f	Single	Y	\N	f	t	t	994	f	f		\N	f	House WIFE	Local	f		0
3337	2	2	26	TP / 0001 / 238 / 3	ASMA	FEMALE	2012-06-21 01:00:00-04	3	DAUGTER	f	Single	Y	\N	f	t	t	994	f	f		\N	f	Childern	Local	f		0
3338	2	2	26	TP / 0001 / 239 / 1	SABURA BEEVI	FEMALE	1952-06-21 01:00:00-04	63	House WIFE	t	Aged Unmarried Woman	Y	\N	f	t	t	995	f	f		\N	f	House Rest	Local	f		0
3339	2	2	26	TP / 0001 / 240 / 1	AZEEZ RAHMAN	MALE	1970-06-21 01:00:00-04	45	HOUSBEND	t	Aged Unmarried Woman	Y	\N	f	t	t	996	f	f		\N	f	TEXTILE WORK	Local	f		0
3340	2	2	26	TP / 0001 / 240 / 2	SAAJITHA BANU	FEMALE	1983-06-21 01:00:00-04	32	WIFE	f	Aged Unmarried Woman	Y	\N	f	t	t	996	f	f		\N	f	HOUSE WIFE	Local	f		0
3341	2	2	26	TP / 0001 / 240 / 3	MOHAMED HARRIS	MALE	2001-06-21 01:00:00-04	14	DAUGTER	f	Aged Unmarried Woman	N	\N	f	t	f	996	f	f		\N	f	STUDENT	Local	f		0
3342	2	2	26	TP / 0001 / 240 / 4	AYUNF ARAFA	FEMALE	2004-06-21 01:00:00-04	11	SON	f	Aged Unmarried Woman	N	\N	f	t	f	996	f	f		\N	f	STUDENT	Local	f		0
3343	2	2	26	TP / 0001 / 241 / 1	OCHINAR NISHA	FEMALE	1943-06-21 01:00:00-04	72	MOTHER	t	Single	Y	\N	f	t	t	997	f	f		\N	f	House WIFE	Local	f		0
3344	2	2	26	TP / 0001 / 241 / 2	SYED ABUDHAHIR	MALE	1973-06-21 01:00:00-04	42	SON	f	Aged Unmarried Woman	Y	\N	f	t	t	997	f	f		\N	f	BUSINESS	Local	f		0
3345	2	2	26	TP / 0001 / 241 / 3	JINATHHAR	FEMALE	1980-06-21 01:00:00-04	35	DAUGTER LAW	f	Aged Unmarried Woman	Y	\N	f	t	t	997	f	f		\N	f	HOUSE WIFE	Local	f		0
3346	2	2	26	TP / 0001 / 241 / 4	MOHAMED MANSOOR	MALE	1997-06-21 01:00:00-04	18	G SON	f	Aged Unmarried Woman	N	\N	f	t	f	997	f	f		\N	f	STUDENT	Local	f		0
3347	2	2	26	TP / 0001 / 241 / 5	SYED JAINNATHUL FIRTHOUS	FEMALE	2005-06-21 01:00:00-04	10	G DAUGTER	f	Aged Unmarried Woman	N	\N	f	t	f	997	f	f		\N	f	STUDENT	Local	f		0
3348	2	2	26	TP / 0001 / 242 / 1	SYED ALI FATHIMA	FEMALE	1960-06-21 01:00:00-04	55	HOSUE WIFE	t	Aged Unmarried Woman	Y	\N	f	t	t	998	f	f		\N	f	House Rest	Local	f		0
3349	2	2	26	TP / 0001 / 242 / 2	ABDUL RAHEEM	MALE	1976-06-21 01:00:00-04	39	SON	f	Aged Unmarried Woman	Y	\N	f	t	t	998	f	f		\N	f	BUSINESS	Local	f		0
3350	2	2	26	TP / 0001 / 242 / 3	SHAJITHA BANU	FEMALE	1982-06-21 01:00:00-04	33	DAUGTER LAW	f	Aged Unmarried Woman	Y	\N	f	t	t	998	f	f		\N	f	House WIFE	Local	f		0
3351	2	2	26	TP / 0001 / 242 / 4	MOHAMED NOVBLE	MALE	2003-06-21 01:00:00-04	12	G SON	f	Aged Unmarried Woman	N	\N	f	t	f	998	f	f		\N	f	STUDENT	Local	f		0
3352	2	2	26	TP / 0001 / 242 / 5	RINA SERIN	FEMALE	2011-06-21 01:00:00-04	4	G DAUGTER	f	Aged Unmarried Woman	N	\N	f	t	f	998	f	f		\N	f	STUDENT	Local	f		0
3353	2	2	26	TP / 0001 / 242 / 6	HAJA MOHAIDEEN	MALE	1979-06-21 01:00:00-04	36	SON	f	Aged Unmarried Woman	Y	\N	f	t	t	998	f	f		\N	f	BUSINESS	Local	f		0
3354	2	2	26	TP / 0001 / 242 / 7	RESHMA BANU	FEMALE	1984-06-21 01:00:00-04	31	DAUGTER LAW	f	Aged Unmarried Woman	Y	\N	f	t	t	998	f	f		\N	f	House WIFE	Local	f		0
3355	2	2	26	TP / 0001 / 242 / 8	SYEDTHA JIYA PARVEEN	FEMALE	2007-06-21 01:00:00-04	8	G DAUGTER	f	Aged Unmarried Woman	N	\N	f	t	f	998	f	f		\N	f	STUDENT	Local	f		0
3356	2	2	26	TP / 0001 / 242 / 9	SYEDTHA RAIHANA PARVIN	FEMALE	2010-06-21 01:00:00-04	5	G DAUGTER	f	Aged Unmarried Woman	N	\N	f	t	f	998	f	f		\N	f	STUDENT	Local	f		0
3357	2	2	26	TP / 0001 / 242 / 10	ABDUL RAHEEM	MALE	1986-06-21 01:00:00-04	29	SON	f	Aged Unmarried Woman	Y	\N	f	t	f	998	f	f		\N	f	BUSINESS	Local	f		0
3358	2	2	26	TP / 0001 / 243 / 1	JAFFER ALI	MALE	1956-06-21 01:00:00-04	59	HUSBAND	t	Aged Unmarried Woman	Y	\N	f	t	t	999	f	f		\N	f	AGIRICULTURE	Local	f		0
3359	2	2	26	TP / 0001 / 243 / 2	BARAKATH NISHA	FEMALE	1965-06-21 01:00:00-04	50	WIFE	f	Aged Unmarried Woman	Y	\N	f	t	t	999	f	f		\N	f	House WIFE	Local	f		0
3360	2	2	26	TP / 0001 / 243 / 3	SATHIK BACHA	MALE	1980-06-21 01:00:00-04	35	SON	f	Aged Unmarried Woman	Y	\N	f	t	f	999	f	f		\N	f	AGIRICULTURE	Local	f		0
3361	2	2	26	TP / 0001 / 243 / 4	THASLEEM BACHA	MALE	1982-06-21 01:00:00-04	33	SON	f	Aged Unmarried Woman	Y	\N	f	t	t	999	f	f		\N	f	BUSINESS	Local	f		0
3362	2	2	26	TP / 0001 / 243 / 5	SABANA	FEMALE	1985-06-21 01:00:00-04	30	DAUGTER LAW	f	Aged Unmarried Woman	Y	\N	f	t	t	999	f	f		\N	f	House WIFE	Local	f		0
3363	2	2	26	TP / 0001 / 243 / 6	ABDUL SALAM	MALE	2012-06-21 01:00:00-04	3	G SON	f	Single	N	\N	f	t	f	999	f	f		\N	f	Childern	Local	f		0
3364	2	2	26	TP / 0001 / 243 / 7	HAJA MOHAIDEEN	MALE	1986-06-21 01:00:00-04	29	SON	f	Aged Unmarried Woman	Y	\N	f	t	t	999	f	f		\N	f	BUSINESS	Local	f		0
3365	2	2	26	TP / 0001 / 243 / 8	VAHITHA BANU	FEMALE	1988-06-21 01:00:00-04	27	DAUGTER LAW	f	Aged Unmarried Woman	Y	\N	f	t	t	999	f	f		\N	f	House WIFE	Local	f		0
3366	2	2	26	TP / 0001 / 243 / 9	MOHAMED RAIYAAN	MALE	2013-06-21 01:00:00-04	2	G SON	f	Single	N	\N	f	t	f	999	f	f		\N	f	Childern	Local	f		0
3367	2	2	26	TP / 0001 / 244 / 1	S.M.SAUKATH ALI	MALE	1958-06-21 01:00:00-04	57	HUSBAND	t	Aged Unmarried Woman	Y	\N	f	t	t	1000	f	f		\N	f	Worker	Local	f		0
3368	2	2	26	TP / 0001 / 244 / 2	KAMAR NISHA	FEMALE	1968-06-21 01:00:00-04	47	WIFE	f	Aged Unmarried Woman	Y	\N	f	t	t	1000	f	f		\N	f	House WIFE	Local	f		0
3369	2	2	26	TP / 0001 / 244 / 3	MOHAMED HASAN	MALE	1986-06-21 01:00:00-04	29	SON	f	Aged Unmarried Woman	Y	\N	f	t	f	1000	f	f		\N	f	JOB SERCHING	Local	f		0
3370	2	2	26	TP / 0001 / 244 / 4	SYED ALI FATHIMA	FEMALE	1991-06-21 01:00:00-04	24	DAUGTER	f	Aged Unmarried Woman	Y	\N	f	t	t	1000	f	f		\N	f	House WIFE	Local	f		0
3371	2	2	26	TP / 0001 / 244 / 5	BARAKATH NISHA	FEMALE	1995-06-21 01:00:00-04	20	DAUGTER	f	Aged Unmarried Woman	Y	\N	f	t	f	1000	f	f		\N	f	JOB SERCHING	Local	f		0
3372	2	2	26	TP / 0001 / 245 / 1	KALILUR RAHMAN	MALE	1970-06-21 01:00:00-04	45	HUSBAND	t	Aged Unmarried Woman	Y	\N	f	t	t	1001	f	f		\N	f	Worker	Local	f		0
3373	2	2	26	TP / 0001 / 245 / 2	SARMILA BEGUM	FEMALE	1981-06-21 01:00:00-04	34	WIFE	f	Aged Unmarried Woman	Y	\N	f	t	t	1001	f	f		\N	f	HOUSE WIFE	Local	f		0
3374	2	2	26	TP / 0001 / 246 / 1	MOHAMED RAFEK	MALE	1987-06-21 01:00:00-04	28	HUSBAND	t	Aged Unmarried Woman	Y	\N	f	t	t	1002	f	f		\N	f	CHICKEN STALL	Local	f		0
3375	2	2	26	TP / 0001 / 246 / 2	PARVEEN  	FEMALE	1989-06-21 01:00:00-04	26	WIFE	f	Aged Unmarried Woman	Y	\N	f	t	t	1002	f	f		\N	f	HOUSE WIFE	Local	f		0
3376	2	2	26	TP / 0001 / 246 / 3	RITHA FATHIMA	FEMALE	2008-06-21 01:00:00-04	7	DAUGTER	f	Aged Unmarried Woman	N	\N	f	t	f	1002	f	f		\N	f	STUDENT	Local	f		0
3377	2	2	26	TP / 0001 / 246 / 4	IRFATH FAATHIMA	FEMALE	2014-06-21 01:00:00-04	1	DAUGTER	f	Single	N	\N	f	t	f	1002	f	f		\N	f	Childern	Local	f		0
3378	2	2	26	TP / 0001 / 247 / 1	MUSTAFA	MALE	1972-06-21 01:00:00-04	43	HUSBAND	t	Aged Unmarried Woman	Y	\N	f	t	t	1003	f	f		\N	f	Worker	Local	f		0
3379	2	2	26	TP / 0001 / 247 / 2	FATHIMA	FEMALE	1975-06-21 01:00:00-04	40	WIFE	f	Aged Unmarried Woman	Y	\N	f	t	t	1003	f	f		\N	f	House Wife	Local	f		0
3380	2	2	26	TP / 0001 / 247 / 3	SADAM HUSAIN	MALE	1993-06-21 01:00:00-04	22	SON	f	Aged Unmarried Woman	Y	\N	f	t	f	1003	f	f		\N	f	STUDENT	Local	f		0
3381	2	2	26	TP / 0001 / 247 / 4	JAHIR HUSSAIN	MALE	1995-06-21 01:00:00-04	20	SON	f	Aged Unmarried Woman	Y	\N	f	t	f	1003	f	f		\N	f	STUDENT	Local	f		0
3382	2	2	26	TP / 0001 / 248 / 1	SHAJAKHAN	MALE	1972-06-21 01:00:00-04	43	HUSBAND	t	Aged Unmarried Woman	Y	\N	f	t	t	1004	f	f		\N	f	SMALL BUSINESS	Local	f		0
3383	2	2	26	TP / 0001 / 248 / 2	SASILA BANU	FEMALE	1980-06-21 01:00:00-04	35	WIFE	f	Aged Unmarried Woman	Y	\N	f	t	t	1004	f	f		\N	f	House WIFE	Local	f		0
3384	2	2	26	TP / 0001 / 248 / 3	NILOFAR BANU	FEMALE	1999-06-21 01:00:00-04	16	DAUGTER	f	Aged Unmarried Woman	N	\N	f	t	f	1004	f	f		\N	f	STUDENT	Local	f		0
3385	2	2	26	TP / 0001 / 248 / 4	ABDULLAH	MALE	2002-06-21 01:00:00-04	13	SON	f	Aged Unmarried Woman	N	\N	f	t	f	1004	f	f		\N	f	STUDENT	Local	f		0
3386	2	2	26	TP / 0001 / 249 / 1	HUSAIN AHAMED	MALE	1972-06-21 01:00:00-04	43	HUSBAND	t	Aged Unmarried Woman	Y	\N	f	t	t	1005	f	f		\N	f	Worker	Local	f		0
3387	2	2	26	TP / 0001 / 249 / 2	HAMSATH RAJIYAR	FEMALE	1977-06-21 01:00:00-04	38	WIFE	f	Aged Unmarried Woman	Y	\N	f	t	t	1005	f	f		\N	f	House WIFE	Local	t	Interest in Aalim/Hifz	0
3388	2	2	26	TP / 0001 / 250 / 1	BEERJHAN	FEMALE	1962-06-21 01:00:00-04	53	HUSBAND	t	Aged Unmarried Woman	Y	\N	f	t	t	1006	f	f		\N	f	LABUR	Local	f		0
3389	2	2	26	TP / 0001 / 251 / 1	ABDUL RAHEEM	MALE	1975-06-21 01:00:00-04	40	HUSBAND	t	Aged Unmarried Woman	Y	\N	f	t	t	1007	f	f		\N	f	BILLAL	Local	f		0
3390	2	2	26	TP / 0001 / 251 / 2	AMEENA BEGUM	FEMALE	1980-06-21 01:00:00-04	35	WIFE	f	Aged Unmarried Woman	Y	\N	f	t	t	1007	f	f		\N	f	Worker	Local	f		0
3391	2	2	26	TP / 0001 / 251 / 3	HABEEBU NISHA	FEMALE	1999-06-21 01:00:00-04	16	DAUGTER	f	Aged Unmarried Woman	N	\N	f	t	f	1007	f	f		\N	f	STUDENT	Local	f		0
3392	2	2	26	TP / 0001 / 251 / 4	BARAKATH ALI	MALE	2003-06-21 01:00:00-04	12	SON	f	Aged Unmarried Woman	N	\N	f	t	f	1007	f	f		\N	f	STUDENT	Local	f		0
3393	2	2	26	TP / 0001 / 252 / 1	ABDUL RAJAK	MALE	1963-06-21 01:00:00-04	52	HUSBAND	t	Aged Unmarried Woman	Y	\N	f	t	t	1008	f	f		\N	f	CELLPHONE SERVICE	Local	f		0
3394	2	2	26	TP / 0001 / 252 / 2	RAHILA BANU	FEMALE	1973-06-21 01:00:00-04	42	WIFE	f	Aged Unmarried Woman	Y	\N	f	t	t	1008	f	f		\N	f	HOUSE WIFE	Local	f		0
3395	2	2	26	TP / 0001 / 253 / 1	AMEENA BEEVI	FEMALE	1979-06-21 01:00:00-04	36	HUSBAND	t	Aged Unmarried Woman	Y	\N	f	t	t	1009	f	f		\N	f	Worker	Local	f		0
3396	2	2	26	TP / 0001 / 253 / 2	ABDUL RAHEEM	MALE	1969-06-21 01:00:00-04	46	WIFE	f	Aged Unmarried Woman	Y	\N	f	t	t	1009	f	f		\N	f	Worker	Local	f		0
3397	2	2	26	TP / 0001 / 253 / 3	ABIBU NISHA	FEMALE	2000-06-21 01:00:00-04	15	DAUGTER	f	Aged Unmarried Woman	N	\N	f	t	f	1009	f	f		\N	f	STUDENT	Local	f		0
3398	2	2	26	TP / 0001 / 253 / 4	BARAKKAR ALI	MALE	2003-06-21 01:00:00-04	12	SON	f	Aged Unmarried Woman	N	\N	f	t	f	1009	f	f		\N	f	STUDENT	Local	f		0
3402	7	7	18	RA / 0001 / 1 / 3402	Mohammed Ilyas	MALE	1993-11-30 01:00:00-05	22	Father	t	Married	MCA	\N	f	t	t	1012	f	f		\N	f	Developer	Local	f	\N	0
3401	7	7	18	RA / 0001 / 1 / 3401	Mohammed Ilyas	MALE	1993-11-30 01:00:00-05	22	Father	f	Married	MCA	\N	f	t	t	1012	f	f		\N	f	Developer	Local	f	\N	0
3400	7	7	18	RA / 0001 / 1 / 3400	Mohammed Ilyas	MALE	1993-11-30 01:00:00-05	22	Father	f	Married	MCA	\N	f	t	t	1012	f	f		\N	f	Developer	Local	f	\N	0
3399	7	7	18	RA / 0001 / 1 / 3399	Mohammed Ilyas	MALE	1993-11-30 01:00:00-05	22	Father	f	Married	MCA	\N	f	t	t	1012	f	f		\N	f	Developer	Local	f	\N	0
\.


--
-- Name: senses_member_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('senses_member_id_seq', 3402, true);


--
-- Data for Name: senses_member_scheme; Type: TABLE DATA; Schema: public; Owner: root
--

COPY senses_member_scheme (id, member_id, scheme_id, status, solution) FROM stdin;
36	123	11	t	Not Yet
46	161	11	t	Not Yet
3	14	11	t	Not Yet
4	17	11	t	Not Yet
5	18	11	t	Not Yet
6	19	1	t	Not Yet
7	19	5	t	Not Yet
8	24	11	t	Not Yet
9	25	11	t	Not Yet
10	29	11	t	Not Yet
11	30	11	t	Not Yet
12	35	11	t	Not Yet
13	36	11	t	Not Yet
15	42	11	t	Not Yet
16	43	11	t	Not Yet
17	46	11	t	Not Yet
18	47	11	t	Not Yet
19	48	1	t	Not Yet
20	49	1	t	Not Yet
21	52	11	t	Not Yet
22	60	12	t	Not Yet
23	61	12	t	Not Yet
24	67	12	t	Not Yet
25	70	11	t	Not Yet
26	71	11	t	Not Yet
28	80	10	t	Not Yet
29	80	11	t	Not Yet
2	13	11	t	Not Yet
30	81	10	t	Not Yet
31	81	11	t	Not Yet
32	91	12	t	Not Yet
33	105	11	t	Not Yet
83	116	12	t	Not Yet
84	121	8	t	Not Yet
37	131	12	t	Not Yet
38	132	11	t	Not Yet
39	142	1	t	Not Yet
40	144	12	t	Not Yet
42	150	8	t	Not Yet
43	151	11	t	Not Yet
99	274	11	t	Not Yet
100	275	11	t	Not Yet
47	169	11	t	Not Yet
48	170	1	t	Not Yet
49	175	11	t	Not Yet
50	176	1	t	Not Yet
51	184	11	t	Not Yet
52	185	11	t	Not Yet
53	198	1	t	Not Yet
54	201	12	t	Not Yet
56	203	11	t	Not Yet
57	206	12	t	Not Yet
58	213	1	t	Not Yet
59	218	11	t	Not Yet
60	219	3	t	Not Yet
61	219	11	t	Not Yet
62	222	12	t	Not Yet
63	223	12	t	Not Yet
64	224	12	t	Not Yet
65	225	1	t	Not Yet
66	226	1	t	Not Yet
67	230	11	t	Not Yet
69	232	11	t	Not Yet
70	233	1	t	Not Yet
71	236	11	t	Not Yet
72	239	10	t	Not Yet
73	239	11	t	Not Yet
74	240	10	t	Not Yet
75	240	11	t	Not Yet
76	241	10	t	Not Yet
77	241	11	t	Not Yet
78	247	11	t	Not Yet
79	105	1	t	Not Yet
80	106	11	t	Not Yet
82	109	11	t	Not Yet
34	112	1	t	Not Yet
35	122	11	t	Not Yet
85	122	12	t	Not Yet
86	128	1	t	Not Yet
87	129	1	t	Not Yet
88	255	12	t	Not Yet
89	256	11	t	Not Yet
90	259	11	t	Not Yet
91	147	1	t	Not Yet
92	150	10	t	Not Yet
93	150	9	t	Not Yet
95	265	11	t	Not Yet
96	266	11	t	Not Yet
97	270	11	t	Not Yet
98	271	11	t	Not Yet
44	156	1	t	Not Yet
45	160	11	t	Not Yet
101	278	11	t	Not Yet
102	281	8	t	Not Yet
103	281	12	t	Not Yet
104	282	11	t	Not Yet
105	283	11	t	Not Yet
106	284	11	t	Not Yet
108	306	12	t	Not Yet
109	310	11	t	Not Yet
110	311	11	t	Not Yet
111	312	5	t	Not Yet
112	318	11	t	Not Yet
113	319	11	t	Not Yet
114	322	11	t	Not Yet
115	323	11	t	Not Yet
116	326	11	t	Not Yet
117	330	3	t	Not Yet
118	331	2	t	Not Yet
119	341	11	t	Not Yet
121	345	2	t	Not Yet
122	352	11	t	Not Yet
123	358	11	t	Not Yet
124	361	10	t	Not Yet
125	361	11	t	Not Yet
126	362	2	t	Not Yet
127	362	5	t	Not Yet
128	363	5	t	Not Yet
129	364	3	t	Not Yet
130	368	11	t	Not Yet
131	369	11	t	Not Yet
132	370	11	t	Not Yet
134	379	1	t	Not Yet
135	384	11	t	Not Yet
136	385	11	t	Not Yet
137	387	4	t	Not Yet
138	397	5	t	Not Yet
139	398	5	t	Not Yet
140	401	10	t	Not Yet
141	401	11	t	Not Yet
142	402	10	t	Not Yet
143	402	11	t	Not Yet
144	403	10	t	Not Yet
145	403	11	t	Not Yet
147	409	12	t	Not Yet
159	439	8	t	Not Yet
160	439	10	t	Not Yet
161	440	10	t	Not Yet
162	440	11	t	Not Yet
163	441	10	t	Not Yet
164	441	11	t	Not Yet
165	442	1	t	Not Yet
166	442	5	t	Not Yet
167	443	1	t	Not Yet
168	444	2	t	Not Yet
169	446	1	t	Not Yet
170	450	11	t	Not Yet
172	456	2	t	Not Yet
173	459	11	t	Not Yet
174	460	11	t	Not Yet
175	461	11	t	Not Yet
176	464	11	t	Not Yet
177	466	1	t	Not Yet
178	468	3	t	Not Yet
179	468	5	t	Not Yet
180	469	2	t	Not Yet
181	473	8	t	Not Yet
182	474	12	t	Not Yet
183	476	8	t	Not Yet
185	500	8	t	Not Yet
186	503	3	t	Not Yet
187	505	1	t	Not Yet
188	507	8	t	Not Yet
189	513	11	t	Not Yet
190	514	11	t	Not Yet
191	515	1	t	Not Yet
192	516	1	t	Not Yet
193	529	3	t	Not Yet
194	538	12	t	Not Yet
195	539	8	t	Not Yet
196	539	12	t	Not Yet
198	540	5	t	Not Yet
199	543	12	t	Not Yet
200	544	11	t	Not Yet
201	555	8	t	Not Yet
202	556	12	t	Not Yet
203	559	11	t	Not Yet
204	560	11	t	Not Yet
205	565	11	t	Not Yet
206	566	5	t	Not Yet
207	567	3	t	Not Yet
208	568	3	t	Not Yet
209	579	1	t	Not Yet
211	589	11	t	Not Yet
212	590	11	t	Not Yet
213	593	4	t	Not Yet
214	593	8	t	Not Yet
215	603	12	t	Not Yet
216	604	11	t	Not Yet
217	613	8	t	Not Yet
218	623	12	t	Not Yet
219	631	11	t	Not Yet
220	632	11	t	Not Yet
221	653	3	t	Not Yet
222	658	11	t	Not Yet
224	669	11	t	Not Yet
225	672	11	t	Not Yet
226	676	11	t	Not Yet
227	677	11	t	Not Yet
228	687	11	t	Not Yet
229	688	11	t	Not Yet
230	691	3	t	Not Yet
231	692	3	t	Not Yet
232	694	1	t	Not Yet
233	694	5	t	Not Yet
234	696	3	t	Not Yet
235	696	12	t	Not Yet
237	703	12	t	Not Yet
238	706	12	t	Not Yet
239	707	12	t	Not Yet
240	708	11	t	Not Yet
241	713	10	t	Not Yet
242	718	11	t	Not Yet
243	719	11	t	Not Yet
244	720	1	t	Not Yet
245	723	11	t	Not Yet
246	724	11	t	Not Yet
247	728	3	t	Not Yet
248	737	11	t	Not Yet
250	741	11	t	Not Yet
251	742	11	t	Not Yet
252	747	1	t	Not Yet
253	750	11	t	Not Yet
254	751	11	t	Not Yet
255	756	4	t	Not Yet
256	760	1	t	Not Yet
257	761	1	t	Not Yet
258	762	1	t	Not Yet
259	767	11	t	Not Yet
260	772	11	t	Not Yet
261	773	3	t	Not Yet
263	778	11	t	Not Yet
264	784	3	t	Not Yet
265	787	11	t	Not Yet
266	788	11	t	Not Yet
267	807	12	t	Not Yet
268	808	1	t	Not Yet
269	812	8	t	Not Yet
270	816	3	t	Not Yet
271	816	11	t	Not Yet
272	821	11	t	Not Yet
273	822	11	t	Not Yet
274	825	1	t	Not Yet
276	832	10	t	Not Yet
277	833	10	t	Not Yet
278	834	1	t	Not Yet
279	840	12	t	Not Yet
280	845	11	t	Not Yet
281	846	11	t	Not Yet
282	849	11	t	Not Yet
283	850	11	t	Not Yet
284	852	8	t	Not Yet
285	857	8	t	Not Yet
286	868	10	t	Not Yet
287	868	12	t	Not Yet
289	874	10	t	Not Yet
290	874	12	t	Not Yet
291	875	11	t	Not Yet
292	885	12	t	Not Yet
293	888	8	t	Not Yet
294	896	8	t	Not Yet
295	897	8	t	Not Yet
296	897	12	t	Not Yet
297	900	8	t	Not Yet
298	900	10	t	Not Yet
299	900	11	t	Not Yet
300	900	12	t	Not Yet
302	901	10	t	Not Yet
154	434	10	t	Not Yet
155	434	11	t	Not Yet
332	1006	8	t	Not Yet
333	1010	3	t	Not Yet
334	1010	8	t	Not Yet
335	1010	10	t	Not Yet
336	1010	12	t	Not Yet
337	1013	11	t	Not Yet
338	1014	11	t	Not Yet
339	1017	11	t	Not Yet
340	1021	1	t	Not Yet
341	1023	12	t	Not Yet
342	1024	3	t	Not Yet
343	1024	12	t	Not Yet
344	1027	11	t	Not Yet
345	1028	11	t	Not Yet
346	1031	11	t	Not Yet
347	1039	2	t	Not Yet
348	1039	5	t	Not Yet
349	1040	4	t	Not Yet
350	1045	11	t	Not Yet
353	1050	11	t	Not Yet
354	1053	11	t	Not Yet
355	1058	11	t	Not Yet
356	1059	11	t	Not Yet
357	1060	11	t	Not Yet
358	1063	11	t	Not Yet
359	1064	11	t	Not Yet
360	1065	1	t	Not Yet
361	1068	8	t	Not Yet
362	1068	10	t	Not Yet
363	1069	3	t	Not Yet
364	1074	11	t	Not Yet
365	1075	11	t	Not Yet
366	1079	11	t	Not Yet
367	1080	11	t	Not Yet
368	1085	12	t	Not Yet
369	1086	12	t	Not Yet
370	1090	11	t	Not Yet
371	1103	11	t	Not Yet
372	1106	3	t	Not Yet
373	1107	9	t	Not Yet
374	1108	12	t	Not Yet
375	1110	1	t	Not Yet
376	1112	3	t	Not Yet
377	1115	12	t	Not Yet
378	1116	11	t	Not Yet
379	1120	11	t	Not Yet
380	1121	11	t	Not Yet
381	1126	3	t	Not Yet
382	1128	3	t	Not Yet
383	1138	10	t	Not Yet
384	1138	12	t	Not Yet
385	1141	5	t	Not Yet
386	1146	1	t	Not Yet
387	1146	5	t	Not Yet
388	1151	12	t	Not Yet
389	1155	12	t	Not Yet
390	1156	12	t	Not Yet
391	1157	11	t	Not Yet
392	1160	5	t	Not Yet
393	1169	3	t	Not Yet
394	1170	1	t	Not Yet
396	1183	8	t	Not Yet
397	1183	10	t	Not Yet
398	1184	1	t	Not Yet
399	1202	12	t	Not Yet
400	1230	12	t	Not Yet
401	1244	8	t	Not Yet
402	1244	12	t	Not Yet
1	8	11	t	Not Yet
14	38	11	t	Not Yet
27	76	11	t	Not Yet
41	149	3	t	Not Yet
55	202	11	t	Not Yet
68	231	11	t	Not Yet
81	249	11	t	Not Yet
94	154	11	t	Not Yet
107	285	11	t	Not Yet
120	342	11	t	Not Yet
133	371	1	t	Not Yet
146	404	5	t	Not Yet
148	411	1	t	Not Yet
149	415	11	t	Not Yet
150	416	11	t	Not Yet
151	418	1	t	Not Yet
152	429	11	t	Not Yet
153	430	11	t	Not Yet
156	435	10	t	Not Yet
157	435	11	t	Not Yet
158	436	1	t	Not Yet
171	453	11	t	Not Yet
184	491	1	t	Not Yet
197	540	1	t	Not Yet
210	581	1	t	Not Yet
223	666	12	t	Not Yet
236	697	11	t	Not Yet
249	738	11	t	Not Yet
262	777	11	t	Not Yet
275	826	1	t	Not Yet
288	871	6	t	Not Yet
301	901	8	t	Not Yet
303	902	11	t	Not Yet
304	910	12	t	Not Yet
305	914	11	t	Not Yet
306	922	12	t	Not Yet
307	923	11	t	Not Yet
308	924	11	t	Not Yet
309	928	12	t	Not Yet
310	936	11	t	Not Yet
311	944	12	t	Not Yet
312	945	12	t	Not Yet
313	948	11	t	Not Yet
314	956	11	t	Not Yet
315	957	11	t	Not Yet
316	958	11	t	Not Yet
317	962	12	t	Not Yet
318	963	1	t	Not Yet
319	965	2	t	Not Yet
320	965	5	t	Not Yet
321	969	11	t	Not Yet
322	970	11	t	Not Yet
323	971	12	t	Not Yet
324	972	11	t	Not Yet
325	980	2	t	Not Yet
326	984	2	t	Not Yet
327	990	1	t	Not Yet
328	998	11	t	Not Yet
329	1001	8	t	Not Yet
330	1001	10	t	Not Yet
331	1001	12	t	Not Yet
351	1046	11	t	Not Yet
352	1049	11	t	Not Yet
395	1175	1	t	Not Yet
403	1245	11	t	Not Yet
404	1248	11	t	Not Yet
405	1249	11	t	Not Yet
406	1257	3	t	Not Yet
407	1266	5	t	Not Yet
408	1270	1	t	Not Yet
409	1271	1	t	Not Yet
410	1274	12	t	Not Yet
411	1275	12	t	Not Yet
412	1282	11	t	Not Yet
413	1287	11	t	Not Yet
414	1288	11	t	Not Yet
415	1291	11	t	Not Yet
416	1320	11	t	Not Yet
417	1323	11	t	Not Yet
418	1324	11	t	Not Yet
419	1331	3	t	Not Yet
420	1332	11	t	Not Yet
421	1333	11	t	Not Yet
422	1334	11	t	Not Yet
423	1339	10	t	Not Yet
424	1341	3	t	Not Yet
425	1342	12	t	Not Yet
426	1343	12	t	Not Yet
427	1347	11	t	Not Yet
428	1348	11	t	Not Yet
429	1352	10	t	Not Yet
430	1356	12	t	Not Yet
431	1357	11	t	Not Yet
432	1361	10	t	Not Yet
433	1362	10	t	Not Yet
434	1366	1	t	Not Yet
435	1366	5	t	Not Yet
436	1372	12	t	Not Yet
437	1373	11	t	Not Yet
438	1374	11	t	Not Yet
439	1380	11	t	Not Yet
440	1381	11	t	Not Yet
441	1384	12	t	Not Yet
442	1402	11	t	Not Yet
443	1403	11	t	Not Yet
444	1404	5	t	Not Yet
445	1410	11	t	Not Yet
446	1411	6	t	Not Yet
447	1412	10	t	Not Yet
448	1413	10	t	Not Yet
449	1417	10	t	Not Yet
450	1417	11	t	Not Yet
451	1420	11	t	Not Yet
452	1424	11	t	Not Yet
453	1425	11	t	Not Yet
454	1431	1	t	Not Yet
455	1435	11	t	Not Yet
456	1436	11	t	Not Yet
457	1439	11	t	Not Yet
458	1444	12	t	Not Yet
459	1445	5	t	Not Yet
460	1447	10	t	Not Yet
461	1448	10	t	Not Yet
462	1448	12	t	Not Yet
463	1453	6	t	Not Yet
464	1456	11	t	Not Yet
465	1460	10	t	Not Yet
466	1460	12	t	Not Yet
467	1463	10	t	Not Yet
468	1463	12	t	Not Yet
469	1466	11	t	Not Yet
470	1467	11	t	Not Yet
471	1468	5	t	Not Yet
472	1470	1	t	Not Yet
473	1471	1	t	Not Yet
474	1474	11	t	Not Yet
475	1475	11	t	Not Yet
476	1484	1	t	Not Yet
477	1489	3	t	Not Yet
478	1489	10	t	Not Yet
479	1492	11	t	Not Yet
480	1493	11	t	Not Yet
481	1514	11	t	Not Yet
482	1515	11	t	Not Yet
483	1516	11	t	Not Yet
484	1517	11	t	Not Yet
485	1518	11	t	Not Yet
486	1522	11	t	Not Yet
487	1523	11	t	Not Yet
488	1528	11	t	Not Yet
489	1529	11	t	Not Yet
490	1533	11	t	Not Yet
491	1534	11	t	Not Yet
492	1543	10	t	Not Yet
493	1543	11	t	Not Yet
494	1550	10	t	Not Yet
495	1550	11	t	Not Yet
496	1555	1	t	Not Yet
497	1557	3	t	Not Yet
498	1558	3	t	Not Yet
499	1565	1	t	Not Yet
500	1575	11	t	Not Yet
501	1576	11	t	Not Yet
502	1579	11	t	Not Yet
503	1587	11	t	Not Yet
504	1588	11	t	Not Yet
505	1598	4	t	Not Yet
506	1601	1	t	Not Yet
507	1603	1	t	Not Yet
508	1607	10	t	Not Yet
509	1607	11	t	Not Yet
510	1611	11	t	Not Yet
511	1612	11	t	Not Yet
512	1615	10	t	Not Yet
513	1616	11	t	Not Yet
514	1619	11	t	Not Yet
515	1620	11	t	Not Yet
516	1623	12	t	Not Yet
517	1624	11	t	Not Yet
518	1625	11	t	Not Yet
519	1629	1	t	Not Yet
520	1634	11	t	Not Yet
521	1642	1	t	Not Yet
522	1644	11	t	Not Yet
523	1647	6	t	Not Yet
524	1648	11	t	Not Yet
525	1649	11	t	Not Yet
526	1650	5	t	Not Yet
527	1651	11	t	Not Yet
528	1660	10	t	Not Yet
529	1660	12	t	Not Yet
530	1661	10	t	Not Yet
531	1661	12	t	Not Yet
532	1668	11	t	Not Yet
533	1669	11	t	Not Yet
534	1670	11	t	Not Yet
535	1690	11	t	Not Yet
536	1692	5	t	Not Yet
537	1700	5	t	Not Yet
538	1701	11	t	Not Yet
539	1702	11	t	Not Yet
540	1705	5	t	Not Yet
541	1707	3	t	Not Yet
542	1707	9	t	Not Yet
543	1707	11	t	Not Yet
544	1708	3	t	Not Yet
545	1708	8	t	Not Yet
546	1711	8	t	Not Yet
547	1711	10	t	Not Yet
548	1711	12	t	Not Yet
549	1712	8	t	Not Yet
550	1712	10	t	Not Yet
551	1712	11	t	Not Yet
552	1713	4	t	Not Yet
553	1716	11	t	Not Yet
554	1717	11	t	Not Yet
555	1728	11	t	Not Yet
556	1729	1	t	Not Yet
557	1736	12	t	Not Yet
558	1737	11	t	Not Yet
559	1748	11	t	Not Yet
560	1749	11	t	Not Yet
561	1750	11	t	Not Yet
562	1757	11	t	Not Yet
563	1758	10	t	Not Yet
564	1758	12	t	Not Yet
565	1761	12	t	Not Yet
566	1762	12	t	Not Yet
567	1768	11	t	Not Yet
568	1769	11	t	Not Yet
569	1773	1	t	Not Yet
570	1776	11	t	Not Yet
571	1777	11	t	Not Yet
572	1783	1	t	Not Yet
573	1784	1	t	Not Yet
574	1789	11	t	Not Yet
575	1792	11	t	Not Yet
576	1798	11	t	Not Yet
577	1799	11	t	Not Yet
578	1803	11	t	Not Yet
579	1805	4	t	Not Yet
580	1810	11	t	Not Yet
581	1811	12	t	Not Yet
582	1812	11	t	Not Yet
583	1813	11	t	Not Yet
584	1814	11	t	Not Yet
585	1815	11	t	Not Yet
586	1818	11	t	Not Yet
587	1819	11	t	Not Yet
588	1826	1	t	Not Yet
589	1830	11	t	Not Yet
590	1831	11	t	Not Yet
591	1832	11	t	Not Yet
592	1836	11	t	Not Yet
593	1840	10	t	Not Yet
594	1849	10	t	Not Yet
595	1850	12	t	Not Yet
596	1851	1	t	Not Yet
597	1863	11	t	Not Yet
598	1867	1	t	Not Yet
599	1872	3	t	Not Yet
600	1872	8	t	Not Yet
601	1872	10	t	Not Yet
602	1873	10	t	Not Yet
603	1873	12	t	Not Yet
604	1874	5	t	Not Yet
605	1876	4	t	Not Yet
606	1878	1	t	Not Yet
607	1879	1	t	Not Yet
608	1882	4	t	Not Yet
609	1889	11	t	Not Yet
610	1890	11	t	Not Yet
611	1897	11	t	Not Yet
612	1901	11	t	Not Yet
613	1902	11	t	Not Yet
614	1903	11	t	Not Yet
615	1909	11	t	Not Yet
616	1910	11	t	Not Yet
617	1914	3	t	Not Yet
618	1914	12	t	Not Yet
619	1922	1	t	Not Yet
620	1924	4	t	Not Yet
621	1934	12	t	Not Yet
622	1935	4	t	Not Yet
623	1935	11	t	Not Yet
624	1941	3	t	Not Yet
625	1944	1	t	Not Yet
626	1945	1	t	Not Yet
627	1948	11	t	Not Yet
628	1949	11	t	Not Yet
629	1954	11	t	Not Yet
630	1957	11	t	Not Yet
631	1958	11	t	Not Yet
632	1961	12	t	Not Yet
633	1962	11	t	Not Yet
634	1965	12	t	Not Yet
635	1966	11	t	Not Yet
636	1970	3	t	Not Yet
637	1971	12	t	Not Yet
638	1982	12	t	Not Yet
639	1983	12	t	Not Yet
640	1985	11	t	Not Yet
641	1986	12	t	Not Yet
642	1994	12	t	Not Yet
643	1995	12	t	Not Yet
644	1999	11	t	Not Yet
645	2000	11	t	Not Yet
646	2002	1	t	Not Yet
647	2002	5	t	Not Yet
648	2018	5	t	Not Yet
649	2019	5	t	Not Yet
650	2022	3	t	Not Yet
651	2023	3	t	Not Yet
652	2024	1	t	Not Yet
653	2027	11	t	Not Yet
654	2029	12	t	Not Yet
655	2032	12	t	Not Yet
656	2033	12	t	Not Yet
657	2040	12	t	Not Yet
658	2041	11	t	Not Yet
659	2043	1	t	Not Yet
660	2043	5	t	Not Yet
661	2050	11	t	Not Yet
662	2051	11	t	Not Yet
663	2054	11	t	Not Yet
664	2056	5	t	Not Yet
665	2057	1	t	Not Yet
666	2059	11	t	Not Yet
667	2062	5	t	Not Yet
668	2065	11	t	Not Yet
669	2066	11	t	Not Yet
670	2074	11	t	Not Yet
671	2075	11	t	Not Yet
672	2081	1	t	Not Yet
673	2088	12	t	Not Yet
674	2089	11	t	Not Yet
675	2092	11	t	Not Yet
676	2093	11	t	Not Yet
677	2096	11	t	Not Yet
678	2100	11	t	Not Yet
679	2101	1	t	Not Yet
680	2102	1	t	Not Yet
681	2108	11	t	Not Yet
682	2109	11	t	Not Yet
683	2112	3	t	Not Yet
684	2113	12	t	Not Yet
685	2115	1	t	Not Yet
686	2122	12	t	Not Yet
687	2123	11	t	Not Yet
688	2124	1	t	Not Yet
689	2124	5	t	Not Yet
690	2127	11	t	Not Yet
691	2128	11	t	Not Yet
692	2131	3	t	Not Yet
693	2133	3	t	Not Yet
694	2135	1	t	Not Yet
695	2140	1	t	Not Yet
696	2140	5	t	Not Yet
697	2145	11	t	Not Yet
698	2146	11	t	Not Yet
699	2153	1	t	Not Yet
700	2156	11	t	Not Yet
701	2157	11	t	Not Yet
702	2160	6	t	Not Yet
703	2165	12	t	Not Yet
704	2169	1	t	Not Yet
705	2170	1	t	Not Yet
706	2174	11	t	Not Yet
707	2177	11	t	Not Yet
708	2180	11	t	Not Yet
709	2181	11	t	Not Yet
710	2191	1	t	Not Yet
711	2193	11	t	Not Yet
712	2194	5	t	Not Yet
713	2200	11	t	Not Yet
714	2203	8	t	Not Yet
715	2204	1	t	Not Yet
716	2204	5	t	Not Yet
717	2207	12	t	Not Yet
718	2208	11	t	Not Yet
719	2211	11	t	Not Yet
720	2212	11	t	Not Yet
721	2218	12	t	Not Yet
722	2219	7	t	Not Yet
723	2223	11	t	Not Yet
724	2229	1	t	Not Yet
725	2246	10	t	Not Yet
726	2249	11	t	Not Yet
727	2250	11	t	Not Yet
728	2251	1	t	Not Yet
729	2254	11	t	Not Yet
730	2255	11	t	Not Yet
731	2258	11	t	Not Yet
732	2259	11	t	Not Yet
733	2262	11	t	Not Yet
734	2265	11	t	Not Yet
735	2266	11	t	Not Yet
736	2268	1	t	Not Yet
737	2269	3	t	Not Yet
738	2270	3	t	Not Yet
739	2275	3	t	Not Yet
740	2284	3	t	Not Yet
741	2287	11	t	Not Yet
742	2288	11	t	Not Yet
743	2291	11	t	Not Yet
744	2294	6	t	Not Yet
745	2295	11	t	Not Yet
746	2297	3	t	Not Yet
747	2297	6	t	Not Yet
748	2304	6	t	Not Yet
749	2307	11	t	Not Yet
750	2308	11	t	Not Yet
751	2312	3	t	Not Yet
752	2316	11	t	Not Yet
753	2317	11	t	Not Yet
754	2320	11	t	Not Yet
755	2331	12	t	Not Yet
756	2332	11	t	Not Yet
757	2335	11	t	Not Yet
758	2336	11	t	Not Yet
759	2337	11	t	Not Yet
760	2338	12	t	Not Yet
761	2342	11	t	Not Yet
762	2343	11	t	Not Yet
763	2346	12	t	Not Yet
764	2349	11	t	Not Yet
765	2355	3	t	Not Yet
766	2359	11	t	Not Yet
767	2360	11	t	Not Yet
768	2363	12	t	Not Yet
769	2366	12	t	Not Yet
770	2367	12	t	Not Yet
771	2374	11	t	Not Yet
772	2381	11	t	Not Yet
773	2382	11	t	Not Yet
774	2385	12	t	Not Yet
775	2386	12	t	Not Yet
776	2388	1	t	Not Yet
777	2389	1	t	Not Yet
778	2392	12	t	Not Yet
779	2395	4	t	Not Yet
780	2395	10	t	Not Yet
781	2395	11	t	Not Yet
782	2396	10	t	Not Yet
783	2396	11	t	Not Yet
784	2397	5	t	Not Yet
785	2400	11	t	Not Yet
786	2404	3	t	Not Yet
787	2411	5	t	Not Yet
788	2412	1	t	Not Yet
789	2414	8	t	Not Yet
790	2414	12	t	Not Yet
791	2415	11	t	Not Yet
792	2418	10	t	Not Yet
793	2418	11	t	Not Yet
794	2419	10	t	Not Yet
795	2419	11	t	Not Yet
796	2422	11	t	Not Yet
797	2426	11	t	Not Yet
798	2427	11	t	Not Yet
799	2428	11	t	Not Yet
800	2432	8	t	Not Yet
801	2432	12	t	Not Yet
802	2433	8	t	Not Yet
803	2433	11	t	Not Yet
804	2436	11	t	Not Yet
805	2437	11	t	Not Yet
806	2442	11	t	Not Yet
807	2443	11	t	Not Yet
808	2444	2	t	Not Yet
809	2445	3	t	Not Yet
810	2446	3	t	Not Yet
811	2447	5	t	Not Yet
812	2451	12	t	Not Yet
813	2452	11	t	Not Yet
814	2456	11	t	Not Yet
815	2457	11	t	Not Yet
816	2458	2	t	Not Yet
817	2462	11	t	Not Yet
818	2463	11	t	Not Yet
819	2466	11	t	Not Yet
820	2467	11	t	Not Yet
821	2470	11	t	Not Yet
822	2471	11	t	Not Yet
823	2482	11	t	Not Yet
824	2483	2	t	Not Yet
825	2484	10	t	Not Yet
826	2484	12	t	Not Yet
827	2485	10	t	Not Yet
828	2485	12	t	Not Yet
829	2491	5	t	Not Yet
830	2495	10	t	Not Yet
831	2495	11	t	Not Yet
832	2496	5	t	Not Yet
833	2499	5	t	Not Yet
834	2500	4	t	Not Yet
835	2502	5	t	Not Yet
836	2503	5	t	Not Yet
837	2504	10	t	Not Yet
838	2504	11	t	Not Yet
839	2505	10	t	Not Yet
840	2505	11	t	Not Yet
841	2506	1	t	Not Yet
842	2507	1	t	Not Yet
843	2509	5	t	Not Yet
844	2510	3	t	Not Yet
845	2514	5	t	Not Yet
846	2515	5	t	Not Yet
847	2518	11	t	Not Yet
848	2519	11	t	Not Yet
849	2520	4	t	Not Yet
850	2524	5	t	Not Yet
851	2525	3	t	Not Yet
852	2525	12	t	Not Yet
853	2526	3	t	Not Yet
854	2526	12	t	Not Yet
855	2527	11	t	Not Yet
856	2530	2	t	Not Yet
857	2534	10	t	Not Yet
858	2534	11	t	Not Yet
859	2535	10	t	Not Yet
860	2535	11	t	Not Yet
861	2536	1	t	Not Yet
862	2536	5	t	Not Yet
863	2539	3	t	Not Yet
864	2542	10	t	Not Yet
865	2542	12	t	Not Yet
866	2543	10	t	Not Yet
867	2543	11	t	Not Yet
868	2544	5	t	Not Yet
869	2545	11	t	Not Yet
870	2546	11	t	Not Yet
871	2547	5	t	Not Yet
872	2548	5	t	Not Yet
873	2549	11	t	Not Yet
874	2550	11	t	Not Yet
875	2553	11	t	Not Yet
876	2554	11	t	Not Yet
877	2555	5	t	Not Yet
878	2556	3	t	Not Yet
879	2558	5	t	Not Yet
880	2559	1	t	Not Yet
881	2559	5	t	Not Yet
882	2560	1	t	Not Yet
883	2560	5	t	Not Yet
884	2561	4	t	Not Yet
885	2568	2	t	Not Yet
886	2568	5	t	Not Yet
887	2569	3	t	Not Yet
888	2569	6	t	Not Yet
889	2572	11	t	Not Yet
890	2573	11	t	Not Yet
891	2575	2	t	Not Yet
892	2580	11	t	Not Yet
893	2583	3	t	Not Yet
894	2587	11	t	Not Yet
895	2595	11	t	Not Yet
896	2596	1	t	Not Yet
897	2598	3	t	Not Yet
898	2600	2	t	Not Yet
899	2600	5	t	Not Yet
900	2601	3	t	Not Yet
901	2602	3	t	Not Yet
902	2603	3	t	Not Yet
903	2604	3	t	Not Yet
904	2605	3	t	Not Yet
905	2606	3	t	Not Yet
906	2607	3	t	Not Yet
907	2610	11	t	Not Yet
908	2613	12	t	Not Yet
909	2617	11	t	Not Yet
910	2618	11	t	Not Yet
911	2621	11	t	Not Yet
912	2622	11	t	Not Yet
913	2630	8	t	Not Yet
914	2630	10	t	Not Yet
915	2634	11	t	Not Yet
916	2635	11	t	Not Yet
917	2639	1	t	Not Yet
918	2640	8	t	Not Yet
919	2640	10	t	Not Yet
920	2643	4	t	Not Yet
921	2645	1	t	Not Yet
922	2645	5	t	Not Yet
923	2647	11	t	Not Yet
924	2649	1	t	Not Yet
925	2649	2	t	Not Yet
926	2650	1	t	Not Yet
927	2650	6	t	Not Yet
928	2651	5	t	Not Yet
929	2652	12	t	Not Yet
930	2653	12	t	Not Yet
931	2654	12	t	Not Yet
932	2657	12	t	Not Yet
933	2658	12	t	Not Yet
934	2662	11	t	Not Yet
935	2663	8	t	Not Yet
936	2663	10	t	Not Yet
937	2663	12	t	Not Yet
938	2664	5	t	Not Yet
939	2665	11	t	Not Yet
940	2666	11	t	Not Yet
941	2669	11	t	Not Yet
942	2672	3	t	Not Yet
943	2676	10	t	Not Yet
944	2676	12	t	Not Yet
945	2679	1	t	Not Yet
946	2688	4	t	Not Yet
947	2690	11	t	Not Yet
948	2698	11	t	Not Yet
949	2715	1	t	Not Yet
950	2718	3	t	Not Yet
951	2718	12	t	Not Yet
952	2719	1	t	Not Yet
953	2725	12	t	Not Yet
954	2726	11	t	Not Yet
955	2730	11	t	Not Yet
956	2735	11	t	Not Yet
957	2736	11	t	Not Yet
958	2740	12	t	Not Yet
959	2741	11	t	Not Yet
960	2750	10	t	Not Yet
961	2750	12	t	Not Yet
962	2753	11	t	Not Yet
963	2755	1	t	Not Yet
964	2758	11	t	Not Yet
965	2759	11	t	Not Yet
966	2764	1	t	Not Yet
967	2765	1	t	Not Yet
968	2772	3	t	Not Yet
969	2773	3	t	Not Yet
970	2785	1	t	Not Yet
971	2788	10	t	Not Yet
972	2799	12	t	Not Yet
973	2803	5	t	Not Yet
974	2809	11	t	Not Yet
975	2810	11	t	Not Yet
976	2811	1	t	Not Yet
977	2811	5	t	Not Yet
978	2812	3	t	Not Yet
979	2821	12	t	Not Yet
980	2825	3	t	Not Yet
981	2831	5	t	Not Yet
982	2840	11	t	Not Yet
983	2841	11	t	Not Yet
984	2844	11	t	Not Yet
985	2848	12	t	Not Yet
986	2849	11	t	Not Yet
987	2850	11	t	Not Yet
988	2853	12	t	Not Yet
989	2854	12	t	Not Yet
990	2857	12	t	Not Yet
991	2858	12	t	Not Yet
992	2874	11	t	Not Yet
993	2882	12	t	Not Yet
994	2892	12	t	Not Yet
995	2893	12	t	Not Yet
996	2895	12	t	Not Yet
997	2904	11	t	Not Yet
998	2905	11	t	Not Yet
999	2909	11	t	Not Yet
1000	2910	11	t	Not Yet
1001	2914	12	t	Not Yet
1002	2915	12	t	Not Yet
1003	2916	12	t	Not Yet
1004	2923	5	t	Not Yet
1005	2930	1	t	Not Yet
1006	2946	1	t	Not Yet
1007	2946	5	t	Not Yet
1008	2947	5	t	Not Yet
1009	2953	12	t	Not Yet
1010	2954	1	t	Not Yet
1011	2954	5	t	Not Yet
1012	2955	5	t	Not Yet
1013	2956	5	t	Not Yet
1014	2957	5	t	Not Yet
1015	2958	11	t	Not Yet
1016	2959	11	t	Not Yet
1017	2964	10	t	Not Yet
1018	2964	12	t	Not Yet
1019	2966	1	t	Not Yet
1020	2966	5	t	Not Yet
1021	2967	1	t	Not Yet
1022	2968	1	t	Not Yet
1023	2968	5	t	Not Yet
1024	2971	11	t	Not Yet
1025	2974	11	t	Not Yet
1026	2976	1	t	Not Yet
1027	2976	5	t	Not Yet
1028	2982	11	t	Not Yet
1029	2990	10	t	Not Yet
1030	2990	12	t	Not Yet
1031	2991	10	t	Not Yet
1032	2991	12	t	Not Yet
1033	2992	5	t	Not Yet
1034	2993	3	t	Not Yet
1035	3008	11	t	Not Yet
1036	3009	11	t	Not Yet
1037	3012	11	t	Not Yet
1038	3023	11	t	Not Yet
1039	3028	1	t	Not Yet
1040	3035	11	t	Not Yet
1041	3036	11	t	Not Yet
1042	3039	12	t	Not Yet
1043	3040	11	t	Not Yet
1044	3045	1	t	Not Yet
1045	3046	1	t	Not Yet
1046	3059	12	t	Not Yet
1047	3060	11	t	Not Yet
1048	3063	11	t	Not Yet
1049	3066	11	t	Not Yet
1050	3070	12	t	Not Yet
1051	3071	12	t	Not Yet
1052	3072	12	t	Not Yet
1053	3073	1	t	Not Yet
1054	3073	5	t	Not Yet
1055	3074	1	t	Not Yet
1056	3074	5	t	Not Yet
1057	3077	11	t	Not Yet
1058	3078	11	t	Not Yet
1059	3083	11	t	Not Yet
1060	3084	11	t	Not Yet
1061	3092	2	t	Not Yet
1062	3100	1	t	Not Yet
1063	3101	11	t	Not Yet
1064	3102	11	t	Not Yet
1065	3106	10	t	Not Yet
1066	3106	12	t	Not Yet
1067	3110	10	t	Not Yet
1068	3110	11	t	Not Yet
1069	3111	10	t	Not Yet
1070	3111	11	t	Not Yet
1071	3112	10	t	Not Yet
1072	3112	11	t	Not Yet
1073	3115	3	t	Not Yet
1074	3120	5	t	Not Yet
1075	3121	11	t	Not Yet
1076	3122	11	t	Not Yet
1077	3123	1	t	Not Yet
1078	3127	2	t	Not Yet
1079	3128	11	t	Not Yet
1080	3129	11	t	Not Yet
1081	3141	11	t	Not Yet
1082	3142	11	t	Not Yet
1083	3149	1	t	Not Yet
1084	3149	4	t	Not Yet
1085	3150	1	t	Not Yet
1086	3158	3	t	Not Yet
1087	3159	3	t	Not Yet
1088	3164	12	t	Not Yet
1089	3165	11	t	Not Yet
1090	3166	11	t	Not Yet
1091	3167	5	t	Not Yet
1092	3174	11	t	Not Yet
1093	3175	11	t	Not Yet
1094	3183	11	t	Not Yet
1095	3187	1	t	Not Yet
1096	3188	1	t	Not Yet
1097	3191	1	t	Not Yet
1098	3196	11	t	Not Yet
1099	3197	11	t	Not Yet
1100	3198	1	t	Not Yet
1101	3201	3	t	Not Yet
1102	3201	4	t	Not Yet
1103	3211	10	t	Not Yet
1104	3211	11	t	Not Yet
1105	3214	12	t	Not Yet
1106	3215	11	t	Not Yet
1107	3215	12	t	Not Yet
1108	3216	1	t	Not Yet
1109	3219	8	t	Not Yet
1110	3219	10	t	Not Yet
1111	3219	12	t	Not Yet
1112	3220	8	t	Not Yet
1113	3220	10	t	Not Yet
1114	3220	12	t	Not Yet
1115	3226	11	t	Not Yet
1116	3227	11	t	Not Yet
1117	3229	5	t	Not Yet
1118	3229	10	t	Not Yet
1119	3229	12	t	Not Yet
1120	3230	11	t	Not Yet
1121	3247	3	t	Not Yet
1122	3248	3	t	Not Yet
1123	3249	3	t	Not Yet
1124	3252	11	t	Not Yet
1125	3253	12	t	Not Yet
1126	3257	1	t	Not Yet
1127	3258	1	t	Not Yet
1128	3259	5	t	Not Yet
1129	3265	1	t	Not Yet
1130	3267	12	t	Not Yet
1131	3270	11	t	Not Yet
1132	3271	1	t	Not Yet
1133	3272	1	t	Not Yet
1134	3276	11	t	Not Yet
1135	3277	11	t	Not Yet
1136	3278	11	t	Not Yet
1137	3281	11	t	Not Yet
1138	3282	11	t	Not Yet
1139	3285	1	t	Not Yet
1140	3287	1	t	Not Yet
1141	3293	11	t	Not Yet
1142	3294	11	t	Not Yet
1143	3295	11	t	Not Yet
1144	3296	11	t	Not Yet
1145	3301	11	t	Not Yet
1146	3302	11	t	Not Yet
1147	3307	11	t	Not Yet
1148	3313	4	t	Not Yet
1149	3314	3	t	Not Yet
1150	3318	3	t	Not Yet
1151	3319	11	t	Not Yet
1152	3338	1	t	Not Yet
1153	3338	5	t	Not Yet
1154	3341	11	t	Not Yet
1155	3342	11	t	Not Yet
1156	3346	12	t	Not Yet
1157	3347	11	t	Not Yet
1158	3376	11	t	Not Yet
1159	3380	12	t	Not Yet
1160	3381	12	t	Not Yet
1161	3384	10	t	Not Yet
1162	3384	12	t	Not Yet
1163	3385	10	t	Not Yet
1164	3385	11	t	Not Yet
1165	3388	1	t	Not Yet
1166	3397	8	t	Not Yet
1167	3397	11	t	Not Yet
1168	3398	11	t	Not Yet
\.


--
-- Name: senses_member_scheme_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('senses_member_scheme_id_seq', 1168, true);


--
-- Data for Name: senses_member_service; Type: TABLE DATA; Schema: public; Owner: root
--

COPY senses_member_service (id, member_id, scheme_id, status, solution) FROM stdin;
5	6	11	t	Not Yet
6	7	11	t	Not Yet
7	8	11	t	Not Yet
8	9	11	t	Not Yet
9	15	11	t	Not Yet
10	16	11	t	Not Yet
11	17	11	t	Not Yet
12	18	11	t	Not Yet
13	22	11	t	Not Yet
14	23	11	t	Not Yet
15	24	11	t	Not Yet
17	27	11	t	Not Yet
18	28	11	t	Not Yet
19	29	11	t	Not Yet
20	30	11	t	Not Yet
21	31	11	t	Not Yet
22	32	11	t	Not Yet
23	33	11	t	Not Yet
24	34	11	t	Not Yet
25	35	11	t	Not Yet
26	36	11	t	Not Yet
27	37	11	t	Not Yet
28	38	11	t	Not Yet
30	40	11	t	Not Yet
31	41	11	t	Not Yet
32	42	11	t	Not Yet
33	43	11	t	Not Yet
34	44	11	t	Not Yet
35	45	11	t	Not Yet
36	46	11	t	Not Yet
37	47	11	t	Not Yet
38	48	11	t	Not Yet
39	49	11	t	Not Yet
40	50	11	t	Not Yet
41	51	11	t	Not Yet
43	56	11	t	Not Yet
44	57	11	t	Not Yet
45	58	11	t	Not Yet
46	59	11	t	Not Yet
47	60	11	t	Not Yet
48	61	11	t	Not Yet
49	63	5	t	Not Yet
50	64	5	t	Not Yet
51	72	2	t	Not Yet
52	72	11	t	Not Yet
53	73	2	t	Not Yet
54	73	11	t	Not Yet
55	83	2	t	Not Yet
56	106	2	t	Not Yet
57	205	2	t	Not Yet
58	90	1	t	Not Yet
59	258	2	t	Not Yet
60	148	5	t	Not Yet
61	279	5	t	Not Yet
62	279	6	t	Not Yet
63	279	11	t	Not Yet
64	280	11	t	Not Yet
65	281	1	t	Not Yet
66	281	11	t	Not Yet
67	282	11	t	Not Yet
69	284	11	t	Not Yet
70	285	11	t	Not Yet
71	286	11	t	Not Yet
72	287	11	t	Not Yet
73	288	11	t	Not Yet
74	289	11	t	Not Yet
75	290	11	t	Not Yet
76	291	11	t	Not Yet
77	292	11	t	Not Yet
78	293	11	t	Not Yet
79	294	11	t	Not Yet
80	295	11	t	Not Yet
82	296	5	t	Not Yet
83	296	11	t	Not Yet
84	308	2	t	Not Yet
85	308	6	t	Not Yet
86	308	9	t	Not Yet
87	313	1	t	Not Yet
88	313	2	t	Not Yet
89	314	2	t	Not Yet
90	314	5	t	Not Yet
91	315	2	t	Not Yet
92	315	5	t	Not Yet
93	317	2	t	Not Yet
95	324	11	t	Not Yet
96	325	5	t	Not Yet
97	325	11	t	Not Yet
98	326	11	t	Not Yet
99	329	2	t	Not Yet
100	332	5	t	Not Yet
101	333	5	t	Not Yet
102	337	5	t	Not Yet
103	337	11	t	Not Yet
104	338	5	t	Not Yet
105	338	11	t	Not Yet
106	345	2	t	Not Yet
108	354	5	t	Not Yet
109	355	5	t	Not Yet
110	359	5	t	Not Yet
111	363	2	t	Not Yet
112	363	5	t	Not Yet
113	363	8	t	Not Yet
114	366	2	t	Not Yet
115	366	5	t	Not Yet
116	381	2	t	Not Yet
117	381	5	t	Not Yet
118	389	3	t	Not Yet
119	413	5	t	Not Yet
121	427	5	t	Not Yet
122	432	8	t	Not Yet
123	452	5	t	Not Yet
124	468	4	t	Not Yet
125	505	11	t	Not Yet
126	692	2	t	Not Yet
127	700	2	t	Not Yet
128	904	5	t	Not Yet
129	906	5	t	Not Yet
130	935	5	t	Not Yet
131	939	2	t	Not Yet
132	967	8	t	Not Yet
134	975	5	t	Not Yet
135	975	8	t	Not Yet
136	976	5	t	Not Yet
137	978	5	t	Not Yet
138	978	12	t	Not Yet
139	979	12	t	Not Yet
140	984	12	t	Not Yet
141	985	12	t	Not Yet
142	986	5	t	Not Yet
143	986	12	t	Not Yet
144	987	12	t	Not Yet
145	988	12	t	Not Yet
147	994	12	t	Not Yet
176	1040	11	t	Not Yet
177	1041	2	t	Not Yet
178	1041	11	t	Not Yet
179	1042	11	t	Not Yet
180	1043	2	t	Not Yet
181	1043	11	t	Not Yet
182	1044	11	t	Not Yet
183	1045	11	t	Not Yet
184	1046	11	t	Not Yet
185	1047	11	t	Not Yet
186	1048	6	t	Not Yet
187	1048	11	t	Not Yet
188	1049	11	t	Not Yet
189	1050	11	t	Not Yet
190	1052	5	t	Not Yet
191	1052	11	t	Not Yet
192	1053	11	t	Not Yet
193	1054	11	t	Not Yet
194	1056	9	t	Not Yet
195	1056	11	t	Not Yet
196	1057	5	t	Not Yet
197	1057	11	t	Not Yet
198	1058	11	t	Not Yet
225	1150	2	t	Not Yet
226	1158	11	t	Not Yet
227	1160	11	t	Not Yet
228	1162	11	t	Not Yet
229	1166	11	t	Not Yet
230	1168	2	t	Not Yet
231	1170	11	t	Not Yet
232	1171	11	t	Not Yet
233	1175	11	t	Not Yet
234	1181	11	t	Not Yet
235	1186	11	t	Not Yet
236	1193	11	t	Not Yet
237	1215	11	t	Not Yet
238	1220	11	t	Not Yet
239	1224	11	t	Not Yet
240	1227	11	t	Not Yet
241	1228	11	t	Not Yet
242	1232	11	t	Not Yet
243	1242	11	t	Not Yet
244	1246	11	t	Not Yet
245	1250	11	t	Not Yet
246	1262	11	t	Not Yet
247	1265	2	t	Not Yet
248	1272	11	t	Not Yet
249	1274	2	t	Not Yet
250	1276	11	t	Not Yet
251	1280	11	t	Not Yet
252	1289	11	t	Not Yet
253	1292	11	t	Not Yet
254	1296	2	t	Not Yet
255	1309	2	t	Not Yet
256	1311	11	t	Not Yet
257	1324	11	t	Not Yet
258	1325	11	t	Not Yet
259	1328	5	t	Not Yet
260	1335	11	t	Not Yet
261	1349	11	t	Not Yet
262	1363	11	t	Not Yet
263	1375	11	t	Not Yet
264	1382	11	t	Not Yet
265	1383	5	t	Not Yet
266	1396	11	t	Not Yet
267	1404	11	t	Not Yet
268	1415	10	t	Not Yet
1	3	11	t	Not Yet
2	4	11	t	Not Yet
3	5	2	t	Not Yet
4	5	11	t	Not Yet
16	25	11	t	Not Yet
29	39	11	t	Not Yet
42	52	11	t	Not Yet
68	283	11	t	Not Yet
81	296	1	t	Not Yet
94	324	5	t	Not Yet
107	345	5	t	Not Yet
120	423	5	t	Not Yet
133	968	5	t	Not Yet
146	989	12	t	Not Yet
148	995	12	t	Not Yet
149	996	12	t	Not Yet
150	997	12	t	Not Yet
151	998	12	t	Not Yet
152	1001	9	t	Not Yet
153	1004	2	t	Not Yet
154	1006	1	t	Not Yet
155	1006	2	t	Not Yet
156	1009	1	t	Not Yet
157	1009	2	t	Not Yet
158	1010	2	t	Not Yet
159	1015	11	t	Not Yet
160	1016	2	t	Not Yet
161	1016	11	t	Not Yet
162	1018	11	t	Not Yet
163	1019	11	t	Not Yet
164	1020	11	t	Not Yet
165	1023	2	t	Not Yet
166	1029	11	t	Not Yet
167	1030	11	t	Not Yet
168	1031	11	t	Not Yet
169	1032	11	t	Not Yet
170	1033	11	t	Not Yet
171	1034	2	t	Not Yet
172	1034	11	t	Not Yet
173	1037	2	t	Not Yet
174	1039	11	t	Not Yet
175	1040	2	t	Not Yet
199	1059	11	t	Not Yet
200	1060	11	t	Not Yet
201	1061	2	t	Not Yet
202	1061	11	t	Not Yet
203	1062	2	t	Not Yet
204	1062	11	t	Not Yet
205	1063	11	t	Not Yet
206	1064	11	t	Not Yet
207	1067	2	t	Not Yet
208	1068	2	t	Not Yet
209	1072	8	t	Not Yet
210	1072	11	t	Not Yet
211	1077	11	t	Not Yet
212	1088	11	t	Not Yet
213	1101	11	t	Not Yet
214	1104	8	t	Not Yet
215	1112	4	t	Not Yet
216	1113	11	t	Not Yet
217	1118	8	t	Not Yet
218	1118	11	t	Not Yet
219	1119	5	t	Not Yet
220	1124	11	t	Not Yet
221	1130	11	t	Not Yet
222	1141	11	t	Not Yet
223	1143	11	t	Not Yet
224	1147	11	t	Not Yet
269	1415	11	t	Not Yet
270	1422	11	t	Not Yet
271	1431	10	t	Not Yet
272	1431	11	t	Not Yet
273	1441	11	t	Not Yet
274	1443	2	t	Not Yet
275	1445	11	t	Not Yet
276	1446	11	t	Not Yet
277	1453	11	t	Not Yet
278	1458	11	t	Not Yet
279	1468	2	t	Not Yet
280	1468	11	t	Not Yet
281	1476	11	t	Not Yet
282	1480	11	t	Not Yet
283	1486	11	t	Not Yet
284	1488	2	t	Not Yet
285	1491	2	t	Not Yet
286	1512	11	t	Not Yet
287	1520	11	t	Not Yet
288	1521	2	t	Not Yet
289	1525	2	t	Not Yet
290	1527	2	t	Not Yet
291	1531	5	t	Not Yet
292	1541	11	t	Not Yet
293	1542	2	t	Not Yet
294	1544	11	t	Not Yet
295	1545	2	t	Not Yet
296	1546	2	t	Not Yet
297	1546	11	t	Not Yet
298	1548	11	t	Not Yet
299	1551	11	t	Not Yet
300	1557	2	t	Not Yet
301	1558	2	t	Not Yet
302	1559	2	t	Not Yet
303	1566	11	t	Not Yet
304	1580	11	t	Not Yet
305	1584	11	t	Not Yet
306	1598	11	t	Not Yet
307	1603	10	t	Not Yet
308	1605	2	t	Not Yet
309	1606	2	t	Not Yet
310	1609	11	t	Not Yet
311	1617	11	t	Not Yet
312	1621	11	t	Not Yet
313	1629	11	t	Not Yet
314	1637	2	t	Not Yet
315	1638	2	t	Not Yet
316	1640	5	t	Not Yet
317	1648	2	t	Not Yet
318	1649	2	t	Not Yet
319	1650	10	t	Not Yet
320	1650	12	t	Not Yet
321	1652	11	t	Not Yet
322	1655	11	t	Not Yet
323	1662	11	t	Not Yet
324	1663	5	t	Not Yet
325	1666	11	t	Not Yet
326	1671	11	t	Not Yet
327	1677	11	t	Not Yet
328	1684	11	t	Not Yet
329	1686	2	t	Not Yet
330	1687	2	t	Not Yet
331	1689	2	t	Not Yet
332	1692	11	t	Not Yet
333	1693	2	t	Not Yet
334	1700	5	t	Not Yet
335	1711	2	t	Not Yet
336	1712	2	t	Not Yet
337	1713	6	t	Not Yet
338	1713	9	t	Not Yet
339	1719	2	t	Not Yet
340	1747	5	t	Not Yet
341	1764	2	t	Not Yet
342	1816	7	t	Not Yet
343	1839	2	t	Not Yet
344	1850	4	t	Not Yet
345	1857	5	t	Not Yet
346	1858	2	t	Not Yet
347	1866	2	t	Not Yet
348	1874	5	t	Not Yet
349	1881	5	t	Not Yet
350	1894	10	t	Not Yet
351	1918	5	t	Not Yet
352	1940	5	t	Not Yet
353	1987	4	t	Not Yet
354	2019	12	t	Not Yet
355	2020	5	t	Not Yet
356	2022	2	t	Not Yet
357	2022	12	t	Not Yet
358	2023	12	t	Not Yet
359	2030	11	t	Not Yet
360	2036	2	t	Not Yet
361	2053	2	t	Not Yet
362	2058	5	t	Not Yet
363	2067	11	t	Not Yet
364	2070	5	t	Not Yet
365	2072	11	t	Not Yet
366	2076	11	t	Not Yet
367	2078	2	t	Not Yet
368	2079	2	t	Not Yet
369	2080	2	t	Not Yet
370	2091	5	t	Not Yet
371	2094	11	t	Not Yet
372	2095	5	t	Not Yet
373	2098	2	t	Not Yet
374	2098	11	t	Not Yet
375	2099	5	t	Not Yet
376	2101	11	t	Not Yet
377	2103	2	t	Not Yet
378	2104	5	t	Not Yet
379	2107	5	t	Not Yet
380	2110	11	t	Not Yet
381	2112	5	t	Not Yet
382	2114	11	t	Not Yet
383	2120	11	t	Not Yet
384	2121	5	t	Not Yet
385	2126	5	t	Not Yet
386	2135	11	t	Not Yet
387	2136	11	t	Not Yet
388	2138	11	t	Not Yet
389	2147	11	t	Not Yet
390	2153	11	t	Not Yet
391	2160	12	t	Not Yet
392	2167	10	t	Not Yet
393	2171	5	t	Not Yet
394	2173	5	t	Not Yet
395	2178	11	t	Not Yet
396	2179	5	t	Not Yet
397	2182	11	t	Not Yet
398	2186	11	t	Not Yet
399	2191	11	t	Not Yet
400	2194	11	t	Not Yet
401	2194	12	t	Not Yet
402	2201	11	t	Not Yet
403	2214	5	t	Not Yet
404	2216	11	t	Not Yet
405	2239	11	t	Not Yet
406	2240	2	t	Not Yet
407	2247	11	t	Not Yet
408	2252	11	t	Not Yet
409	2257	5	t	Not Yet
410	2260	11	t	Not Yet
411	2261	5	t	Not Yet
412	2263	11	t	Not Yet
413	2264	5	t	Not Yet
414	2267	10	t	Not Yet
415	2267	11	t	Not Yet
416	2271	11	t	Not Yet
417	2277	11	t	Not Yet
418	2284	5	t	Not Yet
419	2289	11	t	Not Yet
420	2294	2	t	Not Yet
421	2323	2	t	Not Yet
422	2325	5	t	Not Yet
423	2329	11	t	Not Yet
424	2339	11	t	Not Yet
425	2344	10	t	Not Yet
426	2353	3	t	Not Yet
427	2355	2	t	Not Yet
428	2369	5	t	Not Yet
429	2379	11	t	Not Yet
430	2385	2	t	Not Yet
431	2386	2	t	Not Yet
432	2391	2	t	Not Yet
433	2397	9	t	Not Yet
434	2404	4	t	Not Yet
435	2406	9	t	Not Yet
436	2408	5	t	Not Yet
437	2412	8	t	Not Yet
438	2444	10	t	Not Yet
439	2445	4	t	Not Yet
440	2445	10	t	Not Yet
441	2446	4	t	Not Yet
442	2446	10	t	Not Yet
443	2455	2	t	Not Yet
444	2458	2	t	Not Yet
445	2493	2	t	Not Yet
446	2500	2	t	Not Yet
447	2510	2	t	Not Yet
448	2511	2	t	Not Yet
449	2512	2	t	Not Yet
450	2539	2	t	Not Yet
451	2544	8	t	Not Yet
452	2547	11	t	Not Yet
453	2548	11	t	Not Yet
454	2549	11	t	Not Yet
455	2550	11	t	Not Yet
456	2551	8	t	Not Yet
457	2551	11	t	Not Yet
458	2552	11	t	Not Yet
459	2553	11	t	Not Yet
460	2554	11	t	Not Yet
461	2563	2	t	Not Yet
462	2564	2	t	Not Yet
463	2564	5	t	Not Yet
464	2566	2	t	Not Yet
465	2566	5	t	Not Yet
466	2577	2	t	Not Yet
467	2578	5	t	Not Yet
468	2578	12	t	Not Yet
469	2579	5	t	Not Yet
470	2579	12	t	Not Yet
471	2580	12	t	Not Yet
472	2585	12	t	Not Yet
473	2586	12	t	Not Yet
474	2587	12	t	Not Yet
475	2588	5	t	Not Yet
476	2588	12	t	Not Yet
477	2589	12	t	Not Yet
478	2590	12	t	Not Yet
479	2591	12	t	Not Yet
480	2594	2	t	Not Yet
481	2598	2	t	Not Yet
482	2599	2	t	Not Yet
483	2611	11	t	Not Yet
484	2612	5	t	Not Yet
485	2612	11	t	Not Yet
486	2613	11	t	Not Yet
487	2615	11	t	Not Yet
488	2616	11	t	Not Yet
489	2617	11	t	Not Yet
490	2618	11	t	Not Yet
491	2619	11	t	Not Yet
492	2620	11	t	Not Yet
493	2621	11	t	Not Yet
494	2622	11	t	Not Yet
495	2625	2	t	Not Yet
496	2633	5	t	Not Yet
497	2637	2	t	Not Yet
498	2637	3	t	Not Yet
499	2660	11	t	Not Yet
500	2661	11	t	Not Yet
501	2662	11	t	Not Yet
502	2663	11	t	Not Yet
503	2664	3	t	Not Yet
504	2664	8	t	Not Yet
505	2668	5	t	Not Yet
506	2672	2	t	Not Yet
507	2674	11	t	Not Yet
508	2675	11	t	Not Yet
509	2676	11	t	Not Yet
510	2677	11	t	Not Yet
511	2678	11	t	Not Yet
512	2679	11	t	Not Yet
513	2679	12	t	Not Yet
514	2680	11	t	Not Yet
515	2681	11	t	Not Yet
516	2682	11	t	Not Yet
517	2683	11	t	Not Yet
518	2688	5	t	Not Yet
519	2696	11	t	Not Yet
520	2698	11	t	Not Yet
521	2699	11	t	Not Yet
522	2702	2	t	Not Yet
523	2704	2	t	Not Yet
524	2704	11	t	Not Yet
525	2705	11	t	Not Yet
526	2706	11	t	Not Yet
527	2707	2	t	Not Yet
528	2707	11	t	Not Yet
529	2708	2	t	Not Yet
530	2708	11	t	Not Yet
531	2709	11	t	Not Yet
532	2717	3	t	Not Yet
533	2719	11	t	Not Yet
534	2720	11	t	Not Yet
535	2721	11	t	Not Yet
536	2722	11	t	Not Yet
537	2723	11	t	Not Yet
538	2724	11	t	Not Yet
539	2725	11	t	Not Yet
540	2726	11	t	Not Yet
541	2737	11	t	Not Yet
542	2738	11	t	Not Yet
543	2739	11	t	Not Yet
544	2740	11	t	Not Yet
545	2741	11	t	Not Yet
546	2742	11	t	Not Yet
547	2743	11	t	Not Yet
548	2744	11	t	Not Yet
549	2745	11	t	Not Yet
550	2746	11	t	Not Yet
551	2747	11	t	Not Yet
552	2748	11	t	Not Yet
553	2749	11	t	Not Yet
554	2750	11	t	Not Yet
555	2751	5	t	Not Yet
556	2751	11	t	Not Yet
557	2752	2	t	Not Yet
558	2752	11	t	Not Yet
559	2753	11	t	Not Yet
560	2754	11	t	Not Yet
561	2755	11	t	Not Yet
562	2756	11	t	Not Yet
563	2757	11	t	Not Yet
564	2758	11	t	Not Yet
565	2759	11	t	Not Yet
566	2760	11	t	Not Yet
567	2761	11	t	Not Yet
568	2762	11	t	Not Yet
569	2763	2	t	Not Yet
570	2763	11	t	Not Yet
571	2764	11	t	Not Yet
572	2765	11	t	Not Yet
573	2766	11	t	Not Yet
574	2767	11	t	Not Yet
575	2768	11	t	Not Yet
576	2769	11	t	Not Yet
577	2776	11	t	Not Yet
578	2779	2	t	Not Yet
579	2780	2	t	Not Yet
580	2782	11	t	Not Yet
581	2785	11	t	Not Yet
582	2793	11	t	Not Yet
583	2800	11	t	Not Yet
584	2803	11	t	Not Yet
585	2817	2	t	Not Yet
586	2818	2	t	Not Yet
587	2819	11	t	Not Yet
588	2832	11	t	Not Yet
589	2838	11	t	Not Yet
590	2842	11	t	Not Yet
591	2846	10	t	Not Yet
592	2846	11	t	Not Yet
593	2851	10	t	Not Yet
594	2851	11	t	Not Yet
595	2855	10	t	Not Yet
596	2855	11	t	Not Yet
597	2861	2	t	Not Yet
598	2862	2	t	Not Yet
599	2868	11	t	Not Yet
600	2872	11	t	Not Yet
601	2878	2	t	Not Yet
602	2878	8	t	Not Yet
603	2898	11	t	Not Yet
604	2899	11	t	Not Yet
605	2900	11	t	Not Yet
606	2901	11	t	Not Yet
607	2902	11	t	Not Yet
608	2903	11	t	Not Yet
609	2904	11	t	Not Yet
610	2905	11	t	Not Yet
611	2907	11	t	Not Yet
612	2908	11	t	Not Yet
613	2909	11	t	Not Yet
614	2910	11	t	Not Yet
615	2911	11	t	Not Yet
616	2912	11	t	Not Yet
617	2913	11	t	Not Yet
618	2914	11	t	Not Yet
619	2919	11	t	Not Yet
620	2920	11	t	Not Yet
621	2921	11	t	Not Yet
622	2922	11	t	Not Yet
623	2928	11	t	Not Yet
624	2929	11	t	Not Yet
625	2932	11	t	Not Yet
626	2933	11	t	Not Yet
627	2934	11	t	Not Yet
628	2935	11	t	Not Yet
629	2947	5	t	Not Yet
630	2949	2	t	Not Yet
631	2950	8	t	Not Yet
632	2952	2	t	Not Yet
633	2954	10	t	Not Yet
634	2956	5	t	Not Yet
635	2961	11	t	Not Yet
636	2962	11	t	Not Yet
637	2963	2	t	Not Yet
638	2963	11	t	Not Yet
639	2964	11	t	Not Yet
640	2966	5	t	Not Yet
641	2969	5	t	Not Yet
642	2969	8	t	Not Yet
643	2976	11	t	Not Yet
644	2977	11	t	Not Yet
645	2978	11	t	Not Yet
646	2979	11	t	Not Yet
647	2980	11	t	Not Yet
648	2981	11	t	Not Yet
649	2982	11	t	Not Yet
650	2983	11	t	Not Yet
651	2988	11	t	Not Yet
652	2992	11	t	Not Yet
653	2993	4	t	Not Yet
654	2997	5	t	Not Yet
655	2999	11	t	Not Yet
656	3006	11	t	Not Yet
657	3011	2	t	Not Yet
658	3019	11	t	Not Yet
659	3038	5	t	Not Yet
660	3043	2	t	Not Yet
661	3044	2	t	Not Yet
662	3045	5	t	Not Yet
663	3057	8	t	Not Yet
664	3058	5	t	Not Yet
665	3061	5	t	Not Yet
666	3062	5	t	Not Yet
667	3064	5	t	Not Yet
668	3065	5	t	Not Yet
669	3080	11	t	Not Yet
670	3085	5	t	Not Yet
671	3085	11	t	Not Yet
672	3089	2	t	Not Yet
673	3092	3	t	Not Yet
674	3094	9	t	Not Yet
675	3096	2	t	Not Yet
676	3099	2	t	Not Yet
677	3118	11	t	Not Yet
678	3123	11	t	Not Yet
679	3125	11	t	Not Yet
680	3137	2	t	Not Yet
681	3137	11	t	Not Yet
682	3138	11	t	Not Yet
683	3139	5	t	Not Yet
684	3150	11	t	Not Yet
685	3151	11	t	Not Yet
686	3154	11	t	Not Yet
687	3155	11	t	Not Yet
688	3156	11	t	Not Yet
689	3157	11	t	Not Yet
690	3158	2	t	Not Yet
691	3158	11	t	Not Yet
692	3159	2	t	Not Yet
693	3159	11	t	Not Yet
694	3160	11	t	Not Yet
695	3161	11	t	Not Yet
696	3168	5	t	Not Yet
697	3168	11	t	Not Yet
698	3169	11	t	Not Yet
699	3170	11	t	Not Yet
700	3172	5	t	Not Yet
701	3177	5	t	Not Yet
702	3177	9	t	Not Yet
703	3184	11	t	Not Yet
704	3191	11	t	Not Yet
705	3192	11	t	Not Yet
706	3193	11	t	Not Yet
707	3194	11	t	Not Yet
708	3195	11	t	Not Yet
709	3196	11	t	Not Yet
710	3197	11	t	Not Yet
711	3201	4	t	Not Yet
712	3204	2	t	Not Yet
713	3204	9	t	Not Yet
714	3204	11	t	Not Yet
715	3205	11	t	Not Yet
716	3206	11	t	Not Yet
717	3208	5	t	Not Yet
718	3210	5	t	Not Yet
719	3226	12	t	Not Yet
720	3227	5	t	Not Yet
721	3228	2	t	Not Yet
722	3236	5	t	Not Yet
723	3268	3	t	Not Yet
724	3285	11	t	Not Yet
725	3338	5	t	Not Yet
\.


--
-- Name: senses_member_service_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('senses_member_service_id_seq', 725, true);


--
-- Data for Name: senses_scheme; Type: TABLE DATA; Schema: public; Owner: root
--

COPY senses_scheme (id, scheme_type) FROM stdin;
1	Govt/ Other NGOs Related Schemes
2	Education / Employment Related Services
\.


--
-- Name: senses_scheme_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('senses_scheme_id_seq', 2, true);


--
-- Data for Name: senses_sensesmembers; Type: TABLE DATA; Schema: public; Owner: root
--

COPY senses_sensesmembers (id, user_id, member_type, masjid_id) FROM stdin;
1	3	Mohalla User	3
2	4	Mohalla User	4
\.


--
-- Name: senses_sensesmembers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('senses_sensesmembers_id_seq', 2, true);


--
-- Data for Name: senses_service; Type: TABLE DATA; Schema: public; Owner: root
--

COPY senses_service (id, service_id, name, description) FROM stdin;
1	SE01	Skill Development Guidance & Training	\N
2	SE02	Employement	\N
3	SE03	Family Councelling (Issue & Support)	\N
4	SE04	Matrimonial	\N
5	SE05	Petty Business Councelling & Finance Support	\N
6	SE06	Enterprenership Counselling	\N
7	SE07	Rehabiliation  Counseling For Addicts	\N
8	SE08	Suffering Due To Interest Base Loan	\N
9	ON01	Loan Need Without Interest	\N
10	ON02	Food Needed People List	\N
11	ON03	Needed Any Govt Aided Card	\N
12	ON04	Other Government Schemes	\N
\.


--
-- Name: senses_service_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('senses_service_id_seq', 12, true);


--
-- Data for Name: senses_subscheme; Type: TABLE DATA; Schema: public; Owner: root
--

COPY senses_subscheme (id, scheme_id, subscheme_id, name, description) FROM stdin;
8	2	ED01	Guidance For Higher Education & Employment	\N
9	2	ED02	School Dropouts Interested In Employement	\N
10	2	ED03	Financial Support For Higher Education	\N
11	2	ED04	Pre Matric Scholorship	\N
12	2	ED05	Post Matric Scholorship	\N
13	2	ED06	School Dropouts Interested In Skill Development Training	\N
1	1	SG01	Old Age Pension	\N
2	1	SG02	Deserted Women Pension	\N
3	1	SG03	Marriage Help	\N
4	1	SG04	Disablity Person	\N
5	1	SG05	Widow / Aged Unmarried Women Welfare	\N
6	1	SG06	Destitute / Orphan Welfare	\N
7	1	SG07	Ulama Welfare Card	\N
\.


--
-- Data for Name: senses_subscheme_conditions; Type: TABLE DATA; Schema: public; Owner: root
--

COPY senses_subscheme_conditions (id, subscheme_id, condition_id) FROM stdin;
\.


--
-- Name: senses_subscheme_conditions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('senses_subscheme_conditions_id_seq', 1, false);


--
-- Name: senses_subscheme_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('senses_subscheme_id_seq', 13, true);


--
-- Data for Name: senses_surgery; Type: TABLE DATA; Schema: public; Owner: root
--

COPY senses_surgery (id, surgery_name, member_id, disease_id, hospital_name, cost, "cash_inHand", details) FROM stdin;
1	NA	272	1	NA	NA	NA	\N
2	N	279	1	N	N		\N
3	N	286	1	N	N	N	\N
4	N	288	1	N	N	N	\N
5	N	292	1	N	N	N	\N
6	N	296	1	N	N	N	\N
7	N	297	1	N	N	N	\N
8	N	298	1	N	N	N	\N
9	N	299	1	N	N	N	\N
10	N	300	1	N	N	N	\N
11	N	301	1	N	N	N	\N
12		685	1		25000		\N
13	N	2674	1	N	N	N	\N
14	N	2675	1	N	N	N	\N
15	N	2676	1	N	N	N	\N
16	N	2677	1	N	N	N	\N
17	N	2678	1	N	N	N	\N
18	N	2679	1	N	N	N	\N
19	N	2680	1	N	N	N	\N
20	N	2681	1	N	N	N	\N
21	N	2682	1	N	N	N	\N
22	N	2683	1	N	N	N	\N
23	N	2684	1	N	N	N	\N
24	N	2685	1	N	N	N	\N
\.


--
-- Name: senses_surgery_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('senses_surgery_id_seq', 24, true);


--
-- Data for Name: senses_taluk; Type: TABLE DATA; Schema: public; Owner: root
--

COPY senses_taluk (id, district_id, taluk_name) FROM stdin;
1	7	Perundurai
2	26	Dharapuram
3	2	Periyamet
4	2	Purasawakkam
6	20	Devakottai
7	18	Kamuthi
10	18	Keelakarai
\.


--
-- Name: senses_taluk_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('senses_taluk_id_seq', 10, true);


--
-- Data for Name: south_migrationhistory; Type: TABLE DATA; Schema: public; Owner: root
--

COPY south_migrationhistory (id, app_name, migration, applied) FROM stdin;
1	senses	0001_initial	2015-11-13 07:19:09.363999-05
2	senses	0002_auto__chg_field_disease_disease_id__chg_field_disease_disease_name	2015-11-13 09:48:32.108135-05
3	senses	0003_auto__chg_field_disease_disease_id__chg_field_disease_disease_name	2015-11-13 10:22:33.240772-05
4	senses	0004_auto__add_field_member_mem_age_month__chg_field_member_name	2015-11-30 07:57:35.356299-05
\.


--
-- Name: south_migrationhistory_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('south_migrationhistory_id_seq', 4, true);


--
-- Name: auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: root; Tablespace: 
--

ALTER TABLE ONLY auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions_group_id_permission_id_key; Type: CONSTRAINT; Schema: public; Owner: root; Tablespace: 
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_key UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: root; Tablespace: 
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: root; Tablespace: 
--

ALTER TABLE ONLY auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission_content_type_id_codename_key; Type: CONSTRAINT; Schema: public; Owner: root; Tablespace: 
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_key UNIQUE (content_type_id, codename);


--
-- Name: auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: root; Tablespace: 
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: root; Tablespace: 
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups_user_id_group_id_key; Type: CONSTRAINT; Schema: public; Owner: root; Tablespace: 
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_group_id_key UNIQUE (user_id, group_id);


--
-- Name: auth_user_pkey; Type: CONSTRAINT; Schema: public; Owner: root; Tablespace: 
--

ALTER TABLE ONLY auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: root; Tablespace: 
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions_user_id_permission_id_key; Type: CONSTRAINT; Schema: public; Owner: root; Tablespace: 
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_permission_id_key UNIQUE (user_id, permission_id);


--
-- Name: auth_user_username_key; Type: CONSTRAINT; Schema: public; Owner: root; Tablespace: 
--

ALTER TABLE ONLY auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);


--
-- Name: django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: root; Tablespace: 
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type_app_label_model_key; Type: CONSTRAINT; Schema: public; Owner: root; Tablespace: 
--

ALTER TABLE ONLY django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_key UNIQUE (app_label, model);


--
-- Name: django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: root; Tablespace: 
--

ALTER TABLE ONLY django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: root; Tablespace: 
--

ALTER TABLE ONLY django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: django_site_pkey; Type: CONSTRAINT; Schema: public; Owner: root; Tablespace: 
--

ALTER TABLE ONLY django_site
    ADD CONSTRAINT django_site_pkey PRIMARY KEY (id);


--
-- Name: senses_chronicdisease_pkey; Type: CONSTRAINT; Schema: public; Owner: root; Tablespace: 
--

ALTER TABLE ONLY senses_chronicdisease
    ADD CONSTRAINT senses_chronicdisease_pkey PRIMARY KEY (id);


--
-- Name: senses_condition_pkey; Type: CONSTRAINT; Schema: public; Owner: root; Tablespace: 
--

ALTER TABLE ONLY senses_condition
    ADD CONSTRAINT senses_condition_pkey PRIMARY KEY (id);


--
-- Name: senses_disease_disease_id_key; Type: CONSTRAINT; Schema: public; Owner: root; Tablespace: 
--

ALTER TABLE ONLY senses_disease
    ADD CONSTRAINT senses_disease_disease_id_key UNIQUE (disease_id);


--
-- Name: senses_disease_disease_name_key; Type: CONSTRAINT; Schema: public; Owner: root; Tablespace: 
--

ALTER TABLE ONLY senses_disease
    ADD CONSTRAINT senses_disease_disease_name_key UNIQUE (disease_name);


--
-- Name: senses_disease_pkey; Type: CONSTRAINT; Schema: public; Owner: root; Tablespace: 
--

ALTER TABLE ONLY senses_disease
    ADD CONSTRAINT senses_disease_pkey PRIMARY KEY (id);


--
-- Name: senses_district_district_code_key; Type: CONSTRAINT; Schema: public; Owner: root; Tablespace: 
--

ALTER TABLE ONLY senses_district
    ADD CONSTRAINT senses_district_district_code_key UNIQUE (district_code);


--
-- Name: senses_district_district_name_key; Type: CONSTRAINT; Schema: public; Owner: root; Tablespace: 
--

ALTER TABLE ONLY senses_district
    ADD CONSTRAINT senses_district_district_name_key UNIQUE (district_name);


--
-- Name: senses_district_pkey; Type: CONSTRAINT; Schema: public; Owner: root; Tablespace: 
--

ALTER TABLE ONLY senses_district
    ADD CONSTRAINT senses_district_pkey PRIMARY KEY (id);


--
-- Name: senses_family_family_id_key; Type: CONSTRAINT; Schema: public; Owner: root; Tablespace: 
--

ALTER TABLE ONLY senses_family
    ADD CONSTRAINT senses_family_family_id_key UNIQUE (family_id);


--
-- Name: senses_family_pkey; Type: CONSTRAINT; Schema: public; Owner: root; Tablespace: 
--

ALTER TABLE ONLY senses_family
    ADD CONSTRAINT senses_family_pkey PRIMARY KEY (id);


--
-- Name: senses_masjid_members_pkey; Type: CONSTRAINT; Schema: public; Owner: root; Tablespace: 
--

ALTER TABLE ONLY senses_masjid_members
    ADD CONSTRAINT senses_masjid_members_pkey PRIMARY KEY (id);


--
-- Name: senses_masjid_mohalla_id_key; Type: CONSTRAINT; Schema: public; Owner: root; Tablespace: 
--

ALTER TABLE ONLY senses_masjid
    ADD CONSTRAINT senses_masjid_mohalla_id_key UNIQUE (mohalla_id);


--
-- Name: senses_masjid_name_key; Type: CONSTRAINT; Schema: public; Owner: root; Tablespace: 
--

ALTER TABLE ONLY senses_masjid
    ADD CONSTRAINT senses_masjid_name_key UNIQUE (name);


--
-- Name: senses_masjid_pkey; Type: CONSTRAINT; Schema: public; Owner: root; Tablespace: 
--

ALTER TABLE ONLY senses_masjid
    ADD CONSTRAINT senses_masjid_pkey PRIMARY KEY (id);


--
-- Name: senses_medical_pkey; Type: CONSTRAINT; Schema: public; Owner: root; Tablespace: 
--

ALTER TABLE ONLY senses_medical
    ADD CONSTRAINT senses_medical_pkey PRIMARY KEY (id);


--
-- Name: senses_member_mem_id_key; Type: CONSTRAINT; Schema: public; Owner: root; Tablespace: 
--

ALTER TABLE ONLY senses_member
    ADD CONSTRAINT senses_member_mem_id_key UNIQUE (mem_id);


--
-- Name: senses_member_pkey; Type: CONSTRAINT; Schema: public; Owner: root; Tablespace: 
--

ALTER TABLE ONLY senses_member
    ADD CONSTRAINT senses_member_pkey PRIMARY KEY (id);


--
-- Name: senses_member_scheme_pkey; Type: CONSTRAINT; Schema: public; Owner: root; Tablespace: 
--

ALTER TABLE ONLY senses_member_scheme
    ADD CONSTRAINT senses_member_scheme_pkey PRIMARY KEY (id);


--
-- Name: senses_member_service_pkey; Type: CONSTRAINT; Schema: public; Owner: root; Tablespace: 
--

ALTER TABLE ONLY senses_member_service
    ADD CONSTRAINT senses_member_service_pkey PRIMARY KEY (id);


--
-- Name: senses_scheme_pkey; Type: CONSTRAINT; Schema: public; Owner: root; Tablespace: 
--

ALTER TABLE ONLY senses_scheme
    ADD CONSTRAINT senses_scheme_pkey PRIMARY KEY (id);


--
-- Name: senses_scheme_scheme_type_key; Type: CONSTRAINT; Schema: public; Owner: root; Tablespace: 
--

ALTER TABLE ONLY senses_scheme
    ADD CONSTRAINT senses_scheme_scheme_type_key UNIQUE (scheme_type);


--
-- Name: senses_sensesmembers_pkey; Type: CONSTRAINT; Schema: public; Owner: root; Tablespace: 
--

ALTER TABLE ONLY senses_sensesmembers
    ADD CONSTRAINT senses_sensesmembers_pkey PRIMARY KEY (id);


--
-- Name: senses_sensesmembers_user_id_key; Type: CONSTRAINT; Schema: public; Owner: root; Tablespace: 
--

ALTER TABLE ONLY senses_sensesmembers
    ADD CONSTRAINT senses_sensesmembers_user_id_key UNIQUE (user_id);


--
-- Name: senses_service_name_key; Type: CONSTRAINT; Schema: public; Owner: root; Tablespace: 
--

ALTER TABLE ONLY senses_service
    ADD CONSTRAINT senses_service_name_key UNIQUE (name);


--
-- Name: senses_service_pkey; Type: CONSTRAINT; Schema: public; Owner: root; Tablespace: 
--

ALTER TABLE ONLY senses_service
    ADD CONSTRAINT senses_service_pkey PRIMARY KEY (id);


--
-- Name: senses_service_service_id_key; Type: CONSTRAINT; Schema: public; Owner: root; Tablespace: 
--

ALTER TABLE ONLY senses_service
    ADD CONSTRAINT senses_service_service_id_key UNIQUE (service_id);


--
-- Name: senses_subscheme_conditions_pkey; Type: CONSTRAINT; Schema: public; Owner: root; Tablespace: 
--

ALTER TABLE ONLY senses_subscheme_conditions
    ADD CONSTRAINT senses_subscheme_conditions_pkey PRIMARY KEY (id);


--
-- Name: senses_subscheme_conditions_subscheme_id_55f16c89a81bbf53_uniq; Type: CONSTRAINT; Schema: public; Owner: root; Tablespace: 
--

ALTER TABLE ONLY senses_subscheme_conditions
    ADD CONSTRAINT senses_subscheme_conditions_subscheme_id_55f16c89a81bbf53_uniq UNIQUE (subscheme_id, condition_id);


--
-- Name: senses_subscheme_name_key; Type: CONSTRAINT; Schema: public; Owner: root; Tablespace: 
--

ALTER TABLE ONLY senses_subscheme
    ADD CONSTRAINT senses_subscheme_name_key UNIQUE (name);


--
-- Name: senses_subscheme_pkey; Type: CONSTRAINT; Schema: public; Owner: root; Tablespace: 
--

ALTER TABLE ONLY senses_subscheme
    ADD CONSTRAINT senses_subscheme_pkey PRIMARY KEY (id);


--
-- Name: senses_subscheme_subscheme_id_key; Type: CONSTRAINT; Schema: public; Owner: root; Tablespace: 
--

ALTER TABLE ONLY senses_subscheme
    ADD CONSTRAINT senses_subscheme_subscheme_id_key UNIQUE (subscheme_id);


--
-- Name: senses_surgery_pkey; Type: CONSTRAINT; Schema: public; Owner: root; Tablespace: 
--

ALTER TABLE ONLY senses_surgery
    ADD CONSTRAINT senses_surgery_pkey PRIMARY KEY (id);


--
-- Name: senses_taluk_pkey; Type: CONSTRAINT; Schema: public; Owner: root; Tablespace: 
--

ALTER TABLE ONLY senses_taluk
    ADD CONSTRAINT senses_taluk_pkey PRIMARY KEY (id);


--
-- Name: south_migrationhistory_pkey; Type: CONSTRAINT; Schema: public; Owner: root; Tablespace: 
--

ALTER TABLE ONLY south_migrationhistory
    ADD CONSTRAINT south_migrationhistory_pkey PRIMARY KEY (id);


--
-- Name: auth_group_name_like; Type: INDEX; Schema: public; Owner: root; Tablespace: 
--

CREATE INDEX auth_group_name_like ON auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_group_id; Type: INDEX; Schema: public; Owner: root; Tablespace: 
--

CREATE INDEX auth_group_permissions_group_id ON auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_permission_id; Type: INDEX; Schema: public; Owner: root; Tablespace: 
--

CREATE INDEX auth_group_permissions_permission_id ON auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_content_type_id; Type: INDEX; Schema: public; Owner: root; Tablespace: 
--

CREATE INDEX auth_permission_content_type_id ON auth_permission USING btree (content_type_id);


--
-- Name: auth_user_groups_group_id; Type: INDEX; Schema: public; Owner: root; Tablespace: 
--

CREATE INDEX auth_user_groups_group_id ON auth_user_groups USING btree (group_id);


--
-- Name: auth_user_groups_user_id; Type: INDEX; Schema: public; Owner: root; Tablespace: 
--

CREATE INDEX auth_user_groups_user_id ON auth_user_groups USING btree (user_id);


--
-- Name: auth_user_user_permissions_permission_id; Type: INDEX; Schema: public; Owner: root; Tablespace: 
--

CREATE INDEX auth_user_user_permissions_permission_id ON auth_user_user_permissions USING btree (permission_id);


--
-- Name: auth_user_user_permissions_user_id; Type: INDEX; Schema: public; Owner: root; Tablespace: 
--

CREATE INDEX auth_user_user_permissions_user_id ON auth_user_user_permissions USING btree (user_id);


--
-- Name: auth_user_username_like; Type: INDEX; Schema: public; Owner: root; Tablespace: 
--

CREATE INDEX auth_user_username_like ON auth_user USING btree (username varchar_pattern_ops);


--
-- Name: django_admin_log_content_type_id; Type: INDEX; Schema: public; Owner: root; Tablespace: 
--

CREATE INDEX django_admin_log_content_type_id ON django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_user_id; Type: INDEX; Schema: public; Owner: root; Tablespace: 
--

CREATE INDEX django_admin_log_user_id ON django_admin_log USING btree (user_id);


--
-- Name: django_session_expire_date; Type: INDEX; Schema: public; Owner: root; Tablespace: 
--

CREATE INDEX django_session_expire_date ON django_session USING btree (expire_date);


--
-- Name: django_session_session_key_like; Type: INDEX; Schema: public; Owner: root; Tablespace: 
--

CREATE INDEX django_session_session_key_like ON django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: senses_chronicdisease_disease_name_id; Type: INDEX; Schema: public; Owner: root; Tablespace: 
--

CREATE INDEX senses_chronicdisease_disease_name_id ON senses_chronicdisease USING btree (disease_name_id);


--
-- Name: senses_chronicdisease_member_id; Type: INDEX; Schema: public; Owner: root; Tablespace: 
--

CREATE INDEX senses_chronicdisease_member_id ON senses_chronicdisease USING btree (member_id);


--
-- Name: senses_disease_disease_id_like; Type: INDEX; Schema: public; Owner: root; Tablespace: 
--

CREATE INDEX senses_disease_disease_id_like ON senses_disease USING btree (disease_id varchar_pattern_ops);


--
-- Name: senses_disease_disease_name_like; Type: INDEX; Schema: public; Owner: root; Tablespace: 
--

CREATE INDEX senses_disease_disease_name_like ON senses_disease USING btree (disease_name varchar_pattern_ops);


--
-- Name: senses_district_district_code_like; Type: INDEX; Schema: public; Owner: root; Tablespace: 
--

CREATE INDEX senses_district_district_code_like ON senses_district USING btree (district_code varchar_pattern_ops);


--
-- Name: senses_district_district_name_like; Type: INDEX; Schema: public; Owner: root; Tablespace: 
--

CREATE INDEX senses_district_district_name_like ON senses_district USING btree (district_name varchar_pattern_ops);


--
-- Name: senses_family_family_id_like; Type: INDEX; Schema: public; Owner: root; Tablespace: 
--

CREATE INDEX senses_family_family_id_like ON senses_family USING btree (family_id varchar_pattern_ops);


--
-- Name: senses_family_muhalla_id; Type: INDEX; Schema: public; Owner: root; Tablespace: 
--

CREATE INDEX senses_family_muhalla_id ON senses_family USING btree (muhalla_id);


--
-- Name: senses_masjid_district_id; Type: INDEX; Schema: public; Owner: root; Tablespace: 
--

CREATE INDEX senses_masjid_district_id ON senses_masjid USING btree (district_id);


--
-- Name: senses_masjid_members_masjid_id; Type: INDEX; Schema: public; Owner: root; Tablespace: 
--

CREATE INDEX senses_masjid_members_masjid_id ON senses_masjid_members USING btree (masjid_id);


--
-- Name: senses_masjid_mohalla_id_like; Type: INDEX; Schema: public; Owner: root; Tablespace: 
--

CREATE INDEX senses_masjid_mohalla_id_like ON senses_masjid USING btree (mohalla_id varchar_pattern_ops);


--
-- Name: senses_masjid_name_like; Type: INDEX; Schema: public; Owner: root; Tablespace: 
--

CREATE INDEX senses_masjid_name_like ON senses_masjid USING btree (name varchar_pattern_ops);


--
-- Name: senses_masjid_taluk_id; Type: INDEX; Schema: public; Owner: root; Tablespace: 
--

CREATE INDEX senses_masjid_taluk_id ON senses_masjid USING btree (taluk_id);


--
-- Name: senses_medical_disease_id; Type: INDEX; Schema: public; Owner: root; Tablespace: 
--

CREATE INDEX senses_medical_disease_id ON senses_medical USING btree (disease_id);


--
-- Name: senses_medical_member_id; Type: INDEX; Schema: public; Owner: root; Tablespace: 
--

CREATE INDEX senses_medical_member_id ON senses_medical USING btree (member_id);


--
-- Name: senses_member_district_id; Type: INDEX; Schema: public; Owner: root; Tablespace: 
--

CREATE INDEX senses_member_district_id ON senses_member USING btree (district_id);


--
-- Name: senses_member_family_id; Type: INDEX; Schema: public; Owner: root; Tablespace: 
--

CREATE INDEX senses_member_family_id ON senses_member USING btree (family_id);


--
-- Name: senses_member_mem_id_like; Type: INDEX; Schema: public; Owner: root; Tablespace: 
--

CREATE INDEX senses_member_mem_id_like ON senses_member USING btree (mem_id varchar_pattern_ops);


--
-- Name: senses_member_muhalla_id; Type: INDEX; Schema: public; Owner: root; Tablespace: 
--

CREATE INDEX senses_member_muhalla_id ON senses_member USING btree (muhalla_id);


--
-- Name: senses_member_scheme_member_id; Type: INDEX; Schema: public; Owner: root; Tablespace: 
--

CREATE INDEX senses_member_scheme_member_id ON senses_member_scheme USING btree (member_id);


--
-- Name: senses_member_scheme_scheme_id; Type: INDEX; Schema: public; Owner: root; Tablespace: 
--

CREATE INDEX senses_member_scheme_scheme_id ON senses_member_scheme USING btree (scheme_id);


--
-- Name: senses_member_service_member_id; Type: INDEX; Schema: public; Owner: root; Tablespace: 
--

CREATE INDEX senses_member_service_member_id ON senses_member_service USING btree (member_id);


--
-- Name: senses_member_service_scheme_id; Type: INDEX; Schema: public; Owner: root; Tablespace: 
--

CREATE INDEX senses_member_service_scheme_id ON senses_member_service USING btree (scheme_id);


--
-- Name: senses_member_taluk_id; Type: INDEX; Schema: public; Owner: root; Tablespace: 
--

CREATE INDEX senses_member_taluk_id ON senses_member USING btree (taluk_id);


--
-- Name: senses_scheme_scheme_type_like; Type: INDEX; Schema: public; Owner: root; Tablespace: 
--

CREATE INDEX senses_scheme_scheme_type_like ON senses_scheme USING btree (scheme_type varchar_pattern_ops);


--
-- Name: senses_sensesmembers_masjid_id; Type: INDEX; Schema: public; Owner: root; Tablespace: 
--

CREATE INDEX senses_sensesmembers_masjid_id ON senses_sensesmembers USING btree (masjid_id);


--
-- Name: senses_service_name_like; Type: INDEX; Schema: public; Owner: root; Tablespace: 
--

CREATE INDEX senses_service_name_like ON senses_service USING btree (name varchar_pattern_ops);


--
-- Name: senses_service_service_id_like; Type: INDEX; Schema: public; Owner: root; Tablespace: 
--

CREATE INDEX senses_service_service_id_like ON senses_service USING btree (service_id varchar_pattern_ops);


--
-- Name: senses_subscheme_conditions_condition_id; Type: INDEX; Schema: public; Owner: root; Tablespace: 
--

CREATE INDEX senses_subscheme_conditions_condition_id ON senses_subscheme_conditions USING btree (condition_id);


--
-- Name: senses_subscheme_conditions_subscheme_id; Type: INDEX; Schema: public; Owner: root; Tablespace: 
--

CREATE INDEX senses_subscheme_conditions_subscheme_id ON senses_subscheme_conditions USING btree (subscheme_id);


--
-- Name: senses_subscheme_name_like; Type: INDEX; Schema: public; Owner: root; Tablespace: 
--

CREATE INDEX senses_subscheme_name_like ON senses_subscheme USING btree (name varchar_pattern_ops);


--
-- Name: senses_subscheme_scheme_id; Type: INDEX; Schema: public; Owner: root; Tablespace: 
--

CREATE INDEX senses_subscheme_scheme_id ON senses_subscheme USING btree (scheme_id);


--
-- Name: senses_subscheme_subscheme_id_like; Type: INDEX; Schema: public; Owner: root; Tablespace: 
--

CREATE INDEX senses_subscheme_subscheme_id_like ON senses_subscheme USING btree (subscheme_id varchar_pattern_ops);


--
-- Name: senses_surgery_disease_id; Type: INDEX; Schema: public; Owner: root; Tablespace: 
--

CREATE INDEX senses_surgery_disease_id ON senses_surgery USING btree (disease_id);


--
-- Name: senses_surgery_member_id; Type: INDEX; Schema: public; Owner: root; Tablespace: 
--

CREATE INDEX senses_surgery_member_id ON senses_surgery USING btree (member_id);


--
-- Name: senses_taluk_district_id; Type: INDEX; Schema: public; Owner: root; Tablespace: 
--

CREATE INDEX senses_taluk_district_id ON senses_taluk USING btree (district_id);


--
-- Name: auth_group_permissions_permission_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_permission_id_fkey FOREIGN KEY (permission_id) REFERENCES auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups_group_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_fkey FOREIGN KEY (group_id) REFERENCES auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions_permission_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_permission_id_fkey FOREIGN KEY (permission_id) REFERENCES auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: condition_id_refs_id_987df166; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY senses_subscheme_conditions
    ADD CONSTRAINT condition_id_refs_id_987df166 FOREIGN KEY (condition_id) REFERENCES senses_condition(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: content_type_id_refs_id_93d2d1f8; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT content_type_id_refs_id_93d2d1f8 FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: content_type_id_refs_id_d043b34a; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT content_type_id_refs_id_d043b34a FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: disease_id_refs_id_38968771; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY senses_medical
    ADD CONSTRAINT disease_id_refs_id_38968771 FOREIGN KEY (disease_id) REFERENCES senses_disease(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: disease_id_refs_id_870a7584; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY senses_surgery
    ADD CONSTRAINT disease_id_refs_id_870a7584 FOREIGN KEY (disease_id) REFERENCES senses_disease(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: disease_name_id_refs_id_a51e3347; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY senses_chronicdisease
    ADD CONSTRAINT disease_name_id_refs_id_a51e3347 FOREIGN KEY (disease_name_id) REFERENCES senses_disease(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: district_id_refs_id_6a05dc18; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY senses_masjid
    ADD CONSTRAINT district_id_refs_id_6a05dc18 FOREIGN KEY (district_id) REFERENCES senses_district(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: district_id_refs_id_823d630f; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY senses_member
    ADD CONSTRAINT district_id_refs_id_823d630f FOREIGN KEY (district_id) REFERENCES senses_district(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: district_id_refs_id_9cc57bf3; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY senses_taluk
    ADD CONSTRAINT district_id_refs_id_9cc57bf3 FOREIGN KEY (district_id) REFERENCES senses_district(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: family_id_refs_id_7f453149; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY senses_member
    ADD CONSTRAINT family_id_refs_id_7f453149 FOREIGN KEY (family_id) REFERENCES senses_family(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: group_id_refs_id_f4b32aac; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT group_id_refs_id_f4b32aac FOREIGN KEY (group_id) REFERENCES auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: masjid_id_refs_id_2e9a4ea6; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY senses_sensesmembers
    ADD CONSTRAINT masjid_id_refs_id_2e9a4ea6 FOREIGN KEY (masjid_id) REFERENCES senses_masjid(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: masjid_id_refs_id_fc71eada; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY senses_masjid_members
    ADD CONSTRAINT masjid_id_refs_id_fc71eada FOREIGN KEY (masjid_id) REFERENCES senses_masjid(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: member_id_refs_id_178c57e9; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY senses_member_scheme
    ADD CONSTRAINT member_id_refs_id_178c57e9 FOREIGN KEY (member_id) REFERENCES senses_member(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: member_id_refs_id_7e8e0b25; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY senses_medical
    ADD CONSTRAINT member_id_refs_id_7e8e0b25 FOREIGN KEY (member_id) REFERENCES senses_member(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: member_id_refs_id_94c7b48e; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY senses_member_service
    ADD CONSTRAINT member_id_refs_id_94c7b48e FOREIGN KEY (member_id) REFERENCES senses_member(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: member_id_refs_id_9dbb51ba; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY senses_surgery
    ADD CONSTRAINT member_id_refs_id_9dbb51ba FOREIGN KEY (member_id) REFERENCES senses_member(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: member_id_refs_id_c05fbaa5; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY senses_chronicdisease
    ADD CONSTRAINT member_id_refs_id_c05fbaa5 FOREIGN KEY (member_id) REFERENCES senses_member(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: muhalla_id_refs_id_424eb15c; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY senses_member
    ADD CONSTRAINT muhalla_id_refs_id_424eb15c FOREIGN KEY (muhalla_id) REFERENCES senses_masjid(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: muhalla_id_refs_id_4abc6c48; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY senses_family
    ADD CONSTRAINT muhalla_id_refs_id_4abc6c48 FOREIGN KEY (muhalla_id) REFERENCES senses_masjid(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: scheme_id_refs_id_102e141f; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY senses_member_service
    ADD CONSTRAINT scheme_id_refs_id_102e141f FOREIGN KEY (scheme_id) REFERENCES senses_service(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: scheme_id_refs_id_1031c4b7; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY senses_member_scheme
    ADD CONSTRAINT scheme_id_refs_id_1031c4b7 FOREIGN KEY (scheme_id) REFERENCES senses_subscheme(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: scheme_id_refs_id_8963f538; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY senses_subscheme
    ADD CONSTRAINT scheme_id_refs_id_8963f538 FOREIGN KEY (scheme_id) REFERENCES senses_scheme(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: subscheme_id_refs_id_c4055a2a; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY senses_subscheme_conditions
    ADD CONSTRAINT subscheme_id_refs_id_c4055a2a FOREIGN KEY (subscheme_id) REFERENCES senses_subscheme(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: taluk_id_refs_id_1c5f7696; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY senses_masjid
    ADD CONSTRAINT taluk_id_refs_id_1c5f7696 FOREIGN KEY (taluk_id) REFERENCES senses_taluk(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: taluk_id_refs_id_a45e63b0; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY senses_member
    ADD CONSTRAINT taluk_id_refs_id_a45e63b0 FOREIGN KEY (taluk_id) REFERENCES senses_taluk(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: user_id_refs_id_40c41112; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT user_id_refs_id_40c41112 FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: user_id_refs_id_4dc23c39; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT user_id_refs_id_4dc23c39 FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: user_id_refs_id_c0d12874; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT user_id_refs_id_c0d12874 FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: user_id_refs_id_cc8061bd; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY senses_sensesmembers
    ADD CONSTRAINT user_id_refs_id_cc8061bd FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

