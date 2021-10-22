--
-- PostgreSQL database dump
--

-- Dumped from database version 14.0
-- Dumped by pg_dump version 14.0

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: sessoes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sessoes (
    id integer NOT NULL,
    token text,
    "userId" integer
);


ALTER TABLE public.sessoes OWNER TO postgres;

--
-- Name: sessoes_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.sessoes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sessoes_id_seq OWNER TO postgres;

--
-- Name: sessoes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.sessoes_id_seq OWNED BY public.sessoes.id;


--
-- Name: usuarios; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.usuarios (
    id integer NOT NULL,
    name text NOT NULL,
    email text NOT NULL,
    password text NOT NULL
);


ALTER TABLE public.usuarios OWNER TO postgres;

--
-- Name: usuarios_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.usuarios_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.usuarios_id_seq OWNER TO postgres;

--
-- Name: usuarios_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.usuarios_id_seq OWNED BY public.usuarios.id;


--
-- Name: sessoes id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sessoes ALTER COLUMN id SET DEFAULT nextval('public.sessoes_id_seq'::regclass);


--
-- Name: usuarios id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuarios ALTER COLUMN id SET DEFAULT nextval('public.usuarios_id_seq'::regclass);


--
-- Data for Name: sessoes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.sessoes (id, token, "userId") FROM stdin;
1	f21542c8-db10-4c00-b227-178763cce161	7
2	7f63cad1-740e-45f4-a57e-a66f5395a287	6
3	5a0904da-d9ea-427f-ae01-3cc28cf1942b	6
4	60cb81ec-1f93-42f9-bc7f-cfe7c9368a5d	6
5	6e5a3f3b-d00b-4e50-864a-d00f8529d2c4	6
6	9675c845-260e-4145-9430-d9df44b1af2f	6
7	50e296c0-19a6-4bdf-9e28-12f580b21830	6
8	dc72c7b4-00c4-4420-b9b4-9c63dae4e8a9	6
9	9ef417da-e3db-4920-82cb-b80f6c7c145c	6
\.


--
-- Data for Name: usuarios; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.usuarios (id, name, email, password) FROM stdin;
6	Pedro	pedro@email.com	$2b$12$3vtg//9zWaTchmQ0//9R2uwI9oiRv5jxTCQEmKx08njERvFlJbIEi
7	Pedro	pedro2@email.com	$2b$12$RnLFEs9ObmjR2baQ3OkWceOvrLXnye1R98PhJZlkHLAftFuoR4IMy
\.


--
-- Name: sessoes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.sessoes_id_seq', 9, true);


--
-- Name: usuarios_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.usuarios_id_seq', 7, true);


--
-- Name: usuarios usuarios_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_pkey PRIMARY KEY (id);


--
-- PostgreSQL database dump complete
--

