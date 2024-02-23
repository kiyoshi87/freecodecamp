--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

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
    description text,
    galaxy_types character varying(50),
    status_id integer DEFAULT 1 NOT NULL
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
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(30) NOT NULL,
    description text,
    moon_types character varying(50),
    planet_id integer NOT NULL,
    status_id integer DEFAULT 1 NOT NULL
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
    description text,
    planet_types character varying(50),
    has_water boolean,
    has_life boolean,
    star_id integer NOT NULL,
    status_id integer DEFAULT 1 NOT NULL
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_image; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet_image (
    planet_image_id integer NOT NULL,
    name character varying(30) NOT NULL,
    image_url character varying(255),
    description text,
    planet_id integer NOT NULL,
    status_id integer DEFAULT 1 NOT NULL
);


ALTER TABLE public.planet_image OWNER TO freecodecamp;

--
-- Name: planet_image_planet_image_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_image_planet_image_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_image_planet_image_id_seq OWNER TO freecodecamp;

--
-- Name: planet_image_planet_image_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_image_planet_image_id_seq OWNED BY public.planet_image.planet_image_id;


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
    description text,
    star_types character varying(50),
    distance_from_earth integer,
    age_in_millions_of_years numeric,
    galaxy_id integer NOT NULL,
    status_id integer DEFAULT 1 NOT NULL
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
-- Name: planet_image planet_image_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_image ALTER COLUMN planet_image_id SET DEFAULT nextval('public.planet_image_planet_image_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'galaxy 1', NULL, 'type', 1);
INSERT INTO public.galaxy VALUES (2, 'galaxy 2', NULL, 'type', 1);
INSERT INTO public.galaxy VALUES (3, 'galaxy 3', NULL, 'type', 1);
INSERT INTO public.galaxy VALUES (4, 'galaxy 4', NULL, 'type', 1);
INSERT INTO public.galaxy VALUES (5, 'galaxy 5', NULL, 'type', 1);
INSERT INTO public.galaxy VALUES (6, 'galaxy 6', NULL, 'type', 1);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'moon 1', NULL, 'type', 1, 1);
INSERT INTO public.moon VALUES (2, 'moon 2', NULL, 'type', 1, 1);
INSERT INTO public.moon VALUES (3, 'moon 3', NULL, 'type', 1, 1);
INSERT INTO public.moon VALUES (4, 'moon 4', NULL, 'type', 2, 1);
INSERT INTO public.moon VALUES (5, 'moon 5', NULL, 'type', 2, 1);
INSERT INTO public.moon VALUES (6, 'moon 6', NULL, 'type', 2, 1);
INSERT INTO public.moon VALUES (7, 'moon 7', NULL, 'type', 2, 1);
INSERT INTO public.moon VALUES (8, 'moon 8', NULL, 'type', 2, 1);
INSERT INTO public.moon VALUES (9, 'moon 9', NULL, 'type', 3, 1);
INSERT INTO public.moon VALUES (10, 'moon 10', NULL, 'type', 3, 1);
INSERT INTO public.moon VALUES (11, 'moon 11', NULL, 'type', 3, 1);
INSERT INTO public.moon VALUES (12, 'moon 12', NULL, 'type', 3, 1);
INSERT INTO public.moon VALUES (13, 'moon 13', NULL, 'type', 4, 1);
INSERT INTO public.moon VALUES (14, 'moon 14', NULL, 'type', 4, 1);
INSERT INTO public.moon VALUES (15, 'moon 15', NULL, 'type', 4, 1);
INSERT INTO public.moon VALUES (16, 'moon 16', NULL, 'type', 4, 1);
INSERT INTO public.moon VALUES (17, 'moon 17', NULL, 'type', 5, 1);
INSERT INTO public.moon VALUES (18, 'moon 18', NULL, 'type', 5, 1);
INSERT INTO public.moon VALUES (19, 'moon 19', NULL, 'type', 5, 1);
INSERT INTO public.moon VALUES (20, 'moon 20', NULL, 'type', 5, 1);
INSERT INTO public.moon VALUES (21, 'moon 21', NULL, 'type', 6, 1);
INSERT INTO public.moon VALUES (22, 'moon 22', NULL, 'type', 6, 1);
INSERT INTO public.moon VALUES (23, 'moon 23', NULL, 'type', 6, 1);
INSERT INTO public.moon VALUES (24, 'moon 24', NULL, 'type', 6, 1);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'planet 1', NULL, 'type', false, false, 1, 1);
INSERT INTO public.planet VALUES (2, 'planet 2', NULL, 'type', false, false, 2, 1);
INSERT INTO public.planet VALUES (3, 'planet 3', NULL, 'type', false, false, 3, 1);
INSERT INTO public.planet VALUES (4, 'planet 4', NULL, 'type', false, false, 4, 1);
INSERT INTO public.planet VALUES (5, 'planet 5', NULL, 'type', false, false, 5, 1);
INSERT INTO public.planet VALUES (6, 'planet 6', NULL, 'type', false, false, 6, 1);
INSERT INTO public.planet VALUES (7, 'planet 7', NULL, 'type', false, false, 1, 1);
INSERT INTO public.planet VALUES (8, 'planet 8', NULL, 'type', false, false, 2, 1);
INSERT INTO public.planet VALUES (9, 'planet 9', NULL, 'type', false, false, 3, 1);
INSERT INTO public.planet VALUES (10, 'planet 10', NULL, 'type', false, false, 4, 1);
INSERT INTO public.planet VALUES (11, 'planet 11', NULL, 'type', false, false, 5, 1);
INSERT INTO public.planet VALUES (12, 'planet 12', NULL, 'type', false, false, 6, 1);


--
-- Data for Name: planet_image; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet_image VALUES (1, 'image 1', 'url', NULL, 1, 1);
INSERT INTO public.planet_image VALUES (2, 'image 2', 'url', NULL, 2, 1);
INSERT INTO public.planet_image VALUES (3, 'image 3', 'url', NULL, 3, 1);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'star 1', NULL, 'type', 0, 0, 1, 1);
INSERT INTO public.star VALUES (2, 'star 2', NULL, 'type', 0, 0, 2, 1);
INSERT INTO public.star VALUES (3, 'star 3', NULL, 'type', 0, 0, 3, 1);
INSERT INTO public.star VALUES (4, 'star 4', NULL, 'type', 0, 0, 4, 1);
INSERT INTO public.star VALUES (5, 'star 5', NULL, 'type', 0, 0, 5, 1);
INSERT INTO public.star VALUES (6, 'star 6', NULL, 'type', 0, 0, 6, 1);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 24, true);


--
-- Name: planet_image_planet_image_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_image_planet_image_id_seq', 3, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet_image planet_image_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_image
    ADD CONSTRAINT planet_image_name_key UNIQUE (name);


--
-- Name: planet_image planet_image_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_image
    ADD CONSTRAINT planet_image_pkey PRIMARY KEY (planet_image_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet_image planet_image_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_image
    ADD CONSTRAINT planet_image_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

