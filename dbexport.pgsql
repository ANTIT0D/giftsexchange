--
-- PostgreSQL database dump
--

-- Dumped from database version 13.4
-- Dumped by pg_dump version 13.4

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
-- Name: t_gift; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.t_gift (
    id bigint NOT NULL,
    gift_name character varying(255),
    gift_note character varying(255),
    gift_price character varying(255)
);


ALTER TABLE public.t_gift OWNER TO postgres;

--
-- Name: t_gift_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.t_gift_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.t_gift_id_seq OWNER TO postgres;

--
-- Name: t_gift_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.t_gift_id_seq OWNED BY public.t_gift.id;


--
-- Name: t_role; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.t_role (
    id bigint NOT NULL,
    name character varying(255)
);


ALTER TABLE public.t_role OWNER TO postgres;

--
-- Name: t_user; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.t_user (
    id bigint NOT NULL,
    password character varying(255),
    username character varying(255)
);


ALTER TABLE public.t_user OWNER TO postgres;

--
-- Name: t_user_gifts; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.t_user_gifts (
    user_id bigint NOT NULL,
    gifts_id bigint NOT NULL
);


ALTER TABLE public.t_user_gifts OWNER TO postgres;

--
-- Name: t_user_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.t_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.t_user_id_seq OWNER TO postgres;

--
-- Name: t_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.t_user_id_seq OWNED BY public.t_user.id;


--
-- Name: t_user_roles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.t_user_roles (
    user_id bigint NOT NULL,
    roles_id bigint NOT NULL
);


ALTER TABLE public.t_user_roles OWNER TO postgres;

--
-- Name: t_gift id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.t_gift ALTER COLUMN id SET DEFAULT nextval('public.t_gift_id_seq'::regclass);


--
-- Name: t_user id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.t_user ALTER COLUMN id SET DEFAULT nextval('public.t_user_id_seq'::regclass);


--
-- Data for Name: t_gift; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.t_gift (id, gift_name, gift_note, gift_price) FROM stdin;
2	Тетрадь	Для учёбы	20
3	Ручка	Для учёбы	3
4	Подарочная карта в летуаль	Всё для твоё красоты	59
1	Очки	ochki	100
\.


--
-- Data for Name: t_role; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.t_role (id, name) FROM stdin;
1	ROLE_USER
2	ROLE_ADMIN
\.


--
-- Data for Name: t_user; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.t_user (id, password, username) FROM stdin;
2	$2a$10$/xG8I4sk7y5lyrEQGNPzhek6wBx4SFF06nHQVVZR2baTseq1GnkAu	admin
3	$2a$10$T1JI6vFrM1Ad8amF2G5FLeM9whiJXz7xCQLhZPPZeIGhfuPV/c9wq	user1
4	$2a$10$sZolovyQOzX9KMjn107QhOwfBlxjKr0h1uR3F/br8UlLs3MlxChui	user2
\.


--
-- Data for Name: t_user_gifts; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.t_user_gifts (user_id, gifts_id) FROM stdin;
3	2
4	1
\.


--
-- Data for Name: t_user_roles; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.t_user_roles (user_id, roles_id) FROM stdin;
2	2
3	1
4	1
\.


--
-- Name: t_gift_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.t_gift_id_seq', 4, true);


--
-- Name: t_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.t_user_id_seq', 4, true);


--
-- Name: t_gift t_gift_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.t_gift
    ADD CONSTRAINT t_gift_pkey PRIMARY KEY (id);


--
-- Name: t_role t_role_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.t_role
    ADD CONSTRAINT t_role_pkey PRIMARY KEY (id);


--
-- Name: t_user_gifts t_user_gifts_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.t_user_gifts
    ADD CONSTRAINT t_user_gifts_pkey PRIMARY KEY (user_id, gifts_id);


--
-- Name: t_user t_user_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.t_user
    ADD CONSTRAINT t_user_pkey PRIMARY KEY (id);


--
-- Name: t_user_roles t_user_roles_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.t_user_roles
    ADD CONSTRAINT t_user_roles_pkey PRIMARY KEY (user_id, roles_id);


--
-- Name: t_user_gifts uk_a93vgkya7endnbvtqvaylsdct; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.t_user_gifts
    ADD CONSTRAINT uk_a93vgkya7endnbvtqvaylsdct UNIQUE (gifts_id);


--
-- Name: t_user_gifts fk9fopvqr6h3m97phat9e00ivpo; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.t_user_gifts
    ADD CONSTRAINT fk9fopvqr6h3m97phat9e00ivpo FOREIGN KEY (gifts_id) REFERENCES public.t_gift(id);


--
-- Name: t_user_gifts fkdvidko321dnr5sb8kk2j243li; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.t_user_gifts
    ADD CONSTRAINT fkdvidko321dnr5sb8kk2j243li FOREIGN KEY (user_id) REFERENCES public.t_user(id);


--
-- Name: t_user_roles fkj47yp3hhtsoajht9793tbdrp4; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.t_user_roles
    ADD CONSTRAINT fkj47yp3hhtsoajht9793tbdrp4 FOREIGN KEY (roles_id) REFERENCES public.t_role(id);


--
-- Name: t_user_roles fkpqntgokae5e703qb206xvfdk3; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.t_user_roles
    ADD CONSTRAINT fkpqntgokae5e703qb206xvfdk3 FOREIGN KEY (user_id) REFERENCES public.t_user(id);


--
-- PostgreSQL database dump complete
--

