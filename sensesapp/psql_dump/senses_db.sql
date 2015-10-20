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
-- Name: auth_group; Type: TABLE; Schema: public; Owner: sensesapp; Tablespace: 
--

CREATE TABLE auth_group (
    id integer NOT NULL,
    name character varying(80) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO sensesapp;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: sensesapp
--

CREATE SEQUENCE auth_group_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_id_seq OWNER TO sensesapp;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sensesapp
--

ALTER SEQUENCE auth_group_id_seq OWNED BY auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: sensesapp; Tablespace: 
--

CREATE TABLE auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO sensesapp;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: sensesapp
--

CREATE SEQUENCE auth_group_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_permissions_id_seq OWNER TO sensesapp;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sensesapp
--

ALTER SEQUENCE auth_group_permissions_id_seq OWNED BY auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: sensesapp; Tablespace: 
--

CREATE TABLE auth_permission (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO sensesapp;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: sensesapp
--

CREATE SEQUENCE auth_permission_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_permission_id_seq OWNER TO sensesapp;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sensesapp
--

ALTER SEQUENCE auth_permission_id_seq OWNED BY auth_permission.id;


--
-- Name: auth_user; Type: TABLE; Schema: public; Owner: sensesapp; Tablespace: 
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


ALTER TABLE public.auth_user OWNER TO sensesapp;

--
-- Name: auth_user_groups; Type: TABLE; Schema: public; Owner: sensesapp; Tablespace: 
--

CREATE TABLE auth_user_groups (
    id integer NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.auth_user_groups OWNER TO sensesapp;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: sensesapp
--

CREATE SEQUENCE auth_user_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_groups_id_seq OWNER TO sensesapp;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sensesapp
--

ALTER SEQUENCE auth_user_groups_id_seq OWNED BY auth_user_groups.id;


--
-- Name: auth_user_id_seq; Type: SEQUENCE; Schema: public; Owner: sensesapp
--

CREATE SEQUENCE auth_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_id_seq OWNER TO sensesapp;

--
-- Name: auth_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sensesapp
--

ALTER SEQUENCE auth_user_id_seq OWNED BY auth_user.id;


--
-- Name: auth_user_user_permissions; Type: TABLE; Schema: public; Owner: sensesapp; Tablespace: 
--

CREATE TABLE auth_user_user_permissions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_user_user_permissions OWNER TO sensesapp;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: sensesapp
--

CREATE SEQUENCE auth_user_user_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_user_permissions_id_seq OWNER TO sensesapp;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sensesapp
--

ALTER SEQUENCE auth_user_user_permissions_id_seq OWNED BY auth_user_user_permissions.id;


--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: sensesapp; Tablespace: 
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


ALTER TABLE public.django_admin_log OWNER TO sensesapp;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: sensesapp
--

CREATE SEQUENCE django_admin_log_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_admin_log_id_seq OWNER TO sensesapp;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sensesapp
--

ALTER SEQUENCE django_admin_log_id_seq OWNED BY django_admin_log.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: sensesapp; Tablespace: 
--

CREATE TABLE django_content_type (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO sensesapp;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: sensesapp
--

CREATE SEQUENCE django_content_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_content_type_id_seq OWNER TO sensesapp;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sensesapp
--

ALTER SEQUENCE django_content_type_id_seq OWNED BY django_content_type.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: sensesapp; Tablespace: 
--

CREATE TABLE django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO sensesapp;

--
-- Name: django_site; Type: TABLE; Schema: public; Owner: sensesapp; Tablespace: 
--

CREATE TABLE django_site (
    id integer NOT NULL,
    domain character varying(100) NOT NULL,
    name character varying(50) NOT NULL
);


ALTER TABLE public.django_site OWNER TO sensesapp;

--
-- Name: django_site_id_seq; Type: SEQUENCE; Schema: public; Owner: sensesapp
--

CREATE SEQUENCE django_site_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_site_id_seq OWNER TO sensesapp;

--
-- Name: django_site_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sensesapp
--

ALTER SEQUENCE django_site_id_seq OWNED BY django_site.id;


--
-- Name: senses_chronicdisease; Type: TABLE; Schema: public; Owner: sensesapp; Tablespace: 
--

CREATE TABLE senses_chronicdisease (
    id integer NOT NULL,
    disease_name_id integer NOT NULL,
    doctor_name character varying(50),
    cost character varying(20),
    status boolean NOT NULL,
    details character varying(300),
    member_id integer
);


ALTER TABLE public.senses_chronicdisease OWNER TO sensesapp;

--
-- Name: senses_chronicdisease_id_seq; Type: SEQUENCE; Schema: public; Owner: sensesapp
--

CREATE SEQUENCE senses_chronicdisease_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.senses_chronicdisease_id_seq OWNER TO sensesapp;

--
-- Name: senses_chronicdisease_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sensesapp
--

ALTER SEQUENCE senses_chronicdisease_id_seq OWNED BY senses_chronicdisease.id;


--
-- Name: senses_condition; Type: TABLE; Schema: public; Owner: sensesapp; Tablespace: 
--

CREATE TABLE senses_condition (
    id integer NOT NULL,
    field character varying(50),
    conditions character varying(20),
    value character varying(20)
);


ALTER TABLE public.senses_condition OWNER TO sensesapp;

--
-- Name: senses_condition_id_seq; Type: SEQUENCE; Schema: public; Owner: sensesapp
--

CREATE SEQUENCE senses_condition_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.senses_condition_id_seq OWNER TO sensesapp;

--
-- Name: senses_condition_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sensesapp
--

ALTER SEQUENCE senses_condition_id_seq OWNED BY senses_condition.id;


--
-- Name: senses_disease; Type: TABLE; Schema: public; Owner: sensesapp; Tablespace: 
--

CREATE TABLE senses_disease (
    id integer NOT NULL,
    disease_name character varying(50) NOT NULL,
    sym_type character varying(30) NOT NULL,
    description text
);


ALTER TABLE public.senses_disease OWNER TO sensesapp;

--
-- Name: senses_disease_id_seq; Type: SEQUENCE; Schema: public; Owner: sensesapp
--

CREATE SEQUENCE senses_disease_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.senses_disease_id_seq OWNER TO sensesapp;

--
-- Name: senses_disease_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sensesapp
--

ALTER SEQUENCE senses_disease_id_seq OWNED BY senses_disease.id;


--
-- Name: senses_district; Type: TABLE; Schema: public; Owner: sensesapp; Tablespace: 
--

CREATE TABLE senses_district (
    id integer NOT NULL,
    district_name character varying(50) NOT NULL,
    district_code character varying(10) NOT NULL
);


ALTER TABLE public.senses_district OWNER TO sensesapp;

--
-- Name: senses_district_id_seq; Type: SEQUENCE; Schema: public; Owner: sensesapp
--

CREATE SEQUENCE senses_district_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.senses_district_id_seq OWNER TO sensesapp;

--
-- Name: senses_district_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sensesapp
--

ALTER SEQUENCE senses_district_id_seq OWNED BY senses_district.id;


--
-- Name: senses_family; Type: TABLE; Schema: public; Owner: sensesapp; Tablespace: 
--

CREATE TABLE senses_family (
    id integer NOT NULL,
    address character varying(50) NOT NULL,
    mobile character varying(20) NOT NULL,
    house_type character varying(50) NOT NULL,
    toilet boolean NOT NULL,
    financial_status character varying(50) NOT NULL,
    family_id character varying(30) NOT NULL,
    ration_card character varying(30) NOT NULL,
    muhalla_id integer NOT NULL,
    donor boolean NOT NULL,
    volunteer boolean NOT NULL,
    health_insurance boolean NOT NULL,
    family_needs text,
    language character varying(30)
);


ALTER TABLE public.senses_family OWNER TO sensesapp;

--
-- Name: senses_family_id_seq; Type: SEQUENCE; Schema: public; Owner: sensesapp
--

CREATE SEQUENCE senses_family_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.senses_family_id_seq OWNER TO sensesapp;

--
-- Name: senses_family_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sensesapp
--

ALTER SEQUENCE senses_family_id_seq OWNED BY senses_family.id;


--
-- Name: senses_masjid; Type: TABLE; Schema: public; Owner: sensesapp; Tablespace: 
--

CREATE TABLE senses_masjid (
    id integer NOT NULL,
    taluk_id integer NOT NULL,
    name character varying(30) NOT NULL,
    musallas character varying(20) NOT NULL,
    location character varying(30) NOT NULL,
    mohalla_id character varying(10) NOT NULL
);


ALTER TABLE public.senses_masjid OWNER TO sensesapp;

--
-- Name: senses_masjid_id_seq; Type: SEQUENCE; Schema: public; Owner: sensesapp
--

CREATE SEQUENCE senses_masjid_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.senses_masjid_id_seq OWNER TO sensesapp;

--
-- Name: senses_masjid_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sensesapp
--

ALTER SEQUENCE senses_masjid_id_seq OWNED BY senses_masjid.id;


--
-- Name: senses_masjid_members; Type: TABLE; Schema: public; Owner: sensesapp; Tablespace: 
--

CREATE TABLE senses_masjid_members (
    id integer NOT NULL,
    masjid_id integer NOT NULL,
    member_name character varying(30) NOT NULL,
    age character varying(30) NOT NULL,
    mobile character varying(20) NOT NULL,
    address character varying(50) NOT NULL,
    designation character varying(20) NOT NULL
);


ALTER TABLE public.senses_masjid_members OWNER TO sensesapp;

--
-- Name: senses_masjid_members_id_seq; Type: SEQUENCE; Schema: public; Owner: sensesapp
--

CREATE SEQUENCE senses_masjid_members_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.senses_masjid_members_id_seq OWNER TO sensesapp;

--
-- Name: senses_masjid_members_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sensesapp
--

ALTER SEQUENCE senses_masjid_members_id_seq OWNED BY senses_masjid_members.id;


--
-- Name: senses_medical; Type: TABLE; Schema: public; Owner: sensesapp; Tablespace: 
--

CREATE TABLE senses_medical (
    id integer NOT NULL,
    medicine_needs character varying(200),
    cost character varying(20),
    member_id integer,
    disease_id integer NOT NULL
);


ALTER TABLE public.senses_medical OWNER TO sensesapp;

--
-- Name: senses_medical_id_seq; Type: SEQUENCE; Schema: public; Owner: sensesapp
--

CREATE SEQUENCE senses_medical_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.senses_medical_id_seq OWNER TO sensesapp;

--
-- Name: senses_medical_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sensesapp
--

ALTER SEQUENCE senses_medical_id_seq OWNED BY senses_medical.id;


--
-- Name: senses_member; Type: TABLE; Schema: public; Owner: sensesapp; Tablespace: 
--

CREATE TABLE senses_member (
    id integer NOT NULL,
    mem_id character varying(20) NOT NULL,
    name character varying(30) NOT NULL,
    gender character varying(10) NOT NULL,
    age character varying(10) NOT NULL,
    "Relation" character varying(20) NOT NULL,
    marital_status character varying(20) NOT NULL,
    qualification character varying(100),
    mother_tongue character varying(20),
    disability boolean NOT NULL,
    voter_status boolean NOT NULL,
    family_id integer NOT NULL,
    occupation character varying(30),
    curr_location character varying(20) NOT NULL,
    "Makthab" boolean NOT NULL,
    madarasa_details character varying(50),
    donor boolean NOT NULL,
    volunteer boolean NOT NULL,
    mobile character varying(20),
    alive boolean NOT NULL,
    muhalla_id integer NOT NULL,
    quran_reading boolean NOT NULL,
    namaz character varying(30) NOT NULL,
    family_head boolean NOT NULL
);


ALTER TABLE public.senses_member OWNER TO sensesapp;

--
-- Name: senses_member_id_seq; Type: SEQUENCE; Schema: public; Owner: sensesapp
--

CREATE SEQUENCE senses_member_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.senses_member_id_seq OWNER TO sensesapp;

--
-- Name: senses_member_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sensesapp
--

ALTER SEQUENCE senses_member_id_seq OWNED BY senses_member.id;


--
-- Name: senses_member_scheme; Type: TABLE; Schema: public; Owner: sensesapp; Tablespace: 
--

CREATE TABLE senses_member_scheme (
    id integer NOT NULL,
    scheme_id integer,
    status boolean NOT NULL,
    member_id integer,
    solution character varying(20) NOT NULL
);


ALTER TABLE public.senses_member_scheme OWNER TO sensesapp;

--
-- Name: senses_member_scheme_id_seq; Type: SEQUENCE; Schema: public; Owner: sensesapp
--

CREATE SEQUENCE senses_member_scheme_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.senses_member_scheme_id_seq OWNER TO sensesapp;

--
-- Name: senses_member_scheme_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sensesapp
--

ALTER SEQUENCE senses_member_scheme_id_seq OWNED BY senses_member_scheme.id;


--
-- Name: senses_member_service; Type: TABLE; Schema: public; Owner: sensesapp; Tablespace: 
--

CREATE TABLE senses_member_service (
    id integer NOT NULL,
    member_id integer,
    scheme_id integer,
    status boolean NOT NULL,
    solution character varying(20) NOT NULL
);


ALTER TABLE public.senses_member_service OWNER TO sensesapp;

--
-- Name: senses_member_service_id_seq; Type: SEQUENCE; Schema: public; Owner: sensesapp
--

CREATE SEQUENCE senses_member_service_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.senses_member_service_id_seq OWNER TO sensesapp;

--
-- Name: senses_member_service_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sensesapp
--

ALTER SEQUENCE senses_member_service_id_seq OWNED BY senses_member_service.id;


--
-- Name: senses_scheme; Type: TABLE; Schema: public; Owner: sensesapp; Tablespace: 
--

CREATE TABLE senses_scheme (
    id integer NOT NULL,
    scheme_type character varying(50) NOT NULL
);


ALTER TABLE public.senses_scheme OWNER TO sensesapp;

--
-- Name: senses_scheme_id_seq; Type: SEQUENCE; Schema: public; Owner: sensesapp
--

CREATE SEQUENCE senses_scheme_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.senses_scheme_id_seq OWNER TO sensesapp;

--
-- Name: senses_scheme_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sensesapp
--

ALTER SEQUENCE senses_scheme_id_seq OWNED BY senses_scheme.id;


--
-- Name: senses_sensesmembers; Type: TABLE; Schema: public; Owner: sensesapp; Tablespace: 
--

CREATE TABLE senses_sensesmembers (
    id integer NOT NULL,
    user_id integer NOT NULL,
    member_type character varying(30) NOT NULL,
    masjid_id integer NOT NULL
);


ALTER TABLE public.senses_sensesmembers OWNER TO sensesapp;

--
-- Name: senses_sensesmembers_id_seq; Type: SEQUENCE; Schema: public; Owner: sensesapp
--

CREATE SEQUENCE senses_sensesmembers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.senses_sensesmembers_id_seq OWNER TO sensesapp;

--
-- Name: senses_sensesmembers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sensesapp
--

ALTER SEQUENCE senses_sensesmembers_id_seq OWNED BY senses_sensesmembers.id;


--
-- Name: senses_service; Type: TABLE; Schema: public; Owner: sensesapp; Tablespace: 
--

CREATE TABLE senses_service (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    description text,
    service_id character varying(10) NOT NULL
);


ALTER TABLE public.senses_service OWNER TO sensesapp;

--
-- Name: senses_service_id_seq; Type: SEQUENCE; Schema: public; Owner: sensesapp
--

CREATE SEQUENCE senses_service_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.senses_service_id_seq OWNER TO sensesapp;

--
-- Name: senses_service_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sensesapp
--

ALTER SEQUENCE senses_service_id_seq OWNED BY senses_service.id;


--
-- Name: senses_subscheme; Type: TABLE; Schema: public; Owner: sensesapp; Tablespace: 
--

CREATE TABLE senses_subscheme (
    id integer NOT NULL,
    scheme_id integer NOT NULL,
    name character varying(50) NOT NULL,
    description character varying(30),
    subscheme_id character varying(10) NOT NULL
);


ALTER TABLE public.senses_subscheme OWNER TO sensesapp;

--
-- Name: senses_subscheme_conditions; Type: TABLE; Schema: public; Owner: sensesapp; Tablespace: 
--

CREATE TABLE senses_subscheme_conditions (
    id integer NOT NULL,
    subscheme_id integer NOT NULL,
    condition_id integer NOT NULL
);


ALTER TABLE public.senses_subscheme_conditions OWNER TO sensesapp;

--
-- Name: senses_subscheme_conditions_id_seq; Type: SEQUENCE; Schema: public; Owner: sensesapp
--

CREATE SEQUENCE senses_subscheme_conditions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.senses_subscheme_conditions_id_seq OWNER TO sensesapp;

--
-- Name: senses_subscheme_conditions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sensesapp
--

ALTER SEQUENCE senses_subscheme_conditions_id_seq OWNED BY senses_subscheme_conditions.id;


--
-- Name: senses_subscheme_id_seq; Type: SEQUENCE; Schema: public; Owner: sensesapp
--

CREATE SEQUENCE senses_subscheme_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.senses_subscheme_id_seq OWNER TO sensesapp;

--
-- Name: senses_subscheme_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sensesapp
--

ALTER SEQUENCE senses_subscheme_id_seq OWNED BY senses_subscheme.id;


--
-- Name: senses_surgery; Type: TABLE; Schema: public; Owner: sensesapp; Tablespace: 
--

CREATE TABLE senses_surgery (
    id integer NOT NULL,
    disease_id integer NOT NULL,
    hospital_name character varying(50),
    cost character varying(20),
    "cash_inHand" character varying(20),
    member_id integer,
    details text
);


ALTER TABLE public.senses_surgery OWNER TO sensesapp;

--
-- Name: senses_surgery_id_seq; Type: SEQUENCE; Schema: public; Owner: sensesapp
--

CREATE SEQUENCE senses_surgery_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.senses_surgery_id_seq OWNER TO sensesapp;

--
-- Name: senses_surgery_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sensesapp
--

ALTER SEQUENCE senses_surgery_id_seq OWNED BY senses_surgery.id;


--
-- Name: senses_taluk; Type: TABLE; Schema: public; Owner: sensesapp; Tablespace: 
--

CREATE TABLE senses_taluk (
    id integer NOT NULL,
    district_id integer NOT NULL,
    taluk_name character varying(30) NOT NULL
);


ALTER TABLE public.senses_taluk OWNER TO sensesapp;

--
-- Name: senses_taluk_id_seq; Type: SEQUENCE; Schema: public; Owner: sensesapp
--

CREATE SEQUENCE senses_taluk_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.senses_taluk_id_seq OWNER TO sensesapp;

--
-- Name: senses_taluk_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sensesapp
--

ALTER SEQUENCE senses_taluk_id_seq OWNED BY senses_taluk.id;


--
-- Name: south_migrationhistory; Type: TABLE; Schema: public; Owner: sensesapp; Tablespace: 
--

CREATE TABLE south_migrationhistory (
    id integer NOT NULL,
    app_name character varying(255) NOT NULL,
    migration character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.south_migrationhistory OWNER TO sensesapp;

--
-- Name: south_migrationhistory_id_seq; Type: SEQUENCE; Schema: public; Owner: sensesapp
--

CREATE SEQUENCE south_migrationhistory_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.south_migrationhistory_id_seq OWNER TO sensesapp;

--
-- Name: south_migrationhistory_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sensesapp
--

ALTER SEQUENCE south_migrationhistory_id_seq OWNED BY south_migrationhistory.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: sensesapp
--

ALTER TABLE ONLY auth_group ALTER COLUMN id SET DEFAULT nextval('auth_group_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: sensesapp
--

ALTER TABLE ONLY auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('auth_group_permissions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: sensesapp
--

ALTER TABLE ONLY auth_permission ALTER COLUMN id SET DEFAULT nextval('auth_permission_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: sensesapp
--

ALTER TABLE ONLY auth_user ALTER COLUMN id SET DEFAULT nextval('auth_user_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: sensesapp
--

ALTER TABLE ONLY auth_user_groups ALTER COLUMN id SET DEFAULT nextval('auth_user_groups_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: sensesapp
--

ALTER TABLE ONLY auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('auth_user_user_permissions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: sensesapp
--

ALTER TABLE ONLY django_admin_log ALTER COLUMN id SET DEFAULT nextval('django_admin_log_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: sensesapp
--

ALTER TABLE ONLY django_content_type ALTER COLUMN id SET DEFAULT nextval('django_content_type_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: sensesapp
--

ALTER TABLE ONLY django_site ALTER COLUMN id SET DEFAULT nextval('django_site_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: sensesapp
--

ALTER TABLE ONLY senses_chronicdisease ALTER COLUMN id SET DEFAULT nextval('senses_chronicdisease_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: sensesapp
--

ALTER TABLE ONLY senses_condition ALTER COLUMN id SET DEFAULT nextval('senses_condition_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: sensesapp
--

ALTER TABLE ONLY senses_disease ALTER COLUMN id SET DEFAULT nextval('senses_disease_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: sensesapp
--

ALTER TABLE ONLY senses_district ALTER COLUMN id SET DEFAULT nextval('senses_district_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: sensesapp
--

ALTER TABLE ONLY senses_family ALTER COLUMN id SET DEFAULT nextval('senses_family_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: sensesapp
--

ALTER TABLE ONLY senses_masjid ALTER COLUMN id SET DEFAULT nextval('senses_masjid_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: sensesapp
--

ALTER TABLE ONLY senses_masjid_members ALTER COLUMN id SET DEFAULT nextval('senses_masjid_members_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: sensesapp
--

ALTER TABLE ONLY senses_medical ALTER COLUMN id SET DEFAULT nextval('senses_medical_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: sensesapp
--

ALTER TABLE ONLY senses_member ALTER COLUMN id SET DEFAULT nextval('senses_member_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: sensesapp
--

ALTER TABLE ONLY senses_member_scheme ALTER COLUMN id SET DEFAULT nextval('senses_member_scheme_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: sensesapp
--

ALTER TABLE ONLY senses_member_service ALTER COLUMN id SET DEFAULT nextval('senses_member_service_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: sensesapp
--

ALTER TABLE ONLY senses_scheme ALTER COLUMN id SET DEFAULT nextval('senses_scheme_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: sensesapp
--

ALTER TABLE ONLY senses_sensesmembers ALTER COLUMN id SET DEFAULT nextval('senses_sensesmembers_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: sensesapp
--

ALTER TABLE ONLY senses_service ALTER COLUMN id SET DEFAULT nextval('senses_service_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: sensesapp
--

ALTER TABLE ONLY senses_subscheme ALTER COLUMN id SET DEFAULT nextval('senses_subscheme_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: sensesapp
--

ALTER TABLE ONLY senses_subscheme_conditions ALTER COLUMN id SET DEFAULT nextval('senses_subscheme_conditions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: sensesapp
--

ALTER TABLE ONLY senses_surgery ALTER COLUMN id SET DEFAULT nextval('senses_surgery_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: sensesapp
--

ALTER TABLE ONLY senses_taluk ALTER COLUMN id SET DEFAULT nextval('senses_taluk_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: sensesapp
--

ALTER TABLE ONLY south_migrationhistory ALTER COLUMN id SET DEFAULT nextval('south_migrationhistory_id_seq'::regclass);


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: sensesapp
--

COPY auth_group (id, name) FROM stdin;
\.


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sensesapp
--

SELECT pg_catalog.setval('auth_group_id_seq', 1, false);


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: sensesapp
--

COPY auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sensesapp
--

SELECT pg_catalog.setval('auth_group_permissions_id_seq', 1, false);


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: sensesapp
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
31	Can add family	11	add_family
32	Can change family	11	change_family
33	Can delete family	11	delete_family
34	Can add scheme	12	add_scheme
35	Can change scheme	12	change_scheme
36	Can delete scheme	12	delete_scheme
37	Can add member	13	add_member
38	Can change member	13	change_member
39	Can delete member	13	delete_member
43	Can add masjid_members	15	add_masjid_members
44	Can change masjid_members	15	change_masjid_members
45	Can delete masjid_members	15	delete_masjid_members
46	Can add masjid	16	add_masjid
47	Can change masjid	16	change_masjid
48	Can delete masjid	16	delete_masjid
49	Can add sub scheme	17	add_subscheme
50	Can change sub scheme	17	change_subscheme
51	Can delete sub scheme	17	delete_subscheme
52	Can add member_scheme	18	add_member_scheme
53	Can change member_scheme	18	change_member_scheme
54	Can delete member_scheme	18	delete_member_scheme
55	Can add disease	19	add_disease
56	Can change disease	19	change_disease
57	Can delete disease	19	delete_disease
58	Can add surgery	20	add_surgery
59	Can change surgery	20	change_surgery
60	Can delete surgery	20	delete_surgery
61	Can add medical	21	add_medical
62	Can change medical	21	change_medical
63	Can delete medical	21	delete_medical
64	Can add chronic disease	22	add_chronicdisease
65	Can change chronic disease	22	change_chronicdisease
66	Can delete chronic disease	22	delete_chronicdisease
67	Can add condition	23	add_condition
68	Can change condition	23	change_condition
69	Can delete condition	23	delete_condition
70	Can add service	24	add_service
71	Can change service	24	change_service
72	Can delete service	24	delete_service
73	Can add member_service	25	add_member_service
74	Can change member_service	25	change_member_service
75	Can delete member_service	25	delete_member_service
76	Can add senses members	26	add_sensesmembers
77	Can change senses members	26	change_sensesmembers
78	Can delete senses members	26	delete_sensesmembers
\.


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sensesapp
--

SELECT pg_catalog.setval('auth_permission_id_seq', 78, true);


--
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: sensesapp
--

COPY auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
6	pbkdf2_sha256$10000$l2hGSYrrnmFi$MJvyUfgv0gpG/iCw19GLsBHZ2ycSr3/xjHmj4nIkBio=	2015-10-06 00:25:12.666-07	f	mhm				f	t	2015-10-06 00:25:12.666-07
4	pbkdf2_sha256$10000$ab5T9sq3iXlK$Xg7xU5K6olsHz4JVMrnnXJyR5M/6reNFcsDl+Op1tzo=	2015-10-06 00:44:32.344-07	t	mohideen			mohi@mail.com	t	t	2015-10-01 02:58:50.186-07
1	pbkdf2_sha256$10000$pzD19ycK6dw4$HOalQ7w1CwfeKWeoeSpLOOFpF6OCV8ecxN2zZviY2Q0=	2015-10-06 00:45:18.753-07	t	admin			admin@mail.com	t	t	2015-09-02 12:45:04.249-07
5	pbkdf2_sha256$10000$igN5SoZ9FA8N$rz944YIu3ngZF0L7M6NLYWf0wultG9Y9hz0UAb6BCUg=	2015-10-06 05:14:17.585-07	f	mohammed				f	t	2015-10-05 23:13:22.093-07
7	pbkdf2_sha256$10000$5BgUGXCqpFPV$5Buc42WSAQgzO1sb3a+zJQNfyLNCNm2cgUx7h+G2Cgo=	2015-10-07 00:25:36.027-07	f	guindy				f	t	2015-10-06 07:13:10.619-07
3	pbkdf2_sha256$10000$efY7cP0lP8Rn$WuqWyjSE30YiuF8YDoPZy/UipK39u+5Y+XN19VT0FRg=	2015-10-07 01:24:31.533-07	f	senses	Admin			f	t	2015-09-02 12:47:09.475-07
\.


--
-- Data for Name: auth_user_groups; Type: TABLE DATA; Schema: public; Owner: sensesapp
--

COPY auth_user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sensesapp
--

SELECT pg_catalog.setval('auth_user_groups_id_seq', 1, false);


--
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sensesapp
--

SELECT pg_catalog.setval('auth_user_id_seq', 7, true);


--
-- Data for Name: auth_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: sensesapp
--

COPY auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sensesapp
--

SELECT pg_catalog.setval('auth_user_user_permissions_id_seq', 1, false);


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: sensesapp
--

COPY django_admin_log (id, action_time, user_id, content_type_id, object_id, object_repr, action_flag, change_message) FROM stdin;
1	2015-10-01 03:14:14.211-07	4	19	5	Disease object	3	
\.


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sensesapp
--

SELECT pg_catalog.setval('django_admin_log_id_seq', 1, true);


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: sensesapp
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
11	family	senses	family
12	scheme	senses	scheme
13	member	senses	member
15	masjid_members	senses	masjid_members
16	masjid	senses	masjid
17	sub scheme	senses	subscheme
18	member_scheme	senses	member_scheme
19	disease	senses	disease
20	surgery	senses	surgery
21	medical	senses	medical
22	chronic disease	senses	chronicdisease
23	condition	senses	condition
24	service	senses	service
25	member_service	senses	member_service
26	senses members	senses	sensesmembers
\.


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sensesapp
--

SELECT pg_catalog.setval('django_content_type_id_seq', 26, true);


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: sensesapp
--

COPY django_session (session_key, session_data, expire_date) FROM stdin;
vm0npzskcwz0689u24vfp2unmtqya4gb	Y2YzOGQ2NTBjMjk5NzkyNDgyNDkzN2E0NzFiZDhkMDYxOTJlMTBhYzqAAn1xAShVEl9hdXRoX3VzZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHEDVQ1fYXV0aF91c2VyX2lkcQRLA3Uu	2015-10-20 03:35:43.398-07
u0r7j0gytw6qnwtc49abo6uzhh6vtefi	MjRiM2I1NTlhZjc4MTQ3NDhlMGY0MjUyNDk5ZWZkNzVhYWMyOTUzZDqAAn1xAShVEl9hdXRoX3VzZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHEDVQ1fYXV0aF91c2VyX2lkcQRLBHUu	2015-10-15 03:04:24.146-07
ka3002hfv03ovj0xxlnjln0prfdb5ffh	NjNkZDIzZDVmMGJmMzA2Y2RjNTYyMWEzODI1NDI2ZmJjZTYwMTgxNjqAAn1xAS4=	2015-10-19 00:40:51.434-07
3ohqpfsvd31k5rvcngqmkb3vg7841m8e	YzlkMTUzZmRhNWQ5YTUyNzM4NGJhZmIwOWYyMjAxNDczNjMxYmFiZjqAAn1xAShVEl9hdXRoX3VzZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHEDVQ1fYXV0aF91c2VyX2lkcQRLB3Uu	2015-10-21 00:25:36.17-07
ntct4ktvxxu70qjzwrg6301nbiypo0wx	Y2YzOGQ2NTBjMjk5NzkyNDgyNDkzN2E0NzFiZDhkMDYxOTJlMTBhYzqAAn1xAShVEl9hdXRoX3VzZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHEDVQ1fYXV0aF91c2VyX2lkcQRLA3Uu	2015-10-21 01:24:31.562-07
\.


--
-- Data for Name: django_site; Type: TABLE DATA; Schema: public; Owner: sensesapp
--

COPY django_site (id, domain, name) FROM stdin;
1	example.com	example.com
\.


--
-- Name: django_site_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sensesapp
--

SELECT pg_catalog.setval('django_site_id_seq', 1, true);


--
-- Data for Name: senses_chronicdisease; Type: TABLE DATA; Schema: public; Owner: sensesapp
--

COPY senses_chronicdisease (id, disease_name_id, doctor_name, cost, status, details, member_id) FROM stdin;
1	3			t		2
\.


--
-- Name: senses_chronicdisease_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sensesapp
--

SELECT pg_catalog.setval('senses_chronicdisease_id_seq', 17, true);


--
-- Data for Name: senses_condition; Type: TABLE DATA; Schema: public; Owner: sensesapp
--

COPY senses_condition (id, field, conditions, value) FROM stdin;
\.


--
-- Name: senses_condition_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sensesapp
--

SELECT pg_catalog.setval('senses_condition_id_seq', 1, false);


--
-- Data for Name: senses_disease; Type: TABLE DATA; Schema: public; Owner: sensesapp
--

COPY senses_disease (id, disease_name, sym_type, description) FROM stdin;
1	Cold	DISEASE	its occurs due to climate change
3	Fever	DISEASE	
\.


--
-- Name: senses_disease_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sensesapp
--

SELECT pg_catalog.setval('senses_disease_id_seq', 5, true);


--
-- Data for Name: senses_district; Type: TABLE DATA; Schema: public; Owner: sensesapp
--

COPY senses_district (id, district_name, district_code) FROM stdin;
9	Ariyalur	AR
1	Chennai	CH
11	Coimbatore	CO
12	Cuddalore	CU
13	Dharmapuri	DH
14	Dindigul	DI
15	Erode	ER
5	Kanchipuram	KC
16	Kanyakumari	KK
17	Karur	KRR
18	Krishnagiri	KR
8	Madurai	MA
19	Nagapattinam	NG
20	Namakkal	NM
21	The Nilgiris	NI
22	Perambalur	PE
23	Pudukkottai	PU
7	Ramanathapuram	RA
24	Salem	SA
25	Sivaganga	SI
26	Thanjavur	TJ
27	Theni	TH
28	Thoothukudi	TK
29	Tiruchirappalli	TC
30	Tirunelveli	TI
31	Tiruppur	TP
6	Tiruvallur	TL
32	Tiruvannamalai	TV
33	Tiruvarur	TR
34	Vellore	VE
35	Viluppuram	VL
36	Virudhunagar	VR
\.


--
-- Name: senses_district_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sensesapp
--

SELECT pg_catalog.setval('senses_district_id_seq', 36, true);


--
-- Data for Name: senses_family; Type: TABLE DATA; Schema: public; Owner: sensesapp
--

COPY senses_family (id, address, mobile, house_type, toilet, financial_status, family_id, ration_card, muhalla_id, donor, volunteer, health_insurance, family_needs, language) FROM stdin;
1	Alandur	998877665	Rent	t	A - Well Settled	CH / 0001 / 1	TN02/AB00123	1	t	f	f		\N
3	11ascs	111	Rent	t	A - Well Settled	CH / 0001 / 3	09911	1	f	f	t	no	\N
2	Alandur	87654314127	Rent	t	B - Full Filled	CH / 0003 / 2	TN22/123	3	t	t	t	None	Tamil
\.


--
-- Name: senses_family_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sensesapp
--

SELECT pg_catalog.setval('senses_family_id_seq', 3, true);


--
-- Data for Name: senses_masjid; Type: TABLE DATA; Schema: public; Owner: sensesapp
--

COPY senses_masjid (id, taluk_id, name, musallas, location, mohalla_id) FROM stdin;
1	1	guindy	100	guindy	0001
4	14	Kamudhi Big Mosque	1000	Kamudhi	0004
2	7	makka masjid	500	Mount Road	0002
3	3	Iqlas masjid	10	Thiruvanmiur	0003
\.


--
-- Name: senses_masjid_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sensesapp
--

SELECT pg_catalog.setval('senses_masjid_id_seq', 5, true);


--
-- Data for Name: senses_masjid_members; Type: TABLE DATA; Schema: public; Owner: sensesapp
--

COPY senses_masjid_members (id, masjid_id, member_name, age, mobile, address, designation) FROM stdin;
3	2	mohideen ibn mohammed	22	7812025060	alandur	programmer
4	2	Rahman	25	9988776655	Chennai	Programmer
6	1	Mohideen ibn Mohammed	22	0987654321	Alanduru	Programmer
\.


--
-- Name: senses_masjid_members_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sensesapp
--

SELECT pg_catalog.setval('senses_masjid_members_id_seq', 10, true);


--
-- Data for Name: senses_medical; Type: TABLE DATA; Schema: public; Owner: sensesapp
--

COPY senses_medical (id, medicine_needs, cost, member_id, disease_id) FROM stdin;
1	Paracitamal	10	4	3
2	tablet	100	2	3
\.


--
-- Name: senses_medical_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sensesapp
--

SELECT pg_catalog.setval('senses_medical_id_seq', 8, true);


--
-- Data for Name: senses_member; Type: TABLE DATA; Schema: public; Owner: sensesapp
--

COPY senses_member (id, mem_id, name, gender, age, "Relation", marital_status, qualification, mother_tongue, disability, voter_status, family_id, occupation, curr_location, "Makthab", madarasa_details, donor, volunteer, mobile, alive, muhalla_id, quran_reading, namaz, family_head) FROM stdin;
4	CH / 0003 / 2 / 4	Alima	FEMALE	40	Wife	Married	8	\N	f	t	2	none	Local	t	Interest in Aalim/Hifz	f	f	\N	t	3	t	5 Times a day	t
2	CH / 0003 / 2 / 2	Abdullah	MALE	45	Family Head	Married	10	Tamil	f	t	2	Business	Local	f	Adult Makthab	f	t	7812025060	t	3	f	Not at All	f
\.


--
-- Name: senses_member_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sensesapp
--

SELECT pg_catalog.setval('senses_member_id_seq', 6, true);


--
-- Data for Name: senses_member_scheme; Type: TABLE DATA; Schema: public; Owner: sensesapp
--

COPY senses_member_scheme (id, scheme_id, status, member_id, solution) FROM stdin;
10	9	f	4	Not Yet
11	10	f	4	Not Yet
12	11	f	4	Not Yet
1	9	f	2	Not Yet
2	10	t	2	Solved
3	11	f	2	Not Yet
4	1	f	2	Not Yet
5	2	f	2	Not Yet
6	3	f	2	Not Yet
13	4	f	2	Not Yet
14	5	f	2	Not Yet
15	6	f	2	Not Yet
16	7	t	2	Not Yet
17	8	f	2	Not Yet
18	19	f	2	Not Yet
\.


--
-- Name: senses_member_scheme_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sensesapp
--

SELECT pg_catalog.setval('senses_member_scheme_id_seq', 18, true);


--
-- Data for Name: senses_member_service; Type: TABLE DATA; Schema: public; Owner: sensesapp
--

COPY senses_member_service (id, member_id, scheme_id, status, solution) FROM stdin;
4	4	2	t	Not Yet
5	4	4	f	Not Yet
6	4	5	f	Not Yet
3	2	2	t	Not Yet
2	2	4	f	Not Yet
1	2	5	t	Not Yet
\.


--
-- Name: senses_member_service_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sensesapp
--

SELECT pg_catalog.setval('senses_member_service_id_seq', 6, true);


--
-- Data for Name: senses_scheme; Type: TABLE DATA; Schema: public; Owner: sensesapp
--

COPY senses_scheme (id, scheme_type) FROM stdin;
2	Govt/ Other NGO'S Related Schemes
7	Education / Employment Related Services
8	SELECT or ADD SCHEMES
\.


--
-- Name: senses_scheme_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sensesapp
--

SELECT pg_catalog.setval('senses_scheme_id_seq', 8, true);


--
-- Data for Name: senses_sensesmembers; Type: TABLE DATA; Schema: public; Owner: sensesapp
--

COPY senses_sensesmembers (id, user_id, member_type, masjid_id) FROM stdin;
1	5	Mohalla User	3
3	7	Mohalla User	1
\.


--
-- Name: senses_sensesmembers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sensesapp
--

SELECT pg_catalog.setval('senses_sensesmembers_id_seq', 3, true);


--
-- Data for Name: senses_service; Type: TABLE DATA; Schema: public; Owner: sensesapp
--

COPY senses_service (id, name, description, service_id) FROM stdin;
2	Solutions for Family Problems	It Describes persons who needs solution for their family problems	FA12
4	Nikkah Guidance	Guidance for women	NK12
5	Child Welfare		CW10
6	Training/Employment Help and Guidance Needers List		TR01
\.


--
-- Name: senses_service_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sensesapp
--

SELECT pg_catalog.setval('senses_service_id_seq', 6, true);


--
-- Data for Name: senses_subscheme; Type: TABLE DATA; Schema: public; Owner: sensesapp
--

COPY senses_subscheme (id, scheme_id, name, description, subscheme_id) FROM stdin;
1	2	Old Age Pension	\N	GN01
2	2	Deserted Women Pension	\N	GN02
3	2	Marriage Help	\N	GN03
4	2	Disablity Person	\N	GN04
5	2	Aged Unmarried Woman Welfare	\N	GN05
6	2	Widow Woman Welfare	\N	GN06
7	2	Destitue / Orphan Welfare	\N	GN07
8	2	Ulama Welfare Card	\N	ED08
9	7	Higher Education Guidance	\N	ED09
10	7	Financial Support for Education	\N	ED10
11	7	Pre Matric Scholorship	\N	ED11
19	2	Post Matric Scholorship		ED13
20	7	Help for Higher Education/ Guidance Needed		ED01
21	7	Help for Education Discontinued/Guidance Needed		ED02
\.


--
-- Data for Name: senses_subscheme_conditions; Type: TABLE DATA; Schema: public; Owner: sensesapp
--

COPY senses_subscheme_conditions (id, subscheme_id, condition_id) FROM stdin;
\.


--
-- Name: senses_subscheme_conditions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sensesapp
--

SELECT pg_catalog.setval('senses_subscheme_conditions_id_seq', 1, false);


--
-- Name: senses_subscheme_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sensesapp
--

SELECT pg_catalog.setval('senses_subscheme_id_seq', 21, true);


--
-- Data for Name: senses_surgery; Type: TABLE DATA; Schema: public; Owner: sensesapp
--

COPY senses_surgery (id, disease_id, hospital_name, cost, "cash_inHand", member_id, details) FROM stdin;
\.


--
-- Name: senses_surgery_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sensesapp
--

SELECT pg_catalog.setval('senses_surgery_id_seq', 1, false);


--
-- Data for Name: senses_taluk; Type: TABLE DATA; Schema: public; Owner: sensesapp
--

COPY senses_taluk (id, district_id, taluk_name) FROM stdin;
1	1	GUINDY
3	1	THIRUVANMIUR
4	5	ALANDUR
5	6	AMBATTUR
6	6	AVADI
7	1	MANNADY
8	7	RAMNAD
9	7	RAMESWARAM
10	7	KADALADI
11	7	MUDUKULATHUR
12	7	THIRUVADANAI
13	7	PARAMAKUDI
14	7	KAMUTHI
15	7	KEELAKARAI
16	8	Mathu thavani
17	21	Erkadu
2	1	ADYAR
\.


--
-- Name: senses_taluk_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sensesapp
--

SELECT pg_catalog.setval('senses_taluk_id_seq', 19, true);


--
-- Data for Name: south_migrationhistory; Type: TABLE DATA; Schema: public; Owner: sensesapp
--

COPY south_migrationhistory (id, app_name, migration, applied) FROM stdin;
1	senses	0001_initial	2015-09-02 12:45:15.178-07
3	senses	0002_auto__add_masjid_members__add_masjid	2015-09-02 02:17:54.232-07
4	senses	0003_auto__del_field_family_ration_card_id__add_field_family_family_id__add	2015-09-04 00:02:22.476-07
5	senses	0004_auto__add_field_family_muhalla	2015-09-04 05:18:56.515-07
6	senses	0005_auto__add_field_member_mother_tongue__del_field_family_mother_tongue__	2015-09-04 07:35:57.776-07
7	senses	0006_auto__add_member_scheme__add_subscheme__del_field_scheme_description__	2015-09-08 07:11:01.786-07
8	senses	0007_auto__add_unique_scheme_scheme_type	2015-09-08 23:20:18.346-07
9	senses	0008_auto__add_chronicdisease__add_disease__add_surgery__add_medical__chg_f	2015-09-09 02:40:29.118-07
11	senses	0009_auto__add_field_member_disability	2015-09-09 04:21:01.905-07
12	senses	0010_auto__chg_field_subscheme_field	2015-09-09 04:27:51.395-07
13	senses	0011_auto__add_field_family_donor__add_field_family_volunteer__add_field_fa	2015-09-10 00:08:20.708-07
14	senses	0012_auto__add_field_district_district_code	2015-09-10 02:51:56.45-07
15	senses	0013_auto__add_unique_district_district_code	2015-09-10 02:55:18.273-07
16	senses	0014_auto__chg_field_family_family_id__chg_field_family_ration_card	2015-09-10 04:10:32.704-07
17	senses	0015_auto__add_field_masjid_mohalla_id	2015-09-12 01:24:53.253-07
18	senses	0016_auto__add_unique_masjid_mohalla_id	2015-09-12 01:27:57.182-07
19	senses	0017_auto__add_field_member_qualification	2015-09-12 05:26:58.443-07
20	senses	0018_auto__del_member__del_field_member_scheme_member__del_field_chronicdis	2015-09-12 05:51:50.573-07
21	senses	0019_auto__add_member	2015-09-12 05:52:07.935-07
22	senses	0020_auto__add_field_member_scheme_member__add_field_chronicdisease_member_	2015-09-12 05:52:59.608-07
23	senses	0021_auto__add_field_member_donor__add_field_member_volunteer	2015-09-15 00:08:44.388-07
24	senses	0022_auto__add_field_member_mobile	2015-09-15 23:22:26.631-07
25	senses	0023_auto__add_field_member_alive	2015-09-16 00:19:53.397-07
26	senses	0024_auto__add_condition__del_field_subscheme_field__del_field_subscheme_co	2015-09-16 06:40:02.043-07
27	senses	0025_auto	2015-09-16 06:42:42.948-07
28	senses	0026_auto__add_field_subscheme_subscheme_id	2015-09-17 06:42:04.283-07
29	senses	0027_auto__add_unique_subscheme_subscheme_id	2015-09-17 06:44:49.984-07
30	senses	0028_auto__add_service__add_member_service	2015-09-19 02:40:25.871-07
31	senses	0029_auto__add_field_disease_sym_type__del_field_medical_disorder_name__add	2015-09-19 04:21:08.016-07
32	senses	0030_auto__add_field_family_language	2015-09-19 07:02:52.41-07
33	senses	0031_auto__add_field_disease_description	2015-09-20 23:24:03.707-07
34	senses	0032_auto__add_field_service_service_id	2015-09-21 03:46:07.39-07
35	senses	0033_auto__add_field_surgery_details	2015-09-23 00:36:06.481-07
36	senses	0034_auto__add_field_member_muhalla	2015-09-25 03:56:45.094-07
37	senses	0035_auto__add_field_member_quran_reading__add_field_member_namaz	2015-09-26 01:19:30.194-07
38	senses	0036_auto__add_field_member_family_head	2015-09-30 00:20:53.458-07
39	senses	0037_auto__add_field_member_scheme_solution__add_field_member_service_solut	2015-09-30 01:03:04.847-07
40	senses	0038_auto__add_sensesmembers	2015-10-05 07:10:36.172-07
\.


--
-- Name: south_migrationhistory_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sensesapp
--

SELECT pg_catalog.setval('south_migrationhistory_id_seq', 40, true);


--
-- Name: auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: sensesapp; Tablespace: 
--

ALTER TABLE ONLY auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions_group_id_permission_id_key; Type: CONSTRAINT; Schema: public; Owner: sensesapp; Tablespace: 
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_key UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: sensesapp; Tablespace: 
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: sensesapp; Tablespace: 
--

ALTER TABLE ONLY auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission_content_type_id_codename_key; Type: CONSTRAINT; Schema: public; Owner: sensesapp; Tablespace: 
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_key UNIQUE (content_type_id, codename);


--
-- Name: auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: sensesapp; Tablespace: 
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: sensesapp; Tablespace: 
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups_user_id_group_id_key; Type: CONSTRAINT; Schema: public; Owner: sensesapp; Tablespace: 
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_group_id_key UNIQUE (user_id, group_id);


--
-- Name: auth_user_pkey; Type: CONSTRAINT; Schema: public; Owner: sensesapp; Tablespace: 
--

ALTER TABLE ONLY auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: sensesapp; Tablespace: 
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions_user_id_permission_id_key; Type: CONSTRAINT; Schema: public; Owner: sensesapp; Tablespace: 
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_permission_id_key UNIQUE (user_id, permission_id);


--
-- Name: auth_user_username_key; Type: CONSTRAINT; Schema: public; Owner: sensesapp; Tablespace: 
--

ALTER TABLE ONLY auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);


--
-- Name: django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: sensesapp; Tablespace: 
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type_app_label_model_key; Type: CONSTRAINT; Schema: public; Owner: sensesapp; Tablespace: 
--

ALTER TABLE ONLY django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_key UNIQUE (app_label, model);


--
-- Name: django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: sensesapp; Tablespace: 
--

ALTER TABLE ONLY django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: sensesapp; Tablespace: 
--

ALTER TABLE ONLY django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: django_site_pkey; Type: CONSTRAINT; Schema: public; Owner: sensesapp; Tablespace: 
--

ALTER TABLE ONLY django_site
    ADD CONSTRAINT django_site_pkey PRIMARY KEY (id);


--
-- Name: senses_chronicdisease_pkey; Type: CONSTRAINT; Schema: public; Owner: sensesapp; Tablespace: 
--

ALTER TABLE ONLY senses_chronicdisease
    ADD CONSTRAINT senses_chronicdisease_pkey PRIMARY KEY (id);


--
-- Name: senses_condition_pkey; Type: CONSTRAINT; Schema: public; Owner: sensesapp; Tablespace: 
--

ALTER TABLE ONLY senses_condition
    ADD CONSTRAINT senses_condition_pkey PRIMARY KEY (id);


--
-- Name: senses_disease_disease_name_key; Type: CONSTRAINT; Schema: public; Owner: sensesapp; Tablespace: 
--

ALTER TABLE ONLY senses_disease
    ADD CONSTRAINT senses_disease_disease_name_key UNIQUE (disease_name);


--
-- Name: senses_disease_pkey; Type: CONSTRAINT; Schema: public; Owner: sensesapp; Tablespace: 
--

ALTER TABLE ONLY senses_disease
    ADD CONSTRAINT senses_disease_pkey PRIMARY KEY (id);


--
-- Name: senses_district_district_code_uniq; Type: CONSTRAINT; Schema: public; Owner: sensesapp; Tablespace: 
--

ALTER TABLE ONLY senses_district
    ADD CONSTRAINT senses_district_district_code_uniq UNIQUE (district_code);


--
-- Name: senses_district_district_name_key; Type: CONSTRAINT; Schema: public; Owner: sensesapp; Tablespace: 
--

ALTER TABLE ONLY senses_district
    ADD CONSTRAINT senses_district_district_name_key UNIQUE (district_name);


--
-- Name: senses_district_pkey; Type: CONSTRAINT; Schema: public; Owner: sensesapp; Tablespace: 
--

ALTER TABLE ONLY senses_district
    ADD CONSTRAINT senses_district_pkey PRIMARY KEY (id);


--
-- Name: senses_family_family_id_key; Type: CONSTRAINT; Schema: public; Owner: sensesapp; Tablespace: 
--

ALTER TABLE ONLY senses_family
    ADD CONSTRAINT senses_family_family_id_key UNIQUE (family_id);


--
-- Name: senses_family_pkey; Type: CONSTRAINT; Schema: public; Owner: sensesapp; Tablespace: 
--

ALTER TABLE ONLY senses_family
    ADD CONSTRAINT senses_family_pkey PRIMARY KEY (id);


--
-- Name: senses_masjid_members_pkey; Type: CONSTRAINT; Schema: public; Owner: sensesapp; Tablespace: 
--

ALTER TABLE ONLY senses_masjid_members
    ADD CONSTRAINT senses_masjid_members_pkey PRIMARY KEY (id);


--
-- Name: senses_masjid_mohalla_id_uniq; Type: CONSTRAINT; Schema: public; Owner: sensesapp; Tablespace: 
--

ALTER TABLE ONLY senses_masjid
    ADD CONSTRAINT senses_masjid_mohalla_id_uniq UNIQUE (mohalla_id);


--
-- Name: senses_masjid_pkey; Type: CONSTRAINT; Schema: public; Owner: sensesapp; Tablespace: 
--

ALTER TABLE ONLY senses_masjid
    ADD CONSTRAINT senses_masjid_pkey PRIMARY KEY (id);


--
-- Name: senses_medical_pkey; Type: CONSTRAINT; Schema: public; Owner: sensesapp; Tablespace: 
--

ALTER TABLE ONLY senses_medical
    ADD CONSTRAINT senses_medical_pkey PRIMARY KEY (id);


--
-- Name: senses_member_mem_id_key; Type: CONSTRAINT; Schema: public; Owner: sensesapp; Tablespace: 
--

ALTER TABLE ONLY senses_member
    ADD CONSTRAINT senses_member_mem_id_key UNIQUE (mem_id);


--
-- Name: senses_member_pkey; Type: CONSTRAINT; Schema: public; Owner: sensesapp; Tablespace: 
--

ALTER TABLE ONLY senses_member
    ADD CONSTRAINT senses_member_pkey PRIMARY KEY (id);


--
-- Name: senses_member_scheme_pkey; Type: CONSTRAINT; Schema: public; Owner: sensesapp; Tablespace: 
--

ALTER TABLE ONLY senses_member_scheme
    ADD CONSTRAINT senses_member_scheme_pkey PRIMARY KEY (id);


--
-- Name: senses_member_service_pkey; Type: CONSTRAINT; Schema: public; Owner: sensesapp; Tablespace: 
--

ALTER TABLE ONLY senses_member_service
    ADD CONSTRAINT senses_member_service_pkey PRIMARY KEY (id);


--
-- Name: senses_scheme_pkey; Type: CONSTRAINT; Schema: public; Owner: sensesapp; Tablespace: 
--

ALTER TABLE ONLY senses_scheme
    ADD CONSTRAINT senses_scheme_pkey PRIMARY KEY (id);


--
-- Name: senses_scheme_scheme_type_uniq; Type: CONSTRAINT; Schema: public; Owner: sensesapp; Tablespace: 
--

ALTER TABLE ONLY senses_scheme
    ADD CONSTRAINT senses_scheme_scheme_type_uniq UNIQUE (scheme_type);


--
-- Name: senses_sensesmembers_pkey; Type: CONSTRAINT; Schema: public; Owner: sensesapp; Tablespace: 
--

ALTER TABLE ONLY senses_sensesmembers
    ADD CONSTRAINT senses_sensesmembers_pkey PRIMARY KEY (id);


--
-- Name: senses_sensesmembers_user_id_key; Type: CONSTRAINT; Schema: public; Owner: sensesapp; Tablespace: 
--

ALTER TABLE ONLY senses_sensesmembers
    ADD CONSTRAINT senses_sensesmembers_user_id_key UNIQUE (user_id);


--
-- Name: senses_service_name_key; Type: CONSTRAINT; Schema: public; Owner: sensesapp; Tablespace: 
--

ALTER TABLE ONLY senses_service
    ADD CONSTRAINT senses_service_name_key UNIQUE (name);


--
-- Name: senses_service_pkey; Type: CONSTRAINT; Schema: public; Owner: sensesapp; Tablespace: 
--

ALTER TABLE ONLY senses_service
    ADD CONSTRAINT senses_service_pkey PRIMARY KEY (id);


--
-- Name: senses_service_service_id_key; Type: CONSTRAINT; Schema: public; Owner: sensesapp; Tablespace: 
--

ALTER TABLE ONLY senses_service
    ADD CONSTRAINT senses_service_service_id_key UNIQUE (service_id);


--
-- Name: senses_subscheme_conditions_pkey; Type: CONSTRAINT; Schema: public; Owner: sensesapp; Tablespace: 
--

ALTER TABLE ONLY senses_subscheme_conditions
    ADD CONSTRAINT senses_subscheme_conditions_pkey PRIMARY KEY (id);


--
-- Name: senses_subscheme_conditions_subscheme_id_57e440ad_uniq; Type: CONSTRAINT; Schema: public; Owner: sensesapp; Tablespace: 
--

ALTER TABLE ONLY senses_subscheme_conditions
    ADD CONSTRAINT senses_subscheme_conditions_subscheme_id_57e440ad_uniq UNIQUE (subscheme_id, condition_id);


--
-- Name: senses_subscheme_pkey; Type: CONSTRAINT; Schema: public; Owner: sensesapp; Tablespace: 
--

ALTER TABLE ONLY senses_subscheme
    ADD CONSTRAINT senses_subscheme_pkey PRIMARY KEY (id);


--
-- Name: senses_subscheme_subscheme_id_uniq; Type: CONSTRAINT; Schema: public; Owner: sensesapp; Tablespace: 
--

ALTER TABLE ONLY senses_subscheme
    ADD CONSTRAINT senses_subscheme_subscheme_id_uniq UNIQUE (subscheme_id);


--
-- Name: senses_surgery_pkey; Type: CONSTRAINT; Schema: public; Owner: sensesapp; Tablespace: 
--

ALTER TABLE ONLY senses_surgery
    ADD CONSTRAINT senses_surgery_pkey PRIMARY KEY (id);


--
-- Name: senses_taluk_pkey; Type: CONSTRAINT; Schema: public; Owner: sensesapp; Tablespace: 
--

ALTER TABLE ONLY senses_taluk
    ADD CONSTRAINT senses_taluk_pkey PRIMARY KEY (id);


--
-- Name: south_migrationhistory_pkey; Type: CONSTRAINT; Schema: public; Owner: sensesapp; Tablespace: 
--

ALTER TABLE ONLY south_migrationhistory
    ADD CONSTRAINT south_migrationhistory_pkey PRIMARY KEY (id);


--
-- Name: auth_group_name_like; Type: INDEX; Schema: public; Owner: sensesapp; Tablespace: 
--

CREATE INDEX auth_group_name_like ON auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_group_id; Type: INDEX; Schema: public; Owner: sensesapp; Tablespace: 
--

CREATE INDEX auth_group_permissions_group_id ON auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_permission_id; Type: INDEX; Schema: public; Owner: sensesapp; Tablespace: 
--

CREATE INDEX auth_group_permissions_permission_id ON auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_content_type_id; Type: INDEX; Schema: public; Owner: sensesapp; Tablespace: 
--

CREATE INDEX auth_permission_content_type_id ON auth_permission USING btree (content_type_id);


--
-- Name: auth_user_groups_group_id; Type: INDEX; Schema: public; Owner: sensesapp; Tablespace: 
--

CREATE INDEX auth_user_groups_group_id ON auth_user_groups USING btree (group_id);


--
-- Name: auth_user_groups_user_id; Type: INDEX; Schema: public; Owner: sensesapp; Tablespace: 
--

CREATE INDEX auth_user_groups_user_id ON auth_user_groups USING btree (user_id);


--
-- Name: auth_user_user_permissions_permission_id; Type: INDEX; Schema: public; Owner: sensesapp; Tablespace: 
--

CREATE INDEX auth_user_user_permissions_permission_id ON auth_user_user_permissions USING btree (permission_id);


--
-- Name: auth_user_user_permissions_user_id; Type: INDEX; Schema: public; Owner: sensesapp; Tablespace: 
--

CREATE INDEX auth_user_user_permissions_user_id ON auth_user_user_permissions USING btree (user_id);


--
-- Name: auth_user_username_like; Type: INDEX; Schema: public; Owner: sensesapp; Tablespace: 
--

CREATE INDEX auth_user_username_like ON auth_user USING btree (username varchar_pattern_ops);


--
-- Name: django_admin_log_content_type_id; Type: INDEX; Schema: public; Owner: sensesapp; Tablespace: 
--

CREATE INDEX django_admin_log_content_type_id ON django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_user_id; Type: INDEX; Schema: public; Owner: sensesapp; Tablespace: 
--

CREATE INDEX django_admin_log_user_id ON django_admin_log USING btree (user_id);


--
-- Name: django_session_expire_date; Type: INDEX; Schema: public; Owner: sensesapp; Tablespace: 
--

CREATE INDEX django_session_expire_date ON django_session USING btree (expire_date);


--
-- Name: django_session_session_key_like; Type: INDEX; Schema: public; Owner: sensesapp; Tablespace: 
--

CREATE INDEX django_session_session_key_like ON django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: senses_chronicdisease_disease_name_id; Type: INDEX; Schema: public; Owner: sensesapp; Tablespace: 
--

CREATE INDEX senses_chronicdisease_disease_name_id ON senses_chronicdisease USING btree (disease_name_id);


--
-- Name: senses_chronicdisease_member_id; Type: INDEX; Schema: public; Owner: sensesapp; Tablespace: 
--

CREATE INDEX senses_chronicdisease_member_id ON senses_chronicdisease USING btree (member_id);


--
-- Name: senses_disease_disease_name_like; Type: INDEX; Schema: public; Owner: sensesapp; Tablespace: 
--

CREATE INDEX senses_disease_disease_name_like ON senses_disease USING btree (disease_name varchar_pattern_ops);


--
-- Name: senses_district_district_name_like; Type: INDEX; Schema: public; Owner: sensesapp; Tablespace: 
--

CREATE INDEX senses_district_district_name_like ON senses_district USING btree (district_name varchar_pattern_ops);


--
-- Name: senses_family_family_id_like; Type: INDEX; Schema: public; Owner: sensesapp; Tablespace: 
--

CREATE INDEX senses_family_family_id_like ON senses_family USING btree (family_id varchar_pattern_ops);


--
-- Name: senses_family_muhalla_id; Type: INDEX; Schema: public; Owner: sensesapp; Tablespace: 
--

CREATE INDEX senses_family_muhalla_id ON senses_family USING btree (muhalla_id);


--
-- Name: senses_masjid_members_masjid_id; Type: INDEX; Schema: public; Owner: sensesapp; Tablespace: 
--

CREATE INDEX senses_masjid_members_masjid_id ON senses_masjid_members USING btree (masjid_id);


--
-- Name: senses_masjid_taluk_id; Type: INDEX; Schema: public; Owner: sensesapp; Tablespace: 
--

CREATE INDEX senses_masjid_taluk_id ON senses_masjid USING btree (taluk_id);


--
-- Name: senses_medical_disease_id; Type: INDEX; Schema: public; Owner: sensesapp; Tablespace: 
--

CREATE INDEX senses_medical_disease_id ON senses_medical USING btree (disease_id);


--
-- Name: senses_medical_member_id; Type: INDEX; Schema: public; Owner: sensesapp; Tablespace: 
--

CREATE INDEX senses_medical_member_id ON senses_medical USING btree (member_id);


--
-- Name: senses_member_family_id; Type: INDEX; Schema: public; Owner: sensesapp; Tablespace: 
--

CREATE INDEX senses_member_family_id ON senses_member USING btree (family_id);


--
-- Name: senses_member_mem_id_like; Type: INDEX; Schema: public; Owner: sensesapp; Tablespace: 
--

CREATE INDEX senses_member_mem_id_like ON senses_member USING btree (mem_id varchar_pattern_ops);


--
-- Name: senses_member_muhalla_id; Type: INDEX; Schema: public; Owner: sensesapp; Tablespace: 
--

CREATE INDEX senses_member_muhalla_id ON senses_member USING btree (muhalla_id);


--
-- Name: senses_member_scheme_member_id; Type: INDEX; Schema: public; Owner: sensesapp; Tablespace: 
--

CREATE INDEX senses_member_scheme_member_id ON senses_member_scheme USING btree (member_id);


--
-- Name: senses_member_scheme_scheme_id; Type: INDEX; Schema: public; Owner: sensesapp; Tablespace: 
--

CREATE INDEX senses_member_scheme_scheme_id ON senses_member_scheme USING btree (scheme_id);


--
-- Name: senses_member_service_member_id; Type: INDEX; Schema: public; Owner: sensesapp; Tablespace: 
--

CREATE INDEX senses_member_service_member_id ON senses_member_service USING btree (member_id);


--
-- Name: senses_member_service_scheme_id; Type: INDEX; Schema: public; Owner: sensesapp; Tablespace: 
--

CREATE INDEX senses_member_service_scheme_id ON senses_member_service USING btree (scheme_id);


--
-- Name: senses_sensesmembers_masjid_id; Type: INDEX; Schema: public; Owner: sensesapp; Tablespace: 
--

CREATE INDEX senses_sensesmembers_masjid_id ON senses_sensesmembers USING btree (masjid_id);


--
-- Name: senses_service_name_like; Type: INDEX; Schema: public; Owner: sensesapp; Tablespace: 
--

CREATE INDEX senses_service_name_like ON senses_service USING btree (name varchar_pattern_ops);


--
-- Name: senses_service_service_id_like; Type: INDEX; Schema: public; Owner: sensesapp; Tablespace: 
--

CREATE INDEX senses_service_service_id_like ON senses_service USING btree (service_id varchar_pattern_ops);


--
-- Name: senses_subscheme_conditions_condition_id; Type: INDEX; Schema: public; Owner: sensesapp; Tablespace: 
--

CREATE INDEX senses_subscheme_conditions_condition_id ON senses_subscheme_conditions USING btree (condition_id);


--
-- Name: senses_subscheme_conditions_subscheme_id; Type: INDEX; Schema: public; Owner: sensesapp; Tablespace: 
--

CREATE INDEX senses_subscheme_conditions_subscheme_id ON senses_subscheme_conditions USING btree (subscheme_id);


--
-- Name: senses_subscheme_scheme_id; Type: INDEX; Schema: public; Owner: sensesapp; Tablespace: 
--

CREATE INDEX senses_subscheme_scheme_id ON senses_subscheme USING btree (scheme_id);


--
-- Name: senses_surgery_disease_id; Type: INDEX; Schema: public; Owner: sensesapp; Tablespace: 
--

CREATE INDEX senses_surgery_disease_id ON senses_surgery USING btree (disease_id);


--
-- Name: senses_surgery_member_id; Type: INDEX; Schema: public; Owner: sensesapp; Tablespace: 
--

CREATE INDEX senses_surgery_member_id ON senses_surgery USING btree (member_id);


--
-- Name: senses_taluk_district_id; Type: INDEX; Schema: public; Owner: sensesapp; Tablespace: 
--

CREATE INDEX senses_taluk_district_id ON senses_taluk USING btree (district_id);


--
-- Name: auth_group_permissions_permission_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: sensesapp
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_permission_id_fkey FOREIGN KEY (permission_id) REFERENCES auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups_group_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: sensesapp
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_fkey FOREIGN KEY (group_id) REFERENCES auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions_permission_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: sensesapp
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_permission_id_fkey FOREIGN KEY (permission_id) REFERENCES auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: condition_id_refs_id_987df166; Type: FK CONSTRAINT; Schema: public; Owner: sensesapp
--

ALTER TABLE ONLY senses_subscheme_conditions
    ADD CONSTRAINT condition_id_refs_id_987df166 FOREIGN KEY (condition_id) REFERENCES senses_condition(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: content_type_id_refs_id_93d2d1f8; Type: FK CONSTRAINT; Schema: public; Owner: sensesapp
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT content_type_id_refs_id_93d2d1f8 FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: content_type_id_refs_id_d043b34a; Type: FK CONSTRAINT; Schema: public; Owner: sensesapp
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT content_type_id_refs_id_d043b34a FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: disease_id_refs_id_38968771; Type: FK CONSTRAINT; Schema: public; Owner: sensesapp
--

ALTER TABLE ONLY senses_medical
    ADD CONSTRAINT disease_id_refs_id_38968771 FOREIGN KEY (disease_id) REFERENCES senses_disease(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: disease_id_refs_id_870a7584; Type: FK CONSTRAINT; Schema: public; Owner: sensesapp
--

ALTER TABLE ONLY senses_surgery
    ADD CONSTRAINT disease_id_refs_id_870a7584 FOREIGN KEY (disease_id) REFERENCES senses_disease(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: disease_name_id_refs_id_a51e3347; Type: FK CONSTRAINT; Schema: public; Owner: sensesapp
--

ALTER TABLE ONLY senses_chronicdisease
    ADD CONSTRAINT disease_name_id_refs_id_a51e3347 FOREIGN KEY (disease_name_id) REFERENCES senses_disease(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: district_id_refs_id_9cc57bf3; Type: FK CONSTRAINT; Schema: public; Owner: sensesapp
--

ALTER TABLE ONLY senses_taluk
    ADD CONSTRAINT district_id_refs_id_9cc57bf3 FOREIGN KEY (district_id) REFERENCES senses_district(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: family_id_refs_id_7f453149; Type: FK CONSTRAINT; Schema: public; Owner: sensesapp
--

ALTER TABLE ONLY senses_member
    ADD CONSTRAINT family_id_refs_id_7f453149 FOREIGN KEY (family_id) REFERENCES senses_family(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: group_id_refs_id_f4b32aac; Type: FK CONSTRAINT; Schema: public; Owner: sensesapp
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT group_id_refs_id_f4b32aac FOREIGN KEY (group_id) REFERENCES auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: masjid_id_refs_id_2e9a4ea6; Type: FK CONSTRAINT; Schema: public; Owner: sensesapp
--

ALTER TABLE ONLY senses_sensesmembers
    ADD CONSTRAINT masjid_id_refs_id_2e9a4ea6 FOREIGN KEY (masjid_id) REFERENCES senses_masjid(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: member_id_refs_id_178c57e9; Type: FK CONSTRAINT; Schema: public; Owner: sensesapp
--

ALTER TABLE ONLY senses_member_scheme
    ADD CONSTRAINT member_id_refs_id_178c57e9 FOREIGN KEY (member_id) REFERENCES senses_member(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: member_id_refs_id_7e8e0b25; Type: FK CONSTRAINT; Schema: public; Owner: sensesapp
--

ALTER TABLE ONLY senses_medical
    ADD CONSTRAINT member_id_refs_id_7e8e0b25 FOREIGN KEY (member_id) REFERENCES senses_member(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: member_id_refs_id_94c7b48e; Type: FK CONSTRAINT; Schema: public; Owner: sensesapp
--

ALTER TABLE ONLY senses_member_service
    ADD CONSTRAINT member_id_refs_id_94c7b48e FOREIGN KEY (member_id) REFERENCES senses_member(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: member_id_refs_id_9dbb51ba; Type: FK CONSTRAINT; Schema: public; Owner: sensesapp
--

ALTER TABLE ONLY senses_surgery
    ADD CONSTRAINT member_id_refs_id_9dbb51ba FOREIGN KEY (member_id) REFERENCES senses_member(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: member_id_refs_id_c05fbaa5; Type: FK CONSTRAINT; Schema: public; Owner: sensesapp
--

ALTER TABLE ONLY senses_chronicdisease
    ADD CONSTRAINT member_id_refs_id_c05fbaa5 FOREIGN KEY (member_id) REFERENCES senses_member(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: muhalla_id_refs_id_424eb15c; Type: FK CONSTRAINT; Schema: public; Owner: sensesapp
--

ALTER TABLE ONLY senses_member
    ADD CONSTRAINT muhalla_id_refs_id_424eb15c FOREIGN KEY (muhalla_id) REFERENCES senses_masjid(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: muhalla_id_refs_id_4abc6c48; Type: FK CONSTRAINT; Schema: public; Owner: sensesapp
--

ALTER TABLE ONLY senses_family
    ADD CONSTRAINT muhalla_id_refs_id_4abc6c48 FOREIGN KEY (muhalla_id) REFERENCES senses_masjid(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: scheme_id_refs_id_102e141f; Type: FK CONSTRAINT; Schema: public; Owner: sensesapp
--

ALTER TABLE ONLY senses_member_service
    ADD CONSTRAINT scheme_id_refs_id_102e141f FOREIGN KEY (scheme_id) REFERENCES senses_service(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: scheme_id_refs_id_1031c4b7; Type: FK CONSTRAINT; Schema: public; Owner: sensesapp
--

ALTER TABLE ONLY senses_member_scheme
    ADD CONSTRAINT scheme_id_refs_id_1031c4b7 FOREIGN KEY (scheme_id) REFERENCES senses_subscheme(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: scheme_id_refs_id_8963f538; Type: FK CONSTRAINT; Schema: public; Owner: sensesapp
--

ALTER TABLE ONLY senses_subscheme
    ADD CONSTRAINT scheme_id_refs_id_8963f538 FOREIGN KEY (scheme_id) REFERENCES senses_scheme(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: subscheme_id_refs_id_c4055a2a; Type: FK CONSTRAINT; Schema: public; Owner: sensesapp
--

ALTER TABLE ONLY senses_subscheme_conditions
    ADD CONSTRAINT subscheme_id_refs_id_c4055a2a FOREIGN KEY (subscheme_id) REFERENCES senses_subscheme(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: taluk_id_refs_id_1c5f7696; Type: FK CONSTRAINT; Schema: public; Owner: sensesapp
--

ALTER TABLE ONLY senses_masjid
    ADD CONSTRAINT taluk_id_refs_id_1c5f7696 FOREIGN KEY (taluk_id) REFERENCES senses_taluk(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: user_id_refs_id_40c41112; Type: FK CONSTRAINT; Schema: public; Owner: sensesapp
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT user_id_refs_id_40c41112 FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: user_id_refs_id_4dc23c39; Type: FK CONSTRAINT; Schema: public; Owner: sensesapp
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT user_id_refs_id_4dc23c39 FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: user_id_refs_id_c0d12874; Type: FK CONSTRAINT; Schema: public; Owner: sensesapp
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT user_id_refs_id_c0d12874 FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: user_id_refs_id_cc8061bd; Type: FK CONSTRAINT; Schema: public; Owner: sensesapp
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

