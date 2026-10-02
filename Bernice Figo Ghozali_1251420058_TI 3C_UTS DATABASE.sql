--
-- PostgreSQL database dump
--

\restrict bNGlbOmd5ShfvvdCsBzbLRKE3iEm0b5mvEK0YPmWKsiUMeak4PAg6bIJ8224QO8

-- Dumped from database version 17.11
-- Dumped by pg_dump version 17.11

-- Started on 2026-10-02 08:32:17

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
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
-- TOC entry 217 (class 1259 OID 16399)
-- Name: branch; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.branch (
    branchno character varying(10) NOT NULL,
    street character varying(50),
    city character varying(50),
    postcode character varying(15)
);


ALTER TABLE public.branch OWNER TO postgres;

--
-- TOC entry 220 (class 1259 OID 16418)
-- Name: client; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.client (
    clientno character varying(10) NOT NULL,
    fname character varying(50),
    lname character varying(50),
    telno character varying(20),
    preftype character varying(20),
    maxrent numeric
);


ALTER TABLE public.client OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 16425)
-- Name: privateowner; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.privateowner (
    ownerno character varying(10) NOT NULL,
    fname character varying(50),
    lname character varying(50),
    address character varying(100),
    telno character varying(20)
);


ALTER TABLE public.privateowner OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 16411)
-- Name: propertyforrent; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.propertyforrent (
    propertyno character varying(10) NOT NULL,
    street character varying(50),
    city character varying(50),
    postcode character varying(15),
    type character varying(20),
    rooms integer,
    rent numeric,
    ownerno character varying(10),
    staffno character varying(10),
    branchno character varying(10)
);


ALTER TABLE public.propertyforrent OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 16433)
-- Name: registration; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.registration (
    clientno character varying(10),
    branchno character varying(10),
    staffno character varying(10),
    datejoined date
);


ALTER TABLE public.registration OWNER TO postgres;

--
-- TOC entry 218 (class 1259 OID 16404)
-- Name: staff; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.staff (
    staffno character varying(10) NOT NULL,
    fname character varying(50),
    lname character varying(50),
    "position" character varying(50),
    sex character(1),
    dob date,
    salary numeric,
    branchno character varying(10)
);


ALTER TABLE public.staff OWNER TO postgres;

--
-- TOC entry 222 (class 1259 OID 16430)
-- Name: viewing; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.viewing (
    clientno character varying(10),
    propertyno character varying(10),
    viewdate date,
    comment character varying(100)
);


ALTER TABLE public.viewing OWNER TO postgres;

--
-- TOC entry 4920 (class 0 OID 16399)
-- Dependencies: 217
-- Data for Name: branch; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.branch (branchno, street, city, postcode) FROM stdin;
B005	22 Deer Rd	London	SW1 4EH
B007	16 Argyll St	Aberdeen	AB2 3SU
B003	163 Main St	Glasgow	G11 9QX
B004	32 Manse Rd	Bristol	BS99 1NZ
B002	56 Clover Dr	London	NW10 6EU
\.


--
-- TOC entry 4923 (class 0 OID 16418)
-- Dependencies: 220
-- Data for Name: client; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.client (clientno, fname, lname, telno, preftype, maxrent) FROM stdin;
CR76	John	Kay	0207-774-5632	Flat	425
CR56	Aline	Stewart	0141-848-1825	Flat	350
CR74	Mike	Ritchie	01475-392178	House	750
CR62	Mary	Tregear	01224-196720	Flat	600
\.


--
-- TOC entry 4924 (class 0 OID 16425)
-- Dependencies: 221
-- Data for Name: privateowner; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.privateowner (ownerno, fname, lname, address, telno) FROM stdin;
CO46	Joe	Keogh	2 Fergus Dr, Aberdeen AB2 7SX	01224-861212
CO87	Carol	Farrel	6 Achray St, Glasgow G32 9DX	0141-357-7419
CO40	Tina	Murphy	63 Well St, Glasgow G42	0141-943-1728
CO93	Tony	Shaw	12 Park Pl, Glasgow G4 0QR	0141-225-7025
\.


--
-- TOC entry 4922 (class 0 OID 16411)
-- Dependencies: 219
-- Data for Name: propertyforrent; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.propertyforrent (propertyno, street, city, postcode, type, rooms, rent, ownerno, staffno, branchno) FROM stdin;
PA14	16 Holhead	Aberdeen	AB7 5SU	House	6	650	CO46	SA9	B007
PL94	6 Argyll St	London	NW2	Flat	4	400	CO87	SL41	B005
PG4	6 Lawrence St	Glasgow	G11 9QX	Flat	3	350	CO40	\N	B003
PG36	2 Manor Rd	Glasgow	G32 4QX	Flat	3	375	CO93	SG37	B003
PG21	18 Dale Rd	Glasgow	G12	House	5	600	CO87	SG37	B003
PG16	5 Novar Dr	Glasgow	G12 9AX	Flat	4	450	CO93	SG14	B003
\.


--
-- TOC entry 4926 (class 0 OID 16433)
-- Dependencies: 223
-- Data for Name: registration; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.registration (clientno, branchno, staffno, datejoined) FROM stdin;
CR76	B005	SL41	2004-01-02
CR56	B003	SG37	2003-04-11
CR74	B003	SG37	2002-11-16
CR62	B007	SA9	2003-03-07
\.


--
-- TOC entry 4921 (class 0 OID 16404)
-- Dependencies: 218
-- Data for Name: staff; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.staff (staffno, fname, lname, "position", sex, dob, salary, branchno) FROM stdin;
SL21	John	White	Manager	M	1945-10-01	30000	B005
SG37	Ann	Beech	Assistant	F	1960-11-10	12000	B003
SG14	David	Ford	Supervisor	M	1958-03-24	18000	B003
SA9	Mary	Howe	Assistant	F	1970-02-19	9000	B007
SG5	Susan	Brand	Manager	F	1940-06-03	24000	B003
SL41	Julie	Lee	Assistant	F	1965-06-13	9000	B005
\.


--
-- TOC entry 4925 (class 0 OID 16430)
-- Dependencies: 222
-- Data for Name: viewing; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.viewing (clientno, propertyno, viewdate, comment) FROM stdin;
CR56	PA14	2004-05-24	too small
CR76	PG4	2004-04-20	too remote
CR56	PG4	2004-05-26	\N
CR62	PA14	2004-05-14	no dining room
CR56	PG36	2004-04-28	\N
\.


--
-- TOC entry 4766 (class 2606 OID 16403)
-- Name: branch branch_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.branch
    ADD CONSTRAINT branch_pkey PRIMARY KEY (branchno);


--
-- TOC entry 4772 (class 2606 OID 16424)
-- Name: client client_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.client
    ADD CONSTRAINT client_pkey PRIMARY KEY (clientno);


--
-- TOC entry 4774 (class 2606 OID 16429)
-- Name: privateowner privateowner_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.privateowner
    ADD CONSTRAINT privateowner_pkey PRIMARY KEY (ownerno);


--
-- TOC entry 4770 (class 2606 OID 16417)
-- Name: propertyforrent propertyforrent_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.propertyforrent
    ADD CONSTRAINT propertyforrent_pkey PRIMARY KEY (propertyno);


--
-- TOC entry 4768 (class 2606 OID 16410)
-- Name: staff staff_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.staff
    ADD CONSTRAINT staff_pkey PRIMARY KEY (staffno);


-- Completed on 2026-10-02 08:32:18

--
-- PostgreSQL database dump complete
--

\unrestrict bNGlbOmd5ShfvvdCsBzbLRKE3iEm0b5mvEK0YPmWKsiUMeak4PAg6bIJ8224QO8

