PGDMP     #            	        {            Professors_views    15.1    15.1      *           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            +           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            ,           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            -           1262    41031    Professors_views    DATABASE     �   CREATE DATABASE "Professors_views" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Russian_Russia.1251';
 "   DROP DATABASE "Professors_views";
                postgres    false            �            1259    41061    cafedra_inf    TABLE     i   CREATE TABLE public.cafedra_inf (
    cafedra_id character varying(5) NOT NULL,
    cafedra_name text
);
    DROP TABLE public.cafedra_inf;
       public         heap    postgres    false            �            1259    41054    faculty_inf    TABLE     i   CREATE TABLE public.faculty_inf (
    faculty_id character varying(5) NOT NULL,
    faculty_name text
);
    DROP TABLE public.faculty_inf;
       public         heap    postgres    false            �            1259    41155    personal_data    TABLE     �   CREATE TABLE public.personal_data (
    student_id bigint NOT NULL,
    login character varying(50),
    password character varying(15),
    fio text,
    _group character varying(10),
    moderation boolean
);
 !   DROP TABLE public.personal_data;
       public         heap    postgres    false            �            1259    41133    professors_data    TABLE     �   CREATE TABLE public.professors_data (
    professor_id bigint NOT NULL,
    faculty_id character varying(5),
    cafedra_id character varying(5),
    subject_id character varying(5),
    fio text
);
 #   DROP TABLE public.professors_data;
       public         heap    postgres    false            �            1259    41221    reviews    TABLE     �   CREATE TABLE public.reviews (
    review_id bigint NOT NULL,
    professor_id bigint,
    student_id bigint,
    review text,
    review_score smallint,
    CONSTRAINT reviews_review_score_check CHECK ((review_score = ANY (ARRAY[1, 2, 3, 4, 5])))
);
    DROP TABLE public.reviews;
       public         heap    postgres    false            �            1259    41239    scores    TABLE     �   CREATE TABLE public.scores (
    score_id bigint NOT NULL,
    review_id bigint,
    student_id bigint,
    score smallint,
    CONSTRAINT scores_score_check CHECK ((score = ANY (ARRAY['-1'::integer, 1])))
);
    DROP TABLE public.scores;
       public         heap    postgres    false            �            1259    41090    subject_inf    TABLE     i   CREATE TABLE public.subject_inf (
    subject_id character varying(5) NOT NULL,
    subject_name text
);
    DROP TABLE public.subject_inf;
       public         heap    postgres    false            "          0    41061    cafedra_inf 
   TABLE DATA           ?   COPY public.cafedra_inf (cafedra_id, cafedra_name) FROM stdin;
    public          postgres    false    215   '       !          0    41054    faculty_inf 
   TABLE DATA           ?   COPY public.faculty_inf (faculty_id, faculty_name) FROM stdin;
    public          postgres    false    214   �)       %          0    41155    personal_data 
   TABLE DATA           ]   COPY public.personal_data (student_id, login, password, fio, _group, moderation) FROM stdin;
    public          postgres    false    218   E+       $          0    41133    professors_data 
   TABLE DATA           `   COPY public.professors_data (professor_id, faculty_id, cafedra_id, subject_id, fio) FROM stdin;
    public          postgres    false    217   �-       &          0    41221    reviews 
   TABLE DATA           \   COPY public.reviews (review_id, professor_id, student_id, review, review_score) FROM stdin;
    public          postgres    false    219   �0       '          0    41239    scores 
   TABLE DATA           H   COPY public.scores (score_id, review_id, student_id, score) FROM stdin;
    public          postgres    false    220   �0       #          0    41090    subject_inf 
   TABLE DATA           ?   COPY public.subject_inf (subject_id, subject_name) FROM stdin;
    public          postgres    false    216   �0       �           2606    41067    cafedra_inf cafedra_inf_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.cafedra_inf
    ADD CONSTRAINT cafedra_inf_pkey PRIMARY KEY (cafedra_id);
 F   ALTER TABLE ONLY public.cafedra_inf DROP CONSTRAINT cafedra_inf_pkey;
       public            postgres    false    215                       2606    41060    faculty_inf faculty_inf_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.faculty_inf
    ADD CONSTRAINT faculty_inf_pkey PRIMARY KEY (faculty_id);
 F   ALTER TABLE ONLY public.faculty_inf DROP CONSTRAINT faculty_inf_pkey;
       public            postgres    false    214            �           2606    41161     personal_data personal_data_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.personal_data
    ADD CONSTRAINT personal_data_pkey PRIMARY KEY (student_id);
 J   ALTER TABLE ONLY public.personal_data DROP CONSTRAINT personal_data_pkey;
       public            postgres    false    218            �           2606    41139 $   professors_data professors_data_pkey 
   CONSTRAINT     l   ALTER TABLE ONLY public.professors_data
    ADD CONSTRAINT professors_data_pkey PRIMARY KEY (professor_id);
 N   ALTER TABLE ONLY public.professors_data DROP CONSTRAINT professors_data_pkey;
       public            postgres    false    217            �           2606    41228    reviews reviews_pkey 
   CONSTRAINT     Y   ALTER TABLE ONLY public.reviews
    ADD CONSTRAINT reviews_pkey PRIMARY KEY (review_id);
 >   ALTER TABLE ONLY public.reviews DROP CONSTRAINT reviews_pkey;
       public            postgres    false    219            �           2606    41244    scores scores_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.scores
    ADD CONSTRAINT scores_pkey PRIMARY KEY (score_id);
 <   ALTER TABLE ONLY public.scores DROP CONSTRAINT scores_pkey;
       public            postgres    false    220            �           2606    41096    subject_inf subject_inf_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.subject_inf
    ADD CONSTRAINT subject_inf_pkey PRIMARY KEY (subject_id);
 F   ALTER TABLE ONLY public.subject_inf DROP CONSTRAINT subject_inf_pkey;
       public            postgres    false    216            �           2606    41145 /   professors_data professors_data_cafedra_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.professors_data
    ADD CONSTRAINT professors_data_cafedra_id_fkey FOREIGN KEY (cafedra_id) REFERENCES public.cafedra_inf(cafedra_id);
 Y   ALTER TABLE ONLY public.professors_data DROP CONSTRAINT professors_data_cafedra_id_fkey;
       public          postgres    false    215    217    3201            �           2606    41140 /   professors_data professors_data_faculty_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.professors_data
    ADD CONSTRAINT professors_data_faculty_id_fkey FOREIGN KEY (faculty_id) REFERENCES public.faculty_inf(faculty_id);
 Y   ALTER TABLE ONLY public.professors_data DROP CONSTRAINT professors_data_faculty_id_fkey;
       public          postgres    false    217    214    3199            �           2606    41150 /   professors_data professors_data_subject_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.professors_data
    ADD CONSTRAINT professors_data_subject_id_fkey FOREIGN KEY (subject_id) REFERENCES public.subject_inf(subject_id);
 Y   ALTER TABLE ONLY public.professors_data DROP CONSTRAINT professors_data_subject_id_fkey;
       public          postgres    false    217    216    3203            �           2606    41229 !   reviews reviews_professor_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.reviews
    ADD CONSTRAINT reviews_professor_id_fkey FOREIGN KEY (professor_id) REFERENCES public.professors_data(professor_id);
 K   ALTER TABLE ONLY public.reviews DROP CONSTRAINT reviews_professor_id_fkey;
       public          postgres    false    219    217    3205            �           2606    41234    reviews reviews_student_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.reviews
    ADD CONSTRAINT reviews_student_id_fkey FOREIGN KEY (student_id) REFERENCES public.personal_data(student_id);
 I   ALTER TABLE ONLY public.reviews DROP CONSTRAINT reviews_student_id_fkey;
       public          postgres    false    3207    219    218            �           2606    41245    scores scores_review_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.scores
    ADD CONSTRAINT scores_review_id_fkey FOREIGN KEY (review_id) REFERENCES public.reviews(review_id);
 F   ALTER TABLE ONLY public.scores DROP CONSTRAINT scores_review_id_fkey;
       public          postgres    false    219    3209    220            �           2606    41250    scores scores_student_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.scores
    ADD CONSTRAINT scores_student_id_fkey FOREIGN KEY (student_id) REFERENCES public.personal_data(student_id);
 G   ALTER TABLE ONLY public.scores DROP CONSTRAINT scores_student_id_fkey;
       public          postgres    false    220    218    3207            "   �  x��T�n�@�m?� ��a
$i$Za�HE�Bq��H�S��W�{���P�FJ�}�7;3�{X �@�Q���Q"wc��su
�ú.W(4 G�̼9�>� �n�S1���,�,^�p��H����/!��s��F�a�E��s�*`��p�^ұ!������s�74��G���2^Q�ʆ��ݯ��4�U�#�+���i�;	t��������_����(�}�_H��0d`s"�0Ï���7Fܰ�$;�iʎ+�������7�vO��&CAk��u���k�6@�v�F%��!�cϵ��y7Qզ�8$�o��-�Q)���Hu�Ms�`_�u��J��(Z�=�kV�]
�U3
:0Q]���X���w�>+&d%�̩b8�;���k��q�fR���?Ի���Z���AK$��kre��Uۺ2a��^�X�ٕd���I�<Qg}4GI�O��k-S����%�	��FR�2MJo�	[�����$!@�ug�Ԑ~36�la�,����ͅb��q�	N�~-�d��T�U�y�Y-�oh��s)�����$�K�����"C��MN���iD���Ց�r*�G[�zK��u��o[S{*71�1~*��ݺ��'s'�4��}o��-Ͼ�|��b�	?�a����      !   z  x��SKN�0]ǧ�6��Ð�R$@Q�!!��)��8i�^��F���*/+5�ƞ���92�"�(�����'(}b���[��-
ǺGǵ?��3f�c�g���`�<��m1vf'!�-�N$>��{1@��'d�Q�r>5�_P)�4�)G���1�[g巔C�vEeN�,�*#ZZ�1�D��4ʵ&�csPg-�zT>E��+��E�y��I�b��ٲ�hW�yC,fx����N�H2\K3C�9����ׅ�y���ϼ٘�>��k4��hj���@�R}CT��QB�"�v)�2��yXr���R�;$��r�F�o�����_����,�K�n��81�����~.�S�����8U$]�����KZ�~���2�� �Ɔ       %   g  x�m��n�@�����b�]���(�,�씐K!X�U�R��PKK$Z�aJ�X�I�g��F��c7cSEI����sϹc[l�^�Bױ��T��zcE�OyDSZ�>-��%:�|�XhLsy@�aQ8�}���eѳ��w�Ah����/��vƄ����r�f�A�V�E� ���V2��3���S���Q	W�Uq/�|?t�]���t
t�������CshW��Vk/��s�m�~�f�
���ɉ����b�������#�4�kx�Ҏ��DU=�g5�c��y�7t	���L�o��4{Bc�W�[������[��vm��S ���@&]���M��X�kf��x�{���a��g|ɿ����;����X��R�Dhe�v��i!�W%���q��A���zZ�s����25�O�A� ��:Xu�6$���t�qv���,��~��&�iNT;�`�P�@���G�L+�"�e��9�r�It����w(��r �,`��a�[���TS��f�Ƀ��b
�UE���Wo�n��┍Vo�i�mE<3�_�]�nr	���	�^mJ�ĳt�̲��:�j�F ��iWņY⳻�e�3�h      $   �  x���Y��@���)|���]r����H�2,�e��y�� ���
�7JUuom+cL���_[�Xl������+���BH�;3�bW!�;��ևH<�{i����U�u���p�����~�`O�E�)��^����x�N��g8�;r�ф1�'�I�����'�Ƥ���O���#�B����q����3��{��a]c�>*���W�3(s�,������deԄ)�p�Ԝ�5�p&������UH�O�B?�p)�5�X6&ԇb�]��3�הdY�Z����Ȣg]V��)�\F�zz��B%��Պ�pp�����c�C-��(���n���#2Tݼ)*'ksl������B�k*8�)>�ۨGB�j��2��e���?Xev0��<G�&�V���7��ZQ򆾅�o�x�mO����Ɠ�̳Vр2��ǔ.��%�� ��v�z3f؀�q�5;���b�Q�|�g�/t�S1S�����[��6��O�m���0'���Ҋ��-�s@�E7߶݈�Жf����{���"d�5��2f��^v�Dy���ʩ&��13��_�T������k���-�Ǘ�U�	?�-z�ȓ�rw�����^q��$Ñd<uۮ!{Ђ,�m)a�7���Cv�� f�40�2���q;�k������f+���n�p:U�pȳ��N�W9�	7�Q���r+8��QFs�R�U|Q��D��mEr�d�_�JU����:��?��;�      &      x������ � �      '      x������ � �      #   U  x��Tmn�@��=���D=8�iEZB[�SH��'�qp�)�}��u��B�����f޼Y#��y�F�2Sx�����3���nj�)���r�rB?d�s��$��iJ�b�(ep>�3�8W��K\'�U��S`���o�PsX(l�V\��P�
�P�ǣ�o�`�X&|�
�/Q��_������Ii{����xF��;�>��5b���v�A��,�oN1��6\�9V)Zf4�L������	�k��5Kxۯ���ٙ��E����i�2R�KQ��B[m�
_E��]�hx�m���k��G�{K�Zk�L��sW�3r��S^��df��@b�21�8�0z�Y^�B7���?��b\Ĉ�y��l�D�[|��<���gZ�Jsdz,3i�֜i����/wG�5��0�h��p<�A�IO�g��|��A�3m�M��sm�:G����3��)�u�:�1���΋C%�epo�ʃ��*�iB@�5E:�Gj	j��	�Zo��:K
Z1l��I�h��J�#ę��hު}��}w��,�-�S{܎���Jȱ�H~�Qzar�ҎR����mM�M�������s� k��>     