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
    name character varying(30) NOT NULL,
    galaxy_id integer NOT NULL,
    description text NOT NULL,
    diameter numeric NOT NULL,
    number_of_stars integer NOT NULL
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
-- Name: galaxy_types; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy_types (
    name character varying(30) NOT NULL,
    galaxy_types_id integer NOT NULL,
    galaxy_id integer NOT NULL
);


ALTER TABLE public.galaxy_types OWNER TO freecodecamp;

--
-- Name: galaxy_types_galaxy_types_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_types_galaxy_types_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_types_galaxy_types_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_types_galaxy_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_types_galaxy_types_id_seq OWNED BY public.galaxy_types.galaxy_types_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    name character varying(30) NOT NULL,
    moon_id integer NOT NULL,
    planet_id integer NOT NULL,
    description text NOT NULL,
    circumference numeric NOT NULL
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
    name character varying(30) NOT NULL,
    planet_id integer NOT NULL,
    star_id integer NOT NULL,
    has_life boolean,
    is_spherical boolean,
    distance_from_earth numeric,
    age_in_millions_of_years integer
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
    name character varying(30) NOT NULL,
    star_id integer NOT NULL,
    galaxy_id integer NOT NULL,
    description text,
    age_in_millions_of_years integer
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
-- Name: galaxy_types galaxy_types_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_types ALTER COLUMN galaxy_types_id SET DEFAULT nextval('public.galaxy_types_galaxy_types_id_seq'::regclass);


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

INSERT INTO public.galaxy VALUES ('Milky Way', 1, 'Our galaxy', 100000, 20000000);
INSERT INTO public.galaxy VALUES ('Andromeda', 2, 'Neighboring galaxy', 120000, 10000000);
INSERT INTO public.galaxy VALUES ('Triangulum', 3, 'Small galaxy', 620000, 50000000);
INSERT INTO public.galaxy VALUES ('Messier 87', 4, 'Giant elliptical galaxy', 12000, 10000000);
INSERT INTO public.galaxy VALUES ('Whirlpool', 5, 'Spiral galaxy with a companion', 15000, 30000000);
INSERT INTO public.galaxy VALUES ('Sombrero', 6, 'Bright elliptical galaxy', 80000, 15000000);
INSERT INTO public.galaxy VALUES ('Pinwheel', 7, 'Spiral galaxy', 1300000, 45000000);
INSERT INTO public.galaxy VALUES ('Sunflower', 8, 'Spiral galaxy', 75000, 200000000);
INSERT INTO public.galaxy VALUES ('Black Eye', 9, 'Elliptical galaxy', 90000, 800000000);
INSERT INTO public.galaxy VALUES ('Cartwheel', 10, 'Ring galaxy', 110000, 600000000);


--
-- Data for Name: galaxy_types; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy_types VALUES ('Spiral', 1, 1);
INSERT INTO public.galaxy_types VALUES ('Elliptical', 2, 2);
INSERT INTO public.galaxy_types VALUES ('Irregular', 3, 3);
INSERT INTO public.galaxy_types VALUES ('Lenticular', 4, 4);
INSERT INTO public.galaxy_types VALUES ('Peculiar', 5, 5);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES ('Moon', 1, 1, 'Earths natural satellite', 10921);
INSERT INTO public.moon VALUES ('Phobos', 2, 2, 'Mars larger moon', 1130);
INSERT INTO public.moon VALUES ('Deimos', 3, 2, 'Mars smaller room', 380);
INSERT INTO public.moon VALUES ('Io', 4, 3, 'Volcanic moon of Jupiter', 4200);
INSERT INTO public.moon VALUES ('Europa', 5, 3, 'Icy moon of Jupiter', 3120);
INSERT INTO public.moon VALUES ('Ganymede', 6, 4, 'Largest moon of Jupiter', 5260);
INSERT INTO public.moon VALUES ('Callisto', 7, 4, 'Moon of Jupiter', 4800);
INSERT INTO public.moon VALUES ('Titan', 8, 5, 'Largest moon of Saturn', 8000);
INSERT INTO public.moon VALUES ('Rhea', 9, 5, 'Moon of Saturn', 4200);
INSERT INTO public.moon VALUES ('Iapetus', 10, 5, 'Moon of Saturn', 3800);
INSERT INTO public.moon VALUES ('Mimas', 11, 5, 'Moon of Saturn', 3900);
INSERT INTO public.moon VALUES ('Enceladus', 12, 5, 'Moon of Saturn with water jets', 500);
INSERT INTO public.moon VALUES ('Triton', 13, 6, 'Moon of Neptune', 6000);
INSERT INTO public.moon VALUES ('Charon', 14, 7, 'Moon of Pluto', 2500);
INSERT INTO public.moon VALUES ('Miranda', 15, 6, 'Moon of Uranus', 4700);
INSERT INTO public.moon VALUES ('Ariel', 16, 6, 'Moon of Uranus', 5400);
INSERT INTO public.moon VALUES ('Umbriel', 17, 6, 'Moon of Uranus', 3000);
INSERT INTO public.moon VALUES ('Titania', 18, 6, 'Moon of Uranus', 5200);
INSERT INTO public.moon VALUES ('Oberon', 19, 6, 'Moon of Uranus', 6000);
INSERT INTO public.moon VALUES ('Phoebe', 20, 5, 'Moon of Saturn', 4200);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES ('Earth', 1, 1, true, true, 1, 4500);
INSERT INTO public.planet VALUES ('Mars', 2, 2, false, true, 1.5, 4500);
INSERT INTO public.planet VALUES ('Venus', 3, 3, false, true, 0.8, 4600);
INSERT INTO public.planet VALUES ('Jupiter', 4, 4, false, true, 5.2, 4600);
INSERT INTO public.planet VALUES ('Saturn', 5, 5, false, true, 9.5, 4600);
INSERT INTO public.planet VALUES ('Uranus', 6, 6, false, true, 19.2, 4600);
INSERT INTO public.planet VALUES ('Neptune', 7, 7, false, true, 30.1, 4600);
INSERT INTO public.planet VALUES ('Mercury', 8, 8, false, true, 0.4, 4600);
INSERT INTO public.planet VALUES ('Pluto', 9, 9, false, true, 39.5, 4600);
INSERT INTO public.planet VALUES ('Titan', 10, 1, false, true, 1.22, 4600);
INSERT INTO public.planet VALUES ('Europa', 11, 1, true, true, 1.6, 4600);
INSERT INTO public.planet VALUES ('Io', 12, 1, false, true, 1.5, 4600);
INSERT INTO public.planet VALUES ('Ganymede', 13, 1, false, true, 2.5, 4600);
INSERT INTO public.planet VALUES ('Callisto', 14, 1, false, true, 3.0, 4600);
INSERT INTO public.planet VALUES ('Ceres', 15, 1, false, true, 2.8, 4600);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES ('Sun', 1, 1, 'Our Sun', 4600);
INSERT INTO public.star VALUES ('Sirius', 2, 1, 'Brightest star in the sky', 200);
INSERT INTO public.star VALUES ('Alpha Centauri', 3, 1, 'Closest star system', 5800);
INSERT INTO public.star VALUES ('Betelgeuse', 4, 2, 'Red supergiant star', 100);
INSERT INTO public.star VALUES ('Proxima Centauri', 5, 3, 'Closest star to Earth', 4700);
INSERT INTO public.star VALUES ('Rigel', 6, 2, 'Blue supergiant', 100);
INSERT INTO public.star VALUES ('Antares', 7, 4, 'Red supergiant star', 8000);
INSERT INTO public.star VALUES ('Vega', 8, 5, 'Bright star', 500);
INSERT INTO public.star VALUES ('Polaris', 9, 6, 'North star', 7000);
INSERT INTO public.star VALUES ('Spica', 10, 7, 'Binary star system', 400);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 1, false);


--
-- Name: galaxy_types_galaxy_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_types_galaxy_types_id_seq', 5, true);


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
-- Name: galaxy galaxy_name_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_unique UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: galaxy_types galaxy_types_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_types
    ADD CONSTRAINT galaxy_types_name_key UNIQUE (name);


--
-- Name: galaxy_types galaxy_types_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_types
    ADD CONSTRAINT galaxy_types_pkey PRIMARY KEY (galaxy_types_id);


--
-- Name: moon moon_name_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_unique UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_unique UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_unique UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: galaxy_types galaxy_types_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_types
    ADD CONSTRAINT galaxy_types_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


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

