PGDMP     )    -                y            postgres #   12.6 (Ubuntu 12.6-0ubuntu0.20.04.1) #   12.6 (Ubuntu 12.6-0ubuntu0.20.04.1)     ?           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            ?           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            ?           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            ?           1262    13465    postgres    DATABASE     z   CREATE DATABASE postgres WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'pt_BR.UTF-8' LC_CTYPE = 'pt_BR.UTF-8';
    DROP DATABASE postgres;
                postgres    false            ?           0    0    DATABASE postgres    COMMENT     N   COMMENT ON DATABASE postgres IS 'default administrative connection database';
                   postgres    false    2984            ?            1259    18301 
   activities    TABLE     ?   CREATE TABLE public.activities (
    id integer NOT NULL,
    name character varying NOT NULL,
    startdate date NOT NULL,
    enddate date NOT NULL,
    finished boolean,
    project_id integer NOT NULL
);
    DROP TABLE public.activities;
       public         heap    postgres    false            ?            1259    18299    activities_id_seq    SEQUENCE     ?   CREATE SEQUENCE public.activities_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.activities_id_seq;
       public          postgres    false    205            ?           0    0    activities_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.activities_id_seq OWNED BY public.activities.id;
          public          postgres    false    204            ?            1259    18284    projects    TABLE     ?   CREATE TABLE public.projects (
    id integer NOT NULL,
    name character varying NOT NULL,
    startdate timestamp(0) without time zone,
    enddate timestamp(0) without time zone
);
    DROP TABLE public.projects;
       public         heap    postgres    false            ?            1259    18290    projects_id_seq    SEQUENCE     ?   CREATE SEQUENCE public.projects_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.projects_id_seq;
       public          postgres    false    202            ?           0    0    projects_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.projects_id_seq OWNED BY public.projects.id;
          public          postgres    false    203                       2604    18304    activities id    DEFAULT     n   ALTER TABLE ONLY public.activities ALTER COLUMN id SET DEFAULT nextval('public.activities_id_seq'::regclass);
 <   ALTER TABLE public.activities ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    205    204    205                       2604    18292    projects id    DEFAULT     j   ALTER TABLE ONLY public.projects ALTER COLUMN id SET DEFAULT nextval('public.projects_id_seq'::regclass);
 :   ALTER TABLE public.projects ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    203    202            ?          0    18301 
   activities 
   TABLE DATA           X   COPY public.activities (id, name, startdate, enddate, finished, project_id) FROM stdin;
    public          postgres    false    205            ?          0    18284    projects 
   TABLE DATA           @   COPY public.projects (id, name, startdate, enddate) FROM stdin;
    public          postgres    false    202            ?           0    0    activities_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.activities_id_seq', 19, true);
          public          postgres    false    204            ?           0    0    projects_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.projects_id_seq', 33, true);
          public          postgres    false    203                       2606    18309    activities activities_pk 
   CONSTRAINT     V   ALTER TABLE ONLY public.activities
    ADD CONSTRAINT activities_pk PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.activities DROP CONSTRAINT activities_pk;
       public            postgres    false    205                       2606    18311    projects projects_pk 
   CONSTRAINT     R   ALTER TABLE ONLY public.projects
    ADD CONSTRAINT projects_pk PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.projects DROP CONSTRAINT projects_pk;
       public            postgres    false    202                        2606    18347    activities activities_fk    FK CONSTRAINT     }   ALTER TABLE ONLY public.activities
    ADD CONSTRAINT activities_fk FOREIGN KEY (project_id) REFERENCES public.projects(id);
 B   ALTER TABLE ONLY public.activities DROP CONSTRAINT activities_fk;
       public          postgres    false    205    2845    202            ?   t   x?m?K
?0??)????O?]?T! ???E???B??A??"W-?![?????9??7??r8ց???Q4Ľ$?4?&?YdϦ???s?Y?-??O?aޤ?r???? ?\i3?      ?   ?   x???Q
?0??????M?D??K??jSX?????!??????Ϫ?X?+4h;?;????\??f???4p?@	%0??YU? ˋ d??%E?!?w?r???:uKܜ???ݵ????~G?????ovY?          ?           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            ?           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            ?           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            ?           1262    13465    postgres    DATABASE     z   CREATE DATABASE postgres WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'pt_BR.UTF-8' LC_CTYPE = 'pt_BR.UTF-8';
    DROP DATABASE postgres;
                postgres    false            ?           0    0    DATABASE postgres    COMMENT     N   COMMENT ON DATABASE postgres IS 'default administrative connection database';
                   postgres    false    2984            ?            1259    18301 
   activities    TABLE     ?   CREATE TABLE public.activities (
    id integer NOT NULL,
    name character varying NOT NULL,
    startdate date NOT NULL,
    enddate date NOT NULL,
    finished boolean,
    project_id integer NOT NULL
);
    DROP TABLE public.activities;
       public         heap    postgres    false            ?            1259    18299    activities_id_seq    SEQUENCE     ?   CREATE SEQUENCE public.activities_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.activities_id_seq;
       public          postgres    false    205            ?           0    0    activities_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.activities_id_seq OWNED BY public.activities.id;
          public          postgres    false    204            ?            1259    18284    projects    TABLE     ?   CREATE TABLE public.projects (
    id integer NOT NULL,
    name character varying NOT NULL,
    startdate timestamp(0) without time zone,
    enddate timestamp(0) without time zone
);
    DROP TABLE public.projects;
       public         heap    postgres    false            ?            1259    18290    projects_id_seq    SEQUENCE     ?   CREATE SEQUENCE public.projects_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.projects_id_seq;
       public          postgres    false    202            ?           0    0    projects_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.projects_id_seq OWNED BY public.projects.id;
          public          postgres    false    203                       2604    18304    activities id    DEFAULT     n   ALTER TABLE ONLY public.activities ALTER COLUMN id SET DEFAULT nextval('public.activities_id_seq'::regclass);
 <   ALTER TABLE public.activities ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    205    204    205                       2604    18292    projects id    DEFAULT     j   ALTER TABLE ONLY public.projects ALTER COLUMN id SET DEFAULT nextval('public.projects_id_seq'::regclass);
 :   ALTER TABLE public.projects ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    203    202            ?          0    18301 
   activities 
   TABLE DATA           X   COPY public.activities (id, name, startdate, enddate, finished, project_id) FROM stdin;
    public          postgres    false    205          ?          0    18284    projects 
   TABLE DATA           @   COPY public.projects (id, name, startdate, enddate) FROM stdin;
    public          postgres    false    202   ?       ?           0    0    activities_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.activities_id_seq', 19, true);
          public          postgres    false    204            ?           0    0    projects_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.projects_id_seq', 33, true);
          public          postgres    false    203                       2606    18309    activities activities_pk 
   CONSTRAINT     V   ALTER TABLE ONLY public.activities
    ADD CONSTRAINT activities_pk PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.activities DROP CONSTRAINT activities_pk;
       public            postgres    false    205                       2606    18311    projects projects_pk 
   CONSTRAINT     R   ALTER TABLE ONLY public.projects
    ADD CONSTRAINT projects_pk PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.projects DROP CONSTRAINT projects_pk;
       public            postgres    false    202                        2606    18347    activities activities_fk    FK CONSTRAINT     }   ALTER TABLE ONLY public.activities
    ADD CONSTRAINT activities_fk FOREIGN KEY (project_id) REFERENCES public.projects(id);
 B   ALTER TABLE ONLY public.activities DROP CONSTRAINT activities_fk;
       public          postgres    false    205    2845    202           