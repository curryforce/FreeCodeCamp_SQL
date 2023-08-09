--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

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

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    age_in_million_of_years integer,
    distance_to_earth_in_km numeric,
    has_life boolean,
    description text
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: lookup; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.lookup (
    name character varying(30) NOT NULL,
    lookup_id integer NOT NULL,
    third_column text
);


ALTER TABLE public.lookup OWNER TO freecodecamp;

--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(30) NOT NULL,
    age_in_million_of_years integer,
    distance_to_earth_in_km numeric,
    has_life boolean,
    description text,
    planet_id integer
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(30) NOT NULL,
    age_in_million_of_years integer,
    distance_to_earth_in_km numeric,
    has_life boolean,
    description text,
    star_id integer
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(30) NOT NULL,
    age_in_million_of_years integer,
    distance_to_earth_in_km numeric,
    has_life boolean,
    description text,
    galaxy_id integer
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Galaxy One', 300000, 12312515, false, 'Shitty Place');
INSERT INTO public.galaxy VALUES (2, 'Galaxy Two', 400000, 1231254, true, 'Less Shitty Place');
INSERT INTO public.galaxy VALUES (3, 'Galaxy Three', 500000, 123123515, true, 'A bit Shitty Place');
INSERT INTO public.galaxy VALUES (4, 'Galaxy Four', 600000, 123125515, false, 'Slightly Shitty Place');
INSERT INTO public.galaxy VALUES (5, 'Galaxy Five', 700000, 1231254515, true, 'Not so Shitty Place');
INSERT INTO public.galaxy VALUES (6, 'Galaxy Six', 800000, 12312523415, false, 'Again Shitty Place');


--
-- Data for Name: lookup; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.lookup VALUES ('First', 1, NULL);
INSERT INTO public.lookup VALUES ('Second', 2, NULL);
INSERT INTO public.lookup VALUES ('Third', 3, NULL);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'moon One', 30300, 12312515, false, 'Shitty moon', 5);
INSERT INTO public.moon VALUES (2, 'moon Two', 40400, 1231254, true, 'Less Shitty moon', 6);
INSERT INTO public.moon VALUES (3, 'moon Three', 50100, 123123515, true, 'A bit Shitty moon', 3);
INSERT INTO public.moon VALUES (4, 'moon Four', 60200, 12312515, false, 'Slightly Shitty moon', 4);
INSERT INTO public.moon VALUES (5, 'moon Five', 70300, 1231254515, true, 'Not so Shitty moon', 6);
INSERT INTO public.moon VALUES (6, 'moon Six', 80400, 12312523415, false, 'Ok Shitty moon', 5);
INSERT INTO public.moon VALUES (7, 'moon Six', 80500, 1231223415, false, 'Mega Shitty moon', 5);
INSERT INTO public.moon VALUES (8, 'moon Six', 80060, 12312523415, false, 'Veryy Shitty moon', 6);
INSERT INTO public.moon VALUES (9, 'moon Six', 80040, 12312523415, true, 'Nice Shitty moon', 3);
INSERT INTO public.moon VALUES (10, 'moon Six', 80300, 1231252415, true, 'Awesome Shitty moon', 4);
INSERT INTO public.moon VALUES (11, 'moon 11', 80400, 1231253415, false, 'Fabulous Shitty moon', 6);
INSERT INTO public.moon VALUES (12, 'moon 12', 80500, 1231223415, true, 'Badly Shitty moon1', 5);
INSERT INTO public.moon VALUES (13, 'moon 13', 80500, 1231223415, true, 'Badly Shitty moon2', 5);
INSERT INTO public.moon VALUES (14, 'moon 14', 80500, 1231223415, true, 'Badly Shitty moon3', 6);
INSERT INTO public.moon VALUES (15, 'moon 15', 80500, 1231223415, true, 'Badly Shitty moon4', 3);
INSERT INTO public.moon VALUES (16, 'moon 16', 80500, 1231223415, true, 'Badly Shitty moon5', 4);
INSERT INTO public.moon VALUES (17, 'moon 17', 80500, 1231223415, true, 'Badly Shitty moon6', 6);
INSERT INTO public.moon VALUES (18, 'moon 18', 80500, 1231223415, true, 'Badly Shitty moon7', 5);
INSERT INTO public.moon VALUES (19, 'moon 19', 80500, 1231223415, true, 'Badly Shitty moon8', 5);
INSERT INTO public.moon VALUES (20, 'moon 20', 80500, 1231223415, true, 'Badly Shitty moon9', 6);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Planet One', 30300, 12312515, false, 'Shitty Planet', 1);
INSERT INTO public.planet VALUES (2, 'Planet Two', 40400, 1231254, true, 'Less Shitty Planet', 1);
INSERT INTO public.planet VALUES (3, 'Planet Three', 50100, 123123515, true, 'A bit Shitty Planet', 3);
INSERT INTO public.planet VALUES (4, 'Planet Four', 60200, 12312515, false, 'Slightly Shitty Planet', 4);
INSERT INTO public.planet VALUES (5, 'Planet Five', 70300, 1231254515, true, 'Not so Shitty Planet', 2);
INSERT INTO public.planet VALUES (6, 'Planet Six', 80400, 12312523415, false, 'Ok Shitty Planet', 5);
INSERT INTO public.planet VALUES (7, 'Planet Six', 80500, 1231223415, false, 'Mega Shitty Planet', 5);
INSERT INTO public.planet VALUES (8, 'Planet Six', 80060, 12312523415, false, 'Veryy Shitty Planet', 6);
INSERT INTO public.planet VALUES (9, 'Planet Six', 80040, 12312523415, true, 'Nice Shitty Planet', 3);
INSERT INTO public.planet VALUES (10, 'Planet Six', 80300, 1231252415, true, 'Awesome Shitty Planet', 4);
INSERT INTO public.planet VALUES (11, 'Planet Six', 80400, 1231253415, false, 'Fabulous Shitty Planet', 6);
INSERT INTO public.planet VALUES (12, 'Planet Six', 80500, 1231223415, true, 'Badly Shitty Planet', 5);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Galaxy One', 300000, 12312515, false, 'Shitty Star', 1);
INSERT INTO public.star VALUES (2, 'Star Two', 4000, 1231254, true, 'Less Shitty Star', 1);
INSERT INTO public.star VALUES (3, 'Star Three', 5000, 123123515, true, 'A bit Shitty Star', 3);
INSERT INTO public.star VALUES (4, 'Star Four', 6000, 123125515, false, 'Slightly Shitty Star', 4);
INSERT INTO public.star VALUES (5, 'Star Five', 7000, 1231254515, true, 'Not so Shitty Star', 2);
INSERT INTO public.star VALUES (6, 'Star Six', 8000, 12312523415, false, 'Again Shitty Star', 5);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 1, false);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 1, false);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 1, false);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 1, false);


--
-- Name: galaxy galaxy_galaxy_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_galaxy_id_key UNIQUE (galaxy_id);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: lookup lookup_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.lookup
    ADD CONSTRAINT lookup_id_key UNIQUE (lookup_id);


--
-- Name: lookup lookup_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.lookup
    ADD CONSTRAINT lookup_pkey PRIMARY KEY (lookup_id);


--
-- Name: moon moon_moon_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_moon_id_key UNIQUE (moon_id);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: planet planet_planet_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_planet_id_key UNIQUE (planet_id);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: star star_star_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_star_id_key UNIQUE (star_id);


--
-- Name: moon ref_to_planet; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT ref_to_planet FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet ref_to_star; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT ref_to_star FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

