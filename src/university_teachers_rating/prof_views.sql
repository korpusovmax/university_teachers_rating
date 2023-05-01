PGDMP                         {            Professors_views    15.1    15.1                0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false                       0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false                       0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false                       1262    41031    Professors_views    DATABASE     �   CREATE DATABASE "Professors_views" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Russian_Russia.1251';
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
       public         heap    postgres    false            �            1259    41126    personal_data    TABLE     �   CREATE TABLE public.personal_data (
    student_id bigint NOT NULL,
    login character varying(50),
    password character varying(15),
    "FIO" text,
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
       public         heap    postgres    false            �            1259    41090    subject_inf    TABLE     i   CREATE TABLE public.subject_inf (
    subject_id character varying(5) NOT NULL,
    subject_name text
);
    DROP TABLE public.subject_inf;
       public         heap    postgres    false                      0    41061    cafedra_inf 
   TABLE DATA           ?   COPY public.cafedra_inf (cafedra_id, cafedra_name) FROM stdin;
    public          postgres    false    215   �                 0    41054    faculty_inf 
   TABLE DATA           ?   COPY public.faculty_inf (faculty_id, faculty_name) FROM stdin;
    public          postgres    false    214   [                 0    41126    personal_data 
   TABLE DATA           _   COPY public.personal_data (student_id, login, password, "FIO", _group, moderation) FROM stdin;
    public          postgres    false    217   �                 0    41133    professors_data 
   TABLE DATA           `   COPY public.professors_data (professor_id, faculty_id, cafedra_id, subject_id, fio) FROM stdin;
    public          postgres    false    218                    0    41090    subject_inf 
   TABLE DATA           ?   COPY public.subject_inf (subject_id, subject_name) FROM stdin;
    public          postgres    false    216   !       w           2606    41067    cafedra_inf cafedra_inf_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.cafedra_inf
    ADD CONSTRAINT cafedra_inf_pkey PRIMARY KEY (cafedra_id);
 F   ALTER TABLE ONLY public.cafedra_inf DROP CONSTRAINT cafedra_inf_pkey;
       public            postgres    false    215            u           2606    41060    faculty_inf faculty_inf_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.faculty_inf
    ADD CONSTRAINT faculty_inf_pkey PRIMARY KEY (faculty_id);
 F   ALTER TABLE ONLY public.faculty_inf DROP CONSTRAINT faculty_inf_pkey;
       public            postgres    false    214            {           2606    41132     personal_data personal_data_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.personal_data
    ADD CONSTRAINT personal_data_pkey PRIMARY KEY (student_id);
 J   ALTER TABLE ONLY public.personal_data DROP CONSTRAINT personal_data_pkey;
       public            postgres    false    217            }           2606    41139 $   professors_data professors_data_pkey 
   CONSTRAINT     l   ALTER TABLE ONLY public.professors_data
    ADD CONSTRAINT professors_data_pkey PRIMARY KEY (professor_id);
 N   ALTER TABLE ONLY public.professors_data DROP CONSTRAINT professors_data_pkey;
       public            postgres    false    218            y           2606    41096    subject_inf subject_inf_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.subject_inf
    ADD CONSTRAINT subject_inf_pkey PRIMARY KEY (subject_id);
 F   ALTER TABLE ONLY public.subject_inf DROP CONSTRAINT subject_inf_pkey;
       public            postgres    false    216            ~           2606    41145 /   professors_data professors_data_cafedra_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.professors_data
    ADD CONSTRAINT professors_data_cafedra_id_fkey FOREIGN KEY (cafedra_id) REFERENCES public.cafedra_inf(cafedra_id);
 Y   ALTER TABLE ONLY public.professors_data DROP CONSTRAINT professors_data_cafedra_id_fkey;
       public          postgres    false    3191    215    218                       2606    41140 /   professors_data professors_data_faculty_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.professors_data
    ADD CONSTRAINT professors_data_faculty_id_fkey FOREIGN KEY (faculty_id) REFERENCES public.faculty_inf(faculty_id);
 Y   ALTER TABLE ONLY public.professors_data DROP CONSTRAINT professors_data_faculty_id_fkey;
       public          postgres    false    218    214    3189            �           2606    41150 /   professors_data professors_data_subject_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.professors_data
    ADD CONSTRAINT professors_data_subject_id_fkey FOREIGN KEY (subject_id) REFERENCES public.subject_inf(subject_id);
 Y   ALTER TABLE ONLY public.professors_data DROP CONSTRAINT professors_data_subject_id_fkey;
       public          postgres    false    3193    218    216               �  x��T�n�@�m?� ��a
$i$Za�HE�Bq��H�S��W�{���P�FJ�}�7;3�{X �@�Q���Q"wc��su
�ú.W(4 G�̼9�>� �n�S1���,�,^�p��H����/!��s��F�a�E��s�*`��p�^ұ!������s�74��G���2^Q�ʆ��ݯ��4�U�#�+���i�;	t��������_����(�}�_H��0d`s"�0Ï���7Fܰ�$;�iʎ+�������7�vO��&CAk��u���k�6@�v�F%��!�cϵ��y7Qզ�8$�o��-�Q)���Hu�Ms�`_�u��J��(Z�=�kV�]
�U3
:0Q]���X���w�>+&d%�̩b8�;���k��q�fR���?Ի���Z���AK$��kre��Uۺ2a��^�X�ٕd���I�<Qg}4GI�O��k-S����%�	��FR�2MJo�	[�����$!@�ug�Ԑ~36�la�,����ͅb��q�	N�~-�d��T�U�y�Y-�oh��s)�����$�K�����"C��MN���iD���Ց�r*�G[�zK��u��o[S{*71�1~*��ݺ��'s'�4��}o��-Ͼ�|��b�	?�a����         z  x��SKN�0]ǧ�6��Ð�R$@Q�!!��)��8i�^��F���*/+5�ƞ���92�"�(�����'(}b���[��-
ǺGǵ?��3f�c�g���`�<��m1vf'!�-�N$>��{1@��'d�Q�r>5�_P)�4�)G���1�[g巔C�vEeN�,�*#ZZ�1�D��4ʵ&�csPg-�zT>E��+��E�y��I�b��ٲ�hW�yC,fx����N�H2\K3C�9����ׅ�y���ϼ٘�>��k4��hj���@�R}CT��QB�"�v)�2��yXr���R�;$��r�F�o�����_����,�K�n��81�����~.�S�����8U$]�����KZ�~���2�� �Ɔ             x������ � �         �  x���Y��@���)|���]r����H�2,�e��y�� ���
�7JUuom+cL���_[�Xl������+���BH�;3�bW!�;��ևH<�{i����U�u���p�����~�`O�E�)��^����x�N��g8�;r�ф1�'�I�����'�Ƥ���O���#�B����q����3��{��a]c�>*���W�3(s�,������deԄ)�p�Ԝ�5�p&������UH�O�B?�p)�5�X6&ԇb�]��3�הdY�Z����Ȣg]V��)�\F�zz��B%��Պ�pp�����c�C-��(���n���#2Tݼ)*'ksl������B�k*8�)>�ۨGB�j��2��e���?Xev0��<G�&�V���7��ZQ򆾅�o�x�mO����Ɠ�̳Vр2��ǔ.��%�� ��v�z3f؀�q�5;���b�Q�|�g�/t�S1S�����[��6��O�m���0'���Ҋ��-�s@�E7߶݈�Жf����{���"d�5��2f��^v�Dy���ʩ&��13��_�T������k���-�Ǘ�U�	?�-z�ȓ�rw�����^q��$Ñd<uۮ!{Ђ,�m)a�7���Cv�� f�40�2���q;�k������f+���n�p:U�pȳ��N�W9�	7�Q���r+8��QFs�R�U|Q��D��mEr�d�_�JU����:��?��;�         U  x��Tmn�@��=���D=8�iEZB[�SH��'�qp�)�}��u��B�����f޼Y#��y�F�2Sx�����3���nj�)���r�rB?d�s��$��iJ�b�(ep>�3�8W��K\'�U��S`���o�PsX(l�V\��P�
�P�ǣ�o�`�X&|�
�/Q��_������Ii{����xF��;�>��5b���v�A��,�oN1��6\�9V)Zf4�L������	�k��5Kxۯ���ٙ��E����i�2R�KQ��B[m�
_E��]�hx�m���k��G�{K�Zk�L��sW�3r��S^��df��@b�21�8�0z�Y^�B7���?��b\Ĉ�y��l�D�[|��<���gZ�Jsdz,3i�֜i����/wG�5��0�h��p<�A�IO�g��|��A�3m�M��sm�:G����3��)�u�:�1���΋C%�epo�ʃ��*�iB@�5E:�Gj	j��	�Zo��:K
Z1l��I�h��J�#ę��hު}��}w��,�-�S{܎���Jȱ�H~�Qzar�ҎR����mM�M�������s� k��>     