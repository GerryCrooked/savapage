--
-- PostgreSQL database dump
--

\restrict L5DhVSa5jj9akcjyrS3aymg0lTY51lN3BurrZdI1vhYOwAz8097aGVEtMtIapvi

-- Dumped from database version 15.15
-- Dumped by pg_dump version 15.15

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
-- Name: tbl_account; Type: TABLE; Schema: public; Owner: savapage
--

CREATE TABLE public.tbl_account (
    account_id bigint NOT NULL,
    account_type character varying(10) NOT NULL,
    balance numeric(16,6) NOT NULL,
    comments character varying(20) NOT NULL,
    created_by character varying(50) NOT NULL,
    created_date timestamp without time zone NOT NULL,
    deleted boolean NOT NULL,
    deleted_date timestamp without time zone,
    disabled boolean NOT NULL,
    disabled_until timestamp without time zone,
    invoicing character varying(20) NOT NULL,
    modified_by character varying(50),
    modified_date timestamp without time zone,
    account_name character varying(255) NOT NULL,
    account_name_lower character varying(255) NOT NULL,
    notes character varying(2000),
    overdraft numeric(16,6) NOT NULL,
    pin character varying(50),
    restricted boolean NOT NULL,
    sub_name character varying(255),
    sub_name_lower character varying(255),
    sub_pin character varying(50),
    use_global_overdraft boolean NOT NULL,
    parent_id bigint
);


ALTER TABLE public.tbl_account OWNER TO savapage;

--
-- Name: tbl_account_attr; Type: TABLE; Schema: public; Owner: savapage
--

CREATE TABLE public.tbl_account_attr (
    account_attr_id bigint NOT NULL,
    attrib_name character varying(255) NOT NULL,
    attrib_value character varying(2000),
    account_id bigint NOT NULL
);


ALTER TABLE public.tbl_account_attr OWNER TO savapage;

--
-- Name: tbl_account_trx; Type: TABLE; Schema: public; Owner: savapage
--

CREATE TABLE public.tbl_account_trx (
    account_trx_id bigint NOT NULL,
    amount numeric(16,6) NOT NULL,
    balance numeric(16,6) NOT NULL,
    trx_comment character varying(255),
    currency_code character varying(3),
    ext_amount numeric(16,8),
    ext_confirmations integer,
    ext_currency_code character varying(3),
    ext_details character varying(2000),
    ext_exchange_rate numeric(16,8),
    ext_fee numeric(16,8),
    ext_id character varying(128),
    ext_method character varying(20),
    ext_method_address character varying(128),
    ext_method_other character varying(32),
    ext_source character varying(32),
    is_credit boolean NOT NULL,
    trx_by character varying(50) NOT NULL,
    trx_date timestamp without time zone NOT NULL,
    trx_weight integer NOT NULL,
    trx_weight_unit integer NOT NULL,
    trx_type character varying(20) NOT NULL,
    account_id bigint NOT NULL,
    account_voucher_id bigint,
    cost_change_id bigint,
    doc_id bigint,
    pos_purchase_id bigint
);


ALTER TABLE public.tbl_account_trx OWNER TO savapage;

--
-- Name: tbl_account_voucher; Type: TABLE; Schema: public; Owner: savapage
--

CREATE TABLE public.tbl_account_voucher (
    account_voucher_id bigint NOT NULL,
    card_number character varying(128) NOT NULL,
    card_number_batch character varying(64),
    created_date timestamp without time zone NOT NULL,
    currency_code character varying(3),
    expiry_date timestamp without time zone,
    issued_date timestamp without time zone,
    redeemed_date timestamp without time zone,
    trx_acquirer_code character varying(32),
    trx_amount numeric(6,2),
    trx_consumer_email character varying(255),
    trx_merchant_code character varying(32),
    trx_ref_acquirer character varying(64),
    trx_ref_merchant character varying(64),
    trx_time_merchant bigint,
    trx_time_request bigint,
    uuid character varying(64) NOT NULL,
    value_amount numeric(6,2) NOT NULL,
    voucher_type character varying(16) NOT NULL
);


ALTER TABLE public.tbl_account_voucher OWNER TO savapage;

--
-- Name: tbl_application_log; Type: TABLE; Schema: public; Owner: savapage
--

CREATE TABLE public.tbl_application_log (
    application_log_id bigint NOT NULL,
    log_date timestamp without time zone NOT NULL,
    log_level character varying(20) NOT NULL,
    message character varying(2000) NOT NULL
);


ALTER TABLE public.tbl_application_log OWNER TO savapage;

--
-- Name: tbl_config; Type: TABLE; Schema: public; Owner: savapage
--

CREATE TABLE public.tbl_config (
    config_id bigint NOT NULL,
    created_by character varying(50) NOT NULL,
    created_date timestamp without time zone NOT NULL,
    modified_by character varying(50) NOT NULL,
    modified_date timestamp without time zone NOT NULL,
    property_name character varying(100) NOT NULL,
    property_value character varying(1000)
);


ALTER TABLE public.tbl_config OWNER TO savapage;

--
-- Name: tbl_cost_change; Type: TABLE; Schema: public; Owner: savapage
--

CREATE TABLE public.tbl_cost_change (
    cost_change_id bigint NOT NULL,
    chg_amount numeric(16,8),
    chg_by character varying(50),
    chg_cost numeric(16,8),
    chg_date timestamp without time zone NOT NULL,
    chg_reason character varying(1000),
    chg_status character varying(20) NOT NULL,
    chg_type character varying(20) NOT NULL,
    currency_code character varying(3) NOT NULL,
    req_amount numeric(16,8) NOT NULL,
    req_date timestamp without time zone NOT NULL,
    req_reason character varying(1000),
    doc_id bigint NOT NULL,
    req_user_id bigint
);


ALTER TABLE public.tbl_cost_change OWNER TO savapage;

--
-- Name: tbl_device; Type: TABLE; Schema: public; Owner: savapage
--

CREATE TABLE public.tbl_device (
    device_id bigint NOT NULL,
    created_by character varying(50) NOT NULL,
    created_date timestamp without time zone NOT NULL,
    device_function character varying(32),
    device_name character varying(255) NOT NULL,
    device_type character varying(32) NOT NULL,
    disabled boolean NOT NULL,
    display_name character varying(255) NOT NULL,
    hostname character varying(45) NOT NULL,
    last_usage_date timestamp without time zone,
    location character varying(255),
    modified_by character varying(50),
    modified_date timestamp without time zone,
    notes character varying(2000),
    port integer,
    card_reader_id bigint,
    printer_id bigint,
    printer_group_id bigint
);


ALTER TABLE public.tbl_device OWNER TO savapage;

--
-- Name: tbl_device_attr; Type: TABLE; Schema: public; Owner: savapage
--

CREATE TABLE public.tbl_device_attr (
    device_attr_id bigint NOT NULL,
    attrib_name character varying(255) NOT NULL,
    attrib_value character varying(2000),
    device_id bigint NOT NULL
);


ALTER TABLE public.tbl_device_attr OWNER TO savapage;

--
-- Name: tbl_doc_in; Type: TABLE; Schema: public; Owner: savapage
--

CREATE TABLE public.tbl_doc_in (
    doc_in_id bigint NOT NULL,
    originator_ip character varying(45),
    print_in_id bigint
);


ALTER TABLE public.tbl_doc_in OWNER TO savapage;

--
-- Name: tbl_doc_in_out; Type: TABLE; Schema: public; Owner: savapage
--

CREATE TABLE public.tbl_doc_in_out (
    doc_in_out_id bigint NOT NULL,
    total_pages integer,
    doc_in_id bigint NOT NULL,
    doc_out_id bigint NOT NULL
);


ALTER TABLE public.tbl_doc_in_out OWNER TO savapage;

--
-- Name: tbl_doc_log; Type: TABLE; Schema: public; Owner: savapage
--

CREATE TABLE public.tbl_doc_log (
    doc_id bigint NOT NULL,
    cost numeric(10,6) NOT NULL,
    cost_original numeric(10,6) NOT NULL,
    created_date timestamp without time zone NOT NULL,
    created_day timestamp without time zone NOT NULL,
    protocol character varying(16) NOT NULL,
    drm_restricted boolean NOT NULL,
    ext_data character varying(2000),
    ext_id character varying(64),
    ext_status character varying(16),
    ext_supplier character varying(16),
    invoiced boolean NOT NULL,
    log_comment character varying(255),
    mimetype character varying(255),
    size_bytes bigint NOT NULL,
    total_pages integer,
    refunded boolean NOT NULL,
    title character varying(255),
    uuid character varying(64) NOT NULL,
    doc_in_id bigint,
    doc_out_id bigint,
    user_id bigint NOT NULL
);


ALTER TABLE public.tbl_doc_log OWNER TO savapage;

--
-- Name: tbl_doc_out; Type: TABLE; Schema: public; Owner: savapage
--

CREATE TABLE public.tbl_doc_out (
    doc_out_id bigint NOT NULL,
    destination character varying(255),
    ecoprint boolean NOT NULL,
    letterhead boolean,
    remove_graphics boolean NOT NULL,
    signature character varying(50) NOT NULL,
    pdf_out_id bigint,
    print_out_id bigint
);


ALTER TABLE public.tbl_doc_out OWNER TO savapage;

--
-- Name: tbl_ipp_queue; Type: TABLE; Schema: public; Owner: savapage
--

CREATE TABLE public.tbl_ipp_queue (
    queue_id bigint NOT NULL,
    created_by character varying(50) NOT NULL,
    created_date timestamp without time zone NOT NULL,
    deleted boolean NOT NULL,
    deleted_date timestamp without time zone,
    disabled boolean NOT NULL,
    disabled_date timestamp without time zone,
    ip_allowed character varying(255),
    last_usage_date timestamp without time zone,
    lpd_enabled boolean NOT NULL,
    modified_by character varying(50),
    modified_date timestamp without time zone,
    reset_by character varying(50),
    reset_date timestamp without time zone,
    total_bytes bigint NOT NULL,
    total_jobs integer NOT NULL,
    total_pages integer NOT NULL,
    trusted boolean NOT NULL,
    url_path character varying(255) NOT NULL
);


ALTER TABLE public.tbl_ipp_queue OWNER TO savapage;

--
-- Name: tbl_ipp_queue_attr; Type: TABLE; Schema: public; Owner: savapage
--

CREATE TABLE public.tbl_ipp_queue_attr (
    queue_attr_id bigint NOT NULL,
    attrib_name character varying(255) NOT NULL,
    attrib_value character varying(2000),
    queue_id bigint NOT NULL
);


ALTER TABLE public.tbl_ipp_queue_attr OWNER TO savapage;

--
-- Name: tbl_pdf_out; Type: TABLE; Schema: public; Owner: savapage
--

CREATE TABLE public.tbl_pdf_out (
    pdf_out_id bigint NOT NULL,
    author character varying(255),
    encrypted boolean NOT NULL,
    keywords character varying(255),
    password_owner character varying(255),
    password_user character varying(255),
    subject character varying(255)
);


ALTER TABLE public.tbl_pdf_out OWNER TO savapage;

--
-- Name: tbl_pos_item; Type: TABLE; Schema: public; Owner: savapage
--

CREATE TABLE public.tbl_pos_item (
    pos_item_id bigint NOT NULL,
    item_cost numeric(6,2) NOT NULL,
    item_name character varying(255) NOT NULL
);


ALTER TABLE public.tbl_pos_item OWNER TO savapage;

--
-- Name: tbl_pos_purchase; Type: TABLE; Schema: public; Owner: savapage
--

CREATE TABLE public.tbl_pos_purchase (
    pos_purchase_id bigint NOT NULL,
    payment_comment character varying(255),
    payment_type character varying(50),
    receipt_num character varying(255) NOT NULL,
    total_cost numeric(8,2) NOT NULL
);


ALTER TABLE public.tbl_pos_purchase OWNER TO savapage;

--
-- Name: tbl_pos_purchase_item; Type: TABLE; Schema: public; Owner: savapage
--

CREATE TABLE public.tbl_pos_purchase_item (
    pos_purchase_item_id bigint NOT NULL,
    item_index integer NOT NULL,
    item_name character varying(255) NOT NULL,
    item_quantity integer NOT NULL,
    item_unit_cost numeric(6,2) NOT NULL,
    pos_purchase_id bigint NOT NULL
);


ALTER TABLE public.tbl_pos_purchase_item OWNER TO savapage;

--
-- Name: tbl_print_in; Type: TABLE; Schema: public; Owner: savapage
--

CREATE TABLE public.tbl_print_in (
    print_in_id bigint NOT NULL,
    denied_reason character varying(30),
    paper_height_mm integer,
    paper_size character varying(20),
    paper_width_mm integer,
    printed boolean NOT NULL,
    queue_id bigint NOT NULL
);


ALTER TABLE public.tbl_print_in OWNER TO savapage;

--
-- Name: tbl_print_out; Type: TABLE; Schema: public; Owner: savapage
--

CREATE TABLE public.tbl_print_out (
    print_out_id bigint NOT NULL,
    collate_copies boolean,
    color_pages_estimated boolean NOT NULL,
    color_pages_total integer NOT NULL,
    cups_completed_time integer,
    cups_creation_time integer NOT NULL,
    cups_job_id integer NOT NULL,
    cups_job_sheets character varying(128) NOT NULL,
    cups_job_state integer NOT NULL,
    cups_number_up character varying(1) NOT NULL,
    cups_page_set character varying(8) NOT NULL,
    duplex boolean NOT NULL,
    grayscale boolean NOT NULL,
    ipp_options character varying(2000),
    copies integer NOT NULL,
    total_esu bigint NOT NULL,
    total_sheets integer NOT NULL,
    paper_height_mm integer,
    paper_size character varying(20),
    paper_width_mm integer,
    print_mode character varying(8) NOT NULL,
    reverse_pages boolean NOT NULL,
    printer_id bigint NOT NULL
);


ALTER TABLE public.tbl_print_out OWNER TO savapage;

--
-- Name: tbl_printer; Type: TABLE; Schema: public; Owner: savapage
--

CREATE TABLE public.tbl_printer (
    printer_id bigint NOT NULL,
    charge_type character varying(20) NOT NULL,
    color_detection_mode character varying(20) NOT NULL,
    created_by character varying(50) NOT NULL,
    created_date timestamp without time zone NOT NULL,
    default_cost numeric(10,6) NOT NULL,
    deleted boolean NOT NULL,
    deleted_date timestamp without time zone,
    disabled boolean NOT NULL,
    disabled_date timestamp without time zone,
    display_name character varying(255) NOT NULL,
    last_usage_date timestamp without time zone,
    location character varying(255),
    modified_by character varying(50),
    modified_date timestamp without time zone,
    notes character varying(2000),
    printer_name character varying(255) NOT NULL,
    reset_by character varying(50),
    reset_date timestamp without time zone,
    server_name character varying(255),
    total_bytes bigint NOT NULL,
    total_esu bigint NOT NULL,
    total_jobs integer NOT NULL,
    total_pages integer NOT NULL,
    total_sheets integer NOT NULL
);


ALTER TABLE public.tbl_printer OWNER TO savapage;

--
-- Name: tbl_printer_attr; Type: TABLE; Schema: public; Owner: savapage
--

CREATE TABLE public.tbl_printer_attr (
    printer_attr_id bigint NOT NULL,
    attrib_name character varying(255) NOT NULL,
    attrib_value character varying(2000),
    printer_id bigint NOT NULL
);


ALTER TABLE public.tbl_printer_attr OWNER TO savapage;

--
-- Name: tbl_printer_group; Type: TABLE; Schema: public; Owner: savapage
--

CREATE TABLE public.tbl_printer_group (
    printer_group_id bigint NOT NULL,
    created_by character varying(50) NOT NULL,
    created_date timestamp without time zone NOT NULL,
    display_name character varying(255) NOT NULL,
    group_name character varying(255) NOT NULL,
    modified_by character varying(50),
    modified_date timestamp without time zone
);


ALTER TABLE public.tbl_printer_group OWNER TO savapage;

--
-- Name: tbl_printer_group_member; Type: TABLE; Schema: public; Owner: savapage
--

CREATE TABLE public.tbl_printer_group_member (
    printer_group_member_id bigint NOT NULL,
    created_by character varying(50) NOT NULL,
    created_date timestamp without time zone NOT NULL,
    modified_by character varying(50),
    modified_date timestamp without time zone,
    printer_group_id bigint NOT NULL,
    printer_id bigint NOT NULL
);


ALTER TABLE public.tbl_printer_group_member OWNER TO savapage;

--
-- Name: tbl_sequences; Type: TABLE; Schema: public; Owner: savapage
--

CREATE TABLE public.tbl_sequences (
    sequence_name character varying(255) NOT NULL,
    sequence_next_value bigint
);


ALTER TABLE public.tbl_sequences OWNER TO savapage;

--
-- Name: tbl_user; Type: TABLE; Schema: public; Owner: savapage
--

CREATE TABLE public.tbl_user (
    user_id bigint NOT NULL,
    admin boolean NOT NULL,
    created_by character varying(50) NOT NULL,
    created_date timestamp without time zone NOT NULL,
    deleted boolean NOT NULL,
    deleted_date timestamp without time zone,
    department character varying(200),
    disabled_pdf_out boolean NOT NULL,
    disabled_pdf_out_until timestamp without time zone,
    disabled_print_in boolean NOT NULL,
    disabled_print_in_until timestamp without time zone,
    disabled_print_out boolean NOT NULL,
    disabled_print_out_until timestamp without time zone,
    external_user_name character varying(255) NOT NULL,
    full_name character varying(255),
    internal boolean NOT NULL,
    last_user_activity timestamp without time zone,
    modified_by character varying(50),
    modified_date timestamp without time zone,
    total_pdf_out_bytes bigint NOT NULL,
    total_pdf_out_jobs integer NOT NULL,
    total_pdf_out_pages integer NOT NULL,
    total_print_in_bytes bigint NOT NULL,
    total_print_in_jobs integer NOT NULL,
    total_print_in_pages integer NOT NULL,
    total_print_out_bytes bigint NOT NULL,
    total_print_out_esu bigint NOT NULL,
    total_print_out_jobs integer NOT NULL,
    total_print_out_pages integer NOT NULL,
    total_print_out_sheets integer NOT NULL,
    office character varying(200),
    person boolean NOT NULL,
    reset_by character varying(50),
    reset_date timestamp without time zone,
    user_name character varying(50) NOT NULL
);


ALTER TABLE public.tbl_user OWNER TO savapage;

--
-- Name: tbl_user_account; Type: TABLE; Schema: public; Owner: savapage
--

CREATE TABLE public.tbl_user_account (
    user_account_id bigint NOT NULL,
    created_by character varying(50) NOT NULL,
    created_date timestamp without time zone NOT NULL,
    modified_by character varying(50),
    modified_date timestamp without time zone,
    account_id bigint NOT NULL,
    user_id bigint NOT NULL
);


ALTER TABLE public.tbl_user_account OWNER TO savapage;

--
-- Name: tbl_user_attr; Type: TABLE; Schema: public; Owner: savapage
--

CREATE TABLE public.tbl_user_attr (
    user_attr_id bigint NOT NULL,
    attrib_name character varying(255) NOT NULL,
    attrib_value character varying(2000),
    user_id bigint NOT NULL
);


ALTER TABLE public.tbl_user_attr OWNER TO savapage;

--
-- Name: tbl_user_card; Type: TABLE; Schema: public; Owner: savapage
--

CREATE TABLE public.tbl_user_card (
    user_card_id bigint NOT NULL,
    index_number integer NOT NULL,
    card_name character varying(255),
    card_number character varying(100) NOT NULL,
    user_id bigint NOT NULL
);


ALTER TABLE public.tbl_user_card OWNER TO savapage;

--
-- Name: tbl_user_email; Type: TABLE; Schema: public; Owner: savapage
--

CREATE TABLE public.tbl_user_email (
    user_email_id bigint NOT NULL,
    address character varying(255) NOT NULL,
    display_name character varying(255),
    index_number integer NOT NULL,
    user_id bigint NOT NULL
);


ALTER TABLE public.tbl_user_email OWNER TO savapage;

--
-- Name: tbl_user_group; Type: TABLE; Schema: public; Owner: savapage
--

CREATE TABLE public.tbl_user_group (
    user_group_id bigint NOT NULL,
    allow_accum boolean NOT NULL,
    created_by character varying(50) NOT NULL,
    created_date timestamp without time zone NOT NULL,
    full_name character varying(255),
    group_name character varying(255) NOT NULL,
    initial_credit numeric(8,2) NOT NULL,
    initial_overdraft numeric(16,6) NOT NULL,
    initial_settings_enabled boolean NOT NULL,
    initial_use_global_overdraft boolean NOT NULL,
    initially_restricted boolean NOT NULL,
    max_accum_balance numeric(8,2) NOT NULL,
    modified_by character varying(50),
    modified_date timestamp without time zone,
    reset_statistics boolean NOT NULL,
    schedule_amount numeric(8,2) NOT NULL,
    schedule_period character varying(10) NOT NULL
);


ALTER TABLE public.tbl_user_group OWNER TO savapage;

--
-- Name: tbl_user_group_account; Type: TABLE; Schema: public; Owner: savapage
--

CREATE TABLE public.tbl_user_group_account (
    user_group_account_id bigint NOT NULL,
    created_by character varying(50) NOT NULL,
    created_date timestamp without time zone NOT NULL,
    modified_by character varying(50),
    modified_date timestamp without time zone,
    account_id bigint NOT NULL,
    user_group_id bigint NOT NULL
);


ALTER TABLE public.tbl_user_group_account OWNER TO savapage;

--
-- Name: tbl_user_group_attr; Type: TABLE; Schema: public; Owner: savapage
--

CREATE TABLE public.tbl_user_group_attr (
    user_group_attr_id bigint NOT NULL,
    attrib_name character varying(255) NOT NULL,
    attrib_value character varying(2000),
    user_group_id bigint NOT NULL
);


ALTER TABLE public.tbl_user_group_attr OWNER TO savapage;

--
-- Name: tbl_user_group_member; Type: TABLE; Schema: public; Owner: savapage
--

CREATE TABLE public.tbl_user_group_member (
    user_group_member_id bigint NOT NULL,
    created_by character varying(50) NOT NULL,
    created_date timestamp without time zone NOT NULL,
    modified_by character varying(50),
    modified_date timestamp without time zone,
    user_group_id bigint NOT NULL,
    user_id bigint NOT NULL
);


ALTER TABLE public.tbl_user_group_member OWNER TO savapage;

--
-- Name: tbl_user_number; Type: TABLE; Schema: public; Owner: savapage
--

CREATE TABLE public.tbl_user_number (
    user_number_id bigint NOT NULL,
    index_number integer NOT NULL,
    id_name character varying(255),
    id_number character varying(32) NOT NULL,
    user_id bigint NOT NULL
);


ALTER TABLE public.tbl_user_number OWNER TO savapage;

--
-- Data for Name: tbl_account; Type: TABLE DATA; Schema: public; Owner: savapage
--

COPY public.tbl_account (account_id, account_type, balance, comments, created_by, created_date, deleted, deleted_date, disabled, disabled_until, invoicing, modified_by, modified_date, account_name, account_name_lower, notes, overdraft, pin, restricted, sub_name, sub_name_lower, sub_pin, use_global_overdraft, parent_id) FROM stdin;
\.


--
-- Data for Name: tbl_account_attr; Type: TABLE DATA; Schema: public; Owner: savapage
--

COPY public.tbl_account_attr (account_attr_id, attrib_name, attrib_value, account_id) FROM stdin;
\.


--
-- Data for Name: tbl_account_trx; Type: TABLE DATA; Schema: public; Owner: savapage
--

COPY public.tbl_account_trx (account_trx_id, amount, balance, trx_comment, currency_code, ext_amount, ext_confirmations, ext_currency_code, ext_details, ext_exchange_rate, ext_fee, ext_id, ext_method, ext_method_address, ext_method_other, ext_source, is_credit, trx_by, trx_date, trx_weight, trx_weight_unit, trx_type, account_id, account_voucher_id, cost_change_id, doc_id, pos_purchase_id) FROM stdin;
\.


--
-- Data for Name: tbl_account_voucher; Type: TABLE DATA; Schema: public; Owner: savapage
--

COPY public.tbl_account_voucher (account_voucher_id, card_number, card_number_batch, created_date, currency_code, expiry_date, issued_date, redeemed_date, trx_acquirer_code, trx_amount, trx_consumer_email, trx_merchant_code, trx_ref_acquirer, trx_ref_merchant, trx_time_merchant, trx_time_request, uuid, value_amount, voucher_type) FROM stdin;
\.


--
-- Data for Name: tbl_application_log; Type: TABLE DATA; Schema: public; Owner: savapage
--

COPY public.tbl_application_log (application_log_id, log_date, log_level, message) FROM stdin;
1	2026-02-04 16:41:09.775	INFO	Starting application server version: 1.6.0-final (Build 20251215)
2	2026-02-04 16:41:10.866	INFO	User Home Cleanup finished. Cleaned: 0 Users.
\.


--
-- Data for Name: tbl_config; Type: TABLE DATA; Schema: public; Owner: savapage
--

COPY public.tbl_config (config_id, created_by, created_date, modified_by, modified_date, property_name, property_value) FROM stdin;
1	[install]	2025-12-15 13:40:17.352	[install]	2025-12-15 13:40:17.352	system.schema-version	1
2	[install]	2025-12-15 13:40:17.352	[install]	2025-12-15 13:40:17.352	system.schema-version-minor	10
3	[install]	2025-12-15 13:40:17.352	[install]	2025-12-15 13:40:17.352	system.setup-completed	N
5	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	legacy.pdf.creator.enable	N
6	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	db.batch.commit-chunk-size	100
7	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	db.export.query-max-results	1000
8	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	financial.global.credit-limit	0.00
9	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	financial.global.currency-code	
10	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	financial.payment-gateway.accounts	
11	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	financial.pos.deposit.enable	Y
12	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	financial.pos.sales.enable	N
13	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	financial.pos.sales.credit-limit.enable	Y
14	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	financial.pos.sales.credit-limit	0.00
15	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	financial.pos.sales.card-as-password	OFF
16	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	financial.pos.sales.accounts	
17	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	financial.pos.sales.label.locations	
18	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	financial.pos.sales.label.locations.enable	N
19	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	financial.pos.sales.label.shops	
20	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	financial.pos.sales.label.shops.enable	N
21	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	financial.pos.sales.label.items	
22	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	financial.pos.sales.label.items.enable	N
23	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	financial.pos.sales.label.prices	
24	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	financial.pos.sales.label.prices.enable	N
25	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	financial.pos.payment-methods	
26	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	financial.pos.receipt-header	
27	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	financial.printer.cost-decimals	4
28	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	financial.user.account.papercut.enable	N
29	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	financial.user.balance-decimals	2
30	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	financial.user.transfers.enable	Y
31	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	financial.user.transfers.user-search.enable	N
32	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	financial.user.transfers.enable-comments	Y
33	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	financial.user.transfers.amount-min	0.01
34	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	financial.user.transfers.amount-max	999999999.99
35	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	financial.user.transfers.enable-limit-group	N
36	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	financial.user.transfers.limit-group	
37	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	financial.user.vouchers.enable	Y
38	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	financial.voucher.card-header	Pre-Paid Print Card
39	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	financial.voucher.card-footer	
40	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	financial.voucher.card-font-family	DEFAULT
41	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	auth-mode.name	Y
42	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	auth-mode.name.show	Y
43	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	auth-mode.email	N
44	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	auth-mode.email.show	Y
45	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	auth-mode.id	N
46	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	auth-mode.id.pin-required	Y
47	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	auth-mode.id.is-masked	N
48	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	auth-mode.id.show	Y
49	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	auth-mode.card-local	N
50	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	auth-mode.yubikey	N
51	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	auth-mode.yubikey.show	Y
52	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	auth-mode.yubikey.api.client-id	
53	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	auth-mode.yubikey.api.secret-key	
54	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	auth-mode.card.pin-required	Y
55	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	auth-mode.card.self-association	N
56	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	auth-mode.card-ip.expiry-msecs	2000
57	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	auth-mode.card-local.show	Y
58	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	auth-mode-default	name
59	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	auth.method	none
60	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	auth.custom.user-sync	
61	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	auth.custom.user-auth	
62	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	auth.user.rate-limit-ip.enable	N
63	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	auth.user.rate-limit-ip.per-min	5
64	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	auth.ldap.admin-dn	
65	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	auth.ldap.admin-password	
66	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	auth.ldap.basedn	
67	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	auth.ldap.host	localhost
68	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	auth.ldap.port	389
69	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	auth.ldap.use-ssl	N
70	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	auth.ldap.use-ssl.trust-self-signed	N
71	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	auth.ldap.use-starttls	N
72	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	auth.ldap.starttls-cert-dnsname	
73	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	auth.ldap.ssl.hostname-verification-disable	N
74	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	card.number.format	HEX
75	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	card.number.first-byte	LSB
76	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	cups.ipp.max-connections	10
77	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	cups.ipp.exception.stacktrace	Y
78	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	cups.ipp.local-connect-timeout-msec	5000
79	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	cups.ipp.local-socket-timeout-msec	9000
80	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	cups.ipp.remote-enabled	N
81	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	cups.ipp.remote-connect-timeout-msec	5000
82	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	cups.ipp.remote-socket-timeout-msec	9000
83	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	cups.ipp.job-state.cancel-if-stopped.enable	Y
84	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	cups.ipp.notification.method	PUSH
85	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	cups.ipp.notification.push.heartbeat-msec	4000
86	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	cups.ipp.notification.push.pull-fallback-msec	30000
87	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	cups.ipp.notification.push.notify-lease-duration	4200
88	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	cups.ipp.notification.pull.heartbeat-msec	5000
89	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	delete.account-trx-log	Y
90	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	delete.account-trx-log.days	365
91	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	delete.app-log	Y
92	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	delete.app-log.days	365
93	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	delete.doc-log	Y
94	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	delete.doc-log.days	365
95	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	device.card-reader.default-port	7772
96	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	doc.convert.xpstopdf-enabled	N
97	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	doc.convert.libreoffice-enabled	N
98	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	download.max-connections	10
99	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	download.max-connections-per-route	2
100	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	download.connect-timeout-msec	5000
101	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	download.socket-timeout-msec	9000
102	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	restful.client.max-connections	100
103	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	restful.client.max-connections-per-route	20
104	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	restful.client.connect-timeout-msec	4000
105	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	restful.client.read-timeout-msec	2000
106	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	restful.client.trust-self-signed	N
107	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	environment.co2-grams-per-sheet	5.1
108	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	environment.sheets-per-tree	8333
109	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	environment.watt-hours-per-sheet	12.5
110	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	ext.papercut.user.sync.enable	N
111	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	ext.papercut.user.sync.username	
112	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	ext.papercut.user.sync.password	
113	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	ext.papercut.user.sync.ip-addresses-allowed	
114	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	ext.telegram.enable	N
115	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	ext.telegram.bot.username	
116	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	ext.telegram.bot.token	
117	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	ext.webapi.callback.url-base	
118	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	ext.webapi.redirect.url-webapp-user	
119	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	infra.internet-connected	Y
120	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	internal-users.enable	Y
121	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	internal-users.registration.enable	N
122	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	internal-users.registration.email.domain-whitelist	
123	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	internal-users.registration.ip-addresses-allowed	
124	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	internal-users.registration.email.expiry-mins	60
125	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	internal-users.registration.verify-url.authority	
126	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	internal-users.user-can-change-password	Y
127	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	internal-users.username-prefix	guest-
128	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	internal-users.password-length-min	6
129	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	ipp.ext.constraint.booklet.enable	N
130	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	ipp.job-name.space-to-underscore.enable	N
131	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	ipp.internet-printer.uri-base	
132	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	ipp.routing.enable	N
133	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	ipp.routing.terminal.enable	Y
134	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	ipp.routing.printer.enable	Y
135	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	ipp.printer-attr.printer-uuid	cd9beb15-aa2b-4b28-a7c3-06f9aa1e1fa9
136	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	ldap.batchsize	500
137	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	ldap.schema.group-member-field	
138	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	ldap.schema.group-name-field	
139	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	ldap.schema.group-full-name-field	
140	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	ldap.schema.group-search	
141	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	ldap.schema.user-name-group-search	
142	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	ldap.schema.nested-group-search	
143	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	ldap.schema.dn-field	
144	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	ldap.disabled-users.allow	
145	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	ldap.disabled-users.local-filter	
146	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	ldap.schema.posix-groups	
147	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	ldap.schema.type	OPEN_LDAP
148	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	ldap.schema.user-name-field	
149	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	ldap.schema.user-name-search	
150	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	ldap.schema.user-full-name-field	
151	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	ldap.schema.user-email-field	
152	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	ldap.schema.user-department-field	
153	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	ldap.schema.user-office-field	
154	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	ldap.schema.user-card-number-field	
155	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	ldap.user-card-number.first-byte	LSB
156	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	ldap.user-card-number.format	HEX
157	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	ldap.schema.user-id-number-field	
158	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	papercut.enable	N
159	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	papercut.db.enable	Y
160	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	papercut.db.jdbc-driver	
161	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	papercut.db.jdbc-url	
162	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	papercut.db.user	
163	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	papercut.db.password	
164	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	papercut.server.host	localhost
165	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	papercut.server.port	9191
166	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	papercut.webservices.auth-token	
167	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	papercut.xmlrpc.url-path	/rpc/api/xmlrpc
168	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	api.jsonrpc.secret-key	
169	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	api.jsonrpc.ext.ip-addresses-allowed	
170	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	api.restful.auth.username	
171	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	api.restful.auth.password	
172	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	api.restful.ip-addresses-allowed	
173	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	feed.atom.admin.enable	N
174	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	feed.atom.admin.schedule	0 0 3 ? * 3-7
175	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	feed.atom.admin.uuid	831dd5ef-5c91-462a-856e-0256e95c43cd
176	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	feed.atom.admin.username	
177	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	feed.atom.admin.password	
178	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	print.imap.enable	N
179	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	print.imap.host	
180	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	print.imap.port	143
181	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	print.imap.connectiontimeout-msecs	10000
182	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	print.imap.timeout-msecs	10000
183	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	print.imap.security	starttls
184	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	print.imap.user	
185	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	print.imap.password	
186	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	print.imap.debug	N
187	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	print.imap.folder.inbox	Inbox
188	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	print.imap.folder.trash	Trash
189	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	print.imap.folder.trash.enable	Y
190	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	print.imap.session.heartbeat-secs	300
191	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	print.imap.session.duration-secs	3000
192	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	print.imap.max-file-mb	5
193	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	print.imap.max-files	1
194	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	print-imap.content.eml.detain	OFF
195	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	print.imap.ticket.enable	N
196	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	print.imap.ticket.operator	
197	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	print.imap.ticket.include-known-users	N
198	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	print.imap.ticket.no-files-content.enable	Y
199	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	print.imap.ticket.reply.content-type.html	Y
200	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	webapp.internet.mailtickets.enable	Y
201	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	webapp.internet.mailtickets.auth-mode.enable	N
202	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	webapp.internet.mailtickets.auth-modes	name
203	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	webapp.internet.payment.enable	Y
204	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	webapp.internet.payment.auth-mode.enable	N
205	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	webapp.internet.payment.auth-modes	name
206	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	printer.snmp.enable	N
207	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	printer.snmp.read.trigger-mins	240
208	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	printer.snmp.read.retries	2
209	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	printer.snmp.read.timeout-msec	1500
210	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	printer.snmp.marker.percent.warn	30
211	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	printer.snmp.marker.percent.alert	10
212	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	soffice.enable	N
213	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	soffice.home	
214	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	soffice.profile.template-dir	
215	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	soffice.connection.ports	2002,2003
216	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	soffice.connection.restart-task-count	200
217	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	soffice.task.queue-timeout-msec	10000
218	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	soffice.task.exec-timeout-msec	20000
219	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	soffice.respond.retry-msec	250
220	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	soffice.respond.timeout-msec	30000
221	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	soffice.start.retry-msec	1000
222	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	soffice.start.timeout-msec	120000
223	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	reports.pdf.font-family	DEFAULT
224	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	print.imap.auth.login.disable	N
225	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	print.imap.auth.plain.disable	N
226	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	print.imap.auth.ntlm.disable	N
227	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	mail.smtp.host	localhost
228	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	mail.smtp.port	465
229	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	mail.smtp.security	ssl
230	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	mail.smtp.username	
231	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	mail.smtp.password	
232	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	mail.smtp.debug	N
233	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	mail.smtp.max-file-kb	1024
234	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	mail.smtp.connectiontimeout	5000
235	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	mail.smtp.timeout	5000
236	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	mail.outbox.poll.heartbeat-msec	10000
237	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	mail.outbox.send.interval-msec	1000
238	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	mail.from.address	
239	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	mail.from.name	SavaPage
240	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	mail.reply.to.address	
241	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	mail.reply.to.name	DO NOT REPLY
242	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	mail.pgp.mime.sign	Y
243	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	mail.pgp.mime.encrypt	Y
244	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	pgp.pks.url	
245	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	custom.template.home	
246	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	custom.template.home.mail	
247	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	print-in.pdf.encrypted.allow	Y
248	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	print-in.pdf.invalid.repair	Y
249	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	print-in.pdf.fonts.verify	Y
250	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	print-in.pdf.fonts.verify.reject	Y
251	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	print-in.pdf.fonts.embed	Y
252	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	print-in.pdf.clean	Y
253	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	print-in.pdf.prepress	N
254	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	print-in.ps.driver.images.trigger	AUTO
255	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	print-in.ps.driver.images.dpi	300
256	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	print-in.ps.driver.detain	OFF
257	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	print-in.ps.driverless.images.trigger	AUTO
258	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	print-in.ps.driverless.images.dpi	300
259	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	print-in.job-expiry.mins	0
260	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	print-in.job-expiry-ignored.mins	10
261	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	jobticket.copier.enable	N
262	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	jobticket.delivery-datetime.enable	Y
263	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	jobticket.delivery-time.enable	Y
264	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	jobticket.delivery-days	1
265	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	jobticket.delivery-days-min	1
266	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	jobticket.delivery-days-of-week	MON-FRI
267	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	jobticket.delivery-day-minutes	510
268	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	jobticket.notify-email.completed.enable	Y
269	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	jobticket.notify-email.canceled.enable	Y
270	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	jobticket.notify-email.content-type.html	Y
271	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	jobticket.domains	
272	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	jobticket.domains.enable	N
273	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	jobticket.domains.required	Y
274	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	jobticket.domains.retain	Y
275	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	jobticket.uses	
276	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	jobticket.uses.enable	N
277	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	jobticket.uses.required	Y
278	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	jobticket.tags	
279	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	jobticket.tags.1	
280	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	jobticket.tags.enable	N
281	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	jobticket.tags.required	Y
282	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	doc.store.enable	N
283	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	doc.store.free-space-limit-mb	5000
284	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	doc.store.archive.enable	N
285	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	doc.store.archive.out.enable	N
286	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	doc.store.archive.out.print.enable	N
287	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	doc.store.archive.out.pdf.enable	N
288	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	doc.store.archive.in.enable	N
289	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	doc.store.archive.in.print.enable	N
290	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	doc.store.archive.out.print.days-to-keep	30
291	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	doc.store.archive.out.pdf.days-to-keep	30
292	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	doc.store.archive.in.print.days-to-keep	30
293	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	doc.store.journal.enable	N
294	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	doc.store.journal.out.enable	N
295	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	doc.store.journal.out.print.enable	N
296	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	doc.store.journal.out.pdf.enable	N
297	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	doc.store.journal.in.enable	N
298	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	doc.store.journal.in.print.enable	N
299	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	doc.store.journal.out.print.days-to-keep	2
300	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	doc.store.journal.out.pdf.days-to-keep	2
401	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	stats.total.reset-date	1770219663501
402	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	stats.total.reset-date.print-in	1770219663501
403	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	stats.total.pdf-out.pages	0
404	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	stats.total.pdf-out.bytes	0
405	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	stats.total.print-in.docs	0
406	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	stats.total.print-in.pdf	0
407	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	stats.total.print-in.pdf.repair	0
408	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	stats.total.print-in.pdf.repair.fail	0
409	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	stats.total.print-in.pdf.repair.font	0
410	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	stats.total.print-in.pdf.repair.font.fail	0
411	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	stats.total.print-in.pages	0
412	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	stats.total.print-in.bytes	0
413	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	stats.total.print-out.pages	0
414	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	stats.total.print-out.sheets	0
415	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	stats.total.print-out.esu	0
416	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	stats.total.print-out.bytes	0
417	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:10.915	stats.userhome	{"date":1770219670859,"duration":0,"cleaned":true,"current":{"users":{"count":0},"inbox":{"count":0,"size":0},"outbox":{"count":0,"size":0}},"cleanup":{"users":{"count":0},"inbox":{"count":0,"size":0},"outbox":{"count":0,"size":0}},"rc":0}
418	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	system.backup.before-db-upgrade	Y
419	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	system.backup.last-run-time	0
420	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	system.backup.days-to-keep	30
421	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	system.backup.enable-automatic	Y
422	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	system.backup.xmlformatter.enable	N
423	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	system.default-locale	
424	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	system.default-papersize	
425	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	system.server.dns-name	
426	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	system.startup.cups.ipp.sync-print-jobs.enable	Y
427	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	system.inetfilter.enable	N
428	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	system.inetfilter.whitelist	
429	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	system.inetfilter.whitelist.empty-allow-all	Y
430	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	system.inetfilter.blacklist	
431	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	system.inetfilter.warn-interval.applog.mins	5
432	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	system.inetfilter.warn-interval.webapp.secs	60
433	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	system.dosfilter.enable	Y
434	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	system.dosfilter.delay-msec	100
435	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	system.dosfilter.throttle-msec	30000
436	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	system.dosfilter.throttled-requests	5
301	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	doc.store.journal.in.print.days-to-keep	2
302	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	proxy-print.delegate.enable	N
303	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	proxy-print.delegate.account.group.enable	Y
304	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	proxy-print.delegate.account.user.enable	Y
305	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	proxy-print.delegate.groups.preferred.enable	Y
306	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	proxy-print.delegate.accounts.preferred.enable	Y
307	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	proxy-print.delegate.account.shared.enable	Y
308	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	proxy-print.delegate.account.shared.group.enable	Y
309	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	proxy-print.delegate.multiple-member-copies.enable	Y
310	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	proxy-print.delegate.group-copies.enable	N
311	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	proxy-print.papercut.print-log.max-mins	7200
312	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	proxy-print.personal.papercut.enable	N
313	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	proxy-print.delegate.papercut.enable	N
314	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	proxy-print.delegate.papercut.front-end.enable	N
315	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	proxy-print.delegate.papercut.account.shared.parent	SavaPage
316	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	proxy-print.delegate.papercut.account.shared.child.jobs	Jobs
317	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	proxy-print.delegate.papercut.account.personal	SavaPage
318	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	proxy-print.delegate.papercut.account.personal-type	
319	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	proxy-print.non-secure	Y
320	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	proxy-print.fast-expiry-mins	10
321	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	proxy-print.fast-inherit-printin-ipp.enable	N
322	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	proxy-print.hold-expiry-mins	60
323	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	proxy-print.hold-extend-mins	10
324	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	proxy-print.hold-ignored-mins	10
325	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	proxy-print.direct-expiry-secs	20
326	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	proxy-print.max-pages	
327	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	proxy-print.non-secure-printer-group	
328	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	proxy-print.remove-graphics.enable	Y
329	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	proxy-print.repair.enable	N
330	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	proxy-print.convert	N
331	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	proxy-print.convert.suspend	N
332	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	proxy-print.convert.grayscale	N
333	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	proxy-print.convert.rasterize	N
334	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	proxy-print.convert.rasterize.dpi	DPI_300
335	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	proxy-print.convert.rasterize.zero.fonts	N
336	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	proxy-print.convert.rasterize.max.bytes	0
337	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	proxy-print.convert.rasterize.max.pages	0
338	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	pdf-out.convert.rasterize.dpi.download	DPI_300
339	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	pdf-out.convert.rasterize.dpi.email	DPI_300
340	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	schedule.daily	0 10 0 * * ?
341	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	schedule.daily-maintenance	0 55 0 * * ?
342	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	schedule.hourly	0 0 * * * ?
343	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	schedule.monthly	0 30 0 1 * ?
344	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	schedule.weekly	0 20 0 ? * 1
345	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	schedule.auto-sync.user	Y
346	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	stats.payment-gateway.rolling-day.count	
347	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	stats.payment-gateway.rolling-day.cents	
348	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	stats.payment-gateway.rolling-week.count	
349	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	stats.payment-gateway.rolling-week.cents	
350	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	stats.payment-gateway.rolling-month.count	
351	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	stats.payment-gateway.rolling-month.cents	
352	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	stats.print-in.rolling-day.docs	
353	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	stats.print-in.rolling-day.pdf	
354	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	stats.print-in.rolling-day.pdf.repair	
355	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	stats.print-in.rolling-day.pdf.repair.fail	
356	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	stats.print-in.rolling-day.pdf.repair.font	
357	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	stats.print-in.rolling-day.pdf.repair.font.fail	
358	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	stats.print-in.rolling-day.pages	
359	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	stats.print-in.rolling-week.docs	
360	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	stats.print-in.rolling-week.pdf	
361	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	stats.print-in.rolling-week.pdf.repair	
362	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	stats.print-in.rolling-week.pdf.repair.fail	
363	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	stats.print-in.rolling-week.pdf.repair.font	
364	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	stats.print-in.rolling-week.pdf.repair.font.fail	
365	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	stats.print-in.rolling-week.pages	
366	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	stats.print-in.rolling-week.bytes	
367	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	stats.print-in.rolling-month.docs	
368	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	stats.print-in.rolling-month.pdf	
369	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	stats.print-in.rolling-month.pdf.repair	
370	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	stats.print-in.rolling-month.pdf.repair.fail	
371	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	stats.print-in.rolling-month.pdf.repair.font	
372	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	stats.print-in.rolling-month.pdf.repair.font.fail	
373	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	stats.print-in.rolling-month.pages	
374	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	stats.print-in.rolling-month.bytes	
375	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	stats.pdf-out.rolling-day.pages	
376	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	stats.pdf-out.rolling-week.pages	
377	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	stats.pdf-out.rolling-week.bytes	
378	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	stats.pdf-out.rolling-month.pages	
379	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	stats.pdf-out.rolling-month.bytes	
380	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	stats.pos.deposit.rolling-day.count	
381	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	stats.pos.deposit.rolling-day.cents	
382	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	stats.pos.deposit.rolling-week.count	
383	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	stats.pos.deposit.rolling-week.cents	
384	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	stats.pos.deposit.rolling-month.count	
385	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	stats.pos.deposit.rolling-month.cents	
386	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	stats.pos.purchase.rolling-day.count	
387	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	stats.pos.purchase.rolling-day.cents	
388	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	stats.pos.purchase.rolling-week.count	
389	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	stats.pos.purchase.rolling-week.cents	
390	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	stats.pos.purchase.rolling-month.count	
391	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	stats.pos.purchase.rolling-month.cents	
392	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	stats.print-out.rolling-day.pages	
393	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	stats.print-out.rolling-week.pages	
394	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	stats.print-out.rolling-week.sheets	
395	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	stats.print-out.rolling-week.esu	
396	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	stats.print-out.rolling-week.bytes	
397	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	stats.print-out.rolling-month.pages	
398	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	stats.print-out.rolling-month.sheets	
399	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	stats.print-out.rolling-month.esu	
400	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	stats.print-out.rolling-month.bytes	
437	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	system.dosfilter.too-many-code	429
438	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	system.dosfilter.max-request-msec	30000
439	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	system.dosfilter.max-requests-per-sec	75
440	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	system.dosfilter.max-idle-tracker-msec	30000
441	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	system.dosfilter.whitelist	
442	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	system.dosfilter.warn-interval.applog.mins	5
443	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	system.dosfilter.warn-interval.webapp.secs	60
444	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	system.maintenance	N
445	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	system.monitor.heartbeat-sec	120
446	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	system.host.cmd.pdftocairo.img.strategy	AUTO
447	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	system.cmd.wkhtmltopdf.enable	Y
448	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	user.can-change-pin	Y
449	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	user.pin-length-min	4
450	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	user.pin-length-max	0
451	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	user.id-number-length-min	4
452	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	user.id-number-generate.enable	Y
453	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	user.id-number-generate.length	8
454	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	user.insert.lazy-login	Y
455	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	user.insert.lazy-print	N
456	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	user-source.group	
457	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	user-source.update-user-details	Y
458	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	user.ext.telegram.totp.enable	Y
459	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	user.totp.enable	Y
460	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	user.totp.issuer	
461	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	cliapp.ip-addresses-allowed	
462	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	cliapp.auth.ip-addresses-denied.enable	N
463	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	cliapp.auth.trust-user-account	N
464	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	cliapp.auth.admin-passkey	
465	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	cliapp.auth.trust-webapp-user-auth	Y
466	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	cliapp.print-in.url-query	
467	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	cliapp.print-in.dialog.button-open	
468	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	eco-print.enable	N
469	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	eco-print.auto-threshold.page-count	0
470	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	eco-print.resolution-dpi	300
471	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	eco-print.discount-percent	15
472	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	webapp.doclog.show-doc-title	Y
473	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	webapp.number-up-preview.enable	Y
474	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	webapp.watchdog.interval-secs	3
475	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	webapp.watchdog.allowed-delay-secs	7
476	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	webapp.watchdog.message.enable	Y
477	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	webapp.admin.dashboard.show-tech-info	N
478	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	webapp.admin.dashboard.show-env-info	Y
479	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	webapp.pdfpgp.enable	N
480	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	webapp.pdfpgp.max-upload-file-mb	10
481	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	pdfpgp.verification.enable	N
482	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	pdfpgp.verification.host	
483	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	pdfpgp.verification.port	
484	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	securitytxt.enable	N
485	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	securitytxt.contact.mailto	
486	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	securitytxt.contact.tel	
487	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	securitytxt.contact.url	
488	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	securitytxt.encryption.uri	
489	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	securitytxt.acknowledgments.url	
490	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	securitytxt.preferred-languages	en
491	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	securitytxt.policy.url	
492	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	securitytxt.hiring.url	
493	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	webapp.jobtickets.cancel-all.enable	Y
494	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	webapp.jobtickets.print-all.enable	Y
495	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	webapp.jobtickets.close-all.enable	Y
496	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	webapp.jobtickets.reopen.enable	N
497	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	webapp.jobtickets.list-size	10
498	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	webapp.jobtickets.list-size-min	5
499	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	webapp.jobtickets.list-size-max	50
500	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	webapp.payment.help.url	
501	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	webapp.payment.main.nav-button-text	ON
502	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	webapp.payment.help.url.enable	Y
503	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	webapp.pos.sound.success	
504	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	webapp.pos.sound.failure	
505	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	webapp.pos.sales.label.items.button-max	7
506	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	webapp.pos.sales.label.prices.button-max	10
507	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	webapp.user.auth.trust-cliapp-auth	Y
508	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	webapp.user.doclog.select.type.default-order	
509	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	webapp.user.gdpr.enable	Y
510	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	webapp.user.page-browser.draw.enable	Y
511	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	webapp.user.gdpr.contact.email	
512	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	webapp.user.max-idle-secs	0
513	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	webapp.user.logout.clear-inbox	N
514	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	webapp.user.print-in.job-expiry.signal-mins	0
515	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	webapp.user.proxy-print.scaling.media-match.show	N
516	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	webapp.user.proxy-print.scaling.media-clash.show	Y
517	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	webapp.user.proxy-print.scaling.media-match.default	AUTO
518	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	webapp.user.proxy-print.scaling.media-clash.default	FIT
519	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	webapp.user.proxy-print.max-copies	30
520	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	webapp.user.printers.quick-search.max	5
521	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	webapp.user.doc.store.archive.out.print.prompt	Y
522	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	webapp.user.database-user-row-locking.enabled	Y
523	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	webapp.user.proxy-print.clear-inbox.enable	N
524	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	webapp.user.proxy-print.clear-inbox.scope	ALL
525	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	webapp.user.proxy-print.clear-inbox.prompt	Y
526	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	webapp.user.proxy-print.clear-printer	N
527	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	webapp.user.proxy-print.clear-delegate	N
528	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	webapp.user.proxy-print.collate.show	Y
529	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	webapp.user.proxy-print.delegate-copies-apply-switch	Y
530	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	webapp.user.proxy-print.confirm	N
531	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	webapp.user.proxy-print.delegator-user.hide-id	N
532	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	webapp.user.proxy-print.delegator-user.detail	FULL
533	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	webapp.user.proxy-print.delegator-group.hide-id	N
534	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	webapp.user.proxy-print.delegator-group.detail	FULL
535	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	webapp.user.proxy-print.separate.enable	N
536	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	webapp.user.proxy-print.separate	N
537	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	webapp.user.help.url	
538	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	webapp.user.help.url.enable	Y
539	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	webapp.user.main.nav-button-text	AUTO
540	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	webapp.user.show-env-info	Y
541	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	webapp.user.show-pagometer	Y
542	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	webapp.about.driver-download.enable	Y
543	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	webapp.card-local.keystrokes-max-msecs	500
544	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	webapp.yubikey.keystrokes-max-msecs	1500
545	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	webapp.card-assoc.dialog-max-secs	30
546	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	webapp.style.default.enable	Y
547	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	webapp.theme.admin	
548	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	webapp.theme.printsite	
549	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	webapp.theme.jobtickets	
550	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	webapp.theme.mailtickets	
551	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	webapp.theme.pos	
552	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	webapp.theme.user	
553	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	webapp.theme.payment	
554	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	webapp.custom.admin	
555	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	webapp.custom.printsite	
556	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	webapp.custom.jobtickets	
557	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	webapp.custom.mailtickets	
558	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	webapp.custom.pos	
559	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	webapp.custom.user	
560	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	webapp.custom.payment	
561	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	webapp.html.admin.about	
562	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	webapp.html.printsite.about	
563	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	webapp.html.jobtickets.about	
564	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	webapp.html.mailtickets.about	
565	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	webapp.html.pos.about	
566	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	webapp.html.user.about	
567	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	webapp.html.payment.about	
568	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	webapp.html.admin.login	
569	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	webapp.html.printsite.login	
570	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	webapp.html.jobtickets.login	
571	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	webapp.html.mailtickets.login	
572	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	webapp.html.pos.login	
573	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	webapp.html.user.login	
574	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	webapp.html.payment.login	
575	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	webapp.internet.enable	Y
576	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	webapp.internet.admin.enable	Y
577	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	webapp.internet.admin.auth-mode.enable	N
578	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	webapp.internet.admin.auth-modes	name
579	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	webapp.internet.jobtickets.enable	Y
580	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	webapp.internet.jobtickets.auth-mode.enable	N
581	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	webapp.internet.jobtickets.auth-modes	name
582	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	webapp.internet.printsite.enable	N
583	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	webapp.internet.printsite.auth-mode.enable	N
584	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	webapp.internet.printsite.auth-modes	name
585	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	webapp.internet.pos.enable	Y
586	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	webapp.internet.pos.auth-mode.enable	N
587	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	webapp.internet.pos.auth-modes	name
588	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	webapp.internet.user.enable	Y
589	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	webapp.internet.user.auth-mode.enable	N
590	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	webapp.internet.user.auth-modes	name
591	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	webapp.language.available	
592	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	web-login.authtoken.enable	Y
593	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	web-login.ttp.enable	Y
594	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	web-login.ttp.apikey	
595	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	web-login.ttp.token.expiry-msecs	5000
596	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	web-login.admin.session-timeout-mins	1440
597	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	web-login.user.session-timeout-mins	60
598	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	web-print.enable	N
599	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	web-print.dropzone-enable	Y
600	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	web-print.max-file-mb	10
601	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	web-print.graphics.enable	Y
602	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	web-print.file-ext.exclude	
603	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	web-print.limit-ip-addresses	
604	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	webserver.http.header.xff.enable	N
605	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	webserver.http.header.xff.debug	N
606	[system]	2026-02-04 16:41:07.179	[system]	2026-02-04 16:41:07.179	webserver.http.header.xff.proxies.allowed	
4	[install]	2025-12-15 13:40:17.352	[system]	2026-02-04 16:50:47.609	community.visitor.start-date	
\.


--
-- Data for Name: tbl_cost_change; Type: TABLE DATA; Schema: public; Owner: savapage
--

COPY public.tbl_cost_change (cost_change_id, chg_amount, chg_by, chg_cost, chg_date, chg_reason, chg_status, chg_type, currency_code, req_amount, req_date, req_reason, doc_id, req_user_id) FROM stdin;
\.


--
-- Data for Name: tbl_device; Type: TABLE DATA; Schema: public; Owner: savapage
--

COPY public.tbl_device (device_id, created_by, created_date, device_function, device_name, device_type, disabled, display_name, hostname, last_usage_date, location, modified_by, modified_date, notes, port, card_reader_id, printer_id, printer_group_id) FROM stdin;
\.


--
-- Data for Name: tbl_device_attr; Type: TABLE DATA; Schema: public; Owner: savapage
--

COPY public.tbl_device_attr (device_attr_id, attrib_name, attrib_value, device_id) FROM stdin;
\.


--
-- Data for Name: tbl_doc_in; Type: TABLE DATA; Schema: public; Owner: savapage
--

COPY public.tbl_doc_in (doc_in_id, originator_ip, print_in_id) FROM stdin;
\.


--
-- Data for Name: tbl_doc_in_out; Type: TABLE DATA; Schema: public; Owner: savapage
--

COPY public.tbl_doc_in_out (doc_in_out_id, total_pages, doc_in_id, doc_out_id) FROM stdin;
\.


--
-- Data for Name: tbl_doc_log; Type: TABLE DATA; Schema: public; Owner: savapage
--

COPY public.tbl_doc_log (doc_id, cost, cost_original, created_date, created_day, protocol, drm_restricted, ext_data, ext_id, ext_status, ext_supplier, invoiced, log_comment, mimetype, size_bytes, total_pages, refunded, title, uuid, doc_in_id, doc_out_id, user_id) FROM stdin;
\.


--
-- Data for Name: tbl_doc_out; Type: TABLE DATA; Schema: public; Owner: savapage
--

COPY public.tbl_doc_out (doc_out_id, destination, ecoprint, letterhead, remove_graphics, signature, pdf_out_id, print_out_id) FROM stdin;
\.


--
-- Data for Name: tbl_ipp_queue; Type: TABLE DATA; Schema: public; Owner: savapage
--

COPY public.tbl_ipp_queue (queue_id, created_by, created_date, deleted, deleted_date, disabled, disabled_date, ip_allowed, last_usage_date, lpd_enabled, modified_by, modified_date, reset_by, reset_date, total_bytes, total_jobs, total_pages, trusted, url_path) FROM stdin;
1	[install]	2025-12-15 13:40:17.352	f	\N	f	\N		\N	f	\N	\N	\N	\N	0	0	0	t	/
2	[system]	2026-02-04 16:41:07.179	f	\N	f	\N	\N	\N	f	\N	\N	\N	\N	0	0	0	f	airprint
3	[system]	2026-02-04 16:41:07.179	f	\N	f	\N	\N	\N	f	\N	\N	\N	\N	0	0	0	f	internet
4	[system]	2026-02-04 16:41:07.179	f	\N	f	\N	\N	\N	f	\N	\N	\N	\N	0	0	0	f	mailprint
5	[system]	2026-02-04 16:41:07.179	f	\N	f	\N	\N	\N	f	\N	\N	\N	\N	0	0	0	f	raw
6	[system]	2026-02-04 16:41:07.179	f	\N	f	\N	\N	\N	f	\N	\N	\N	\N	0	0	0	f	webprint
7	[system]	2026-02-04 16:41:07.179	f	\N	f	\N	\N	\N	f	\N	\N	\N	\N	0	0	0	f	webservice
\.


--
-- Data for Name: tbl_ipp_queue_attr; Type: TABLE DATA; Schema: public; Owner: savapage
--

COPY public.tbl_ipp_queue_attr (queue_attr_id, attrib_name, attrib_value, queue_id) FROM stdin;
\.


--
-- Data for Name: tbl_pdf_out; Type: TABLE DATA; Schema: public; Owner: savapage
--

COPY public.tbl_pdf_out (pdf_out_id, author, encrypted, keywords, password_owner, password_user, subject) FROM stdin;
\.


--
-- Data for Name: tbl_pos_item; Type: TABLE DATA; Schema: public; Owner: savapage
--

COPY public.tbl_pos_item (pos_item_id, item_cost, item_name) FROM stdin;
\.


--
-- Data for Name: tbl_pos_purchase; Type: TABLE DATA; Schema: public; Owner: savapage
--

COPY public.tbl_pos_purchase (pos_purchase_id, payment_comment, payment_type, receipt_num, total_cost) FROM stdin;
\.


--
-- Data for Name: tbl_pos_purchase_item; Type: TABLE DATA; Schema: public; Owner: savapage
--

COPY public.tbl_pos_purchase_item (pos_purchase_item_id, item_index, item_name, item_quantity, item_unit_cost, pos_purchase_id) FROM stdin;
\.


--
-- Data for Name: tbl_print_in; Type: TABLE DATA; Schema: public; Owner: savapage
--

COPY public.tbl_print_in (print_in_id, denied_reason, paper_height_mm, paper_size, paper_width_mm, printed, queue_id) FROM stdin;
\.


--
-- Data for Name: tbl_print_out; Type: TABLE DATA; Schema: public; Owner: savapage
--

COPY public.tbl_print_out (print_out_id, collate_copies, color_pages_estimated, color_pages_total, cups_completed_time, cups_creation_time, cups_job_id, cups_job_sheets, cups_job_state, cups_number_up, cups_page_set, duplex, grayscale, ipp_options, copies, total_esu, total_sheets, paper_height_mm, paper_size, paper_width_mm, print_mode, reverse_pages, printer_id) FROM stdin;
\.


--
-- Data for Name: tbl_printer; Type: TABLE DATA; Schema: public; Owner: savapage
--

COPY public.tbl_printer (printer_id, charge_type, color_detection_mode, created_by, created_date, default_cost, deleted, deleted_date, disabled, disabled_date, display_name, last_usage_date, location, modified_by, modified_date, notes, printer_name, reset_by, reset_date, server_name, total_bytes, total_esu, total_jobs, total_pages, total_sheets) FROM stdin;
\.


--
-- Data for Name: tbl_printer_attr; Type: TABLE DATA; Schema: public; Owner: savapage
--

COPY public.tbl_printer_attr (printer_attr_id, attrib_name, attrib_value, printer_id) FROM stdin;
\.


--
-- Data for Name: tbl_printer_group; Type: TABLE DATA; Schema: public; Owner: savapage
--

COPY public.tbl_printer_group (printer_group_id, created_by, created_date, display_name, group_name, modified_by, modified_date) FROM stdin;
\.


--
-- Data for Name: tbl_printer_group_member; Type: TABLE DATA; Schema: public; Owner: savapage
--

COPY public.tbl_printer_group_member (printer_group_member_id, created_by, created_date, modified_by, modified_date, printer_group_id, printer_id) FROM stdin;
\.


--
-- Data for Name: tbl_sequences; Type: TABLE DATA; Schema: public; Owner: savapage
--

COPY public.tbl_sequences (sequence_name, sequence_next_value) FROM stdin;
tbl_pos_purchase	0
tbl_account_trx	0
tbl_account	0
tbl_printer_group	0
tbl_user_group_member	0
tbl_printer	0
tbl_user_group_attr	0
tbl_user_email	0
tbl_printer_attr	0
tbl_doc_in_out	0
tbl_doc_out	0
tbl_pdf_out	0
tbl_user_number	0
tbl_pos_purchase_item	0
tbl_user	0
tbl_device	0
tbl_doc_log	0
tbl_cost_change	0
tbl_user_account	0
tbl_print_in	0
tbl_doc_in	0
tbl_ipp_queue_attr	0
tbl_print_out	0
tbl_account_attr	0
tbl_user_group_account	0
tbl_printer_group_member	0
tbl_user_attr	0
tbl_device_attr	0
tbl_account_voucher	0
tbl_user_card	0
tbl_pos_item	0
tbl_application_log	2
tbl_user_group	3
tbl_config	606
tbl_ipp_queue	7
\.


--
-- Data for Name: tbl_user; Type: TABLE DATA; Schema: public; Owner: savapage
--

COPY public.tbl_user (user_id, admin, created_by, created_date, deleted, deleted_date, department, disabled_pdf_out, disabled_pdf_out_until, disabled_print_in, disabled_print_in_until, disabled_print_out, disabled_print_out_until, external_user_name, full_name, internal, last_user_activity, modified_by, modified_date, total_pdf_out_bytes, total_pdf_out_jobs, total_pdf_out_pages, total_print_in_bytes, total_print_in_jobs, total_print_in_pages, total_print_out_bytes, total_print_out_esu, total_print_out_jobs, total_print_out_pages, total_print_out_sheets, office, person, reset_by, reset_date, user_name) FROM stdin;
\.


--
-- Data for Name: tbl_user_account; Type: TABLE DATA; Schema: public; Owner: savapage
--

COPY public.tbl_user_account (user_account_id, created_by, created_date, modified_by, modified_date, account_id, user_id) FROM stdin;
\.


--
-- Data for Name: tbl_user_attr; Type: TABLE DATA; Schema: public; Owner: savapage
--

COPY public.tbl_user_attr (user_attr_id, attrib_name, attrib_value, user_id) FROM stdin;
\.


--
-- Data for Name: tbl_user_card; Type: TABLE DATA; Schema: public; Owner: savapage
--

COPY public.tbl_user_card (user_card_id, index_number, card_name, card_number, user_id) FROM stdin;
\.


--
-- Data for Name: tbl_user_email; Type: TABLE DATA; Schema: public; Owner: savapage
--

COPY public.tbl_user_email (user_email_id, address, display_name, index_number, user_id) FROM stdin;
\.


--
-- Data for Name: tbl_user_group; Type: TABLE DATA; Schema: public; Owner: savapage
--

COPY public.tbl_user_group (user_group_id, allow_accum, created_by, created_date, full_name, group_name, initial_credit, initial_overdraft, initial_settings_enabled, initial_use_global_overdraft, initially_restricted, max_accum_balance, modified_by, modified_date, reset_statistics, schedule_amount, schedule_period) FROM stdin;
1	t	[system]	2026-02-04 16:41:07.179	\N	!!All Users!!	0.00	0.000000	t	t	f	0.00	\N	\N	f	0.00	NONE
2	t	[system]	2026-02-04 16:41:07.179	\N	!!External Users!!	0.00	0.000000	t	t	f	0.00	\N	\N	f	0.00	NONE
3	t	[system]	2026-02-04 16:41:07.179	\N	!!Internal Users!!	0.00	0.000000	t	t	f	0.00	\N	\N	f	0.00	NONE
\.


--
-- Data for Name: tbl_user_group_account; Type: TABLE DATA; Schema: public; Owner: savapage
--

COPY public.tbl_user_group_account (user_group_account_id, created_by, created_date, modified_by, modified_date, account_id, user_group_id) FROM stdin;
\.


--
-- Data for Name: tbl_user_group_attr; Type: TABLE DATA; Schema: public; Owner: savapage
--

COPY public.tbl_user_group_attr (user_group_attr_id, attrib_name, attrib_value, user_group_id) FROM stdin;
\.


--
-- Data for Name: tbl_user_group_member; Type: TABLE DATA; Schema: public; Owner: savapage
--

COPY public.tbl_user_group_member (user_group_member_id, created_by, created_date, modified_by, modified_date, user_group_id, user_id) FROM stdin;
\.


--
-- Data for Name: tbl_user_number; Type: TABLE DATA; Schema: public; Owner: savapage
--

COPY public.tbl_user_number (user_number_id, index_number, id_name, id_number, user_id) FROM stdin;
\.


--
-- Name: tbl_account_attr tbl_account_attr_pkey; Type: CONSTRAINT; Schema: public; Owner: savapage
--

ALTER TABLE ONLY public.tbl_account_attr
    ADD CONSTRAINT tbl_account_attr_pkey PRIMARY KEY (account_attr_id);


--
-- Name: tbl_account tbl_account_pkey; Type: CONSTRAINT; Schema: public; Owner: savapage
--

ALTER TABLE ONLY public.tbl_account
    ADD CONSTRAINT tbl_account_pkey PRIMARY KEY (account_id);


--
-- Name: tbl_account_trx tbl_account_trx_pkey; Type: CONSTRAINT; Schema: public; Owner: savapage
--

ALTER TABLE ONLY public.tbl_account_trx
    ADD CONSTRAINT tbl_account_trx_pkey PRIMARY KEY (account_trx_id);


--
-- Name: tbl_account_voucher tbl_account_voucher_pkey; Type: CONSTRAINT; Schema: public; Owner: savapage
--

ALTER TABLE ONLY public.tbl_account_voucher
    ADD CONSTRAINT tbl_account_voucher_pkey PRIMARY KEY (account_voucher_id);


--
-- Name: tbl_application_log tbl_application_log_pkey; Type: CONSTRAINT; Schema: public; Owner: savapage
--

ALTER TABLE ONLY public.tbl_application_log
    ADD CONSTRAINT tbl_application_log_pkey PRIMARY KEY (application_log_id);


--
-- Name: tbl_config tbl_config_pkey; Type: CONSTRAINT; Schema: public; Owner: savapage
--

ALTER TABLE ONLY public.tbl_config
    ADD CONSTRAINT tbl_config_pkey PRIMARY KEY (config_id);


--
-- Name: tbl_cost_change tbl_cost_change_pkey; Type: CONSTRAINT; Schema: public; Owner: savapage
--

ALTER TABLE ONLY public.tbl_cost_change
    ADD CONSTRAINT tbl_cost_change_pkey PRIMARY KEY (cost_change_id);


--
-- Name: tbl_device_attr tbl_device_attr_pkey; Type: CONSTRAINT; Schema: public; Owner: savapage
--

ALTER TABLE ONLY public.tbl_device_attr
    ADD CONSTRAINT tbl_device_attr_pkey PRIMARY KEY (device_attr_id);


--
-- Name: tbl_device tbl_device_pkey; Type: CONSTRAINT; Schema: public; Owner: savapage
--

ALTER TABLE ONLY public.tbl_device
    ADD CONSTRAINT tbl_device_pkey PRIMARY KEY (device_id);


--
-- Name: tbl_doc_in_out tbl_doc_in_out_pkey; Type: CONSTRAINT; Schema: public; Owner: savapage
--

ALTER TABLE ONLY public.tbl_doc_in_out
    ADD CONSTRAINT tbl_doc_in_out_pkey PRIMARY KEY (doc_in_out_id);


--
-- Name: tbl_doc_in tbl_doc_in_pkey; Type: CONSTRAINT; Schema: public; Owner: savapage
--

ALTER TABLE ONLY public.tbl_doc_in
    ADD CONSTRAINT tbl_doc_in_pkey PRIMARY KEY (doc_in_id);


--
-- Name: tbl_doc_log tbl_doc_log_pkey; Type: CONSTRAINT; Schema: public; Owner: savapage
--

ALTER TABLE ONLY public.tbl_doc_log
    ADD CONSTRAINT tbl_doc_log_pkey PRIMARY KEY (doc_id);


--
-- Name: tbl_doc_out tbl_doc_out_pkey; Type: CONSTRAINT; Schema: public; Owner: savapage
--

ALTER TABLE ONLY public.tbl_doc_out
    ADD CONSTRAINT tbl_doc_out_pkey PRIMARY KEY (doc_out_id);


--
-- Name: tbl_ipp_queue_attr tbl_ipp_queue_attr_pkey; Type: CONSTRAINT; Schema: public; Owner: savapage
--

ALTER TABLE ONLY public.tbl_ipp_queue_attr
    ADD CONSTRAINT tbl_ipp_queue_attr_pkey PRIMARY KEY (queue_attr_id);


--
-- Name: tbl_ipp_queue tbl_ipp_queue_pkey; Type: CONSTRAINT; Schema: public; Owner: savapage
--

ALTER TABLE ONLY public.tbl_ipp_queue
    ADD CONSTRAINT tbl_ipp_queue_pkey PRIMARY KEY (queue_id);


--
-- Name: tbl_pdf_out tbl_pdf_out_pkey; Type: CONSTRAINT; Schema: public; Owner: savapage
--

ALTER TABLE ONLY public.tbl_pdf_out
    ADD CONSTRAINT tbl_pdf_out_pkey PRIMARY KEY (pdf_out_id);


--
-- Name: tbl_pos_item tbl_pos_item_pkey; Type: CONSTRAINT; Schema: public; Owner: savapage
--

ALTER TABLE ONLY public.tbl_pos_item
    ADD CONSTRAINT tbl_pos_item_pkey PRIMARY KEY (pos_item_id);


--
-- Name: tbl_pos_purchase_item tbl_pos_purchase_item_pkey; Type: CONSTRAINT; Schema: public; Owner: savapage
--

ALTER TABLE ONLY public.tbl_pos_purchase_item
    ADD CONSTRAINT tbl_pos_purchase_item_pkey PRIMARY KEY (pos_purchase_item_id);


--
-- Name: tbl_pos_purchase tbl_pos_purchase_pkey; Type: CONSTRAINT; Schema: public; Owner: savapage
--

ALTER TABLE ONLY public.tbl_pos_purchase
    ADD CONSTRAINT tbl_pos_purchase_pkey PRIMARY KEY (pos_purchase_id);


--
-- Name: tbl_print_in tbl_print_in_pkey; Type: CONSTRAINT; Schema: public; Owner: savapage
--

ALTER TABLE ONLY public.tbl_print_in
    ADD CONSTRAINT tbl_print_in_pkey PRIMARY KEY (print_in_id);


--
-- Name: tbl_print_out tbl_print_out_pkey; Type: CONSTRAINT; Schema: public; Owner: savapage
--

ALTER TABLE ONLY public.tbl_print_out
    ADD CONSTRAINT tbl_print_out_pkey PRIMARY KEY (print_out_id);


--
-- Name: tbl_printer_attr tbl_printer_attr_pkey; Type: CONSTRAINT; Schema: public; Owner: savapage
--

ALTER TABLE ONLY public.tbl_printer_attr
    ADD CONSTRAINT tbl_printer_attr_pkey PRIMARY KEY (printer_attr_id);


--
-- Name: tbl_printer_group_member tbl_printer_group_member_pkey; Type: CONSTRAINT; Schema: public; Owner: savapage
--

ALTER TABLE ONLY public.tbl_printer_group_member
    ADD CONSTRAINT tbl_printer_group_member_pkey PRIMARY KEY (printer_group_member_id);


--
-- Name: tbl_printer_group tbl_printer_group_pkey; Type: CONSTRAINT; Schema: public; Owner: savapage
--

ALTER TABLE ONLY public.tbl_printer_group
    ADD CONSTRAINT tbl_printer_group_pkey PRIMARY KEY (printer_group_id);


--
-- Name: tbl_printer tbl_printer_pkey; Type: CONSTRAINT; Schema: public; Owner: savapage
--

ALTER TABLE ONLY public.tbl_printer
    ADD CONSTRAINT tbl_printer_pkey PRIMARY KEY (printer_id);


--
-- Name: tbl_sequences tbl_sequences_pkey; Type: CONSTRAINT; Schema: public; Owner: savapage
--

ALTER TABLE ONLY public.tbl_sequences
    ADD CONSTRAINT tbl_sequences_pkey PRIMARY KEY (sequence_name);


--
-- Name: tbl_user_account tbl_user_account_pkey; Type: CONSTRAINT; Schema: public; Owner: savapage
--

ALTER TABLE ONLY public.tbl_user_account
    ADD CONSTRAINT tbl_user_account_pkey PRIMARY KEY (user_account_id);


--
-- Name: tbl_user_attr tbl_user_attr_pkey; Type: CONSTRAINT; Schema: public; Owner: savapage
--

ALTER TABLE ONLY public.tbl_user_attr
    ADD CONSTRAINT tbl_user_attr_pkey PRIMARY KEY (user_attr_id);


--
-- Name: tbl_user_card tbl_user_card_pkey; Type: CONSTRAINT; Schema: public; Owner: savapage
--

ALTER TABLE ONLY public.tbl_user_card
    ADD CONSTRAINT tbl_user_card_pkey PRIMARY KEY (user_card_id);


--
-- Name: tbl_user_email tbl_user_email_pkey; Type: CONSTRAINT; Schema: public; Owner: savapage
--

ALTER TABLE ONLY public.tbl_user_email
    ADD CONSTRAINT tbl_user_email_pkey PRIMARY KEY (user_email_id);


--
-- Name: tbl_user_group_account tbl_user_group_account_pkey; Type: CONSTRAINT; Schema: public; Owner: savapage
--

ALTER TABLE ONLY public.tbl_user_group_account
    ADD CONSTRAINT tbl_user_group_account_pkey PRIMARY KEY (user_group_account_id);


--
-- Name: tbl_user_group_attr tbl_user_group_attr_pkey; Type: CONSTRAINT; Schema: public; Owner: savapage
--

ALTER TABLE ONLY public.tbl_user_group_attr
    ADD CONSTRAINT tbl_user_group_attr_pkey PRIMARY KEY (user_group_attr_id);


--
-- Name: tbl_user_group_member tbl_user_group_member_pkey; Type: CONSTRAINT; Schema: public; Owner: savapage
--

ALTER TABLE ONLY public.tbl_user_group_member
    ADD CONSTRAINT tbl_user_group_member_pkey PRIMARY KEY (user_group_member_id);


--
-- Name: tbl_user_group tbl_user_group_pkey; Type: CONSTRAINT; Schema: public; Owner: savapage
--

ALTER TABLE ONLY public.tbl_user_group
    ADD CONSTRAINT tbl_user_group_pkey PRIMARY KEY (user_group_id);


--
-- Name: tbl_user_number tbl_user_number_pkey; Type: CONSTRAINT; Schema: public; Owner: savapage
--

ALTER TABLE ONLY public.tbl_user_number
    ADD CONSTRAINT tbl_user_number_pkey PRIMARY KEY (user_number_id);


--
-- Name: tbl_user tbl_user_pkey; Type: CONSTRAINT; Schema: public; Owner: savapage
--

ALTER TABLE ONLY public.tbl_user
    ADD CONSTRAINT tbl_user_pkey PRIMARY KEY (user_id);


--
-- Name: tbl_account_attr uc_account_attr_1; Type: CONSTRAINT; Schema: public; Owner: savapage
--

ALTER TABLE ONLY public.tbl_account_attr
    ADD CONSTRAINT uc_account_attr_1 UNIQUE (account_id, attrib_name);


--
-- Name: tbl_account_voucher uc_account_voucher_1; Type: CONSTRAINT; Schema: public; Owner: savapage
--

ALTER TABLE ONLY public.tbl_account_voucher
    ADD CONSTRAINT uc_account_voucher_1 UNIQUE (uuid);


--
-- Name: tbl_account_voucher uc_account_voucher_2; Type: CONSTRAINT; Schema: public; Owner: savapage
--

ALTER TABLE ONLY public.tbl_account_voucher
    ADD CONSTRAINT uc_account_voucher_2 UNIQUE (card_number);


--
-- Name: tbl_config uc_config_1; Type: CONSTRAINT; Schema: public; Owner: savapage
--

ALTER TABLE ONLY public.tbl_config
    ADD CONSTRAINT uc_config_1 UNIQUE (property_name);


--
-- Name: tbl_device uc_device_1; Type: CONSTRAINT; Schema: public; Owner: savapage
--

ALTER TABLE ONLY public.tbl_device
    ADD CONSTRAINT uc_device_1 UNIQUE (device_name);


--
-- Name: tbl_device uc_device_2; Type: CONSTRAINT; Schema: public; Owner: savapage
--

ALTER TABLE ONLY public.tbl_device
    ADD CONSTRAINT uc_device_2 UNIQUE (hostname, device_type);


--
-- Name: tbl_device_attr uc_device_attr_1; Type: CONSTRAINT; Schema: public; Owner: savapage
--

ALTER TABLE ONLY public.tbl_device_attr
    ADD CONSTRAINT uc_device_attr_1 UNIQUE (device_id, attrib_name);


--
-- Name: tbl_ipp_queue uc_ipp_queue_1; Type: CONSTRAINT; Schema: public; Owner: savapage
--

ALTER TABLE ONLY public.tbl_ipp_queue
    ADD CONSTRAINT uc_ipp_queue_1 UNIQUE (url_path);


--
-- Name: tbl_pos_item uc_pos_item_1; Type: CONSTRAINT; Schema: public; Owner: savapage
--

ALTER TABLE ONLY public.tbl_pos_item
    ADD CONSTRAINT uc_pos_item_1 UNIQUE (item_name);


--
-- Name: tbl_pos_purchase uc_pos_purchase_1; Type: CONSTRAINT; Schema: public; Owner: savapage
--

ALTER TABLE ONLY public.tbl_pos_purchase
    ADD CONSTRAINT uc_pos_purchase_1 UNIQUE (receipt_num);


--
-- Name: tbl_printer uc_printer_1; Type: CONSTRAINT; Schema: public; Owner: savapage
--

ALTER TABLE ONLY public.tbl_printer
    ADD CONSTRAINT uc_printer_1 UNIQUE (printer_name);


--
-- Name: tbl_printer_attr uc_printer_attr_1; Type: CONSTRAINT; Schema: public; Owner: savapage
--

ALTER TABLE ONLY public.tbl_printer_attr
    ADD CONSTRAINT uc_printer_attr_1 UNIQUE (printer_id, attrib_name);


--
-- Name: tbl_printer_group uc_printer_group_1; Type: CONSTRAINT; Schema: public; Owner: savapage
--

ALTER TABLE ONLY public.tbl_printer_group
    ADD CONSTRAINT uc_printer_group_1 UNIQUE (group_name);


--
-- Name: tbl_printer_group uc_printer_group_2; Type: CONSTRAINT; Schema: public; Owner: savapage
--

ALTER TABLE ONLY public.tbl_printer_group
    ADD CONSTRAINT uc_printer_group_2 UNIQUE (display_name);


--
-- Name: tbl_ipp_queue_attr uc_queue_attr_1; Type: CONSTRAINT; Schema: public; Owner: savapage
--

ALTER TABLE ONLY public.tbl_ipp_queue_attr
    ADD CONSTRAINT uc_queue_attr_1 UNIQUE (queue_id, attrib_name);


--
-- Name: tbl_user_attr uc_user_attr_1; Type: CONSTRAINT; Schema: public; Owner: savapage
--

ALTER TABLE ONLY public.tbl_user_attr
    ADD CONSTRAINT uc_user_attr_1 UNIQUE (user_id, attrib_name);


--
-- Name: tbl_user_card uc_user_card_1; Type: CONSTRAINT; Schema: public; Owner: savapage
--

ALTER TABLE ONLY public.tbl_user_card
    ADD CONSTRAINT uc_user_card_1 UNIQUE (card_number);


--
-- Name: tbl_user_card uc_user_card_2; Type: CONSTRAINT; Schema: public; Owner: savapage
--

ALTER TABLE ONLY public.tbl_user_card
    ADD CONSTRAINT uc_user_card_2 UNIQUE (user_id, index_number);


--
-- Name: tbl_user_email uc_user_email_1; Type: CONSTRAINT; Schema: public; Owner: savapage
--

ALTER TABLE ONLY public.tbl_user_email
    ADD CONSTRAINT uc_user_email_1 UNIQUE (address);


--
-- Name: tbl_user_email uc_user_email_2; Type: CONSTRAINT; Schema: public; Owner: savapage
--

ALTER TABLE ONLY public.tbl_user_email
    ADD CONSTRAINT uc_user_email_2 UNIQUE (user_id, index_number);


--
-- Name: tbl_user_group uc_user_group_1; Type: CONSTRAINT; Schema: public; Owner: savapage
--

ALTER TABLE ONLY public.tbl_user_group
    ADD CONSTRAINT uc_user_group_1 UNIQUE (group_name);


--
-- Name: tbl_user_group_attr uc_user_group_attr_1; Type: CONSTRAINT; Schema: public; Owner: savapage
--

ALTER TABLE ONLY public.tbl_user_group_attr
    ADD CONSTRAINT uc_user_group_attr_1 UNIQUE (user_group_id, attrib_name);


--
-- Name: tbl_user_number uc_user_number_1; Type: CONSTRAINT; Schema: public; Owner: savapage
--

ALTER TABLE ONLY public.tbl_user_number
    ADD CONSTRAINT uc_user_number_1 UNIQUE (id_number);


--
-- Name: tbl_user_number uc_user_number_2; Type: CONSTRAINT; Schema: public; Owner: savapage
--

ALTER TABLE ONLY public.tbl_user_number
    ADD CONSTRAINT uc_user_number_2 UNIQUE (user_id, index_number);


--
-- Name: ix_account_1; Type: INDEX; Schema: public; Owner: savapage
--

CREATE INDEX ix_account_1 ON public.tbl_account USING btree (pin, sub_pin);


--
-- Name: ix_account_2; Type: INDEX; Schema: public; Owner: savapage
--

CREATE INDEX ix_account_2 ON public.tbl_account USING btree (parent_id);


--
-- Name: ix_account_3; Type: INDEX; Schema: public; Owner: savapage
--

CREATE INDEX ix_account_3 ON public.tbl_account USING btree (account_type, account_name_lower, sub_name_lower);


--
-- Name: ix_account_attr_1; Type: INDEX; Schema: public; Owner: savapage
--

CREATE INDEX ix_account_attr_1 ON public.tbl_account_attr USING btree (account_id);


--
-- Name: ix_account_trx_1; Type: INDEX; Schema: public; Owner: savapage
--

CREATE INDEX ix_account_trx_1 ON public.tbl_account_trx USING btree (account_id);


--
-- Name: ix_account_trx_2; Type: INDEX; Schema: public; Owner: savapage
--

CREATE INDEX ix_account_trx_2 ON public.tbl_account_trx USING btree (doc_id);


--
-- Name: ix_account_trx_3; Type: INDEX; Schema: public; Owner: savapage
--

CREATE INDEX ix_account_trx_3 ON public.tbl_account_trx USING btree (trx_date);


--
-- Name: ix_account_trx_4; Type: INDEX; Schema: public; Owner: savapage
--

CREATE INDEX ix_account_trx_4 ON public.tbl_account_trx USING btree (account_voucher_id);


--
-- Name: ix_account_trx_5; Type: INDEX; Schema: public; Owner: savapage
--

CREATE INDEX ix_account_trx_5 ON public.tbl_account_trx USING btree (ext_id);


--
-- Name: ix_account_trx_6; Type: INDEX; Schema: public; Owner: savapage
--

CREATE INDEX ix_account_trx_6 ON public.tbl_account_trx USING btree (pos_purchase_id);


--
-- Name: ix_account_trx_7; Type: INDEX; Schema: public; Owner: savapage
--

CREATE INDEX ix_account_trx_7 ON public.tbl_account_trx USING btree (cost_change_id);


--
-- Name: ix_account_voucher_1; Type: INDEX; Schema: public; Owner: savapage
--

CREATE INDEX ix_account_voucher_1 ON public.tbl_account_voucher USING btree (card_number_batch);


--
-- Name: ix_account_voucher_2; Type: INDEX; Schema: public; Owner: savapage
--

CREATE INDEX ix_account_voucher_2 ON public.tbl_account_voucher USING btree (trx_merchant_code, trx_ref_merchant);


--
-- Name: ix_account_voucher_3; Type: INDEX; Schema: public; Owner: savapage
--

CREATE INDEX ix_account_voucher_3 ON public.tbl_account_voucher USING btree (trx_acquirer_code, trx_ref_acquirer);


--
-- Name: ix_application_log_1; Type: INDEX; Schema: public; Owner: savapage
--

CREATE INDEX ix_application_log_1 ON public.tbl_application_log USING btree (log_date);


--
-- Name: ix_config_1; Type: INDEX; Schema: public; Owner: savapage
--

CREATE INDEX ix_config_1 ON public.tbl_config USING btree (modified_by, modified_date);


--
-- Name: ix_cost_change_1; Type: INDEX; Schema: public; Owner: savapage
--

CREATE INDEX ix_cost_change_1 ON public.tbl_cost_change USING btree (req_date);


--
-- Name: ix_cost_change_2; Type: INDEX; Schema: public; Owner: savapage
--

CREATE INDEX ix_cost_change_2 ON public.tbl_cost_change USING btree (chg_type);


--
-- Name: ix_cost_change_3; Type: INDEX; Schema: public; Owner: savapage
--

CREATE INDEX ix_cost_change_3 ON public.tbl_cost_change USING btree (chg_status);


--
-- Name: ix_cost_change_4; Type: INDEX; Schema: public; Owner: savapage
--

CREATE INDEX ix_cost_change_4 ON public.tbl_cost_change USING btree (chg_date);


--
-- Name: ix_cost_change_5; Type: INDEX; Schema: public; Owner: savapage
--

CREATE INDEX ix_cost_change_5 ON public.tbl_cost_change USING btree (chg_by);


--
-- Name: ix_cost_change_6; Type: INDEX; Schema: public; Owner: savapage
--

CREATE INDEX ix_cost_change_6 ON public.tbl_cost_change USING btree (doc_id);


--
-- Name: ix_cost_change_7; Type: INDEX; Schema: public; Owner: savapage
--

CREATE INDEX ix_cost_change_7 ON public.tbl_cost_change USING btree (req_user_id);


--
-- Name: ix_device_1; Type: INDEX; Schema: public; Owner: savapage
--

CREATE INDEX ix_device_1 ON public.tbl_device USING btree (card_reader_id);


--
-- Name: ix_device_2; Type: INDEX; Schema: public; Owner: savapage
--

CREATE INDEX ix_device_2 ON public.tbl_device USING btree (printer_id);


--
-- Name: ix_device_3; Type: INDEX; Schema: public; Owner: savapage
--

CREATE INDEX ix_device_3 ON public.tbl_device USING btree (printer_group_id);


--
-- Name: ix_device_attr_1; Type: INDEX; Schema: public; Owner: savapage
--

CREATE INDEX ix_device_attr_1 ON public.tbl_device_attr USING btree (device_id);


--
-- Name: ix_doc_in_1; Type: INDEX; Schema: public; Owner: savapage
--

CREATE INDEX ix_doc_in_1 ON public.tbl_doc_in USING btree (print_in_id);


--
-- Name: ix_doc_in_out_1; Type: INDEX; Schema: public; Owner: savapage
--

CREATE INDEX ix_doc_in_out_1 ON public.tbl_doc_in_out USING btree (doc_in_id);


--
-- Name: ix_doc_in_out_2; Type: INDEX; Schema: public; Owner: savapage
--

CREATE INDEX ix_doc_in_out_2 ON public.tbl_doc_in_out USING btree (doc_out_id);


--
-- Name: ix_doc_log_1; Type: INDEX; Schema: public; Owner: savapage
--

CREATE INDEX ix_doc_log_1 ON public.tbl_doc_log USING btree (user_id, uuid);


--
-- Name: ix_doc_log_2; Type: INDEX; Schema: public; Owner: savapage
--

CREATE INDEX ix_doc_log_2 ON public.tbl_doc_log USING btree (ext_supplier, ext_status);


--
-- Name: ix_doc_log_3; Type: INDEX; Schema: public; Owner: savapage
--

CREATE INDEX ix_doc_log_3 ON public.tbl_doc_log USING btree (created_day);


--
-- Name: ix_doc_log_4; Type: INDEX; Schema: public; Owner: savapage
--

CREATE INDEX ix_doc_log_4 ON public.tbl_doc_log USING btree (user_id);


--
-- Name: ix_doc_log_5; Type: INDEX; Schema: public; Owner: savapage
--

CREATE INDEX ix_doc_log_5 ON public.tbl_doc_log USING btree (doc_in_id);


--
-- Name: ix_doc_log_6; Type: INDEX; Schema: public; Owner: savapage
--

CREATE INDEX ix_doc_log_6 ON public.tbl_doc_log USING btree (doc_out_id);


--
-- Name: ix_doc_log_7; Type: INDEX; Schema: public; Owner: savapage
--

CREATE INDEX ix_doc_log_7 ON public.tbl_doc_log USING btree (ext_supplier, ext_id);


--
-- Name: ix_doc_log_8; Type: INDEX; Schema: public; Owner: savapage
--

CREATE INDEX ix_doc_log_8 ON public.tbl_doc_log USING btree (ext_id);


--
-- Name: ix_doc_out_1; Type: INDEX; Schema: public; Owner: savapage
--

CREATE INDEX ix_doc_out_1 ON public.tbl_doc_out USING btree (print_out_id);


--
-- Name: ix_doc_out_2; Type: INDEX; Schema: public; Owner: savapage
--

CREATE INDEX ix_doc_out_2 ON public.tbl_doc_out USING btree (pdf_out_id);


--
-- Name: ix_pos_purchase_item_1; Type: INDEX; Schema: public; Owner: savapage
--

CREATE INDEX ix_pos_purchase_item_1 ON public.tbl_pos_purchase_item USING btree (pos_purchase_id);


--
-- Name: ix_print_in_1; Type: INDEX; Schema: public; Owner: savapage
--

CREATE INDEX ix_print_in_1 ON public.tbl_print_in USING btree (queue_id);


--
-- Name: ix_print_out_1; Type: INDEX; Schema: public; Owner: savapage
--

CREATE INDEX ix_print_out_1 ON public.tbl_print_out USING btree (cups_job_id);


--
-- Name: ix_print_out_2; Type: INDEX; Schema: public; Owner: savapage
--

CREATE INDEX ix_print_out_2 ON public.tbl_print_out USING btree (cups_job_state);


--
-- Name: ix_print_out_3; Type: INDEX; Schema: public; Owner: savapage
--

CREATE INDEX ix_print_out_3 ON public.tbl_print_out USING btree (printer_id);


--
-- Name: ix_printer_attr_1; Type: INDEX; Schema: public; Owner: savapage
--

CREATE INDEX ix_printer_attr_1 ON public.tbl_printer_attr USING btree (printer_id);


--
-- Name: ix_printer_group_member_1; Type: INDEX; Schema: public; Owner: savapage
--

CREATE INDEX ix_printer_group_member_1 ON public.tbl_printer_group_member USING btree (printer_id);


--
-- Name: ix_printer_group_member_2; Type: INDEX; Schema: public; Owner: savapage
--

CREATE INDEX ix_printer_group_member_2 ON public.tbl_printer_group_member USING btree (printer_group_id);


--
-- Name: ix_queue_attr_1; Type: INDEX; Schema: public; Owner: savapage
--

CREATE INDEX ix_queue_attr_1 ON public.tbl_ipp_queue_attr USING btree (queue_id);


--
-- Name: ix_user_1; Type: INDEX; Schema: public; Owner: savapage
--

CREATE INDEX ix_user_1 ON public.tbl_user USING btree (user_name);


--
-- Name: ix_user_2; Type: INDEX; Schema: public; Owner: savapage
--

CREATE INDEX ix_user_2 ON public.tbl_user USING btree (full_name);


--
-- Name: ix_user_account_1; Type: INDEX; Schema: public; Owner: savapage
--

CREATE INDEX ix_user_account_1 ON public.tbl_user_account USING btree (user_id);


--
-- Name: ix_user_account_2; Type: INDEX; Schema: public; Owner: savapage
--

CREATE INDEX ix_user_account_2 ON public.tbl_user_account USING btree (account_id);


--
-- Name: ix_user_attr_1; Type: INDEX; Schema: public; Owner: savapage
--

CREATE INDEX ix_user_attr_1 ON public.tbl_user_attr USING btree (user_id);


--
-- Name: ix_user_card_1; Type: INDEX; Schema: public; Owner: savapage
--

CREATE INDEX ix_user_card_1 ON public.tbl_user_card USING btree (user_id, card_number);


--
-- Name: ix_user_card_2; Type: INDEX; Schema: public; Owner: savapage
--

CREATE INDEX ix_user_card_2 ON public.tbl_user_card USING btree (user_id);


--
-- Name: ix_user_email_1; Type: INDEX; Schema: public; Owner: savapage
--

CREATE INDEX ix_user_email_1 ON public.tbl_user_email USING btree (user_id, address);


--
-- Name: ix_user_email_2; Type: INDEX; Schema: public; Owner: savapage
--

CREATE INDEX ix_user_email_2 ON public.tbl_user_email USING btree (user_id);


--
-- Name: ix_user_group_1; Type: INDEX; Schema: public; Owner: savapage
--

CREATE INDEX ix_user_group_1 ON public.tbl_user_group USING btree (full_name);


--
-- Name: ix_user_group_account_1; Type: INDEX; Schema: public; Owner: savapage
--

CREATE INDEX ix_user_group_account_1 ON public.tbl_user_group_account USING btree (user_group_id);


--
-- Name: ix_user_group_account_2; Type: INDEX; Schema: public; Owner: savapage
--

CREATE INDEX ix_user_group_account_2 ON public.tbl_user_group_account USING btree (account_id);


--
-- Name: ix_user_group_attr_1; Type: INDEX; Schema: public; Owner: savapage
--

CREATE INDEX ix_user_group_attr_1 ON public.tbl_user_group_attr USING btree (user_group_id);


--
-- Name: ix_user_group_member_1; Type: INDEX; Schema: public; Owner: savapage
--

CREATE INDEX ix_user_group_member_1 ON public.tbl_user_group_member USING btree (user_id);


--
-- Name: ix_user_group_member_2; Type: INDEX; Schema: public; Owner: savapage
--

CREATE INDEX ix_user_group_member_2 ON public.tbl_user_group_member USING btree (user_group_id);


--
-- Name: ix_user_number_1; Type: INDEX; Schema: public; Owner: savapage
--

CREATE INDEX ix_user_number_1 ON public.tbl_user_number USING btree (user_id, id_number);


--
-- Name: ix_user_number_2; Type: INDEX; Schema: public; Owner: savapage
--

CREATE INDEX ix_user_number_2 ON public.tbl_user_number USING btree (user_id);


--
-- Name: tbl_account_attr fk_account_attr_to_account; Type: FK CONSTRAINT; Schema: public; Owner: savapage
--

ALTER TABLE ONLY public.tbl_account_attr
    ADD CONSTRAINT fk_account_attr_to_account FOREIGN KEY (account_id) REFERENCES public.tbl_account(account_id);


--
-- Name: tbl_account fk_account_to_parent; Type: FK CONSTRAINT; Schema: public; Owner: savapage
--

ALTER TABLE ONLY public.tbl_account
    ADD CONSTRAINT fk_account_to_parent FOREIGN KEY (parent_id) REFERENCES public.tbl_account(account_id);


--
-- Name: tbl_account_trx fk_account_trx_to_account; Type: FK CONSTRAINT; Schema: public; Owner: savapage
--

ALTER TABLE ONLY public.tbl_account_trx
    ADD CONSTRAINT fk_account_trx_to_account FOREIGN KEY (account_id) REFERENCES public.tbl_account(account_id);


--
-- Name: tbl_account_trx fk_account_trx_to_account_voucher; Type: FK CONSTRAINT; Schema: public; Owner: savapage
--

ALTER TABLE ONLY public.tbl_account_trx
    ADD CONSTRAINT fk_account_trx_to_account_voucher FOREIGN KEY (account_voucher_id) REFERENCES public.tbl_account_voucher(account_voucher_id);


--
-- Name: tbl_account_trx fk_account_trx_to_cost_change; Type: FK CONSTRAINT; Schema: public; Owner: savapage
--

ALTER TABLE ONLY public.tbl_account_trx
    ADD CONSTRAINT fk_account_trx_to_cost_change FOREIGN KEY (cost_change_id) REFERENCES public.tbl_cost_change(cost_change_id);


--
-- Name: tbl_account_trx fk_account_trx_to_doclog; Type: FK CONSTRAINT; Schema: public; Owner: savapage
--

ALTER TABLE ONLY public.tbl_account_trx
    ADD CONSTRAINT fk_account_trx_to_doclog FOREIGN KEY (doc_id) REFERENCES public.tbl_doc_log(doc_id);


--
-- Name: tbl_account_trx fk_account_trx_to_pos_purchase; Type: FK CONSTRAINT; Schema: public; Owner: savapage
--

ALTER TABLE ONLY public.tbl_account_trx
    ADD CONSTRAINT fk_account_trx_to_pos_purchase FOREIGN KEY (pos_purchase_id) REFERENCES public.tbl_pos_purchase(pos_purchase_id);


--
-- Name: tbl_cost_change fk_cost_change_to_doclog; Type: FK CONSTRAINT; Schema: public; Owner: savapage
--

ALTER TABLE ONLY public.tbl_cost_change
    ADD CONSTRAINT fk_cost_change_to_doclog FOREIGN KEY (doc_id) REFERENCES public.tbl_doc_log(doc_id);


--
-- Name: tbl_cost_change fk_cost_change_to_user; Type: FK CONSTRAINT; Schema: public; Owner: savapage
--

ALTER TABLE ONLY public.tbl_cost_change
    ADD CONSTRAINT fk_cost_change_to_user FOREIGN KEY (req_user_id) REFERENCES public.tbl_user(user_id);


--
-- Name: tbl_device_attr fk_device_attr_to_device; Type: FK CONSTRAINT; Schema: public; Owner: savapage
--

ALTER TABLE ONLY public.tbl_device_attr
    ADD CONSTRAINT fk_device_attr_to_device FOREIGN KEY (device_id) REFERENCES public.tbl_device(device_id);


--
-- Name: tbl_device fk_device_terminal_to_card_reader; Type: FK CONSTRAINT; Schema: public; Owner: savapage
--

ALTER TABLE ONLY public.tbl_device
    ADD CONSTRAINT fk_device_terminal_to_card_reader FOREIGN KEY (card_reader_id) REFERENCES public.tbl_device(device_id);


--
-- Name: tbl_device fk_device_to_printer; Type: FK CONSTRAINT; Schema: public; Owner: savapage
--

ALTER TABLE ONLY public.tbl_device
    ADD CONSTRAINT fk_device_to_printer FOREIGN KEY (printer_id) REFERENCES public.tbl_printer(printer_id);


--
-- Name: tbl_device fk_device_to_printer_group; Type: FK CONSTRAINT; Schema: public; Owner: savapage
--

ALTER TABLE ONLY public.tbl_device
    ADD CONSTRAINT fk_device_to_printer_group FOREIGN KEY (printer_group_id) REFERENCES public.tbl_printer_group(printer_group_id);


--
-- Name: tbl_doc_in_out fk_doc_in_out_to_doc_in; Type: FK CONSTRAINT; Schema: public; Owner: savapage
--

ALTER TABLE ONLY public.tbl_doc_in_out
    ADD CONSTRAINT fk_doc_in_out_to_doc_in FOREIGN KEY (doc_in_id) REFERENCES public.tbl_doc_in(doc_in_id);


--
-- Name: tbl_doc_in_out fk_doc_in_out_to_doc_out; Type: FK CONSTRAINT; Schema: public; Owner: savapage
--

ALTER TABLE ONLY public.tbl_doc_in_out
    ADD CONSTRAINT fk_doc_in_out_to_doc_out FOREIGN KEY (doc_out_id) REFERENCES public.tbl_doc_out(doc_out_id);


--
-- Name: tbl_doc_in fk_doc_in_to_print_in; Type: FK CONSTRAINT; Schema: public; Owner: savapage
--

ALTER TABLE ONLY public.tbl_doc_in
    ADD CONSTRAINT fk_doc_in_to_print_in FOREIGN KEY (print_in_id) REFERENCES public.tbl_print_in(print_in_id);


--
-- Name: tbl_doc_log fk_doc_log_to_doc_in; Type: FK CONSTRAINT; Schema: public; Owner: savapage
--

ALTER TABLE ONLY public.tbl_doc_log
    ADD CONSTRAINT fk_doc_log_to_doc_in FOREIGN KEY (doc_in_id) REFERENCES public.tbl_doc_in(doc_in_id);


--
-- Name: tbl_doc_log fk_doc_log_to_doc_out; Type: FK CONSTRAINT; Schema: public; Owner: savapage
--

ALTER TABLE ONLY public.tbl_doc_log
    ADD CONSTRAINT fk_doc_log_to_doc_out FOREIGN KEY (doc_out_id) REFERENCES public.tbl_doc_out(doc_out_id);


--
-- Name: tbl_doc_log fk_doc_log_to_user; Type: FK CONSTRAINT; Schema: public; Owner: savapage
--

ALTER TABLE ONLY public.tbl_doc_log
    ADD CONSTRAINT fk_doc_log_to_user FOREIGN KEY (user_id) REFERENCES public.tbl_user(user_id);


--
-- Name: tbl_doc_out fk_doc_out_to_pdf_out; Type: FK CONSTRAINT; Schema: public; Owner: savapage
--

ALTER TABLE ONLY public.tbl_doc_out
    ADD CONSTRAINT fk_doc_out_to_pdf_out FOREIGN KEY (pdf_out_id) REFERENCES public.tbl_pdf_out(pdf_out_id);


--
-- Name: tbl_doc_out fk_doc_out_to_print_out; Type: FK CONSTRAINT; Schema: public; Owner: savapage
--

ALTER TABLE ONLY public.tbl_doc_out
    ADD CONSTRAINT fk_doc_out_to_print_out FOREIGN KEY (print_out_id) REFERENCES public.tbl_print_out(print_out_id);


--
-- Name: tbl_ipp_queue_attr fk_ipp_queue_attr_to_ipp_queue; Type: FK CONSTRAINT; Schema: public; Owner: savapage
--

ALTER TABLE ONLY public.tbl_ipp_queue_attr
    ADD CONSTRAINT fk_ipp_queue_attr_to_ipp_queue FOREIGN KEY (queue_id) REFERENCES public.tbl_ipp_queue(queue_id);


--
-- Name: tbl_pos_purchase_item fk_pos_purchase_item_to_pos_purchase; Type: FK CONSTRAINT; Schema: public; Owner: savapage
--

ALTER TABLE ONLY public.tbl_pos_purchase_item
    ADD CONSTRAINT fk_pos_purchase_item_to_pos_purchase FOREIGN KEY (pos_purchase_id) REFERENCES public.tbl_pos_purchase(pos_purchase_id);


--
-- Name: tbl_print_in fk_print_in_to_ipp_queue; Type: FK CONSTRAINT; Schema: public; Owner: savapage
--

ALTER TABLE ONLY public.tbl_print_in
    ADD CONSTRAINT fk_print_in_to_ipp_queue FOREIGN KEY (queue_id) REFERENCES public.tbl_ipp_queue(queue_id);


--
-- Name: tbl_print_out fk_print_out_to_printer; Type: FK CONSTRAINT; Schema: public; Owner: savapage
--

ALTER TABLE ONLY public.tbl_print_out
    ADD CONSTRAINT fk_print_out_to_printer FOREIGN KEY (printer_id) REFERENCES public.tbl_printer(printer_id);


--
-- Name: tbl_printer_attr fk_printer_attr_to_printer; Type: FK CONSTRAINT; Schema: public; Owner: savapage
--

ALTER TABLE ONLY public.tbl_printer_attr
    ADD CONSTRAINT fk_printer_attr_to_printer FOREIGN KEY (printer_id) REFERENCES public.tbl_printer(printer_id);


--
-- Name: tbl_printer_group_member fk_printer_group_member_to_printer; Type: FK CONSTRAINT; Schema: public; Owner: savapage
--

ALTER TABLE ONLY public.tbl_printer_group_member
    ADD CONSTRAINT fk_printer_group_member_to_printer FOREIGN KEY (printer_id) REFERENCES public.tbl_printer(printer_id);


--
-- Name: tbl_printer_group_member fk_printer_group_member_to_printer_group; Type: FK CONSTRAINT; Schema: public; Owner: savapage
--

ALTER TABLE ONLY public.tbl_printer_group_member
    ADD CONSTRAINT fk_printer_group_member_to_printer_group FOREIGN KEY (printer_group_id) REFERENCES public.tbl_printer_group(printer_group_id);


--
-- Name: tbl_user_account fk_user_account_to_account; Type: FK CONSTRAINT; Schema: public; Owner: savapage
--

ALTER TABLE ONLY public.tbl_user_account
    ADD CONSTRAINT fk_user_account_to_account FOREIGN KEY (account_id) REFERENCES public.tbl_account(account_id);


--
-- Name: tbl_user_account fk_user_account_to_user; Type: FK CONSTRAINT; Schema: public; Owner: savapage
--

ALTER TABLE ONLY public.tbl_user_account
    ADD CONSTRAINT fk_user_account_to_user FOREIGN KEY (user_id) REFERENCES public.tbl_user(user_id);


--
-- Name: tbl_user_attr fk_user_attr_to_user; Type: FK CONSTRAINT; Schema: public; Owner: savapage
--

ALTER TABLE ONLY public.tbl_user_attr
    ADD CONSTRAINT fk_user_attr_to_user FOREIGN KEY (user_id) REFERENCES public.tbl_user(user_id);


--
-- Name: tbl_user_card fk_user_card_to_user; Type: FK CONSTRAINT; Schema: public; Owner: savapage
--

ALTER TABLE ONLY public.tbl_user_card
    ADD CONSTRAINT fk_user_card_to_user FOREIGN KEY (user_id) REFERENCES public.tbl_user(user_id);


--
-- Name: tbl_user_email fk_user_email_to_user; Type: FK CONSTRAINT; Schema: public; Owner: savapage
--

ALTER TABLE ONLY public.tbl_user_email
    ADD CONSTRAINT fk_user_email_to_user FOREIGN KEY (user_id) REFERENCES public.tbl_user(user_id);


--
-- Name: tbl_user_group_account fk_user_group_account_to_account; Type: FK CONSTRAINT; Schema: public; Owner: savapage
--

ALTER TABLE ONLY public.tbl_user_group_account
    ADD CONSTRAINT fk_user_group_account_to_account FOREIGN KEY (account_id) REFERENCES public.tbl_account(account_id);


--
-- Name: tbl_user_group_account fk_user_group_account_to_user_group; Type: FK CONSTRAINT; Schema: public; Owner: savapage
--

ALTER TABLE ONLY public.tbl_user_group_account
    ADD CONSTRAINT fk_user_group_account_to_user_group FOREIGN KEY (user_group_id) REFERENCES public.tbl_user_group(user_group_id);


--
-- Name: tbl_user_group_attr fk_user_group_attr_to_user_group; Type: FK CONSTRAINT; Schema: public; Owner: savapage
--

ALTER TABLE ONLY public.tbl_user_group_attr
    ADD CONSTRAINT fk_user_group_attr_to_user_group FOREIGN KEY (user_group_id) REFERENCES public.tbl_user_group(user_group_id);


--
-- Name: tbl_user_group_member fk_user_group_member_to_user; Type: FK CONSTRAINT; Schema: public; Owner: savapage
--

ALTER TABLE ONLY public.tbl_user_group_member
    ADD CONSTRAINT fk_user_group_member_to_user FOREIGN KEY (user_id) REFERENCES public.tbl_user(user_id);


--
-- Name: tbl_user_group_member fk_user_group_member_to_user_group; Type: FK CONSTRAINT; Schema: public; Owner: savapage
--

ALTER TABLE ONLY public.tbl_user_group_member
    ADD CONSTRAINT fk_user_group_member_to_user_group FOREIGN KEY (user_group_id) REFERENCES public.tbl_user_group(user_group_id);


--
-- Name: tbl_user_number fk_user_number_to_user; Type: FK CONSTRAINT; Schema: public; Owner: savapage
--

ALTER TABLE ONLY public.tbl_user_number
    ADD CONSTRAINT fk_user_number_to_user FOREIGN KEY (user_id) REFERENCES public.tbl_user(user_id);


--
-- PostgreSQL database dump complete
--

\unrestrict L5DhVSa5jj9akcjyrS3aymg0lTY51lN3BurrZdI1vhYOwAz8097aGVEtMtIapvi

