--
-- YSQL database dump
--

-- Dumped from database version 11.14 (Ubuntu 11.14-2.pgdg20.04+1)
-- Dumped by ysql_dump version 11.2-YB-2.11.1.0-b0

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: dbo; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA dbo;


ALTER SCHEMA dbo OWNER TO postgres;

--
-- Name: guest; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA guest;


ALTER SCHEMA guest OWNER TO postgres;

--
-- Name: humanresources; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA humanresources;


ALTER SCHEMA humanresources OWNER TO postgres;

--
-- Name: person; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA person;


ALTER SCHEMA person OWNER TO postgres;

--
-- Name: production; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA production;


ALTER SCHEMA production OWNER TO postgres;

--
-- Name: purchasing; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA purchasing;


ALTER SCHEMA purchasing OWNER TO postgres;

--
-- Name: sales; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA sales;


ALTER SCHEMA sales OWNER TO postgres;

--
-- Name: uuid-ossp; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS "uuid-ossp" WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION "uuid-ossp"; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION "uuid-ossp" IS 'generate universally unique identifiers (UUIDs)';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: awbuildversion; Type: TABLE; Schema: dbo; Owner: postgres
--

CREATE TABLE dbo.awbuildversion (
    "SystemInformationID" smallint,
    "Database Version" character varying(25),
    "VersionDate" timestamp with time zone,
    "ModifiedDate" timestamp with time zone
);


ALTER TABLE dbo.awbuildversion OWNER TO postgres;

--
-- Name: databaselog; Type: TABLE; Schema: dbo; Owner: postgres
--

CREATE TABLE dbo.databaselog (
    "DatabaseLogID" integer NOT NULL,
    "PostTime" timestamp with time zone,
    "DatabaseUser" character varying(128),
    "Event" character varying(128),
    "Schema" character varying(128),
    "Object" character varying(128),
    "TSQL" text,
    "XmlEvent" text
);


ALTER TABLE dbo.databaselog OWNER TO postgres;

--
-- Name: databaselog_DatabaseLogID_seq; Type: SEQUENCE; Schema: dbo; Owner: postgres
--

CREATE SEQUENCE dbo."databaselog_DatabaseLogID_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE dbo."databaselog_DatabaseLogID_seq" OWNER TO postgres;

--
-- Name: databaselog_DatabaseLogID_seq; Type: SEQUENCE OWNED BY; Schema: dbo; Owner: postgres
--

ALTER SEQUENCE dbo."databaselog_DatabaseLogID_seq" OWNED BY dbo.databaselog."DatabaseLogID";


--
-- Name: errorlog; Type: TABLE; Schema: dbo; Owner: postgres
--

CREATE TABLE dbo.errorlog (
    "ErrorLogID" integer NOT NULL,
    "ErrorTime" timestamp with time zone,
    "UserName" character varying(128),
    "ErrorNumber" integer,
    "ErrorSeverity" integer,
    "ErrorState" integer,
    "ErrorProcedure" character varying(126),
    "ErrorLine" integer,
    "ErrorMessage" character varying(4000)
);


ALTER TABLE dbo.errorlog OWNER TO postgres;

--
-- Name: errorlog_ErrorLogID_seq; Type: SEQUENCE; Schema: dbo; Owner: postgres
--

CREATE SEQUENCE dbo."errorlog_ErrorLogID_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE dbo."errorlog_ErrorLogID_seq" OWNER TO postgres;

--
-- Name: errorlog_ErrorLogID_seq; Type: SEQUENCE OWNED BY; Schema: dbo; Owner: postgres
--

ALTER SEQUENCE dbo."errorlog_ErrorLogID_seq" OWNED BY dbo.errorlog."ErrorLogID";


--
-- Name: tempqueries; Type: TABLE; Schema: dbo; Owner: postgres
--

CREATE TABLE dbo.tempqueries (
    rownum bigint,
    col1 character varying(376),
    col2 text,
    col3 character varying(259)
);


ALTER TABLE dbo.tempqueries OWNER TO postgres;

--
-- Name: tempqueriescopy; Type: TABLE; Schema: dbo; Owner: postgres
--

CREATE TABLE dbo.tempqueriescopy (
    rownum bigint,
    col1 character varying(376),
    col2 text,
    col3 character varying(259)
);


ALTER TABLE dbo.tempqueriescopy OWNER TO postgres;

--
-- Name: department; Type: TABLE; Schema: humanresources; Owner: postgres
--

CREATE TABLE humanresources.department (
    "DepartmentID" integer NOT NULL,
    "Name" character varying(50),
    "GroupName" character varying(50),
    "ModifiedDate" timestamp with time zone,
    CONSTRAINT pk_department_departmentid PRIMARY KEY("DepartmentID" ASC)
);


ALTER TABLE humanresources.department OWNER TO postgres;

--
-- Name: department_DepartmentID_seq; Type: SEQUENCE; Schema: humanresources; Owner: postgres
--

CREATE SEQUENCE humanresources."department_DepartmentID_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE humanresources."department_DepartmentID_seq" OWNER TO postgres;

--
-- Name: department_DepartmentID_seq; Type: SEQUENCE OWNED BY; Schema: humanresources; Owner: postgres
--

ALTER SEQUENCE humanresources."department_DepartmentID_seq" OWNED BY humanresources.department."DepartmentID";


--
-- Name: employee; Type: TABLE; Schema: humanresources; Owner: postgres
--

CREATE TABLE humanresources.employee (
    "BusinessEntityID" integer NOT NULL,
    "NationalIDNumber" character varying(15),
    "LoginID" character varying(256),
    "OrganizationNode" bytea,
    "OrganizationLevel" smallint,
    "JobTitle" character varying(50),
    "BirthDate" date,
    "MaritalStatus" character varying(1),
    "Gender" character varying(1),
    "HireDate" date,
    "SalariedFlag" boolean DEFAULT true,
    "VacationHours" smallint,
    "SickLeaveHours" smallint,
    "CurrentFlag" boolean DEFAULT true,
    rowguid uuid,
    "ModifiedDate" timestamp with time zone,
    CONSTRAINT pk_employee_businessentityid PRIMARY KEY("BusinessEntityID" ASC)
);


ALTER TABLE humanresources.employee OWNER TO postgres;

--
-- Name: employeedepartmenthistory; Type: TABLE; Schema: humanresources; Owner: postgres
--

CREATE TABLE humanresources.employeedepartmenthistory (
    "BusinessEntityID" integer NOT NULL,
    "DepartmentID" smallint NOT NULL,
    "ShiftID" smallint NOT NULL,
    "StartDate" date NOT NULL,
    "EndDate" date,
    "ModifiedDate" timestamp with time zone,
    CONSTRAINT pk_employeedepartmenthistory_businessentityid_startdate_departm PRIMARY KEY("BusinessEntityID" ASC, "DepartmentID" ASC, "ShiftID" ASC, "StartDate" ASC)
);


ALTER TABLE humanresources.employeedepartmenthistory OWNER TO postgres;

--
-- Name: employeepayhistory; Type: TABLE; Schema: humanresources; Owner: postgres
--

CREATE TABLE humanresources.employeepayhistory (
    "BusinessEntityID" integer NOT NULL,
    "RateChangeDate" timestamp with time zone NOT NULL,
    "Rate" money,
    "PayFrequency" smallint,
    "ModifiedDate" timestamp with time zone,
    CONSTRAINT pk_employeepayhistory_businessentityid_ratechangedate PRIMARY KEY("BusinessEntityID" ASC, "RateChangeDate" ASC)
);


ALTER TABLE humanresources.employeepayhistory OWNER TO postgres;

--
-- Name: jobcandidate; Type: TABLE; Schema: humanresources; Owner: postgres
--

CREATE TABLE humanresources.jobcandidate (
    "JobCandidateID" integer NOT NULL,
    "BusinessEntityID" integer,
    "Resume" text,
    "ModifiedDate" timestamp with time zone,
    CONSTRAINT pk_jobcandidate_jobcandidateid PRIMARY KEY("JobCandidateID" ASC)
);


ALTER TABLE humanresources.jobcandidate OWNER TO postgres;

--
-- Name: jobcandidate_JobCandidateID_seq; Type: SEQUENCE; Schema: humanresources; Owner: postgres
--

CREATE SEQUENCE humanresources."jobcandidate_JobCandidateID_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE humanresources."jobcandidate_JobCandidateID_seq" OWNER TO postgres;

--
-- Name: jobcandidate_JobCandidateID_seq; Type: SEQUENCE OWNED BY; Schema: humanresources; Owner: postgres
--

ALTER SEQUENCE humanresources."jobcandidate_JobCandidateID_seq" OWNED BY humanresources.jobcandidate."JobCandidateID";


--
-- Name: shift; Type: TABLE; Schema: humanresources; Owner: postgres
--

CREATE TABLE humanresources.shift (
    "ShiftID" smallint NOT NULL,
    "Name" character varying(50),
    "StartTime" time without time zone,
    "EndTime" time without time zone,
    "ModifiedDate" timestamp with time zone,
    CONSTRAINT pk_shift_shiftid PRIMARY KEY("ShiftID" ASC)
);


ALTER TABLE humanresources.shift OWNER TO postgres;

--
-- Name: address; Type: TABLE; Schema: person; Owner: postgres
--

CREATE TABLE person.address (
    "AddressID" integer NOT NULL,
    "AddressLine1" character varying(60),
    "AddressLine2" character varying(60),
    "City" character varying(30),
    "StateProvinceID" integer,
    "PostalCode" character varying(15),
    "SpatialLocation" text,
    rowguid uuid,
    "ModifiedDate" timestamp with time zone,
    CONSTRAINT pk_address_addressid PRIMARY KEY("AddressID" ASC)
);


ALTER TABLE person.address OWNER TO postgres;

--
-- Name: address_AddressID_seq; Type: SEQUENCE; Schema: person; Owner: postgres
--

CREATE SEQUENCE person."address_AddressID_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE person."address_AddressID_seq" OWNER TO postgres;

--
-- Name: address_AddressID_seq; Type: SEQUENCE OWNED BY; Schema: person; Owner: postgres
--

ALTER SEQUENCE person."address_AddressID_seq" OWNED BY person.address."AddressID";


--
-- Name: addresstype; Type: TABLE; Schema: person; Owner: postgres
--

CREATE TABLE person.addresstype (
    "AddressTypeID" integer NOT NULL,
    "Name" character varying(50),
    rowguid uuid,
    "ModifiedDate" timestamp with time zone,
    CONSTRAINT pk_addresstype_addresstypeid PRIMARY KEY("AddressTypeID" ASC)
);


ALTER TABLE person.addresstype OWNER TO postgres;

--
-- Name: addresstype_AddressTypeID_seq; Type: SEQUENCE; Schema: person; Owner: postgres
--

CREATE SEQUENCE person."addresstype_AddressTypeID_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE person."addresstype_AddressTypeID_seq" OWNER TO postgres;

--
-- Name: addresstype_AddressTypeID_seq; Type: SEQUENCE OWNED BY; Schema: person; Owner: postgres
--

ALTER SEQUENCE person."addresstype_AddressTypeID_seq" OWNED BY person.addresstype."AddressTypeID";


--
-- Name: businessentity; Type: TABLE; Schema: person; Owner: postgres
--

CREATE TABLE person.businessentity (
    "BusinessEntityID" integer NOT NULL,
    rowguid uuid,
    "ModifiedDate" timestamp with time zone,
    CONSTRAINT pk_businessentity_businessentityid PRIMARY KEY("BusinessEntityID" ASC)
);


ALTER TABLE person.businessentity OWNER TO postgres;

--
-- Name: businessentity_BusinessEntityID_seq; Type: SEQUENCE; Schema: person; Owner: postgres
--

CREATE SEQUENCE person."businessentity_BusinessEntityID_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE person."businessentity_BusinessEntityID_seq" OWNER TO postgres;

--
-- Name: businessentity_BusinessEntityID_seq; Type: SEQUENCE OWNED BY; Schema: person; Owner: postgres
--

ALTER SEQUENCE person."businessentity_BusinessEntityID_seq" OWNED BY person.businessentity."BusinessEntityID";


--
-- Name: businessentityaddress; Type: TABLE; Schema: person; Owner: postgres
--

CREATE TABLE person.businessentityaddress (
    "BusinessEntityID" integer NOT NULL,
    "AddressID" integer NOT NULL,
    "AddressTypeID" integer NOT NULL,
    rowguid uuid,
    "ModifiedDate" timestamp with time zone,
    CONSTRAINT pk_businessentityaddress_businessentityid_addressid_addresstype PRIMARY KEY("BusinessEntityID" ASC, "AddressID" ASC, "AddressTypeID" ASC)
);


ALTER TABLE person.businessentityaddress OWNER TO postgres;

--
-- Name: businessentitycontact; Type: TABLE; Schema: person; Owner: postgres
--

CREATE TABLE person.businessentitycontact (
    "BusinessEntityID" integer NOT NULL,
    "PersonID" integer NOT NULL,
    "ContactTypeID" integer NOT NULL,
    rowguid uuid,
    "ModifiedDate" timestamp with time zone,
    CONSTRAINT pk_businessentitycontact_businessentityid_personid_contacttypei PRIMARY KEY("BusinessEntityID" ASC, "PersonID" ASC, "ContactTypeID" ASC)
);


ALTER TABLE person.businessentitycontact OWNER TO postgres;

--
-- Name: contacttype; Type: TABLE; Schema: person; Owner: postgres
--

CREATE TABLE person.contacttype (
    "ContactTypeID" integer NOT NULL,
    "Name" character varying(50),
    "ModifiedDate" timestamp with time zone,
    CONSTRAINT pk_contacttype_contacttypeid PRIMARY KEY("ContactTypeID" ASC)
);


ALTER TABLE person.contacttype OWNER TO postgres;

--
-- Name: contacttype_ContactTypeID_seq; Type: SEQUENCE; Schema: person; Owner: postgres
--

CREATE SEQUENCE person."contacttype_ContactTypeID_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE person."contacttype_ContactTypeID_seq" OWNER TO postgres;

--
-- Name: contacttype_ContactTypeID_seq; Type: SEQUENCE OWNED BY; Schema: person; Owner: postgres
--

ALTER SEQUENCE person."contacttype_ContactTypeID_seq" OWNED BY person.contacttype."ContactTypeID";


--
-- Name: countryregion; Type: TABLE; Schema: person; Owner: postgres
--

CREATE TABLE person.countryregion (
    "CountryRegionCode" character varying(3) NOT NULL,
    "Name" character varying(50),
    "ModifiedDate" timestamp with time zone,
    CONSTRAINT pk_countryregion_countryregioncode PRIMARY KEY("CountryRegionCode" ASC)
);


ALTER TABLE person.countryregion OWNER TO postgres;

--
-- Name: emailaddress; Type: TABLE; Schema: person; Owner: postgres
--

CREATE TABLE person.emailaddress (
    "BusinessEntityID" integer NOT NULL,
    "EmailAddressID" integer NOT NULL,
    "EmailAddress" character varying(50),
    rowguid uuid,
    "ModifiedDate" timestamp with time zone,
    CONSTRAINT pk_emailaddress_businessentityid_emailaddressid PRIMARY KEY("BusinessEntityID" ASC, "EmailAddressID" ASC)
);


ALTER TABLE person.emailaddress OWNER TO postgres;

--
-- Name: emailaddress_EmailAddressID_seq; Type: SEQUENCE; Schema: person; Owner: postgres
--

CREATE SEQUENCE person."emailaddress_EmailAddressID_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE person."emailaddress_EmailAddressID_seq" OWNER TO postgres;

--
-- Name: emailaddress_EmailAddressID_seq; Type: SEQUENCE OWNED BY; Schema: person; Owner: postgres
--

ALTER SEQUENCE person."emailaddress_EmailAddressID_seq" OWNED BY person.emailaddress."EmailAddressID";


--
-- Name: password; Type: TABLE; Schema: person; Owner: postgres
--

CREATE TABLE person.password (
    "BusinessEntityID" integer NOT NULL,
    "PasswordHash" character varying(128),
    "PasswordSalt" character varying(10),
    rowguid uuid,
    "ModifiedDate" timestamp with time zone,
    CONSTRAINT pk_password_businessentityid PRIMARY KEY("BusinessEntityID" ASC)
);


ALTER TABLE person.password OWNER TO postgres;

--
-- Name: person; Type: TABLE; Schema: person; Owner: postgres
--

CREATE TABLE person.person (
    "BusinessEntityID" integer NOT NULL,
    "PersonType" character varying(2),
    "NameStyle" boolean DEFAULT false,
    "Title" character varying(8),
    "FirstName" character varying(50),
    "MiddleName" character varying(50),
    "LastName" character varying(50),
    "Suffix" character varying(10),
    "EmailPromotion" integer,
    "AdditionalContactInfo" text,
    "Demographics" text,
    rowguid uuid,
    "ModifiedDate" timestamp with time zone,
    CONSTRAINT pk_person_businessentityid PRIMARY KEY("BusinessEntityID" ASC)
);


ALTER TABLE person.person OWNER TO postgres;

--
-- Name: personphone; Type: TABLE; Schema: person; Owner: postgres
--

CREATE TABLE person.personphone (
    "BusinessEntityID" integer NOT NULL,
    "PhoneNumber" character varying(25) NOT NULL,
    "PhoneNumberTypeID" integer NOT NULL,
    "ModifiedDate" timestamp with time zone,
    CONSTRAINT pk_personphone_businessentityid_phonenumber_phonenumbertypeid PRIMARY KEY("BusinessEntityID" ASC, "PhoneNumber" ASC, "PhoneNumberTypeID" ASC)
);


ALTER TABLE person.personphone OWNER TO postgres;

--
-- Name: phonenumbertype; Type: TABLE; Schema: person; Owner: postgres
--

CREATE TABLE person.phonenumbertype (
    "PhoneNumberTypeID" integer NOT NULL,
    "Name" character varying(50),
    "ModifiedDate" timestamp with time zone,
    CONSTRAINT pk_phonenumbertype_phonenumbertypeid PRIMARY KEY("PhoneNumberTypeID" ASC)
);


ALTER TABLE person.phonenumbertype OWNER TO postgres;

--
-- Name: phonenumbertype_PhoneNumberTypeID_seq; Type: SEQUENCE; Schema: person; Owner: postgres
--

CREATE SEQUENCE person."phonenumbertype_PhoneNumberTypeID_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE person."phonenumbertype_PhoneNumberTypeID_seq" OWNER TO postgres;

--
-- Name: phonenumbertype_PhoneNumberTypeID_seq; Type: SEQUENCE OWNED BY; Schema: person; Owner: postgres
--

ALTER SEQUENCE person."phonenumbertype_PhoneNumberTypeID_seq" OWNED BY person.phonenumbertype."PhoneNumberTypeID";


--
-- Name: stateprovince; Type: TABLE; Schema: person; Owner: postgres
--

CREATE TABLE person.stateprovince (
    "StateProvinceID" integer NOT NULL,
    "StateProvinceCode" character varying(3),
    "CountryRegionCode" character varying(3),
    "IsOnlyStateProvinceFlag" boolean DEFAULT true,
    "Name" character varying(50),
    "TerritoryID" integer,
    rowguid uuid,
    "ModifiedDate" timestamp with time zone,
    CONSTRAINT pk_stateprovince_stateprovinceid PRIMARY KEY("StateProvinceID" ASC)
);


ALTER TABLE person.stateprovince OWNER TO postgres;

--
-- Name: stateprovince_StateProvinceID_seq; Type: SEQUENCE; Schema: person; Owner: postgres
--

CREATE SEQUENCE person."stateprovince_StateProvinceID_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE person."stateprovince_StateProvinceID_seq" OWNER TO postgres;

--
-- Name: stateprovince_StateProvinceID_seq; Type: SEQUENCE OWNED BY; Schema: person; Owner: postgres
--

ALTER SEQUENCE person."stateprovince_StateProvinceID_seq" OWNED BY person.stateprovince."StateProvinceID";


--
-- Name: billofmaterials; Type: TABLE; Schema: production; Owner: postgres
--

CREATE TABLE production.billofmaterials (
    "BillOfMaterialsID" integer NOT NULL,
    "ProductAssemblyID" integer,
    "ComponentID" integer,
    "StartDate" timestamp with time zone,
    "EndDate" timestamp with time zone,
    "UnitMeasureCode" character varying(3),
    "BOMLevel" smallint,
    "PerAssemblyQty" numeric(8,2),
    "ModifiedDate" timestamp with time zone,
    CONSTRAINT pk_billofmaterials_billofmaterialsid PRIMARY KEY("BillOfMaterialsID" ASC)
);


ALTER TABLE production.billofmaterials OWNER TO postgres;

--
-- Name: billofmaterials_BillOfMaterialsID_seq; Type: SEQUENCE; Schema: production; Owner: postgres
--

CREATE SEQUENCE production."billofmaterials_BillOfMaterialsID_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE production."billofmaterials_BillOfMaterialsID_seq" OWNER TO postgres;

--
-- Name: billofmaterials_BillOfMaterialsID_seq; Type: SEQUENCE OWNED BY; Schema: production; Owner: postgres
--

ALTER SEQUENCE production."billofmaterials_BillOfMaterialsID_seq" OWNED BY production.billofmaterials."BillOfMaterialsID";


--
-- Name: culture; Type: TABLE; Schema: production; Owner: postgres
--

CREATE TABLE production.culture (
    "CultureID" character varying(6),
    "Name" character varying(50),
    "ModifiedDate" timestamp with time zone
);


ALTER TABLE production.culture OWNER TO postgres;

--
-- Name: document; Type: TABLE; Schema: production; Owner: postgres
--

CREATE TABLE production.document (
    "DocumentNode" bytea NOT NULL,
    "DocumentLevel" smallint,
    "Title" character varying(50),
    "Owner" integer,
    "FolderFlag" boolean DEFAULT false,
    "FileName" character varying(400),
    "FileExtension" character varying(8),
    "Revision" character varying(5),
    "ChangeNumber" integer,
    "Status" smallint,
    "DocumentSummary" text,
    "Document" text,
    rowguid uuid,
    "ModifiedDate" timestamp with time zone,
    CONSTRAINT pk_document_documentnode PRIMARY KEY("DocumentNode" ASC)
);


ALTER TABLE production.document OWNER TO postgres;

--
-- Name: illustration; Type: TABLE; Schema: production; Owner: postgres
--

CREATE TABLE production.illustration (
    "IllustrationID" integer NOT NULL,
    "Diagram" text,
    "ModifiedDate" timestamp with time zone,
    CONSTRAINT pk_illustration_illustrationid PRIMARY KEY("IllustrationID" ASC)
);


ALTER TABLE production.illustration OWNER TO postgres;

--
-- Name: illustration_IllustrationID_seq; Type: SEQUENCE; Schema: production; Owner: postgres
--

CREATE SEQUENCE production."illustration_IllustrationID_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE production."illustration_IllustrationID_seq" OWNER TO postgres;

--
-- Name: illustration_IllustrationID_seq; Type: SEQUENCE OWNED BY; Schema: production; Owner: postgres
--

ALTER SEQUENCE production."illustration_IllustrationID_seq" OWNED BY production.illustration."IllustrationID";


--
-- Name: location; Type: TABLE; Schema: production; Owner: postgres
--

CREATE TABLE production.location (
    "LocationID" integer NOT NULL,
    "Name" character varying(50),
    "CostRate" money,
    "Availability" numeric(8,2),
    "ModifiedDate" timestamp with time zone,
    CONSTRAINT pk_location_locationid PRIMARY KEY("LocationID" ASC)
);


ALTER TABLE production.location OWNER TO postgres;

--
-- Name: location_LocationID_seq; Type: SEQUENCE; Schema: production; Owner: postgres
--

CREATE SEQUENCE production."location_LocationID_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE production."location_LocationID_seq" OWNER TO postgres;

--
-- Name: location_LocationID_seq; Type: SEQUENCE OWNED BY; Schema: production; Owner: postgres
--

ALTER SEQUENCE production."location_LocationID_seq" OWNED BY production.location."LocationID";


--
-- Name: product; Type: TABLE; Schema: production; Owner: postgres
--

CREATE TABLE production.product (
    "ProductID" integer NOT NULL,
    "Name" character varying(50),
    "ProductNumber" character varying(25),
    "MakeFlag" boolean DEFAULT true,
    "FinishedGoodsFlag" boolean DEFAULT true,
    "Color" character varying(15),
    "SafetyStockLevel" smallint,
    "ReorderPoint" smallint,
    "StandardCost" money,
    "ListPrice" money,
    "Size" character varying(5),
    "SizeUnitMeasureCode" character varying(3),
    "WeightUnitMeasureCode" character varying(3),
    "Weight" numeric(8,2),
    "DaysToManufacture" integer,
    "ProductLine" character varying(2),
    "Class" character varying(2),
    "Style" character varying(2),
    "ProductSubcategoryID" integer,
    "ProductModelID" integer,
    "SellStartDate" timestamp with time zone,
    "SellEndDate" timestamp with time zone,
    "DiscontinuedDate" timestamp with time zone,
    rowguid uuid,
    "ModifiedDate" timestamp with time zone,
    CONSTRAINT pk_product_productid PRIMARY KEY("ProductID" ASC)
);


ALTER TABLE production.product OWNER TO postgres;

--
-- Name: product_ProductID_seq; Type: SEQUENCE; Schema: production; Owner: postgres
--

CREATE SEQUENCE production."product_ProductID_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE production."product_ProductID_seq" OWNER TO postgres;

--
-- Name: product_ProductID_seq; Type: SEQUENCE OWNED BY; Schema: production; Owner: postgres
--

ALTER SEQUENCE production."product_ProductID_seq" OWNED BY production.product."ProductID";


--
-- Name: productcategory; Type: TABLE; Schema: production; Owner: postgres
--

CREATE TABLE production.productcategory (
    "ProductCategoryID" integer NOT NULL,
    "Name" character varying(50),
    rowguid uuid,
    "ModifiedDate" timestamp with time zone,
    CONSTRAINT pk_productcategory_productcategoryid PRIMARY KEY("ProductCategoryID" ASC)
);


ALTER TABLE production.productcategory OWNER TO postgres;

--
-- Name: productcategory_ProductCategoryID_seq; Type: SEQUENCE; Schema: production; Owner: postgres
--

CREATE SEQUENCE production."productcategory_ProductCategoryID_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE production."productcategory_ProductCategoryID_seq" OWNER TO postgres;

--
-- Name: productcategory_ProductCategoryID_seq; Type: SEQUENCE OWNED BY; Schema: production; Owner: postgres
--

ALTER SEQUENCE production."productcategory_ProductCategoryID_seq" OWNED BY production.productcategory."ProductCategoryID";


--
-- Name: productcosthistory; Type: TABLE; Schema: production; Owner: postgres
--

CREATE TABLE production.productcosthistory (
    "ProductID" integer NOT NULL,
    "StartDate" timestamp with time zone NOT NULL,
    "EndDate" timestamp with time zone,
    "StandardCost" money,
    "ModifiedDate" timestamp with time zone,
    CONSTRAINT pk_productcosthistory_productid_startdate PRIMARY KEY("ProductID" ASC, "StartDate" ASC)
);


ALTER TABLE production.productcosthistory OWNER TO postgres;

--
-- Name: productdescription; Type: TABLE; Schema: production; Owner: postgres
--

CREATE TABLE production.productdescription (
    "ProductDescriptionID" integer NOT NULL,
    "Description" character varying(400),
    rowguid uuid,
    "ModifiedDate" timestamp with time zone,
    CONSTRAINT pk_productdescription_productdescriptionid PRIMARY KEY("ProductDescriptionID" ASC)
);


ALTER TABLE production.productdescription OWNER TO postgres;

--
-- Name: productdescription_ProductDescriptionID_seq; Type: SEQUENCE; Schema: production; Owner: postgres
--

CREATE SEQUENCE production."productdescription_ProductDescriptionID_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE production."productdescription_ProductDescriptionID_seq" OWNER TO postgres;

--
-- Name: productdescription_ProductDescriptionID_seq; Type: SEQUENCE OWNED BY; Schema: production; Owner: postgres
--

ALTER SEQUENCE production."productdescription_ProductDescriptionID_seq" OWNED BY production.productdescription."ProductDescriptionID";


--
-- Name: productdocument; Type: TABLE; Schema: production; Owner: postgres
--

CREATE TABLE production.productdocument (
    "ProductID" integer NOT NULL,
    "DocumentNode" bytea NOT NULL,
    "ModifiedDate" timestamp with time zone,
    CONSTRAINT pk_productdocument_productid_documentnode PRIMARY KEY("ProductID" ASC, "DocumentNode" ASC)
);


ALTER TABLE production.productdocument OWNER TO postgres;

--
-- Name: productinventory; Type: TABLE; Schema: production; Owner: postgres
--

CREATE TABLE production.productinventory (
    "ProductID" integer NOT NULL,
    "LocationID" smallint NOT NULL,
    "Shelf" character varying(10),
    "Bin" smallint,
    "Quantity" smallint,
    rowguid uuid,
    "ModifiedDate" timestamp with time zone,
    CONSTRAINT pk_productinventory_productid_locationid PRIMARY KEY("ProductID" ASC, "LocationID" ASC)
);


ALTER TABLE production.productinventory OWNER TO postgres;

--
-- Name: productlistpricehistory; Type: TABLE; Schema: production; Owner: postgres
--

CREATE TABLE production.productlistpricehistory (
    "ProductID" integer NOT NULL,
    "StartDate" timestamp with time zone NOT NULL,
    "EndDate" timestamp with time zone,
    "ListPrice" money,
    "ModifiedDate" timestamp with time zone,
    CONSTRAINT pk_productlistpricehistory_productid_startdate PRIMARY KEY("ProductID" ASC, "StartDate" ASC)
);


ALTER TABLE production.productlistpricehistory OWNER TO postgres;

--
-- Name: productmodel; Type: TABLE; Schema: production; Owner: postgres
--

CREATE TABLE production.productmodel (
    "ProductModelID" integer NOT NULL,
    "Name" character varying(50),
    "CatalogDescription" text,
    "Instructions" text,
    rowguid uuid,
    "ModifiedDate" timestamp with time zone,
    CONSTRAINT pk_productmodel_productmodelid PRIMARY KEY("ProductModelID" ASC)
);


ALTER TABLE production.productmodel OWNER TO postgres;

--
-- Name: productmodel_ProductModelID_seq; Type: SEQUENCE; Schema: production; Owner: postgres
--

CREATE SEQUENCE production."productmodel_ProductModelID_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE production."productmodel_ProductModelID_seq" OWNER TO postgres;

--
-- Name: productmodel_ProductModelID_seq; Type: SEQUENCE OWNED BY; Schema: production; Owner: postgres
--

ALTER SEQUENCE production."productmodel_ProductModelID_seq" OWNED BY production.productmodel."ProductModelID";


--
-- Name: productmodelillustration; Type: TABLE; Schema: production; Owner: postgres
--

CREATE TABLE production.productmodelillustration (
    "ProductModelID" integer NOT NULL,
    "IllustrationID" integer NOT NULL,
    "ModifiedDate" timestamp with time zone,
    CONSTRAINT pk_productmodelillustration_productmodelid_illustrationid PRIMARY KEY("ProductModelID" ASC, "IllustrationID" ASC)
);


ALTER TABLE production.productmodelillustration OWNER TO postgres;

--
-- Name: productmodelproductdescriptionculture; Type: TABLE; Schema: production; Owner: postgres
--

CREATE TABLE production.productmodelproductdescriptionculture (
    "ProductModelID" integer NOT NULL,
    "ProductDescriptionID" integer NOT NULL,
    "CultureID" character varying(6) NOT NULL,
    "ModifiedDate" timestamp with time zone,
    CONSTRAINT pk_productmodelproductdescriptionculture_productmodelid_product PRIMARY KEY("ProductModelID" ASC, "ProductDescriptionID" ASC, "CultureID" ASC)
);


ALTER TABLE production.productmodelproductdescriptionculture OWNER TO postgres;

--
-- Name: productphoto; Type: TABLE; Schema: production; Owner: postgres
--

CREATE TABLE production.productphoto (
    "ProductPhotoID" integer NOT NULL,
    "ThumbNailPhoto" text,
    "ThumbnailPhotoFileName" character varying(50),
    "LargePhoto" text,
    "LargePhotoFileName" character varying(50),
    "ModifiedDate" timestamp with time zone,
    CONSTRAINT pk_productphoto_productphotoid PRIMARY KEY("ProductPhotoID" ASC)
);


ALTER TABLE production.productphoto OWNER TO postgres;

--
-- Name: productphoto_ProductPhotoID_seq; Type: SEQUENCE; Schema: production; Owner: postgres
--

CREATE SEQUENCE production."productphoto_ProductPhotoID_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE production."productphoto_ProductPhotoID_seq" OWNER TO postgres;

--
-- Name: productphoto_ProductPhotoID_seq; Type: SEQUENCE OWNED BY; Schema: production; Owner: postgres
--

ALTER SEQUENCE production."productphoto_ProductPhotoID_seq" OWNED BY production.productphoto."ProductPhotoID";


--
-- Name: productproductphoto; Type: TABLE; Schema: production; Owner: postgres
--

CREATE TABLE production.productproductphoto (
    "ProductID" integer NOT NULL,
    "ProductPhotoID" integer NOT NULL,
    "Primary" boolean DEFAULT false,
    "ModifiedDate" timestamp with time zone,
    CONSTRAINT pk_productproductphoto_productid_productphotoid PRIMARY KEY("ProductID" ASC, "ProductPhotoID" ASC)
);


ALTER TABLE production.productproductphoto OWNER TO postgres;

--
-- Name: productreview; Type: TABLE; Schema: production; Owner: postgres
--

CREATE TABLE production.productreview (
    "ProductReviewID" integer NOT NULL,
    "ProductID" integer,
    "ReviewerName" character varying(50),
    "ReviewDate" timestamp with time zone,
    "EmailAddress" character varying(50),
    "Rating" integer,
    "Comments" character varying(3850),
    "ModifiedDate" timestamp with time zone,
    CONSTRAINT pk_productreview_productreviewid PRIMARY KEY("ProductReviewID" ASC)
);


ALTER TABLE production.productreview OWNER TO postgres;

--
-- Name: productreview_ProductReviewID_seq; Type: SEQUENCE; Schema: production; Owner: postgres
--

CREATE SEQUENCE production."productreview_ProductReviewID_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE production."productreview_ProductReviewID_seq" OWNER TO postgres;

--
-- Name: productreview_ProductReviewID_seq; Type: SEQUENCE OWNED BY; Schema: production; Owner: postgres
--

ALTER SEQUENCE production."productreview_ProductReviewID_seq" OWNED BY production.productreview."ProductReviewID";


--
-- Name: productsubcategory; Type: TABLE; Schema: production; Owner: postgres
--

CREATE TABLE production.productsubcategory (
    "ProductSubcategoryID" integer NOT NULL,
    "ProductCategoryID" integer,
    "Name" character varying(50),
    rowguid uuid,
    "ModifiedDate" timestamp with time zone,
    CONSTRAINT pk_productsubcategory_productsubcategoryid PRIMARY KEY("ProductSubcategoryID" ASC)
);


ALTER TABLE production.productsubcategory OWNER TO postgres;

--
-- Name: productsubcategory_ProductSubcategoryID_seq; Type: SEQUENCE; Schema: production; Owner: postgres
--

CREATE SEQUENCE production."productsubcategory_ProductSubcategoryID_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE production."productsubcategory_ProductSubcategoryID_seq" OWNER TO postgres;

--
-- Name: productsubcategory_ProductSubcategoryID_seq; Type: SEQUENCE OWNED BY; Schema: production; Owner: postgres
--

ALTER SEQUENCE production."productsubcategory_ProductSubcategoryID_seq" OWNED BY production.productsubcategory."ProductSubcategoryID";


--
-- Name: scrapreason; Type: TABLE; Schema: production; Owner: postgres
--

CREATE TABLE production.scrapreason (
    "ScrapReasonID" integer NOT NULL,
    "Name" character varying(50),
    "ModifiedDate" timestamp with time zone,
    CONSTRAINT pk_scrapreason_scrapreasonid PRIMARY KEY("ScrapReasonID" ASC)
);


ALTER TABLE production.scrapreason OWNER TO postgres;

--
-- Name: scrapreason_ScrapReasonID_seq; Type: SEQUENCE; Schema: production; Owner: postgres
--

CREATE SEQUENCE production."scrapreason_ScrapReasonID_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE production."scrapreason_ScrapReasonID_seq" OWNER TO postgres;

--
-- Name: scrapreason_ScrapReasonID_seq; Type: SEQUENCE OWNED BY; Schema: production; Owner: postgres
--

ALTER SEQUENCE production."scrapreason_ScrapReasonID_seq" OWNED BY production.scrapreason."ScrapReasonID";


--
-- Name: transactionhistory; Type: TABLE; Schema: production; Owner: postgres
--

CREATE TABLE production.transactionhistory (
    "TransactionID" integer NOT NULL,
    "ProductID" integer,
    "ReferenceOrderID" integer,
    "ReferenceOrderLineID" integer,
    "TransactionDate" timestamp with time zone,
    "TransactionType" character varying(1),
    "Quantity" integer,
    "ActualCost" money,
    "ModifiedDate" timestamp with time zone,
    CONSTRAINT pk_transactionhistory_transactionid PRIMARY KEY("TransactionID" ASC)
);


ALTER TABLE production.transactionhistory OWNER TO postgres;

--
-- Name: transactionhistory_TransactionID_seq; Type: SEQUENCE; Schema: production; Owner: postgres
--

CREATE SEQUENCE production."transactionhistory_TransactionID_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE production."transactionhistory_TransactionID_seq" OWNER TO postgres;

--
-- Name: transactionhistory_TransactionID_seq; Type: SEQUENCE OWNED BY; Schema: production; Owner: postgres
--

ALTER SEQUENCE production."transactionhistory_TransactionID_seq" OWNED BY production.transactionhistory."TransactionID";


--
-- Name: transactionhistoryarchive; Type: TABLE; Schema: production; Owner: postgres
--

CREATE TABLE production.transactionhistoryarchive (
    "TransactionID" integer NOT NULL,
    "ProductID" integer,
    "ReferenceOrderID" integer,
    "ReferenceOrderLineID" integer,
    "TransactionDate" timestamp with time zone,
    "TransactionType" character varying(1),
    "Quantity" integer,
    "ActualCost" money,
    "ModifiedDate" timestamp with time zone,
    CONSTRAINT pk_transactionhistoryarchive_transactionid PRIMARY KEY("TransactionID" ASC)
);


ALTER TABLE production.transactionhistoryarchive OWNER TO postgres;

--
-- Name: unitmeasure; Type: TABLE; Schema: production; Owner: postgres
--

CREATE TABLE production.unitmeasure (
    "UnitMeasureCode" character varying(3) NOT NULL,
    "Name" character varying(50),
    "ModifiedDate" timestamp with time zone,
    CONSTRAINT pk_unitmeasure_unitmeasurecode PRIMARY KEY("UnitMeasureCode" ASC)
);


ALTER TABLE production.unitmeasure OWNER TO postgres;

--
-- Name: workorder; Type: TABLE; Schema: production; Owner: postgres
--

CREATE TABLE production.workorder (
    "WorkOrderID" integer NOT NULL,
    "ProductID" integer,
    "OrderQty" integer,
    "StockedQty" integer,
    "ScrappedQty" smallint,
    "StartDate" timestamp with time zone,
    "EndDate" timestamp with time zone,
    "DueDate" timestamp with time zone,
    "ScrapReasonID" smallint,
    "ModifiedDate" timestamp with time zone,
    CONSTRAINT pk_workorder_workorderid PRIMARY KEY("WorkOrderID" ASC)
);


ALTER TABLE production.workorder OWNER TO postgres;

--
-- Name: workorder_WorkOrderID_seq; Type: SEQUENCE; Schema: production; Owner: postgres
--

CREATE SEQUENCE production."workorder_WorkOrderID_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE production."workorder_WorkOrderID_seq" OWNER TO postgres;

--
-- Name: workorder_WorkOrderID_seq; Type: SEQUENCE OWNED BY; Schema: production; Owner: postgres
--

ALTER SEQUENCE production."workorder_WorkOrderID_seq" OWNED BY production.workorder."WorkOrderID";


--
-- Name: workorderrouting; Type: TABLE; Schema: production; Owner: postgres
--

CREATE TABLE production.workorderrouting (
    "WorkOrderID" integer NOT NULL,
    "ProductID" integer NOT NULL,
    "OperationSequence" smallint NOT NULL,
    "LocationID" smallint,
    "ScheduledStartDate" timestamp with time zone,
    "ScheduledEndDate" timestamp with time zone,
    "ActualStartDate" timestamp with time zone,
    "ActualEndDate" timestamp with time zone,
    "ActualResourceHrs" numeric(9,4),
    "PlannedCost" money,
    "ActualCost" money,
    "ModifiedDate" timestamp with time zone,
    CONSTRAINT pk_workorderrouting_workorderid_productid_operationsequence PRIMARY KEY("WorkOrderID" ASC, "ProductID" ASC, "OperationSequence" ASC)
);


ALTER TABLE production.workorderrouting OWNER TO postgres;

--
-- Name: productvendor; Type: TABLE; Schema: purchasing; Owner: postgres
--

CREATE TABLE purchasing.productvendor (
    "ProductID" integer NOT NULL,
    "BusinessEntityID" integer NOT NULL,
    "AverageLeadTime" integer,
    "StandardPrice" money,
    "LastReceiptCost" money,
    "LastReceiptDate" timestamp with time zone,
    "MinOrderQty" integer,
    "MaxOrderQty" integer,
    "OnOrderQty" integer,
    "UnitMeasureCode" character varying(3),
    "ModifiedDate" timestamp with time zone,
    CONSTRAINT pk_productvendor_productid_businessentityid PRIMARY KEY("ProductID" ASC, "BusinessEntityID" ASC)
);


ALTER TABLE purchasing.productvendor OWNER TO postgres;

--
-- Name: purchaseorderdetail; Type: TABLE; Schema: purchasing; Owner: postgres
--

CREATE TABLE purchasing.purchaseorderdetail (
    "PurchaseOrderID" integer NOT NULL,
    "PurchaseOrderDetailID" integer NOT NULL,
    "DueDate" timestamp with time zone,
    "OrderQty" smallint,
    "ProductID" integer,
    "UnitPrice" money,
    "LineTotal" money,
    "ReceivedQty" numeric(8,2),
    "RejectedQty" numeric(8,2),
    "StockedQty" numeric(9,2),
    "ModifiedDate" timestamp with time zone,
    CONSTRAINT pk_purchaseorderdetail_purchaseorderid_purchaseorderdetailid PRIMARY KEY("PurchaseOrderID" ASC, "PurchaseOrderDetailID" ASC)
);


ALTER TABLE purchasing.purchaseorderdetail OWNER TO postgres;

--
-- Name: purchaseorderdetail_PurchaseOrderDetailID_seq; Type: SEQUENCE; Schema: purchasing; Owner: postgres
--

CREATE SEQUENCE purchasing."purchaseorderdetail_PurchaseOrderDetailID_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE purchasing."purchaseorderdetail_PurchaseOrderDetailID_seq" OWNER TO postgres;

--
-- Name: purchaseorderdetail_PurchaseOrderDetailID_seq; Type: SEQUENCE OWNED BY; Schema: purchasing; Owner: postgres
--

ALTER SEQUENCE purchasing."purchaseorderdetail_PurchaseOrderDetailID_seq" OWNED BY purchasing.purchaseorderdetail."PurchaseOrderDetailID";


--
-- Name: purchaseorderheader; Type: TABLE; Schema: purchasing; Owner: postgres
--

CREATE TABLE purchasing.purchaseorderheader (
    "PurchaseOrderID" integer NOT NULL,
    "RevisionNumber" smallint DEFAULT 0,
    "Status" smallint DEFAULT 1,
    "EmployeeID" integer,
    "VendorID" integer,
    "ShipMethodID" integer,
    "OrderDate" timestamp with time zone,
    "ShipDate" timestamp with time zone,
    "SubTotal" money,
    "TaxAmt" money,
    "Freight" money,
    "TotalDue" money,
    "ModifiedDate" timestamp with time zone,
    CONSTRAINT pk_purchaseorderheader_purchaseorderid PRIMARY KEY("PurchaseOrderID" ASC)
);


ALTER TABLE purchasing.purchaseorderheader OWNER TO postgres;

--
-- Name: purchaseorderheader_PurchaseOrderID_seq; Type: SEQUENCE; Schema: purchasing; Owner: postgres
--

CREATE SEQUENCE purchasing."purchaseorderheader_PurchaseOrderID_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE purchasing."purchaseorderheader_PurchaseOrderID_seq" OWNER TO postgres;

--
-- Name: purchaseorderheader_PurchaseOrderID_seq; Type: SEQUENCE OWNED BY; Schema: purchasing; Owner: postgres
--

ALTER SEQUENCE purchasing."purchaseorderheader_PurchaseOrderID_seq" OWNED BY purchasing.purchaseorderheader."PurchaseOrderID";


--
-- Name: shipmethod; Type: TABLE; Schema: purchasing; Owner: postgres
--

CREATE TABLE purchasing.shipmethod (
    "ShipMethodID" integer NOT NULL,
    "Name" character varying(50),
    "ShipBase" money,
    "ShipRate" money,
    rowguid uuid,
    "ModifiedDate" timestamp with time zone,
    CONSTRAINT pk_shipmethod_shipmethodid PRIMARY KEY("ShipMethodID" ASC)
);


ALTER TABLE purchasing.shipmethod OWNER TO postgres;

--
-- Name: shipmethod_ShipMethodID_seq; Type: SEQUENCE; Schema: purchasing; Owner: postgres
--

CREATE SEQUENCE purchasing."shipmethod_ShipMethodID_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE purchasing."shipmethod_ShipMethodID_seq" OWNER TO postgres;

--
-- Name: shipmethod_ShipMethodID_seq; Type: SEQUENCE OWNED BY; Schema: purchasing; Owner: postgres
--

ALTER SEQUENCE purchasing."shipmethod_ShipMethodID_seq" OWNED BY purchasing.shipmethod."ShipMethodID";


--
-- Name: vendor; Type: TABLE; Schema: purchasing; Owner: postgres
--

CREATE TABLE purchasing.vendor (
    "BusinessEntityID" integer NOT NULL,
    "AccountNumber" character varying(15),
    "Name" character varying(50),
    "CreditRating" smallint,
    "PreferredVendorStatus" boolean DEFAULT true,
    "ActiveFlag" boolean DEFAULT true,
    "PurchasingWebServiceURL" character varying(1024),
    "ModifiedDate" timestamp with time zone,
    CONSTRAINT pk_vendor_businessentityid PRIMARY KEY("BusinessEntityID" ASC)
);


ALTER TABLE purchasing.vendor OWNER TO postgres;

--
-- Name: countryregioncurrency; Type: TABLE; Schema: sales; Owner: postgres
--

CREATE TABLE sales.countryregioncurrency (
    "CountryRegionCode" character varying(3) NOT NULL,
    "CurrencyCode" character varying(3) NOT NULL,
    "ModifiedDate" timestamp with time zone,
    CONSTRAINT pk_countryregioncurrency_countryregioncode_currencycode PRIMARY KEY("CountryRegionCode" ASC, "CurrencyCode" ASC)
);


ALTER TABLE sales.countryregioncurrency OWNER TO postgres;

--
-- Name: creditcard; Type: TABLE; Schema: sales; Owner: postgres
--

CREATE TABLE sales.creditcard (
    "CreditCardID" integer NOT NULL,
    "CardType" character varying(50),
    "CardNumber" character varying(25),
    "ExpMonth" smallint,
    "ExpYear" smallint,
    "ModifiedDate" timestamp with time zone,
    CONSTRAINT pk_creditcard_creditcardid PRIMARY KEY("CreditCardID" ASC)
);


ALTER TABLE sales.creditcard OWNER TO postgres;

--
-- Name: creditcard_CreditCardID_seq; Type: SEQUENCE; Schema: sales; Owner: postgres
--

CREATE SEQUENCE sales."creditcard_CreditCardID_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE sales."creditcard_CreditCardID_seq" OWNER TO postgres;

--
-- Name: creditcard_CreditCardID_seq; Type: SEQUENCE OWNED BY; Schema: sales; Owner: postgres
--

ALTER SEQUENCE sales."creditcard_CreditCardID_seq" OWNED BY sales.creditcard."CreditCardID";


--
-- Name: currency; Type: TABLE; Schema: sales; Owner: postgres
--

CREATE TABLE sales.currency (
    "CurrencyCode" character varying(3) NOT NULL,
    "Name" character varying(50),
    "ModifiedDate" timestamp with time zone,
    CONSTRAINT pk_currency_currencycode PRIMARY KEY("CurrencyCode" ASC)
);


ALTER TABLE sales.currency OWNER TO postgres;

--
-- Name: currencyrate; Type: TABLE; Schema: sales; Owner: postgres
--

CREATE TABLE sales.currencyrate (
    "CurrencyRateID" integer NOT NULL,
    "CurrencyRateDate" timestamp with time zone,
    "FromCurrencyCode" character varying(3),
    "ToCurrencyCode" character varying(3),
    "AverageRate" money,
    "EndOfDayRate" money,
    "ModifiedDate" timestamp with time zone,
    CONSTRAINT pk_currencyrate_currencyrateid PRIMARY KEY("CurrencyRateID" ASC)
);


ALTER TABLE sales.currencyrate OWNER TO postgres;

--
-- Name: currencyrate_CurrencyRateID_seq; Type: SEQUENCE; Schema: sales; Owner: postgres
--

CREATE SEQUENCE sales."currencyrate_CurrencyRateID_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE sales."currencyrate_CurrencyRateID_seq" OWNER TO postgres;

--
-- Name: currencyrate_CurrencyRateID_seq; Type: SEQUENCE OWNED BY; Schema: sales; Owner: postgres
--

ALTER SEQUENCE sales."currencyrate_CurrencyRateID_seq" OWNED BY sales.currencyrate."CurrencyRateID";


--
-- Name: customer; Type: TABLE; Schema: sales; Owner: postgres
--

CREATE TABLE sales.customer (
    "CustomerID" integer NOT NULL,
    "PersonID" integer,
    "StoreID" integer,
    "TerritoryID" integer,
    "AccountNumber" character varying(10),
    rowguid uuid,
    "ModifiedDate" timestamp with time zone,
    CONSTRAINT pk_customer_customerid PRIMARY KEY("CustomerID" ASC)
);


ALTER TABLE sales.customer OWNER TO postgres;

--
-- Name: customer_CustomerID_seq; Type: SEQUENCE; Schema: sales; Owner: postgres
--

CREATE SEQUENCE sales."customer_CustomerID_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE sales."customer_CustomerID_seq" OWNER TO postgres;

--
-- Name: customer_CustomerID_seq; Type: SEQUENCE OWNED BY; Schema: sales; Owner: postgres
--

ALTER SEQUENCE sales."customer_CustomerID_seq" OWNED BY sales.customer."CustomerID";


--
-- Name: personcreditcard; Type: TABLE; Schema: sales; Owner: postgres
--

CREATE TABLE sales.personcreditcard (
    "BusinessEntityID" integer NOT NULL,
    "CreditCardID" integer NOT NULL,
    "ModifiedDate" timestamp with time zone,
    CONSTRAINT pk_personcreditcard_businessentityid_creditcardid PRIMARY KEY("BusinessEntityID" ASC, "CreditCardID" ASC)
);


ALTER TABLE sales.personcreditcard OWNER TO postgres;

--
-- Name: salesorderdetail; Type: TABLE; Schema: sales; Owner: postgres
--

CREATE TABLE sales.salesorderdetail (
    "SalesOrderID" integer NOT NULL,
    "SalesOrderDetailID" integer NOT NULL,
    "CarrierTrackingNumber" character varying(25),
    "OrderQty" smallint,
    "ProductID" integer,
    "SpecialOfferID" integer,
    "UnitPrice" money,
    "UnitPriceDiscount" money,
    "LineTotal" numeric,
    rowguid uuid,
    "ModifiedDate" timestamp with time zone,
    CONSTRAINT pk_salesorderdetail_salesorderid_salesorderdetailid PRIMARY KEY("SalesOrderID" ASC, "SalesOrderDetailID" ASC)
);


ALTER TABLE sales.salesorderdetail OWNER TO postgres;

--
-- Name: salesorderdetail_SalesOrderDetailID_seq; Type: SEQUENCE; Schema: sales; Owner: postgres
--

CREATE SEQUENCE sales."salesorderdetail_SalesOrderDetailID_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE sales."salesorderdetail_SalesOrderDetailID_seq" OWNER TO postgres;

--
-- Name: salesorderdetail_SalesOrderDetailID_seq; Type: SEQUENCE OWNED BY; Schema: sales; Owner: postgres
--

ALTER SEQUENCE sales."salesorderdetail_SalesOrderDetailID_seq" OWNED BY sales.salesorderdetail."SalesOrderDetailID";


--
-- Name: salesorderheader; Type: TABLE; Schema: sales; Owner: postgres
--

CREATE TABLE sales.salesorderheader (
    "SalesOrderID" integer NOT NULL,
    "RevisionNumber" smallint DEFAULT 0,
    "OrderDate" timestamp with time zone,
    "DueDate" timestamp with time zone,
    "ShipDate" timestamp with time zone,
    "Status" smallint DEFAULT 1,
    "OnlineOrderFlag" boolean DEFAULT true,
    "SalesOrderNumber" character varying(25),
    "PurchaseOrderNumber" character varying(25),
    "AccountNumber" character varying(15),
    "CustomerID" integer,
    "SalesPersonID" integer,
    "TerritoryID" integer,
    "BillToAddressID" integer,
    "ShipToAddressID" integer,
    "ShipMethodID" integer,
    "CreditCardID" integer,
    "CreditCardApprovalCode" character varying(15),
    "CurrencyRateID" integer,
    "SubTotal" money,
    "TaxAmt" money,
    "Freight" money,
    "TotalDue" money,
    "Comment" character varying(128),
    rowguid uuid,
    "ModifiedDate" timestamp with time zone,
    CONSTRAINT pk_salesorderheader_salesorderid PRIMARY KEY("SalesOrderID" ASC)
);


ALTER TABLE sales.salesorderheader OWNER TO postgres;

--
-- Name: salesorderheader_SalesOrderID_seq; Type: SEQUENCE; Schema: sales; Owner: postgres
--

CREATE SEQUENCE sales."salesorderheader_SalesOrderID_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE sales."salesorderheader_SalesOrderID_seq" OWNER TO postgres;

--
-- Name: salesorderheader_SalesOrderID_seq; Type: SEQUENCE OWNED BY; Schema: sales; Owner: postgres
--

ALTER SEQUENCE sales."salesorderheader_SalesOrderID_seq" OWNED BY sales.salesorderheader."SalesOrderID";


--
-- Name: salesorderheadersalesreason; Type: TABLE; Schema: sales; Owner: postgres
--

CREATE TABLE sales.salesorderheadersalesreason (
    "SalesOrderID" integer NOT NULL,
    "SalesReasonID" integer NOT NULL,
    "ModifiedDate" timestamp with time zone,
    CONSTRAINT pk_salesorderheadersalesreason_salesorderid_salesreasonid PRIMARY KEY("SalesOrderID" ASC, "SalesReasonID" ASC)
);


ALTER TABLE sales.salesorderheadersalesreason OWNER TO postgres;

--
-- Name: salesperson; Type: TABLE; Schema: sales; Owner: postgres
--

CREATE TABLE sales.salesperson (
    "BusinessEntityID" integer NOT NULL,
    "TerritoryID" integer,
    "SalesQuota" money,
    "Bonus" money,
    "CommissionPct" money,
    "SalesYTD" money,
    "SalesLastYear" money,
    rowguid uuid,
    "ModifiedDate" timestamp with time zone,
    CONSTRAINT pk_salesperson_businessentityid PRIMARY KEY("BusinessEntityID" ASC)
);


ALTER TABLE sales.salesperson OWNER TO postgres;

--
-- Name: salespersonquotahistory; Type: TABLE; Schema: sales; Owner: postgres
--

CREATE TABLE sales.salespersonquotahistory (
    "BusinessEntityID" integer NOT NULL,
    "QuotaDate" timestamp with time zone NOT NULL,
    "SalesQuota" money,
    rowguid uuid,
    "ModifiedDate" timestamp with time zone,
    CONSTRAINT pk_salespersonquotahistory_businessentityid_quotadate PRIMARY KEY("BusinessEntityID" ASC, "QuotaDate" ASC)
);


ALTER TABLE sales.salespersonquotahistory OWNER TO postgres;

--
-- Name: salesreason; Type: TABLE; Schema: sales; Owner: postgres
--

CREATE TABLE sales.salesreason (
    "SalesReasonID" integer NOT NULL,
    "Name" character varying(50),
    "ReasonType" character varying(50),
    "ModifiedDate" timestamp with time zone,
    CONSTRAINT pk_salesreason_salesreasonid PRIMARY KEY("SalesReasonID" ASC)
);


ALTER TABLE sales.salesreason OWNER TO postgres;

--
-- Name: salesreason_SalesReasonID_seq; Type: SEQUENCE; Schema: sales; Owner: postgres
--

CREATE SEQUENCE sales."salesreason_SalesReasonID_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE sales."salesreason_SalesReasonID_seq" OWNER TO postgres;

--
-- Name: salesreason_SalesReasonID_seq; Type: SEQUENCE OWNED BY; Schema: sales; Owner: postgres
--

ALTER SEQUENCE sales."salesreason_SalesReasonID_seq" OWNED BY sales.salesreason."SalesReasonID";


--
-- Name: salestaxrate; Type: TABLE; Schema: sales; Owner: postgres
--

CREATE TABLE sales.salestaxrate (
    "SalesTaxRateID" integer NOT NULL,
    "StateProvinceID" integer,
    "TaxType" smallint,
    "TaxRate" money,
    "Name" character varying(50),
    rowguid uuid,
    "ModifiedDate" timestamp with time zone,
    CONSTRAINT pk_salestaxrate_salestaxrateid PRIMARY KEY("SalesTaxRateID" ASC)
);


ALTER TABLE sales.salestaxrate OWNER TO postgres;

--
-- Name: salestaxrate_SalesTaxRateID_seq; Type: SEQUENCE; Schema: sales; Owner: postgres
--

CREATE SEQUENCE sales."salestaxrate_SalesTaxRateID_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE sales."salestaxrate_SalesTaxRateID_seq" OWNER TO postgres;

--
-- Name: salestaxrate_SalesTaxRateID_seq; Type: SEQUENCE OWNED BY; Schema: sales; Owner: postgres
--

ALTER SEQUENCE sales."salestaxrate_SalesTaxRateID_seq" OWNED BY sales.salestaxrate."SalesTaxRateID";


--
-- Name: salesterritory; Type: TABLE; Schema: sales; Owner: postgres
--

CREATE TABLE sales.salesterritory (
    "TerritoryID" integer NOT NULL,
    "Name" character varying(50),
    "CountryRegionCode" character varying(3),
    "Group" character varying(50),
    "SalesYTD" money,
    "SalesLastYear" money,
    "CostYTD" money,
    "CostLastYear" money,
    rowguid uuid,
    "ModifiedDate" timestamp with time zone,
    CONSTRAINT pk_salesterritory_territoryid PRIMARY KEY("TerritoryID" ASC)
);


ALTER TABLE sales.salesterritory OWNER TO postgres;

--
-- Name: salesterritory_TerritoryID_seq; Type: SEQUENCE; Schema: sales; Owner: postgres
--

CREATE SEQUENCE sales."salesterritory_TerritoryID_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE sales."salesterritory_TerritoryID_seq" OWNER TO postgres;

--
-- Name: salesterritory_TerritoryID_seq; Type: SEQUENCE OWNED BY; Schema: sales; Owner: postgres
--

ALTER SEQUENCE sales."salesterritory_TerritoryID_seq" OWNED BY sales.salesterritory."TerritoryID";


--
-- Name: salesterritoryhistory; Type: TABLE; Schema: sales; Owner: postgres
--

CREATE TABLE sales.salesterritoryhistory (
    "BusinessEntityID" integer NOT NULL,
    "TerritoryID" integer NOT NULL,
    "StartDate" timestamp with time zone NOT NULL,
    "EndDate" timestamp with time zone,
    rowguid uuid,
    "ModifiedDate" timestamp with time zone,
    CONSTRAINT pk_salesterritoryhistory_businessentityid_startdate_territoryid PRIMARY KEY("BusinessEntityID" ASC, "TerritoryID" ASC, "StartDate" ASC)
);


ALTER TABLE sales.salesterritoryhistory OWNER TO postgres;

--
-- Name: shoppingcartitem; Type: TABLE; Schema: sales; Owner: postgres
--

CREATE TABLE sales.shoppingcartitem (
    "ShoppingCartItemID" integer NOT NULL,
    "ShoppingCartID" character varying(50),
    "Quantity" integer,
    "ProductID" integer,
    "DateCreated" timestamp with time zone,
    "ModifiedDate" timestamp with time zone,
    CONSTRAINT pk_shoppingcartitem_shoppingcartitemid PRIMARY KEY("ShoppingCartItemID" ASC)
);


ALTER TABLE sales.shoppingcartitem OWNER TO postgres;

--
-- Name: shoppingcartitem_ShoppingCartItemID_seq; Type: SEQUENCE; Schema: sales; Owner: postgres
--

CREATE SEQUENCE sales."shoppingcartitem_ShoppingCartItemID_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE sales."shoppingcartitem_ShoppingCartItemID_seq" OWNER TO postgres;

--
-- Name: shoppingcartitem_ShoppingCartItemID_seq; Type: SEQUENCE OWNED BY; Schema: sales; Owner: postgres
--

ALTER SEQUENCE sales."shoppingcartitem_ShoppingCartItemID_seq" OWNED BY sales.shoppingcartitem."ShoppingCartItemID";


--
-- Name: specialoffer; Type: TABLE; Schema: sales; Owner: postgres
--

CREATE TABLE sales.specialoffer (
    "SpecialOfferID" integer NOT NULL,
    "Description" character varying(255),
    "DiscountPct" money,
    "Type" character varying(50),
    "Category" character varying(50),
    "StartDate" timestamp with time zone,
    "EndDate" timestamp with time zone,
    "MinQty" integer,
    "MaxQty" integer,
    rowguid uuid,
    "ModifiedDate" timestamp with time zone,
    CONSTRAINT pk_specialoffer_specialofferid PRIMARY KEY("SpecialOfferID" ASC)
);


ALTER TABLE sales.specialoffer OWNER TO postgres;

--
-- Name: specialoffer_SpecialOfferID_seq; Type: SEQUENCE; Schema: sales; Owner: postgres
--

CREATE SEQUENCE sales."specialoffer_SpecialOfferID_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE sales."specialoffer_SpecialOfferID_seq" OWNER TO postgres;

--
-- Name: specialoffer_SpecialOfferID_seq; Type: SEQUENCE OWNED BY; Schema: sales; Owner: postgres
--

ALTER SEQUENCE sales."specialoffer_SpecialOfferID_seq" OWNED BY sales.specialoffer."SpecialOfferID";


--
-- Name: specialofferproduct; Type: TABLE; Schema: sales; Owner: postgres
--

CREATE TABLE sales.specialofferproduct (
    "SpecialOfferID" integer NOT NULL,
    "ProductID" integer NOT NULL,
    rowguid uuid,
    "ModifiedDate" timestamp with time zone,
    CONSTRAINT pk_specialofferproduct_specialofferid_productid PRIMARY KEY("SpecialOfferID" ASC, "ProductID" ASC)
);


ALTER TABLE sales.specialofferproduct OWNER TO postgres;

--
-- Name: store; Type: TABLE; Schema: sales; Owner: postgres
--

CREATE TABLE sales.store (
    "BusinessEntityID" integer NOT NULL,
    "Name" character varying(50),
    "SalesPersonID" integer,
    "Demographics" text,
    rowguid uuid,
    "ModifiedDate" timestamp with time zone,
    CONSTRAINT pk_store_businessentityid PRIMARY KEY("BusinessEntityID" ASC)
);


ALTER TABLE sales.store OWNER TO postgres;

--
-- Name: databaselog DatabaseLogID; Type: DEFAULT; Schema: dbo; Owner: postgres
--

ALTER TABLE ONLY dbo.databaselog ALTER COLUMN "DatabaseLogID" SET DEFAULT nextval('dbo."databaselog_DatabaseLogID_seq"'::regclass);


--
-- Name: errorlog ErrorLogID; Type: DEFAULT; Schema: dbo; Owner: postgres
--

ALTER TABLE ONLY dbo.errorlog ALTER COLUMN "ErrorLogID" SET DEFAULT nextval('dbo."errorlog_ErrorLogID_seq"'::regclass);


--
-- Name: department DepartmentID; Type: DEFAULT; Schema: humanresources; Owner: postgres
--

ALTER TABLE ONLY humanresources.department ALTER COLUMN "DepartmentID" SET DEFAULT nextval('humanresources."department_DepartmentID_seq"'::regclass);


--
-- Name: jobcandidate JobCandidateID; Type: DEFAULT; Schema: humanresources; Owner: postgres
--

ALTER TABLE ONLY humanresources.jobcandidate ALTER COLUMN "JobCandidateID" SET DEFAULT nextval('humanresources."jobcandidate_JobCandidateID_seq"'::regclass);


--
-- Name: address AddressID; Type: DEFAULT; Schema: person; Owner: postgres
--

ALTER TABLE ONLY person.address ALTER COLUMN "AddressID" SET DEFAULT nextval('person."address_AddressID_seq"'::regclass);


--
-- Name: addresstype AddressTypeID; Type: DEFAULT; Schema: person; Owner: postgres
--

ALTER TABLE ONLY person.addresstype ALTER COLUMN "AddressTypeID" SET DEFAULT nextval('person."addresstype_AddressTypeID_seq"'::regclass);


--
-- Name: businessentity BusinessEntityID; Type: DEFAULT; Schema: person; Owner: postgres
--

ALTER TABLE ONLY person.businessentity ALTER COLUMN "BusinessEntityID" SET DEFAULT nextval('person."businessentity_BusinessEntityID_seq"'::regclass);


--
-- Name: contacttype ContactTypeID; Type: DEFAULT; Schema: person; Owner: postgres
--

ALTER TABLE ONLY person.contacttype ALTER COLUMN "ContactTypeID" SET DEFAULT nextval('person."contacttype_ContactTypeID_seq"'::regclass);


--
-- Name: emailaddress EmailAddressID; Type: DEFAULT; Schema: person; Owner: postgres
--

ALTER TABLE ONLY person.emailaddress ALTER COLUMN "EmailAddressID" SET DEFAULT nextval('person."emailaddress_EmailAddressID_seq"'::regclass);


--
-- Name: phonenumbertype PhoneNumberTypeID; Type: DEFAULT; Schema: person; Owner: postgres
--

ALTER TABLE ONLY person.phonenumbertype ALTER COLUMN "PhoneNumberTypeID" SET DEFAULT nextval('person."phonenumbertype_PhoneNumberTypeID_seq"'::regclass);


--
-- Name: stateprovince StateProvinceID; Type: DEFAULT; Schema: person; Owner: postgres
--

ALTER TABLE ONLY person.stateprovince ALTER COLUMN "StateProvinceID" SET DEFAULT nextval('person."stateprovince_StateProvinceID_seq"'::regclass);


--
-- Name: billofmaterials BillOfMaterialsID; Type: DEFAULT; Schema: production; Owner: postgres
--

ALTER TABLE ONLY production.billofmaterials ALTER COLUMN "BillOfMaterialsID" SET DEFAULT nextval('production."billofmaterials_BillOfMaterialsID_seq"'::regclass);


--
-- Name: illustration IllustrationID; Type: DEFAULT; Schema: production; Owner: postgres
--

ALTER TABLE ONLY production.illustration ALTER COLUMN "IllustrationID" SET DEFAULT nextval('production."illustration_IllustrationID_seq"'::regclass);


--
-- Name: location LocationID; Type: DEFAULT; Schema: production; Owner: postgres
--

ALTER TABLE ONLY production.location ALTER COLUMN "LocationID" SET DEFAULT nextval('production."location_LocationID_seq"'::regclass);


--
-- Name: product ProductID; Type: DEFAULT; Schema: production; Owner: postgres
--

ALTER TABLE ONLY production.product ALTER COLUMN "ProductID" SET DEFAULT nextval('production."product_ProductID_seq"'::regclass);


--
-- Name: productcategory ProductCategoryID; Type: DEFAULT; Schema: production; Owner: postgres
--

ALTER TABLE ONLY production.productcategory ALTER COLUMN "ProductCategoryID" SET DEFAULT nextval('production."productcategory_ProductCategoryID_seq"'::regclass);


--
-- Name: productdescription ProductDescriptionID; Type: DEFAULT; Schema: production; Owner: postgres
--

ALTER TABLE ONLY production.productdescription ALTER COLUMN "ProductDescriptionID" SET DEFAULT nextval('production."productdescription_ProductDescriptionID_seq"'::regclass);


--
-- Name: productmodel ProductModelID; Type: DEFAULT; Schema: production; Owner: postgres
--

ALTER TABLE ONLY production.productmodel ALTER COLUMN "ProductModelID" SET DEFAULT nextval('production."productmodel_ProductModelID_seq"'::regclass);


--
-- Name: productphoto ProductPhotoID; Type: DEFAULT; Schema: production; Owner: postgres
--

ALTER TABLE ONLY production.productphoto ALTER COLUMN "ProductPhotoID" SET DEFAULT nextval('production."productphoto_ProductPhotoID_seq"'::regclass);


--
-- Name: productreview ProductReviewID; Type: DEFAULT; Schema: production; Owner: postgres
--

ALTER TABLE ONLY production.productreview ALTER COLUMN "ProductReviewID" SET DEFAULT nextval('production."productreview_ProductReviewID_seq"'::regclass);


--
-- Name: productsubcategory ProductSubcategoryID; Type: DEFAULT; Schema: production; Owner: postgres
--

ALTER TABLE ONLY production.productsubcategory ALTER COLUMN "ProductSubcategoryID" SET DEFAULT nextval('production."productsubcategory_ProductSubcategoryID_seq"'::regclass);


--
-- Name: scrapreason ScrapReasonID; Type: DEFAULT; Schema: production; Owner: postgres
--

ALTER TABLE ONLY production.scrapreason ALTER COLUMN "ScrapReasonID" SET DEFAULT nextval('production."scrapreason_ScrapReasonID_seq"'::regclass);


--
-- Name: transactionhistory TransactionID; Type: DEFAULT; Schema: production; Owner: postgres
--

ALTER TABLE ONLY production.transactionhistory ALTER COLUMN "TransactionID" SET DEFAULT nextval('production."transactionhistory_TransactionID_seq"'::regclass);


--
-- Name: workorder WorkOrderID; Type: DEFAULT; Schema: production; Owner: postgres
--

ALTER TABLE ONLY production.workorder ALTER COLUMN "WorkOrderID" SET DEFAULT nextval('production."workorder_WorkOrderID_seq"'::regclass);


--
-- Name: purchaseorderdetail PurchaseOrderDetailID; Type: DEFAULT; Schema: purchasing; Owner: postgres
--

ALTER TABLE ONLY purchasing.purchaseorderdetail ALTER COLUMN "PurchaseOrderDetailID" SET DEFAULT nextval('purchasing."purchaseorderdetail_PurchaseOrderDetailID_seq"'::regclass);


--
-- Name: purchaseorderheader PurchaseOrderID; Type: DEFAULT; Schema: purchasing; Owner: postgres
--

ALTER TABLE ONLY purchasing.purchaseorderheader ALTER COLUMN "PurchaseOrderID" SET DEFAULT nextval('purchasing."purchaseorderheader_PurchaseOrderID_seq"'::regclass);


--
-- Name: shipmethod ShipMethodID; Type: DEFAULT; Schema: purchasing; Owner: postgres
--

ALTER TABLE ONLY purchasing.shipmethod ALTER COLUMN "ShipMethodID" SET DEFAULT nextval('purchasing."shipmethod_ShipMethodID_seq"'::regclass);


--
-- Name: creditcard CreditCardID; Type: DEFAULT; Schema: sales; Owner: postgres
--

ALTER TABLE ONLY sales.creditcard ALTER COLUMN "CreditCardID" SET DEFAULT nextval('sales."creditcard_CreditCardID_seq"'::regclass);


--
-- Name: currencyrate CurrencyRateID; Type: DEFAULT; Schema: sales; Owner: postgres
--

ALTER TABLE ONLY sales.currencyrate ALTER COLUMN "CurrencyRateID" SET DEFAULT nextval('sales."currencyrate_CurrencyRateID_seq"'::regclass);


--
-- Name: customer CustomerID; Type: DEFAULT; Schema: sales; Owner: postgres
--

ALTER TABLE ONLY sales.customer ALTER COLUMN "CustomerID" SET DEFAULT nextval('sales."customer_CustomerID_seq"'::regclass);


--
-- Name: salesorderdetail SalesOrderDetailID; Type: DEFAULT; Schema: sales; Owner: postgres
--

ALTER TABLE ONLY sales.salesorderdetail ALTER COLUMN "SalesOrderDetailID" SET DEFAULT nextval('sales."salesorderdetail_SalesOrderDetailID_seq"'::regclass);


--
-- Name: salesorderheader SalesOrderID; Type: DEFAULT; Schema: sales; Owner: postgres
--

ALTER TABLE ONLY sales.salesorderheader ALTER COLUMN "SalesOrderID" SET DEFAULT nextval('sales."salesorderheader_SalesOrderID_seq"'::regclass);


--
-- Name: salesreason SalesReasonID; Type: DEFAULT; Schema: sales; Owner: postgres
--

ALTER TABLE ONLY sales.salesreason ALTER COLUMN "SalesReasonID" SET DEFAULT nextval('sales."salesreason_SalesReasonID_seq"'::regclass);


--
-- Name: salestaxrate SalesTaxRateID; Type: DEFAULT; Schema: sales; Owner: postgres
--

ALTER TABLE ONLY sales.salestaxrate ALTER COLUMN "SalesTaxRateID" SET DEFAULT nextval('sales."salestaxrate_SalesTaxRateID_seq"'::regclass);


--
-- Name: salesterritory TerritoryID; Type: DEFAULT; Schema: sales; Owner: postgres
--

ALTER TABLE ONLY sales.salesterritory ALTER COLUMN "TerritoryID" SET DEFAULT nextval('sales."salesterritory_TerritoryID_seq"'::regclass);


--
-- Name: shoppingcartitem ShoppingCartItemID; Type: DEFAULT; Schema: sales; Owner: postgres
--

ALTER TABLE ONLY sales.shoppingcartitem ALTER COLUMN "ShoppingCartItemID" SET DEFAULT nextval('sales."shoppingcartitem_ShoppingCartItemID_seq"'::regclass);


--
-- Name: specialoffer SpecialOfferID; Type: DEFAULT; Schema: sales; Owner: postgres
--

ALTER TABLE ONLY sales.specialoffer ALTER COLUMN "SpecialOfferID" SET DEFAULT nextval('sales."specialoffer_SpecialOfferID_seq"'::regclass);


--
-- Name: document uq__document__f73921f7c5112c2e; Type: CONSTRAINT; Schema: production; Owner: postgres
--

ALTER TABLE ONLY production.document
    ADD CONSTRAINT uq__document__f73921f7c5112c2e UNIQUE (rowguid);


--
-- Name: idx_ak_department_name; Type: INDEX; Schema: humanresources; Owner: postgres
--

CREATE UNIQUE INDEX idx_ak_department_name ON humanresources.department USING btree ("Name");


--
-- Name: idx_ak_employee_loginid; Type: INDEX; Schema: humanresources; Owner: postgres
--

CREATE UNIQUE INDEX idx_ak_employee_loginid ON humanresources.employee USING btree ("LoginID");


--
-- Name: idx_ak_employee_nationalidnumber; Type: INDEX; Schema: humanresources; Owner: postgres
--

CREATE UNIQUE INDEX idx_ak_employee_nationalidnumber ON humanresources.employee USING btree ("NationalIDNumber");


--
-- Name: idx_ak_employee_rowguid; Type: INDEX; Schema: humanresources; Owner: postgres
--

CREATE UNIQUE INDEX idx_ak_employee_rowguid ON humanresources.employee USING btree (rowguid);


--
-- Name: idx_ak_shift_name; Type: INDEX; Schema: humanresources; Owner: postgres
--

CREATE UNIQUE INDEX idx_ak_shift_name ON humanresources.shift USING btree ("Name");


--
-- Name: idx_ak_shift_starttime_endtime; Type: INDEX; Schema: humanresources; Owner: postgres
--

CREATE UNIQUE INDEX idx_ak_shift_starttime_endtime ON humanresources.shift USING btree ("StartTime", "EndTime");


--
-- Name: idx_ix_employee_organizationlevel_organizationnode; Type: INDEX; Schema: humanresources; Owner: postgres
--

CREATE INDEX idx_ix_employee_organizationlevel_organizationnode ON humanresources.employee USING btree ("OrganizationLevel", "OrganizationNode");


--
-- Name: idx_ix_employee_organizationnode; Type: INDEX; Schema: humanresources; Owner: postgres
--

CREATE INDEX idx_ix_employee_organizationnode ON humanresources.employee USING btree ("OrganizationNode");


--
-- Name: idx_ix_employeedepartmenthistory_departmentid; Type: INDEX; Schema: humanresources; Owner: postgres
--

CREATE INDEX idx_ix_employeedepartmenthistory_departmentid ON humanresources.employeedepartmenthistory USING btree ("DepartmentID");


--
-- Name: idx_ix_employeedepartmenthistory_shiftid; Type: INDEX; Schema: humanresources; Owner: postgres
--

CREATE INDEX idx_ix_employeedepartmenthistory_shiftid ON humanresources.employeedepartmenthistory USING btree ("ShiftID");


--
-- Name: idx_ix_jobcandidate_businessentityid; Type: INDEX; Schema: humanresources; Owner: postgres
--

CREATE INDEX idx_ix_jobcandidate_businessentityid ON humanresources.jobcandidate USING btree ("BusinessEntityID");


--
-- Name: idx_ak_address_rowguid; Type: INDEX; Schema: person; Owner: postgres
--

CREATE UNIQUE INDEX idx_ak_address_rowguid ON person.address USING btree (rowguid);


--
-- Name: idx_ak_addresstype_name; Type: INDEX; Schema: person; Owner: postgres
--

CREATE UNIQUE INDEX idx_ak_addresstype_name ON person.addresstype USING btree ("Name");


--
-- Name: idx_ak_addresstype_rowguid; Type: INDEX; Schema: person; Owner: postgres
--

CREATE UNIQUE INDEX idx_ak_addresstype_rowguid ON person.addresstype USING btree (rowguid);


--
-- Name: idx_ak_businessentity_rowguid; Type: INDEX; Schema: person; Owner: postgres
--

CREATE UNIQUE INDEX idx_ak_businessentity_rowguid ON person.businessentity USING btree (rowguid);


--
-- Name: idx_ak_businessentityaddress_rowguid; Type: INDEX; Schema: person; Owner: postgres
--

CREATE UNIQUE INDEX idx_ak_businessentityaddress_rowguid ON person.businessentityaddress USING btree (rowguid);


--
-- Name: idx_ak_businessentitycontact_rowguid; Type: INDEX; Schema: person; Owner: postgres
--

CREATE UNIQUE INDEX idx_ak_businessentitycontact_rowguid ON person.businessentitycontact USING btree (rowguid);


--
-- Name: idx_ak_contacttype_name; Type: INDEX; Schema: person; Owner: postgres
--

CREATE UNIQUE INDEX idx_ak_contacttype_name ON person.contacttype USING btree ("Name");


--
-- Name: idx_ak_countryregion_name; Type: INDEX; Schema: person; Owner: postgres
--

CREATE UNIQUE INDEX idx_ak_countryregion_name ON person.countryregion USING btree ("Name");


--
-- Name: idx_ak_person_rowguid; Type: INDEX; Schema: person; Owner: postgres
--

CREATE UNIQUE INDEX idx_ak_person_rowguid ON person.person USING btree (rowguid);


--
-- Name: idx_ak_stateprovince_name; Type: INDEX; Schema: person; Owner: postgres
--

CREATE UNIQUE INDEX idx_ak_stateprovince_name ON person.stateprovince USING btree ("Name");


--
-- Name: idx_ak_stateprovince_rowguid; Type: INDEX; Schema: person; Owner: postgres
--

CREATE UNIQUE INDEX idx_ak_stateprovince_rowguid ON person.stateprovince USING btree (rowguid);


--
-- Name: idx_ak_stateprovince_stateprovincecode_countryregioncode; Type: INDEX; Schema: person; Owner: postgres
--

CREATE UNIQUE INDEX idx_ak_stateprovince_stateprovincecode_countryregioncode ON person.stateprovince USING btree ("StateProvinceCode", "CountryRegionCode");


--
-- Name: idx_ix_address_addressline1_addressline2_city_stateprovinceid_p; Type: INDEX; Schema: person; Owner: postgres
--

CREATE UNIQUE INDEX idx_ix_address_addressline1_addressline2_city_stateprovinceid_p ON person.address USING btree ("AddressLine1", "AddressLine2", "City", "StateProvinceID", "PostalCode");


--
-- Name: idx_ix_address_stateprovinceid; Type: INDEX; Schema: person; Owner: postgres
--

CREATE INDEX idx_ix_address_stateprovinceid ON person.address USING btree ("StateProvinceID");


--
-- Name: idx_ix_businessentityaddress_addressid; Type: INDEX; Schema: person; Owner: postgres
--

CREATE INDEX idx_ix_businessentityaddress_addressid ON person.businessentityaddress USING btree ("AddressID");


--
-- Name: idx_ix_businessentityaddress_addresstypeid; Type: INDEX; Schema: person; Owner: postgres
--

CREATE INDEX idx_ix_businessentityaddress_addresstypeid ON person.businessentityaddress USING btree ("AddressTypeID");


--
-- Name: idx_ix_businessentitycontact_contacttypeid; Type: INDEX; Schema: person; Owner: postgres
--

CREATE INDEX idx_ix_businessentitycontact_contacttypeid ON person.businessentitycontact USING btree ("ContactTypeID");


--
-- Name: idx_ix_businessentitycontact_personid; Type: INDEX; Schema: person; Owner: postgres
--

CREATE INDEX idx_ix_businessentitycontact_personid ON person.businessentitycontact USING btree ("PersonID");


--
-- Name: idx_ix_emailaddress_emailaddress; Type: INDEX; Schema: person; Owner: postgres
--

CREATE INDEX idx_ix_emailaddress_emailaddress ON person.emailaddress USING btree ("EmailAddress");


--
-- Name: idx_ix_person_lastname_firstname_middlename; Type: INDEX; Schema: person; Owner: postgres
--

CREATE INDEX idx_ix_person_lastname_firstname_middlename ON person.person USING btree ("LastName", "FirstName", "MiddleName");


--
-- Name: idx_ix_personphone_phonenumber; Type: INDEX; Schema: person; Owner: postgres
--

CREATE INDEX idx_ix_personphone_phonenumber ON person.personphone USING btree ("PhoneNumber");


--
-- Name: idx_pxml_person_addcontact; Type: INDEX; Schema: person; Owner: postgres
--

CREATE INDEX idx_pxml_person_addcontact ON person.person USING btree ("AdditionalContactInfo");


--
-- Name: idx_pxml_person_demographics; Type: INDEX; Schema: person; Owner: postgres
--

CREATE INDEX idx_pxml_person_demographics ON person.person USING btree ("Demographics");


--
-- Name: idx_xmlpath_person_demographics; Type: INDEX; Schema: person; Owner: postgres
--

CREATE INDEX idx_xmlpath_person_demographics ON person.person USING btree ("Demographics");


--
-- Name: idx_xmlproperty_person_demographics; Type: INDEX; Schema: person; Owner: postgres
--

CREATE INDEX idx_xmlproperty_person_demographics ON person.person USING btree ("Demographics");


--
-- Name: idx_xmlvalue_person_demographics; Type: INDEX; Schema: person; Owner: postgres
--

CREATE INDEX idx_xmlvalue_person_demographics ON person.person USING btree ("Demographics");


--
-- Name: idx_ak_billofmaterials_productassemblyid_componentid_startdate; Type: INDEX; Schema: production; Owner: postgres
--

CREATE UNIQUE INDEX idx_ak_billofmaterials_productassemblyid_componentid_startdate ON production.billofmaterials USING btree ("ProductAssemblyID", "ComponentID", "StartDate");


--
-- Name: idx_ak_culture_name; Type: INDEX; Schema: production; Owner: postgres
--

CREATE UNIQUE INDEX idx_ak_culture_name ON production.culture USING btree ("Name");


--
-- Name: idx_ak_document_documentlevel_documentnode; Type: INDEX; Schema: production; Owner: postgres
--

CREATE UNIQUE INDEX idx_ak_document_documentlevel_documentnode ON production.document USING btree ("DocumentLevel", "DocumentNode");


--
-- Name: idx_ak_document_rowguid; Type: INDEX; Schema: production; Owner: postgres
--

CREATE UNIQUE INDEX idx_ak_document_rowguid ON production.document USING btree (rowguid);


--
-- Name: idx_ak_location_name; Type: INDEX; Schema: production; Owner: postgres
--

CREATE UNIQUE INDEX idx_ak_location_name ON production.location USING btree ("Name");


--
-- Name: idx_ak_product_name; Type: INDEX; Schema: production; Owner: postgres
--

CREATE UNIQUE INDEX idx_ak_product_name ON production.product USING btree ("Name");


--
-- Name: idx_ak_product_productnumber; Type: INDEX; Schema: production; Owner: postgres
--

CREATE UNIQUE INDEX idx_ak_product_productnumber ON production.product USING btree ("ProductNumber");


--
-- Name: idx_ak_product_rowguid; Type: INDEX; Schema: production; Owner: postgres
--

CREATE UNIQUE INDEX idx_ak_product_rowguid ON production.product USING btree (rowguid);


--
-- Name: idx_ak_productcategory_name; Type: INDEX; Schema: production; Owner: postgres
--

CREATE UNIQUE INDEX idx_ak_productcategory_name ON production.productcategory USING btree ("Name");


--
-- Name: idx_ak_productcategory_rowguid; Type: INDEX; Schema: production; Owner: postgres
--

CREATE UNIQUE INDEX idx_ak_productcategory_rowguid ON production.productcategory USING btree (rowguid);


--
-- Name: idx_ak_productdescription_rowguid; Type: INDEX; Schema: production; Owner: postgres
--

CREATE UNIQUE INDEX idx_ak_productdescription_rowguid ON production.productdescription USING btree (rowguid);


--
-- Name: idx_ak_productmodel_name; Type: INDEX; Schema: production; Owner: postgres
--

CREATE UNIQUE INDEX idx_ak_productmodel_name ON production.productmodel USING btree ("Name");


--
-- Name: idx_ak_productmodel_rowguid; Type: INDEX; Schema: production; Owner: postgres
--

CREATE UNIQUE INDEX idx_ak_productmodel_rowguid ON production.productmodel USING btree (rowguid);


--
-- Name: idx_ak_productsubcategory_name; Type: INDEX; Schema: production; Owner: postgres
--

CREATE UNIQUE INDEX idx_ak_productsubcategory_name ON production.productsubcategory USING btree ("Name");


--
-- Name: idx_ak_productsubcategory_rowguid; Type: INDEX; Schema: production; Owner: postgres
--

CREATE UNIQUE INDEX idx_ak_productsubcategory_rowguid ON production.productsubcategory USING btree (rowguid);


--
-- Name: idx_ak_scrapreason_name; Type: INDEX; Schema: production; Owner: postgres
--

CREATE UNIQUE INDEX idx_ak_scrapreason_name ON production.scrapreason USING btree ("Name");


--
-- Name: idx_ak_unitmeasure_name; Type: INDEX; Schema: production; Owner: postgres
--

CREATE UNIQUE INDEX idx_ak_unitmeasure_name ON production.unitmeasure USING btree ("Name");


--
-- Name: idx_ix_billofmaterials_unitmeasurecode; Type: INDEX; Schema: production; Owner: postgres
--

CREATE INDEX idx_ix_billofmaterials_unitmeasurecode ON production.billofmaterials USING btree ("UnitMeasureCode");


--
-- Name: idx_ix_document_filename_revision; Type: INDEX; Schema: production; Owner: postgres
--

CREATE INDEX idx_ix_document_filename_revision ON production.document USING btree ("FileName", "Revision");


--
-- Name: idx_ix_productreview_productid_name; Type: INDEX; Schema: production; Owner: postgres
--

CREATE INDEX idx_ix_productreview_productid_name ON production.productreview USING btree ("ProductID", "ReviewerName") INCLUDE ("Comments");


--
-- Name: idx_ix_transactionhistory_productid; Type: INDEX; Schema: production; Owner: postgres
--

CREATE INDEX idx_ix_transactionhistory_productid ON production.transactionhistory USING btree ("ProductID");


--
-- Name: idx_ix_transactionhistory_referenceorderid_referenceorderlineid; Type: INDEX; Schema: production; Owner: postgres
--

CREATE INDEX idx_ix_transactionhistory_referenceorderid_referenceorderlineid ON production.transactionhistory USING btree ("ReferenceOrderID", "ReferenceOrderLineID");


--
-- Name: idx_ix_transactionhistoryarchive_productid; Type: INDEX; Schema: production; Owner: postgres
--

CREATE INDEX idx_ix_transactionhistoryarchive_productid ON production.transactionhistoryarchive USING btree ("ProductID");


--
-- Name: idx_ix_transactionhistoryarchive_referenceorderid_referenceorde; Type: INDEX; Schema: production; Owner: postgres
--

CREATE INDEX idx_ix_transactionhistoryarchive_referenceorderid_referenceorde ON production.transactionhistoryarchive USING btree ("ReferenceOrderID", "ReferenceOrderLineID");


--
-- Name: idx_ix_workorder_productid; Type: INDEX; Schema: production; Owner: postgres
--

CREATE INDEX idx_ix_workorder_productid ON production.workorder USING btree ("ProductID");


--
-- Name: idx_ix_workorder_scrapreasonid; Type: INDEX; Schema: production; Owner: postgres
--

CREATE INDEX idx_ix_workorder_scrapreasonid ON production.workorder USING btree ("ScrapReasonID");


--
-- Name: idx_ix_workorderrouting_productid; Type: INDEX; Schema: production; Owner: postgres
--

CREATE INDEX idx_ix_workorderrouting_productid ON production.workorderrouting USING btree ("ProductID");


--
-- Name: idx_pxml_productmodel_catalogdescription; Type: INDEX; Schema: production; Owner: postgres
--

CREATE INDEX idx_pxml_productmodel_catalogdescription ON production.productmodel USING btree ("CatalogDescription");


--
-- Name: idx_pxml_productmodel_instructions; Type: INDEX; Schema: production; Owner: postgres
--

CREATE INDEX idx_pxml_productmodel_instructions ON production.productmodel USING btree ("Instructions");


--
-- Name: idx_ak_shipmethod_name; Type: INDEX; Schema: purchasing; Owner: postgres
--

CREATE UNIQUE INDEX idx_ak_shipmethod_name ON purchasing.shipmethod USING btree ("Name");


--
-- Name: idx_ak_shipmethod_rowguid; Type: INDEX; Schema: purchasing; Owner: postgres
--

CREATE UNIQUE INDEX idx_ak_shipmethod_rowguid ON purchasing.shipmethod USING btree (rowguid);


--
-- Name: idx_ak_vendor_accountnumber; Type: INDEX; Schema: purchasing; Owner: postgres
--

CREATE UNIQUE INDEX idx_ak_vendor_accountnumber ON purchasing.vendor USING btree ("AccountNumber");


--
-- Name: idx_ix_productvendor_businessentityid; Type: INDEX; Schema: purchasing; Owner: postgres
--

CREATE INDEX idx_ix_productvendor_businessentityid ON purchasing.productvendor USING btree ("BusinessEntityID");


--
-- Name: idx_ix_productvendor_unitmeasurecode; Type: INDEX; Schema: purchasing; Owner: postgres
--

CREATE INDEX idx_ix_productvendor_unitmeasurecode ON purchasing.productvendor USING btree ("UnitMeasureCode");


--
-- Name: idx_ix_purchaseorderdetail_productid; Type: INDEX; Schema: purchasing; Owner: postgres
--

CREATE INDEX idx_ix_purchaseorderdetail_productid ON purchasing.purchaseorderdetail USING btree ("ProductID");


--
-- Name: idx_ix_purchaseorderheader_employeeid; Type: INDEX; Schema: purchasing; Owner: postgres
--

CREATE INDEX idx_ix_purchaseorderheader_employeeid ON purchasing.purchaseorderheader USING btree ("EmployeeID");


--
-- Name: idx_ix_purchaseorderheader_vendorid; Type: INDEX; Schema: purchasing; Owner: postgres
--

CREATE INDEX idx_ix_purchaseorderheader_vendorid ON purchasing.purchaseorderheader USING btree ("VendorID");


--
-- Name: idx_ak_creditcard_cardnumber; Type: INDEX; Schema: sales; Owner: postgres
--

CREATE UNIQUE INDEX idx_ak_creditcard_cardnumber ON sales.creditcard USING btree ("CardNumber");


--
-- Name: idx_ak_currency_name; Type: INDEX; Schema: sales; Owner: postgres
--

CREATE UNIQUE INDEX idx_ak_currency_name ON sales.currency USING btree ("Name");


--
-- Name: idx_ak_currencyrate_currencyratedate_fromcurrencycode_tocurrenc; Type: INDEX; Schema: sales; Owner: postgres
--

CREATE UNIQUE INDEX idx_ak_currencyrate_currencyratedate_fromcurrencycode_tocurrenc ON sales.currencyrate USING btree ("CurrencyRateDate", "FromCurrencyCode", "ToCurrencyCode");


--
-- Name: idx_ak_customer_accountnumber; Type: INDEX; Schema: sales; Owner: postgres
--

CREATE UNIQUE INDEX idx_ak_customer_accountnumber ON sales.customer USING btree ("AccountNumber");


--
-- Name: idx_ak_customer_rowguid; Type: INDEX; Schema: sales; Owner: postgres
--

CREATE UNIQUE INDEX idx_ak_customer_rowguid ON sales.customer USING btree (rowguid);


--
-- Name: idx_ak_salesorderdetail_rowguid; Type: INDEX; Schema: sales; Owner: postgres
--

CREATE UNIQUE INDEX idx_ak_salesorderdetail_rowguid ON sales.salesorderdetail USING btree (rowguid);


--
-- Name: idx_ak_salesorderheader_rowguid; Type: INDEX; Schema: sales; Owner: postgres
--

CREATE UNIQUE INDEX idx_ak_salesorderheader_rowguid ON sales.salesorderheader USING btree (rowguid);


--
-- Name: idx_ak_salesorderheader_salesordernumber; Type: INDEX; Schema: sales; Owner: postgres
--

CREATE UNIQUE INDEX idx_ak_salesorderheader_salesordernumber ON sales.salesorderheader USING btree ("SalesOrderNumber");


--
-- Name: idx_ak_salesperson_rowguid; Type: INDEX; Schema: sales; Owner: postgres
--

CREATE UNIQUE INDEX idx_ak_salesperson_rowguid ON sales.salesperson USING btree (rowguid);


--
-- Name: idx_ak_salespersonquotahistory_rowguid; Type: INDEX; Schema: sales; Owner: postgres
--

CREATE UNIQUE INDEX idx_ak_salespersonquotahistory_rowguid ON sales.salespersonquotahistory USING btree (rowguid);


--
-- Name: idx_ak_salestaxrate_rowguid; Type: INDEX; Schema: sales; Owner: postgres
--

CREATE UNIQUE INDEX idx_ak_salestaxrate_rowguid ON sales.salestaxrate USING btree (rowguid);


--
-- Name: idx_ak_salestaxrate_stateprovinceid_taxtype; Type: INDEX; Schema: sales; Owner: postgres
--

CREATE UNIQUE INDEX idx_ak_salestaxrate_stateprovinceid_taxtype ON sales.salestaxrate USING btree ("StateProvinceID", "TaxType");


--
-- Name: idx_ak_salesterritory_name; Type: INDEX; Schema: sales; Owner: postgres
--

CREATE UNIQUE INDEX idx_ak_salesterritory_name ON sales.salesterritory USING btree ("Name");


--
-- Name: idx_ak_salesterritory_rowguid; Type: INDEX; Schema: sales; Owner: postgres
--

CREATE UNIQUE INDEX idx_ak_salesterritory_rowguid ON sales.salesterritory USING btree (rowguid);


--
-- Name: idx_ak_salesterritoryhistory_rowguid; Type: INDEX; Schema: sales; Owner: postgres
--

CREATE UNIQUE INDEX idx_ak_salesterritoryhistory_rowguid ON sales.salesterritoryhistory USING btree (rowguid);


--
-- Name: idx_ak_specialoffer_rowguid; Type: INDEX; Schema: sales; Owner: postgres
--

CREATE UNIQUE INDEX idx_ak_specialoffer_rowguid ON sales.specialoffer USING btree (rowguid);


--
-- Name: idx_ak_specialofferproduct_rowguid; Type: INDEX; Schema: sales; Owner: postgres
--

CREATE UNIQUE INDEX idx_ak_specialofferproduct_rowguid ON sales.specialofferproduct USING btree (rowguid);


--
-- Name: idx_ak_store_rowguid; Type: INDEX; Schema: sales; Owner: postgres
--

CREATE UNIQUE INDEX idx_ak_store_rowguid ON sales.store USING btree (rowguid);


--
-- Name: idx_ix_countryregioncurrency_currencycode; Type: INDEX; Schema: sales; Owner: postgres
--

CREATE INDEX idx_ix_countryregioncurrency_currencycode ON sales.countryregioncurrency USING btree ("CurrencyCode");


--
-- Name: idx_ix_customer_territoryid; Type: INDEX; Schema: sales; Owner: postgres
--

CREATE INDEX idx_ix_customer_territoryid ON sales.customer USING btree ("TerritoryID");


--
-- Name: idx_ix_salesorderdetail_productid; Type: INDEX; Schema: sales; Owner: postgres
--

CREATE INDEX idx_ix_salesorderdetail_productid ON sales.salesorderdetail USING btree ("ProductID");


--
-- Name: idx_ix_salesorderheader_customerid; Type: INDEX; Schema: sales; Owner: postgres
--

CREATE INDEX idx_ix_salesorderheader_customerid ON sales.salesorderheader USING btree ("CustomerID");


--
-- Name: idx_ix_salesorderheader_salespersonid; Type: INDEX; Schema: sales; Owner: postgres
--

CREATE INDEX idx_ix_salesorderheader_salespersonid ON sales.salesorderheader USING btree ("SalesPersonID");


--
-- Name: idx_ix_shoppingcartitem_shoppingcartid_productid; Type: INDEX; Schema: sales; Owner: postgres
--

CREATE INDEX idx_ix_shoppingcartitem_shoppingcartid_productid ON sales.shoppingcartitem USING btree ("ShoppingCartID", "ProductID");


--
-- Name: idx_ix_specialofferproduct_productid; Type: INDEX; Schema: sales; Owner: postgres
--

CREATE INDEX idx_ix_specialofferproduct_productid ON sales.specialofferproduct USING btree ("ProductID");


--
-- Name: idx_ix_store_salespersonid; Type: INDEX; Schema: sales; Owner: postgres
--

CREATE INDEX idx_ix_store_salespersonid ON sales.store USING btree ("SalesPersonID");


--
-- Name: idx_pxml_store_demographics; Type: INDEX; Schema: sales; Owner: postgres
--

CREATE INDEX idx_pxml_store_demographics ON sales.store USING btree ("Demographics");


--
-- Name: employee fk_employee_person_businessentityid; Type: FK CONSTRAINT; Schema: humanresources; Owner: postgres
--

ALTER TABLE ONLY humanresources.employee
    ADD CONSTRAINT fk_employee_person_businessentityid FOREIGN KEY ("BusinessEntityID") REFERENCES person.person("BusinessEntityID");


--
-- Name: employeedepartmenthistory fk_employeedepartmenthistory_department_departmentid; Type: FK CONSTRAINT; Schema: humanresources; Owner: postgres
--

ALTER TABLE ONLY humanresources.employeedepartmenthistory
    ADD CONSTRAINT fk_employeedepartmenthistory_department_departmentid FOREIGN KEY ("DepartmentID") REFERENCES humanresources.department("DepartmentID");


--
-- Name: employeedepartmenthistory fk_employeedepartmenthistory_employee_businessentityid; Type: FK CONSTRAINT; Schema: humanresources; Owner: postgres
--

ALTER TABLE ONLY humanresources.employeedepartmenthistory
    ADD CONSTRAINT fk_employeedepartmenthistory_employee_businessentityid FOREIGN KEY ("BusinessEntityID") REFERENCES humanresources.employee("BusinessEntityID");


--
-- Name: employeedepartmenthistory fk_employeedepartmenthistory_shift_shiftid; Type: FK CONSTRAINT; Schema: humanresources; Owner: postgres
--

ALTER TABLE ONLY humanresources.employeedepartmenthistory
    ADD CONSTRAINT fk_employeedepartmenthistory_shift_shiftid FOREIGN KEY ("ShiftID") REFERENCES humanresources.shift("ShiftID");


--
-- Name: employeepayhistory fk_employeepayhistory_employee_businessentityid; Type: FK CONSTRAINT; Schema: humanresources; Owner: postgres
--

ALTER TABLE ONLY humanresources.employeepayhistory
    ADD CONSTRAINT fk_employeepayhistory_employee_businessentityid FOREIGN KEY ("BusinessEntityID") REFERENCES humanresources.employee("BusinessEntityID");


--
-- Name: jobcandidate fk_jobcandidate_employee_businessentityid; Type: FK CONSTRAINT; Schema: humanresources; Owner: postgres
--

ALTER TABLE ONLY humanresources.jobcandidate
    ADD CONSTRAINT fk_jobcandidate_employee_businessentityid FOREIGN KEY ("BusinessEntityID") REFERENCES humanresources.employee("BusinessEntityID");


--
-- Name: address fk_address_stateprovince_stateprovinceid; Type: FK CONSTRAINT; Schema: person; Owner: postgres
--

ALTER TABLE ONLY person.address
    ADD CONSTRAINT fk_address_stateprovince_stateprovinceid FOREIGN KEY ("StateProvinceID") REFERENCES person.stateprovince("StateProvinceID");


--
-- Name: businessentityaddress fk_businessentityaddress_address_addressid; Type: FK CONSTRAINT; Schema: person; Owner: postgres
--

ALTER TABLE ONLY person.businessentityaddress
    ADD CONSTRAINT fk_businessentityaddress_address_addressid FOREIGN KEY ("AddressID") REFERENCES person.address("AddressID");


--
-- Name: businessentityaddress fk_businessentityaddress_addresstype_addresstypeid; Type: FK CONSTRAINT; Schema: person; Owner: postgres
--

ALTER TABLE ONLY person.businessentityaddress
    ADD CONSTRAINT fk_businessentityaddress_addresstype_addresstypeid FOREIGN KEY ("AddressTypeID") REFERENCES person.addresstype("AddressTypeID");


--
-- Name: businessentityaddress fk_businessentityaddress_businessentity_businessentityid; Type: FK CONSTRAINT; Schema: person; Owner: postgres
--

ALTER TABLE ONLY person.businessentityaddress
    ADD CONSTRAINT fk_businessentityaddress_businessentity_businessentityid FOREIGN KEY ("BusinessEntityID") REFERENCES person.businessentity("BusinessEntityID");


--
-- Name: businessentitycontact fk_businessentitycontact_businessentity_businessentityid; Type: FK CONSTRAINT; Schema: person; Owner: postgres
--

ALTER TABLE ONLY person.businessentitycontact
    ADD CONSTRAINT fk_businessentitycontact_businessentity_businessentityid FOREIGN KEY ("BusinessEntityID") REFERENCES person.businessentity("BusinessEntityID");


--
-- Name: businessentitycontact fk_businessentitycontact_contacttype_contacttypeid; Type: FK CONSTRAINT; Schema: person; Owner: postgres
--

ALTER TABLE ONLY person.businessentitycontact
    ADD CONSTRAINT fk_businessentitycontact_contacttype_contacttypeid FOREIGN KEY ("ContactTypeID") REFERENCES person.contacttype("ContactTypeID");


--
-- Name: businessentitycontact fk_businessentitycontact_person_personid; Type: FK CONSTRAINT; Schema: person; Owner: postgres
--

ALTER TABLE ONLY person.businessentitycontact
    ADD CONSTRAINT fk_businessentitycontact_person_personid FOREIGN KEY ("PersonID") REFERENCES person.person("BusinessEntityID");


--
-- Name: emailaddress fk_emailaddress_person_businessentityid; Type: FK CONSTRAINT; Schema: person; Owner: postgres
--

ALTER TABLE ONLY person.emailaddress
    ADD CONSTRAINT fk_emailaddress_person_businessentityid FOREIGN KEY ("BusinessEntityID") REFERENCES person.person("BusinessEntityID");


--
-- Name: password fk_password_person_businessentityid; Type: FK CONSTRAINT; Schema: person; Owner: postgres
--

ALTER TABLE ONLY person.password
    ADD CONSTRAINT fk_password_person_businessentityid FOREIGN KEY ("BusinessEntityID") REFERENCES person.person("BusinessEntityID");


--
-- Name: person fk_person_businessentity_businessentityid; Type: FK CONSTRAINT; Schema: person; Owner: postgres
--

ALTER TABLE ONLY person.person
    ADD CONSTRAINT fk_person_businessentity_businessentityid FOREIGN KEY ("BusinessEntityID") REFERENCES person.businessentity("BusinessEntityID");


--
-- Name: personphone fk_personphone_person_businessentityid; Type: FK CONSTRAINT; Schema: person; Owner: postgres
--

ALTER TABLE ONLY person.personphone
    ADD CONSTRAINT fk_personphone_person_businessentityid FOREIGN KEY ("BusinessEntityID") REFERENCES person.person("BusinessEntityID");


--
-- Name: personphone fk_personphone_phonenumbertype_phonenumbertypeid; Type: FK CONSTRAINT; Schema: person; Owner: postgres
--

ALTER TABLE ONLY person.personphone
    ADD CONSTRAINT fk_personphone_phonenumbertype_phonenumbertypeid FOREIGN KEY ("PhoneNumberTypeID") REFERENCES person.phonenumbertype("PhoneNumberTypeID");


--
-- Name: stateprovince fk_stateprovince_countryregion_countryregioncode; Type: FK CONSTRAINT; Schema: person; Owner: postgres
--

ALTER TABLE ONLY person.stateprovince
    ADD CONSTRAINT fk_stateprovince_countryregion_countryregioncode FOREIGN KEY ("CountryRegionCode") REFERENCES person.countryregion("CountryRegionCode");


--
-- Name: stateprovince fk_stateprovince_salesterritory_territoryid; Type: FK CONSTRAINT; Schema: person; Owner: postgres
--

ALTER TABLE ONLY person.stateprovince
    ADD CONSTRAINT fk_stateprovince_salesterritory_territoryid FOREIGN KEY ("TerritoryID") REFERENCES sales.salesterritory("TerritoryID");


--
-- Name: billofmaterials fk_billofmaterials_product_componentid; Type: FK CONSTRAINT; Schema: production; Owner: postgres
--

ALTER TABLE ONLY production.billofmaterials
    ADD CONSTRAINT fk_billofmaterials_product_componentid FOREIGN KEY ("ComponentID") REFERENCES production.product("ProductID");


--
-- Name: billofmaterials fk_billofmaterials_product_productassemblyid; Type: FK CONSTRAINT; Schema: production; Owner: postgres
--

ALTER TABLE ONLY production.billofmaterials
    ADD CONSTRAINT fk_billofmaterials_product_productassemblyid FOREIGN KEY ("ProductAssemblyID") REFERENCES production.product("ProductID");


--
-- Name: billofmaterials fk_billofmaterials_unitmeasure_unitmeasurecode; Type: FK CONSTRAINT; Schema: production; Owner: postgres
--

ALTER TABLE ONLY production.billofmaterials
    ADD CONSTRAINT fk_billofmaterials_unitmeasure_unitmeasurecode FOREIGN KEY ("UnitMeasureCode") REFERENCES production.unitmeasure("UnitMeasureCode");


--
-- Name: document fk_document_employee_owner; Type: FK CONSTRAINT; Schema: production; Owner: postgres
--

ALTER TABLE ONLY production.document
    ADD CONSTRAINT fk_document_employee_owner FOREIGN KEY ("Owner") REFERENCES humanresources.employee("BusinessEntityID");


--
-- Name: product fk_product_productsubcategory_productsubcategoryid; Type: FK CONSTRAINT; Schema: production; Owner: postgres
--

ALTER TABLE ONLY production.product
    ADD CONSTRAINT fk_product_productsubcategory_productsubcategoryid FOREIGN KEY ("ProductSubcategoryID") REFERENCES production.productsubcategory("ProductSubcategoryID");


--
-- Name: product fk_product_unitmeasure_sizeunitmeasurecode; Type: FK CONSTRAINT; Schema: production; Owner: postgres
--

ALTER TABLE ONLY production.product
    ADD CONSTRAINT fk_product_unitmeasure_sizeunitmeasurecode FOREIGN KEY ("SizeUnitMeasureCode") REFERENCES production.unitmeasure("UnitMeasureCode");


--
-- Name: product fk_product_unitmeasure_weightunitmeasurecode; Type: FK CONSTRAINT; Schema: production; Owner: postgres
--

ALTER TABLE ONLY production.product
    ADD CONSTRAINT fk_product_unitmeasure_weightunitmeasurecode FOREIGN KEY ("WeightUnitMeasureCode") REFERENCES production.unitmeasure("UnitMeasureCode");


--
-- Name: productcosthistory fk_productcosthistory_product_productid; Type: FK CONSTRAINT; Schema: production; Owner: postgres
--

ALTER TABLE ONLY production.productcosthistory
    ADD CONSTRAINT fk_productcosthistory_product_productid FOREIGN KEY ("ProductID") REFERENCES production.product("ProductID");


--
-- Name: productdocument fk_productdocument_product_productid; Type: FK CONSTRAINT; Schema: production; Owner: postgres
--

ALTER TABLE ONLY production.productdocument
    ADD CONSTRAINT fk_productdocument_product_productid FOREIGN KEY ("ProductID") REFERENCES production.product("ProductID");


--
-- Name: productinventory fk_productinventory_location_locationid; Type: FK CONSTRAINT; Schema: production; Owner: postgres
--

ALTER TABLE ONLY production.productinventory
    ADD CONSTRAINT fk_productinventory_location_locationid FOREIGN KEY ("LocationID") REFERENCES production.location("LocationID");


--
-- Name: productinventory fk_productinventory_product_productid; Type: FK CONSTRAINT; Schema: production; Owner: postgres
--

ALTER TABLE ONLY production.productinventory
    ADD CONSTRAINT fk_productinventory_product_productid FOREIGN KEY ("ProductID") REFERENCES production.product("ProductID");


--
-- Name: productlistpricehistory fk_productlistpricehistory_product_productid; Type: FK CONSTRAINT; Schema: production; Owner: postgres
--

ALTER TABLE ONLY production.productlistpricehistory
    ADD CONSTRAINT fk_productlistpricehistory_product_productid FOREIGN KEY ("ProductID") REFERENCES production.product("ProductID");


--
-- Name: productmodelillustration fk_productmodelillustration_illustration_illustrationid; Type: FK CONSTRAINT; Schema: production; Owner: postgres
--

ALTER TABLE ONLY production.productmodelillustration
    ADD CONSTRAINT fk_productmodelillustration_illustration_illustrationid FOREIGN KEY ("IllustrationID") REFERENCES production.illustration("IllustrationID");


--
-- Name: productproductphoto fk_productproductphoto_product_productid; Type: FK CONSTRAINT; Schema: production; Owner: postgres
--

ALTER TABLE ONLY production.productproductphoto
    ADD CONSTRAINT fk_productproductphoto_product_productid FOREIGN KEY ("ProductID") REFERENCES production.product("ProductID");


--
-- Name: productreview fk_productreview_product_productid; Type: FK CONSTRAINT; Schema: production; Owner: postgres
--

ALTER TABLE ONLY production.productreview
    ADD CONSTRAINT fk_productreview_product_productid FOREIGN KEY ("ProductID") REFERENCES production.product("ProductID");


--
-- Name: productsubcategory fk_productsubcategory_productcategory_productcategoryid; Type: FK CONSTRAINT; Schema: production; Owner: postgres
--

ALTER TABLE ONLY production.productsubcategory
    ADD CONSTRAINT fk_productsubcategory_productcategory_productcategoryid FOREIGN KEY ("ProductCategoryID") REFERENCES production.productcategory("ProductCategoryID");


--
-- Name: transactionhistory fk_transactionhistory_product_productid; Type: FK CONSTRAINT; Schema: production; Owner: postgres
--

ALTER TABLE ONLY production.transactionhistory
    ADD CONSTRAINT fk_transactionhistory_product_productid FOREIGN KEY ("ProductID") REFERENCES production.product("ProductID");


--
-- Name: workorder fk_workorder_product_productid; Type: FK CONSTRAINT; Schema: production; Owner: postgres
--

ALTER TABLE ONLY production.workorder
    ADD CONSTRAINT fk_workorder_product_productid FOREIGN KEY ("ProductID") REFERENCES production.product("ProductID");


--
-- Name: workorder fk_workorder_scrapreason_scrapreasonid; Type: FK CONSTRAINT; Schema: production; Owner: postgres
--

ALTER TABLE ONLY production.workorder
    ADD CONSTRAINT fk_workorder_scrapreason_scrapreasonid FOREIGN KEY ("ScrapReasonID") REFERENCES production.scrapreason("ScrapReasonID");


--
-- Name: workorderrouting fk_workorderrouting_location_locationid; Type: FK CONSTRAINT; Schema: production; Owner: postgres
--

ALTER TABLE ONLY production.workorderrouting
    ADD CONSTRAINT fk_workorderrouting_location_locationid FOREIGN KEY ("LocationID") REFERENCES production.location("LocationID");


--
-- Name: workorderrouting fk_workorderrouting_workorder_workorderid; Type: FK CONSTRAINT; Schema: production; Owner: postgres
--

ALTER TABLE ONLY production.workorderrouting
    ADD CONSTRAINT fk_workorderrouting_workorder_workorderid FOREIGN KEY ("WorkOrderID") REFERENCES production.workorder("WorkOrderID");


--
-- Name: productvendor fk_productvendor_product_productid; Type: FK CONSTRAINT; Schema: purchasing; Owner: postgres
--

ALTER TABLE ONLY purchasing.productvendor
    ADD CONSTRAINT fk_productvendor_product_productid FOREIGN KEY ("ProductID") REFERENCES production.product("ProductID");


--
-- Name: productvendor fk_productvendor_unitmeasure_unitmeasurecode; Type: FK CONSTRAINT; Schema: purchasing; Owner: postgres
--

ALTER TABLE ONLY purchasing.productvendor
    ADD CONSTRAINT fk_productvendor_unitmeasure_unitmeasurecode FOREIGN KEY ("UnitMeasureCode") REFERENCES production.unitmeasure("UnitMeasureCode");


--
-- Name: productvendor fk_productvendor_vendor_businessentityid; Type: FK CONSTRAINT; Schema: purchasing; Owner: postgres
--

ALTER TABLE ONLY purchasing.productvendor
    ADD CONSTRAINT fk_productvendor_vendor_businessentityid FOREIGN KEY ("BusinessEntityID") REFERENCES purchasing.vendor("BusinessEntityID");


--
-- Name: purchaseorderdetail fk_purchaseorderdetail_product_productid; Type: FK CONSTRAINT; Schema: purchasing; Owner: postgres
--

ALTER TABLE ONLY purchasing.purchaseorderdetail
    ADD CONSTRAINT fk_purchaseorderdetail_product_productid FOREIGN KEY ("ProductID") REFERENCES production.product("ProductID");


--
-- Name: purchaseorderdetail fk_purchaseorderdetail_purchaseorderheader_purchaseorderid; Type: FK CONSTRAINT; Schema: purchasing; Owner: postgres
--

ALTER TABLE ONLY purchasing.purchaseorderdetail
    ADD CONSTRAINT fk_purchaseorderdetail_purchaseorderheader_purchaseorderid FOREIGN KEY ("PurchaseOrderID") REFERENCES purchasing.purchaseorderheader("PurchaseOrderID");


--
-- Name: purchaseorderheader fk_purchaseorderheader_employee_employeeid; Type: FK CONSTRAINT; Schema: purchasing; Owner: postgres
--

ALTER TABLE ONLY purchasing.purchaseorderheader
    ADD CONSTRAINT fk_purchaseorderheader_employee_employeeid FOREIGN KEY ("EmployeeID") REFERENCES humanresources.employee("BusinessEntityID");


--
-- Name: purchaseorderheader fk_purchaseorderheader_shipmethod_shipmethodid; Type: FK CONSTRAINT; Schema: purchasing; Owner: postgres
--

ALTER TABLE ONLY purchasing.purchaseorderheader
    ADD CONSTRAINT fk_purchaseorderheader_shipmethod_shipmethodid FOREIGN KEY ("ShipMethodID") REFERENCES purchasing.shipmethod("ShipMethodID");


--
-- Name: purchaseorderheader fk_purchaseorderheader_vendor_vendorid; Type: FK CONSTRAINT; Schema: purchasing; Owner: postgres
--

ALTER TABLE ONLY purchasing.purchaseorderheader
    ADD CONSTRAINT fk_purchaseorderheader_vendor_vendorid FOREIGN KEY ("VendorID") REFERENCES purchasing.vendor("BusinessEntityID");


--
-- Name: vendor fk_vendor_businessentity_businessentityid; Type: FK CONSTRAINT; Schema: purchasing; Owner: postgres
--

ALTER TABLE ONLY purchasing.vendor
    ADD CONSTRAINT fk_vendor_businessentity_businessentityid FOREIGN KEY ("BusinessEntityID") REFERENCES person.businessentity("BusinessEntityID");


--
-- Name: countryregioncurrency fk_countryregioncurrency_countryregion_countryregioncode; Type: FK CONSTRAINT; Schema: sales; Owner: postgres
--

ALTER TABLE ONLY sales.countryregioncurrency
    ADD CONSTRAINT fk_countryregioncurrency_countryregion_countryregioncode FOREIGN KEY ("CountryRegionCode") REFERENCES person.countryregion("CountryRegionCode");


--
-- Name: countryregioncurrency fk_countryregioncurrency_currency_currencycode; Type: FK CONSTRAINT; Schema: sales; Owner: postgres
--

ALTER TABLE ONLY sales.countryregioncurrency
    ADD CONSTRAINT fk_countryregioncurrency_currency_currencycode FOREIGN KEY ("CurrencyCode") REFERENCES sales.currency("CurrencyCode");


--
-- Name: currencyrate fk_currencyrate_currency_fromcurrencycode; Type: FK CONSTRAINT; Schema: sales; Owner: postgres
--

ALTER TABLE ONLY sales.currencyrate
    ADD CONSTRAINT fk_currencyrate_currency_fromcurrencycode FOREIGN KEY ("FromCurrencyCode") REFERENCES sales.currency("CurrencyCode");


--
-- Name: currencyrate fk_currencyrate_currency_tocurrencycode; Type: FK CONSTRAINT; Schema: sales; Owner: postgres
--

ALTER TABLE ONLY sales.currencyrate
    ADD CONSTRAINT fk_currencyrate_currency_tocurrencycode FOREIGN KEY ("ToCurrencyCode") REFERENCES sales.currency("CurrencyCode");


--
-- Name: customer fk_customer_person_personid; Type: FK CONSTRAINT; Schema: sales; Owner: postgres
--

ALTER TABLE ONLY sales.customer
    ADD CONSTRAINT fk_customer_person_personid FOREIGN KEY ("PersonID") REFERENCES person.person("BusinessEntityID");


--
-- Name: customer fk_customer_salesterritory_territoryid; Type: FK CONSTRAINT; Schema: sales; Owner: postgres
--

ALTER TABLE ONLY sales.customer
    ADD CONSTRAINT fk_customer_salesterritory_territoryid FOREIGN KEY ("TerritoryID") REFERENCES sales.salesterritory("TerritoryID");


--
-- Name: customer fk_customer_store_storeid; Type: FK CONSTRAINT; Schema: sales; Owner: postgres
--

ALTER TABLE ONLY sales.customer
    ADD CONSTRAINT fk_customer_store_storeid FOREIGN KEY ("StoreID") REFERENCES sales.store("BusinessEntityID");


--
-- Name: personcreditcard fk_personcreditcard_creditcard_creditcardid; Type: FK CONSTRAINT; Schema: sales; Owner: postgres
--

ALTER TABLE ONLY sales.personcreditcard
    ADD CONSTRAINT fk_personcreditcard_creditcard_creditcardid FOREIGN KEY ("CreditCardID") REFERENCES sales.creditcard("CreditCardID");


--
-- Name: personcreditcard fk_personcreditcard_person_businessentityid; Type: FK CONSTRAINT; Schema: sales; Owner: postgres
--

ALTER TABLE ONLY sales.personcreditcard
    ADD CONSTRAINT fk_personcreditcard_person_businessentityid FOREIGN KEY ("BusinessEntityID") REFERENCES person.person("BusinessEntityID");


--
-- Name: salesorderdetail fk_salesorderdetail_salesorderheader_salesorderid; Type: FK CONSTRAINT; Schema: sales; Owner: postgres
--

ALTER TABLE ONLY sales.salesorderdetail
    ADD CONSTRAINT fk_salesorderdetail_salesorderheader_salesorderid FOREIGN KEY ("SalesOrderID") REFERENCES sales.salesorderheader("SalesOrderID");


--
-- Name: salesorderheader fk_salesorderheader_address_billtoaddressid; Type: FK CONSTRAINT; Schema: sales; Owner: postgres
--

ALTER TABLE ONLY sales.salesorderheader
    ADD CONSTRAINT fk_salesorderheader_address_billtoaddressid FOREIGN KEY ("BillToAddressID") REFERENCES person.address("AddressID");


--
-- Name: salesorderheader fk_salesorderheader_address_shiptoaddressid; Type: FK CONSTRAINT; Schema: sales; Owner: postgres
--

ALTER TABLE ONLY sales.salesorderheader
    ADD CONSTRAINT fk_salesorderheader_address_shiptoaddressid FOREIGN KEY ("ShipToAddressID") REFERENCES person.address("AddressID");


--
-- Name: salesorderheader fk_salesorderheader_creditcard_creditcardid; Type: FK CONSTRAINT; Schema: sales; Owner: postgres
--

ALTER TABLE ONLY sales.salesorderheader
    ADD CONSTRAINT fk_salesorderheader_creditcard_creditcardid FOREIGN KEY ("CreditCardID") REFERENCES sales.creditcard("CreditCardID");


--
-- Name: salesorderheader fk_salesorderheader_currencyrate_currencyrateid; Type: FK CONSTRAINT; Schema: sales; Owner: postgres
--

ALTER TABLE ONLY sales.salesorderheader
    ADD CONSTRAINT fk_salesorderheader_currencyrate_currencyrateid FOREIGN KEY ("CurrencyRateID") REFERENCES sales.currencyrate("CurrencyRateID");


--
-- Name: salesorderheader fk_salesorderheader_customer_customerid; Type: FK CONSTRAINT; Schema: sales; Owner: postgres
--

ALTER TABLE ONLY sales.salesorderheader
    ADD CONSTRAINT fk_salesorderheader_customer_customerid FOREIGN KEY ("CustomerID") REFERENCES sales.customer("CustomerID");


--
-- Name: salesorderheader fk_salesorderheader_salesperson_salespersonid; Type: FK CONSTRAINT; Schema: sales; Owner: postgres
--

ALTER TABLE ONLY sales.salesorderheader
    ADD CONSTRAINT fk_salesorderheader_salesperson_salespersonid FOREIGN KEY ("SalesPersonID") REFERENCES sales.salesperson("BusinessEntityID");


--
-- Name: salesorderheader fk_salesorderheader_salesterritory_territoryid; Type: FK CONSTRAINT; Schema: sales; Owner: postgres
--

ALTER TABLE ONLY sales.salesorderheader
    ADD CONSTRAINT fk_salesorderheader_salesterritory_territoryid FOREIGN KEY ("TerritoryID") REFERENCES sales.salesterritory("TerritoryID");


--
-- Name: salesorderheader fk_salesorderheader_shipmethod_shipmethodid; Type: FK CONSTRAINT; Schema: sales; Owner: postgres
--

ALTER TABLE ONLY sales.salesorderheader
    ADD CONSTRAINT fk_salesorderheader_shipmethod_shipmethodid FOREIGN KEY ("ShipMethodID") REFERENCES purchasing.shipmethod("ShipMethodID");


--
-- Name: salesorderheadersalesreason fk_salesorderheadersalesreason_salesorderheader_salesorderid; Type: FK CONSTRAINT; Schema: sales; Owner: postgres
--

ALTER TABLE ONLY sales.salesorderheadersalesreason
    ADD CONSTRAINT fk_salesorderheadersalesreason_salesorderheader_salesorderid FOREIGN KEY ("SalesOrderID") REFERENCES sales.salesorderheader("SalesOrderID");


--
-- Name: salesorderheadersalesreason fk_salesorderheadersalesreason_salesreason_salesreasonid; Type: FK CONSTRAINT; Schema: sales; Owner: postgres
--

ALTER TABLE ONLY sales.salesorderheadersalesreason
    ADD CONSTRAINT fk_salesorderheadersalesreason_salesreason_salesreasonid FOREIGN KEY ("SalesReasonID") REFERENCES sales.salesreason("SalesReasonID");


--
-- Name: salesperson fk_salesperson_employee_businessentityid; Type: FK CONSTRAINT; Schema: sales; Owner: postgres
--

ALTER TABLE ONLY sales.salesperson
    ADD CONSTRAINT fk_salesperson_employee_businessentityid FOREIGN KEY ("BusinessEntityID") REFERENCES humanresources.employee("BusinessEntityID");


--
-- Name: salesperson fk_salesperson_salesterritory_territoryid; Type: FK CONSTRAINT; Schema: sales; Owner: postgres
--

ALTER TABLE ONLY sales.salesperson
    ADD CONSTRAINT fk_salesperson_salesterritory_territoryid FOREIGN KEY ("TerritoryID") REFERENCES sales.salesterritory("TerritoryID");


--
-- Name: salespersonquotahistory fk_salespersonquotahistory_salesperson_businessentityid; Type: FK CONSTRAINT; Schema: sales; Owner: postgres
--

ALTER TABLE ONLY sales.salespersonquotahistory
    ADD CONSTRAINT fk_salespersonquotahistory_salesperson_businessentityid FOREIGN KEY ("BusinessEntityID") REFERENCES sales.salesperson("BusinessEntityID");


--
-- Name: salestaxrate fk_salestaxrate_stateprovince_stateprovinceid; Type: FK CONSTRAINT; Schema: sales; Owner: postgres
--

ALTER TABLE ONLY sales.salestaxrate
    ADD CONSTRAINT fk_salestaxrate_stateprovince_stateprovinceid FOREIGN KEY ("StateProvinceID") REFERENCES person.stateprovince("StateProvinceID");


--
-- Name: salesterritory fk_salesterritory_countryregion_countryregioncode; Type: FK CONSTRAINT; Schema: sales; Owner: postgres
--

ALTER TABLE ONLY sales.salesterritory
    ADD CONSTRAINT fk_salesterritory_countryregion_countryregioncode FOREIGN KEY ("CountryRegionCode") REFERENCES person.countryregion("CountryRegionCode");


--
-- Name: salesterritoryhistory fk_salesterritoryhistory_salesperson_businessentityid; Type: FK CONSTRAINT; Schema: sales; Owner: postgres
--

ALTER TABLE ONLY sales.salesterritoryhistory
    ADD CONSTRAINT fk_salesterritoryhistory_salesperson_businessentityid FOREIGN KEY ("BusinessEntityID") REFERENCES sales.salesperson("BusinessEntityID");


--
-- Name: salesterritoryhistory fk_salesterritoryhistory_salesterritory_territoryid; Type: FK CONSTRAINT; Schema: sales; Owner: postgres
--

ALTER TABLE ONLY sales.salesterritoryhistory
    ADD CONSTRAINT fk_salesterritoryhistory_salesterritory_territoryid FOREIGN KEY ("TerritoryID") REFERENCES sales.salesterritory("TerritoryID");


--
-- Name: shoppingcartitem fk_shoppingcartitem_product_productid; Type: FK CONSTRAINT; Schema: sales; Owner: postgres
--

ALTER TABLE ONLY sales.shoppingcartitem
    ADD CONSTRAINT fk_shoppingcartitem_product_productid FOREIGN KEY ("ProductID") REFERENCES production.product("ProductID");


--
-- Name: specialofferproduct fk_specialofferproduct_product_productid; Type: FK CONSTRAINT; Schema: sales; Owner: postgres
--

ALTER TABLE ONLY sales.specialofferproduct
    ADD CONSTRAINT fk_specialofferproduct_product_productid FOREIGN KEY ("ProductID") REFERENCES production.product("ProductID");


--
-- Name: specialofferproduct fk_specialofferproduct_specialoffer_specialofferid; Type: FK CONSTRAINT; Schema: sales; Owner: postgres
--

ALTER TABLE ONLY sales.specialofferproduct
    ADD CONSTRAINT fk_specialofferproduct_specialoffer_specialofferid FOREIGN KEY ("SpecialOfferID") REFERENCES sales.specialoffer("SpecialOfferID");


--
-- Name: store fk_store_businessentity_businessentityid; Type: FK CONSTRAINT; Schema: sales; Owner: postgres
--

ALTER TABLE ONLY sales.store
    ADD CONSTRAINT fk_store_businessentity_businessentityid FOREIGN KEY ("BusinessEntityID") REFERENCES person.businessentity("BusinessEntityID");


--
-- Name: store fk_store_salesperson_salespersonid; Type: FK CONSTRAINT; Schema: sales; Owner: postgres
--

ALTER TABLE ONLY sales.store
    ADD CONSTRAINT fk_store_salesperson_salespersonid FOREIGN KEY ("SalesPersonID") REFERENCES sales.salesperson("BusinessEntityID");


--
-- YSQL database dump complete
--

