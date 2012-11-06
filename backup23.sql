--
-- PostgreSQL database dump
--

-- Dumped from database version 9.1.4
-- Dumped by pg_dump version 9.1.4
-- Started on 2012-11-06 18:23:45 VET

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- TOC entry 192 (class 3079 OID 11907)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 2287 (class 0 OID 0)
-- Dependencies: 192
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 182 (class 1259 OID 17619)
-- Dependencies: 6
-- Name: indicator_father_son; Type: TABLE; Schema: public; Owner: bmo; Tablespace: 
--

CREATE TABLE indicator_father_son (
    indicatorfather_id integer,
    indicatorson_id integer
);


ALTER TABLE public.indicator_father_son OWNER TO bmo;

--
-- TOC entry 178 (class 1259 OID 17597)
-- Dependencies: 2223 6
-- Name: indicator_scores; Type: TABLE; Schema: public; Owner: bmo; Tablespace: 
--

CREATE TABLE indicator_scores (
    id integer NOT NULL,
    indicator_id integer,
    scoredate_id integer,
    score double precision,
    goal double precision DEFAULT 0.0,
    redfrom double precision,
    redto double precision,
    yellowfrom double precision,
    yellowto double precision,
    greenfrom double precision,
    greento double precision,
    baseline double precision,
    growth double precision,
    progress double precision,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.indicator_scores OWNER TO bmo;

--
-- TOC entry 177 (class 1259 OID 17595)
-- Dependencies: 6 178
-- Name: indicator_scores_id_seq; Type: SEQUENCE; Schema: public; Owner: bmo
--

CREATE SEQUENCE indicator_scores_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.indicator_scores_id_seq OWNER TO bmo;

--
-- TOC entry 2288 (class 0 OID 0)
-- Dependencies: 177
-- Name: indicator_scores_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: bmo
--

ALTER SEQUENCE indicator_scores_id_seq OWNED BY indicator_scores.id;


--
-- TOC entry 2289 (class 0 OID 0)
-- Dependencies: 177
-- Name: indicator_scores_id_seq; Type: SEQUENCE SET; Schema: public; Owner: bmo
--

SELECT pg_catalog.setval('indicator_scores_id_seq', 1275, true);


--
-- TOC entry 180 (class 1259 OID 17606)
-- Dependencies: 2226 6
-- Name: indicators; Type: TABLE; Schema: public; Owner: bmo; Tablespace: 
--

CREATE TABLE indicators (
    id integer NOT NULL,
    name character varying(255),
    acronym character varying(255),
    weight double precision,
    objective_id integer,
    operation_id integer,
    redfrom double precision,
    redto double precision,
    yellowfrom double precision,
    yellowto double precision,
    greenfrom double precision,
    greento double precision,
    progress double precision,
    baseline double precision,
    growth double precision,
    unit character varying(255),
    formula character varying(255),
    show boolean DEFAULT true,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.indicators OWNER TO bmo;

--
-- TOC entry 179 (class 1259 OID 17604)
-- Dependencies: 6 180
-- Name: indicators_id_seq; Type: SEQUENCE; Schema: public; Owner: bmo
--

CREATE SEQUENCE indicators_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.indicators_id_seq OWNER TO bmo;

--
-- TOC entry 2290 (class 0 OID 0)
-- Dependencies: 179
-- Name: indicators_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: bmo
--

ALTER SEQUENCE indicators_id_seq OWNED BY indicators.id;


--
-- TOC entry 2291 (class 0 OID 0)
-- Dependencies: 179
-- Name: indicators_id_seq; Type: SEQUENCE SET; Schema: public; Owner: bmo
--

SELECT pg_catalog.setval('indicators_id_seq', 1, false);


--
-- TOC entry 181 (class 1259 OID 17616)
-- Dependencies: 6
-- Name: indicators_objectives; Type: TABLE; Schema: public; Owner: bmo; Tablespace: 
--

CREATE TABLE indicators_objectives (
    indicator_id integer,
    objective_id integer
);


ALTER TABLE public.indicators_objectives OWNER TO bmo;

--
-- TOC entry 176 (class 1259 OID 17589)
-- Dependencies: 6
-- Name: objective_scores; Type: TABLE; Schema: public; Owner: bmo; Tablespace: 
--

CREATE TABLE objective_scores (
    id integer NOT NULL,
    objective_id integer,
    scoredate_id integer,
    score double precision,
    redfrom double precision,
    redto double precision,
    yellowfrom double precision,
    yellowto double precision,
    greenfrom double precision,
    greento double precision,
    progress double precision,
    baseline double precision,
    growth double precision,
    goal double precision,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.objective_scores OWNER TO bmo;

--
-- TOC entry 175 (class 1259 OID 17587)
-- Dependencies: 176 6
-- Name: objective_scores_id_seq; Type: SEQUENCE; Schema: public; Owner: bmo
--

CREATE SEQUENCE objective_scores_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.objective_scores_id_seq OWNER TO bmo;

--
-- TOC entry 2292 (class 0 OID 0)
-- Dependencies: 175
-- Name: objective_scores_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: bmo
--

ALTER SEQUENCE objective_scores_id_seq OWNED BY objective_scores.id;


--
-- TOC entry 2293 (class 0 OID 0)
-- Dependencies: 175
-- Name: objective_scores_id_seq; Type: SEQUENCE SET; Schema: public; Owner: bmo
--

SELECT pg_catalog.setval('objective_scores_id_seq', 500, true);


--
-- TOC entry 170 (class 1259 OID 17561)
-- Dependencies: 2218 6
-- Name: objectives; Type: TABLE; Schema: public; Owner: bmo; Tablespace: 
--

CREATE TABLE objectives (
    id integer NOT NULL,
    name character varying(255),
    acronym character varying(255),
    weight double precision,
    score double precision,
    perspective_id integer,
    redfrom double precision,
    redto double precision,
    yellowfrom double precision,
    yellowto double precision,
    greenfrom double precision,
    greento double precision,
    progress double precision,
    baseline double precision,
    growth double precision,
    measurement character varying(255),
    show boolean DEFAULT true,
    "greenButton" character varying(255),
    "yellowButton" character varying(255),
    "redButton" character varying(255),
    col integer,
    "row" integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.objectives OWNER TO bmo;

--
-- TOC entry 169 (class 1259 OID 17559)
-- Dependencies: 6 170
-- Name: objectives_id_seq; Type: SEQUENCE; Schema: public; Owner: bmo
--

CREATE SEQUENCE objectives_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.objectives_id_seq OWNER TO bmo;

--
-- TOC entry 2294 (class 0 OID 0)
-- Dependencies: 169
-- Name: objectives_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: bmo
--

ALTER SEQUENCE objectives_id_seq OWNED BY objectives.id;


--
-- TOC entry 2295 (class 0 OID 0)
-- Dependencies: 169
-- Name: objectives_id_seq; Type: SEQUENCE SET; Schema: public; Owner: bmo
--

SELECT pg_catalog.setval('objectives_id_seq', 20, true);


--
-- TOC entry 188 (class 1259 OID 17644)
-- Dependencies: 6
-- Name: operations; Type: TABLE; Schema: public; Owner: bmo; Tablespace: 
--

CREATE TABLE operations (
    id integer NOT NULL,
    name character varying(255),
    operator character varying(1),
    firstoperand_id integer,
    secondoperand_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.operations OWNER TO bmo;

--
-- TOC entry 187 (class 1259 OID 17642)
-- Dependencies: 6 188
-- Name: operations_id_seq; Type: SEQUENCE; Schema: public; Owner: bmo
--

CREATE SEQUENCE operations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.operations_id_seq OWNER TO bmo;

--
-- TOC entry 2296 (class 0 OID 0)
-- Dependencies: 187
-- Name: operations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: bmo
--

ALTER SEQUENCE operations_id_seq OWNED BY operations.id;


--
-- TOC entry 2297 (class 0 OID 0)
-- Dependencies: 187
-- Name: operations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: bmo
--

SELECT pg_catalog.setval('operations_id_seq', 1, false);


--
-- TOC entry 174 (class 1259 OID 17581)
-- Dependencies: 6
-- Name: perspective_scores; Type: TABLE; Schema: public; Owner: bmo; Tablespace: 
--

CREATE TABLE perspective_scores (
    id integer NOT NULL,
    perspective_id integer,
    scoredate_id integer,
    score double precision,
    redfrom double precision,
    redto double precision,
    yellowfrom double precision,
    yellowto double precision,
    greenfrom double precision,
    greento double precision,
    goal double precision,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.perspective_scores OWNER TO bmo;

--
-- TOC entry 173 (class 1259 OID 17579)
-- Dependencies: 174 6
-- Name: perspective_scores_id_seq; Type: SEQUENCE; Schema: public; Owner: bmo
--

CREATE SEQUENCE perspective_scores_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.perspective_scores_id_seq OWNER TO bmo;

--
-- TOC entry 2298 (class 0 OID 0)
-- Dependencies: 173
-- Name: perspective_scores_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: bmo
--

ALTER SEQUENCE perspective_scores_id_seq OWNED BY perspective_scores.id;


--
-- TOC entry 2299 (class 0 OID 0)
-- Dependencies: 173
-- Name: perspective_scores_id_seq; Type: SEQUENCE SET; Schema: public; Owner: bmo
--

SELECT pg_catalog.setval('perspective_scores_id_seq', 100, true);


--
-- TOC entry 168 (class 1259 OID 17550)
-- Dependencies: 6
-- Name: perspectives; Type: TABLE; Schema: public; Owner: bmo; Tablespace: 
--

CREATE TABLE perspectives (
    id integer NOT NULL,
    name character varying(255),
    weight double precision,
    redfrom double precision,
    redto double precision,
    yellowfrom double precision,
    yellowto double precision,
    greenfrom double precision,
    greento double precision,
    title_image character varying(255),
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.perspectives OWNER TO bmo;

--
-- TOC entry 167 (class 1259 OID 17548)
-- Dependencies: 168 6
-- Name: perspectives_id_seq; Type: SEQUENCE; Schema: public; Owner: bmo
--

CREATE SEQUENCE perspectives_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.perspectives_id_seq OWNER TO bmo;

--
-- TOC entry 2300 (class 0 OID 0)
-- Dependencies: 167
-- Name: perspectives_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: bmo
--

ALTER SEQUENCE perspectives_id_seq OWNED BY perspectives.id;


--
-- TOC entry 2301 (class 0 OID 0)
-- Dependencies: 167
-- Name: perspectives_id_seq; Type: SEQUENCE SET; Schema: public; Owner: bmo
--

SELECT pg_catalog.setval('perspectives_id_seq', 4, true);


--
-- TOC entry 184 (class 1259 OID 17624)
-- Dependencies: 2227 6
-- Name: raw_data; Type: TABLE; Schema: public; Owner: bmo; Tablespace: 
--

CREATE TABLE raw_data (
    id integer NOT NULL,
    name character varying(255),
    hint character varying(255),
    operation_id integer,
    default_value double precision DEFAULT 1,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.raw_data OWNER TO bmo;

--
-- TOC entry 183 (class 1259 OID 17622)
-- Dependencies: 184 6
-- Name: raw_data_id_seq; Type: SEQUENCE; Schema: public; Owner: bmo
--

CREATE SEQUENCE raw_data_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.raw_data_id_seq OWNER TO bmo;

--
-- TOC entry 2302 (class 0 OID 0)
-- Dependencies: 183
-- Name: raw_data_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: bmo
--

ALTER SEQUENCE raw_data_id_seq OWNED BY raw_data.id;


--
-- TOC entry 2303 (class 0 OID 0)
-- Dependencies: 183
-- Name: raw_data_id_seq; Type: SEQUENCE SET; Schema: public; Owner: bmo
--

SELECT pg_catalog.setval('raw_data_id_seq', 1, false);


--
-- TOC entry 186 (class 1259 OID 17636)
-- Dependencies: 6
-- Name: raw_data_scores; Type: TABLE; Schema: public; Owner: bmo; Tablespace: 
--

CREATE TABLE raw_data_scores (
    id integer NOT NULL,
    scoredate_id integer,
    value double precision,
    rawdata_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.raw_data_scores OWNER TO bmo;

--
-- TOC entry 185 (class 1259 OID 17634)
-- Dependencies: 186 6
-- Name: raw_data_scores_id_seq; Type: SEQUENCE; Schema: public; Owner: bmo
--

CREATE SEQUENCE raw_data_scores_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.raw_data_scores_id_seq OWNER TO bmo;

--
-- TOC entry 2304 (class 0 OID 0)
-- Dependencies: 185
-- Name: raw_data_scores_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: bmo
--

ALTER SEQUENCE raw_data_scores_id_seq OWNED BY raw_data_scores.id;


--
-- TOC entry 2305 (class 0 OID 0)
-- Dependencies: 185
-- Name: raw_data_scores_id_seq; Type: SEQUENCE SET; Schema: public; Owner: bmo
--

SELECT pg_catalog.setval('raw_data_scores_id_seq', 1, false);


--
-- TOC entry 165 (class 1259 OID 17533)
-- Dependencies: 6
-- Name: roles; Type: TABLE; Schema: public; Owner: bmo; Tablespace: 
--

CREATE TABLE roles (
    id integer NOT NULL,
    name character varying(255),
    resource_id integer,
    resource_type character varying(255),
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.roles OWNER TO bmo;

--
-- TOC entry 164 (class 1259 OID 17531)
-- Dependencies: 6 165
-- Name: roles_id_seq; Type: SEQUENCE; Schema: public; Owner: bmo
--

CREATE SEQUENCE roles_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.roles_id_seq OWNER TO bmo;

--
-- TOC entry 2306 (class 0 OID 0)
-- Dependencies: 164
-- Name: roles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: bmo
--

ALTER SEQUENCE roles_id_seq OWNED BY roles.id;


--
-- TOC entry 2307 (class 0 OID 0)
-- Dependencies: 164
-- Name: roles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: bmo
--

SELECT pg_catalog.setval('roles_id_seq', 1, false);


--
-- TOC entry 161 (class 1259 OID 17511)
-- Dependencies: 6
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: bmo; Tablespace: 
--

CREATE TABLE schema_migrations (
    version character varying(255) NOT NULL
);


ALTER TABLE public.schema_migrations OWNER TO bmo;

--
-- TOC entry 172 (class 1259 OID 17573)
-- Dependencies: 6
-- Name: score_dates; Type: TABLE; Schema: public; Owner: bmo; Tablespace: 
--

CREATE TABLE score_dates (
    id integer NOT NULL,
    month integer,
    year integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.score_dates OWNER TO bmo;

--
-- TOC entry 171 (class 1259 OID 17571)
-- Dependencies: 6 172
-- Name: score_dates_id_seq; Type: SEQUENCE; Schema: public; Owner: bmo
--

CREATE SEQUENCE score_dates_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.score_dates_id_seq OWNER TO bmo;

--
-- TOC entry 2308 (class 0 OID 0)
-- Dependencies: 171
-- Name: score_dates_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: bmo
--

ALTER SEQUENCE score_dates_id_seq OWNED BY score_dates.id;


--
-- TOC entry 2309 (class 0 OID 0)
-- Dependencies: 171
-- Name: score_dates_id_seq; Type: SEQUENCE SET; Schema: public; Owner: bmo
--

SELECT pg_catalog.setval('score_dates_id_seq', 25, true);


--
-- TOC entry 163 (class 1259 OID 17517)
-- Dependencies: 2212 2213 2214 6
-- Name: users; Type: TABLE; Schema: public; Owner: bmo; Tablespace: 
--

CREATE TABLE users (
    id integer NOT NULL,
    email character varying(255) DEFAULT ''::character varying NOT NULL,
    encrypted_password character varying(255) DEFAULT ''::character varying NOT NULL,
    reset_password_token character varying(255),
    reset_password_sent_at timestamp without time zone,
    remember_created_at timestamp without time zone,
    sign_in_count integer DEFAULT 0,
    current_sign_in_at timestamp without time zone,
    last_sign_in_at timestamp without time zone,
    current_sign_in_ip character varying(255),
    last_sign_in_ip character varying(255),
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    name character varying(255)
);


ALTER TABLE public.users OWNER TO bmo;

--
-- TOC entry 162 (class 1259 OID 17515)
-- Dependencies: 6 163
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: bmo
--

CREATE SEQUENCE users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO bmo;

--
-- TOC entry 2310 (class 0 OID 0)
-- Dependencies: 162
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: bmo
--

ALTER SEQUENCE users_id_seq OWNED BY users.id;


--
-- TOC entry 2311 (class 0 OID 0)
-- Dependencies: 162
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: bmo
--

SELECT pg_catalog.setval('users_id_seq', 2, true);


--
-- TOC entry 166 (class 1259 OID 17542)
-- Dependencies: 6
-- Name: users_roles; Type: TABLE; Schema: public; Owner: bmo; Tablespace: 
--

CREATE TABLE users_roles (
    user_id integer,
    role_id integer
);


ALTER TABLE public.users_roles OWNER TO bmo;

--
-- TOC entry 190 (class 1259 OID 17652)
-- Dependencies: 6
-- Name: vectors; Type: TABLE; Schema: public; Owner: bmo; Tablespace: 
--

CREATE TABLE vectors (
    id integer NOT NULL,
    name character varying(255),
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.vectors OWNER TO bmo;

--
-- TOC entry 189 (class 1259 OID 17650)
-- Dependencies: 6 190
-- Name: vectors_id_seq; Type: SEQUENCE; Schema: public; Owner: bmo
--

CREATE SEQUENCE vectors_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.vectors_id_seq OWNER TO bmo;

--
-- TOC entry 2312 (class 0 OID 0)
-- Dependencies: 189
-- Name: vectors_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: bmo
--

ALTER SEQUENCE vectors_id_seq OWNED BY vectors.id;


--
-- TOC entry 2313 (class 0 OID 0)
-- Dependencies: 189
-- Name: vectors_id_seq; Type: SEQUENCE SET; Schema: public; Owner: bmo
--

SELECT pg_catalog.setval('vectors_id_seq', 4, true);


--
-- TOC entry 191 (class 1259 OID 17658)
-- Dependencies: 6
-- Name: vectors_objectives; Type: TABLE; Schema: public; Owner: bmo; Tablespace: 
--

CREATE TABLE vectors_objectives (
    vector_id integer,
    objective_id integer
);


ALTER TABLE public.vectors_objectives OWNER TO bmo;

--
-- TOC entry 2224 (class 2604 OID 17662)
-- Dependencies: 178 177 178
-- Name: id; Type: DEFAULT; Schema: public; Owner: bmo
--

ALTER TABLE ONLY indicator_scores ALTER COLUMN id SET DEFAULT nextval('indicator_scores_id_seq'::regclass);


--
-- TOC entry 2225 (class 2604 OID 17609)
-- Dependencies: 179 180 180
-- Name: id; Type: DEFAULT; Schema: public; Owner: bmo
--

ALTER TABLE ONLY indicators ALTER COLUMN id SET DEFAULT nextval('indicators_id_seq'::regclass);


--
-- TOC entry 2222 (class 2604 OID 17663)
-- Dependencies: 176 175 176
-- Name: id; Type: DEFAULT; Schema: public; Owner: bmo
--

ALTER TABLE ONLY objective_scores ALTER COLUMN id SET DEFAULT nextval('objective_scores_id_seq'::regclass);


--
-- TOC entry 2219 (class 2604 OID 17664)
-- Dependencies: 169 170 170
-- Name: id; Type: DEFAULT; Schema: public; Owner: bmo
--

ALTER TABLE ONLY objectives ALTER COLUMN id SET DEFAULT nextval('objectives_id_seq'::regclass);


--
-- TOC entry 2230 (class 2604 OID 17665)
-- Dependencies: 188 187 188
-- Name: id; Type: DEFAULT; Schema: public; Owner: bmo
--

ALTER TABLE ONLY operations ALTER COLUMN id SET DEFAULT nextval('operations_id_seq'::regclass);


--
-- TOC entry 2221 (class 2604 OID 17666)
-- Dependencies: 174 173 174
-- Name: id; Type: DEFAULT; Schema: public; Owner: bmo
--

ALTER TABLE ONLY perspective_scores ALTER COLUMN id SET DEFAULT nextval('perspective_scores_id_seq'::regclass);


--
-- TOC entry 2217 (class 2604 OID 17667)
-- Dependencies: 168 167 168
-- Name: id; Type: DEFAULT; Schema: public; Owner: bmo
--

ALTER TABLE ONLY perspectives ALTER COLUMN id SET DEFAULT nextval('perspectives_id_seq'::regclass);


--
-- TOC entry 2228 (class 2604 OID 17668)
-- Dependencies: 184 183 184
-- Name: id; Type: DEFAULT; Schema: public; Owner: bmo
--

ALTER TABLE ONLY raw_data ALTER COLUMN id SET DEFAULT nextval('raw_data_id_seq'::regclass);


--
-- TOC entry 2229 (class 2604 OID 17669)
-- Dependencies: 186 185 186
-- Name: id; Type: DEFAULT; Schema: public; Owner: bmo
--

ALTER TABLE ONLY raw_data_scores ALTER COLUMN id SET DEFAULT nextval('raw_data_scores_id_seq'::regclass);


--
-- TOC entry 2216 (class 2604 OID 17670)
-- Dependencies: 165 164 165
-- Name: id; Type: DEFAULT; Schema: public; Owner: bmo
--

ALTER TABLE ONLY roles ALTER COLUMN id SET DEFAULT nextval('roles_id_seq'::regclass);


--
-- TOC entry 2220 (class 2604 OID 17671)
-- Dependencies: 172 171 172
-- Name: id; Type: DEFAULT; Schema: public; Owner: bmo
--

ALTER TABLE ONLY score_dates ALTER COLUMN id SET DEFAULT nextval('score_dates_id_seq'::regclass);


--
-- TOC entry 2215 (class 2604 OID 17672)
-- Dependencies: 163 162 163
-- Name: id; Type: DEFAULT; Schema: public; Owner: bmo
--

ALTER TABLE ONLY users ALTER COLUMN id SET DEFAULT nextval('users_id_seq'::regclass);


--
-- TOC entry 2231 (class 2604 OID 17673)
-- Dependencies: 189 190 190
-- Name: id; Type: DEFAULT; Schema: public; Owner: bmo
--

ALTER TABLE ONLY vectors ALTER COLUMN id SET DEFAULT nextval('vectors_id_seq'::regclass);


--
-- TOC entry 2276 (class 0 OID 17619)
-- Dependencies: 182
-- Data for Name: indicator_father_son; Type: TABLE DATA; Schema: public; Owner: bmo
--

INSERT INTO indicator_father_son (indicatorfather_id, indicatorson_id) VALUES (21, 40);
INSERT INTO indicator_father_son (indicatorfather_id, indicatorson_id) VALUES (40, 44);
INSERT INTO indicator_father_son (indicatorfather_id, indicatorson_id) VALUES (40, 45);
INSERT INTO indicator_father_son (indicatorfather_id, indicatorson_id) VALUES (41, 46);
INSERT INTO indicator_father_son (indicatorfather_id, indicatorson_id) VALUES (41, 47);
INSERT INTO indicator_father_son (indicatorfather_id, indicatorson_id) VALUES (42, 48);
INSERT INTO indicator_father_son (indicatorfather_id, indicatorson_id) VALUES (42, 49);
INSERT INTO indicator_father_son (indicatorfather_id, indicatorson_id) VALUES (43, 50);
INSERT INTO indicator_father_son (indicatorfather_id, indicatorson_id) VALUES (43, 51);
INSERT INTO indicator_father_son (indicatorfather_id, indicatorson_id) VALUES (1, 40);
INSERT INTO indicator_father_son (indicatorfather_id, indicatorson_id) VALUES (1, 41);
INSERT INTO indicator_father_son (indicatorfather_id, indicatorson_id) VALUES (1, 42);
INSERT INTO indicator_father_son (indicatorfather_id, indicatorson_id) VALUES (1, 43);
INSERT INTO indicator_father_son (indicatorfather_id, indicatorson_id) VALUES (2, 40);
INSERT INTO indicator_father_son (indicatorfather_id, indicatorson_id) VALUES (2, 41);
INSERT INTO indicator_father_son (indicatorfather_id, indicatorson_id) VALUES (2, 42);
INSERT INTO indicator_father_son (indicatorfather_id, indicatorson_id) VALUES (2, 43);
INSERT INTO indicator_father_son (indicatorfather_id, indicatorson_id) VALUES (3, 40);
INSERT INTO indicator_father_son (indicatorfather_id, indicatorson_id) VALUES (3, 41);
INSERT INTO indicator_father_son (indicatorfather_id, indicatorson_id) VALUES (3, 42);
INSERT INTO indicator_father_son (indicatorfather_id, indicatorson_id) VALUES (3, 43);
INSERT INTO indicator_father_son (indicatorfather_id, indicatorson_id) VALUES (4, 40);
INSERT INTO indicator_father_son (indicatorfather_id, indicatorson_id) VALUES (4, 41);
INSERT INTO indicator_father_son (indicatorfather_id, indicatorson_id) VALUES (4, 42);
INSERT INTO indicator_father_son (indicatorfather_id, indicatorson_id) VALUES (4, 43);
INSERT INTO indicator_father_son (indicatorfather_id, indicatorson_id) VALUES (5, 40);
INSERT INTO indicator_father_son (indicatorfather_id, indicatorson_id) VALUES (5, 41);
INSERT INTO indicator_father_son (indicatorfather_id, indicatorson_id) VALUES (5, 42);
INSERT INTO indicator_father_son (indicatorfather_id, indicatorson_id) VALUES (5, 43);
INSERT INTO indicator_father_son (indicatorfather_id, indicatorson_id) VALUES (6, 40);
INSERT INTO indicator_father_son (indicatorfather_id, indicatorson_id) VALUES (6, 41);
INSERT INTO indicator_father_son (indicatorfather_id, indicatorson_id) VALUES (6, 42);
INSERT INTO indicator_father_son (indicatorfather_id, indicatorson_id) VALUES (6, 43);
INSERT INTO indicator_father_son (indicatorfather_id, indicatorson_id) VALUES (7, 40);
INSERT INTO indicator_father_son (indicatorfather_id, indicatorson_id) VALUES (7, 41);
INSERT INTO indicator_father_son (indicatorfather_id, indicatorson_id) VALUES (7, 42);
INSERT INTO indicator_father_son (indicatorfather_id, indicatorson_id) VALUES (7, 43);
INSERT INTO indicator_father_son (indicatorfather_id, indicatorson_id) VALUES (9, 40);
INSERT INTO indicator_father_son (indicatorfather_id, indicatorson_id) VALUES (9, 41);
INSERT INTO indicator_father_son (indicatorfather_id, indicatorson_id) VALUES (9, 42);
INSERT INTO indicator_father_son (indicatorfather_id, indicatorson_id) VALUES (9, 43);
INSERT INTO indicator_father_son (indicatorfather_id, indicatorson_id) VALUES (10, 40);
INSERT INTO indicator_father_son (indicatorfather_id, indicatorson_id) VALUES (10, 41);
INSERT INTO indicator_father_son (indicatorfather_id, indicatorson_id) VALUES (10, 42);
INSERT INTO indicator_father_son (indicatorfather_id, indicatorson_id) VALUES (10, 43);
INSERT INTO indicator_father_son (indicatorfather_id, indicatorson_id) VALUES (11, 40);
INSERT INTO indicator_father_son (indicatorfather_id, indicatorson_id) VALUES (11, 41);
INSERT INTO indicator_father_son (indicatorfather_id, indicatorson_id) VALUES (11, 42);
INSERT INTO indicator_father_son (indicatorfather_id, indicatorson_id) VALUES (11, 43);
INSERT INTO indicator_father_son (indicatorfather_id, indicatorson_id) VALUES (12, 40);
INSERT INTO indicator_father_son (indicatorfather_id, indicatorson_id) VALUES (12, 41);
INSERT INTO indicator_father_son (indicatorfather_id, indicatorson_id) VALUES (12, 42);
INSERT INTO indicator_father_son (indicatorfather_id, indicatorson_id) VALUES (12, 43);
INSERT INTO indicator_father_son (indicatorfather_id, indicatorson_id) VALUES (13, 40);
INSERT INTO indicator_father_son (indicatorfather_id, indicatorson_id) VALUES (13, 41);
INSERT INTO indicator_father_son (indicatorfather_id, indicatorson_id) VALUES (13, 42);
INSERT INTO indicator_father_son (indicatorfather_id, indicatorson_id) VALUES (13, 43);
INSERT INTO indicator_father_son (indicatorfather_id, indicatorson_id) VALUES (14, 40);
INSERT INTO indicator_father_son (indicatorfather_id, indicatorson_id) VALUES (14, 41);
INSERT INTO indicator_father_son (indicatorfather_id, indicatorson_id) VALUES (14, 42);
INSERT INTO indicator_father_son (indicatorfather_id, indicatorson_id) VALUES (14, 43);
INSERT INTO indicator_father_son (indicatorfather_id, indicatorson_id) VALUES (15, 40);
INSERT INTO indicator_father_son (indicatorfather_id, indicatorson_id) VALUES (15, 41);
INSERT INTO indicator_father_son (indicatorfather_id, indicatorson_id) VALUES (15, 42);
INSERT INTO indicator_father_son (indicatorfather_id, indicatorson_id) VALUES (15, 43);
INSERT INTO indicator_father_son (indicatorfather_id, indicatorson_id) VALUES (16, 40);
INSERT INTO indicator_father_son (indicatorfather_id, indicatorson_id) VALUES (16, 41);
INSERT INTO indicator_father_son (indicatorfather_id, indicatorson_id) VALUES (16, 42);
INSERT INTO indicator_father_son (indicatorfather_id, indicatorson_id) VALUES (16, 43);
INSERT INTO indicator_father_son (indicatorfather_id, indicatorson_id) VALUES (17, 40);
INSERT INTO indicator_father_son (indicatorfather_id, indicatorson_id) VALUES (17, 41);
INSERT INTO indicator_father_son (indicatorfather_id, indicatorson_id) VALUES (17, 42);
INSERT INTO indicator_father_son (indicatorfather_id, indicatorson_id) VALUES (17, 43);
INSERT INTO indicator_father_son (indicatorfather_id, indicatorson_id) VALUES (18, 40);
INSERT INTO indicator_father_son (indicatorfather_id, indicatorson_id) VALUES (18, 41);
INSERT INTO indicator_father_son (indicatorfather_id, indicatorson_id) VALUES (18, 42);
INSERT INTO indicator_father_son (indicatorfather_id, indicatorson_id) VALUES (18, 43);
INSERT INTO indicator_father_son (indicatorfather_id, indicatorson_id) VALUES (19, 40);
INSERT INTO indicator_father_son (indicatorfather_id, indicatorson_id) VALUES (19, 41);
INSERT INTO indicator_father_son (indicatorfather_id, indicatorson_id) VALUES (19, 42);
INSERT INTO indicator_father_son (indicatorfather_id, indicatorson_id) VALUES (19, 43);
INSERT INTO indicator_father_son (indicatorfather_id, indicatorson_id) VALUES (20, 40);
INSERT INTO indicator_father_son (indicatorfather_id, indicatorson_id) VALUES (20, 41);
INSERT INTO indicator_father_son (indicatorfather_id, indicatorson_id) VALUES (20, 42);
INSERT INTO indicator_father_son (indicatorfather_id, indicatorson_id) VALUES (20, 43);
INSERT INTO indicator_father_son (indicatorfather_id, indicatorson_id) VALUES (21, 40);
INSERT INTO indicator_father_son (indicatorfather_id, indicatorson_id) VALUES (21, 41);
INSERT INTO indicator_father_son (indicatorfather_id, indicatorson_id) VALUES (21, 42);
INSERT INTO indicator_father_son (indicatorfather_id, indicatorson_id) VALUES (21, 43);
INSERT INTO indicator_father_son (indicatorfather_id, indicatorson_id) VALUES (22, 40);
INSERT INTO indicator_father_son (indicatorfather_id, indicatorson_id) VALUES (22, 41);
INSERT INTO indicator_father_son (indicatorfather_id, indicatorson_id) VALUES (22, 42);
INSERT INTO indicator_father_son (indicatorfather_id, indicatorson_id) VALUES (22, 43);
INSERT INTO indicator_father_son (indicatorfather_id, indicatorson_id) VALUES (23, 40);
INSERT INTO indicator_father_son (indicatorfather_id, indicatorson_id) VALUES (23, 41);
INSERT INTO indicator_father_son (indicatorfather_id, indicatorson_id) VALUES (23, 42);
INSERT INTO indicator_father_son (indicatorfather_id, indicatorson_id) VALUES (23, 43);
INSERT INTO indicator_father_son (indicatorfather_id, indicatorson_id) VALUES (24, 40);
INSERT INTO indicator_father_son (indicatorfather_id, indicatorson_id) VALUES (24, 41);
INSERT INTO indicator_father_son (indicatorfather_id, indicatorson_id) VALUES (24, 42);
INSERT INTO indicator_father_son (indicatorfather_id, indicatorson_id) VALUES (24, 43);
INSERT INTO indicator_father_son (indicatorfather_id, indicatorson_id) VALUES (25, 40);
INSERT INTO indicator_father_son (indicatorfather_id, indicatorson_id) VALUES (25, 41);
INSERT INTO indicator_father_son (indicatorfather_id, indicatorson_id) VALUES (25, 42);
INSERT INTO indicator_father_son (indicatorfather_id, indicatorson_id) VALUES (25, 43);
INSERT INTO indicator_father_son (indicatorfather_id, indicatorson_id) VALUES (26, 40);
INSERT INTO indicator_father_son (indicatorfather_id, indicatorson_id) VALUES (26, 41);
INSERT INTO indicator_father_son (indicatorfather_id, indicatorson_id) VALUES (26, 42);
INSERT INTO indicator_father_son (indicatorfather_id, indicatorson_id) VALUES (26, 43);
INSERT INTO indicator_father_son (indicatorfather_id, indicatorson_id) VALUES (27, 40);
INSERT INTO indicator_father_son (indicatorfather_id, indicatorson_id) VALUES (27, 41);
INSERT INTO indicator_father_son (indicatorfather_id, indicatorson_id) VALUES (27, 42);
INSERT INTO indicator_father_son (indicatorfather_id, indicatorson_id) VALUES (27, 43);
INSERT INTO indicator_father_son (indicatorfather_id, indicatorson_id) VALUES (28, 40);
INSERT INTO indicator_father_son (indicatorfather_id, indicatorson_id) VALUES (28, 41);
INSERT INTO indicator_father_son (indicatorfather_id, indicatorson_id) VALUES (28, 42);
INSERT INTO indicator_father_son (indicatorfather_id, indicatorson_id) VALUES (28, 43);
INSERT INTO indicator_father_son (indicatorfather_id, indicatorson_id) VALUES (29, 40);
INSERT INTO indicator_father_son (indicatorfather_id, indicatorson_id) VALUES (29, 41);
INSERT INTO indicator_father_son (indicatorfather_id, indicatorson_id) VALUES (29, 42);
INSERT INTO indicator_father_son (indicatorfather_id, indicatorson_id) VALUES (29, 43);
INSERT INTO indicator_father_son (indicatorfather_id, indicatorson_id) VALUES (30, 40);
INSERT INTO indicator_father_son (indicatorfather_id, indicatorson_id) VALUES (30, 41);
INSERT INTO indicator_father_son (indicatorfather_id, indicatorson_id) VALUES (30, 42);
INSERT INTO indicator_father_son (indicatorfather_id, indicatorson_id) VALUES (30, 43);
INSERT INTO indicator_father_son (indicatorfather_id, indicatorson_id) VALUES (31, 40);
INSERT INTO indicator_father_son (indicatorfather_id, indicatorson_id) VALUES (31, 41);
INSERT INTO indicator_father_son (indicatorfather_id, indicatorson_id) VALUES (31, 42);
INSERT INTO indicator_father_son (indicatorfather_id, indicatorson_id) VALUES (31, 43);
INSERT INTO indicator_father_son (indicatorfather_id, indicatorson_id) VALUES (32, 40);
INSERT INTO indicator_father_son (indicatorfather_id, indicatorson_id) VALUES (32, 41);
INSERT INTO indicator_father_son (indicatorfather_id, indicatorson_id) VALUES (32, 42);
INSERT INTO indicator_father_son (indicatorfather_id, indicatorson_id) VALUES (32, 43);
INSERT INTO indicator_father_son (indicatorfather_id, indicatorson_id) VALUES (33, 40);
INSERT INTO indicator_father_son (indicatorfather_id, indicatorson_id) VALUES (33, 41);
INSERT INTO indicator_father_son (indicatorfather_id, indicatorson_id) VALUES (33, 42);
INSERT INTO indicator_father_son (indicatorfather_id, indicatorson_id) VALUES (33, 43);
INSERT INTO indicator_father_son (indicatorfather_id, indicatorson_id) VALUES (34, 40);
INSERT INTO indicator_father_son (indicatorfather_id, indicatorson_id) VALUES (34, 41);
INSERT INTO indicator_father_son (indicatorfather_id, indicatorson_id) VALUES (34, 42);
INSERT INTO indicator_father_son (indicatorfather_id, indicatorson_id) VALUES (34, 43);
INSERT INTO indicator_father_son (indicatorfather_id, indicatorson_id) VALUES (35, 40);
INSERT INTO indicator_father_son (indicatorfather_id, indicatorson_id) VALUES (35, 41);
INSERT INTO indicator_father_son (indicatorfather_id, indicatorson_id) VALUES (35, 42);
INSERT INTO indicator_father_son (indicatorfather_id, indicatorson_id) VALUES (35, 43);
INSERT INTO indicator_father_son (indicatorfather_id, indicatorson_id) VALUES (36, 40);
INSERT INTO indicator_father_son (indicatorfather_id, indicatorson_id) VALUES (36, 41);
INSERT INTO indicator_father_son (indicatorfather_id, indicatorson_id) VALUES (36, 42);
INSERT INTO indicator_father_son (indicatorfather_id, indicatorson_id) VALUES (36, 43);
INSERT INTO indicator_father_son (indicatorfather_id, indicatorson_id) VALUES (37, 40);
INSERT INTO indicator_father_son (indicatorfather_id, indicatorson_id) VALUES (37, 41);
INSERT INTO indicator_father_son (indicatorfather_id, indicatorson_id) VALUES (37, 42);
INSERT INTO indicator_father_son (indicatorfather_id, indicatorson_id) VALUES (37, 43);
INSERT INTO indicator_father_son (indicatorfather_id, indicatorson_id) VALUES (38, 40);
INSERT INTO indicator_father_son (indicatorfather_id, indicatorson_id) VALUES (38, 41);
INSERT INTO indicator_father_son (indicatorfather_id, indicatorson_id) VALUES (38, 42);
INSERT INTO indicator_father_son (indicatorfather_id, indicatorson_id) VALUES (38, 43);
INSERT INTO indicator_father_son (indicatorfather_id, indicatorson_id) VALUES (39, 40);
INSERT INTO indicator_father_son (indicatorfather_id, indicatorson_id) VALUES (39, 41);
INSERT INTO indicator_father_son (indicatorfather_id, indicatorson_id) VALUES (39, 42);
INSERT INTO indicator_father_son (indicatorfather_id, indicatorson_id) VALUES (39, 43);
INSERT INTO indicator_father_son (indicatorfather_id, indicatorson_id) VALUES (8, 40);
INSERT INTO indicator_father_son (indicatorfather_id, indicatorson_id) VALUES (8, 41);
INSERT INTO indicator_father_son (indicatorfather_id, indicatorson_id) VALUES (8, 42);
INSERT INTO indicator_father_son (indicatorfather_id, indicatorson_id) VALUES (8, 43);


--
-- TOC entry 2273 (class 0 OID 17597)
-- Dependencies: 178
-- Data for Name: indicator_scores; Type: TABLE DATA; Schema: public; Owner: bmo
--

INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (5, 1, 5, 62, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:25.627169', '2012-10-16 21:32:45.082627');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (14, 1, 14, 71, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:25.737305', '2012-10-16 21:32:45.085684');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (16, 1, 16, 73, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:25.760152', '2012-10-16 21:32:45.089026');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (17, 1, 17, 74, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:25.772817', '2012-10-16 21:32:45.09238');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (19, 1, 19, 76, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:25.791644', '2012-10-16 21:32:45.09514');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (21, 1, 21, 78, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:25.815661', '2012-10-16 21:32:45.097802');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (23, 1, 23, 80, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:25.838127', '2012-10-16 21:32:45.100299');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (25, 1, 25, 82, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:25.861707', '2012-10-16 21:32:45.103014');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (6, 1, 6, 63, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:25.637709', '2012-10-16 21:32:45.200225');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (12, 1, 12, 69, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:25.704893', '2012-10-16 21:32:45.032074');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (28, 2, 3, 62, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:25.928802', '2012-10-15 17:42:23.625107');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (30, 2, 5, 64, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:25.971643', '2012-10-15 17:42:23.627669');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (32, 2, 7, 66, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:26.003824', '2012-10-15 17:42:23.631201');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (34, 2, 9, 68, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:26.026669', '2012-10-15 17:42:23.634777');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (36, 2, 11, 70, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:26.048719', '2012-10-15 17:42:23.638262');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (38, 2, 13, 72, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:26.071421', '2012-10-15 17:42:23.641477');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (39, 2, 14, 73, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:26.086999', '2012-10-15 17:42:23.643984');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (41, 2, 16, 75, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:26.115854', '2012-10-15 17:42:23.646579');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (43, 2, 18, 77, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:26.138291', '2012-10-15 17:42:23.649059');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (45, 2, 20, 79, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:26.158393', '2012-10-15 17:42:23.651675');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (49, 2, 24, 83, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:26.204085', '2012-10-15 17:42:23.654276');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (52, 3, 2, 63, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:26.237753', '2012-10-15 17:42:23.661117');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (54, 3, 4, 65, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:26.261714', '2012-10-15 17:42:23.663833');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (56, 3, 6, 67, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:26.279994', '2012-10-15 17:42:23.666798');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (58, 3, 8, 69, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:26.30478', '2012-10-15 17:42:23.669345');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (60, 3, 10, 71, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:26.325128', '2012-10-15 17:42:23.671804');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (61, 3, 11, 72, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:26.338132', '2012-10-15 17:42:23.675464');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (63, 3, 13, 74, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:26.3602', '2012-10-15 17:42:23.679048');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (65, 3, 15, 76, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:26.38319', '2012-10-15 17:42:23.681925');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (67, 3, 17, 78, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:26.405914', '2012-10-15 17:42:23.684669');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (69, 3, 19, 80, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:26.426625', '2012-10-15 17:42:23.687304');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (74, 3, 24, 85, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:26.482996', '2012-10-15 17:42:23.693666');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (76, 4, 1, 72, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:26.504771', '2012-10-15 17:42:23.696764');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (78, 4, 3, 74, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:26.524969', '2012-10-15 17:42:23.699377');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (80, 4, 5, 76, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:26.54939', '2012-10-15 17:42:23.701913');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (82, 4, 7, 78, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:26.570997', '2012-10-15 17:42:23.704422');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (83, 4, 8, 79, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:26.5825', '2012-10-15 17:42:23.706975');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (85, 4, 10, 81, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:26.602848', '2012-10-15 17:42:23.709503');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (87, 4, 12, 83, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:26.627297', '2012-10-15 17:42:23.712144');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (89, 4, 14, 85, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:26.649181', '2012-10-15 17:42:23.71464');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (91, 4, 16, 87, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:26.669062', '2012-10-15 17:42:23.717426');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (93, 4, 18, 89, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:26.693769', '2012-10-15 17:42:23.720504');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (96, 4, 21, 92, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:26.726077', '2012-10-15 17:42:23.725505');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (98, 4, 23, 94, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:26.760528', '2012-10-15 17:42:23.728364');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (100, 4, 25, 96, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:26.782692', '2012-10-15 17:42:23.731185');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (102, 5, 2, 64, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:26.805202', '2012-10-15 17:42:23.733598');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (104, 5, 4, 66, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:26.828233', '2012-10-15 17:42:23.735919');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (105, 5, 5, 67, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:26.838168', '2012-10-15 17:42:23.738854');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (107, 5, 7, 69, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:26.861874', '2012-10-15 17:42:23.742392');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (8, 1, 8, 65, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:25.662033', '2012-10-16 21:32:45.203787');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (10, 1, 10, 67, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:25.680479', '2012-10-16 21:32:45.207484');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (117, 5, 17, 79, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:26.971583', '2012-10-15 17:42:23.753517');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (121, 5, 21, 83, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:27.027205', '2012-10-15 17:42:23.783785');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (123, 5, 23, 85, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:27.049394', '2012-10-15 17:42:23.786879');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (72, 3, 22, 83, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:26.461409', '2012-10-15 17:42:23.810339');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (126, 6, 1, 71, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:27.080061', '2012-10-15 17:42:23.817834');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (128, 6, 3, 73, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:27.105702', '2012-10-15 17:42:23.821107');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (130, 6, 5, 75, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:27.17384', '2012-10-15 17:42:23.823725');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (132, 6, 7, 77, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:27.193835', '2012-10-15 17:42:23.826539');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (134, 6, 9, 79, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:27.215837', '2012-10-15 17:42:23.829113');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (135, 6, 10, 80, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:27.225045', '2012-10-15 17:42:23.831843');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (137, 6, 12, 82, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:27.25085', '2012-10-15 17:42:23.834332');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (139, 6, 14, 84, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:27.271414', '2012-10-15 17:42:23.836846');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (141, 6, 16, 86, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:27.294004', '2012-10-15 17:42:23.840117');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (145, 6, 20, 90, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:27.33871', '2012-10-15 17:42:23.845887');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (146, 6, 21, 91, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:27.347382', '2012-10-15 17:42:23.848471');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (148, 6, 23, 93, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:27.372793', '2012-10-15 17:42:23.851086');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (150, 6, 25, 95, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:27.392813', '2012-10-15 17:42:23.853632');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (152, 7, 2, 63, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:27.415915', '2012-10-15 17:42:23.856214');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (154, 7, 4, 65, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:27.446993', '2012-10-15 17:42:23.858777');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (156, 7, 6, 67, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:27.471768', '2012-10-15 17:42:23.862749');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (157, 7, 7, 68, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:27.482649', '2012-10-15 17:42:23.866385');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (159, 7, 9, 70, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:27.505044', '2012-10-15 17:42:23.870021');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (161, 7, 11, 72, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:27.525219', '2012-10-15 17:42:23.87368');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (163, 7, 13, 74, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:27.550808', '2012-10-15 17:42:23.876484');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (167, 7, 17, 78, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:27.595785', '2012-10-15 17:42:23.881928');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (168, 7, 18, 79, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:27.617039', '2012-10-15 17:42:23.884478');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (170, 7, 20, 81, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:27.639381', '2012-10-15 17:42:23.886977');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (172, 7, 22, 83, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:27.660499', '2012-10-15 17:42:23.88952');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (174, 7, 24, 85, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:27.680435', '2012-10-15 17:42:23.892069');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (176, 8, 1, 71, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:27.703754', '2012-10-15 17:42:23.894819');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (178, 8, 3, 73, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:27.725919', '2012-10-15 17:42:23.897419');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (179, 8, 4, 74, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:27.738321', '2012-10-15 17:42:23.899896');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (181, 8, 6, 76, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:27.762124', '2012-10-15 17:42:23.90253');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (183, 8, 8, 78, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:27.782602', '2012-10-15 17:42:23.905791');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (185, 8, 10, 80, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:27.804135', '2012-10-15 17:42:23.908483');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (189, 8, 14, 84, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:27.851066', '2012-10-15 17:42:23.913719');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (190, 8, 15, 85, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:27.871606', '2012-10-15 17:42:23.916558');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (192, 8, 17, 87, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:27.894042', '2012-10-15 17:42:23.919131');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (194, 8, 19, 89, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:27.916232', '2012-10-15 17:42:23.92231');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (196, 8, 21, 91, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:27.938701', '2012-10-15 17:42:23.925723');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (198, 8, 23, 93, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:27.960567', '2012-10-15 17:42:23.928421');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (200, 8, 25, 95, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:27.982808', '2012-10-15 17:42:23.931121');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (201, 9, 1, 68, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:27.993958', '2012-10-15 17:42:23.933762');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (203, 9, 3, 70, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:28.016437', '2012-10-15 17:42:23.936524');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (205, 9, 5, 72, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:28.049716', '2012-10-15 17:42:23.939164');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (209, 9, 9, 76, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:28.094831', '2012-10-15 17:42:23.944704');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (211, 9, 11, 78, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:28.11646', '2012-10-15 17:42:23.947386');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (212, 9, 12, 79, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:28.127457', '2012-10-15 17:42:23.950787');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (214, 9, 14, 81, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:28.151058', '2012-10-15 17:42:23.954485');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (112, 5, 12, 74, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:26.916151', '2012-10-15 17:42:23.95808');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (113, 5, 13, 75, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:26.925727', '2012-10-15 17:42:23.96135');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (115, 5, 15, 77, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:26.947292', '2012-10-15 17:42:23.964039');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (224, 9, 24, 91, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:28.260704', '2012-10-15 17:42:23.966607');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (226, 10, 1, 74, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:28.284278', '2012-10-15 17:42:23.969223');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (228, 10, 3, 76, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:28.305414', '2012-10-15 17:42:23.971919');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (230, 10, 5, 78, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:28.328832', '2012-10-15 17:42:23.975553');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (233, 10, 8, 81, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:28.362437', '2012-10-15 17:42:23.981026');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (235, 10, 10, 83, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:28.382754', '2012-10-15 17:42:23.983693');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (237, 10, 12, 85, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:28.405246', '2012-10-15 17:42:23.986407');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (241, 10, 16, 89, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:28.451428', '2012-10-15 17:42:24.0166');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (242, 10, 17, 90, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:28.488394', '2012-10-15 17:42:24.020049');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (244, 10, 19, 92, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:28.525874', '2012-10-15 17:42:24.022659');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (246, 10, 21, 94, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:28.549606', '2012-10-15 17:42:24.025347');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (248, 10, 23, 96, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:28.570671', '2012-10-15 17:42:24.028329');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (250, 10, 25, 98, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:28.594374', '2012-10-15 17:42:24.031007');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (252, 11, 2, 73, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:28.615389', '2012-10-15 17:42:24.033571');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (253, 11, 3, 74, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:28.62753', '2012-10-15 17:42:24.03629');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (255, 11, 5, 76, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:28.649558', '2012-10-15 17:42:24.039283');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (259, 11, 9, 80, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:28.693603', '2012-10-15 17:42:24.044567');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (261, 11, 11, 82, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:28.738764', '2012-10-15 17:42:24.047464');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (263, 11, 13, 84, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:28.761729', '2012-10-15 17:42:24.050256');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (264, 11, 14, 85, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:28.773132', '2012-10-15 17:42:24.052873');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (266, 11, 16, 87, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:28.805734', '2012-10-15 17:42:24.05619');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (268, 11, 18, 89, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:28.828511', '2012-10-15 17:42:24.059352');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (270, 11, 20, 91, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:28.86414', '2012-10-15 17:42:24.063269');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (272, 11, 22, 93, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:28.881118', '2012-10-15 17:42:24.066171');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (274, 11, 24, 95, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:28.906585', '2012-10-15 17:42:24.069081');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (275, 11, 25, 96, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:28.917259', '2012-10-15 17:42:24.071804');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (277, 12, 2, 58, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:28.953134', '2012-10-15 17:42:24.074671');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (281, 12, 6, 62, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:29.028812', '2012-10-15 17:42:24.080015');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (283, 12, 8, 64, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:29.062608', '2012-10-15 17:42:24.083497');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (285, 12, 10, 66, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:29.082765', '2012-10-15 17:42:24.087258');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (286, 12, 11, 67, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:29.092527', '2012-10-15 17:42:24.090768');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (288, 12, 13, 69, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:29.117088', '2012-10-15 17:42:24.09367');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (290, 12, 15, 71, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:29.138472', '2012-10-15 17:42:24.09625');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (292, 12, 17, 73, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:29.162515', '2012-10-15 17:42:24.098855');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (294, 12, 19, 75, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:29.206898', '2012-10-15 17:42:24.101873');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (296, 12, 21, 77, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:29.230038', '2012-10-15 17:42:24.105261');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (297, 12, 22, 78, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:29.250918', '2012-10-15 17:42:24.10805');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (299, 12, 24, 80, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:29.296461', '2012-10-15 17:42:24.110859');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (303, 13, 3, 65, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:29.359767', '2012-10-15 17:42:24.116069');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (305, 13, 5, 67, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:29.385465', '2012-10-15 17:42:24.119097');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (307, 13, 7, 69, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:29.451689', '2012-10-15 17:42:24.121496');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (308, 13, 8, 70, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:29.460007', '2012-10-15 17:42:24.123856');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (310, 13, 10, 72, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:29.482596', '2012-10-15 17:42:24.127088');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (312, 13, 12, 74, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:29.529601', '2012-10-15 17:42:24.130992');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (314, 13, 14, 76, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:29.550205', '2012-10-15 17:42:24.134623');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (316, 13, 16, 78, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:29.572058', '2012-10-15 17:42:24.137909');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (318, 13, 18, 80, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:29.594203', '2012-10-15 17:42:24.141669');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (319, 13, 19, 81, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:29.606782', '2012-10-15 17:42:24.144594');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (219, 9, 19, 86, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:28.206458', '2012-10-15 17:42:24.149388');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (220, 9, 20, 87, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:28.216096', '2012-10-15 17:42:24.151718');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (222, 9, 22, 89, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:28.239996', '2012-10-15 17:42:24.15404');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (331, 14, 6, 71, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:29.803825', '2012-10-15 17:42:24.156357');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (333, 14, 8, 73, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:29.826895', '2012-10-15 17:42:24.158648');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (335, 14, 10, 75, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:29.8484', '2012-10-15 17:42:24.161378');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (337, 14, 12, 77, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:29.869862', '2012-10-15 17:42:24.164083');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (338, 14, 13, 78, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:29.881455', '2012-10-15 17:42:24.166771');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (340, 14, 15, 80, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:29.905428', '2012-10-15 17:42:24.169685');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (342, 14, 17, 82, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:29.93774', '2012-10-15 17:42:24.173493');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (344, 14, 19, 84, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:29.96049', '2012-10-15 17:42:24.177176');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (348, 14, 23, 88, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:30.004774', '2012-10-15 17:42:24.183454');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (349, 14, 24, 89, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:30.014601', '2012-10-15 17:42:24.186845');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (351, 15, 1, 63, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:30.038332', '2012-10-15 17:42:24.189811');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (355, 15, 5, 67, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:30.105396', '2012-10-15 17:42:24.195344');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (357, 15, 7, 69, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:30.128275', '2012-10-15 17:42:24.198155');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (359, 15, 9, 71, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:30.152047', '2012-10-15 17:42:24.225195');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (360, 15, 10, 72, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:30.172604', '2012-10-15 17:42:24.228333');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (362, 15, 12, 74, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:30.208045', '2012-10-15 17:42:24.231342');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (364, 15, 14, 76, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:30.250312', '2012-10-15 17:42:24.234042');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (366, 15, 16, 78, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:30.274342', '2012-10-15 17:42:24.236636');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (368, 15, 18, 80, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:30.293088', '2012-10-15 17:42:24.239894');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (370, 15, 20, 82, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:30.316993', '2012-10-15 17:42:24.243317');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (373, 15, 23, 85, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:30.361405', '2012-10-15 17:42:24.248857');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (375, 15, 25, 87, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:30.383164', '2012-10-15 17:42:24.251492');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (377, 16, 2, 69, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:30.405928', '2012-10-15 17:42:24.254057');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (379, 16, 4, 71, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:30.428359', '2012-10-15 17:42:24.256651');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (381, 16, 6, 73, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:30.450471', '2012-10-15 17:42:24.259245');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (382, 16, 7, 74, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:30.461555', '2012-10-15 17:42:24.262914');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (384, 16, 9, 76, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:30.485627', '2012-10-15 17:42:24.266617');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (386, 16, 11, 78, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:30.505652', '2012-10-15 17:42:24.269401');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (388, 16, 13, 80, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:30.525542', '2012-10-15 17:42:24.272269');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (390, 16, 15, 82, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:30.550197', '2012-10-15 17:42:24.27593');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (392, 16, 17, 84, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:30.573974', '2012-10-15 17:42:24.278872');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (395, 16, 20, 87, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:30.61684', '2012-10-15 17:42:24.28417');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (397, 16, 22, 89, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:30.637384', '2012-10-15 17:42:24.28767');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (399, 16, 24, 91, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:30.662442', '2012-10-15 17:42:24.290482');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (401, 17, 1, 74, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:30.683897', '2012-10-15 17:42:24.293155');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (403, 17, 3, 76, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:30.706363', '2012-10-15 17:42:24.295641');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (404, 17, 4, 77, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:30.718244', '2012-10-15 17:42:24.298314');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (406, 17, 6, 79, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:30.748707', '2012-10-15 17:42:24.30109');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (408, 17, 8, 81, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:30.772377', '2012-10-15 17:42:24.303804');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (410, 17, 10, 83, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:30.793709', '2012-10-15 17:42:24.307375');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (412, 17, 12, 85, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:30.817958', '2012-10-15 17:42:24.310886');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (414, 17, 14, 87, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:30.839174', '2012-10-15 17:42:24.314165');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (417, 17, 17, 90, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:30.872456', '2012-10-15 17:42:24.320696');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (419, 17, 19, 92, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:30.894697', '2012-10-15 17:42:24.323631');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (421, 17, 21, 94, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:30.916465', '2012-10-15 17:42:24.326598');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (423, 17, 23, 96, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:30.939865', '2012-10-15 17:42:24.329257');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (425, 17, 25, 98, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:30.96118', '2012-10-15 17:42:24.331894');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (426, 18, 1, 62, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:30.972095', '2012-10-15 17:42:24.334685');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (428, 18, 3, 64, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:30.996195', '2012-10-15 17:42:24.337611');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (326, 14, 1, 66, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:29.717615', '2012-10-15 17:42:24.340246');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (327, 14, 2, 67, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:29.741015', '2012-10-15 17:42:24.342914');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (329, 14, 4, 69, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:29.772563', '2012-10-15 17:42:24.345541');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (440, 18, 15, 76, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:31.148848', '2012-10-15 17:42:24.3523');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (442, 18, 17, 78, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:31.174386', '2012-10-15 17:42:24.355903');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (444, 18, 19, 80, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:31.206009', '2012-10-15 17:42:24.358835');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (445, 18, 20, 81, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:31.216146', '2012-10-15 17:42:24.361529');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (447, 18, 22, 83, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:31.240748', '2012-10-15 17:42:24.364244');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (449, 18, 24, 85, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:31.263071', '2012-10-15 17:42:24.366699');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (451, 19, 1, 74, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:31.281417', '2012-10-15 17:42:24.369099');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (453, 19, 3, 76, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:31.317518', '2012-10-15 17:42:24.372047');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (455, 19, 5, 78, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:31.340093', '2012-10-15 17:42:24.375687');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (456, 19, 6, 79, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:31.351918', '2012-10-15 17:42:24.378423');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (458, 19, 8, 81, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:31.383155', '2012-10-15 17:42:24.381048');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (462, 19, 12, 85, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:31.440373', '2012-10-15 17:42:24.386806');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (464, 19, 14, 87, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:31.462413', '2012-10-15 17:42:24.389546');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (466, 19, 16, 89, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:31.496297', '2012-10-15 17:42:24.392884');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (469, 19, 19, 92, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:31.529126', '2012-10-15 17:42:24.400538');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (471, 19, 21, 94, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:31.551065', '2012-10-15 17:42:24.403604');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (473, 19, 23, 96, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:31.571196', '2012-10-15 17:42:24.406934');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (475, 19, 25, 98, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:31.596362', '2012-10-15 17:42:24.410547');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (477, 20, 2, 67, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:31.616414', '2012-10-15 17:42:24.433526');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (478, 20, 3, 68, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:31.630248', '2012-10-15 17:42:24.436632');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (480, 20, 5, 70, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:31.649258', '2012-10-15 17:42:24.440636');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (482, 20, 7, 72, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:31.674588', '2012-10-15 17:42:24.44437');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (484, 20, 9, 74, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:31.749619', '2012-10-15 17:42:24.447453');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (488, 20, 13, 78, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:31.794976', '2012-10-15 17:42:24.452924');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (489, 20, 14, 79, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:31.806095', '2012-10-15 17:42:24.456002');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (491, 20, 16, 81, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:31.828547', '2012-10-15 17:42:24.459307');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (493, 20, 18, 83, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:31.850667', '2012-10-15 17:42:24.462061');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (495, 20, 20, 85, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:31.872964', '2012-10-15 17:42:24.464853');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (497, 20, 22, 87, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:31.894989', '2012-10-15 17:42:24.467443');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (499, 20, 24, 89, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:31.916944', '2012-10-15 17:42:24.470002');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (500, 20, 25, 90, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:31.928224', '2012-10-15 17:42:24.472568');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (502, 21, 2, 56, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:31.948617', '2012-10-15 17:42:24.475251');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (504, 21, 4, 58, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:31.972603', '2012-10-15 17:42:24.477856');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (506, 21, 6, 60, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:31.993625', '2012-10-15 17:42:24.480503');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (510, 21, 10, 64, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:32.039177', '2012-10-15 17:42:24.488128');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (511, 21, 11, 65, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:32.050509', '2012-10-15 17:42:24.491172');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (513, 21, 13, 67, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:32.073561', '2012-10-15 17:42:24.493931');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (515, 21, 15, 69, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:32.094738', '2012-10-15 17:42:24.496626');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (517, 21, 17, 71, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:32.117079', '2012-10-15 17:42:24.499331');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (519, 21, 19, 73, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:32.139778', '2012-10-15 17:42:24.501878');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (521, 21, 21, 75, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:32.161303', '2012-10-15 17:42:24.504721');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (522, 21, 22, 76, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:32.17268', '2012-10-15 17:42:24.508393');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (524, 21, 24, 78, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:32.196945', '2012-10-15 17:42:24.511375');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (526, 22, 1, 66, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:32.227436', '2012-10-15 17:42:24.514106');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (528, 22, 3, 68, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:32.250614', '2012-10-15 17:42:24.516682');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (532, 22, 7, 72, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:32.306172', '2012-10-15 17:42:24.52194');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (533, 22, 8, 73, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:32.318004', '2012-10-15 17:42:24.525289');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (535, 22, 10, 75, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:32.339772', '2012-10-15 17:42:24.52907');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (433, 18, 8, 69, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:31.050067', '2012-10-15 17:42:24.532561');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (434, 18, 9, 70, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:31.061863', '2012-10-15 17:42:24.535384');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (436, 18, 11, 72, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:31.106013', '2012-10-15 17:42:24.538398');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (545, 22, 20, 85, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:32.450597', '2012-10-15 17:42:24.541911');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (547, 22, 22, 87, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:32.472893', '2012-10-15 17:42:24.54481');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (549, 22, 24, 89, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:32.496632', '2012-10-15 17:42:24.547595');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (551, 23, 1, 62, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:32.516911', '2012-10-15 17:42:24.550181');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (554, 23, 4, 65, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:32.551139', '2012-10-15 17:42:24.555666');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (556, 23, 6, 67, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:32.572731', '2012-10-15 17:42:24.558607');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (558, 23, 8, 69, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:32.592709', '2012-10-15 17:42:24.561366');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (560, 23, 10, 71, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:32.618201', '2012-10-15 17:42:24.564308');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (562, 23, 12, 73, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:32.63927', '2012-10-15 17:42:24.567319');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (563, 23, 13, 74, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:32.64957', '2012-10-15 17:42:24.570943');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (565, 23, 15, 76, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:32.674298', '2012-10-15 17:42:24.574574');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (567, 23, 17, 78, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:32.695189', '2012-10-15 17:42:24.577678');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (569, 23, 19, 80, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:32.717655', '2012-10-15 17:42:24.580483');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (571, 23, 21, 82, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:32.738081', '2012-10-15 17:42:24.583322');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (573, 23, 23, 84, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:32.762272', '2012-10-15 17:42:24.585963');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (576, 24, 1, 69, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:32.805354', '2012-10-15 17:42:24.592546');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (578, 24, 3, 71, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:32.828597', '2012-10-15 17:42:24.595556');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (580, 24, 5, 73, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:32.852404', '2012-10-15 17:42:24.598557');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (584, 24, 9, 77, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:32.906108', '2012-10-15 17:42:24.60468');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (585, 24, 10, 78, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:32.917244', '2012-10-15 17:42:24.607359');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (587, 24, 12, 80, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:32.940345', '2012-10-15 17:42:24.610269');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (589, 24, 14, 82, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:32.959823', '2012-10-15 17:42:24.614143');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (591, 24, 16, 84, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:32.984383', '2012-10-15 17:42:24.617857');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (593, 24, 18, 86, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:33.017155', '2012-10-15 17:42:24.642229');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (595, 24, 20, 88, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:33.039353', '2012-10-15 17:42:24.645099');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (596, 24, 21, 89, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:33.049015', '2012-10-15 17:42:24.647601');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (598, 24, 23, 91, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:33.072914', '2012-10-15 17:42:24.650006');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (602, 25, 2, 72, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:33.117479', '2012-10-15 17:42:24.656696');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (604, 25, 4, 74, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:33.139891', '2012-10-15 17:42:24.660476');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (606, 25, 6, 76, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:33.161893', '2012-10-15 17:42:24.663854');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (607, 25, 7, 77, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:33.172922', '2012-10-15 17:42:24.666377');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (609, 25, 9, 79, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:33.206558', '2012-10-15 17:42:24.668874');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (611, 25, 11, 81, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:33.228461', '2012-10-15 17:42:24.671493');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (613, 25, 13, 83, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:33.27227', '2012-10-15 17:42:24.674865');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (615, 25, 15, 85, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:33.29684', '2012-10-15 17:42:24.677926');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (617, 25, 17, 87, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:33.331164', '2012-10-15 17:42:24.68077');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (618, 25, 18, 88, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:33.574334', '2012-10-15 17:42:24.68372');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (620, 25, 20, 90, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:33.665022', '2012-10-15 17:42:24.686468');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (624, 25, 24, 94, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:33.718037', '2012-10-15 17:42:24.691857');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (626, 26, 1, 61, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:33.751969', '2012-10-15 17:42:24.694469');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (628, 26, 3, 63, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:33.773199', '2012-10-15 17:42:24.697135');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (629, 26, 4, 64, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:33.786231', '2012-10-15 17:42:24.700061');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (631, 26, 6, 66, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:33.817887', '2012-10-15 17:42:24.702614');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (633, 26, 8, 68, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:33.840712', '2012-10-15 17:42:24.705117');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (635, 26, 10, 70, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:33.863332', '2012-10-15 17:42:24.707903');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (637, 26, 12, 72, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:33.882675', '2012-10-15 17:42:24.710693');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (639, 26, 14, 74, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:33.906013', '2012-10-15 17:42:24.713491');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (640, 26, 15, 75, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:33.918673', '2012-10-15 17:42:24.71615');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (642, 26, 17, 77, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:33.941028', '2012-10-15 17:42:24.718696');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (541, 22, 16, 81, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:32.406623', '2012-10-15 17:42:24.724937');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (543, 22, 18, 83, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:32.428141', '2012-10-15 17:42:24.727875');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (652, 27, 2, 75, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:34.052179', '2012-10-15 17:42:24.730564');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (654, 27, 4, 77, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:34.087', '2012-10-15 17:42:24.733373');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (656, 27, 6, 79, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:34.120967', '2012-10-15 17:42:24.735953');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (658, 27, 8, 81, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:34.151112', '2012-10-15 17:42:24.73849');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (659, 27, 9, 82, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:34.162395', '2012-10-15 17:42:24.741303');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (661, 27, 11, 84, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:34.238264', '2012-10-15 17:42:24.745328');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (663, 27, 13, 86, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:34.262276', '2012-10-15 17:42:24.748851');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (665, 27, 15, 88, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:34.282352', '2012-10-15 17:42:24.752322');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (669, 27, 19, 92, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:34.327011', '2012-10-15 17:42:24.759092');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (670, 27, 20, 93, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:34.340085', '2012-10-15 17:42:24.762106');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (672, 27, 22, 95, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:34.362035', '2012-10-15 17:42:24.765245');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (674, 27, 24, 97, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:34.383367', '2012-10-15 17:42:24.767844');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (676, 28, 1, 63, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:34.407004', '2012-10-15 17:42:24.770461');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (678, 28, 3, 65, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:34.428811', '2012-10-15 17:42:24.77309');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (680, 28, 5, 67, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:34.451194', '2012-10-15 17:42:24.776752');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (681, 28, 6, 68, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:34.462157', '2012-10-15 17:42:24.779751');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (683, 28, 8, 70, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:34.485046', '2012-10-15 17:42:24.782385');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (685, 28, 10, 72, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:34.50821', '2012-10-15 17:42:24.78493');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (687, 28, 12, 74, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:34.527409', '2012-10-15 17:42:24.78818');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (691, 28, 16, 78, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:34.573214', '2012-10-15 17:42:24.795659');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (692, 28, 17, 79, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:34.584329', '2012-10-15 17:42:24.798696');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (694, 28, 19, 81, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:34.605981', '2012-10-15 17:42:24.802188');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (698, 28, 23, 85, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:34.65091', '2012-10-15 17:42:24.808741');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (700, 28, 25, 87, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:34.67147', '2012-10-15 17:42:24.811722');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (702, 29, 2, 75, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:34.694925', '2012-10-15 17:42:24.814401');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (703, 29, 3, 76, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:34.706313', '2012-10-15 17:42:24.817173');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (705, 29, 5, 78, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:34.731149', '2012-10-15 17:42:24.820083');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (707, 29, 7, 80, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:34.762265', '2012-10-15 17:42:24.843761');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (709, 29, 9, 82, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:34.784421', '2012-10-15 17:42:24.846982');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (711, 29, 11, 84, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:34.805734', '2012-10-15 17:42:24.849701');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (713, 29, 13, 86, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:34.828333', '2012-10-15 17:42:24.852285');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (716, 29, 16, 89, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:34.866975', '2012-10-15 17:42:24.858796');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (718, 29, 18, 91, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:34.894499', '2012-10-15 17:42:24.861406');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (720, 29, 20, 93, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:34.921795', '2012-10-15 17:42:24.863837');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (722, 29, 22, 95, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:34.949857', '2012-10-15 17:42:24.866246');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (724, 29, 24, 97, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:34.973334', '2012-10-15 17:42:24.868876');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (725, 29, 25, 98, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:34.98594', '2012-10-15 17:42:24.871342');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (727, 30, 2, 70, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:35.009058', '2012-10-15 17:42:24.873805');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (729, 30, 4, 72, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:35.041069', '2012-10-15 17:42:24.876381');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (731, 30, 6, 74, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:35.064069', '2012-10-15 17:42:24.879531');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (733, 30, 8, 76, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:35.085499', '2012-10-15 17:42:24.883231');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (735, 30, 10, 78, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:35.107192', '2012-10-15 17:42:24.886836');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (738, 30, 13, 81, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:35.150925', '2012-10-15 17:42:24.892808');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (740, 30, 15, 83, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:35.173521', '2012-10-15 17:42:24.895509');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (742, 30, 17, 85, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:35.195356', '2012-10-15 17:42:24.898358');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (744, 30, 19, 87, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:35.218747', '2012-10-15 17:42:24.901491');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (746, 30, 21, 89, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:35.239947', '2012-10-15 17:42:24.904734');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (747, 30, 22, 90, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:35.263294', '2012-10-15 17:42:24.907487');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (749, 30, 24, 92, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:35.296331', '2012-10-15 17:42:24.910365');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (647, 26, 22, 82, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:33.996182', '2012-10-15 17:42:24.913114');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (648, 26, 23, 83, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:34.00522', '2012-10-15 17:42:24.915854');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (650, 26, 25, 85, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:34.030238', '2012-10-15 17:42:24.918907');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (759, 31, 9, 81, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:35.40474', '2012-10-15 17:42:24.921528');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (763, 31, 13, 85, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:35.48502', '2012-10-15 17:42:24.928703');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (765, 31, 15, 87, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:35.517945', '2012-10-15 17:42:24.932579');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (766, 31, 16, 88, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:35.527867', '2012-10-15 17:42:24.936132');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (768, 31, 18, 90, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:35.552999', '2012-10-15 17:42:24.93905');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (770, 31, 20, 92, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:35.573354', '2012-10-15 17:42:24.941656');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (772, 31, 22, 94, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:35.593903', '2012-10-15 17:42:24.944535');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (774, 31, 24, 96, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:35.617929', '2012-10-15 17:42:24.947324');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (776, 32, 1, 72, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:35.951506', '2012-10-15 17:42:24.950008');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (777, 32, 2, 73, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:35.975792', '2012-10-15 17:42:24.952635');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (779, 32, 4, 75, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:36.005663', '2012-10-15 17:42:24.955262');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (783, 32, 8, 79, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:36.051728', '2012-10-15 17:42:24.960468');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (785, 32, 10, 81, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:36.073764', '2012-10-15 17:42:24.96321');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (787, 32, 12, 83, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:36.095875', '2012-10-15 17:42:24.966248');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (788, 32, 13, 84, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:36.109396', '2012-10-15 17:42:24.970029');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (790, 32, 15, 86, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:36.162182', '2012-10-15 17:42:24.973283');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (792, 32, 17, 88, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:36.182241', '2012-10-15 17:42:24.97677');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (794, 32, 19, 90, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:36.208328', '2012-10-15 17:42:24.979504');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (796, 32, 21, 92, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:36.230748', '2012-10-15 17:42:24.982066');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (798, 32, 23, 94, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:36.254856', '2012-10-15 17:42:24.984629');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (799, 32, 24, 95, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:36.272505', '2012-10-15 17:42:24.987728');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (827, 34, 2, 68, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:36.651206', '2012-10-15 17:42:24.991309');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (803, 33, 3, 57, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:36.321044', '2012-10-15 17:42:24.997114');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (805, 33, 5, 59, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:36.349763', '2012-10-15 17:42:24.999793');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (807, 33, 7, 61, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:36.374729', '2012-10-15 17:42:25.002566');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (810, 33, 10, 64, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:36.418984', '2012-10-15 17:42:25.008195');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (812, 33, 12, 66, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:36.441464', '2012-10-15 17:42:25.011487');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (814, 33, 14, 68, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:36.47515', '2012-10-15 17:42:25.014099');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (816, 33, 16, 70, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:36.508217', '2012-10-15 17:42:25.016699');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (818, 33, 18, 72, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:36.538463', '2012-10-15 17:42:25.019524');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (820, 33, 20, 74, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:36.563608', '2012-10-15 17:42:25.043389');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (821, 33, 21, 75, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:36.574758', '2012-10-15 17:42:25.046391');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (823, 33, 23, 77, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:36.608609', '2012-10-15 17:42:25.049069');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (825, 33, 25, 79, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:36.629624', '2012-10-15 17:42:25.051517');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (831, 34, 6, 72, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:36.733272', '2012-10-15 17:42:25.059078');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (832, 34, 7, 73, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:36.750402', '2012-10-15 17:42:25.06286');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (834, 34, 9, 75, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:36.774223', '2012-10-15 17:42:25.065773');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (836, 34, 11, 77, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:36.823949', '2012-10-15 17:42:25.06916');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (838, 34, 13, 79, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:36.848839', '2012-10-15 17:42:25.072479');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (840, 34, 15, 81, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:36.873649', '2012-10-15 17:42:25.074994');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (842, 34, 17, 83, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:36.906861', '2012-10-15 17:42:25.077458');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (843, 34, 18, 84, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:36.919074', '2012-10-15 17:42:25.079917');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (845, 34, 20, 86, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:37.229573', '2012-10-15 17:42:25.082368');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (847, 34, 22, 88, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:37.255353', '2012-10-15 17:42:25.085159');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (849, 34, 24, 90, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:37.27153', '2012-10-15 17:42:25.08764');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (853, 35, 3, 61, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:37.320158', '2012-10-15 17:42:25.092296');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (854, 35, 4, 62, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:37.342864', '2012-10-15 17:42:25.094955');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (856, 35, 6, 64, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:37.361074', '2012-10-15 17:42:25.09752');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (754, 31, 4, 76, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:35.349027', '2012-10-15 17:42:25.101446');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (755, 31, 5, 77, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:35.360602', '2012-10-15 17:42:25.105119');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (757, 31, 7, 79, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:35.384901', '2012-10-15 17:42:25.108219');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (866, 35, 16, 74, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:37.495366', '2012-10-15 17:42:25.110926');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (868, 35, 18, 76, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:37.518363', '2012-10-15 17:42:25.113445');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (870, 35, 20, 78, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:37.538058', '2012-10-15 17:42:25.115887');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (872, 35, 22, 80, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:37.562546', '2012-10-15 17:42:25.118201');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (873, 35, 23, 81, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:37.571575', '2012-10-15 17:42:25.120953');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (877, 36, 2, 69, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:37.653629', '2012-10-15 17:42:25.127535');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (879, 36, 4, 71, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:37.686795', '2012-10-15 17:42:25.130329');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (881, 36, 6, 73, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:37.731443', '2012-10-15 17:42:25.132963');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (883, 36, 8, 75, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:37.751778', '2012-10-15 17:42:25.135545');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (884, 36, 9, 76, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:37.762564', '2012-10-15 17:42:25.138185');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (886, 36, 11, 78, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:37.796398', '2012-10-15 17:42:25.141087');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (888, 36, 13, 80, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:37.817178', '2012-10-15 17:42:25.145147');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (890, 36, 15, 82, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:37.839268', '2012-10-15 17:42:25.148842');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (892, 36, 17, 84, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:37.86306', '2012-10-15 17:42:25.152241');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (894, 36, 19, 86, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:37.885204', '2012-10-15 17:42:25.155552');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (897, 36, 22, 89, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:37.930113', '2012-10-15 17:42:25.161676');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (899, 36, 24, 91, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:37.950998', '2012-10-15 17:42:25.164437');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (901, 37, 1, 56, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:37.973769', '2012-10-15 17:42:25.167091');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (903, 37, 3, 58, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:37.99398', '2012-10-15 17:42:25.169843');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (905, 37, 5, 60, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:38.019762', '2012-10-15 17:42:25.172582');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (906, 37, 6, 61, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:38.029457', '2012-10-15 17:42:25.175306');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (908, 37, 8, 63, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:38.060279', '2012-10-15 17:42:25.177984');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (910, 37, 10, 65, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:38.129076', '2012-10-15 17:42:25.18059');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (912, 37, 12, 67, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:38.149427', '2012-10-15 17:42:25.183161');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (914, 37, 14, 69, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:38.197033', '2012-10-15 17:42:25.185851');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (916, 37, 16, 71, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:38.550363', '2012-10-15 17:42:25.188962');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (919, 37, 19, 74, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:38.584551', '2012-10-15 17:42:25.19413');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (921, 37, 21, 76, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:38.605167', '2012-10-15 17:42:25.196842');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (923, 37, 23, 78, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:38.630027', '2012-10-15 17:42:25.19967');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (952, 39, 2, 68, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:39.007087', '2012-10-15 17:42:25.205832');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (927, 38, 2, 57, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:38.68399', '2012-10-15 17:42:25.209321');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (928, 38, 3, 58, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:38.694426', '2012-10-15 17:42:25.212455');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (930, 38, 5, 60, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:38.732729', '2012-10-15 17:42:25.215271');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (932, 38, 7, 62, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:38.762632', '2012-10-15 17:42:25.218174');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (934, 38, 9, 64, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:38.787401', '2012-10-15 17:42:25.241959');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (936, 38, 11, 66, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:38.818631', '2012-10-15 17:42:25.245011');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (938, 38, 13, 68, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:38.840635', '2012-10-15 17:42:25.247715');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (939, 38, 14, 69, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:38.854265', '2012-10-15 17:42:25.250289');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (943, 38, 18, 73, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:38.907399', '2012-10-15 17:42:25.256257');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (945, 38, 20, 75, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:38.931654', '2012-10-15 17:42:25.259578');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (947, 38, 22, 77, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:38.949667', '2012-10-15 17:42:25.262435');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (949, 38, 24, 79, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:38.974149', '2012-10-15 17:42:25.265059');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (950, 38, 25, 80, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:38.984967', '2012-10-15 17:42:25.267675');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (954, 39, 4, 70, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:39.029603', '2012-10-15 17:42:25.270368');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (956, 39, 6, 72, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:39.063229', '2012-10-15 17:42:25.273486');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (958, 39, 8, 74, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:39.085691', '2012-10-15 17:42:25.277322');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (960, 39, 10, 76, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:39.104869', '2012-10-15 17:42:25.280096');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (961, 39, 11, 77, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:39.117453', '2012-10-15 17:42:25.282611');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (963, 39, 13, 79, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:39.138956', '2012-10-15 17:42:25.285105');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (862, 35, 12, 70, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:37.440377', '2012-10-15 17:42:25.291688');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (864, 35, 14, 72, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:37.472251', '2012-10-15 17:42:25.294311');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (13, 1, 13, 70, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:25.725118', '2012-10-16 21:32:46.055833');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (15, 1, 15, 72, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:25.749161', '2012-10-16 21:32:46.05834');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (18, 1, 18, 75, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:25.780318', '2012-10-16 21:32:46.060683');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (20, 1, 20, 77, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:25.805531', '2012-10-16 21:32:46.063028');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (2, 1, 2, 59, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:25.573293', '2012-10-16 21:32:46.069561');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (972, 39, 22, 88, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:39.274727', '2012-10-15 17:42:25.310397');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (974, 39, 24, 90, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:39.294672', '2012-10-15 17:42:25.313152');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (7, 1, 7, 64, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:25.648831', '2012-10-16 21:32:46.07233');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (24, 1, 24, 81, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:25.849032', '2012-10-16 21:32:46.07775');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (1, 1, 1, 58, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:25.49542', '2012-10-16 21:32:46.120767');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (9, 1, 9, 66, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:25.669258', '2012-10-16 21:32:46.051797');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (26, 2, 1, 60, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:25.884564', '2012-10-15 17:42:25.331618');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (29, 2, 4, 63, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:25.950936', '2012-10-15 17:42:25.334396');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (31, 2, 6, 65, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:25.984178', '2012-10-15 17:42:25.337122');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (33, 2, 8, 67, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:26.014254', '2012-10-15 17:42:25.340345');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (35, 2, 10, 69, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:26.037763', '2012-10-15 17:42:25.344002');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (37, 2, 12, 71, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:26.06066', '2012-10-15 17:42:25.346762');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (40, 2, 15, 74, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:26.104704', '2012-10-15 17:42:25.349441');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (44, 2, 19, 78, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:26.147302', '2012-10-15 17:42:25.354768');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (46, 2, 21, 80, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:26.173016', '2012-10-15 17:42:25.357147');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (48, 2, 23, 82, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:26.194394', '2012-10-15 17:42:25.359715');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (51, 3, 1, 62, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:26.227287', '2012-10-15 17:42:25.362376');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (55, 3, 5, 66, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:26.270221', '2012-10-15 17:42:25.364812');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (57, 3, 7, 68, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:26.293246', '2012-10-15 17:42:25.368676');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (59, 3, 9, 70, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:26.316433', '2012-10-15 17:42:25.372407');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (62, 3, 12, 73, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:26.346708', '2012-10-15 17:42:25.375637');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (64, 3, 14, 75, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:26.369203', '2012-10-15 17:42:25.378496');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (66, 3, 16, 77, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:26.394076', '2012-10-15 17:42:25.381028');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (68, 3, 18, 79, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:26.415828', '2012-10-15 17:42:25.384068');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (73, 3, 23, 84, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:26.472392', '2012-10-15 17:42:25.390417');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (75, 3, 25, 86, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:26.493422', '2012-10-15 17:42:25.393142');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (77, 4, 2, 73, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:26.515599', '2012-10-15 17:42:25.396047');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (81, 4, 6, 77, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:26.561785', '2012-10-15 17:42:25.401264');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (84, 4, 9, 80, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:26.592983', '2012-10-15 17:42:25.403701');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (86, 4, 11, 82, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:26.615983', '2012-10-15 17:42:25.40613');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (88, 4, 13, 84, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:26.637993', '2012-10-15 17:42:25.409227');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (90, 4, 15, 86, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:26.660482', '2012-10-15 17:42:25.434558');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (92, 4, 17, 88, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:26.68247', '2012-10-15 17:42:25.43755');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (95, 4, 20, 91, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:26.71663', '2012-10-15 17:42:25.440204');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (97, 4, 22, 93, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:26.73976', '2012-10-15 17:42:25.442859');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (99, 4, 24, 95, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:26.772485', '2012-10-15 17:42:25.445967');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (103, 5, 3, 65, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:26.815812', '2012-10-15 17:42:25.451492');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (106, 5, 6, 68, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:26.849229', '2012-10-15 17:42:25.454606');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (108, 5, 8, 70, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:26.869019', '2012-10-15 17:42:25.458436');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (109, 5, 9, 71, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:26.881023', '2012-10-15 17:42:25.462034');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (111, 5, 11, 73, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:26.9052', '2012-10-15 17:42:25.465136');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (114, 5, 14, 76, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:26.936276', '2012-10-15 17:42:25.467798');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (116, 5, 16, 78, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:26.958685', '2012-10-15 17:42:25.470549');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (965, 39, 15, 81, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:39.162654', '2012-10-15 17:42:25.474056');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (966, 39, 16, 82, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:39.194018', '2012-10-15 17:42:25.477075');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (968, 39, 18, 84, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:39.217137', '2012-10-15 17:42:25.479745');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (970, 39, 20, 86, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:39.242393', '2012-10-15 17:42:25.482319');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (127, 6, 2, 72, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:27.093915', '2012-10-15 17:42:25.487464');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (129, 6, 4, 74, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:27.13786', '2012-10-15 17:42:25.49032');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (131, 6, 6, 76, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:27.180773', '2012-10-15 17:42:25.492878');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (133, 6, 8, 78, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:27.204956', '2012-10-15 17:42:25.495837');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (136, 6, 11, 81, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:27.237929', '2012-10-15 17:42:25.498599');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (138, 6, 13, 83, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:27.259762', '2012-10-15 17:42:25.502486');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (140, 6, 15, 85, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:27.283308', '2012-10-15 17:42:25.50559');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (142, 6, 17, 87, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:27.305592', '2012-10-15 17:42:25.508168');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (144, 6, 19, 89, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:27.32574', '2012-10-15 17:42:25.511141');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (147, 6, 22, 92, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:27.360835', '2012-10-15 17:42:25.513793');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (149, 6, 24, 94, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:27.380892', '2012-10-15 17:42:25.516223');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (153, 7, 3, 64, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:27.429102', '2012-10-15 17:42:25.52269');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (155, 7, 5, 66, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:27.462295', '2012-10-15 17:42:25.525444');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (158, 7, 8, 69, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:27.494227', '2012-10-15 17:42:25.527989');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (160, 7, 10, 71, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:27.516476', '2012-10-15 17:42:25.53068');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (162, 7, 12, 73, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:27.538064', '2012-10-15 17:42:25.533241');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (164, 7, 14, 75, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:27.560469', '2012-10-15 17:42:25.535921');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (166, 7, 16, 77, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:27.583411', '2012-10-15 17:42:25.538712');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (169, 7, 19, 80, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:27.62731', '2012-10-15 17:42:25.541305');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (171, 7, 21, 82, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:27.649517', '2012-10-15 17:42:25.544732');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (173, 7, 23, 84, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:27.671179', '2012-10-15 17:42:25.548475');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (177, 8, 2, 72, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:27.716203', '2012-10-15 17:42:25.555879');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (180, 8, 5, 75, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:27.749495', '2012-10-15 17:42:25.559354');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (182, 8, 7, 77, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:27.77174', '2012-10-15 17:42:25.562152');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (186, 8, 11, 81, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:27.816268', '2012-10-15 17:42:25.565048');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (188, 8, 13, 83, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:27.838287', '2012-10-15 17:42:25.568153');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (191, 8, 16, 86, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:27.882762', '2012-10-15 17:42:25.570741');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (193, 8, 18, 88, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:27.904731', '2012-10-15 17:42:25.573222');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (195, 8, 20, 90, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:27.925042', '2012-10-15 17:42:25.575893');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (197, 8, 22, 92, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:27.949649', '2012-10-15 17:42:25.578433');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (199, 8, 24, 94, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:27.971873', '2012-10-15 17:42:25.581287');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (202, 9, 2, 69, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:28.005337', '2012-10-15 17:42:25.583978');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (206, 9, 6, 73, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:28.062018', '2012-10-15 17:42:25.590632');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (208, 9, 8, 75, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:28.084415', '2012-10-15 17:42:25.594515');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (210, 9, 10, 77, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:28.105122', '2012-10-15 17:42:25.597806');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (215, 9, 15, 82, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:28.160494', '2012-10-15 17:42:25.605027');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (216, 9, 16, 83, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:28.171751', '2012-10-15 17:42:25.607912');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (218, 9, 18, 85, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:28.194121', '2012-10-15 17:42:25.631611');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (221, 9, 21, 88, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:28.22754', '2012-10-15 17:42:25.635342');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (223, 9, 23, 90, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:28.249576', '2012-10-15 17:42:25.638808');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (225, 9, 25, 92, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:28.269971', '2012-10-15 17:42:25.641763');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (227, 10, 2, 75, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:28.293675', '2012-10-15 17:42:25.644651');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (229, 10, 4, 77, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:28.31613', '2012-10-15 17:42:25.648133');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (232, 10, 7, 80, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:28.348064', '2012-10-15 17:42:25.651218');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (236, 10, 11, 84, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:28.393609', '2012-10-15 17:42:25.657074');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (238, 10, 13, 86, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:28.415903', '2012-10-15 17:42:25.659628');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (240, 10, 15, 88, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:28.438654', '2012-10-15 17:42:25.663065');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (243, 10, 18, 91, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:28.516083', '2012-10-15 17:42:25.665902');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (245, 10, 20, 93, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:28.53778', '2012-10-15 17:42:25.668537');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (247, 10, 22, 95, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:28.560263', '2012-10-15 17:42:25.671123');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (249, 10, 24, 97, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:28.583692', '2012-10-15 17:42:25.673873');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (120, 5, 20, 82, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:27.014811', '2012-10-15 17:42:25.677945');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (122, 5, 22, 84, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:27.039058', '2012-10-15 17:42:25.681531');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (125, 5, 25, 87, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:27.073219', '2012-10-15 17:42:25.684626');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (260, 11, 10, 81, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:28.725756', '2012-10-15 17:42:25.687236');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (265, 11, 15, 86, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:28.794616', '2012-10-15 17:42:25.692288');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (267, 11, 17, 88, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:28.818151', '2012-10-15 17:42:25.694819');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (269, 11, 19, 90, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:28.840935', '2012-10-15 17:42:25.697442');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (271, 11, 21, 92, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:28.872332', '2012-10-15 17:42:25.700561');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (273, 11, 23, 94, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:28.893452', '2012-10-15 17:42:25.703922');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (276, 12, 1, 57, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:28.930197', '2012-10-15 17:42:25.706456');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (278, 12, 3, 59, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:28.973977', '2012-10-15 17:42:25.708916');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (280, 12, 5, 61, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:29.008706', '2012-10-15 17:42:25.711523');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (282, 12, 7, 63, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:29.039913', '2012-10-15 17:42:25.71445');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (284, 12, 9, 65, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:29.073243', '2012-10-15 17:42:25.717027');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (287, 12, 12, 68, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:29.108014', '2012-10-15 17:42:25.720968');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (291, 12, 16, 72, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:29.148295', '2012-10-15 17:42:25.728144');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (293, 12, 18, 74, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:29.18628', '2012-10-15 17:42:25.730918');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (295, 12, 20, 76, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:29.21791', '2012-10-15 17:42:25.733875');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (298, 12, 23, 79, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:29.275778', '2012-10-15 17:42:25.737268');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (300, 12, 25, 81, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:29.306445', '2012-10-15 17:42:25.740097');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (302, 13, 2, 64, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:29.342665', '2012-10-15 17:42:25.742764');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (304, 13, 4, 66, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:29.372081', '2012-10-15 17:42:25.745451');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (306, 13, 6, 68, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:29.405597', '2012-10-15 17:42:25.748528');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (309, 13, 9, 71, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:29.470194', '2012-10-15 17:42:25.751194');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (311, 13, 11, 73, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:29.49491', '2012-10-15 17:42:25.753647');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (315, 13, 15, 77, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:29.561675', '2012-10-15 17:42:25.758387');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (320, 13, 20, 82, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:29.61936', '2012-10-15 17:42:25.760927');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (322, 13, 22, 84, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:29.63891', '2012-10-15 17:42:25.76448');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (323, 13, 23, 85, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:29.652237', '2012-10-15 17:42:25.768193');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (325, 13, 25, 87, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:29.695718', '2012-10-15 17:42:25.771784');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (328, 14, 3, 68, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:29.761492', '2012-10-15 17:42:25.775417');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (330, 14, 5, 70, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:29.78501', '2012-10-15 17:42:25.778428');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (332, 14, 7, 72, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:29.817158', '2012-10-15 17:42:25.781027');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (334, 14, 9, 74, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:29.839244', '2012-10-15 17:42:25.784437');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (336, 14, 11, 76, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:29.859536', '2012-10-15 17:42:25.787699');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (339, 14, 14, 79, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:29.893622', '2012-10-15 17:42:25.79064');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (343, 14, 18, 83, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:29.94806', '2012-10-15 17:42:25.796208');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (345, 14, 20, 85, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:29.973504', '2012-10-15 17:42:25.798753');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (347, 14, 22, 87, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:29.994646', '2012-10-15 17:42:25.801413');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (352, 15, 2, 64, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:30.051318', '2012-10-15 17:42:25.807624');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (354, 15, 4, 66, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:30.083288', '2012-10-15 17:42:25.832703');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (356, 15, 6, 68, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:30.116563', '2012-10-15 17:42:25.835254');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (358, 15, 8, 70, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:30.139767', '2012-10-15 17:42:25.837711');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (361, 15, 11, 73, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:30.185295', '2012-10-15 17:42:25.840077');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (363, 15, 13, 75, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:30.227584', '2012-10-15 17:42:25.842406');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (365, 15, 15, 77, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:30.263186', '2012-10-15 17:42:25.844889');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (367, 15, 17, 79, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:30.281106', '2012-10-15 17:42:25.847362');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (369, 15, 19, 81, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:30.305577', '2012-10-15 17:42:25.850664');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (374, 15, 24, 86, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:30.372153', '2012-10-15 17:42:25.858297');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (376, 16, 1, 68, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:30.396043', '2012-10-15 17:42:25.861118');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (378, 16, 3, 70, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:30.417666', '2012-10-15 17:42:25.864511');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (380, 16, 5, 72, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:30.439584', '2012-10-15 17:42:25.867607');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (383, 16, 8, 75, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:30.470263', '2012-10-15 17:42:25.870579');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (254, 11, 4, 75, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:28.638449', '2012-10-15 17:42:25.873188');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (256, 11, 6, 77, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:28.662707', '2012-10-15 17:42:25.875869');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (258, 11, 8, 79, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:28.680953', '2012-10-15 17:42:25.878687');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (394, 16, 19, 86, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:30.605866', '2012-10-15 17:42:25.881456');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (396, 16, 21, 88, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:30.627582', '2012-10-15 17:42:25.884031');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (398, 16, 23, 90, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:30.650116', '2012-10-15 17:42:25.886606');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (402, 17, 2, 75, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:30.696238', '2012-10-15 17:42:25.89176');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (405, 17, 5, 78, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:30.741425', '2012-10-15 17:42:25.895168');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (407, 17, 7, 80, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:30.759738', '2012-10-15 17:42:25.898844');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (409, 17, 9, 82, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:30.784635', '2012-10-15 17:42:25.902801');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (411, 17, 11, 84, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:30.803235', '2012-10-15 17:42:25.905873');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (413, 17, 13, 86, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:30.82925', '2012-10-15 17:42:25.908347');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (416, 17, 16, 89, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:30.861314', '2012-10-15 17:42:25.911053');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (418, 17, 18, 91, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:30.88144', '2012-10-15 17:42:25.913767');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (420, 17, 20, 93, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:30.907123', '2012-10-15 17:42:25.916818');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (422, 17, 22, 95, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:30.925362', '2012-10-15 17:42:25.920358');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (424, 17, 24, 97, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:30.949634', '2012-10-15 17:42:25.923158');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (429, 18, 4, 65, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:31.006088', '2012-10-15 17:42:25.928329');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (430, 18, 5, 66, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:31.017106', '2012-10-15 17:42:25.930788');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (432, 18, 7, 68, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:31.039072', '2012-10-15 17:42:25.93345');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (435, 18, 10, 71, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:31.072399', '2012-10-15 17:42:25.936136');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (437, 18, 12, 73, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:31.116725', '2012-10-15 17:42:25.940021');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (439, 18, 14, 75, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:31.136884', '2012-10-15 17:42:25.94366');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (441, 18, 16, 77, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:31.161652', '2012-10-15 17:42:25.947397');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (443, 18, 18, 79, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:31.19601', '2012-10-15 17:42:25.950536');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (446, 18, 21, 82, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:31.229102', '2012-10-15 17:42:25.953869');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (448, 18, 23, 84, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:31.251074', '2012-10-15 17:42:25.956721');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (454, 19, 4, 77, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:31.329561', '2012-10-15 17:42:25.96202');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (457, 19, 7, 80, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:31.374139', '2012-10-15 17:42:25.964663');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (459, 19, 9, 82, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:31.393381', '2012-10-15 17:42:25.967238');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (461, 19, 11, 84, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:31.426657', '2012-10-15 17:42:25.969922');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (463, 19, 13, 86, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:31.451916', '2012-10-15 17:42:25.972592');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (465, 19, 15, 88, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:31.474208', '2012-10-15 17:42:25.975192');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (468, 19, 18, 91, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:31.517841', '2012-10-15 17:42:25.977977');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (470, 19, 20, 93, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:31.541516', '2012-10-15 17:42:25.980858');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (472, 19, 22, 95, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:31.559751', '2012-10-15 17:42:25.984128');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (474, 19, 24, 97, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:31.583405', '2012-10-15 17:42:25.986799');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (476, 20, 1, 66, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:31.60538', '2012-10-15 17:42:25.989311');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (481, 20, 6, 71, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:31.663019', '2012-10-15 17:42:25.995073');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (483, 20, 8, 73, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:31.696794', '2012-10-15 17:42:25.998579');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (485, 20, 10, 75, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:31.761389', '2012-10-15 17:42:26.022822');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (490, 20, 15, 80, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:31.815374', '2012-10-15 17:42:26.029311');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (492, 20, 17, 82, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:31.83957', '2012-10-15 17:42:26.031863');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (494, 20, 19, 84, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:31.861609', '2012-10-15 17:42:26.034381');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (496, 20, 21, 86, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:31.883663', '2012-10-15 17:42:26.037237');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (498, 20, 23, 88, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:31.90591', '2012-10-15 17:42:26.039888');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (501, 21, 1, 55, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:31.937137', '2012-10-15 17:42:26.042538');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (503, 21, 3, 57, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:31.959314', '2012-10-15 17:42:26.045259');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (505, 21, 5, 59, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:31.986075', '2012-10-15 17:42:26.047861');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (507, 21, 7, 61, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:32.006432', '2012-10-15 17:42:26.051239');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (512, 21, 12, 66, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:32.061635', '2012-10-15 17:42:26.057587');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (514, 21, 14, 68, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:32.082634', '2012-10-15 17:42:26.060927');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (516, 21, 16, 70, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:32.107739', '2012-10-15 17:42:26.063644');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (387, 16, 12, 79, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:30.517223', '2012-10-15 17:42:26.066289');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (389, 16, 14, 81, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:30.540116', '2012-10-15 17:42:26.069414');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (391, 16, 16, 83, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:30.561526', '2012-10-15 17:42:26.073371');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (527, 22, 2, 67, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:32.239491', '2012-10-15 17:42:26.077014');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (529, 22, 4, 69, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:32.261723', '2012-10-15 17:42:26.080456');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (531, 22, 6, 71, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:32.288071', '2012-10-15 17:42:26.083654');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (534, 22, 9, 74, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:32.325712', '2012-10-15 17:42:26.087091');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (536, 22, 11, 76, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:32.349091', '2012-10-15 17:42:26.089963');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (539, 22, 14, 79, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:32.382101', '2012-10-15 17:42:26.095329');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (542, 22, 17, 82, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:32.417168', '2012-10-15 17:42:26.098135');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (544, 22, 19, 84, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:32.439524', '2012-10-15 17:42:26.100714');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (546, 22, 21, 86, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:32.462326', '2012-10-15 17:42:26.103304');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (548, 22, 23, 88, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:32.484216', '2012-10-15 17:42:26.105988');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (550, 22, 25, 90, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:32.504761', '2012-10-15 17:42:26.108689');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (553, 23, 3, 64, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:32.539634', '2012-10-15 17:42:26.111418');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (555, 23, 5, 66, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:32.561688', '2012-10-15 17:42:26.115168');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (557, 23, 7, 68, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:32.581792', '2012-10-15 17:42:26.118895');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (559, 23, 9, 70, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:32.606585', '2012-10-15 17:42:26.122538');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (561, 23, 11, 72, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:32.628313', '2012-10-15 17:42:26.125557');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (566, 23, 16, 77, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:32.683775', '2012-10-15 17:42:26.131872');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (568, 23, 18, 79, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:32.707649', '2012-10-15 17:42:26.134625');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (570, 23, 20, 81, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:32.728253', '2012-10-15 17:42:26.137306');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (572, 23, 22, 83, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:32.751104', '2012-10-15 17:42:26.140038');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (575, 23, 25, 86, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:32.785836', '2012-10-15 17:42:26.142669');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (577, 24, 2, 70, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:32.817188', '2012-10-15 17:42:26.145391');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (579, 24, 4, 72, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:32.839759', '2012-10-15 17:42:26.148066');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (581, 24, 6, 74, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:32.871219', '2012-10-15 17:42:26.150628');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (586, 24, 11, 79, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:32.926057', '2012-10-15 17:42:26.153166');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (588, 24, 13, 81, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:32.949372', '2012-10-15 17:42:26.155691');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (592, 24, 17, 85, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:32.997536', '2012-10-15 17:42:26.163124');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (594, 24, 19, 87, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:33.028683', '2012-10-15 17:42:26.166799');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (597, 24, 22, 90, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:33.062515', '2012-10-15 17:42:26.169832');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (599, 24, 24, 92, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:33.084108', '2012-10-15 17:42:26.172492');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (601, 25, 1, 71, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:33.106283', '2012-10-15 17:42:26.175097');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (603, 25, 3, 73, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:33.128548', '2012-10-15 17:42:26.17806');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (605, 25, 5, 75, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:33.150874', '2012-10-15 17:42:26.180919');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (608, 25, 8, 78, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:33.185603', '2012-10-15 17:42:26.184251');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (610, 25, 10, 80, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:33.216568', '2012-10-15 17:42:26.187543');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (612, 25, 12, 82, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:33.239458', '2012-10-15 17:42:26.190516');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (614, 25, 14, 84, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:33.285462', '2012-10-15 17:42:26.193495');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (619, 25, 19, 89, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:33.633051', '2012-10-15 17:42:26.225672');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (621, 25, 21, 91, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:33.685319', '2012-10-15 17:42:26.228314');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (623, 25, 23, 93, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:33.707266', '2012-10-15 17:42:26.230785');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (627, 26, 2, 62, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:33.760425', '2012-10-15 17:42:26.235755');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (630, 26, 5, 65, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:33.808194', '2012-10-15 17:42:26.238094');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (632, 26, 7, 67, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:33.829937', '2012-10-15 17:42:26.240394');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (634, 26, 9, 69, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:33.852018', '2012-10-15 17:42:26.242829');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (636, 26, 11, 71, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:33.874243', '2012-10-15 17:42:26.245403');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (638, 26, 13, 73, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:33.895278', '2012-10-15 17:42:26.248032');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (641, 26, 16, 76, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:33.927057', '2012-10-15 17:42:26.250657');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (643, 26, 18, 78, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:33.951795', '2012-10-15 17:42:26.25332');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (644, 26, 19, 79, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:33.962882', '2012-10-15 17:42:26.255928');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (649, 26, 24, 84, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:34.01876', '2012-10-15 17:42:26.26336');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (520, 21, 20, 74, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:32.149999', '2012-10-15 17:42:26.2667');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (523, 21, 23, 77, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:32.184067', '2012-10-15 17:42:26.269272');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (525, 21, 25, 79, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:32.217577', '2012-10-15 17:42:26.271627');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (660, 27, 10, 83, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:34.221911', '2012-10-15 17:42:26.274598');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (662, 27, 12, 85, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:34.251115', '2012-10-15 17:42:26.277694');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (664, 27, 14, 87, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:34.273299', '2012-10-15 17:42:26.2806');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (666, 27, 16, 89, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:34.29706', '2012-10-15 17:42:26.283696');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (668, 27, 18, 91, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:34.317808', '2012-10-15 17:42:26.286963');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (671, 27, 21, 94, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:34.350873', '2012-10-15 17:42:26.289898');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (673, 27, 23, 96, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:34.373151', '2012-10-15 17:42:26.292464');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (677, 28, 2, 64, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:34.419411', '2012-10-15 17:42:26.297795');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (679, 28, 4, 66, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:34.439804', '2012-10-15 17:42:26.300855');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (682, 28, 7, 69, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:34.474534', '2012-10-15 17:42:26.303569');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (684, 28, 9, 71, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:34.495391', '2012-10-15 17:42:26.306105');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (686, 28, 11, 73, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:34.517653', '2012-10-15 17:42:26.308642');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (688, 28, 13, 75, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:34.541315', '2012-10-15 17:42:26.311578');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (690, 28, 15, 77, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:34.562766', '2012-10-15 17:42:26.314336');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (693, 28, 18, 80, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:34.595417', '2012-10-15 17:42:26.317307');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (695, 28, 20, 82, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:34.617666', '2012-10-15 17:42:26.320612');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (697, 28, 22, 84, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:34.639988', '2012-10-15 17:42:26.323432');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (699, 28, 24, 86, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:34.662725', '2012-10-15 17:42:26.326129');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (704, 29, 4, 77, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:34.718079', '2012-10-15 17:42:26.331263');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (706, 29, 6, 79, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:34.751415', '2012-10-15 17:42:26.333624');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (708, 29, 8, 81, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:34.774307', '2012-10-15 17:42:26.335979');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (710, 29, 10, 83, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:34.794887', '2012-10-15 17:42:26.338311');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (712, 29, 12, 85, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:34.815304', '2012-10-15 17:42:26.34077');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (715, 29, 15, 88, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:34.85102', '2012-10-15 17:42:26.343653');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (719, 29, 19, 92, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:34.907252', '2012-10-15 17:42:26.347544');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (721, 29, 21, 94, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:34.940395', '2012-10-15 17:42:26.351306');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (723, 29, 23, 96, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:34.961116', '2012-10-15 17:42:26.354333');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (726, 30, 1, 69, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:34.994616', '2012-10-15 17:42:26.357013');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (730, 30, 5, 73, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:35.048558', '2012-10-15 17:42:26.362727');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (732, 30, 7, 75, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:35.075221', '2012-10-15 17:42:26.365982');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (734, 30, 9, 77, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:35.095955', '2012-10-15 17:42:26.368937');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (737, 30, 12, 80, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:35.134861', '2012-10-15 17:42:26.371851');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (739, 30, 14, 82, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:35.162198', '2012-10-15 17:42:26.374721');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (741, 30, 16, 84, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:35.185669', '2012-10-15 17:42:26.377527');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (743, 30, 18, 86, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:35.205125', '2012-10-15 17:42:26.380524');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (745, 30, 20, 88, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:35.229105', '2012-10-15 17:42:26.383656');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (748, 30, 23, 91, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:35.275305', '2012-10-15 17:42:26.411513');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (750, 30, 25, 93, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:35.306739', '2012-10-15 17:42:26.414473');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (751, 31, 1, 73, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:35.318171', '2012-10-15 17:42:26.417233');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (756, 31, 6, 78, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:35.373703', '2012-10-15 17:42:26.422654');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (758, 31, 8, 80, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:35.395168', '2012-10-15 17:42:26.425198');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (760, 31, 10, 82, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:35.417869', '2012-10-15 17:42:26.427713');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (764, 31, 14, 86, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:35.506815', '2012-10-15 17:42:26.433002');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (767, 31, 17, 89, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:35.540219', '2012-10-15 17:42:26.435854');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (769, 31, 19, 91, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:35.562275', '2012-10-15 17:42:26.438505');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (771, 31, 21, 93, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:35.585092', '2012-10-15 17:42:26.441105');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (773, 31, 23, 95, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:35.606899', '2012-10-15 17:42:26.443939');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (775, 31, 25, 97, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:35.628988', '2012-10-15 17:42:26.447224');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (778, 32, 3, 74, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:35.994097', '2012-10-15 17:42:26.451052');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (780, 32, 5, 76, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:36.016828', '2012-10-15 17:42:26.454628');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (782, 32, 7, 78, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:36.040615', '2012-10-15 17:42:26.457639');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (655, 27, 5, 78, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:34.105921', '2012-10-15 17:42:26.463091');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (657, 27, 7, 80, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:34.13888', '2012-10-15 17:42:26.465991');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (793, 32, 18, 89, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:36.194428', '2012-10-15 17:42:26.469416');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (795, 32, 20, 91, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:36.219153', '2012-10-15 17:42:26.472196');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (797, 32, 22, 93, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:36.241203', '2012-10-15 17:42:26.474888');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (800, 32, 25, 96, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:36.282601', '2012-10-15 17:42:26.477573');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (826, 34, 1, 67, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:36.641145', '2012-10-15 17:42:26.480456');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (802, 33, 2, 56, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:36.308335', '2012-10-15 17:42:26.48314');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (804, 33, 4, 58, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:36.339011', '2012-10-15 17:42:26.485688');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (806, 33, 6, 60, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:36.362984', '2012-10-15 17:42:26.488241');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (808, 33, 8, 62, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:36.388424', '2012-10-15 17:42:26.491209');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (813, 33, 13, 67, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:36.45494', '2012-10-15 17:42:26.49709');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (815, 33, 15, 69, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:36.497744', '2012-10-15 17:42:26.499638');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (817, 33, 17, 71, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:36.524117', '2012-10-15 17:42:26.502724');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (819, 33, 19, 73, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:36.552122', '2012-10-15 17:42:26.505397');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (822, 33, 22, 76, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:36.587537', '2012-10-15 17:42:26.507998');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (824, 33, 24, 78, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:36.619845', '2012-10-15 17:42:26.510511');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (828, 34, 3, 69, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:36.664791', '2012-10-15 17:42:26.513297');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (830, 34, 5, 71, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:36.709497', '2012-10-15 17:42:26.516425');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (833, 34, 8, 74, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:36.761259', '2012-10-15 17:42:26.520082');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (835, 34, 10, 76, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:36.785365', '2012-10-15 17:42:26.523013');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (837, 34, 12, 78, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:36.839842', '2012-10-15 17:42:26.525774');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (841, 34, 16, 82, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:36.896414', '2012-10-15 17:42:26.531273');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (844, 34, 19, 85, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:36.950898', '2012-10-15 17:42:26.533849');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (846, 34, 21, 87, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:37.240459', '2012-10-15 17:42:26.537584');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (848, 34, 23, 89, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:37.260886', '2012-10-15 17:42:26.541219');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (852, 35, 2, 60, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:37.307219', '2012-10-15 17:42:26.544544');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (855, 35, 5, 63, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:37.351158', '2012-10-15 17:42:26.547694');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (857, 35, 7, 65, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:37.374218', '2012-10-15 17:42:26.551058');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (858, 35, 8, 66, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:37.386453', '2012-10-15 17:42:26.554073');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (860, 35, 10, 68, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:37.418169', '2012-10-15 17:42:26.556882');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (863, 35, 13, 71, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:37.453569', '2012-10-15 17:42:26.559674');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (867, 35, 17, 75, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:37.506869', '2012-10-15 17:42:26.565386');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (869, 35, 19, 77, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:37.530865', '2012-10-15 17:42:26.568096');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (871, 35, 21, 79, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:37.550182', '2012-10-15 17:42:26.570957');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (874, 35, 24, 82, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:37.587043', '2012-10-15 17:42:26.573793');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (876, 36, 1, 68, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:37.618114', '2012-10-15 17:42:26.600609');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (878, 36, 3, 70, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:37.674669', '2012-10-15 17:42:26.604402');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (880, 36, 5, 72, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:37.70746', '2012-10-15 17:42:26.607282');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (882, 36, 7, 74, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:37.741098', '2012-10-15 17:42:26.610309');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (885, 36, 10, 77, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:37.774623', '2012-10-15 17:42:26.613121');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (887, 36, 12, 79, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:37.806286', '2012-10-15 17:42:26.615711');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (889, 36, 14, 81, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:37.829275', '2012-10-15 17:42:26.618269');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (893, 36, 18, 85, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:37.873943', '2012-10-15 17:42:26.623653');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (896, 36, 21, 88, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:37.918376', '2012-10-15 17:42:26.626378');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (898, 36, 23, 90, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:37.938054', '2012-10-15 17:42:26.629025');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (902, 37, 2, 57, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:37.986444', '2012-10-15 17:42:26.634787');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (904, 37, 4, 59, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:38.006872', '2012-10-15 17:42:26.638772');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (907, 37, 7, 62, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:38.049374', '2012-10-15 17:42:26.642298');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (909, 37, 9, 64, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:38.073516', '2012-10-15 17:42:26.645582');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (911, 37, 11, 66, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:38.138116', '2012-10-15 17:42:26.648227');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (913, 37, 13, 68, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:38.172937', '2012-10-15 17:42:26.651539');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (915, 37, 15, 70, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:38.538848', '2012-10-15 17:42:26.654581');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (786, 32, 11, 82, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:36.084099', '2012-10-15 17:42:26.657395');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (789, 32, 14, 85, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:36.152677', '2012-10-15 17:42:26.660148');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (935, 38, 10, 65, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:38.807278', '2012-10-15 17:42:26.665631');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (937, 38, 12, 67, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:38.829876', '2012-10-15 17:42:26.668218');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (940, 38, 15, 70, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:38.87239', '2012-10-15 17:42:26.67075');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (948, 38, 23, 78, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:38.961991', '2012-10-15 17:42:26.673347');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (957, 39, 7, 73, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:39.074022', '2012-10-15 17:42:26.675847');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (959, 39, 9, 75, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:39.094907', '2012-10-15 17:42:26.6785');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (962, 39, 12, 78, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:39.131901', '2012-10-15 17:42:26.682205');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (971, 39, 21, 87, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:39.254878', '2012-10-15 17:42:26.685767');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (973, 39, 23, 89, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:39.285815', '2012-10-15 17:42:26.68902');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (975, 39, 25, 91, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:39.308423', '2012-10-15 17:42:26.691902');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (4, 1, 4, 61, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:25.616747', '2012-10-16 21:32:46.914087');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (110, 5, 10, 72, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:26.894065', '2012-10-15 17:42:26.700314');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (118, 5, 18, 80, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:26.984658', '2012-10-15 17:42:26.703841');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (184, 8, 9, 79, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:27.79419', '2012-10-15 17:42:26.706708');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (217, 9, 17, 84, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:28.183457', '2012-10-15 17:42:26.709219');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (251, 11, 1, 72, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:28.603496', '2012-10-15 17:42:26.711825');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (317, 13, 17, 79, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:29.583617', '2012-10-15 17:42:26.714496');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (324, 13, 24, 86, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:29.673975', '2012-10-15 17:42:26.717072');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (385, 16, 10, 77, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:30.494257', '2012-10-15 17:42:26.719739');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (431, 18, 6, 67, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:31.029052', '2012-10-15 17:42:26.722542');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (450, 18, 25, 86, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:31.271464', '2012-10-15 17:42:26.725604');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (518, 21, 18, 72, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:32.125699', '2012-10-15 17:42:26.72856');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (583, 24, 8, 76, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:32.894758', '2012-10-15 17:42:26.734245');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (645, 26, 20, 80, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:33.974519', '2012-10-15 17:42:26.736742');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (651, 27, 1, 74, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:34.040862', '2012-10-15 17:42:26.739222');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (717, 29, 17, 90, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:34.882142', '2012-10-15 17:42:26.741629');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (752, 31, 2, 74, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:35.330747', '2012-10-15 17:42:26.744226');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (784, 32, 9, 80, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:36.062546', '2012-10-15 17:42:26.747781');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (850, 34, 25, 91, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:37.285272', '2012-10-15 17:42:26.750879');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (859, 35, 9, 67, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:37.4064', '2012-10-15 17:42:26.753708');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (918, 37, 18, 73, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:38.571311', '2012-10-15 17:42:26.756388');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (920, 37, 20, 75, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:38.594287', '2012-10-15 17:42:26.759234');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (924, 37, 24, 79, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:38.64091', '2012-10-15 17:42:26.792203');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (951, 39, 1, 67, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:38.996117', '2012-10-15 17:42:26.795439');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (953, 39, 3, 69, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:39.019486', '2012-10-15 17:42:26.798437');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (955, 39, 5, 71, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:39.040756', '2012-10-15 17:42:26.801054');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (964, 39, 14, 80, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:39.150143', '2012-10-15 17:42:26.803685');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (967, 39, 17, 83, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:39.206176', '2012-10-15 17:42:26.806279');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (969, 39, 19, 85, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:39.227552', '2012-10-15 17:42:26.808867');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (926, 38, 1, 56, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:38.673902', '2012-10-15 17:42:26.811446');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (929, 38, 4, 59, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:38.707568', '2012-10-15 17:42:26.814196');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (931, 38, 6, 61, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:38.751165', '2012-10-15 17:42:26.816784');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (933, 38, 8, 63, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:38.773328', '2012-10-15 17:42:26.819545');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (944, 38, 19, 74, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:38.91928', '2012-10-15 17:42:26.824761');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (946, 38, 21, 76, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:38.940305', '2012-10-15 17:42:26.828584');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (980, 40, 5, 0, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-09-16 16:46:10.286474', '2012-10-30 14:11:49.697244');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (981, 40, 6, 0, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-09-16 16:46:10.293638', '2012-10-30 14:11:49.701295');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (982, 40, 7, 0, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-09-16 16:46:10.306261', '2012-10-30 14:11:49.704632');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (983, 40, 8, 0, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-09-16 16:46:10.320223', '2012-10-30 14:11:49.707984');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (984, 40, 9, 0, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-09-16 16:46:10.342334', '2012-10-30 14:11:49.711104');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (985, 40, 10, 0, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-09-16 16:46:10.362553', '2012-10-30 14:11:49.713924');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (986, 40, 11, 0, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-09-16 16:46:10.376135', '2012-10-30 14:11:49.766295');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (987, 40, 12, 0, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-09-16 16:46:10.38442', '2012-10-30 14:11:49.769184');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (988, 40, 13, 0, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-09-16 16:46:10.397151', '2012-10-30 14:11:49.771638');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (990, 40, 15, 0, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-09-16 16:46:10.418814', '2012-10-30 14:11:49.773983');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (991, 40, 16, 0, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-09-16 16:46:10.431661', '2012-10-30 14:11:49.77636');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (992, 40, 17, 0, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-09-16 16:46:10.450502', '2012-10-30 14:11:49.778891');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (976, 40, 1, 0, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-09-16 16:46:10.168496', '2012-10-30 14:11:49.78444');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (977, 40, 2, 0, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-09-16 16:46:10.242233', '2012-10-30 14:11:49.787062');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (994, 40, 19, 0, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-09-16 16:46:10.474316', '2012-10-30 14:11:49.789622');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (995, 40, 20, 0, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-09-16 16:46:10.486246', '2012-10-30 14:11:49.792176');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (996, 40, 21, 0, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-09-16 16:46:10.498124', '2012-10-30 14:11:49.794675');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (997, 40, 22, 0, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-09-16 16:46:10.505287', '2012-10-30 14:11:49.797249');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (998, 40, 23, 0, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-09-16 16:46:10.51933', '2012-10-30 14:11:49.79974');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (1000, 40, 25, 0, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-09-16 16:46:10.541209', '2012-10-30 14:11:49.802697');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (1001, 41, 1, 0, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-09-16 17:19:41.463193', '2012-10-30 14:11:49.805249');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (1002, 41, 2, 0, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-09-16 17:19:41.488809', '2012-10-30 14:11:49.807679');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (1003, 41, 3, 0, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-09-16 17:19:41.49949', '2012-10-30 14:11:49.810407');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (1004, 41, 4, 0, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-09-16 17:19:41.511961', '2012-10-30 14:11:49.813126');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (1005, 41, 5, 0, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-09-16 17:19:41.521915', '2012-10-30 14:11:49.815632');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (1006, 41, 6, 0, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-09-16 17:19:41.532616', '2012-10-30 14:11:49.818113');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (1007, 41, 7, 0, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-09-16 17:19:41.544029', '2012-10-30 14:11:49.82062');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (1008, 41, 8, 0, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-09-16 17:19:41.555033', '2012-10-30 14:11:49.823768');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (1009, 41, 9, 0, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-09-16 17:19:41.566389', '2012-10-30 14:11:49.826899');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (1010, 41, 10, 0, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-09-16 17:19:41.577217', '2012-10-30 14:11:49.829618');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (1012, 41, 12, 0, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-09-16 17:19:41.601271', '2012-10-30 14:11:49.832003');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (1013, 41, 13, 0, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-09-16 17:19:41.610599', '2012-10-30 14:11:49.834557');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (1014, 41, 14, 0, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-09-16 17:19:41.621406', '2012-10-30 14:11:49.837121');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (1015, 41, 15, 0, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-09-16 17:19:41.633371', '2012-10-30 14:11:49.839407');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (1016, 41, 16, 0, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-09-16 17:19:41.644083', '2012-10-30 14:11:49.84165');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (1017, 41, 17, 0, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-09-16 17:19:41.655088', '2012-10-30 14:11:49.843956');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (1018, 41, 18, 0, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-09-16 17:19:41.666228', '2012-10-30 14:11:49.846871');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (1019, 41, 19, 0, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-09-16 17:19:41.677261', '2012-10-30 14:11:49.850515');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (1020, 41, 20, 0, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-09-16 17:19:41.690187', '2012-10-30 14:11:49.854029');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (1021, 41, 21, 0, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-09-16 17:19:41.699498', '2012-10-30 14:11:49.857132');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (1023, 41, 23, 0, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-09-16 17:19:41.722988', '2012-10-30 14:11:49.859749');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (1024, 41, 24, 0, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-09-16 17:19:41.732907', '2012-10-30 14:11:49.862245');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (1025, 41, 25, 0, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-09-16 17:19:41.743782', '2012-10-30 14:11:49.864544');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (1029, 48, 4, 0, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-09-16 18:03:42.147159', '2012-10-30 14:11:49.866814');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (1032, 48, 7, 0, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-09-16 18:03:42.18136', '2012-10-30 14:11:49.869039');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (1033, 48, 8, 0, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-09-16 18:03:42.201899', '2012-10-30 14:11:49.8713');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (1039, 48, 14, 0, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-09-16 18:03:42.32246', '2012-10-30 14:11:49.880556');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (1041, 48, 16, 0, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-09-16 18:03:42.346068', '2012-10-30 14:11:49.883248');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (1042, 48, 17, 0, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-09-16 18:03:42.356293', '2012-10-30 14:11:49.886462');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (1027, 48, 2, 0, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-09-16 18:03:42.122124', '2012-10-30 14:11:49.889373');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (1128, 42, 3, 0, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-09-16 18:03:43.803801', '2012-10-30 14:11:49.893308');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (1131, 42, 6, 0, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-09-16 18:03:43.846976', '2012-10-30 14:11:49.896877');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (1134, 42, 9, 0, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-09-16 18:03:43.893325', '2012-10-30 14:11:49.899819');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (1135, 42, 10, 0, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-09-16 18:03:43.91226', '2012-10-30 14:11:49.902464');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (1138, 42, 13, 0, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-09-16 18:03:43.948492', '2012-10-30 14:11:49.904764');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (1140, 42, 15, 0, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-09-16 18:03:43.982602', '2012-10-30 14:11:49.908032');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (1141, 42, 16, 0, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-09-16 18:03:44.00218', '2012-10-30 14:11:49.911203');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (1143, 42, 18, 0, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-09-16 18:03:44.021504', '2012-10-30 14:11:49.91379');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (1147, 42, 22, 0, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-09-16 18:03:44.070814', '2012-10-30 14:11:49.918846');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (1149, 42, 24, 0, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-09-16 18:03:44.113673', '2012-10-30 14:11:49.921448');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (1046, 48, 21, 0, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-09-16 18:03:42.412534', '2012-10-30 14:11:49.923887');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (1047, 48, 22, 0, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-09-16 18:03:42.425928', '2012-10-30 14:11:49.926395');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (1049, 48, 24, 0, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-09-16 18:03:42.447378', '2012-10-30 14:11:49.928864');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (1052, 49, 2, 0, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-09-16 18:03:42.501444', '2012-10-30 14:11:49.931379');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (1053, 49, 3, 0, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-09-16 18:03:42.514807', '2012-10-30 14:11:49.934764');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (1055, 49, 5, 0, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-09-16 18:03:42.535649', '2012-10-30 14:11:49.938481');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (1056, 49, 6, 0, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-09-16 18:03:42.547881', '2012-10-30 14:11:49.941974');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (1059, 49, 9, 0, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-09-16 18:03:42.604168', '2012-10-30 14:11:49.944737');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (1061, 49, 11, 0, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-09-16 18:03:42.637005', '2012-10-30 14:11:49.947221');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (1062, 49, 12, 0, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-09-16 18:03:42.64346', '2012-10-30 14:11:49.949659');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (1064, 49, 14, 0, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-09-16 18:03:42.6687', '2012-10-30 14:11:49.952077');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (1068, 49, 18, 0, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-09-16 18:03:42.724959', '2012-10-30 14:11:49.954458');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (1070, 49, 20, 0, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-09-16 18:03:42.744536', '2012-10-30 14:11:49.957704');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (1071, 49, 21, 0, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-09-16 18:03:42.754929', '2012-10-30 14:11:49.960877');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (1074, 49, 24, 0, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-09-16 18:03:42.802044', '2012-10-30 14:11:49.963552');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (1075, 49, 25, 0, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-09-16 18:03:42.815057', '2012-10-30 14:11:49.966964');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (1077, 50, 2, 0, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-09-16 18:03:42.836758', '2012-10-30 14:11:49.96998');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (1080, 50, 5, 0, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-09-16 18:03:42.89084', '2012-10-30 14:11:49.972531');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (1081, 50, 6, 0, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-09-16 18:03:42.904025', '2012-10-30 14:11:49.975065');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (1083, 50, 8, 0, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-09-16 18:03:42.937006', '2012-10-30 14:11:49.978059');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (1084, 50, 9, 0, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-09-16 18:03:42.958469', '2012-10-30 14:11:49.980582');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (1087, 50, 12, 0, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-09-16 18:03:42.994107', '2012-10-30 14:11:49.98308');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (1090, 50, 15, 0, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-09-16 18:03:43.04846', '2012-10-30 14:11:49.986093');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (1092, 50, 17, 0, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-09-16 18:03:43.08218', '2012-10-30 14:11:49.989182');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (1094, 50, 19, 0, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-09-16 18:03:43.113074', '2012-10-30 14:11:49.992875');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (1096, 50, 21, 0, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-09-16 18:03:43.157126', '2012-10-30 14:11:49.995752');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (1098, 50, 23, 0, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-09-16 18:03:43.190199', '2012-10-30 14:11:49.998266');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (1099, 50, 24, 0, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-09-16 18:03:43.203909', '2012-10-30 14:11:50.000915');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (1102, 51, 2, 0, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-09-16 18:03:43.24574', '2012-10-30 14:11:50.003605');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (1103, 51, 3, 0, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-09-16 18:03:43.259491', '2012-10-30 14:11:50.006064');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (1105, 51, 5, 0, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-09-16 18:03:43.290239', '2012-10-30 14:11:50.008644');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (1108, 51, 8, 0, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-09-16 18:03:43.335089', '2012-10-30 14:11:50.011149');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (1112, 51, 12, 0, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-09-16 18:03:43.381923', '2012-10-30 14:11:50.016082');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (1115, 51, 15, 0, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-09-16 18:03:43.42266', '2012-10-30 14:11:50.018559');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (1117, 51, 17, 0, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-09-16 18:03:43.457724', '2012-10-30 14:11:50.021162');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (1118, 51, 18, 0, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-09-16 18:03:43.471008', '2012-10-30 14:11:50.025081');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (1120, 51, 20, 0, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-09-16 18:03:43.504398', '2012-10-30 14:11:50.028678');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (1122, 51, 22, 0, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-09-16 18:03:43.532698', '2012-10-30 14:11:50.031762');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (1124, 51, 24, 0, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-09-16 18:03:43.580798', '2012-10-30 14:11:50.034447');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (1155, 43, 5, 0, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-09-16 18:03:44.211342', '2012-10-30 14:11:50.036933');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (1158, 43, 8, 0, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-09-16 18:03:44.248408', '2012-10-30 14:11:50.039783');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (1162, 43, 12, 0, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-09-16 18:03:44.311317', '2012-10-30 14:11:50.046155');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (1165, 43, 15, 0, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-09-16 18:03:44.358252', '2012-10-30 14:11:50.049034');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (1167, 43, 17, 0, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-09-16 18:03:44.39065', '2012-10-30 14:11:50.051548');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (1170, 43, 20, 0, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-09-16 18:03:44.446734', '2012-10-30 14:11:50.054048');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (1172, 43, 22, 0, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-09-16 18:03:44.480062', '2012-10-30 14:11:50.056467');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (1174, 43, 24, 0, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-09-16 18:03:44.514038', '2012-10-30 14:11:50.059052');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (1176, 44, 1, 0, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-09-16 18:03:44.534737', '2012-10-30 14:11:50.061778');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (1177, 44, 2, 0, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-09-16 18:03:44.548396', '2012-10-30 14:11:50.064312');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (1180, 44, 5, 0, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-09-16 18:03:44.600236', '2012-10-30 14:11:50.067895');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (1181, 44, 6, 0, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-09-16 18:03:44.613764', '2012-10-30 14:11:50.071291');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (1183, 44, 8, 0, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-09-16 18:03:44.637201', '2012-10-30 14:11:50.074517');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (1186, 44, 11, 0, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-09-16 18:03:44.691903', '2012-10-30 14:11:50.077007');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (1190, 44, 15, 0, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-09-16 18:03:44.770343', '2012-10-30 14:11:50.082036');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (1193, 44, 18, 0, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-09-16 18:03:44.815188', '2012-10-30 14:11:50.085134');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (1195, 44, 20, 0, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-09-16 18:03:44.849158', '2012-10-30 14:11:50.088821');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (1196, 44, 21, 0, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-09-16 18:03:44.869207', '2012-10-30 14:11:50.091615');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (1200, 44, 25, 0, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-09-16 18:03:44.933732', '2012-10-30 14:11:50.09667');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (1202, 45, 2, 0, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-09-16 18:03:44.992447', '2012-10-30 14:11:50.099171');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (1204, 45, 4, 0, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-09-16 18:03:45.026323', '2012-10-30 14:11:50.101617');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (1205, 45, 5, 0, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-09-16 18:03:45.046771', '2012-10-30 14:11:50.104274');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (1208, 45, 8, 0, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-09-16 18:03:45.089745', '2012-10-30 14:11:50.106959');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (1211, 45, 11, 0, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-09-16 18:03:45.135576', '2012-10-30 14:11:50.110867');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (1214, 45, 14, 0, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-09-16 18:03:45.182073', '2012-10-30 14:11:50.114406');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (1215, 45, 15, 0, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-09-16 18:03:45.204039', '2012-10-30 14:11:50.117432');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (1217, 45, 17, 0, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-09-16 18:03:45.237791', '2012-10-30 14:11:50.120093');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (1218, 45, 18, 0, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-09-16 18:03:45.258273', '2012-10-30 14:11:50.122592');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (1221, 45, 21, 0, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-09-16 18:03:45.291085', '2012-10-30 14:11:50.125981');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (1198, 44, 23, 29, 75, 0, 25, 25, 75, 75, 100, 60, -53, 29, '2012-09-16 18:03:44.903656', '2012-11-06 20:34:55.962183');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (1224, 45, 24, 0, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-09-16 18:03:45.325696', '2012-10-30 14:11:50.13163');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (1226, 46, 1, 0, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-09-16 18:03:45.360349', '2012-10-30 14:11:50.13421');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (1228, 46, 3, 0, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-09-16 18:03:45.393332', '2012-10-30 14:11:50.137039');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (1230, 46, 5, 0, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-09-16 18:03:45.436316', '2012-10-30 14:11:50.139584');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (1233, 46, 8, 0, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-09-16 18:03:45.482152', '2012-10-30 14:11:50.14205');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (1236, 46, 11, 0, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-09-16 18:03:45.515249', '2012-10-30 14:11:50.144577');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (1237, 46, 12, 0, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-09-16 18:03:45.524444', '2012-10-30 14:11:50.146974');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (1239, 46, 14, 0, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-09-16 18:03:45.558176', '2012-10-30 14:11:50.149422');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (1242, 46, 17, 0, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-09-16 18:03:45.611721', '2012-10-30 14:11:50.153112');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (1243, 46, 18, 0, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-09-16 18:03:45.626674', '2012-10-30 14:11:50.156699');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (1245, 46, 20, 0, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-09-16 18:03:45.684759', '2012-10-30 14:11:50.16034');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (1246, 46, 21, 0, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-09-16 18:03:45.702863', '2012-10-30 14:11:50.162913');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (1249, 46, 24, 0, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-09-16 18:03:45.736654', '2012-10-30 14:11:50.165219');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (1251, 47, 1, 0, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-09-16 18:03:45.756261', '2012-10-30 14:11:50.167508');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (1254, 47, 4, 0, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-09-16 18:03:45.805324', '2012-10-30 14:11:50.169742');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (1256, 47, 6, 0, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-09-16 18:03:45.839306', '2012-10-30 14:11:50.172053');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (1258, 47, 8, 0, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-09-16 18:03:45.894666', '2012-10-30 14:11:50.175301');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (1264, 47, 14, 0, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-09-16 18:03:45.968265', '2012-10-30 14:11:50.180987');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (1265, 47, 15, 0, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-09-16 18:03:45.982326', '2012-10-30 14:11:50.183566');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (1267, 47, 17, 0, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-09-16 18:03:46.026085', '2012-10-30 14:11:50.186224');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (1268, 47, 18, 0, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-09-16 18:03:46.036644', '2012-10-30 14:11:50.189046');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (1270, 47, 20, 0, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-09-16 18:03:46.070089', '2012-10-30 14:11:50.191812');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (1272, 47, 22, 0, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-09-16 18:03:46.104722', '2012-10-30 14:11:50.194802');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (1273, 47, 23, 0, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-09-16 18:03:46.126375', '2012-10-30 14:11:50.197541');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (1026, 48, 1, 0, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-09-16 18:03:42.094853', '2012-10-30 14:11:50.200145');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (1038, 48, 13, 0, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-09-16 18:03:42.304049', '2012-10-30 14:11:50.202675');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (1223, 45, 23, 23, 75, 0, 25, 25, 75, 75, 100, 60, -62, 23, '2012-09-16 18:03:45.313899', '2012-11-06 20:38:54.940739');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (27, 2, 2, 61, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:25.904965', '2012-10-15 17:42:23.622302');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (50, 2, 25, 84, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:26.213985', '2012-10-15 17:42:23.657808');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (71, 3, 21, 82, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:26.44759', '2012-10-15 17:42:23.690769');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (94, 4, 19, 90, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:26.705344', '2012-10-15 17:42:23.723021');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (1072, 49, 22, 0, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-09-16 18:03:42.777887', '2012-10-30 14:11:50.208855');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (1079, 50, 4, 0, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-09-16 18:03:42.870684', '2012-10-30 14:11:50.211805');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (1093, 50, 18, 0, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-09-16 18:03:43.101563', '2012-10-30 14:11:50.214373');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (1127, 42, 2, 0, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-09-16 18:03:43.789242', '2012-10-30 14:11:50.216933');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (1129, 42, 4, 0, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-09-16 18:03:43.8136', '2012-10-30 14:11:50.219419');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (1133, 42, 8, 0, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-09-16 18:03:43.880441', '2012-10-30 14:11:50.222102');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (1136, 42, 11, 0, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-09-16 18:03:43.922479', '2012-10-30 14:11:50.224557');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (1139, 42, 14, 0, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-09-16 18:03:43.969298', '2012-10-30 14:11:50.227678');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (1142, 42, 17, 0, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-09-16 18:03:44.015767', '2012-10-30 14:11:50.230265');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (1148, 42, 23, 0, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-09-16 18:03:44.09289', '2012-10-30 14:11:50.232804');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (1126, 42, 1, 0, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-09-16 18:03:43.776677', '2012-10-30 14:11:50.235404');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (1130, 42, 5, 0, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-09-16 18:03:43.826679', '2012-10-30 14:11:50.238009');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (1144, 42, 19, 0, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-09-16 18:03:44.033228', '2012-10-30 14:11:50.244792');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (1152, 43, 2, 0, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-09-16 18:03:44.159642', '2012-10-30 14:11:50.24727');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (1154, 43, 4, 0, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-09-16 18:03:44.193261', '2012-10-30 14:11:50.249979');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (1156, 43, 6, 0, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-09-16 18:03:44.222792', '2012-10-30 14:11:50.252543');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (1160, 43, 10, 0, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-09-16 18:03:44.283505', '2012-10-30 14:11:50.255126');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (1163, 43, 13, 0, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-09-16 18:03:44.323956', '2012-10-30 14:11:50.258332');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (1166, 43, 16, 0, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-09-16 18:03:44.371044', '2012-10-30 14:11:50.261305');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (1173, 43, 23, 0, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-09-16 18:03:44.493574', '2012-10-30 14:11:50.263789');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (1175, 43, 25, 0, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-09-16 18:03:44.526428', '2012-10-30 14:11:50.266097');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (1151, 43, 1, 0, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-09-16 18:03:44.146562', '2012-10-30 14:11:50.268422');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (1153, 43, 3, 0, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-09-16 18:03:44.180054', '2012-10-30 14:11:50.270669');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (1157, 43, 7, 0, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-09-16 18:03:44.235308', '2012-10-30 14:11:50.272939');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (1164, 43, 14, 0, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-09-16 18:03:44.338609', '2012-10-30 14:11:50.275256');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (1171, 43, 21, 0, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-09-16 18:03:44.459555', '2012-10-30 14:11:50.277588');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (1179, 44, 4, 0, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-09-16 18:03:44.58359', '2012-10-30 14:11:50.279878');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (1260, 47, 10, 0, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-09-16 18:03:45.923174', '2012-10-30 14:11:50.282146');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (1107, 51, 7, 0, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-09-16 18:03:43.32623', '2012-10-30 14:11:50.285778');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (1114, 51, 14, 0, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-09-16 18:03:43.415027', '2012-10-30 14:11:50.289647');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (1178, 44, 3, 0, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-09-16 18:03:44.568904', '2012-10-30 14:11:50.293281');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (1192, 44, 17, 0, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-09-16 18:03:44.802289', '2012-10-30 14:11:50.296203');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (1201, 45, 1, 0, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-09-16 18:03:44.97815', '2012-10-30 14:11:50.298867');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (1203, 45, 3, 0, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-09-16 18:03:45.013461', '2012-10-30 14:11:50.30144');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (1207, 45, 7, 0, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-09-16 18:03:45.080503', '2012-10-30 14:11:50.303964');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (1210, 45, 10, 0, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-09-16 18:03:45.115105', '2012-10-30 14:11:50.307333');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (1212, 45, 12, 0, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-09-16 18:03:45.149236', '2012-10-30 14:11:50.310909');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (1216, 45, 16, 0, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-09-16 18:03:45.224978', '2012-10-30 14:11:50.314005');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (1219, 45, 19, 0, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-09-16 18:03:45.2713', '2012-10-30 14:11:50.316663');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (1222, 45, 22, 29, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-09-16 18:03:45.304157', '2012-11-02 05:12:10.950851');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (1225, 45, 25, 0, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-09-16 18:03:45.347021', '2012-10-30 14:11:50.32196');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (1213, 45, 13, 0, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-09-16 18:03:45.169241', '2012-10-30 14:11:50.324886');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (1229, 46, 4, 0, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-09-16 18:03:45.414631', '2012-10-30 14:11:50.328097');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (1231, 46, 6, 0, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-09-16 18:03:45.449408', '2012-10-30 14:11:50.331844');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (1238, 46, 13, 0, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-09-16 18:03:45.537237', '2012-10-30 14:11:50.344222');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (1240, 46, 15, 0, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-09-16 18:03:45.571615', '2012-10-30 14:11:50.346907');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (1247, 46, 22, 0, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-09-16 18:03:45.712166', '2012-10-30 14:11:50.352075');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (1250, 46, 25, 0, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-09-16 18:03:45.748877', '2012-10-30 14:11:50.354612');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (1234, 46, 9, 0, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-09-16 18:03:45.491787', '2012-10-30 14:11:50.357299');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (1248, 46, 23, 0, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-09-16 18:03:45.723131', '2012-10-30 14:11:50.359832');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (1253, 47, 3, 0, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-09-16 18:03:45.784135', '2012-10-30 14:11:50.362359');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (47, 2, 22, 81, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:26.182759', '2012-10-15 17:42:27.8939');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (119, 5, 19, 81, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:27.004948', '2012-10-15 17:42:23.756198');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (124, 5, 24, 86, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:27.06045', '2012-10-15 17:42:23.813469');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (143, 6, 18, 88, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:27.314045', '2012-10-15 17:42:23.843158');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (165, 7, 15, 76, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:27.571485', '2012-10-15 17:42:23.879319');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (187, 8, 12, 82, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:27.827413', '2012-10-15 17:42:23.911132');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (207, 9, 7, 74, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:28.071807', '2012-10-15 17:42:23.941917');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (231, 10, 6, 79, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:28.336553', '2012-10-15 17:42:23.978358');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (239, 10, 14, 87, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:28.425842', '2012-10-15 17:42:23.989096');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (257, 11, 7, 78, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:28.670297', '2012-10-15 17:42:24.041859');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (279, 12, 4, 60, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:28.984565', '2012-10-15 17:42:24.077306');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (301, 13, 1, 63, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:29.319361', '2012-10-15 17:42:24.113542');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (321, 13, 21, 83, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:29.625713', '2012-10-15 17:42:24.147048');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (346, 14, 21, 86, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:29.984785', '2012-10-15 17:42:24.180502');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (353, 15, 3, 65, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:30.07056', '2012-10-15 17:42:24.192502');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (371, 15, 21, 83, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:30.329503', '2012-10-15 17:42:24.246076');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (1259, 47, 9, 0, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-09-16 18:03:45.915477', '2012-10-30 14:11:50.367776');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (1261, 47, 11, 0, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-09-16 18:03:45.934218', '2012-10-30 14:11:50.370473');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (1263, 47, 13, 0, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-09-16 18:03:45.957971', '2012-10-30 14:11:50.374404');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (1266, 47, 16, 0, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-09-16 18:03:46.003814', '2012-10-30 14:11:50.378013');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (1269, 47, 19, 0, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-09-16 18:03:46.051129', '2012-10-30 14:11:50.381456');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (1271, 47, 21, 0, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-09-16 18:03:46.092399', '2012-10-30 14:11:50.384188');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (1274, 47, 24, 0, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-09-16 18:03:46.14877', '2012-10-30 14:11:50.387547');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (1028, 48, 3, 0, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-09-16 18:03:42.135564', '2012-10-30 14:11:50.390546');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (1034, 48, 9, 0, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-09-16 18:03:42.214702', '2012-10-30 14:11:50.393154');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (1037, 48, 12, 0, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-09-16 18:03:42.290696', '2012-10-30 14:11:50.395875');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (1040, 48, 15, 0, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-09-16 18:03:42.333901', '2012-10-30 14:11:50.398391');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (1043, 48, 18, 0, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-09-16 18:03:42.366623', '2012-10-30 14:11:50.400971');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (1050, 48, 25, 0, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-09-16 18:03:42.459449', '2012-10-30 14:11:50.406004');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (1031, 48, 6, 0, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-09-16 18:03:42.166487', '2012-10-30 14:11:50.408538');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (1045, 48, 20, 0, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-09-16 18:03:42.392637', '2012-10-30 14:11:50.41103');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (1054, 49, 4, 0, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-09-16 18:03:42.523816', '2012-10-30 14:11:50.413546');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (1057, 49, 7, 0, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-09-16 18:03:42.556619', '2012-10-30 14:11:50.416125');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (1060, 49, 10, 0, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-09-16 18:03:42.624673', '2012-10-30 14:11:50.420046');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (1067, 49, 17, 0, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-09-16 18:03:42.712566', '2012-10-30 14:11:50.42358');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (1069, 49, 19, 0, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-09-16 18:03:42.735318', '2012-10-30 14:11:50.426804');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (1073, 49, 23, 0, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-09-16 18:03:42.788317', '2012-10-30 14:11:50.429348');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (1065, 49, 15, 0, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-09-16 18:03:42.679418', '2012-10-30 14:11:50.431897');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (1076, 50, 1, 0, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-09-16 18:03:42.821274', '2012-10-30 14:11:50.434189');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (1078, 50, 3, 0, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-09-16 18:03:42.857362', '2012-10-30 14:11:50.436461');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (1082, 50, 7, 0, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-09-16 18:03:42.925344', '2012-10-30 14:11:50.438998');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (1085, 50, 10, 0, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-09-16 18:03:42.968658', '2012-10-30 14:11:50.442478');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (1088, 50, 13, 0, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-09-16 18:03:43.013517', '2012-10-30 14:11:50.445');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (1091, 50, 16, 0, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-09-16 18:03:43.068692', '2012-10-30 14:11:50.447337');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (1097, 50, 22, 0, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-09-16 18:03:43.170892', '2012-10-30 14:11:50.449623');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (1086, 50, 11, 0, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-09-16 18:03:42.979497', '2012-10-30 14:11:50.451884');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (1100, 50, 25, 0, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-09-16 18:03:43.222215', '2012-10-30 14:11:50.45414');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (1101, 51, 1, 0, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-09-16 18:03:43.234836', '2012-10-30 14:11:50.456635');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (1104, 51, 4, 0, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-09-16 18:03:43.27946', '2012-10-30 14:11:50.459145');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (1106, 51, 6, 0, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-09-16 18:03:43.301744', '2012-10-30 14:11:50.462702');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (1110, 51, 10, 0, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-09-16 18:03:43.357763', '2012-10-30 14:11:50.466252');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (1113, 51, 13, 0, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-09-16 18:03:43.401924', '2012-10-30 14:11:50.469525');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (1116, 51, 16, 0, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-09-16 18:03:43.436898', '2012-10-30 14:11:50.472255');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (1119, 51, 19, 0, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-09-16 18:03:43.491097', '2012-10-30 14:11:50.475694');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (1123, 51, 23, 0, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-09-16 18:03:43.566725', '2012-10-30 14:11:50.478732');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (1121, 51, 21, 0, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-09-16 18:03:43.522134', '2012-10-30 14:11:50.481397');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (393, 16, 18, 85, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:30.594333', '2012-10-15 17:42:24.281481');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (415, 17, 15, 88, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:30.850708', '2012-10-15 17:42:24.317185');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (438, 18, 13, 74, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:31.129062', '2012-10-15 17:42:24.34848');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (460, 19, 10, 83, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:31.417705', '2012-10-15 17:42:24.383663');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (467, 19, 17, 90, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:31.508296', '2012-10-15 17:42:24.396724');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (486, 20, 11, 76, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:31.772458', '2012-10-15 17:42:24.450169');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (508, 21, 8, 62, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:32.019439', '2012-10-15 17:42:24.484496');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (530, 22, 5, 70, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:32.272911', '2012-10-15 17:42:24.519228');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (552, 23, 2, 63, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:32.529318', '2012-10-15 17:42:24.552853');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (574, 23, 24, 85, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:32.772805', '2012-10-15 17:42:24.589245');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (582, 24, 7, 75, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:32.883644', '2012-10-15 17:42:24.60181');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (600, 24, 25, 93, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:33.096922', '2012-10-15 17:42:24.652667');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (622, 25, 22, 92, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:33.694997', '2012-10-15 17:42:24.689265');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (540, 22, 15, 80, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:32.3951', '2012-10-15 17:42:24.721379');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (667, 27, 17, 90, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:34.306419', '2012-10-15 17:42:24.755424');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (689, 28, 14, 76, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:34.548471', '2012-10-15 17:42:24.79198');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (696, 28, 21, 83, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:34.629675', '2012-10-15 17:42:24.805628');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (714, 29, 14, 87, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:34.840114', '2012-10-15 17:42:24.855331');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (736, 30, 11, 79, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:35.11763', '2012-10-15 17:42:24.890075');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (761, 31, 11, 83, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:35.430022', '2012-10-15 17:42:24.925049');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (781, 32, 6, 77, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:36.028536', '2012-10-15 17:42:24.957862');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (801, 33, 1, 55, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:36.295216', '2012-10-15 17:42:24.994309');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (809, 33, 9, 63, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:36.406868', '2012-10-15 17:42:25.00534');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (829, 34, 4, 70, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:36.687576', '2012-10-15 17:42:25.055262');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (851, 35, 1, 59, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:37.296535', '2012-10-15 17:42:25.089949');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (875, 35, 25, 83, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:37.606017', '2012-10-15 17:42:25.12454');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (895, 36, 20, 87, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:37.897857', '2012-10-15 17:42:25.158739');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (917, 37, 17, 72, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:38.561174', '2012-10-15 17:42:25.191521');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (925, 37, 25, 80, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:38.654182', '2012-10-15 17:42:25.20244');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (941, 38, 16, 71, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:38.882546', '2012-10-15 17:42:25.252933');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (861, 35, 11, 69, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:37.429495', '2012-10-15 17:42:25.288228');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (42, 2, 17, 76, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:26.12684', '2012-10-15 17:42:25.35202');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (70, 3, 20, 81, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:26.438802', '2012-10-15 17:42:25.387622');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (79, 4, 4, 75, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:26.538238', '2012-10-15 17:42:25.398782');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (101, 5, 1, 63, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:26.793568', '2012-10-15 17:42:25.448742');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (151, 7, 1, 62, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:27.40513', '2012-10-15 17:42:25.519455');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (175, 7, 25, 86, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:27.692496', '2012-10-15 17:42:25.552141');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (204, 9, 4, 71, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:28.028598', '2012-10-15 17:42:25.586612');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (213, 9, 13, 80, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:28.138407', '2012-10-15 17:42:25.6012');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (234, 10, 9, 82, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:28.371785', '2012-10-15 17:42:25.65413');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (262, 11, 12, 83, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:28.750951', '2012-10-15 17:42:25.68979');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (11, 1, 11, 68, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:25.692458', '2012-10-16 21:32:47.588653');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (289, 12, 14, 70, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:29.126937', '2012-10-15 17:42:25.724584');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (313, 13, 13, 75, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:29.538925', '2012-10-15 17:42:25.756008');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (341, 14, 16, 81, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:29.918003', '2012-10-15 17:42:25.7936');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (350, 14, 25, 90, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:30.027687', '2012-10-15 17:42:25.804024');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (372, 15, 22, 84, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:30.34819', '2012-10-15 17:42:25.85439');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (400, 16, 25, 92, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:30.67243', '2012-10-15 17:42:25.889222');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (427, 18, 2, 63, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:30.983429', '2012-10-15 17:42:25.925808');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (452, 19, 2, 75, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:31.297005', '2012-10-15 17:42:25.959388');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (479, 20, 4, 69, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:31.640529', '2012-10-15 17:42:25.99199');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (487, 20, 12, 77, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:31.783745', '2012-10-15 17:42:26.026252');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (509, 21, 9, 63, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:32.028294', '2012-10-15 17:42:26.054513');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (537, 22, 12, 77, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:32.361203', '2012-10-15 17:42:26.092488');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (564, 23, 14, 75, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:32.661949', '2012-10-15 17:42:26.128468');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (590, 24, 15, 83, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:32.974225', '2012-10-15 17:42:26.159264');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (616, 25, 16, 86, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:33.310493', '2012-10-15 17:42:26.222764');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (625, 25, 25, 95, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:33.731946', '2012-10-15 17:42:26.233116');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (646, 26, 21, 81, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:33.985691', '2012-10-15 17:42:26.25968');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (675, 27, 25, 98, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:34.395743', '2012-10-15 17:42:26.295158');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (701, 29, 1, 74, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:34.683025', '2012-10-15 17:42:26.328809');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (728, 30, 3, 71, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:35.029037', '2012-10-15 17:42:26.359692');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (753, 31, 3, 75, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:35.33798', '2012-10-15 17:42:26.420004');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (762, 31, 12, 84, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:35.451425', '2012-10-15 17:42:26.430207');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (653, 27, 3, 76, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:34.065275', '2012-10-15 17:42:26.46034');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (811, 33, 11, 65, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:36.430235', '2012-10-15 17:42:26.494428');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (839, 34, 14, 80, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:36.863165', '2012-10-15 17:42:26.528466');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (865, 35, 15, 73, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:37.482707', '2012-10-15 17:42:26.562698');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (891, 36, 16, 83, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:37.85162', '2012-10-15 17:42:26.621074');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (900, 36, 25, 92, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:37.960698', '2012-10-15 17:42:26.631689');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (791, 32, 16, 87, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:36.175085', '2012-10-15 17:42:26.663017');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (53, 3, 3, 64, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:26.249274', '2012-10-15 17:42:26.697272');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (538, 22, 13, 78, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:32.371394', '2012-10-15 17:42:26.731135');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (922, 37, 22, 77, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:38.617794', '2012-10-15 17:42:26.762402');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (942, 38, 17, 72, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:38.895828', '2012-10-15 17:42:26.822132');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (3, 1, 3, 60, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:25.59579', '2012-10-16 21:32:47.751462');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (978, 40, 3, 0, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-09-16 16:46:10.262324', '2012-10-30 14:11:49.654609');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (989, 40, 14, 0, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-09-16 16:46:10.408632', '2012-10-30 14:11:50.682287');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (999, 40, 24, 0, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-09-16 16:46:10.531476', '2012-10-30 14:11:50.684985');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (1011, 41, 11, 0, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-09-16 17:19:41.588565', '2012-10-30 14:11:50.68743');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (1022, 41, 22, 0, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-09-16 17:19:41.710465', '2012-10-30 14:11:50.692163');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (1044, 48, 19, 0, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-09-16 18:03:42.379463', '2012-10-30 14:11:50.695051');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (1132, 42, 7, 0, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-09-16 18:03:43.859761', '2012-10-30 14:11:50.697584');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (1150, 42, 25, 0, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-09-16 18:03:44.126146', '2012-10-30 14:11:50.700284');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (1066, 49, 16, 0, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-09-16 18:03:42.69306', '2012-10-30 14:11:50.70294');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (1089, 50, 14, 0, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-09-16 18:03:43.026042', '2012-10-30 14:11:50.705383');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (1109, 51, 9, 0, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-09-16 18:03:43.347129', '2012-10-30 14:11:50.707907');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (1161, 43, 11, 0, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-09-16 18:03:44.300239', '2012-10-30 14:11:50.710353');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (1168, 43, 18, 0, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-09-16 18:03:44.411533', '2012-10-30 14:11:50.712793');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (1209, 45, 9, 0, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-09-16 18:03:45.100152', '2012-10-30 14:11:50.718704');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (1232, 46, 7, 0, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-09-16 18:03:45.469689', '2012-10-30 14:11:50.721868');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (1252, 47, 2, 0, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-09-16 18:03:45.767408', '2012-10-30 14:11:50.72548');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (1275, 47, 25, 0, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-09-16 18:03:46.173066', '2012-10-30 14:11:50.728505');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (1058, 49, 8, 0, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-09-16 18:03:42.570215', '2012-10-30 14:11:50.730988');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (1146, 42, 21, 0, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-09-16 18:03:44.057694', '2012-10-30 14:11:50.733705');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (1169, 43, 19, 0, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-09-16 18:03:44.42573', '2012-10-30 14:11:50.736927');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (1182, 44, 7, 0, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-09-16 18:03:44.624169', '2012-10-30 14:11:50.739841');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (1184, 44, 9, 0, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-09-16 18:03:44.657786', '2012-10-30 14:11:50.742258');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (1188, 44, 13, 0, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-09-16 18:03:44.726609', '2012-10-30 14:11:50.744992');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (1191, 44, 16, 0, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-09-16 18:03:44.781394', '2012-10-30 14:11:50.747557');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (1194, 44, 19, 0, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-09-16 18:03:44.835591', '2012-10-30 14:11:50.750065');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (1185, 44, 10, 0, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-09-16 18:03:44.671322', '2012-10-30 14:11:50.755234');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (1199, 44, 24, 0, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-09-16 18:03:44.923709', '2012-10-30 14:11:50.757654');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (1206, 45, 6, 0, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-09-16 18:03:45.069064', '2012-10-30 14:11:50.76019');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (1220, 45, 20, 0, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-09-16 18:03:45.280453', '2012-10-30 14:11:50.763861');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (1227, 46, 2, 0, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-09-16 18:03:45.380779', '2012-10-30 14:11:50.767993');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (1241, 46, 16, 0, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-09-16 18:03:45.593042', '2012-10-30 14:11:50.770972');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (1255, 47, 5, 0, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-09-16 18:03:45.825616', '2012-10-30 14:11:50.774175');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (1235, 46, 10, 0, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-09-16 18:03:45.502437', '2012-10-30 14:11:50.777164');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (1030, 48, 5, 0, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-09-16 18:03:42.159438', '2012-10-30 14:11:50.779793');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (1063, 49, 13, 0, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-09-16 18:03:42.658072', '2012-10-30 14:11:50.782315');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (1095, 50, 20, 0, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-09-16 18:03:43.14702', '2012-10-30 14:11:50.785075');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (1125, 51, 25, 0, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-09-16 18:03:43.597002', '2012-10-30 14:11:50.787826');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (1197, 44, 22, 13, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-09-16 18:03:44.882216', '2012-10-30 14:11:50.752708');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (993, 40, 18, 0, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-09-16 16:46:10.462865', '2012-10-30 14:11:49.781395');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (1035, 48, 10, 0, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-09-16 18:03:42.248187', '2012-10-30 14:11:49.874488');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (1036, 48, 11, 0, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-09-16 18:03:42.270855', '2012-10-30 14:11:49.877725');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (1145, 42, 20, 0, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-09-16 18:03:44.045426', '2012-10-30 14:11:49.916343');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (1111, 51, 11, 0, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-09-16 18:03:43.368552', '2012-10-30 14:11:50.013665');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (1159, 43, 9, 0, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-09-16 18:03:44.268926', '2012-10-30 14:11:50.04323');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (1189, 44, 14, 0, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-09-16 18:03:44.748447', '2012-10-30 14:11:50.079431');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (1262, 47, 12, 0, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-09-16 18:03:45.945229', '2012-10-30 14:11:50.178333');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (1051, 49, 1, 0, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-09-16 18:03:42.48159', '2012-10-30 14:11:50.205393');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (1137, 42, 12, 0, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-09-16 18:03:43.935753', '2012-10-30 14:11:50.241878');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (1244, 46, 19, 0, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-09-16 18:03:45.647317', '2012-10-30 14:11:50.349455');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (1257, 47, 7, 0, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-09-16 18:03:45.859165', '2012-10-30 14:11:50.36479');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (1048, 48, 23, 0, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-09-16 18:03:42.4349', '2012-10-30 14:11:50.403489');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (979, 40, 4, 0, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-09-16 16:46:10.273231', '2012-10-30 14:11:50.678606');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (1187, 44, 12, 0, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-09-16 18:03:44.704278', '2012-10-30 14:11:50.715248');
INSERT INTO indicator_scores (id, indicator_id, scoredate_id, score, goal, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, baseline, growth, progress, created_at, updated_at) VALUES (22, 1, 22, 79, 75, 0, 25, 25, 75, 75, 100, 60, NULL, NULL, '2012-08-09 19:39:25.827078', '2012-10-30 20:07:26.379553');


--
-- TOC entry 2274 (class 0 OID 17606)
-- Dependencies: 180
-- Data for Name: indicators; Type: TABLE DATA; Schema: public; Owner: bmo
--

INSERT INTO indicators (id, name, acronym, weight, objective_id, operation_id, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, unit, formula, show, created_at, updated_at) VALUES (2, 'Ventas Anuales', 'Ventas Anuales', 25, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', true, '2012-08-09 18:43:19.280852', '2012-10-30 14:16:57.861655');
INSERT INTO indicators (id, name, acronym, weight, objective_id, operation_id, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, unit, formula, show, created_at, updated_at) VALUES (3, 'Ingresos', 'Ingresos', 25, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', true, '2012-08-09 18:43:31.485467', '2012-10-30 14:16:57.865906');
INSERT INTO indicators (id, name, acronym, weight, objective_id, operation_id, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, unit, formula, show, created_at, updated_at) VALUES (4, 'ROCE', 'ROCE', 25, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', true, '2012-08-09 18:43:56.204019', '2012-10-30 14:16:57.867932');
INSERT INTO indicators (id, name, acronym, weight, objective_id, operation_id, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, unit, formula, show, created_at, updated_at) VALUES (5, 'Costo uniterio ponderado', 'Costo uniterio ponderado', 25, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', true, '2012-08-09 18:46:09.650132', '2012-10-30 14:16:57.869548');
INSERT INTO indicators (id, name, acronym, weight, objective_id, operation_id, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, unit, formula, show, created_at, updated_at) VALUES (6, 'Costo uniterio por proceso ', 'Costo uniterio por proceso ', 25, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', true, '2012-08-09 18:46:26.80505', '2012-10-30 14:16:57.871129');
INSERT INTO indicators (id, name, acronym, weight, objective_id, operation_id, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, unit, formula, show, created_at, updated_at) VALUES (7, 'Margen Bruto', 'Margen Bruto', 25, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', true, '2012-08-09 18:47:12.64202', '2012-10-30 14:16:57.872742');
INSERT INTO indicators (id, name, acronym, weight, objective_id, operation_id, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, unit, formula, show, created_at, updated_at) VALUES (8, 'Ingresos no Venezuela', 'Ingresos no Venezuela', 25, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', true, '2012-08-09 18:47:32.620809', '2012-10-30 14:16:57.875502');
INSERT INTO indicators (id, name, acronym, weight, objective_id, operation_id, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, unit, formula, show, created_at, updated_at) VALUES (9, 'Ventas con clientes multipais', 'Ventas con clientes multipais', 25, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', true, '2012-08-09 18:49:25.876588', '2012-10-30 14:16:57.877752');
INSERT INTO indicators (id, name, acronym, weight, objective_id, operation_id, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, unit, formula, show, created_at, updated_at) VALUES (10, 'Satisfaccion del cliente', 'Satisfaccion del cliente', 25, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', true, '2012-08-09 18:49:59.817753', '2012-10-30 14:16:57.879313');
INSERT INTO indicators (id, name, acronym, weight, objective_id, operation_id, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, unit, formula, show, created_at, updated_at) VALUES (11, 'Participación de Mercado LACT', 'Participación de Mercado LACT', 25, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', true, '2012-08-09 18:50:25.442132', '2012-10-30 14:16:57.880744');
INSERT INTO indicators (id, name, acronym, weight, objective_id, operation_id, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, unit, formula, show, created_at, updated_at) VALUES (12, 'Lealtad del Cliente', 'Lealtad del Cliente', 25, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', true, '2012-08-09 18:51:01.078174', '2012-10-30 14:16:57.882144');
INSERT INTO indicators (id, name, acronym, weight, objective_id, operation_id, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, unit, formula, show, created_at, updated_at) VALUES (13, 'Reclamos de Clientes', 'Reclamos de Clientes', 25, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', true, '2012-08-09 18:51:14.095021', '2012-10-30 14:16:57.883552');
INSERT INTO indicators (id, name, acronym, weight, objective_id, operation_id, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, unit, formula, show, created_at, updated_at) VALUES (14, 'Reclamos Clientes de Clientes', 'Reclamos Clientes de Clientes', 25, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', true, '2012-08-09 18:51:28.7243', '2012-10-30 14:16:57.884967');
INSERT INTO indicators (id, name, acronym, weight, objective_id, operation_id, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, unit, formula, show, created_at, updated_at) VALUES (15, 'Facturación Alianzas/Clientes', 'Facturación Alianzas/Clientes', 25, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', true, '2012-08-09 18:51:57.169278', '2012-10-30 14:16:57.887478');
INSERT INTO indicators (id, name, acronym, weight, objective_id, operation_id, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, unit, formula, show, created_at, updated_at) VALUES (16, 'Fact. Alianzas/Proveedores', 'Fact. Alianzas/Proveedores', 25, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', true, '2012-08-09 18:52:13.553724', '2012-10-30 14:16:57.889892');
INSERT INTO indicators (id, name, acronym, weight, objective_id, operation_id, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, unit, formula, show, created_at, updated_at) VALUES (17, 'Crecimiento Servicios', 'Crecimiento Servicios', 25, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', true, '2012-08-09 18:52:40.318618', '2012-10-30 14:16:57.89203');
INSERT INTO indicators (id, name, acronym, weight, objective_id, operation_id, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, unit, formula, show, created_at, updated_at) VALUES (18, 'Crecimiento Fact. Clientes TT', 'Crecimiento Fact. Clientes TT', 25, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', true, '2012-08-09 18:52:58.579816', '2012-10-30 14:16:57.894089');
INSERT INTO indicators (id, name, acronym, weight, objective_id, operation_id, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, unit, formula, show, created_at, updated_at) VALUES (19, 'Clientes Acuerdo/Regional', 'Clientes Acuerdo/Regional', 25, 11, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', true, '2012-08-09 18:53:30.427115', '2012-10-30 14:16:57.896156');
INSERT INTO indicators (id, name, acronym, weight, objective_id, operation_id, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, unit, formula, show, created_at, updated_at) VALUES (20, 'Países con Presencia', 'Países con Presencia', 25, 11, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', true, '2012-08-09 18:53:51.277891', '2012-10-30 14:16:57.89811');
INSERT INTO indicators (id, name, acronym, weight, objective_id, operation_id, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, unit, formula, show, created_at, updated_at) VALUES (21, 'Clientes “lapsed” (Bs)', 'Clientes “lapsed” (Bs)', 25, 12, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', true, '2012-08-09 18:54:26.242003', '2012-10-30 14:16:57.899763');
INSERT INTO indicators (id, name, acronym, weight, objective_id, operation_id, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, unit, formula, show, created_at, updated_at) VALUES (22, 'Clientes “lapsed” (unid)', 'Clientes “lapsed” (unid)', 25, 12, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', true, '2012-08-09 18:54:41.525277', '2012-10-30 14:16:57.901243');
INSERT INTO indicators (id, name, acronym, weight, objective_id, operation_id, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, unit, formula, show, created_at, updated_at) VALUES (23, 'Facturación Clientes < 3 años', 'Facturación Clientes < 3 años', 25, 12, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', true, '2012-08-09 18:55:37.892341', '2012-10-30 14:16:57.902884');
INSERT INTO indicators (id, name, acronym, weight, objective_id, operation_id, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, unit, formula, show, created_at, updated_at) VALUES (24, 'Procesos con mediciones ', 'Procesos con mediciones ', 25, 13, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', true, '2012-08-09 18:56:04.283997', '2012-10-30 14:16:57.904494');
INSERT INTO indicators (id, name, acronym, weight, objective_id, operation_id, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, unit, formula, show, created_at, updated_at) VALUES (25, 'Efectividad based on KPI', 'Efectividad based on KPI', 25, 13, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', true, '2012-08-09 18:56:18.841269', '2012-10-30 14:16:57.906453');
INSERT INTO indicators (id, name, acronym, weight, objective_id, operation_id, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, unit, formula, show, created_at, updated_at) VALUES (26, 'Ingresos Nuevos Servicios', 'Ingresos Nuevos Servicios', 25, 14, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', true, '2012-08-09 18:56:39.743063', '2012-10-30 14:16:57.908751');
INSERT INTO indicators (id, name, acronym, weight, objective_id, operation_id, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, unit, formula, show, created_at, updated_at) VALUES (27, 'Servicios Nuevos Contratados', 'Servicios Nuevos Contratados', 25, 14, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', true, '2012-08-09 18:56:59.681665', '2012-10-30 14:16:57.911126');
INSERT INTO indicators (id, name, acronym, weight, objective_id, operation_id, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, unit, formula, show, created_at, updated_at) VALUES (28, 'Alianzas con Clientes', 'Alianzas con Clientes', 25, 15, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', true, '2012-08-09 18:57:24.281441', '2012-10-30 14:16:57.912731');
INSERT INTO indicators (id, name, acronym, weight, objective_id, operation_id, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, unit, formula, show, created_at, updated_at) VALUES (29, 'Alianzas con Proveedores', 'Alianzas con Proveedores', 25, 15, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', true, '2012-08-09 18:57:36.546086', '2012-10-30 14:16:57.914171');
INSERT INTO indicators (id, name, acronym, weight, objective_id, operation_id, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, unit, formula, show, created_at, updated_at) VALUES (30, 'Procesos y Sistemas Replicados', 'Procesos y Sistemas Replicados', 25, 16, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', true, '2012-08-09 18:58:16.210508', '2012-10-30 14:16:57.915571');
INSERT INTO indicators (id, name, acronym, weight, objective_id, operation_id, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, unit, formula, show, created_at, updated_at) VALUES (31, 'Efectividad Gastos', 'Efectividad Gastos', 25, 16, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', true, '2012-08-09 18:58:31.52716', '2012-10-30 14:16:57.916973');
INSERT INTO indicators (id, name, acronym, weight, objective_id, operation_id, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, unit, formula, show, created_at, updated_at) VALUES (32, 'Procesos con IS', 'Procesos con IS', 25, 17, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', true, '2012-08-09 18:58:58.609602', '2012-10-30 14:16:57.918389');
INSERT INTO indicators (id, name, acronym, weight, objective_id, operation_id, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, unit, formula, show, created_at, updated_at) VALUES (33, 'Index Satisfacción Cliente', 'Index Satisfacción Cliente', 25, 18, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', true, '2012-08-09 18:59:27.646704', '2012-10-30 14:16:57.919825');
INSERT INTO indicators (id, name, acronym, weight, objective_id, operation_id, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, unit, formula, show, created_at, updated_at) VALUES (34, 'Index Cultura Serv. y Negocios', 'Index Cultura Serv. y Negocios', 25, 18, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', true, '2012-08-09 19:00:20.835528', '2012-10-30 14:16:57.961289');
INSERT INTO indicators (id, name, acronym, weight, objective_id, operation_id, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, unit, formula, show, created_at, updated_at) VALUES (35, 'Index Reclamos Laborales', 'Index Reclamos Laborales', 25, 18, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', true, '2012-08-09 19:00:33.928752', '2012-10-30 14:16:57.963564');
INSERT INTO indicators (id, name, acronym, weight, objective_id, operation_id, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, unit, formula, show, created_at, updated_at) VALUES (36, 'Index Posiciones Sin Recurso', 'Index Posiciones Sin Recurso', 25, 19, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', true, '2012-08-09 19:01:04.56955', '2012-10-30 14:16:57.965276');
INSERT INTO indicators (id, name, acronym, weight, objective_id, operation_id, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, unit, formula, show, created_at, updated_at) VALUES (37, 'Index Brechas Comp. Claves ', 'Index Brechas Comp. Claves ', 25, 19, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', true, '2012-08-09 19:01:17.962178', '2012-10-30 14:16:57.966902');
INSERT INTO indicators (id, name, acronym, weight, objective_id, operation_id, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, unit, formula, show, created_at, updated_at) VALUES (38, 'Index Rotación Personal', 'Index Rotación Personal', 25, 19, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', true, '2012-08-09 19:01:34.230089', '2012-10-30 14:16:57.968541');
INSERT INTO indicators (id, name, acronym, weight, objective_id, operation_id, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, unit, formula, show, created_at, updated_at) VALUES (39, 'Index Calidad Modelo Negocio', 'Index Calidad Modelo Negocio', 25, 20, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', true, '2012-08-09 19:02:01.338773', '2012-10-30 14:16:57.970248');
INSERT INTO indicators (id, name, acronym, weight, objective_id, operation_id, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, unit, formula, show, created_at, updated_at) VALUES (50, 'subImpulsor 7', 'subImpulsor 7', 25, NULL, NULL, 0, 25, 25, 75, 75, 100, NULL, NULL, NULL, '%', '', true, '2012-09-16 17:54:19.351949', '2012-10-30 14:16:57.971889');
INSERT INTO indicators (id, name, acronym, weight, objective_id, operation_id, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, unit, formula, show, created_at, updated_at) VALUES (43, 'Impulsor 4', 'Impulsor 4', 25, NULL, NULL, 0, 25, 25, 75, 75, 100, NULL, NULL, NULL, '%', '', true, '2012-09-16 17:51:52.752097', '2012-10-30 14:16:57.973511');
INSERT INTO indicators (id, name, acronym, weight, objective_id, operation_id, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, unit, formula, show, created_at, updated_at) VALUES (40, 'Impulsor 1', 'Impulsor 1', 25, NULL, NULL, 0, 25, 25, 75, 75, 100, NULL, NULL, NULL, '%', '', true, '2012-09-16 16:43:46.604373', '2012-10-30 14:16:57.975095');
INSERT INTO indicators (id, name, acronym, weight, objective_id, operation_id, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, unit, formula, show, created_at, updated_at) VALUES (51, 'subImpulsor 8', 'subImpulsor 8', 25, NULL, NULL, 0, 25, 25, 75, 75, 100, NULL, NULL, NULL, '%', '', true, '2012-09-16 17:54:26.759898', '2012-10-30 14:16:57.976718');
INSERT INTO indicators (id, name, acronym, weight, objective_id, operation_id, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, unit, formula, show, created_at, updated_at) VALUES (47, 'subImpulsor 4', 'subImpulsor 4', 25, NULL, NULL, 0, 25, 25, 75, 75, 100, NULL, NULL, NULL, '%', '', true, '2012-09-16 17:53:52.943246', '2012-10-30 14:16:57.978334');
INSERT INTO indicators (id, name, acronym, weight, objective_id, operation_id, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, unit, formula, show, created_at, updated_at) VALUES (46, 'subImpulsor 3', 'subImpulsor 3', 25, NULL, NULL, 0, 25, 25, 75, 75, 100, NULL, NULL, NULL, '%', '', true, '2012-09-16 17:53:41.08936', '2012-10-30 14:16:57.979933');
INSERT INTO indicators (id, name, acronym, weight, objective_id, operation_id, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, unit, formula, show, created_at, updated_at) VALUES (42, 'Impulsor 3', 'Impulsor 3', 25, NULL, NULL, 0, 25, 25, 75, 75, 100, NULL, NULL, NULL, '%', '', true, '2012-09-16 17:51:37.199311', '2012-10-30 14:16:57.981577');
INSERT INTO indicators (id, name, acronym, weight, objective_id, operation_id, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, unit, formula, show, created_at, updated_at) VALUES (45, 'subImpulsor 2', 'subImpulsor 2', 25, NULL, NULL, 0, 25, 25, 75, 75, 100, NULL, NULL, NULL, '%', '', true, '2012-09-16 17:53:22.194889', '2012-10-30 14:16:57.983148');
INSERT INTO indicators (id, name, acronym, weight, objective_id, operation_id, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, unit, formula, show, created_at, updated_at) VALUES (41, 'Impulsor 2', 'Impulsor 2', 25, NULL, NULL, 0, 25, 25, 75, 75, 100, NULL, NULL, NULL, '%', '', true, '2012-09-16 17:18:10.706219', '2012-10-30 14:16:57.984676');
INSERT INTO indicators (id, name, acronym, weight, objective_id, operation_id, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, unit, formula, show, created_at, updated_at) VALUES (48, 'subImpulsor 5', 'subImpulsor 5', 25, NULL, NULL, 0, 25, 25, 75, 75, 100, NULL, NULL, NULL, '%', '', true, '2012-09-16 17:54:02.582416', '2012-10-30 14:16:57.986283');
INSERT INTO indicators (id, name, acronym, weight, objective_id, operation_id, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, unit, formula, show, created_at, updated_at) VALUES (49, 'subImpulsor 6', 'subImpulsor 6', 25, NULL, NULL, 0, 25, 25, 75, 75, 100, NULL, NULL, NULL, '%', '', true, '2012-09-16 17:54:12.030617', '2012-10-30 14:16:57.98796');
INSERT INTO indicators (id, name, acronym, weight, objective_id, operation_id, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, unit, formula, show, created_at, updated_at) VALUES (44, 'subImpulsor 1', 'subImpulsor 1', 25, NULL, NULL, 0, 25, 25, 75, 75, 100, NULL, NULL, NULL, '%', '', true, '2012-09-16 17:53:02.947238', '2012-10-30 14:16:57.98965');
INSERT INTO indicators (id, name, acronym, weight, objective_id, operation_id, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, unit, formula, show, created_at, updated_at) VALUES (1, 'EVA', 'EVA', 25, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', true, '2012-08-09 18:40:57.914199', '2012-10-30 14:16:57.991239');


--
-- TOC entry 2275 (class 0 OID 17616)
-- Dependencies: 181
-- Data for Name: indicators_objectives; Type: TABLE DATA; Schema: public; Owner: bmo
--

INSERT INTO indicators_objectives (indicator_id, objective_id) VALUES (40, 10);
INSERT INTO indicators_objectives (indicator_id, objective_id) VALUES (40, 3);
INSERT INTO indicators_objectives (indicator_id, objective_id) VALUES (40, 9);
INSERT INTO indicators_objectives (indicator_id, objective_id) VALUES (40, 11);
INSERT INTO indicators_objectives (indicator_id, objective_id) VALUES (40, 8);
INSERT INTO indicators_objectives (indicator_id, objective_id) VALUES (40, 17);
INSERT INTO indicators_objectives (indicator_id, objective_id) VALUES (40, 2);
INSERT INTO indicators_objectives (indicator_id, objective_id) VALUES (40, 1);
INSERT INTO indicators_objectives (indicator_id, objective_id) VALUES (40, 16);
INSERT INTO indicators_objectives (indicator_id, objective_id) VALUES (40, 19);
INSERT INTO indicators_objectives (indicator_id, objective_id) VALUES (40, 14);
INSERT INTO indicators_objectives (indicator_id, objective_id) VALUES (40, 20);
INSERT INTO indicators_objectives (indicator_id, objective_id) VALUES (40, 6);
INSERT INTO indicators_objectives (indicator_id, objective_id) VALUES (40, 5);
INSERT INTO indicators_objectives (indicator_id, objective_id) VALUES (40, 13);
INSERT INTO indicators_objectives (indicator_id, objective_id) VALUES (40, 15);
INSERT INTO indicators_objectives (indicator_id, objective_id) VALUES (40, 7);
INSERT INTO indicators_objectives (indicator_id, objective_id) VALUES (40, 4);
INSERT INTO indicators_objectives (indicator_id, objective_id) VALUES (40, 18);
INSERT INTO indicators_objectives (indicator_id, objective_id) VALUES (40, 12);


--
-- TOC entry 2272 (class 0 OID 17589)
-- Dependencies: 176
-- Data for Name: objective_scores; Type: TABLE DATA; Schema: public; Owner: bmo
--

INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (10, 1, 10, 67, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:35.17845', '2012-10-30 14:08:50.998666');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (12, 1, 12, 69, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:35.207944', '2012-10-30 14:08:51.003624');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (14, 1, 14, 71, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:35.232963', '2012-10-30 14:08:51.007896');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (16, 1, 16, 73, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:35.254235', '2012-10-30 14:08:51.011396');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (17, 1, 17, 74, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:35.267723', '2012-10-30 14:08:51.013989');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (19, 1, 19, 76, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:35.298638', '2012-10-30 14:08:51.016466');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (21, 1, 21, 78, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:35.322639', '2012-10-30 14:08:51.018986');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (23, 1, 23, 80, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:35.341114', '2012-10-30 14:08:51.021211');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (25, 1, 25, 82, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:35.376527', '2012-10-30 14:08:51.023441');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (28, 2, 3, 63, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:35.420428', '2012-10-30 14:08:51.028091');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (30, 2, 5, 65, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:35.445237', '2012-10-30 14:08:51.030428');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (32, 2, 7, 67, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:35.479666', '2012-10-30 14:08:51.034192');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (34, 2, 9, 69, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:35.510299', '2012-10-30 14:08:51.037616');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (36, 2, 11, 71, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:35.530304', '2012-10-30 14:08:51.041047');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (38, 2, 13, 73, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:35.553652', '2012-10-30 14:08:51.043709');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (39, 2, 14, 74, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:35.567368', '2012-10-30 14:08:51.046051');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (41, 2, 16, 76, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:35.607527', '2012-10-30 14:08:51.048384');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (43, 2, 18, 78, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:35.633138', '2012-10-30 14:08:51.050738');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (45, 2, 20, 80, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:35.664225', '2012-10-30 14:08:51.053056');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (47, 2, 22, 82, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:35.688968', '2012-10-30 14:08:51.055953');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (50, 2, 25, 85, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:35.730007', '2012-10-30 14:08:51.061759');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (52, 3, 2, 73, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:35.753439', '2012-10-30 14:08:51.064925');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (54, 3, 4, 75, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:35.778568', '2012-10-30 14:08:51.067474');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (56, 3, 6, 77, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:35.807953', '2012-10-30 14:08:51.069958');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (58, 3, 8, 79, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:35.832184', '2012-10-30 14:08:51.072461');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (60, 3, 10, 81, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:35.866681', '2012-10-30 14:08:51.074976');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (61, 3, 11, 82, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:35.875044', '2012-10-30 14:08:51.078471');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (63, 3, 13, 84, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:35.901125', '2012-10-30 14:08:51.081831');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (65, 3, 15, 86, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:35.93024', '2012-10-30 14:08:51.084942');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (67, 3, 17, 88, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:35.952409', '2012-10-30 14:08:51.08817');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (69, 3, 19, 90, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:35.976582', '2012-10-30 14:08:51.091396');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (72, 3, 22, 93, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:36.018916', '2012-10-30 14:08:51.097255');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (74, 3, 24, 95, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:36.044783', '2012-10-30 14:08:51.100109');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (76, 4, 1, 65.2999999999999972, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:36.075576', '2012-10-30 14:08:51.124893');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (78, 4, 3, 67.2999999999999972, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:36.098732', '2012-10-30 14:08:51.128564');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (80, 4, 5, 69.2999999999999972, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:36.121669', '2012-10-30 14:08:51.131112');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (82, 4, 7, 71.2999999999999972, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:36.141293', '2012-10-30 14:08:51.133578');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (83, 4, 8, 72.3000000000000114, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:36.151611', '2012-10-30 14:08:51.135983');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (85, 4, 10, 74.3000000000000114, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:36.188645', '2012-10-30 14:08:51.138849');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (87, 4, 12, 76.3000000000000114, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:36.221738', '2012-10-30 14:08:51.141936');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (89, 4, 14, 78.3000000000000114, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:36.242951', '2012-10-30 14:08:51.144525');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (93, 4, 18, 82.3000000000000114, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:36.297749', '2012-10-30 14:08:51.149305');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (94, 4, 19, 83.3000000000000114, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:36.310387', '2012-10-30 14:08:51.151703');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (96, 4, 21, 85.3000000000000114, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:36.331376', '2012-10-30 14:08:51.15411');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (98, 4, 23, 87.3000000000000114, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:36.355231', '2012-10-30 14:08:51.156486');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (100, 4, 25, 89.3000000000000114, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:36.390426', '2012-10-30 14:08:51.158856');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (102, 5, 2, 24.4800000000000004, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:36.421155', '2012-10-30 14:08:51.161278');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (104, 5, 4, 25.1600000000000001, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:36.440986', '2012-10-30 14:08:51.16436');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (105, 5, 5, 25.5000000000000036, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:36.454415', '2012-10-30 14:08:51.166802');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (107, 5, 7, 26.1800000000000033, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:36.474696', '2012-10-30 14:08:51.169373');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (5, 1, 5, 62, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:35.122821', '2012-10-30 14:08:51.171955');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (6, 1, 6, 63, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:35.131261', '2012-10-30 14:08:51.174447');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (117, 5, 17, 29.5800000000000018, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:36.631231', '2012-10-30 14:08:51.179261');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (119, 5, 19, 30.2600000000000016, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:36.668113', '2012-10-30 14:08:51.181612');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (121, 5, 21, 30.9400000000000013, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:36.72766', '2012-10-30 14:08:51.18385');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (124, 5, 24, 31.9600000000000009, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:36.777938', '2012-10-30 14:08:51.189188');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (126, 10, 1, 68, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:36.833067', '2012-10-30 14:08:51.192582');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (128, 10, 3, 70, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:36.854563', '2012-10-30 14:08:51.195096');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (130, 10, 5, 72, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:36.876853', '2012-10-30 14:08:51.198136');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (132, 10, 7, 74, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:36.89918', '2012-10-30 14:08:51.200536');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (134, 10, 9, 76, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:36.933902', '2012-10-30 14:08:51.202911');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (135, 10, 10, 77, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:36.945718', '2012-10-30 14:08:51.205328');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (137, 10, 12, 79, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:36.988561', '2012-10-30 14:08:51.208463');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (139, 10, 14, 81, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:37.008835', '2012-10-30 14:08:51.211864');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (143, 10, 18, 85, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:37.055457', '2012-10-30 14:08:51.218103');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (145, 10, 20, 87, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:37.090305', '2012-10-30 14:08:51.220544');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (146, 10, 21, 88, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:37.109947', '2012-10-30 14:08:51.223613');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (148, 10, 23, 90, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:37.143911', '2012-10-30 14:08:51.226576');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (150, 10, 25, 92, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:37.165716', '2012-10-30 14:08:51.228968');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (152, 11, 2, 71, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:37.190111', '2012-10-30 14:08:51.231409');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (154, 11, 4, 73, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:37.222034', '2012-10-30 14:08:51.233773');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (156, 11, 6, 75, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:37.245246', '2012-10-30 14:08:51.236146');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (157, 11, 7, 76, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:37.26555', '2012-10-30 14:08:51.238398');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (159, 11, 9, 78, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:37.288624', '2012-10-30 14:08:51.240743');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (161, 11, 11, 80, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:37.321588', '2012-10-30 14:08:51.243057');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (165, 11, 15, 84, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:37.376261', '2012-10-30 14:08:51.247633');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (167, 11, 17, 86, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:37.397023', '2012-10-30 14:08:51.250108');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (168, 11, 18, 87, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:37.408624', '2012-10-30 14:08:51.25318');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (170, 11, 20, 89, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:37.432474', '2012-10-30 14:08:51.256652');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (172, 11, 22, 91, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:37.46337', '2012-10-30 14:08:51.259903');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (174, 11, 24, 93, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:37.488916', '2012-10-30 14:08:51.2628');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (176, 12, 1, 60.3900000000000077, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:37.512508', '2012-10-30 14:08:51.265393');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (178, 12, 3, 62.3700000000000045, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:37.534403', '2012-10-30 14:08:51.267782');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (179, 12, 4, 63.3599999999999994, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:37.555041', '2012-10-30 14:08:51.270155');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (181, 12, 6, 65.3400000000000034, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:37.588809', '2012-10-30 14:08:51.272988');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (183, 12, 8, 67.3199999999999932, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:37.619186', '2012-10-30 14:08:51.276226');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (187, 12, 12, 71.2800000000000011, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:37.687558', '2012-10-30 14:08:51.281029');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (189, 12, 14, 73.2600000000000051, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:37.711127', '2012-10-30 14:08:51.283395');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (190, 12, 15, 74.25, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:37.723441', '2012-10-30 14:08:51.285701');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (192, 12, 17, 76.230000000000004, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:37.765765', '2012-10-30 14:08:51.288159');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (194, 12, 19, 78.210000000000008, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:37.789987', '2012-10-30 14:08:51.290454');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (196, 12, 21, 80.1899999999999977, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:37.822063', '2012-10-30 14:08:51.292793');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (198, 12, 23, 82.1700000000000017, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:37.84444', '2012-10-30 14:08:51.295145');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (200, 12, 25, 84.1500000000000057, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:37.875294', '2012-10-30 14:08:51.32223');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (201, 13, 1, 70, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:37.888201', '2012-10-30 14:08:51.326315');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (203, 13, 3, 72, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:37.923343', '2012-10-30 14:08:51.329929');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (207, 13, 7, 76, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:37.963336', '2012-10-30 14:08:51.33571');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (209, 13, 9, 78, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:37.99482', '2012-10-30 14:08:51.338009');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (211, 13, 11, 80, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:38.02009', '2012-10-30 14:08:51.340121');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (212, 13, 12, 81, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:38.033277', '2012-10-30 14:08:51.342681');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (214, 13, 14, 83, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:38.063469', '2012-10-30 14:08:51.34496');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (112, 5, 12, 27.8800000000000026, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:36.565756', '2012-10-30 14:08:51.347181');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (113, 5, 13, 28.2200000000000024, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:36.578923', '2012-10-30 14:08:51.349338');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (222, 13, 22, 91, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:38.176219', '2012-10-30 14:08:51.351453');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (224, 13, 24, 93, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:38.207968', '2012-10-30 14:08:51.354004');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (226, 14, 1, 67.5, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:38.233383', '2012-10-30 14:08:51.356558');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (228, 14, 3, 69.5, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:38.257822', '2012-10-30 14:08:51.358871');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (231, 14, 6, 72.5, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:38.298713', '2012-10-30 14:08:51.36402');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (233, 14, 8, 74.5, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:38.331181', '2012-10-30 14:08:51.366559');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (235, 14, 10, 76.5, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:38.353326', '2012-10-30 14:08:51.369026');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (239, 14, 14, 80.5, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:38.419906', '2012-10-30 14:08:51.375039');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (241, 14, 16, 82.5, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:38.455274', '2012-10-30 14:08:51.377929');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (242, 14, 17, 83.5, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:38.468505', '2012-10-30 14:08:51.380418');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (244, 14, 19, 85.5, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:38.498949', '2012-10-30 14:08:51.382835');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (246, 14, 21, 87.5, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:38.550444', '2012-10-30 14:08:51.385283');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (248, 14, 23, 89.5, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:38.580324', '2012-10-30 14:08:51.387684');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (250, 14, 25, 91.5, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:38.610711', '2012-10-30 14:08:51.390904');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (252, 15, 2, 69.5, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:38.631995', '2012-10-30 14:08:51.393763');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (253, 15, 3, 70.5, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:38.648236', '2012-10-30 14:08:51.396303');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (257, 15, 7, 74.5, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:38.712177', '2012-10-30 14:08:51.403116');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (259, 15, 9, 76.5, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:38.751992', '2012-10-30 14:08:51.406437');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (261, 15, 11, 78.5, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:38.788057', '2012-10-30 14:08:51.409392');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (263, 15, 13, 80.5, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:38.809719', '2012-10-30 14:08:51.411978');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (264, 15, 14, 81.5, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:38.824111', '2012-10-30 14:08:51.414718');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (266, 15, 16, 83.5, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:38.843059', '2012-10-30 14:08:51.417022');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (268, 15, 18, 85.5, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:38.864661', '2012-10-30 14:08:51.419488');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (270, 15, 20, 87.5, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:38.889208', '2012-10-30 14:08:51.422283');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (272, 15, 22, 89.5, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:38.914313', '2012-10-30 14:08:51.425342');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (274, 15, 24, 91.5, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:38.943352', '2012-10-30 14:08:51.428363');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (275, 15, 25, 92.5, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:38.952631', '2012-10-30 14:08:51.431605');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (279, 16, 4, 74, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:39.008363', '2012-10-30 14:08:51.436983');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (281, 16, 6, 76, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:39.036651', '2012-10-30 14:08:51.43975');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (283, 16, 8, 78, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:39.075981', '2012-10-30 14:08:51.443082');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (285, 16, 10, 80, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:39.111921', '2012-10-30 14:08:51.468551');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (286, 16, 11, 81, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:39.125946', '2012-10-30 14:08:51.471703');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (288, 16, 13, 83, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:39.163979', '2012-10-30 14:08:51.474311');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (290, 16, 15, 85, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:39.197709', '2012-10-30 14:08:51.47676');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (292, 16, 17, 87, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:39.219345', '2012-10-30 14:08:51.47913');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (294, 16, 19, 89, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:39.282849', '2012-10-30 14:08:51.481565');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (296, 16, 21, 91, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:39.323194', '2012-10-30 14:08:51.48404');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (297, 16, 22, 92, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:39.367788', '2012-10-30 14:08:51.48639');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (301, 17, 1, 72, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:39.42151', '2012-10-30 14:08:51.491455');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (303, 17, 3, 74, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:39.44377', '2012-10-30 14:08:51.493739');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (305, 17, 5, 76, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:39.475636', '2012-10-30 14:08:51.496044');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (307, 17, 7, 78, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:39.497295', '2012-10-30 14:08:51.498726');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (308, 17, 8, 79, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:39.5131', '2012-10-30 14:08:51.50164');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (310, 17, 10, 81, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:39.543666', '2012-10-30 14:08:51.505347');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (312, 17, 12, 83, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:39.566064', '2012-10-30 14:08:51.508336');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (314, 17, 14, 85, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:39.588376', '2012-10-30 14:08:51.510796');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (316, 17, 16, 87, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:39.607991', '2012-10-30 14:08:51.513314');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (318, 17, 18, 89, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:39.634971', '2012-10-30 14:08:51.515658');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (321, 17, 21, 92, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:39.665504', '2012-10-30 14:08:51.520897');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (219, 13, 19, 88, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:38.141595', '2012-10-30 14:08:51.523258');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (220, 13, 20, 89, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:38.152169', '2012-10-30 14:08:51.525548');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (329, 18, 4, 63.3200000000000074, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:39.779041', '2012-10-30 14:08:51.527916');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (331, 18, 6, 65.3200000000000074, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:39.809886', '2012-10-30 14:08:51.530334');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (333, 18, 8, 67.3200000000000074, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:39.834401', '2012-10-30 14:08:51.533569');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (335, 18, 10, 69.3200000000000074, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:39.86524', '2012-10-30 14:08:51.536886');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (337, 18, 12, 71.3200000000000074, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:39.89744', '2012-10-30 14:08:51.540288');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (338, 18, 13, 72.3199999999999932, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:39.910868', '2012-10-30 14:08:51.543209');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (340, 18, 15, 74.3199999999999932, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:39.931988', '2012-10-30 14:08:51.545568');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (342, 18, 17, 76.3200000000000074, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:39.954583', '2012-10-30 14:08:51.547977');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (346, 18, 21, 80.3200000000000074, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:40.00876', '2012-10-30 14:08:51.552573');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (348, 18, 23, 82.3200000000000074, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:40.032357', '2012-10-30 14:08:51.555149');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (349, 18, 24, 83.3200000000000074, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:40.041707', '2012-10-30 14:08:51.558723');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (351, 19, 1, 59.960000000000008, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:40.06408', '2012-10-30 14:08:51.561496');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (353, 19, 3, 61.960000000000008, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:40.087668', '2012-10-30 14:08:51.564183');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (355, 19, 5, 63.960000000000008, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:40.11275', '2012-10-30 14:08:51.566611');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (357, 19, 7, 65.960000000000008, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:40.130528', '2012-10-30 14:08:51.568999');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (359, 19, 9, 67.960000000000008, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:40.156255', '2012-10-30 14:08:51.571702');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (360, 19, 10, 68.960000000000008, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:40.167899', '2012-10-30 14:08:51.574143');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (362, 19, 12, 70.960000000000008, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:40.197565', '2012-10-30 14:08:51.577346');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (364, 19, 14, 72.960000000000008, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:40.230811', '2012-10-30 14:08:51.579716');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (366, 19, 16, 74.960000000000008, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:40.255322', '2012-10-30 14:08:51.58208');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (370, 19, 20, 78.960000000000008, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:40.299982', '2012-10-30 14:08:51.587313');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (371, 19, 21, 79.960000000000008, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:40.310964', '2012-10-30 14:08:51.590755');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (373, 19, 23, 81.960000000000008, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:40.342456', '2012-10-30 14:08:51.593585');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (375, 19, 25, 83.960000000000008, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:40.366168', '2012-10-30 14:08:51.5961');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (377, 20, 2, 68, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:40.397083', '2012-10-30 14:08:51.598998');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (379, 20, 4, 70, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:40.421525', '2012-10-30 14:08:51.601673');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (381, 20, 6, 72, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:40.453272', '2012-10-30 14:08:51.604264');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (382, 20, 7, 73, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:40.464479', '2012-10-30 14:08:51.606659');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (384, 20, 9, 75, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:40.489181', '2012-10-30 14:08:51.609319');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (386, 20, 11, 77, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:40.524656', '2012-10-30 14:08:51.611816');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (388, 20, 13, 79, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:40.553273', '2012-10-30 14:08:51.61413');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (392, 20, 17, 83, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:40.608596', '2012-10-30 14:08:51.618836');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (393, 20, 18, 84, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:40.622852', '2012-10-30 14:08:51.622301');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (395, 20, 20, 86, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:40.645982', '2012-10-30 14:08:51.625707');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (397, 20, 22, 88, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:40.686151', '2012-10-30 14:08:51.628927');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (399, 20, 24, 90, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:40.711238', '2012-10-30 14:08:51.631602');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (401, 6, 1, 71, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:40.731048', '2012-10-30 14:08:51.633849');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (403, 6, 3, 73, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:40.754736', '2012-10-30 14:08:51.636018');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (404, 6, 4, 74, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:40.764857', '2012-10-30 14:08:51.638427');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (406, 6, 6, 76, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:40.789731', '2012-10-30 14:08:51.641655');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (408, 6, 8, 78, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:40.831568', '2012-10-30 14:08:51.644126');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (410, 6, 10, 80, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:40.865139', '2012-10-30 14:08:51.646393');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (414, 6, 14, 84, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:40.910995', '2012-10-30 14:08:51.65093');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (415, 6, 15, 85, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:40.95346', '2012-10-30 14:08:51.653261');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (417, 6, 17, 87, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:40.981334', '2012-10-30 14:08:51.655676');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (419, 6, 19, 89, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:41.011336', '2012-10-30 14:08:51.658006');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (421, 6, 21, 91, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:41.036408', '2012-10-30 14:08:51.660382');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (423, 6, 23, 93, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:41.076338', '2012-10-30 14:08:51.66312');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (425, 6, 25, 95, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:41.100586', '2012-10-30 14:08:51.666766');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (426, 7, 1, 36, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:41.111235', '2012-10-30 14:08:51.692646');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (428, 7, 3, 37, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:41.142099', '2012-10-30 14:08:51.696798');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (326, 18, 1, 60.3200000000000074, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:39.732537', '2012-10-30 14:08:51.700466');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (7, 1, 7, 64, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:35.14099', '2012-10-30 14:08:51.707338');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (9, 1, 9, 66, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:35.165055', '2012-10-30 14:08:51.710762');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (11, 1, 11, 68, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:35.196888', '2012-10-30 14:08:51.713979');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (13, 1, 13, 70, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:35.219857', '2012-10-30 14:08:51.716939');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (15, 1, 15, 72, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:35.243193', '2012-10-30 14:08:51.720323');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (18, 1, 18, 75, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:35.287103', '2012-10-30 14:08:51.723127');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (20, 1, 20, 77, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:35.310842', '2012-10-30 14:08:51.725563');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (24, 1, 24, 81, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:35.355215', '2012-10-30 14:08:51.727934');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (26, 2, 1, 61, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:35.389788', '2012-10-30 14:08:51.730296');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (29, 2, 4, 64, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:35.431284', '2012-10-30 14:08:51.732717');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (31, 2, 6, 66, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:35.466132', '2012-10-30 14:08:51.735097');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (35, 2, 10, 70, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:35.523157', '2012-10-30 14:08:51.740273');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (37, 2, 12, 72, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:35.540492', '2012-10-30 14:08:51.742679');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (40, 2, 15, 75, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:35.589566', '2012-10-30 14:08:51.745063');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (431, 7, 6, 38.5, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:41.178656', '2012-10-30 14:08:51.750905');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (432, 7, 7, 39, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:41.192336', '2012-10-30 14:08:51.75426');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (434, 7, 9, 40, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:41.231336', '2012-10-30 14:08:51.757614');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (436, 7, 11, 41, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:41.253469', '2012-10-30 14:08:51.760534');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (438, 7, 13, 42, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:41.277259', '2012-10-30 14:08:51.762782');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (440, 7, 15, 43, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:41.302728', '2012-10-30 14:08:51.765184');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (442, 7, 17, 44, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:41.33616', '2012-10-30 14:08:51.767678');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (443, 7, 18, 44.5, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:41.342919', '2012-10-30 14:08:51.770215');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (445, 7, 20, 45.5, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:41.370206', '2012-10-30 14:08:51.773382');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (449, 7, 24, 47.5, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:41.423406', '2012-10-30 14:08:51.779154');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (451, 8, 1, 62.0400000000000063, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:41.442951', '2012-10-30 14:08:51.806304');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (453, 8, 3, 64.0400000000000063, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:41.465453', '2012-10-30 14:08:51.809524');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (454, 8, 4, 65.039999999999992, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:41.478019', '2012-10-30 14:08:51.812097');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (456, 8, 6, 67.0400000000000063, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:41.50008', '2012-10-30 14:08:51.814515');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (458, 8, 8, 69.039999999999992, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:41.534166', '2012-10-30 14:08:51.817151');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (460, 8, 10, 71.0400000000000063, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:41.553524', '2012-10-30 14:08:51.819743');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (462, 8, 12, 73.0400000000000063, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:41.577802', '2012-10-30 14:08:51.822288');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (464, 8, 14, 75.0400000000000063, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:41.633238', '2012-10-30 14:08:51.824928');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (465, 8, 15, 76.0400000000000063, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:41.643718', '2012-10-30 14:08:51.827337');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (467, 8, 17, 78.039999999999992, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:41.667241', '2012-10-30 14:08:51.829613');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (471, 8, 21, 82.039999999999992, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:41.724763', '2012-10-30 14:08:51.834368');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (473, 8, 23, 84.0400000000000063, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:41.767651', '2012-10-30 14:08:51.83658');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (475, 8, 25, 86.039999999999992, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:41.792789', '2012-10-30 14:08:51.839082');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (476, 9, 1, 65.5, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:41.808602', '2012-10-30 14:08:51.842313');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (478, 9, 3, 67.5, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:41.832047', '2012-10-30 14:08:51.845699');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (480, 9, 5, 69.5, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:41.865742', '2012-10-30 14:08:51.848941');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (482, 9, 7, 71.5, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:41.915979', '2012-10-30 14:08:51.851941');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (484, 9, 9, 73.5, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:41.941821', '2012-10-30 14:08:51.855059');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (486, 9, 11, 75.5, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:41.968236', '2012-10-30 14:08:51.858326');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (487, 9, 12, 76.5, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:41.990688', '2012-10-30 14:08:51.860906');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (489, 9, 14, 78.5, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:42.01981', '2012-10-30 14:08:51.863295');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (493, 9, 18, 82.5, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:42.077821', '2012-10-30 14:08:51.868192');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (495, 9, 20, 84.5, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:42.109197', '2012-10-30 14:08:51.870557');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (497, 9, 22, 86.5, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:42.134702', '2012-10-30 14:08:51.873231');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (498, 9, 23, 87.5, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:42.145878', '2012-10-30 14:08:51.875747');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (500, 9, 25, 89.5, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:42.180105', '2012-10-30 14:08:51.878103');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (2, 1, 2, 59, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:35.076082', '2012-10-30 14:08:51.880363');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (4, 1, 4, 61, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:35.110303', '2012-10-30 14:08:51.882815');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (51, 3, 1, 72, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:35.740826', '2012-10-30 14:08:51.885203');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (53, 3, 3, 74, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:35.765415', '2012-10-30 14:08:51.888721');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (55, 3, 5, 76, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:35.796344', '2012-10-30 14:08:51.891887');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (59, 3, 9, 80, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:35.844561', '2012-10-30 14:08:51.897611');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (62, 3, 12, 83, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:35.887411', '2012-10-30 14:08:51.90005');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (64, 3, 14, 85, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:35.918895', '2012-10-30 14:08:51.902514');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (66, 3, 16, 87, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:35.940609', '2012-10-30 14:08:51.905007');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (68, 3, 18, 89, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:35.964165', '2012-10-30 14:08:51.908522');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (70, 3, 20, 91, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:35.996305', '2012-10-30 14:08:51.91124');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (73, 3, 23, 94, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:36.032508', '2012-10-30 14:08:51.913723');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (75, 3, 25, 96, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:36.062756', '2012-10-30 14:08:51.916111');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (77, 4, 2, 66.3000000000000114, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:36.088639', '2012-10-30 14:08:51.918439');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (79, 4, 4, 68.3000000000000114, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:36.11173', '2012-10-30 14:08:51.920872');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (81, 4, 6, 70.3000000000000114, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:36.134167', '2012-10-30 14:08:51.923337');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (86, 4, 11, 75.2999999999999972, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:36.208467', '2012-10-30 14:08:51.928338');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (88, 4, 13, 77.2999999999999972, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:36.229949', '2012-10-30 14:08:51.93208');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (90, 4, 15, 79.3000000000000114, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:36.256563', '2012-10-30 14:08:51.935443');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (95, 4, 20, 84.3000000000000114, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:36.321537', '2012-10-30 14:08:51.940823');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (97, 4, 22, 86.3000000000000114, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:36.342203', '2012-10-30 14:08:51.942993');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (99, 4, 24, 88.3000000000000114, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:36.366873', '2012-10-30 14:08:51.945112');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (101, 5, 1, 24.1400000000000006, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:36.408437', '2012-10-30 14:08:51.94721');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (103, 5, 3, 24.8200000000000003, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:36.43428', '2012-10-30 14:08:51.949348');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (106, 5, 6, 25.8400000000000034, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:36.464927', '2012-10-30 14:08:51.951437');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (108, 5, 8, 26.5200000000000031, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:36.489296', '2012-10-30 14:08:51.953563');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (111, 5, 11, 27.5400000000000027, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:36.545302', '2012-10-30 14:08:51.956655');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (114, 5, 14, 28.5600000000000023, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:36.59784', '2012-10-30 14:08:51.959838');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (118, 5, 18, 29.9200000000000017, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:36.645607', '2012-10-30 14:08:51.964729');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (120, 5, 20, 30.6000000000000014, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:36.687946', '2012-10-30 14:08:51.967087');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (122, 5, 22, 31.2800000000000011, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:36.741922', '2012-10-30 14:08:51.969766');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (125, 5, 25, 32.3000000000000043, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:36.791343', '2012-10-30 14:08:51.97261');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (127, 10, 2, 69, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:36.841391', '2012-10-30 14:08:51.975342');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (129, 10, 4, 71, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:36.864609', '2012-10-30 14:08:51.97772');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (131, 10, 6, 73, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:36.887895', '2012-10-30 14:08:51.979984');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (133, 10, 8, 75, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:36.912354', '2012-10-30 14:08:51.982739');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (136, 10, 11, 78, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:36.966639', '2012-10-30 14:08:51.986006');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (138, 10, 13, 80, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:36.998682', '2012-10-30 14:08:51.988488');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (140, 10, 15, 82, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:37.020563', '2012-10-30 14:08:51.990763');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (144, 10, 19, 86, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:37.076514', '2012-10-30 14:08:51.995053');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (147, 10, 22, 89, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:37.123658', '2012-10-30 14:08:51.997165');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (149, 10, 24, 91, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:37.155507', '2012-10-30 14:08:51.999283');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (151, 11, 1, 70, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:37.177908', '2012-10-30 14:08:52.001593');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (153, 11, 3, 72, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:37.207833', '2012-10-30 14:08:52.004461');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (155, 11, 5, 74, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:37.23213', '2012-10-30 14:08:52.007129');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (158, 11, 8, 77, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:37.274762', '2012-10-30 14:08:52.009861');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (160, 11, 10, 79, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:37.301252', '2012-10-30 14:08:52.013053');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (162, 11, 12, 81, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:37.334351', '2012-10-30 14:08:52.016005');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (164, 11, 14, 83, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:37.36589', '2012-10-30 14:08:52.019892');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (166, 11, 16, 85, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:37.387019', '2012-10-30 14:08:52.023836');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (171, 11, 21, 90, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:37.443395', '2012-10-30 14:08:52.031543');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (173, 11, 23, 92, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:37.475965', '2012-10-30 14:08:52.034009');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (175, 11, 25, 94, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:37.499397', '2012-10-30 14:08:52.036468');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (46, 2, 21, 81, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:35.676772', '2012-10-30 14:08:52.039671');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (48, 2, 23, 83, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:35.707047', '2012-10-30 14:08:52.042761');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (184, 12, 9, 68.3100000000000023, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:37.641577', '2012-10-30 14:08:52.04527');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (186, 12, 11, 70.2900000000000063, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:37.67638', '2012-10-30 14:08:52.047658');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (188, 12, 13, 72.2700000000000102, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:37.69804', '2012-10-30 14:08:52.050074');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (191, 12, 16, 75.2399999999999949, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:37.746111', '2012-10-30 14:08:52.052448');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (193, 12, 18, 77.2199999999999989, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:37.77594', '2012-10-30 14:08:52.055045');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (197, 12, 22, 81.1800000000000068, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:37.831946', '2012-10-30 14:08:52.059851');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (199, 12, 24, 83.1599999999999966, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:37.856618', '2012-10-30 14:08:52.062324');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (202, 13, 2, 71, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:37.901', '2012-10-30 14:08:52.065994');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (204, 13, 4, 73, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:37.930326', '2012-10-30 14:08:52.069459');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (206, 13, 6, 75, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:37.953478', '2012-10-30 14:08:52.072909');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (208, 13, 8, 77, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:37.977121', '2012-10-30 14:08:52.075471');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (210, 13, 10, 79, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:38.00849', '2012-10-30 14:08:52.078033');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (213, 13, 13, 82, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:38.044682', '2012-10-30 14:08:52.080504');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (215, 13, 15, 84, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:38.075519', '2012-10-30 14:08:52.083021');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (216, 13, 16, 85, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:38.091177', '2012-10-30 14:08:52.086208');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (218, 13, 18, 87, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:38.123967', '2012-10-30 14:08:52.089468');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (223, 13, 23, 92, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:38.189987', '2012-10-30 14:08:52.118516');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (225, 13, 25, 94, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:38.221029', '2012-10-30 14:08:52.121122');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (227, 14, 2, 68.5, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:38.243047', '2012-10-30 14:08:52.124628');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (232, 14, 7, 73.5, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:38.313403', '2012-10-30 14:08:52.13027');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (234, 14, 9, 75.5, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:38.341783', '2012-10-30 14:08:52.13298');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (236, 14, 11, 77.5, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:38.365963', '2012-10-30 14:08:52.135623');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (238, 14, 13, 79.5, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:38.401815', '2012-10-30 14:08:52.138016');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (240, 14, 15, 81.5, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:38.434363', '2012-10-30 14:08:52.140316');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (245, 14, 20, 86.5, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:38.510508', '2012-10-30 14:08:52.142694');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (247, 14, 22, 88.5, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:38.564004', '2012-10-30 14:08:52.145038');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (249, 14, 24, 90.5, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:38.597288', '2012-10-30 14:08:52.147391');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (251, 15, 1, 68.5, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:38.620392', '2012-10-30 14:08:52.149809');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (256, 15, 6, 73.5, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:38.690831', '2012-10-30 14:08:52.156446');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (258, 15, 8, 75.5, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:38.73567', '2012-10-30 14:08:52.159751');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (260, 15, 10, 77.5, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:38.778169', '2012-10-30 14:08:52.162357');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (262, 15, 12, 79.5, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:38.797224', '2012-10-30 14:08:52.164668');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (265, 15, 15, 82.5, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:38.831055', '2012-10-30 14:08:52.166984');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (267, 15, 17, 84.5, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:38.855974', '2012-10-30 14:08:52.169552');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (269, 15, 19, 86.5, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:38.875478', '2012-10-30 14:08:52.172822');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (271, 15, 21, 88.5, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:38.901032', '2012-10-30 14:08:52.175994');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (273, 15, 23, 90.5, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:38.93141', '2012-10-30 14:08:52.178569');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (276, 16, 1, 71, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:38.966826', '2012-10-30 14:08:52.180914');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (278, 16, 3, 73, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:38.992026', '2012-10-30 14:08:52.1835');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (282, 16, 7, 77, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:39.05951', '2012-10-30 14:08:52.188636');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (284, 16, 9, 79, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:39.090931', '2012-10-30 14:08:52.191378');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (287, 16, 12, 82, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:39.151448', '2012-10-30 14:08:52.194808');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (289, 16, 14, 84, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:39.178829', '2012-10-30 14:08:52.198168');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (291, 16, 16, 86, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:39.212357', '2012-10-30 14:08:52.201431');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (293, 16, 18, 88, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:39.232981', '2012-10-30 14:08:52.204721');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (295, 16, 20, 90, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:39.302717', '2012-10-30 14:08:52.208027');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (298, 16, 23, 93, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:39.377187', '2012-10-30 14:08:52.210652');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (300, 16, 25, 95, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:39.408529', '2012-10-30 14:08:52.213245');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (302, 17, 2, 73, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:39.431776', '2012-10-30 14:08:52.215654');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (304, 17, 4, 75, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:39.464164', '2012-10-30 14:08:52.21806');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (309, 17, 9, 80, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:39.530778', '2012-10-30 14:08:52.222921');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (180, 12, 5, 64.3500000000000085, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:37.568694', '2012-10-30 14:08:52.225243');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (182, 12, 7, 66.3299999999999983, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:37.59769', '2012-10-30 14:08:52.227546');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (317, 17, 17, 88, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:39.621151', '2012-10-30 14:08:52.229847');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (320, 17, 20, 91, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:39.6565', '2012-10-30 14:08:52.232126');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (322, 17, 22, 93, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:39.675195', '2012-10-30 14:08:52.234697');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (323, 17, 23, 94, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:39.690686', '2012-10-30 14:08:52.23705');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (325, 17, 25, 96, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:39.72331', '2012-10-30 14:08:52.2406');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (328, 18, 3, 62.3200000000000003, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:39.766539', '2012-10-30 14:08:52.243889');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (330, 18, 5, 64.3200000000000074, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:39.797006', '2012-10-30 14:08:52.247153');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (334, 18, 9, 68.3200000000000074, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:39.855097', '2012-10-30 14:08:52.252444');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (336, 18, 11, 70.3199999999999932, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:39.880524', '2012-10-30 14:08:52.255483');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (339, 18, 14, 73.3200000000000074, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:39.923736', '2012-10-30 14:08:52.258606');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (341, 18, 16, 75.3200000000000074, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:39.941608', '2012-10-30 14:08:52.261181');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (343, 18, 18, 77.3200000000000074, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:39.966896', '2012-10-30 14:08:52.263705');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (345, 18, 20, 79.3200000000000074, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:39.990975', '2012-10-30 14:08:52.26642');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (347, 18, 22, 81.3200000000000074, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:40.020803', '2012-10-30 14:08:52.268634');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (350, 18, 25, 84.3200000000000074, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:40.055124', '2012-10-30 14:08:52.270989');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (352, 19, 2, 60.9600000000000009, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:40.076907', '2012-10-30 14:08:52.273352');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (354, 19, 4, 62.960000000000008, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:40.099356', '2012-10-30 14:08:52.275509');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (356, 19, 6, 64.960000000000008, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:40.118936', '2012-10-30 14:08:52.277653');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (361, 19, 11, 69.960000000000008, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:40.186516', '2012-10-30 14:08:52.282966');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (363, 19, 13, 71.960000000000008, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:40.219741', '2012-10-30 14:08:52.285464');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (365, 19, 15, 73.960000000000008, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:40.241763', '2012-10-30 14:08:52.287992');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (369, 19, 19, 77.960000000000008, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:40.290146', '2012-10-30 14:08:52.293068');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (372, 19, 22, 80.960000000000008, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:40.32401', '2012-10-30 14:08:52.295512');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (374, 19, 24, 82.960000000000008, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:40.353013', '2012-10-30 14:08:52.297829');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (378, 20, 3, 69, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:40.408865', '2012-10-30 14:08:52.300336');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (380, 20, 5, 71, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:40.434396', '2012-10-30 14:08:52.30271');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (383, 20, 8, 74, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:40.476126', '2012-10-30 14:08:52.305694');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (385, 20, 10, 76, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:40.501749', '2012-10-30 14:08:52.308767');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (387, 20, 12, 78, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:40.542684', '2012-10-30 14:08:52.311195');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (389, 20, 14, 80, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:40.565811', '2012-10-30 14:08:52.313505');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (394, 20, 19, 85, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:40.633584', '2012-10-30 14:08:52.318296');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (396, 20, 21, 87, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:40.676633', '2012-10-30 14:08:52.32067');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (398, 20, 23, 89, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:40.699129', '2012-10-30 14:08:52.323302');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (400, 20, 25, 91, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:40.719732', '2012-10-30 14:08:52.326042');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (402, 6, 2, 72, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:40.741812', '2012-10-30 14:08:52.329654');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (405, 6, 5, 75, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:40.775259', '2012-10-30 14:08:52.333098');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (407, 6, 7, 77, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:40.813435', '2012-10-30 14:08:52.336362');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (409, 6, 9, 79, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:40.844052', '2012-10-30 14:08:52.338903');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (411, 6, 11, 81, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:40.876178', '2012-10-30 14:08:52.341353');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (413, 6, 13, 83, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:40.900486', '2012-10-30 14:08:52.343768');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (416, 6, 16, 86, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:40.967687', '2012-10-30 14:08:52.34663');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (420, 6, 20, 90, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:41.022842', '2012-10-30 14:08:52.35259');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (422, 6, 22, 92, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:41.059614', '2012-10-30 14:08:52.355108');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (424, 6, 24, 94, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:41.089842', '2012-10-30 14:08:52.357528');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (427, 7, 2, 36.5, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:41.129505', '2012-10-30 14:08:52.359951');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (429, 7, 4, 37.5, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:41.155986', '2012-10-30 14:08:52.362582');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (430, 7, 5, 38, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:41.167719', '2012-10-30 14:08:52.365075');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (433, 7, 8, 39.5, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:41.215468', '2012-10-30 14:08:52.367618');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (435, 7, 10, 40.5, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:41.242991', '2012-10-30 14:08:52.370319');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (437, 7, 12, 41.5, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:41.265233', '2012-10-30 14:08:52.373787');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (439, 7, 14, 42.5, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:41.288298', '2012-10-30 14:08:52.377138');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (441, 7, 16, 43.5, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:41.323568', '2012-10-30 14:08:52.379976');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (315, 17, 15, 86, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:39.598132', '2012-10-30 14:08:52.386218');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (324, 17, 24, 95, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:39.710592', '2012-10-30 14:08:52.389175');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (1, 1, 1, 58, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:35.038896', '2012-10-30 14:08:52.391517');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (44, 2, 19, 79, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:35.642716', '2012-10-30 14:08:52.393813');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (109, 5, 9, 26.860000000000003, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:36.51039', '2012-10-30 14:08:52.396207');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (177, 12, 2, 61.3800000000000097, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:37.521007', '2012-10-30 14:08:52.398792');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (243, 14, 18, 84.5, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:38.487863', '2012-10-30 14:08:52.421978');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (311, 17, 11, 82, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:39.554311', '2012-10-30 14:08:52.424527');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (376, 20, 1, 67, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:40.379726', '2012-10-30 14:08:52.42685');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (446, 7, 21, 46, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:41.387052', '2012-10-30 14:08:52.429047');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (488, 9, 13, 77.5, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:42.009326', '2012-10-30 14:08:52.434158');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (490, 9, 15, 79.5, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:42.030767', '2012-10-30 14:08:52.437388');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (492, 9, 17, 81.5, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:42.05824', '2012-10-30 14:08:52.440086');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (494, 9, 19, 83.5, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:42.088517', '2012-10-30 14:08:52.442475');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (496, 9, 21, 85.5, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:42.119603', '2012-10-30 14:08:52.444898');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (499, 9, 24, 88.5, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:42.167025', '2012-10-30 14:08:52.447296');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (3, 1, 3, 60, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:35.090728', '2012-10-30 14:08:52.449589');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (110, 5, 10, 27.2000000000000028, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:36.52358', '2012-10-30 14:08:52.452027');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (217, 13, 17, 86, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:38.108622', '2012-10-30 14:08:52.455494');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (444, 7, 19, 45, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:41.353071', '2012-10-30 14:08:52.459509');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (448, 7, 23, 47, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:41.411154', '2012-10-30 14:08:52.462864');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (452, 8, 2, 63.0400000000000063, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:41.456349', '2012-10-30 14:08:52.496544');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (455, 8, 5, 66.0400000000000063, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:41.490668', '2012-10-30 14:08:52.500951');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (457, 8, 7, 68.0400000000000063, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:41.514463', '2012-10-30 14:08:52.505453');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (22, 1, 22, 79, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:35.329936', '2012-10-30 14:05:06.359276');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (8, 1, 8, 65, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:35.152348', '2012-10-30 14:08:50.908188');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (27, 2, 2, 62, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:35.40716', '2012-10-30 14:08:51.025811');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (49, 2, 24, 84, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:35.723137', '2012-10-30 14:08:51.059241');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (71, 3, 21, 92, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:36.007623', '2012-10-30 14:08:51.09439');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (91, 4, 16, 80.3000000000000114, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:36.275312', '2012-10-30 14:08:51.146892');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (115, 5, 15, 28.9000000000000021, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:36.607933', '2012-10-30 14:08:51.176867');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (123, 5, 23, 31.620000000000001, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:36.757209', '2012-10-30 14:08:51.185978');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (141, 10, 16, 83, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:37.034454', '2012-10-30 14:08:51.215159');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (163, 11, 13, 82, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:37.352537', '2012-10-30 14:08:51.245295');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (185, 12, 10, 69.3000000000000114, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:37.656881', '2012-10-30 14:08:51.278726');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (205, 13, 5, 74, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:37.941124', '2012-10-30 14:08:51.333022');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (230, 14, 5, 71.5, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:38.285602', '2012-10-30 14:08:51.361201');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (237, 14, 12, 78.5, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:38.379137', '2012-10-30 14:08:51.371521');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (255, 15, 5, 72.5, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:38.675091', '2012-10-30 14:08:51.399705');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (277, 16, 2, 72, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:38.976107', '2012-10-30 14:08:51.434361');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (299, 16, 24, 94, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:39.39095', '2012-10-30 14:08:51.489121');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (319, 17, 19, 90, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:39.643863', '2012-10-30 14:08:51.518272');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (344, 18, 19, 78.3200000000000074, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:39.977607', '2012-10-30 14:08:51.550284');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (368, 19, 18, 76.960000000000008, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:40.27688', '2012-10-30 14:08:51.584469');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (390, 20, 15, 81, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:40.577408', '2012-10-30 14:08:51.616482');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (412, 6, 12, 82, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:40.88874', '2012-10-30 14:08:51.64852');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (327, 18, 2, 61.3200000000000074, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:39.746376', '2012-10-30 14:08:51.703774');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (33, 2, 8, 68, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:35.498979', '2012-10-30 14:08:51.737734');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (42, 2, 17, 77, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:35.620798', '2012-10-30 14:08:51.747396');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (447, 7, 22, 46.5, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:41.398241', '2012-10-30 14:08:51.776447');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (469, 8, 19, 80.0400000000000063, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:41.690864', '2012-10-30 14:08:51.832053');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (491, 9, 16, 80.5, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:42.044806', '2012-10-30 14:08:51.865784');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (57, 3, 7, 78, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:35.820685', '2012-10-30 14:08:51.894908');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (84, 4, 9, 73.2999999999999972, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:36.168358', '2012-10-30 14:08:51.92579');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (92, 4, 17, 81.3000000000000114, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:36.286117', '2012-10-30 14:08:51.938466');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (116, 5, 16, 29.240000000000002, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:36.620249', '2012-10-30 14:08:51.962248');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (142, 10, 17, 84, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:37.044097', '2012-10-30 14:08:51.992902');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (169, 11, 19, 88, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:37.420027', '2012-10-30 14:08:52.028063');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (195, 12, 20, 79.2000000000000028, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:37.809466', '2012-10-30 14:08:52.057473');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (221, 13, 21, 90, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:38.164747', '2012-10-30 14:08:52.115652');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (229, 14, 4, 70.5, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:38.276437', '2012-10-30 14:08:52.127606');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (254, 15, 4, 71.5, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:38.664348', '2012-10-30 14:08:52.1531');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (280, 16, 5, 75, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:39.021473', '2012-10-30 14:08:52.185835');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (306, 17, 6, 77, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:39.485667', '2012-10-30 14:08:52.220439');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (332, 18, 7, 66.3199999999999932, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:39.822244', '2012-10-30 14:08:52.250057');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (358, 19, 8, 66.960000000000008, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:40.141993', '2012-10-30 14:08:52.28013');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (367, 19, 17, 75.960000000000008, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:40.264352', '2012-10-30 14:08:52.290386');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (391, 20, 16, 82, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:40.590873', '2012-10-30 14:08:52.315883');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (418, 6, 18, 88, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:40.999373', '2012-10-30 14:08:52.349789');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (313, 17, 13, 84, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:39.579077', '2012-10-30 14:08:52.382896');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (485, 9, 10, 74.5, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:41.953103', '2012-10-30 14:08:52.43131');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (463, 8, 13, 74.039999999999992, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:41.620075', '2012-10-30 14:08:52.515154');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (466, 8, 16, 77.0400000000000063, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:41.655478', '2012-10-30 14:08:52.518592');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (468, 8, 18, 79.0400000000000063, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:41.676237', '2012-10-30 14:08:52.521418');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (470, 8, 20, 81.0400000000000063, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:41.711411', '2012-10-30 14:08:52.523939');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (472, 8, 22, 83.0400000000000063, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:41.747113', '2012-10-30 14:08:52.526431');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (474, 8, 24, 85.0400000000000063, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:41.777762', '2012-10-30 14:08:52.528782');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (477, 9, 2, 66.5, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:41.819927', '2012-10-30 14:08:52.531258');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (479, 9, 4, 68.5, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:41.846749', '2012-10-30 14:08:52.53392');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (481, 9, 6, 70.5, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:41.900627', '2012-10-30 14:08:52.53645');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (483, 9, 8, 72.5, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:41.93181', '2012-10-30 14:08:52.538799');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (450, 7, 25, 48, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:41.431222', '2012-10-30 14:08:52.466194');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (459, 8, 9, 70.039999999999992, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:41.545572', '2012-10-30 14:08:52.509116');
INSERT INTO objective_scores (id, objective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, goal, created_at, updated_at) VALUES (461, 8, 11, 72.0400000000000063, 0, 25, 25, 75, 75, 100, NULL, 60, NULL, 75, '2012-08-09 19:51:41.5666', '2012-10-30 14:08:52.512331');


--
-- TOC entry 2269 (class 0 OID 17561)
-- Dependencies: 170
-- Data for Name: objectives; Type: TABLE DATA; Schema: public; Owner: bmo
--

INSERT INTO objectives (id, name, acronym, weight, score, perspective_id, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, measurement, show, "greenButton", "yellowButton", "redButton", col, "row", created_at, updated_at) VALUES (9, 'Compromiso como Aliados de Negocio', 'Compromiso como Aliados de Negocio', 25, NULL, 2, 0, 25, 25, 75, 75, 100, NULL, NULL, NULL, NULL, true, 'alc/CompromisosComo-verde.png', 'alc/CompromisosComo-amarillo.png', 'alc/CompromisosComo-rojo.png', 5, 1, '2012-08-09 16:18:37.102994', '2012-08-09 20:24:31.528222');
INSERT INTO objectives (id, name, acronym, weight, score, perspective_id, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, measurement, show, "greenButton", "yellowButton", "redButton", col, "row", created_at, updated_at) VALUES (8, 'Optimizar Relaciones con Clientes y Clientes de Clientes', 'Optimizar Relaciones con Clientes y Clientes de Clientes', 25, NULL, 2, 0, 25, 25, 75, 75, 100, NULL, NULL, NULL, NULL, true, 'alc/optimizarRelaciones-verde.png', 'alc/optimizarRelaciones-amarillo.png', 'alc/optimizarRelaciones-rojo.png', 4, 1, '2012-08-09 16:18:18.345862', '2012-08-09 20:24:31.539977');
INSERT INTO objectives (id, name, acronym, weight, score, perspective_id, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, measurement, show, "greenButton", "yellowButton", "redButton", col, "row", created_at, updated_at) VALUES (17, 'Tener la TIC y de Procesos Clave que apalanque los negocios', 'Tener la TIC y de Procesos Clave que apalanque los negocios', 25, NULL, 4, 0, 25, 25, 75, 75, 100, NULL, NULL, NULL, NULL, true, 'alc/TenerLa-verde.png', 'alc/TenerLa-amarillo.png', 'alc/TenerLa-rojo.png', 2, 2, '2012-08-09 16:24:31.264119', '2012-08-09 20:24:31.651185');
INSERT INTO objectives (id, name, acronym, weight, score, perspective_id, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, measurement, show, "greenButton", "yellowButton", "redButton", col, "row", created_at, updated_at) VALUES (19, 'Tener/Retener/Desarrollar Gente con Competencias Requeridas', 'Tener/Retener/Desarrollar Gente con Competencias Requeridas', 25, NULL, 4, 0, 25, 25, 75, 75, 100, NULL, NULL, NULL, NULL, true, 'alc/tenerPersonal-verde.png', 'alc/tenerPersonal-amarillo.png', 'alc/tenerPersonal-rojo.png', 4, 2, '2012-08-09 16:27:56.490954', '2012-08-09 20:24:31.628942');
INSERT INTO objectives (id, name, acronym, weight, score, perspective_id, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, measurement, show, "greenButton", "yellowButton", "redButton", col, "row", created_at, updated_at) VALUES (20, 'Modelo de Negocio – Organización que apalanque la estrategia', 'Modelo de Negocio – Organización que apalanque la estrategia', 25, NULL, 4, 0, 25, 25, 75, 75, 100, NULL, NULL, NULL, NULL, true, 'alc/modeloNegocio-verde.png', 'alc/modeloNegocio-amarillo.png', 'alc/modeloNegocio-rojo.png', 3, 2, '2012-08-09 16:28:16.914435', '2012-08-09 20:24:31.662009');
INSERT INTO objectives (id, name, acronym, weight, score, perspective_id, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, measurement, show, "greenButton", "yellowButton", "redButton", col, "row", created_at, updated_at) VALUES (6, 'Crecer contratación de Servicios por Clientes regionalmente', 'Crecer contratación de Servicios por Clientes regionalmente', 25, NULL, 2, 0, 25, 25, 75, 75, 100, NULL, NULL, NULL, NULL, true, 'alc/crecerContra-verde.png', 'alc/crecerContra-amarillo.png', 'alc/crecerContra-rojo.png', 2, 1, '2012-08-09 16:17:36.83348', '2012-08-09 20:24:31.572287');
INSERT INTO objectives (id, name, acronym, weight, score, perspective_id, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, measurement, show, "greenButton", "yellowButton", "redButton", col, "row", created_at, updated_at) VALUES (7, 'Incrementar participación en mercados Regionales Objetivo', 'Incrementar participación en mercados Regionales Objetivo', 25, NULL, 2, 0, 25, 25, 75, 75, 100, NULL, NULL, NULL, NULL, true, 'alc/incrementarParticipacion-verde.png', 'alc/incrementarParticipacion-amarillo.png', 'alc/incrementarParticipacion-rojo.png', 3, 1, '2012-08-09 16:17:49.73589', '2012-08-09 20:24:31.56088');
INSERT INTO objectives (id, name, acronym, weight, score, perspective_id, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, measurement, show, "greenButton", "yellowButton", "redButton", col, "row", created_at, updated_at) VALUES (18, 'Desarrollar Cultura de Servicios/Negocios y Clima', 'Desarrollar Cultura de Servicios/Negocios y Clima', 25, NULL, 4, 0, 25, 25, 75, 75, 100, NULL, NULL, NULL, NULL, true, 'alc/desarrollarCultura-verde.png', 'alc/desarrollarCultura-amarillo.png', 'alc/desarrollarCultura-rojo.png', 3, 1, '2012-08-09 16:27:19.273901', '2012-08-09 20:24:31.639239');
INSERT INTO objectives (id, name, acronym, weight, score, perspective_id, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, measurement, show, "greenButton", "yellowButton", "redButton", col, "row", created_at, updated_at) VALUES (10, 'Maximizar el crecimiento en LACT y el Caribe', 'Maximizar el crecimiento en LACT y el Caribe', 25, NULL, 3, 0, 25, 25, 75, 75, 100, NULL, NULL, NULL, NULL, true, 'alc/maximizarCrecim-verde.png', 'alc/maximizarCrecim-amarillo.png', 'alc/maximizarCrecim-rojo.png', 1, 2, '2012-08-09 16:19:24.070309', '2012-10-30 14:17:41.359284');
INSERT INTO objectives (id, name, acronym, weight, score, perspective_id, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, measurement, show, "greenButton", "yellowButton", "redButton", col, "row", created_at, updated_at) VALUES (3, 'Optimizar las Inversiones', 'Optimizar las Inversiones', 25, NULL, 1, 0, 25, 25, 75, 75, 100, NULL, NULL, NULL, NULL, true, 'alc/OptimizarInverciones-verde.png', 'alc/OptimizarInverciones-amarillo.png', 'alc/OptimizarInverciones-rojo.png', 4, 2, '2012-08-09 16:04:09.278128', '2012-10-30 14:17:41.362903');
INSERT INTO objectives (id, name, acronym, weight, score, perspective_id, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, measurement, show, "greenButton", "yellowButton", "redButton", col, "row", created_at, updated_at) VALUES (11, 'Desarrollar el Modelo Glocal', 'Desarrollar el Modelo Glocal', 25, NULL, 3, 0, 25, 25, 75, 75, 100, NULL, NULL, NULL, NULL, true, 'alc/desarrollarModeloGlocal-verde.png', 'alc/desarrollarModeloGlocal-amarillo.png', 'alc/desarrollarModeloGlocal-rojo.png', 2, 1, '2012-08-09 16:19:45.33469', '2012-10-30 14:17:41.365516');
INSERT INTO objectives (id, name, acronym, weight, score, perspective_id, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, measurement, show, "greenButton", "yellowButton", "redButton", col, "row", created_at, updated_at) VALUES (2, 'Crecer en Ingresos rentables Vzla-Lact', 'Crecer en Ingresos rentables Vzla-Lact', 25, NULL, 1, 0, 25, 25, 75, 75, 100, NULL, NULL, NULL, NULL, true, 'alc/CrecerIngresos-verde.png', 'alc/CrecerIngresos-amarillo.png', 'alc/CrecerIngresos-rojo.png', 3, 2, '2012-08-09 16:03:50.383442', '2012-10-30 14:17:41.369248');
INSERT INTO objectives (id, name, acronym, weight, score, perspective_id, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, measurement, show, "greenButton", "yellowButton", "redButton", col, "row", created_at, updated_at) VALUES (16, 'Maximizar la eficiencia de ALC y de las Empresas del Grupo ', 'Maximizar la eficiencia de ALC y de las Empresas del Grupo ', 25, NULL, 3, 0, 25, 25, 75, 75, 100, NULL, NULL, NULL, NULL, true, 'alc/maximizarEficALC-verde.png', 'alc/maximizarEficALC-amarillo.png', 'alc/maximizarEficALC-rojo.png', 6, 2, '2012-08-09 16:21:07.662254', '2012-10-30 14:17:41.373401');
INSERT INTO objectives (id, name, acronym, weight, score, perspective_id, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, measurement, show, "greenButton", "yellowButton", "redButton", col, "row", created_at, updated_at) VALUES (14, 'Innovar para adelantar y sobrepasar Expectativas de Clientes', 'Innovar para adelantar y sobrepasar Expectativas de Clientes', 25, NULL, 3, 0, 25, 25, 75, 75, 100, NULL, NULL, NULL, NULL, true, 'alc/innovarPara-verde.png', 'alc/innovarPara-amarillo.png', 'alc/innovarPara-rojo.png', 4, 3, '2012-08-09 16:20:38.091479', '2012-10-30 14:17:41.376072');
INSERT INTO objectives (id, name, acronym, weight, score, perspective_id, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, measurement, show, "greenButton", "yellowButton", "redButton", col, "row", created_at, updated_at) VALUES (5, 'Disminuir Dependencia Venezuela', 'Disminuir Dependencia Venezuela', 25, NULL, 1, 0, 25, 25, 75, 75, 100, NULL, NULL, NULL, NULL, true, 'alc/disminuirDepen-verde.png', 'alc/disminuirDepen-amarillo.png', 'alc/disminuirDepen-rojo.png', 2, 2, '2012-08-09 16:06:15.900916', '2012-10-30 14:17:41.379191');
INSERT INTO objectives (id, name, acronym, weight, score, perspective_id, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, measurement, show, "greenButton", "yellowButton", "redButton", col, "row", created_at, updated_at) VALUES (13, 'Maximizar Calidad de Servicios vía nuestros diferenciadores', 'Maximizar Calidad de Servicios vía nuestros diferenciadores', 25, NULL, 3, 0, 25, 25, 75, 75, 100, NULL, NULL, NULL, NULL, true, 'alc/maximizarCalidadServicio-verde.png', 'alc/maximizarCalidadServicio-amarillo.png', 'alc/maximizarCalidadServicio-rojo.png', 4, 1, '2012-08-09 16:20:24.205482', '2012-10-30 14:17:41.380831');
INSERT INTO objectives (id, name, acronym, weight, score, perspective_id, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, measurement, show, "greenButton", "yellowButton", "redButton", col, "row", created_at, updated_at) VALUES (15, 'Desarrollar y Mantener Alianzas Clave para apalancar éxito', 'Desarrollar y Mantener Alianzas Clave para apalancar éxito', 25, NULL, 3, 0, 25, 25, 75, 75, 100, NULL, NULL, NULL, NULL, true, 'alc/identifcarDesarrollarAlianzas-verde.png', 'alc/identifcarDesarrollarAlianzas-amarillo.png', 'alc/identifcarDesarrollarAlianzas-rojo.png', 5, 2, '2012-08-09 16:20:53.607376', '2012-10-30 14:17:41.382457');
INSERT INTO objectives (id, name, acronym, weight, score, perspective_id, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, measurement, show, "greenButton", "yellowButton", "redButton", col, "row", created_at, updated_at) VALUES (4, 'Tener costos competitivos a nivel internacional', 'Tener costos competitivos a nivel internacional', 25, NULL, 1, 0, 25, 25, 75, 75, 100, NULL, NULL, NULL, NULL, true, 'alc/TenerCostos-verde.png', 'alc/TenerCostos-amarillo.png', 'alc/TenerCostos-rojo.png', 5, 2, '2012-08-09 16:04:25.283355', '2012-10-30 14:17:41.384759');
INSERT INTO objectives (id, name, acronym, weight, score, perspective_id, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, measurement, show, "greenButton", "yellowButton", "redButton", col, "row", created_at, updated_at) VALUES (12, 'Obtener Clientes y Retener Actuales en Mercados Objetivo', 'Obtener Clientes y Retener Actuales en Mercados Objetivo', 25, NULL, 3, 0, 25, 25, 75, 75, 100, NULL, NULL, NULL, NULL, true, 'alc/ObtCliente-verde.png', 'alc/ObtCliente-amarillo.png', 'alc/ObtCliente-rojo.png', 3, 2, '2012-08-09 16:20:02.625727', '2012-10-30 14:17:41.387099');
INSERT INTO objectives (id, name, acronym, weight, score, perspective_id, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, progress, baseline, growth, measurement, show, "greenButton", "yellowButton", "redButton", col, "row", created_at, updated_at) VALUES (1, 'Maximizar Valor Grupo ALC', 'Maximizar Valor Grupo ALC', 25, NULL, 1, 0, 25, 25, 75, 75, 100, NULL, NULL, NULL, NULL, true, 'alc/maximizarGrupo-verde.png', 'alc/maximizarGrupo-amarillo.png', 'alc/maximizarGrupo-rojo.png', 4, 1, '2012-08-09 16:03:31.175038', '2012-10-30 14:17:41.389183');


--
-- TOC entry 2279 (class 0 OID 17644)
-- Dependencies: 188
-- Data for Name: operations; Type: TABLE DATA; Schema: public; Owner: bmo
--



--
-- TOC entry 2271 (class 0 OID 17581)
-- Dependencies: 174
-- Data for Name: perspective_scores; Type: TABLE DATA; Schema: public; Owner: bmo
--

INSERT INTO perspective_scores (id, perspective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, goal, created_at, updated_at) VALUES (50, 2, 25, 84, 0, 25, 25, 75, 75, 100, NULL, '2012-08-09 19:59:55.164608', '2012-08-09 19:59:55.164608');
INSERT INTO perspective_scores (id, perspective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, goal, created_at, updated_at) VALUES (2, 1, 2, 61.0000000000000071, 0, 25, 25, 75, 75, 100, NULL, '2012-08-09 19:59:54.502932', '2012-08-09 20:00:17.188445');
INSERT INTO perspective_scores (id, perspective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, goal, created_at, updated_at) VALUES (3, 1, 3, 62, 0, 25, 25, 75, 75, 100, NULL, '2012-08-09 19:59:54.521842', '2012-08-09 20:00:17.206905');
INSERT INTO perspective_scores (id, perspective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, goal, created_at, updated_at) VALUES (4, 1, 4, 63.0000000000000071, 0, 25, 25, 75, 75, 100, NULL, '2012-08-09 19:59:54.53249', '2012-08-09 20:00:17.238898');
INSERT INTO perspective_scores (id, perspective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, goal, created_at, updated_at) VALUES (5, 1, 5, 64, 0, 25, 25, 75, 75, 100, NULL, '2012-08-09 19:59:54.551195', '2012-08-09 20:00:17.270312');
INSERT INTO perspective_scores (id, perspective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, goal, created_at, updated_at) VALUES (6, 1, 6, 65, 0, 25, 25, 75, 75, 100, NULL, '2012-08-09 19:59:54.563231', '2012-08-09 20:00:17.302801');
INSERT INTO perspective_scores (id, perspective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, goal, created_at, updated_at) VALUES (7, 1, 7, 66, 0, 25, 25, 75, 75, 100, NULL, '2012-08-09 19:59:54.578114', '2012-08-09 20:00:17.343281');
INSERT INTO perspective_scores (id, perspective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, goal, created_at, updated_at) VALUES (8, 1, 8, 67, 0, 25, 25, 75, 75, 100, NULL, '2012-08-09 19:59:54.595438', '2012-08-09 20:00:17.363531');
INSERT INTO perspective_scores (id, perspective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, goal, created_at, updated_at) VALUES (9, 1, 9, 68, 0, 25, 25, 75, 75, 100, NULL, '2012-08-09 19:59:54.60852', '2012-08-09 20:00:17.390671');
INSERT INTO perspective_scores (id, perspective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, goal, created_at, updated_at) VALUES (10, 1, 10, 69, 0, 25, 25, 75, 75, 100, NULL, '2012-08-09 19:59:54.622009', '2012-08-09 20:00:17.408906');
INSERT INTO perspective_scores (id, perspective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, goal, created_at, updated_at) VALUES (11, 1, 11, 70, 0, 25, 25, 75, 75, 100, NULL, '2012-08-09 19:59:54.642193', '2012-08-09 20:00:17.432654');
INSERT INTO perspective_scores (id, perspective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, goal, created_at, updated_at) VALUES (12, 1, 12, 71, 0, 25, 25, 75, 75, 100, NULL, '2012-08-09 19:59:54.655075', '2012-08-09 20:00:17.449662');
INSERT INTO perspective_scores (id, perspective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, goal, created_at, updated_at) VALUES (13, 1, 13, 72, 0, 25, 25, 75, 75, 100, NULL, '2012-08-09 19:59:54.675422', '2012-08-09 20:00:17.475409');
INSERT INTO perspective_scores (id, perspective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, goal, created_at, updated_at) VALUES (14, 1, 14, 73, 0, 25, 25, 75, 75, 100, NULL, '2012-08-09 19:59:54.685211', '2012-08-09 20:00:17.506471');
INSERT INTO perspective_scores (id, perspective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, goal, created_at, updated_at) VALUES (15, 1, 15, 74, 0, 25, 25, 75, 75, 100, NULL, '2012-08-09 19:59:54.696713', '2012-08-09 20:00:17.540556');
INSERT INTO perspective_scores (id, perspective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, goal, created_at, updated_at) VALUES (16, 1, 16, 75, 0, 25, 25, 75, 75, 100, NULL, '2012-08-09 19:59:54.710717', '2012-08-09 20:00:17.564855');
INSERT INTO perspective_scores (id, perspective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, goal, created_at, updated_at) VALUES (17, 1, 17, 76, 0, 25, 25, 75, 75, 100, NULL, '2012-08-09 19:59:54.730271', '2012-08-09 20:00:17.598064');
INSERT INTO perspective_scores (id, perspective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, goal, created_at, updated_at) VALUES (18, 1, 18, 77, 0, 25, 25, 75, 75, 100, NULL, '2012-08-09 19:59:54.739495', '2012-08-09 20:00:17.621039');
INSERT INTO perspective_scores (id, perspective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, goal, created_at, updated_at) VALUES (19, 1, 19, 78, 0, 25, 25, 75, 75, 100, NULL, '2012-08-09 19:59:54.753495', '2012-08-09 20:00:17.654561');
INSERT INTO perspective_scores (id, perspective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, goal, created_at, updated_at) VALUES (20, 1, 20, 79, 0, 25, 25, 75, 75, 100, NULL, '2012-08-09 19:59:54.76544', '2012-08-09 20:00:17.701754');
INSERT INTO perspective_scores (id, perspective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, goal, created_at, updated_at) VALUES (21, 1, 21, 80, 0, 25, 25, 75, 75, 100, NULL, '2012-08-09 19:59:54.786824', '2012-08-09 20:00:17.720314');
INSERT INTO perspective_scores (id, perspective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, goal, created_at, updated_at) VALUES (22, 1, 22, 81, 0, 25, 25, 75, 75, 100, NULL, '2012-08-09 19:59:54.799721', '2012-08-09 20:00:17.749848');
INSERT INTO perspective_scores (id, perspective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, goal, created_at, updated_at) VALUES (23, 1, 23, 82.0000000000000142, 0, 25, 25, 75, 75, 100, NULL, '2012-08-09 19:59:54.817634', '2012-08-09 20:00:17.77737');
INSERT INTO perspective_scores (id, perspective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, goal, created_at, updated_at) VALUES (24, 1, 24, 83, 0, 25, 25, 75, 75, 100, NULL, '2012-08-09 19:59:54.83171', '2012-08-09 20:00:17.810922');
INSERT INTO perspective_scores (id, perspective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, goal, created_at, updated_at) VALUES (25, 1, 25, 84, 0, 25, 25, 75, 75, 100, NULL, '2012-08-09 19:59:54.842008', '2012-08-09 20:00:17.831172');
INSERT INTO perspective_scores (id, perspective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, goal, created_at, updated_at) VALUES (26, 2, 1, 60, 0, 25, 25, 75, 75, 100, NULL, '2012-08-09 19:59:54.855436', '2012-08-09 20:00:17.86413');
INSERT INTO perspective_scores (id, perspective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, goal, created_at, updated_at) VALUES (27, 2, 2, 61, 0, 25, 25, 75, 75, 100, NULL, '2012-08-09 19:59:54.875994', '2012-08-09 20:00:17.884497');
INSERT INTO perspective_scores (id, perspective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, goal, created_at, updated_at) VALUES (28, 2, 3, 62, 0, 25, 25, 75, 75, 100, NULL, '2012-08-09 19:59:54.88637', '2012-08-09 20:00:17.923999');
INSERT INTO perspective_scores (id, perspective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, goal, created_at, updated_at) VALUES (30, 2, 5, 64, 0, 25, 25, 75, 75, 100, NULL, '2012-08-09 19:59:54.908792', '2012-08-09 20:00:17.97558');
INSERT INTO perspective_scores (id, perspective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, goal, created_at, updated_at) VALUES (31, 2, 6, 65, 0, 25, 25, 75, 75, 100, NULL, '2012-08-09 19:59:54.921635', '2012-08-09 20:00:18.012989');
INSERT INTO perspective_scores (id, perspective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, goal, created_at, updated_at) VALUES (32, 2, 7, 66, 0, 25, 25, 75, 75, 100, NULL, '2012-08-09 19:59:54.940752', '2012-08-09 20:00:18.040644');
INSERT INTO perspective_scores (id, perspective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, goal, created_at, updated_at) VALUES (33, 2, 8, 67, 0, 25, 25, 75, 75, 100, NULL, '2012-08-09 19:59:54.950646', '2012-08-09 20:00:18.069855');
INSERT INTO perspective_scores (id, perspective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, goal, created_at, updated_at) VALUES (34, 2, 9, 68, 0, 25, 25, 75, 75, 100, NULL, '2012-08-09 19:59:54.964383', '2012-08-09 20:00:18.096014');
INSERT INTO perspective_scores (id, perspective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, goal, created_at, updated_at) VALUES (35, 2, 10, 69, 0, 25, 25, 75, 75, 100, NULL, '2012-08-09 19:59:54.975691', '2012-08-09 20:00:18.120192');
INSERT INTO perspective_scores (id, perspective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, goal, created_at, updated_at) VALUES (36, 2, 11, 70, 0, 25, 25, 75, 75, 100, NULL, '2012-08-09 19:59:54.984391', '2012-08-09 20:00:18.147439');
INSERT INTO perspective_scores (id, perspective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, goal, created_at, updated_at) VALUES (37, 2, 12, 71, 0, 25, 25, 75, 75, 100, NULL, '2012-08-09 19:59:54.996504', '2012-08-09 20:00:18.196166');
INSERT INTO perspective_scores (id, perspective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, goal, created_at, updated_at) VALUES (38, 2, 13, 72, 0, 25, 25, 75, 75, 100, NULL, '2012-08-09 19:59:55.007149', '2012-08-09 20:00:18.216223');
INSERT INTO perspective_scores (id, perspective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, goal, created_at, updated_at) VALUES (39, 2, 14, 73, 0, 25, 25, 75, 75, 100, NULL, '2012-08-09 19:59:55.019772', '2012-08-09 20:00:18.248123');
INSERT INTO perspective_scores (id, perspective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, goal, created_at, updated_at) VALUES (40, 2, 15, 74, 0, 25, 25, 75, 75, 100, NULL, '2012-08-09 19:59:55.032611', '2012-08-09 20:00:18.282104');
INSERT INTO perspective_scores (id, perspective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, goal, created_at, updated_at) VALUES (41, 2, 16, 75, 0, 25, 25, 75, 75, 100, NULL, '2012-08-09 19:59:55.054194', '2012-08-09 20:00:18.31269');
INSERT INTO perspective_scores (id, perspective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, goal, created_at, updated_at) VALUES (42, 2, 17, 76, 0, 25, 25, 75, 75, 100, NULL, '2012-08-09 19:59:55.064365', '2012-08-09 20:00:18.328376');
INSERT INTO perspective_scores (id, perspective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, goal, created_at, updated_at) VALUES (43, 2, 18, 77, 0, 25, 25, 75, 75, 100, NULL, '2012-08-09 19:59:55.074585', '2012-08-09 20:00:18.358228');
INSERT INTO perspective_scores (id, perspective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, goal, created_at, updated_at) VALUES (44, 2, 19, 78, 0, 25, 25, 75, 75, 100, NULL, '2012-08-09 19:59:55.083905', '2012-08-09 20:00:18.398153');
INSERT INTO perspective_scores (id, perspective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, goal, created_at, updated_at) VALUES (45, 2, 20, 79, 0, 25, 25, 75, 75, 100, NULL, '2012-08-09 19:59:55.09973', '2012-08-09 20:00:18.421102');
INSERT INTO perspective_scores (id, perspective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, goal, created_at, updated_at) VALUES (46, 2, 21, 80, 0, 25, 25, 75, 75, 100, NULL, '2012-08-09 19:59:55.120368', '2012-08-09 20:00:18.439629');
INSERT INTO perspective_scores (id, perspective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, goal, created_at, updated_at) VALUES (47, 2, 22, 81, 0, 25, 25, 75, 75, 100, NULL, '2012-08-09 19:59:55.133178', '2012-08-09 20:00:18.493308');
INSERT INTO perspective_scores (id, perspective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, goal, created_at, updated_at) VALUES (48, 2, 23, 82, 0, 25, 25, 75, 75, 100, NULL, '2012-08-09 19:59:55.141251', '2012-08-09 20:00:18.518871');
INSERT INTO perspective_scores (id, perspective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, goal, created_at, updated_at) VALUES (49, 2, 24, 83, 0, 25, 25, 75, 75, 100, NULL, '2012-08-09 19:59:55.152126', '2012-08-09 20:00:18.541652');
INSERT INTO perspective_scores (id, perspective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, goal, created_at, updated_at) VALUES (51, 3, 1, 59.3999999999999986, 0, 25, 25, 75, 75, 100, NULL, '2012-08-09 19:59:55.175323', '2012-08-09 20:00:18.613467');
INSERT INTO perspective_scores (id, perspective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, goal, created_at, updated_at) VALUES (52, 3, 2, 60.3900000000000006, 0, 25, 25, 75, 75, 100, NULL, '2012-08-09 19:59:55.188113', '2012-08-09 20:00:18.659571');
INSERT INTO perspective_scores (id, perspective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, goal, created_at, updated_at) VALUES (53, 3, 3, 61.3800000000000026, 0, 25, 25, 75, 75, 100, NULL, '2012-08-09 19:59:55.195936', '2012-08-09 20:00:18.698768');
INSERT INTO perspective_scores (id, perspective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, goal, created_at, updated_at) VALUES (54, 3, 4, 62.3700000000000045, 0, 25, 25, 75, 75, 100, NULL, '2012-08-09 19:59:55.209134', '2012-08-09 20:00:18.730016');
INSERT INTO perspective_scores (id, perspective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, goal, created_at, updated_at) VALUES (55, 3, 5, 63.3600000000000065, 0, 25, 25, 75, 75, 100, NULL, '2012-08-09 19:59:55.220388', '2012-08-09 20:00:18.757571');
INSERT INTO perspective_scores (id, perspective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, goal, created_at, updated_at) VALUES (56, 3, 6, 64.3500000000000085, 0, 25, 25, 75, 75, 100, NULL, '2012-08-09 19:59:55.231104', '2012-08-09 20:00:18.813387');
INSERT INTO perspective_scores (id, perspective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, goal, created_at, updated_at) VALUES (57, 3, 7, 65.3400000000000034, 0, 25, 25, 75, 75, 100, NULL, '2012-08-09 19:59:55.244442', '2012-08-09 20:00:18.854338');
INSERT INTO perspective_scores (id, perspective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, goal, created_at, updated_at) VALUES (58, 3, 8, 66.3300000000000125, 0, 25, 25, 75, 75, 100, NULL, '2012-08-09 19:59:55.265104', '2012-08-09 20:00:18.877708');
INSERT INTO perspective_scores (id, perspective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, goal, created_at, updated_at) VALUES (59, 3, 9, 67.3200000000000074, 0, 25, 25, 75, 75, 100, NULL, '2012-08-09 19:59:55.275747', '2012-08-09 20:00:18.942237');
INSERT INTO perspective_scores (id, perspective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, goal, created_at, updated_at) VALUES (60, 3, 10, 68.3099999999999881, 0, 25, 25, 75, 75, 100, NULL, '2012-08-09 19:59:55.286486', '2012-08-09 20:00:18.981623');
INSERT INTO perspective_scores (id, perspective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, goal, created_at, updated_at) VALUES (62, 3, 12, 70.2900000000000063, 0, 25, 25, 75, 75, 100, NULL, '2012-08-09 19:59:55.306169', '2012-08-09 20:00:19.068689');
INSERT INTO perspective_scores (id, perspective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, goal, created_at, updated_at) VALUES (63, 3, 13, 71.2800000000000011, 0, 25, 25, 75, 75, 100, NULL, '2012-08-09 19:59:55.319875', '2012-08-09 20:00:19.08555');
INSERT INTO perspective_scores (id, perspective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, goal, created_at, updated_at) VALUES (64, 3, 14, 72.269999999999996, 0, 25, 25, 75, 75, 100, NULL, '2012-08-09 19:59:55.333844', '2012-08-09 20:00:19.121432');
INSERT INTO perspective_scores (id, perspective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, goal, created_at, updated_at) VALUES (65, 3, 15, 73.2600000000000051, 0, 25, 25, 75, 75, 100, NULL, '2012-08-09 19:59:55.339957', '2012-08-09 20:00:19.143493');
INSERT INTO perspective_scores (id, perspective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, goal, created_at, updated_at) VALUES (77, 4, 2, 61, 0, 25, 25, 75, 75, 100, NULL, '2012-08-09 19:59:55.497803', '2012-08-09 19:59:55.497803');
INSERT INTO perspective_scores (id, perspective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, goal, created_at, updated_at) VALUES (1, 1, 1, 60, 0, 25, 25, 75, 75, 100, NULL, '2012-08-09 19:59:54.444829', '2012-08-09 20:00:17.157489');
INSERT INTO perspective_scores (id, perspective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, goal, created_at, updated_at) VALUES (29, 2, 4, 63, 0, 25, 25, 75, 75, 100, NULL, '2012-08-09 19:59:54.898281', '2012-08-09 20:00:17.946607');
INSERT INTO perspective_scores (id, perspective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, goal, created_at, updated_at) VALUES (61, 3, 11, 69.2999999999999972, 0, 25, 25, 75, 75, 100, NULL, '2012-08-09 19:59:55.297814', '2012-08-09 20:00:19.015866');
INSERT INTO perspective_scores (id, perspective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, goal, created_at, updated_at) VALUES (66, 3, 16, 74.25, 0, 25, 25, 75, 75, 100, NULL, '2012-08-09 19:59:55.350795', '2012-08-09 20:00:19.170587');
INSERT INTO perspective_scores (id, perspective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, goal, created_at, updated_at) VALUES (67, 3, 17, 75.2400000000000091, 0, 25, 25, 75, 75, 100, NULL, '2012-08-09 19:59:55.36468', '2012-08-09 20:00:19.206117');
INSERT INTO perspective_scores (id, perspective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, goal, created_at, updated_at) VALUES (68, 3, 18, 76.230000000000004, 0, 25, 25, 75, 75, 100, NULL, '2012-08-09 19:59:55.375766', '2012-08-09 20:00:19.233339');
INSERT INTO perspective_scores (id, perspective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, goal, created_at, updated_at) VALUES (69, 3, 19, 77.2200000000000131, 0, 25, 25, 75, 75, 100, NULL, '2012-08-09 19:59:55.397895', '2012-08-09 20:00:19.260909');
INSERT INTO perspective_scores (id, perspective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, goal, created_at, updated_at) VALUES (70, 3, 20, 78.2099999999999937, 0, 25, 25, 75, 75, 100, NULL, '2012-08-09 19:59:55.418422', '2012-08-09 20:00:19.296153');
INSERT INTO perspective_scores (id, perspective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, goal, created_at, updated_at) VALUES (71, 3, 21, 79.2000000000000028, 0, 25, 25, 75, 75, 100, NULL, '2012-08-09 19:59:55.428459', '2012-08-09 20:00:19.347112');
INSERT INTO perspective_scores (id, perspective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, goal, created_at, updated_at) VALUES (72, 3, 22, 80.1900000000000119, 0, 25, 25, 75, 75, 100, NULL, '2012-08-09 19:59:55.442202', '2012-08-09 20:00:19.398745');
INSERT INTO perspective_scores (id, perspective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, goal, created_at, updated_at) VALUES (73, 3, 23, 81.1800000000000068, 0, 25, 25, 75, 75, 100, NULL, '2012-08-09 19:59:55.454557', '2012-08-09 20:00:19.421509');
INSERT INTO perspective_scores (id, perspective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, goal, created_at, updated_at) VALUES (74, 3, 24, 82.1700000000000159, 0, 25, 25, 75, 75, 100, NULL, '2012-08-09 19:59:55.464088', '2012-08-09 20:00:19.451319');
INSERT INTO perspective_scores (id, perspective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, goal, created_at, updated_at) VALUES (75, 3, 25, 83.1600000000000108, 0, 25, 25, 75, 75, 100, NULL, '2012-08-09 19:59:55.473364', '2012-08-09 20:00:19.476119');
INSERT INTO perspective_scores (id, perspective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, goal, created_at, updated_at) VALUES (76, 4, 1, 60, 0, 25, 25, 75, 75, 100, NULL, '2012-08-09 19:59:55.486164', '2012-08-09 20:00:19.506517');
INSERT INTO perspective_scores (id, perspective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, goal, created_at, updated_at) VALUES (78, 4, 3, 62, 0, 25, 25, 75, 75, 100, NULL, '2012-08-09 19:59:55.510596', '2012-08-09 20:00:19.568736');
INSERT INTO perspective_scores (id, perspective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, goal, created_at, updated_at) VALUES (79, 4, 4, 63, 0, 25, 25, 75, 75, 100, NULL, '2012-08-09 19:59:55.533562', '2012-08-09 20:00:19.585405');
INSERT INTO perspective_scores (id, perspective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, goal, created_at, updated_at) VALUES (80, 4, 5, 64, 0, 25, 25, 75, 75, 100, NULL, '2012-08-09 19:59:55.554815', '2012-08-09 20:00:19.60733');
INSERT INTO perspective_scores (id, perspective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, goal, created_at, updated_at) VALUES (81, 4, 6, 65, 0, 25, 25, 75, 75, 100, NULL, '2012-08-09 19:59:55.565907', '2012-08-09 20:00:19.632584');
INSERT INTO perspective_scores (id, perspective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, goal, created_at, updated_at) VALUES (82, 4, 7, 66, 0, 25, 25, 75, 75, 100, NULL, '2012-08-09 19:59:55.585441', '2012-08-09 20:00:19.658467');
INSERT INTO perspective_scores (id, perspective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, goal, created_at, updated_at) VALUES (83, 4, 8, 67, 0, 25, 25, 75, 75, 100, NULL, '2012-08-09 19:59:55.59788', '2012-08-09 20:00:19.689208');
INSERT INTO perspective_scores (id, perspective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, goal, created_at, updated_at) VALUES (84, 4, 9, 68, 0, 25, 25, 75, 75, 100, NULL, '2012-08-09 19:59:55.606934', '2012-08-09 20:00:19.701135');
INSERT INTO perspective_scores (id, perspective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, goal, created_at, updated_at) VALUES (85, 4, 10, 69, 0, 25, 25, 75, 75, 100, NULL, '2012-08-09 19:59:55.61852', '2012-08-09 20:00:19.719647');
INSERT INTO perspective_scores (id, perspective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, goal, created_at, updated_at) VALUES (86, 4, 11, 70, 0, 25, 25, 75, 75, 100, NULL, '2012-08-09 19:59:55.632839', '2012-08-09 20:00:19.735743');
INSERT INTO perspective_scores (id, perspective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, goal, created_at, updated_at) VALUES (87, 4, 12, 71, 0, 25, 25, 75, 75, 100, NULL, '2012-08-09 19:59:55.662403', '2012-08-09 20:00:19.749349');
INSERT INTO perspective_scores (id, perspective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, goal, created_at, updated_at) VALUES (88, 4, 13, 72, 0, 25, 25, 75, 75, 100, NULL, '2012-08-09 19:59:55.673438', '2012-08-09 20:00:19.794608');
INSERT INTO perspective_scores (id, perspective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, goal, created_at, updated_at) VALUES (89, 4, 14, 73, 0, 25, 25, 75, 75, 100, NULL, '2012-08-09 19:59:55.685369', '2012-08-09 20:00:19.818892');
INSERT INTO perspective_scores (id, perspective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, goal, created_at, updated_at) VALUES (90, 4, 15, 74, 0, 25, 25, 75, 75, 100, NULL, '2012-08-09 19:59:55.698655', '2012-08-09 20:00:19.855484');
INSERT INTO perspective_scores (id, perspective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, goal, created_at, updated_at) VALUES (91, 4, 16, 75, 0, 25, 25, 75, 75, 100, NULL, '2012-08-09 19:59:55.708966', '2012-08-09 20:00:19.880343');
INSERT INTO perspective_scores (id, perspective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, goal, created_at, updated_at) VALUES (92, 4, 17, 76, 0, 25, 25, 75, 75, 100, NULL, '2012-08-09 19:59:55.722555', '2012-08-09 20:00:19.895533');
INSERT INTO perspective_scores (id, perspective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, goal, created_at, updated_at) VALUES (93, 4, 18, 77, 0, 25, 25, 75, 75, 100, NULL, '2012-08-09 19:59:55.74021', '2012-08-09 20:00:19.958023');
INSERT INTO perspective_scores (id, perspective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, goal, created_at, updated_at) VALUES (94, 4, 19, 78, 0, 25, 25, 75, 75, 100, NULL, '2012-08-09 19:59:55.754007', '2012-08-09 20:00:19.971983');
INSERT INTO perspective_scores (id, perspective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, goal, created_at, updated_at) VALUES (95, 4, 20, 79, 0, 25, 25, 75, 75, 100, NULL, '2012-08-09 19:59:55.762234', '2012-08-09 20:00:20.00073');
INSERT INTO perspective_scores (id, perspective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, goal, created_at, updated_at) VALUES (96, 4, 21, 80, 0, 25, 25, 75, 75, 100, NULL, '2012-08-09 19:59:55.775416', '2012-08-09 20:00:20.017514');
INSERT INTO perspective_scores (id, perspective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, goal, created_at, updated_at) VALUES (97, 4, 22, 81, 0, 25, 25, 75, 75, 100, NULL, '2012-08-09 19:59:55.788826', '2012-08-09 20:00:20.046432');
INSERT INTO perspective_scores (id, perspective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, goal, created_at, updated_at) VALUES (98, 4, 23, 82, 0, 25, 25, 75, 75, 100, NULL, '2012-08-09 19:59:55.797038', '2012-08-09 20:00:20.078119');
INSERT INTO perspective_scores (id, perspective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, goal, created_at, updated_at) VALUES (99, 4, 24, 83, 0, 25, 25, 75, 75, 100, NULL, '2012-08-09 19:59:55.807549', '2012-08-09 20:00:20.090962');
INSERT INTO perspective_scores (id, perspective_id, scoredate_id, score, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, goal, created_at, updated_at) VALUES (100, 4, 25, 84, 0, 25, 25, 75, 75, 100, NULL, '2012-08-09 19:59:55.81832', '2012-08-09 20:00:20.11541');


--
-- TOC entry 2268 (class 0 OID 17550)
-- Dependencies: 168
-- Data for Name: perspectives; Type: TABLE DATA; Schema: public; Owner: bmo
--

INSERT INTO perspectives (id, name, weight, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, title_image, created_at, updated_at) VALUES (1, 'Financiera', 25, 0, 25, 25, 75, 75, 100, 'financiera_btn.png', '2012-06-20 20:03:43.425282', '2012-06-20 20:03:43.425282');
INSERT INTO perspectives (id, name, weight, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, title_image, created_at, updated_at) VALUES (2, 'Clientes', 25, 0, 25, 25, 75, 75, 100, 'clientesy_btn.png', '2012-06-20 20:04:08.879663', '2012-06-20 20:04:08.879663');
INSERT INTO perspectives (id, name, weight, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, title_image, created_at, updated_at) VALUES (3, 'Procesos Internos', 25, 0, 25, 25, 75, 75, 100, 'procesos_btn.png', '2012-06-20 20:04:32.346182', '2012-06-20 20:04:32.346182');
INSERT INTO perspectives (id, name, weight, redfrom, redto, yellowfrom, yellowto, greenfrom, greento, title_image, created_at, updated_at) VALUES (4, 'Desarrollo y Crecimiento', 25, 0, 25, 25, 75, 75, 100, 'desarrollo_btn.png', '2012-06-20 20:04:46.095596', '2012-06-20 20:05:05.400619');


--
-- TOC entry 2277 (class 0 OID 17624)
-- Dependencies: 184
-- Data for Name: raw_data; Type: TABLE DATA; Schema: public; Owner: bmo
--



--
-- TOC entry 2278 (class 0 OID 17636)
-- Dependencies: 186
-- Data for Name: raw_data_scores; Type: TABLE DATA; Schema: public; Owner: bmo
--



--
-- TOC entry 2266 (class 0 OID 17533)
-- Dependencies: 165
-- Data for Name: roles; Type: TABLE DATA; Schema: public; Owner: bmo
--



--
-- TOC entry 2264 (class 0 OID 17511)
-- Dependencies: 161
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: public; Owner: bmo
--

INSERT INTO schema_migrations (version) VALUES ('20120418171104');
INSERT INTO schema_migrations (version) VALUES ('20120418171110');
INSERT INTO schema_migrations (version) VALUES ('20120418171112');
INSERT INTO schema_migrations (version) VALUES ('20120525214806');
INSERT INTO schema_migrations (version) VALUES ('20120525223504');
INSERT INTO schema_migrations (version) VALUES ('20120526162127');
INSERT INTO schema_migrations (version) VALUES ('20120526162130');
INSERT INTO schema_migrations (version) VALUES ('20120526162133');
INSERT INTO schema_migrations (version) VALUES ('20120526162158');
INSERT INTO schema_migrations (version) VALUES ('20120526163152');
INSERT INTO schema_migrations (version) VALUES ('20120528200632');
INSERT INTO schema_migrations (version) VALUES ('20120529183452');
INSERT INTO schema_migrations (version) VALUES ('20120531130211');
INSERT INTO schema_migrations (version) VALUES ('20120531144055');
INSERT INTO schema_migrations (version) VALUES ('20120604175301');
INSERT INTO schema_migrations (version) VALUES ('20120621000307');
INSERT INTO schema_migrations (version) VALUES ('20120625051923');
INSERT INTO schema_migrations (version) VALUES ('20120625052345');


--
-- TOC entry 2270 (class 0 OID 17573)
-- Dependencies: 172
-- Data for Name: score_dates; Type: TABLE DATA; Schema: public; Owner: bmo
--

INSERT INTO score_dates (id, month, year, created_at, updated_at) VALUES (1, 1, 2011, '2012-08-09 14:15:45.991827', '2012-08-09 14:15:45.991827');
INSERT INTO score_dates (id, month, year, created_at, updated_at) VALUES (2, 2, 2011, '2012-08-09 14:16:16.019468', '2012-08-09 14:16:16.019468');
INSERT INTO score_dates (id, month, year, created_at, updated_at) VALUES (3, 3, 2011, '2012-08-09 14:16:23.182046', '2012-08-09 14:16:23.182046');
INSERT INTO score_dates (id, month, year, created_at, updated_at) VALUES (4, 4, 2011, '2012-08-09 14:16:28.785581', '2012-08-09 14:16:28.785581');
INSERT INTO score_dates (id, month, year, created_at, updated_at) VALUES (5, 5, 2011, '2012-08-09 14:16:34.211009', '2012-08-09 14:16:34.211009');
INSERT INTO score_dates (id, month, year, created_at, updated_at) VALUES (6, 6, 2011, '2012-08-09 14:16:39.563957', '2012-08-09 14:16:39.563957');
INSERT INTO score_dates (id, month, year, created_at, updated_at) VALUES (7, 7, 2011, '2012-08-09 14:16:44.51548', '2012-08-09 14:16:44.51548');
INSERT INTO score_dates (id, month, year, created_at, updated_at) VALUES (8, 8, 2011, '2012-08-09 14:16:49.473975', '2012-08-09 14:16:49.473975');
INSERT INTO score_dates (id, month, year, created_at, updated_at) VALUES (9, 9, 2011, '2012-08-09 14:16:54.330607', '2012-08-09 14:16:54.330607');
INSERT INTO score_dates (id, month, year, created_at, updated_at) VALUES (10, 10, 2011, '2012-08-09 14:17:00.720241', '2012-08-09 14:17:00.720241');
INSERT INTO score_dates (id, month, year, created_at, updated_at) VALUES (11, 11, 2011, '2012-08-09 14:17:06.781148', '2012-08-09 14:17:06.781148');
INSERT INTO score_dates (id, month, year, created_at, updated_at) VALUES (12, 12, 2011, '2012-08-09 14:17:12.487839', '2012-08-09 14:17:12.487839');
INSERT INTO score_dates (id, month, year, created_at, updated_at) VALUES (13, 1, 2012, '2012-08-09 14:17:22.200834', '2012-08-09 14:17:22.200834');
INSERT INTO score_dates (id, month, year, created_at, updated_at) VALUES (14, 2, 2012, '2012-08-09 14:17:56.372683', '2012-08-09 14:17:56.372683');
INSERT INTO score_dates (id, month, year, created_at, updated_at) VALUES (15, 3, 2012, '2012-08-09 14:18:02.516953', '2012-08-09 14:18:02.516953');
INSERT INTO score_dates (id, month, year, created_at, updated_at) VALUES (16, 4, 2012, '2012-08-09 14:18:10.15771', '2012-08-09 14:18:10.15771');
INSERT INTO score_dates (id, month, year, created_at, updated_at) VALUES (17, 5, 2012, '2012-08-09 14:18:15.999111', '2012-08-09 14:18:15.999111');
INSERT INTO score_dates (id, month, year, created_at, updated_at) VALUES (18, 6, 2012, '2012-08-09 14:18:21.581159', '2012-08-09 14:18:21.581159');
INSERT INTO score_dates (id, month, year, created_at, updated_at) VALUES (19, 7, 2012, '2012-08-09 14:18:27.549278', '2012-08-09 14:18:27.549278');
INSERT INTO score_dates (id, month, year, created_at, updated_at) VALUES (20, 8, 2012, '2012-08-09 14:18:33.058726', '2012-08-09 14:18:33.058726');
INSERT INTO score_dates (id, month, year, created_at, updated_at) VALUES (21, 9, 2012, '2012-08-09 14:18:39.373435', '2012-08-09 14:18:39.373435');
INSERT INTO score_dates (id, month, year, created_at, updated_at) VALUES (22, 10, 2012, '2012-08-09 14:18:47.31409', '2012-08-09 14:18:47.31409');
INSERT INTO score_dates (id, month, year, created_at, updated_at) VALUES (23, 11, 2012, '2012-08-09 14:18:53.885261', '2012-08-09 14:18:53.885261');
INSERT INTO score_dates (id, month, year, created_at, updated_at) VALUES (24, 12, 2012, '2012-08-09 14:19:00.459532', '2012-08-09 14:19:00.459532');
INSERT INTO score_dates (id, month, year, created_at, updated_at) VALUES (25, 1, 2013, '2012-08-09 14:19:21.89484', '2012-08-09 14:19:21.89484');


--
-- TOC entry 2265 (class 0 OID 17517)
-- Dependencies: 163
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: bmo
--

INSERT INTO users (id, email, encrypted_password, reset_password_token, reset_password_sent_at, remember_created_at, sign_in_count, current_sign_in_at, last_sign_in_at, current_sign_in_ip, last_sign_in_ip, created_at, updated_at, name) VALUES (1, 'luis.rodriguez@execca.net', '$2a$10$2rpwYeAwalUtSCT.PSBqn.N1Z3Jn8dyDhyBUIlHqoMPqS.mo62r7G', 'sbY6aXeDsNeLtxxpejs2', '2012-06-27 17:56:08.442298', NULL, 3, '2012-06-27 18:35:36.2793', '2012-06-27 17:56:42.275347', '127.0.0.1', '127.0.0.1', '2012-06-27 16:34:39.457875', '2012-06-27 18:35:36.280196', 'Luis Miguel Rodriguez');
INSERT INTO users (id, email, encrypted_password, reset_password_token, reset_password_sent_at, remember_created_at, sign_in_count, current_sign_in_at, last_sign_in_at, current_sign_in_ip, last_sign_in_ip, created_at, updated_at, name) VALUES (2, 'demo@execca.net', '$2a$10$rvKO5VfharSzCGmHQqdefOaLCZHz6Rl3Fiv6lyzIHQUNvr6VEUMpO', NULL, NULL, NULL, 113, '2012-11-03 16:33:23.375029', '2012-10-30 03:04:29.11363', '127.0.0.1', '127.0.0.1', '2012-06-28 02:01:11.947529', '2012-11-03 16:33:23.376147', 'demo');


--
-- TOC entry 2267 (class 0 OID 17542)
-- Dependencies: 166
-- Data for Name: users_roles; Type: TABLE DATA; Schema: public; Owner: bmo
--



--
-- TOC entry 2280 (class 0 OID 17652)
-- Dependencies: 190
-- Data for Name: vectors; Type: TABLE DATA; Schema: public; Owner: bmo
--

INSERT INTO vectors (id, name, created_at, updated_at) VALUES (1, 'Fortalecer la internacionalizacion', '2012-08-14 14:27:51.467841', '2012-08-14 14:27:51.467841');
INSERT INTO vectors (id, name, created_at, updated_at) VALUES (2, 'Calidad de servicios ', '2012-08-14 15:10:55.517284', '2012-08-14 15:10:55.517284');
INSERT INTO vectors (id, name, created_at, updated_at) VALUES (3, 'Aliados Clave', '2012-08-14 15:35:09.079054', '2012-08-14 15:35:09.079054');
INSERT INTO vectors (id, name, created_at, updated_at) VALUES (4, 'Eficiencia', '2012-08-14 15:36:21.455625', '2012-08-14 15:36:21.455625');


--
-- TOC entry 2281 (class 0 OID 17658)
-- Dependencies: 191
-- Data for Name: vectors_objectives; Type: TABLE DATA; Schema: public; Owner: bmo
--

INSERT INTO vectors_objectives (vector_id, objective_id) VALUES (1, 10);
INSERT INTO vectors_objectives (vector_id, objective_id) VALUES (1, 11);
INSERT INTO vectors_objectives (vector_id, objective_id) VALUES (1, 8);
INSERT INTO vectors_objectives (vector_id, objective_id) VALUES (1, 17);
INSERT INTO vectors_objectives (vector_id, objective_id) VALUES (1, 2);
INSERT INTO vectors_objectives (vector_id, objective_id) VALUES (1, 1);
INSERT INTO vectors_objectives (vector_id, objective_id) VALUES (1, 3);
INSERT INTO vectors_objectives (vector_id, objective_id) VALUES (1, 19);
INSERT INTO vectors_objectives (vector_id, objective_id) VALUES (1, 6);
INSERT INTO vectors_objectives (vector_id, objective_id) VALUES (1, 5);
INSERT INTO vectors_objectives (vector_id, objective_id) VALUES (1, 20);
INSERT INTO vectors_objectives (vector_id, objective_id) VALUES (1, 7);
INSERT INTO vectors_objectives (vector_id, objective_id) VALUES (1, 18);
INSERT INTO vectors_objectives (vector_id, objective_id) VALUES (2, 8);
INSERT INTO vectors_objectives (vector_id, objective_id) VALUES (2, 17);
INSERT INTO vectors_objectives (vector_id, objective_id) VALUES (2, 2);
INSERT INTO vectors_objectives (vector_id, objective_id) VALUES (2, 1);
INSERT INTO vectors_objectives (vector_id, objective_id) VALUES (2, 3);
INSERT INTO vectors_objectives (vector_id, objective_id) VALUES (2, 19);
INSERT INTO vectors_objectives (vector_id, objective_id) VALUES (2, 14);
INSERT INTO vectors_objectives (vector_id, objective_id) VALUES (2, 6);
INSERT INTO vectors_objectives (vector_id, objective_id) VALUES (2, 5);
INSERT INTO vectors_objectives (vector_id, objective_id) VALUES (2, 20);
INSERT INTO vectors_objectives (vector_id, objective_id) VALUES (2, 13);
INSERT INTO vectors_objectives (vector_id, objective_id) VALUES (2, 7);
INSERT INTO vectors_objectives (vector_id, objective_id) VALUES (2, 18);
INSERT INTO vectors_objectives (vector_id, objective_id) VALUES (2, 12);
INSERT INTO vectors_objectives (vector_id, objective_id) VALUES (3, 9);
INSERT INTO vectors_objectives (vector_id, objective_id) VALUES (3, 8);
INSERT INTO vectors_objectives (vector_id, objective_id) VALUES (3, 17);
INSERT INTO vectors_objectives (vector_id, objective_id) VALUES (3, 2);
INSERT INTO vectors_objectives (vector_id, objective_id) VALUES (3, 1);
INSERT INTO vectors_objectives (vector_id, objective_id) VALUES (3, 3);
INSERT INTO vectors_objectives (vector_id, objective_id) VALUES (3, 19);
INSERT INTO vectors_objectives (vector_id, objective_id) VALUES (3, 6);
INSERT INTO vectors_objectives (vector_id, objective_id) VALUES (3, 5);
INSERT INTO vectors_objectives (vector_id, objective_id) VALUES (3, 20);
INSERT INTO vectors_objectives (vector_id, objective_id) VALUES (3, 15);
INSERT INTO vectors_objectives (vector_id, objective_id) VALUES (3, 7);
INSERT INTO vectors_objectives (vector_id, objective_id) VALUES (3, 18);
INSERT INTO vectors_objectives (vector_id, objective_id) VALUES (4, 17);
INSERT INTO vectors_objectives (vector_id, objective_id) VALUES (4, 1);
INSERT INTO vectors_objectives (vector_id, objective_id) VALUES (4, 3);
INSERT INTO vectors_objectives (vector_id, objective_id) VALUES (4, 19);
INSERT INTO vectors_objectives (vector_id, objective_id) VALUES (4, 16);
INSERT INTO vectors_objectives (vector_id, objective_id) VALUES (4, 20);
INSERT INTO vectors_objectives (vector_id, objective_id) VALUES (4, 4);
INSERT INTO vectors_objectives (vector_id, objective_id) VALUES (4, 18);


--
-- TOC entry 2253 (class 2606 OID 17603)
-- Dependencies: 178 178
-- Name: indicator_scores_pkey; Type: CONSTRAINT; Schema: public; Owner: bmo; Tablespace: 
--

ALTER TABLE ONLY indicator_scores
    ADD CONSTRAINT indicator_scores_pkey PRIMARY KEY (id);


--
-- TOC entry 2255 (class 2606 OID 17615)
-- Dependencies: 180 180
-- Name: indicators_pkey; Type: CONSTRAINT; Schema: public; Owner: bmo; Tablespace: 
--

ALTER TABLE ONLY indicators
    ADD CONSTRAINT indicators_pkey PRIMARY KEY (id);


--
-- TOC entry 2251 (class 2606 OID 17594)
-- Dependencies: 176 176
-- Name: objective_scores_pkey; Type: CONSTRAINT; Schema: public; Owner: bmo; Tablespace: 
--

ALTER TABLE ONLY objective_scores
    ADD CONSTRAINT objective_scores_pkey PRIMARY KEY (id);


--
-- TOC entry 2245 (class 2606 OID 17570)
-- Dependencies: 170 170
-- Name: objectives_pkey; Type: CONSTRAINT; Schema: public; Owner: bmo; Tablespace: 
--

ALTER TABLE ONLY objectives
    ADD CONSTRAINT objectives_pkey PRIMARY KEY (id);


--
-- TOC entry 2261 (class 2606 OID 17649)
-- Dependencies: 188 188
-- Name: operations_pkey; Type: CONSTRAINT; Schema: public; Owner: bmo; Tablespace: 
--

ALTER TABLE ONLY operations
    ADD CONSTRAINT operations_pkey PRIMARY KEY (id);


--
-- TOC entry 2249 (class 2606 OID 17586)
-- Dependencies: 174 174
-- Name: perspective_scores_pkey; Type: CONSTRAINT; Schema: public; Owner: bmo; Tablespace: 
--

ALTER TABLE ONLY perspective_scores
    ADD CONSTRAINT perspective_scores_pkey PRIMARY KEY (id);


--
-- TOC entry 2243 (class 2606 OID 17558)
-- Dependencies: 168 168
-- Name: perspectives_pkey; Type: CONSTRAINT; Schema: public; Owner: bmo; Tablespace: 
--

ALTER TABLE ONLY perspectives
    ADD CONSTRAINT perspectives_pkey PRIMARY KEY (id);


--
-- TOC entry 2257 (class 2606 OID 17633)
-- Dependencies: 184 184
-- Name: raw_data_pkey; Type: CONSTRAINT; Schema: public; Owner: bmo; Tablespace: 
--

ALTER TABLE ONLY raw_data
    ADD CONSTRAINT raw_data_pkey PRIMARY KEY (id);


--
-- TOC entry 2259 (class 2606 OID 17641)
-- Dependencies: 186 186
-- Name: raw_data_scores_pkey; Type: CONSTRAINT; Schema: public; Owner: bmo; Tablespace: 
--

ALTER TABLE ONLY raw_data_scores
    ADD CONSTRAINT raw_data_scores_pkey PRIMARY KEY (id);


--
-- TOC entry 2240 (class 2606 OID 17541)
-- Dependencies: 165 165
-- Name: roles_pkey; Type: CONSTRAINT; Schema: public; Owner: bmo; Tablespace: 
--

ALTER TABLE ONLY roles
    ADD CONSTRAINT roles_pkey PRIMARY KEY (id);


--
-- TOC entry 2247 (class 2606 OID 17578)
-- Dependencies: 172 172
-- Name: score_dates_pkey; Type: CONSTRAINT; Schema: public; Owner: bmo; Tablespace: 
--

ALTER TABLE ONLY score_dates
    ADD CONSTRAINT score_dates_pkey PRIMARY KEY (id);


--
-- TOC entry 2236 (class 2606 OID 17528)
-- Dependencies: 163 163
-- Name: users_pkey; Type: CONSTRAINT; Schema: public; Owner: bmo; Tablespace: 
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- TOC entry 2263 (class 2606 OID 17657)
-- Dependencies: 190 190
-- Name: vectors_pkey; Type: CONSTRAINT; Schema: public; Owner: bmo; Tablespace: 
--

ALTER TABLE ONLY vectors
    ADD CONSTRAINT vectors_pkey PRIMARY KEY (id);


--
-- TOC entry 2237 (class 1259 OID 17545)
-- Dependencies: 165
-- Name: index_roles_on_name; Type: INDEX; Schema: public; Owner: bmo; Tablespace: 
--

CREATE INDEX index_roles_on_name ON roles USING btree (name);


--
-- TOC entry 2238 (class 1259 OID 17546)
-- Dependencies: 165 165 165
-- Name: index_roles_on_name_and_resource_type_and_resource_id; Type: INDEX; Schema: public; Owner: bmo; Tablespace: 
--

CREATE INDEX index_roles_on_name_and_resource_type_and_resource_id ON roles USING btree (name, resource_type, resource_id);


--
-- TOC entry 2233 (class 1259 OID 17529)
-- Dependencies: 163
-- Name: index_users_on_email; Type: INDEX; Schema: public; Owner: bmo; Tablespace: 
--

CREATE UNIQUE INDEX index_users_on_email ON users USING btree (email);


--
-- TOC entry 2234 (class 1259 OID 17530)
-- Dependencies: 163
-- Name: index_users_on_reset_password_token; Type: INDEX; Schema: public; Owner: bmo; Tablespace: 
--

CREATE UNIQUE INDEX index_users_on_reset_password_token ON users USING btree (reset_password_token);


--
-- TOC entry 2241 (class 1259 OID 17547)
-- Dependencies: 166 166
-- Name: index_users_roles_on_user_id_and_role_id; Type: INDEX; Schema: public; Owner: bmo; Tablespace: 
--

CREATE INDEX index_users_roles_on_user_id_and_role_id ON users_roles USING btree (user_id, role_id);


--
-- TOC entry 2232 (class 1259 OID 17514)
-- Dependencies: 161
-- Name: unique_schema_migrations; Type: INDEX; Schema: public; Owner: bmo; Tablespace: 
--

CREATE UNIQUE INDEX unique_schema_migrations ON schema_migrations USING btree (version);


--
-- TOC entry 2286 (class 0 OID 0)
-- Dependencies: 6
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


-- Completed on 2012-11-06 18:23:46 VET

--
-- PostgreSQL database dump complete
--

