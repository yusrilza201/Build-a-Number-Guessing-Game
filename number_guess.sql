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

DROP DATABASE number_guess;
--
-- Name: number_guess; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE number_guess WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE number_guess OWNER TO freecodecamp;

\connect number_guess

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
-- Name: username; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.username (
    username character varying(22) NOT NULL,
    games_played integer,
    best_game integer
);


ALTER TABLE public.username OWNER TO freecodecamp;

--
-- Data for Name: username; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.username VALUES ('user_1716305942401', 2, 556);
INSERT INTO public.username VALUES ('user_1716305942402', 5, 802);
INSERT INTO public.username VALUES ('user_1716305998710', 2, 892);
INSERT INTO public.username VALUES ('user_1716305998711', 5, 899);
INSERT INTO public.username VALUES ('Raiden', 1, 7);
INSERT INTO public.username VALUES ('user_1716306063662', 2, 655);
INSERT INTO public.username VALUES ('user_1716306063663', 5, 765);
INSERT INTO public.username VALUES ('user_1716306104066', 2, 654);
INSERT INTO public.username VALUES ('user_1716306104067', 5, 947);
INSERT INTO public.username VALUES ('user_1716306148543', 2, 500);
INSERT INTO public.username VALUES ('user_1716306148544', 5, 787);


--
-- PostgreSQL database dump complete
--

