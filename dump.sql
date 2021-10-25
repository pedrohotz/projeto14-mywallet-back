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
-- Name: historico; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.historico (
    id integer NOT NULL,
    date date,
    description text,
    value text,
    type text,
    "userId" integer
);


ALTER TABLE public.historico OWNER TO postgres;

--
-- Name: historico_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.historico_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.historico_id_seq OWNER TO postgres;

--
-- Name: historico_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.historico_id_seq OWNED BY public.historico.id;


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
-- Name: historico id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.historico ALTER COLUMN id SET DEFAULT nextval('public.historico_id_seq'::regclass);


--
-- Name: sessoes id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sessoes ALTER COLUMN id SET DEFAULT nextval('public.sessoes_id_seq'::regclass);


--
-- Name: usuarios id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuarios ALTER COLUMN id SET DEFAULT nextval('public.usuarios_id_seq'::regclass);


--
-- Data for Name: historico; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.historico (id, date, description, value, type, "userId") FROM stdin;
13	2021-10-24	comida	20	entrada	6
14	2021-10-24	comida2	25	entrada	6
15	2021-10-24	acai	10	saida	6
16	2021-10-24	teste	100	entrada	6
17	2021-10-24	saidateste	35	saida	6
18	2021-10-24	Salario	3000	entrada	11
19	2021-10-24	conta de luz	300	saida	11
20	2021-10-24	Salario	2000	entrada	12
21	2021-10-24	Conta de luz 	300	saida	12
22	2021-10-25	salario	1000	entrada	6
23	2021-10-25	conta de luz	213	saida	6
\.


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
10	9d5150fa-7525-4aa5-8542-df286de277a0	6
11	36bcd066-fbc6-417e-9f04-dcb011d0456b	6
12	84aac1a7-1216-4bed-a79f-39c7a7c52a60	6
13	6a9da6a3-d565-42c3-9517-574f841bc1c2	6
14	48da0d30-4a89-46f8-bef3-8951e5f0d1fe	6
15	50345112-cf4e-4848-88af-dbb9c7399e7c	9
16	a88f75eb-cbea-436f-8d78-55c84dc7b652	6
17	b5f31b72-643c-4631-b661-9c20fb58b549	6
18	9f55d399-cf81-48f6-87c9-129180604fef	6
19	051920c5-f513-4ac6-a6b9-effb49b772ce	6
20	89e47a41-68fc-429a-bd29-3e17dd338193	6
21	6d4d10c4-c469-49b8-be26-fea438fefc41	6
22	06c1db51-2b52-4279-b6f2-23ac919ba50a	6
23	fb836a11-5fa6-4a40-bb07-9e9db592fb1b	11
24	06a8d2f5-4eae-4e05-9d83-1c0a8df54ca6	12
25	4751fefd-e80c-47a5-84db-194664af3006	6
26	07567409-bf88-4da5-abac-b97afa536d80	6
27	b8e08d13-cc96-44fe-b516-24f4516a7635	6
28	f0d03659-2e48-4a68-842e-11c82679e35d	6
29	7a57d812-898c-4fd8-a2b7-2d2f7713a462	6
30	f7cb0fc3-5726-4fe7-b5f8-bd6e873700fe	6
31	0fdd2d0b-bbb2-4b09-9b5f-b356cbb15a8b	6
\.


--
-- Data for Name: usuarios; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.usuarios (id, name, email, password) FROM stdin;
6	Pedro	pedro@email.com	$2b$12$3vtg//9zWaTchmQ0//9R2uwI9oiRv5jxTCQEmKx08njERvFlJbIEi
7	Pedro	pedro2@email.com	$2b$12$RnLFEs9ObmjR2baQ3OkWceOvrLXnye1R98PhJZlkHLAftFuoR4IMy
8	Testando	teste@email.com	$2b$12$GLpk6QH4jFO4H3/u22DX6e5GSIIoHKCPOkHLVTY7OX4JE.csVHl/u
9	pedrodois	pedrodois@email.com	$2b$12$W6fMz2jleifdGd30T9wmj./sLbiCrDBnVli6hlrGktEboJQlYaylC
10	testandosenha	testandosenha@email.com	$2b$12$a4TYgSyp7uR7BhVaa1VajO8s/vpCFZxpOeyCWNypmEpqITvFH1o4u
11	UsuarioNovo	testandousuario@email.com	$2b$12$JlJE68fiZbw/AM5djBWpWOOuPk321GvfRMCoUjdzASP2La.LT..bS
12	MaxOJoe	max@email.com	$2b$12$GSTg5KVKMMSp0hMTl2/lRuiyPX9aC8RTHc4dKL19iKRQG81S3im8a
\.


--
-- Name: historico_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.historico_id_seq', 23, true);


--
-- Name: sessoes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.sessoes_id_seq', 31, true);


--
-- Name: usuarios_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.usuarios_id_seq', 12, true);


--
-- Name: usuarios usuarios_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_pkey PRIMARY KEY (id);


--
-- PostgreSQL database dump complete
--

