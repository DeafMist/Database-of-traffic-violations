PGDMP                         y            fines_db    9.6.24    9.6.24 '    q           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                       false            r           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                       false            s           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                       false            t           1262    16393    fines_db    DATABASE     �   CREATE DATABASE fines_db WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'Russian_Russia.1251' LC_CTYPE = 'Russian_Russia.1251';
    DROP DATABASE fines_db;
             postgres    false                        2615    2200    public    SCHEMA        CREATE SCHEMA public;
    DROP SCHEMA public;
             postgres    false            u           0    0    SCHEMA public    COMMENT     6   COMMENT ON SCHEMA public IS 'standard public schema';
                  postgres    false    3                        3079    12387    plpgsql 	   EXTENSION     ?   CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;
    DROP EXTENSION plpgsql;
                  false            v           0    0    EXTENSION plpgsql    COMMENT     @   COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';
                       false    1            �            1259    16425    cars    TABLE     �   CREATE TABLE public.cars (
    id bigint NOT NULL,
    brand character varying(100) NOT NULL,
    number integer NOT NULL,
    power integer NOT NULL,
    owner_id integer NOT NULL
);
    DROP TABLE public.cars;
       public         postgres    false    3            �            1259    16423    cars_id_seq    SEQUENCE     t   CREATE SEQUENCE public.cars_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 "   DROP SEQUENCE public.cars_id_seq;
       public       postgres    false    3    190            w           0    0    cars_id_seq    SEQUENCE OWNED BY     ;   ALTER SEQUENCE public.cars_id_seq OWNED BY public.cars.id;
            public       postgres    false    189            �            1259    16417    cops    TABLE     �   CREATE TABLE public.cops (
    id bigint NOT NULL,
    name character varying(100) NOT NULL,
    birth_date date NOT NULL,
    country character varying(100) NOT NULL
);
    DROP TABLE public.cops;
       public         postgres    false    3            �            1259    16415    cops_id_seq    SEQUENCE     t   CREATE SEQUENCE public.cops_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 "   DROP SEQUENCE public.cops_id_seq;
       public       postgres    false    188    3            x           0    0    cops_id_seq    SEQUENCE OWNED BY     ;   ALTER SEQUENCE public.cops_id_seq OWNED BY public.cops.id;
            public       postgres    false    187            �            1259    16433    fines    TABLE     �   CREATE TABLE public.fines (
    id bigint NOT NULL,
    person_id integer NOT NULL,
    car_id integer NOT NULL,
    violation character varying(200) NOT NULL,
    price integer NOT NULL,
    date_violation date NOT NULL,
    cop_id integer NOT NULL
);
    DROP TABLE public.fines;
       public         postgres    false    3            �            1259    16431    fines_id_seq    SEQUENCE     u   CREATE SEQUENCE public.fines_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.fines_id_seq;
       public       postgres    false    192    3            y           0    0    fines_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.fines_id_seq OWNED BY public.fines.id;
            public       postgres    false    191            �            1259    16396    persons    TABLE     �   CREATE TABLE public.persons (
    id bigint NOT NULL,
    name character varying(100) NOT NULL,
    birth_date date NOT NULL,
    country character varying(100) NOT NULL,
    license_num integer NOT NULL
);
    DROP TABLE public.persons;
       public         postgres    false    3            �            1259    16394    persons_id_seq    SEQUENCE     w   CREATE SEQUENCE public.persons_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.persons_id_seq;
       public       postgres    false    186    3            z           0    0    persons_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE public.persons_id_seq OWNED BY public.persons.id;
            public       postgres    false    185            �           2604    16428    cars id    DEFAULT     b   ALTER TABLE ONLY public.cars ALTER COLUMN id SET DEFAULT nextval('public.cars_id_seq'::regclass);
 6   ALTER TABLE public.cars ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    189    190    190            �           2604    16420    cops id    DEFAULT     b   ALTER TABLE ONLY public.cops ALTER COLUMN id SET DEFAULT nextval('public.cops_id_seq'::regclass);
 6   ALTER TABLE public.cops ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    188    187    188            �           2604    16436    fines id    DEFAULT     d   ALTER TABLE ONLY public.fines ALTER COLUMN id SET DEFAULT nextval('public.fines_id_seq'::regclass);
 7   ALTER TABLE public.fines ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    192    191    192            �           2604    16399 
   persons id    DEFAULT     h   ALTER TABLE ONLY public.persons ALTER COLUMN id SET DEFAULT nextval('public.persons_id_seq'::regclass);
 9   ALTER TABLE public.persons ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    186    185    186            l          0    16425    cars 
   TABLE DATA               B   COPY public.cars (id, brand, number, power, owner_id) FROM stdin;
    public       postgres    false    190   M'       {           0    0    cars_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.cars_id_seq', 100, true);
            public       postgres    false    189            j          0    16417    cops 
   TABLE DATA               =   COPY public.cops (id, name, birth_date, country) FROM stdin;
    public       postgres    false    188   Y,       |           0    0    cops_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('public.cops_id_seq', 30, true);
            public       postgres    false    187            n          0    16433    fines 
   TABLE DATA               `   COPY public.fines (id, person_id, car_id, violation, price, date_violation, cop_id) FROM stdin;
    public       postgres    false    192   2/       }           0    0    fines_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.fines_id_seq', 1000, true);
            public       postgres    false    191            h          0    16396    persons 
   TABLE DATA               M   COPY public.persons (id, name, birth_date, country, license_num) FROM stdin;
    public       postgres    false    186   �Z       ~           0    0    persons_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.persons_id_seq', 100, true);
            public       postgres    false    185            �           2606    16430    cars cars_pkey 
   CONSTRAINT     L   ALTER TABLE ONLY public.cars
    ADD CONSTRAINT cars_pkey PRIMARY KEY (id);
 8   ALTER TABLE ONLY public.cars DROP CONSTRAINT cars_pkey;
       public         postgres    false    190    190            �           2606    16422    cops cops_pkey 
   CONSTRAINT     L   ALTER TABLE ONLY public.cops
    ADD CONSTRAINT cops_pkey PRIMARY KEY (id);
 8   ALTER TABLE ONLY public.cops DROP CONSTRAINT cops_pkey;
       public         postgres    false    188    188            �           2606    16438    fines fines_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.fines
    ADD CONSTRAINT fines_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.fines DROP CONSTRAINT fines_pkey;
       public         postgres    false    192    192            �           2606    16401    persons persons_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.persons
    ADD CONSTRAINT persons_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.persons DROP CONSTRAINT persons_pkey;
       public         postgres    false    186    186            �           2606    16444    fines fines_car_id_fkey    FK CONSTRAINT     t   ALTER TABLE ONLY public.fines
    ADD CONSTRAINT fines_car_id_fkey FOREIGN KEY (car_id) REFERENCES public.cars(id);
 A   ALTER TABLE ONLY public.fines DROP CONSTRAINT fines_car_id_fkey;
       public       postgres    false    2028    190    192            �           2606    16449    fines fines_cop_id_fkey    FK CONSTRAINT     t   ALTER TABLE ONLY public.fines
    ADD CONSTRAINT fines_cop_id_fkey FOREIGN KEY (cop_id) REFERENCES public.cops(id);
 A   ALTER TABLE ONLY public.fines DROP CONSTRAINT fines_cop_id_fkey;
       public       postgres    false    192    188    2026            �           2606    16439    fines fines_person_id_fkey    FK CONSTRAINT     }   ALTER TABLE ONLY public.fines
    ADD CONSTRAINT fines_person_id_fkey FOREIGN KEY (person_id) REFERENCES public.persons(id);
 D   ALTER TABLE ONLY public.fines DROP CONSTRAINT fines_person_id_fkey;
       public       postgres    false    192    186    2024            l   �  x�U��n9���O�'X�ɣ#'��DF�셖'���&i�8O�%g�= 5�fuwU����o�8%��A�Z�>�?gq�8Ū��6W��$N�|���Ǥ"^��Ǉ*!��N�F��w�D+�Y������B�]��Y��q��^)C��En�������q��AJ^��NnX�>���y���IP�b�+�q�j����ɻ�U/�d1N�uٯHβ)x5A�	���D������(�1QM��tXo��Xj3IM�����T'�cgV�/�o�	�F����˺�թ�ʓ��NA����5�C��a��4�������V��E��Ǉ�g{��#֩�򮧠⸎J�� �W��:�CPP�o�4��J�&�|�5az��ҁ�a�0�u�� �6�-��łH�IZ��]�UpХ �:#W�ނĉK�T��C�o�����LV�ń��_}�5'�>rȩ�oP�f�:�.���x�'@�3��\|��2��@8�x뢺$��̕Ws+�I{��(�[l��(i�o`f/��Ɩ�pRe��8=PJ ���3��ڔ�8�?o�[�����g�*�/NG��M�[��e�fP:�0A�>�ɑ�S�
�?���<����Ԛ�(�r|ذ3�S�|R�e���r!c��Y9�:�����Ei�r8���N�,�	������2��#\��Y��l-m��'���%�tD�)\{=��)�2��0�q�|��ѤeW
�O���O�ʨ���X	 ��BRL���=��'���� ��q�k�eNU�����a$r�k�4Y�o���i!4d��(}!������U�u���8ȢS8v��:웣E�7�B��vz>��yL͡툳Ey�c]w��L�@�Ĩ1�h�C��[YK'�Ť�{G��ɝ�#��0�kzn�)eeh����(��T�:�g	�鋘Q*9�5�,��$�	-����4�;�I��)�7��6�$�) v���3����4Q$�ډ�Gl0P��9RRDv3����Z�	fM�2jeS*�;�`�ж���ϝBޫ����ē2�Q���l��p1v8����U����p��e�P�f�L%R�a��+i��ͮ�h�a���_�a[ ���L<G�^ܰu�s�3k�D��Ӕ_�?�OS ����p+�H�0�\�������tʈ_!�!I1
�ʌ��T���^\.ҩ���4]m�]�\��xů�l�h����:u�k%*#��w�H]sD2$E��|%��3]xr1�����xv<����v�p%<�=b���?T�_+��l      j   �  x�ET�r�@<��b@��@H:~`��8�K.��.Y	����ľ�z{z�{����Q�k�CR��.�4���~�6������^k�?4�1*�z�f�Դ7-�G㶕�+���>T���M����k��e��D��؞�}sOjF��p��DA����q�6���!���C$�X�N�瞧�`:53�^���f�a�����Rˎ��0����EWE;��R�V�G-�L0L������7�6�W�OF�,����G�$n�[r�^��B{]��5o3����d�Z�j�!P�2*ׂJJx�7JR[��j:t="D���kk6������,1�Ԃ�F�,=|sܣ�0`�V����bC���icW���j�����5�5���D��M���.�۩���h�.6{$a��4��$�9�����3�V����햂.�8�۪o�X~14�':p��ń��Ձ܆�%7�
`�Ia��'�)�+Ne�5Wżv
��5in����:�����0Fq*ܾ�I[2�ߤ\Ȱ%u�\s�T*}XYs���՝o�^`���3`o1d��59uc>�6�KsX�业����#�>��7���qY<P�1���rE�=��?>1묦h��l��L�ިi!�Z_-���Z�k�(-8�:Y���}��6�{�:SE�k	K9\>8�����~8���d;V�c�����~�>�^ќ9��?�(�F�C�      n      x��]˒Gn]��
.��~,�^{�qF��HEi�o��mѓuշ"��H��U�$ppp���4������w��������_���.�w߾�+�_�B���x���-m�n�l��ۯ�>���ϟ>����_Ƙo?~|���?}��ݗ���~���o�~ޒ��8߇�>����6����߾}���o�篟���݇w�|���_>�_������A_#��}L[���m��O_�������ݧ�?~��o�~����~�b�?1�M��V�����(���G5om+[�g�S�-�[ǋ���'�rۈx��I��ç�~~���~���_���2cQ^fn)�&^�Ƨ.�-�[��P��_����g����/�/����/��2�UFn1�dBd�ɏk.��$s7n������Ax���[�۔l�7���7�})#��ߟ~��|���߾��_���ju߈��Mv�a�9�W���[��x�Q:&�%y�.����\΅�:'cE9���1��Y����=3�Y��Y����hfP�)�1�}��n��R��y�Pe�o)mub"߶����^��X��G�����������6�6T%{,�����v��N[�7��J[s΢v�W�o��pl=���e�dY���g�u��ĂNlU�C��pva`�-�}@��xyZ䘸5����0��-��\��0=r��F���6U&�y3ɱ����}����~�]��_�ZN�7,��,n���بbs��)��K���y����'~v���{��g�>|u�=��X���ն�ҭ���M���Ꙟ��즂�7Z�@K/6�V�dɤ��-��K��8�ծ�)�Y
�/z\�@�����o�@��K�M"�NK�Gߢ�"�`���9���aKeu���]8�ɰ����C�����d��Ҹ���c�M��h�L]�	NE���x��O�Z�gN��(�����?^�3��_�7yϥ|��˲�\�A/Rn�"r�W�Ǭ�znr�NnO�k�g5�M�� ?޻FN���<��w��{�Q�fn���8���!���s"�]��]0��Y^[�h�Ԓ�cg$�Sn-�晋QGv2�8��n�?�W��lHVye����vx�M����K]���:��<���\6��y7\&���#�ċS�ń��<��^��io=�<���<#�E'���挗#>W�$��䶖H�q�n��S&Gk.�D�A���8�ûEf�.�h�I'�cL���x������B��t�ma�{��L�@h9\��ݗ������u�JwϤX������6h�� �N���bX��q�,U��Til�̤�N��7�nY���r�yyj�V�"RA���(���(�#�J��D��#�B�����1`m�%XL�k�U�E�E>�����#�qr&��,D���qb~�	Oa	�mfh�d>\p�M�����n�<�b���*����R��D�<���јovX��k�����@P8?�c�J��El���H�o�K�w� '<�"*�����i��1�/1�Ua�(fM��}J��ޤF�PՃ�2�"�i��_���H�#��.��q�/ �"�%4��#�0�&򝞧���ZFqg����4���P�\s7�rʇǲ�PcN3�'��Ѵ�FrF^q�L���s�q�v��b���0F �����"�1
�7�u�I�p�=�Hx`N\��+Z�)������4�ly�@0�������Q���;a��ݐ����������M�~�]�"t��\�rmN_�,܁IO�F�{J�֝��
%0-gO�C�[}t�u²x�����6�D�2l�ܕ�D2��8��ȻJ��3�հ�(#����y##�,�����q�&j3�3\.��N�Y�7!�z~m���Z.��:O\��M��d^�Y3��ڣ|]+�/$�"�ѐ�W�?s�:�|�t�f�A2Q�w�zW�&����Oos�>r� ���w�D�P�rO���r	�!\�R���1Yj�!��
�q'��)H蝡)� '���/􊸈�J~�/�(�]�T��S��@Ū�	�s���N������X6��������@��|Fn����W��(�M�)I(��y3'�xU�Q~��5��8u��[�G×+�ߢa�\�ť�D~��G��w�r/�i�'aeL���p�}�̐D.������A1ؕ�����.���̽|�,1�n�Y���Χݷo�/I��*趐p��L�:�M��i�-��b4��Lb�n=f�q���(vG���C�'�:�.+��k����-<���o�ӊݢW�-�����<��D���m��}>M����)��\�P���`;����3�m8H�P�1�`(2�KLkȞ���������	����W�CU~����{Z�h�Ѭ7#cm���.��ݏ؁���@y�wv���^�k��LF:~;uV� �"�v^xX�-� �`� �+��;�8w�4h�s����Q,c'X�ۣ�Ҥ�lTYX���x�r��E��*2�WSGV`6���ک��&����Jѳ�Y������G���a��
�XSe�\�&�7ɇ1����L�HPq%O-ӔA����WN(�ez�7og0���@p�M�
 U��r!�v�(+�R�7,��&��,�/���`��x�Aj�Hp0*��N6�v��-!Y�ocvs��a��sn��W�$`�b�|X����}��F�x�X��9PJ'a��޷��ȅb]�Lc+ˤ�ҥМ��5�Z/ќ���u\Z���،̘�v���̖Ȋ%���Y�J�yO�U'b�'����#�fk��J�0Y^$�iI<�2-����r�z0)�?grw$�I�}��k;7��O �Ò~�JYY2S9��~�ï&5�
o`��2��욼ƠJ�q��MEp��9eZAֽ���zزo23]�}�c!�F�d��m�-���D�5�wP���5;{y��֗�!6Q����A0����1���8�:�ڄC�Fi��L�d��<�݅�� s�)҈;�-�����Lj6�RF���/@�
�r=��2gM�_[n��2�~����	6L\m���d�Β�R��LMv��V�ڇ.v��rjH:�����'�<.���E�&���Re(v]>�iEPF��=��/I�<�%Un������YA�o'�<�a� �&��u�Y��e�h��?�W����8��h�2C.f��l���ȬI�y�~��nPtZ�1��T���;�������N�[�d�i<��K�&��X�5}5&Ƙ����..%�(����;���4�0�qM�3���tWV�
%+�V��\�����P�|9y+��TROx��\Y������pBd-:!��,������1E9:��aYv�Xk�7���\�_-�`�n�êD/*����AfhK����iPpg\D�Nx�o�mw�|�UY�����w���ہy#%� ���L��]���K�X.���D�v�B��������6���T�D*p������D@�Wʉ�� �@��d�cv,|S��	޺�k$�>M����"�Z�ifx�鉴���I�D��#��X�'W+�rJ:$�B$�Va�28o�tȺ��9����� mW��h\�4q�-��G�<B�[�`9ã�����w�~W���� 9�$����Z�ɲ�9ne\�x�Du��0�=_X�O*]-{3݌Ŏf`�E�o�w�)�S+;{L����|�K1���0����NI�l�L�PrN�ˑd������vu2XItZNc�S_<�vI�	�&Z.GrW{� SF%��M'�����#e^�$��P�����i����̲:�S���#r܅m\J*�۲<�G�Sյ��@WN�z�'���� �ܣpߏ�}�Q��Ώ�A��
"֋J��8��_�8��0��Ge7&���*U�0Npb��)�/�7�B���#��{anmN���n���U�� �H�Ι%2+��*�7�j�3	q��QLj��x8*0"�((�
aʺ�rf"f8k�����S�    ���r���;2�#��V�E�ݞ��gKy�Uaf�_@ky��*�J.���b�&R&�&#2�b��/��˅���`��Tj ���5ȣ
+Y"֢��g�=�*�Ri�}|Q-�$�7�f���X�,���4���A̞�o�x�h�Le�DA�*v$� �[���-�v�,��q%�2Wfd
]'(��%1s]ܮ덁���5��H_�����H�4�v��IsC�Q�A�5`f�gz�	w�>��X��ٚ��P��,�s���!ۂX�]j*[��k��h�����T�cz�6^�2������$�_S`R|�4=F���PM�$�$:�b�[)S�΢��ʙ821Y����UW�,���p����wY�+�%�m�ͷ�x��q�1@��z�ƫE��'^O����2C�4��H Y�������#�Zr��U=K����I�/�vs�8"�gv��&s�T�8���Q�EB�r����5�2g��:����8�3I��2�t�C�!)vy��r<Ð�F��`�����ʄ�\���n+&���X�""8�(�8�i�f7���G9C �4	����`Q��ɼ��#K����P�)� ��"A��f�ڠW���@粘b��,����e����2�YK��O����h�Y�j(:&� V�:��S6I��|�R3Z�
U�M�������gN�aAٝ%ܩ1ޢ# [����޶��I�����Dc&k9s+��U�X�d��cK :Q<dp�<��ʸ����ղ��K������ܟ������l=�آ��d�+bT���� Փe""�@�[��;�X�"�3`@R}�Y��Wt�V]]X���%�Dg�M��Ȼ�����??n�.+������H��=<p�pK���M5��E�=+�J�n��ʵ��f�Y�Gy6E�SΈAo�A{K���n.A�{��/c�Ls!�(���}���r���%��K����@N�\S�%�<�Y�U���U�����W&3�'�g�8�=U���l�C�qt $���t�xzu�P{k��Y�Խ5�M��%/z���=(�B��o�_l�vl�L�k�l@0w2Բ�2e;.���)���}��a�S?ɫ�E�X2U��*�� �4��|�]��9�,k>�T�{S�.sR�+h���B9ÕK�&�7L���56��T�\�_�\����I?��jJ~��T���G:.7�l��t��H�+��|�XRT��˰i%�u(�_x��g�j�e�ת��6s8��z�,tLx� ���e�+��
 �x+r*u��}��]G�	�Y7������qZW�Ʌ�:D�S���CB�A�,�j��=�N���D�U�G."�&�P��������"�����S�J;Nq� �S>
&����O�g���}-���ti���ɬ��%A�J	�wKgM��v�'���,�S�p�M��W{��:���,��,�k������EWO�y�H`Q�z�<(�mJ��;���7�>_�c���E���a��)[}��1�U��E� ��Kyzv%#���l�hcGҩ؉����G`ۙ�2!ϸ�d��;o������]��G��ʦ���_�oGI�H��2Ñ��Q��-�I��娞�L�I�xҶ+��v���g*���2�=����I�"����&u��y�:Q�ph|2��DV9���d���]�U��J�����[��9ld=Wg�hE�+
t�kt��v)5P��12��GQ޲*8 	Q4��e��.�B��r!�法��X�Ow�a���i�Vt��.���L"<Y�[���G�o�1����"����5F+�{�BbG~U�`n�a"x>�V!�K�2N�h�V^	��h��R�S�p�jl��B�/��S�OYبPq"6����"c�uu�8U� ��4��ռM���	�U�
<P,_���{��sc�Ê�*>A��|l���	3<�j��<�Fk�jjG5��sTxȰnՙ�%�+Z֜�y�����Ȭ��@�7�-�(��Rt[�iͷ|R&�?Ӻc�`{�O+Kfd��܏[bb���e|�`(�..w��9tV�Qd��k\j�h�G��)��8�T�q3UK��dC���<׸�E�*�WHd��&�FTpu��W���e=;��@͘Bֽ�u�t����.�[�i�+nk!,Z��JY�s+�v gŉCԗ�n<����\�N�W�S��vo.r�u�����隮.u��+߾�������Z��Y�`�b��O|�%M�^��?l����C��X	4��F��YϯGY�DwNe����`�1�Ɔ��1jeG�U���)�xXc��"�ǽ%�-�3Q�զ���,2���=T3����j#*t����Q��Q�Ik#�j��9IW�!gӶ�X��y��+�cs�X�W;��/��\�
ј�Ď�zB��vFk���2�$�k�w����&��P�;�gd�y��щ-���U�<��)��*0=h��u��KR|	� f��f{�A��u��h�%��d�-�-_��jazs�[T�J�"Я�U���4���N{���n�2�z�b�B)�W�٭�����t�+����P��X`kH���\`�3^`���|�OK&Q�c�
s�bY�_$��U��gd�z/[$��B�xL[ʒ�*��6�S��ļ5���R��Y�!=�+����=�dr��Ӫ�c�[���:�^�Pɚ(c*�S$Y�<�����che���Z�U����s�{��՜�*���へ����P���'�:�"Y⪵��/k[y��?�M�n LI?�4V���u	�e��~7��m�?J�U;�E�G�L#��tۏK*0,Z��D9���]jz�j��I��-�m���e�Ƕ����S�1��WCL[��C�t+�1���|�t^����0T���<�����t��*w�l��6V�(#�"�*�5�ܮ�����bK�N�4��5k,s�p*/,�jخ~x�ݶD5��o�:�Y�0�m�ܫ�Q��Ho���\���J��V�}��%KK��d!���-���	Z�T�{��M-����֯��M˭d<����F�Դ>�<Z8ɴv���K��[n�S�e<��������D�h���&?�yG��-�4a��@�/�V�
�߮�c,o��hp�H(����u���0P�r�P���]I{gd~n���O~S����X��<x@2��'éP���*%O�(�������]+�R,�%�:��銑��"/i��l�ʚ�5�w</��Le��rm5[1���R�;�T���͸h+����Ϯz���-v`
q�$� �碒E"{�jǆk�^Y�	cPI�t	*��@2i�%{֥���S՘�u{Ϣ0�it?�(h ��^*���Q-�xS��7X˧��j��=����R^�/�4�sXQ�[+���k�g[T'����n��>'��Z��p��Ub�Py���>�v9.Y/	�����'��9��[e�/ K�V��b�1���zIw6i��0��&j��6�-v�Aqg���#��_�h�W�jrRF@T�H(��jc��y�nQm���i@Z+��J<j'�Y�k�۵���6�u�g2�4 ��K�C��uk�y�O�~�b*���!M��>�%�_uF�rҩ����z{	�{����î���y���*K�G�2��U1}z=%�l9|�GH�9ۺT�L�@Kں�D�ePC�&��̡
�m�O���lA�:� �����[ȸ��Ǉ�֫���'ꁚeeq��J"t����+ZJ��4<�s��u���ygB;^�p�t,��?m�Q�	�i�C�m��>k��br� qVa�YQ���8^�SY��;���"M^SͿ��w��:�3k�{���������Ʋ�1�]LEƠc<#�"��Od=�J���n�K]�Og�Z���;��E���<1�t�Z�����*�a�<"�Q����O���{Qe��_pki��O�|�3�|�~;"ӀR�;��7�U�1��KWW�DG�f���Ԓgʑq��r��S�]��R;z�^җ�"8fA;$җ ?  2�G��(F�jhd�>��z&~|lj��o��Aī��7/���p.|�[��S��U	���{.��[�����T�17������d �{&n��h|�{s|�r98��y�ꏏ+ibp����*J�^{!��U&i�c����ᣱ,df1���=A��q�����*%���K:�l���T��6y|ʻ?��\؁�3�K
ӡ��ނ2U<��\��re���-\v���J���^)+�
�Z&Uފ~a�����J�^iƣ�d"��}�R�z�wй���Mk߯^�&kUŲ��������y�ʨ�ґ���D�����r���<��1�z��uu�\���ܫT�gp�#�+�Ɇ��'��芬l�W׈�[�m'E-�(k��Fq�@���=��4��F��I>�^�����/���S���+%�T��Ѷ�x\�z�r�w�_Ny��S�G2�R���k�)m�-sӹ�\\㽨ѓ�6�ey�5�\��x~,�Fֱ���	��OT����΅��aJ;+�� �6t3;����������F���J�{	�l�y�꫶���Z"w�d�5ꮢ�}P-yE�<�pc�Q���}����XC�vY�N���u�F�G�r�x�y"�vl�� ����?jnD?��թ��W�^�ER�T$�
��Y��T�D�㻗9~����ǤZ�?ʭ;������aD�>Yv"�����˂�����q@ټ/C�#����Ixs>��ڞ�Oj���>�j����$�/C����zj��]�b�]��Q
%a���}��Pl��SK��.�6G��N�#�`���3����T�7�&r�W��%?|��i.�@�����0>�F�2�=a\�U���y@�d>�0���/O�;$�Ռ�E�n�	���*a�ю�/� y�ٔ�"�MƓ�41����**�\�hU����)�����o��B���Ӯ�1�2�$�jݲG�Gߣ�1i#��������Y�S�T���m\��Ӯ}���e�$�1gC���p�#���vh��?bE!�0<l���#	E�F	1�u��(�D(�{�,��L��i�p������粥�QƏ̡m��fS@t�N����=���lyv\MRT�����_	S��R�r@��+N@SR���G>�AFH#{��~�i:lM9
i�.9�;�,��DSr���FIv�>JoW��}�RU
��1 ���'j��6�@�/aa�(Za򜞭Y�UY�U[AÖ��|����AfS�5�V�^*��ꋮF�ڱQ�'�i83+��>3���3���pȜd_]���ի�*�g��oA(�o���.��_������9�Q�����/S�ʂX���E9ڤs�4�su��o��	&f���e�يkB�������)�I�s�Hv�K��	$J���#����F<�8��a�9xIVc:�"el�f��8��jH^&/�����`R�������ik�i�VM@���'9g�kpF����݋b�+�d ��lff"Vr�;��L�p�T���+v�=��n�_�Y>w��۴?��8�����yD������%&�����b�`x���y�ȑ�o�R`��`NJ#����lػ�=��;#�����+��l�0�nBڛ����1X��\d*Fq�Q��l��=���vf<ua�	�0�r.���mL�5w��f&H+c2����h�h�.�d֮�������+q+���)y����k@�c27�
��X�6�c3�|�Jd����6/��b�G�����X�+ӎ��A������U�+މ�;!Wu��}V*pj�uo����]��}=����5���g+,���og;��C��v󊽻�x��8%�\�&��!�$��+�G�������*��T=fdոF�G�~��D�B�	�\�d��f�"�ijA������u��]v�ɠb���S�t�&E�.�t���'��.D?Q����`!��.QS-��2h"-t�s�o�*h^��/@�*��_��M���D�7a\�0�Z��]��"��J�=7�ʌaLN��1lי�O���dTU��4��x*�[��A��K#A�!V��4Mo��CP��d��#g�u�e)B�e�
��*�( ��d��w���%�������d��1���z˴�jq��V�3dx�S��q"�.̅���2>����-�]{�7R4Y�Y��p} �8d��㑯�ٹx<��'۶(%k	���3��J_MT�Q&����X��|e��dg�k9*@/�w�S�d�	�u������v���L�F��BC�&$3`>���MT��	%;���
 ��UF�*{�tЬ�4��U��ɪI����L����en�k��%�QS�l-�~
V�������:Z�9�?$��3��]�f%�`�/#�d%!�|^�k�E����2��=۬���]t�k�R4�b�t���%#N�B�?����*\��5�iY��er'M�l����nV�Y.19��+Ѩ��xO쯚��za2*�e���X�J֡k�1�:�h2�}��5��l=ԧ�\.^��[dvjh>�M6�H5Us%�\�X�A�t,�W ����
�{��2���"U�����,Q~ �#���T ;�'�TO4��n�x�7� �7��������^Dh�8^��A�Y���<��h&�I�3�0ϫw�؛��1E!����i�?�;QV���E�s��\�~Q���IE,�Z���͜t3�w�
Ӽ2K��[����[`�3��'ņ�f�g$���5����&I��,ܻ���$@���//��DB����ֳ Ve��ⳍڀc��$�az�r-�������v�?��=      h   �  x�eX�r�8}��?�A\��[,�v�e%3����K\S�"���~O����T�R}ns�Z׬�g�?���ʊ糂�K׮���eV�k߶�.�Z�fEM5+��ɵn똴�`��οo�K�4.���R�B�J�n{���k�:�l��6�h�b�iY�.}���-�ԙb���6~�?������vX�m�ٵ��W�E���"]�
�?�O�}�+Q�a�MS�m>�כt���x1�������e��r���}�n�{�Y�٭�[��(tV���m�E{��t6֕3^���{�wL(��]���n���6Tw����s�n�Q6�N~˿:���-��l�n�_��z����p���i���?i��w׹���n�=��6� ���|��5
����ŗ��:�Q�ݮq-0U�J��m�.�h(m]�詛Z`�b��FI?6�7�J�kW��B����AlXz�K�U 6��o�:f�:�=R�}�ӵƲ(xbbEX�|�w�l�}��x�ZJ]ҳBϰ�w�#ʱJ��Ut�:q�@�t��n[�]*�34��ŷ|�Ņh����a���8�S3�"��?��{�㆜�RN-���f�6�7�r���b?��G���$�h��#�`s'X T)��jO��r��6p�d���i�e^��Ь�J�����nd�%����8!�W���u���#_�
�ޮ�{�Ÿ�;v����tT�%��!��2`PZ���5����*P�
�z���=Q\��j�����
���D����د!5�@�FT�(3na	��>F�.=���v7*�s�bׯ]���D�Ʈ]<�l����W���0��2���aY�̣:R��P���s�o�u�m�.��:�LeIE�߀���Fߪ�y��=`��s'��M��A�&��]�+������'��"������F������#ԟ�;+�h	�ijru��HscӁ��4��5 $�Ґ��d ��C�T�iCX����HN�mzw
���aϤQ�R��q�����E��q�$�bW��d�&�� ^�8����Oz�I9Uw��c2T	5yDMhK*�o�aDf
��x�Xw5ٸ�b�����I�����Lh�ʘ6��tM�m*(W��wpOX�<E�QՔp0~f?�R��Т�3j��E����h@����bZzþ �:���^*�n\l�$\�~�T�]
�VoaUW�	S2�d��n��^����L
 ��}hPt;$mJm�/�&�D�d%�K�������n�!K��CL��%���bIdU
�������k��r3�+�(�~$-Qi����hz;�h����U��u��Q��+��wP.n=5Iqķ���E�M�S��xP?-%��j�NÈTm~�z%1e�=�����ej�F9e�R�
}��i\���d�ʀ���)y�dg)n���"?�b�x�Ȋ��[@ ��g����%���k}�j'�/!��]��.�δb@n5��0���7��{�y����FH_�~�%t7E;E��h�*}�˯w�>��ǩLk�=-NP]� �Cjl5g?c�����It�6D�9����rdf���3Sp���F���)viZ�`p�z����H��C�3��1h�cHh�1��[�Jz2�E��.31H��"�G�W�q�%�
4T�<N�Ͼ�FtCZ��,Ю�'���Q�`�#�X��4ũ4��v�G[��F��=i������8f/&o(ג��#Lxz�FN۔�c�Z	��e��!N���D�S8�����@SK����*���T\s^�fQ@f�����d�����sX~lڵw�Й�=�tE��R,&�����	Uv��]ݱ��}+�94�1����=d}�"�%�X
� }�F;�z�w�u�pS�S4�`~ò�x�_�݇���"�����)ϧ�t!����Q�5�G�P5K��-�yb��WHꕅ�]�v���T�m�&*bz��:{���=
�+��"&Y�0L�xÅ�$G'򹏟~��5٬���|�$s����C��Dv���'fV%n��E����y���+���^uޟ؃a����Q0ա!�JNCf�n̞ĢKz��+h�RC~N�*=�iW�(��N^r��Ӝ��V�#��ݠ��	/�M*3�;g��A�Q�L�����&֧�d$͂���ž�>��V[*�bs�"�h��~�PУ�"�/�")$���H�׽??����Ɠ������__�,�?���R     