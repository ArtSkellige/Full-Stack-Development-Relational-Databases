--
-- PostgreSQL database dump
--

-- Dumped from database version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)
-- Dumped by pg_dump version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)

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

DROP DATABASE students;
--
-- Name: students; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE students WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE students OWNER TO freecodecamp;

\connect students

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
-- Name: courses; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.courses (
    course_id integer NOT NULL,
    course character varying(100) NOT NULL
);


ALTER TABLE public.courses OWNER TO freecodecamp;

--
-- Name: courses_course_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.courses_course_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.courses_course_id_seq OWNER TO freecodecamp;

--
-- Name: courses_course_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.courses_course_id_seq OWNED BY public.courses.course_id;


--
-- Name: majors; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.majors (
    major_id integer NOT NULL,
    major character varying(50) NOT NULL
);


ALTER TABLE public.majors OWNER TO freecodecamp;

--
-- Name: majors_courses; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.majors_courses (
    major_id integer NOT NULL,
    course_id integer NOT NULL
);


ALTER TABLE public.majors_courses OWNER TO freecodecamp;

--
-- Name: majors_major_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.majors_major_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.majors_major_id_seq OWNER TO freecodecamp;

--
-- Name: majors_major_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.majors_major_id_seq OWNED BY public.majors.major_id;


--
-- Name: students; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.students (
    student_id integer NOT NULL,
    first_name character varying(50) NOT NULL,
    last_name character varying(50) NOT NULL,
    major_id integer,
    gpa numeric(2,1)
);


ALTER TABLE public.students OWNER TO freecodecamp;

--
-- Name: students_student_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.students_student_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.students_student_id_seq OWNER TO freecodecamp;

--
-- Name: students_student_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.students_student_id_seq OWNED BY public.students.student_id;


--
-- Name: courses course_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.courses ALTER COLUMN course_id SET DEFAULT nextval('public.courses_course_id_seq'::regclass);


--
-- Name: majors major_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.majors ALTER COLUMN major_id SET DEFAULT nextval('public.majors_major_id_seq'::regclass);


--
-- Name: students student_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.students ALTER COLUMN student_id SET DEFAULT nextval('public.students_student_id_seq'::regclass);


--
-- Data for Name: courses; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.courses VALUES (70, 'Data Structures and Algorithms');
INSERT INTO public.courses VALUES (71, 'Web Programming');
INSERT INTO public.courses VALUES (72, 'Database Systems');
INSERT INTO public.courses VALUES (73, 'Computer Networks');
INSERT INTO public.courses VALUES (74, 'SQL');
INSERT INTO public.courses VALUES (75, 'Machine Learning');
INSERT INTO public.courses VALUES (76, 'Computer Systems');
INSERT INTO public.courses VALUES (77, 'Web Applications');
INSERT INTO public.courses VALUES (78, 'Artificial Intelligence');
INSERT INTO public.courses VALUES (79, 'Python');
INSERT INTO public.courses VALUES (80, 'Object-Oriented Programming');
INSERT INTO public.courses VALUES (81, 'Calculus');
INSERT INTO public.courses VALUES (82, 'Game Architecture');
INSERT INTO public.courses VALUES (83, 'Algorithms');
INSERT INTO public.courses VALUES (84, 'UNIX');
INSERT INTO public.courses VALUES (85, 'Server Administration');
INSERT INTO public.courses VALUES (86, 'Network Security');


--
-- Data for Name: majors; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.majors VALUES (74, 'Database Administration');
INSERT INTO public.majors VALUES (75, 'Web Development');
INSERT INTO public.majors VALUES (76, 'Data Science');
INSERT INTO public.majors VALUES (77, 'Network Engineering');
INSERT INTO public.majors VALUES (78, 'Computer Programming');
INSERT INTO public.majors VALUES (79, 'Game Design');
INSERT INTO public.majors VALUES (80, 'System Administration');


--
-- Data for Name: majors_courses; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.majors_courses VALUES (74, 70);
INSERT INTO public.majors_courses VALUES (75, 71);
INSERT INTO public.majors_courses VALUES (74, 72);
INSERT INTO public.majors_courses VALUES (76, 70);
INSERT INTO public.majors_courses VALUES (77, 73);
INSERT INTO public.majors_courses VALUES (74, 74);
INSERT INTO public.majors_courses VALUES (76, 75);
INSERT INTO public.majors_courses VALUES (77, 76);
INSERT INTO public.majors_courses VALUES (78, 73);
INSERT INTO public.majors_courses VALUES (74, 77);
INSERT INTO public.majors_courses VALUES (79, 78);
INSERT INTO public.majors_courses VALUES (76, 79);
INSERT INTO public.majors_courses VALUES (78, 80);
INSERT INTO public.majors_courses VALUES (80, 76);
INSERT INTO public.majors_courses VALUES (79, 81);
INSERT INTO public.majors_courses VALUES (75, 70);
INSERT INTO public.majors_courses VALUES (76, 81);
INSERT INTO public.majors_courses VALUES (75, 80);
INSERT INTO public.majors_courses VALUES (79, 82);
INSERT INTO public.majors_courses VALUES (80, 73);
INSERT INTO public.majors_courses VALUES (79, 83);
INSERT INTO public.majors_courses VALUES (80, 84);
INSERT INTO public.majors_courses VALUES (80, 85);
INSERT INTO public.majors_courses VALUES (78, 76);
INSERT INTO public.majors_courses VALUES (78, 79);
INSERT INTO public.majors_courses VALUES (77, 86);
INSERT INTO public.majors_courses VALUES (75, 77);
INSERT INTO public.majors_courses VALUES (77, 83);


--
-- Data for Name: students; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.students VALUES (195, 'Rhea', 'Kellems', 74, 2.5);
INSERT INTO public.students VALUES (196, 'Emma', 'Gilbert', NULL, NULL);
INSERT INTO public.students VALUES (197, 'Kimberly', 'Whitley', 75, 3.8);
INSERT INTO public.students VALUES (198, 'Jimmy', 'Felipe', 74, 3.7);
INSERT INTO public.students VALUES (199, 'Kyle', 'Stimson', NULL, 2.8);
INSERT INTO public.students VALUES (200, 'Casares', 'Hijo', 79, 4.0);
INSERT INTO public.students VALUES (201, 'Noe', 'Savage', NULL, 3.6);
INSERT INTO public.students VALUES (202, 'Sterling', 'Boss', 79, 3.9);
INSERT INTO public.students VALUES (203, 'Brian', 'Davis', NULL, 2.3);
INSERT INTO public.students VALUES (204, 'Kaija', 'Uronen', 79, 3.7);
INSERT INTO public.students VALUES (205, 'Faye', 'Conn', 79, 2.1);
INSERT INTO public.students VALUES (206, 'Efren', 'Reilly', 75, 3.9);
INSERT INTO public.students VALUES (207, 'Danh', 'Nhung', NULL, 2.4);
INSERT INTO public.students VALUES (208, 'Maxine', 'Hagenes', 74, 2.9);
INSERT INTO public.students VALUES (209, 'Larry', 'Saunders', 76, 2.2);
INSERT INTO public.students VALUES (210, 'Karl', 'Kuhar', 75, NULL);
INSERT INTO public.students VALUES (211, 'Lieke', 'Hazenveld', 79, 3.5);
INSERT INTO public.students VALUES (212, 'Obie', 'Hilpert', 75, NULL);
INSERT INTO public.students VALUES (213, 'Peter', 'Booysen', NULL, 2.9);
INSERT INTO public.students VALUES (214, 'Nathan', 'Turner', 74, 3.3);
INSERT INTO public.students VALUES (215, 'Gerald', 'Osiki', 76, 2.2);
INSERT INTO public.students VALUES (216, 'Vanya', 'Hassanah', 79, 4.0);
INSERT INTO public.students VALUES (217, 'Roxelana', 'Florescu', 74, 3.2);
INSERT INTO public.students VALUES (218, 'Helene', 'Parker', 76, 3.4);
INSERT INTO public.students VALUES (219, 'Mariana', 'Russel', 75, 1.8);
INSERT INTO public.students VALUES (220, 'Ajit', 'Dhungel', NULL, 3.0);
INSERT INTO public.students VALUES (221, 'Mehdi', 'Vandenberghe', 74, 1.9);
INSERT INTO public.students VALUES (222, 'Dejon', 'Howell', 75, 4.0);
INSERT INTO public.students VALUES (223, 'Aliya', 'Gulgowski', 80, 2.6);
INSERT INTO public.students VALUES (224, 'Ana', 'Tupajic', 76, 3.1);
INSERT INTO public.students VALUES (225, 'Hugo', 'Duran', NULL, 3.8);


--
-- Name: courses_course_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.courses_course_id_seq', 86, true);


--
-- Name: majors_major_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.majors_major_id_seq', 80, true);


--
-- Name: students_student_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.students_student_id_seq', 225, true);


--
-- Name: courses courses_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.courses
    ADD CONSTRAINT courses_pkey PRIMARY KEY (course_id);


--
-- Name: majors_courses majors_courses_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.majors_courses
    ADD CONSTRAINT majors_courses_pkey PRIMARY KEY (major_id, course_id);


--
-- Name: majors majors_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.majors
    ADD CONSTRAINT majors_pkey PRIMARY KEY (major_id);


--
-- Name: students students_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.students
    ADD CONSTRAINT students_pkey PRIMARY KEY (student_id);


--
-- Name: majors_courses majors_courses_course_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.majors_courses
    ADD CONSTRAINT majors_courses_course_id_fkey FOREIGN KEY (course_id) REFERENCES public.courses(course_id);


--
-- Name: majors_courses majors_courses_major_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.majors_courses
    ADD CONSTRAINT majors_courses_major_id_fkey FOREIGN KEY (major_id) REFERENCES public.majors(major_id);


--
-- Name: students students_major_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.students
    ADD CONSTRAINT students_major_id_fkey FOREIGN KEY (major_id) REFERENCES public.majors(major_id);


--
-- PostgreSQL database dump complete
--

