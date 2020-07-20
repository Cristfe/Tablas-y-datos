--------------------------------------------------------
-- Archivo creado  - sábado-junio-20-2020   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Type TIPO_TRABAJADOR
--------------------------------------------------------

  CREATE OR REPLACE TYPE "HR"."TIPO_TRABAJADOR" AS OBJECT (
DNI VARCHAR(9),
Nombre VARCHAR(50),
Direccion VARCHAR(100),
Telefono NUMBER(9)) ;

/
--------------------------------------------------------
--  DDL for Sequence DEPARTMENTS_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "HR"."DEPARTMENTS_SEQ"  MINVALUE 1 MAXVALUE 9990 INCREMENT BY 10 START WITH 280 NOCACHE  NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence EMPLOYEES_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "HR"."EMPLOYEES_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 207 NOCACHE  NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence LOCATIONS_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "HR"."LOCATIONS_SEQ"  MINVALUE 1 MAXVALUE 9900 INCREMENT BY 100 START WITH 3300 NOCACHE  NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Table TIENDAS
--------------------------------------------------------

  CREATE TABLE "HR"."TIENDAS" 
   (	"CODIGO" VARCHAR2(2 BYTE), 
	"DIRECCION" VARCHAR2(100 BYTE), 
	"DNI_TRABAJADOR" VARCHAR2(9 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table TRABAJADORES
--------------------------------------------------------

  CREATE TABLE "HR"."TRABAJADORES" 
   (	"DNI" VARCHAR2(9 BYTE), 
	"NOMBRE" VARCHAR2(50 BYTE), 
	"DIRECCION" VARCHAR2(100 BYTE), 
	"TELEFONO" NUMBER(9,0)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table CLIENTES
--------------------------------------------------------

  CREATE TABLE "HR"."CLIENTES" 
   (	"NUMERO" VARCHAR2(2 BYTE), 
	"NOMBRE" VARCHAR2(50 BYTE), 
	"APELLIDOS" VARCHAR2(50 BYTE), 
	"FECHA_NACIMIENTO" DATE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table COMPRA
--------------------------------------------------------

  CREATE TABLE "HR"."COMPRA" 
   (	"DNI_TRABAJADOR" VARCHAR2(9 BYTE), 
	"CODIGO_TIENDA" VARCHAR2(2 BYTE), 
	"NUMERO_CLIENTE" VARCHAR2(2 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for View EMP_DETAILS_VIEW
--------------------------------------------------------

  CREATE OR REPLACE FORCE VIEW "HR"."EMP_DETAILS_VIEW" ("EMPLOYEE_ID", "JOB_ID", "MANAGER_ID", "DEPARTMENT_ID", "LOCATION_ID", "COUNTRY_ID", "FIRST_NAME", "LAST_NAME", "SALARY", "COMMISSION_PCT", "DEPARTMENT_NAME", "JOB_TITLE", "CITY", "STATE_PROVINCE", "COUNTRY_NAME", "REGION_NAME") AS 
  SELECT
  e.employee_id,
  e.job_id,
  e.manager_id,
  e.department_id,
  d.location_id,
  l.country_id,
  e.first_name,
  e.last_name,
  e.salary,
  e.commission_pct,
  d.department_name,
  j.job_title,
  l.city,
  l.state_province,
  c.country_name,
  r.region_name
FROM
  employees e,
  departments d,
  jobs j,
  locations l,
  countries c,
  regions r
WHERE e.department_id = d.department_id
  AND d.location_id = l.location_id
  AND l.country_id = c.country_id
  AND c.region_id = r.region_id
  AND j.job_id = e.job_id
WITH READ ONLY;
--------------------------------------------------------
--  DDL for View EMP_40_50
--------------------------------------------------------

  CREATE OR REPLACE FORCE VIEW "HR"."EMP_40_50" ("LAST_NAME", "JOB_ID") AS 
  SELECT last_name, job_id FROM employees WHERE department_id IN(40,50) ORDER BY first_name DESC;
--------------------------------------------------------
--  DDL for View PUESTOS
--------------------------------------------------------

  CREATE OR REPLACE FORCE VIEW "HR"."PUESTOS" ("JOB_ID") AS 
  SELECT DISTINCT job_id FROM employees;
REM INSERTING into HR.TIENDAS
SET DEFINE OFF;
Insert into HR.TIENDAS (CODIGO,DIRECCION,DNI_TRABAJADOR) values ('1','Calle Canarias','78717315E');
Insert into HR.TIENDAS (CODIGO,DIRECCION,DNI_TRABAJADOR) values ('2','Calle Tenerife','78395181A');
REM INSERTING into HR.TRABAJADORES
SET DEFINE OFF;
Insert into HR.TRABAJADORES (DNI,NOMBRE,DIRECCION,TELEFONO) values ('78717315E','Cristian','Calle Princesa','617546400');
Insert into HR.TRABAJADORES (DNI,NOMBRE,DIRECCION,TELEFONO) values ('78395181A','Maria','Calle Guajara','678077818');
REM INSERTING into HR.CLIENTES
SET DEFINE OFF;
Insert into HR.CLIENTES (NUMERO,NOMBRE,APELLIDOS,FECHA_NACIMIENTO) values ('11','Cristian','Herrera',to_date('07/10/88','DD/MM/RR'));
REM INSERTING into HR.COMPRA
SET DEFINE OFF;
Insert into HR.COMPRA (DNI_TRABAJADOR,CODIGO_TIENDA,NUMERO_CLIENTE) values ('78717315E','1','11');
--------------------------------------------------------
--  DDL for Index SYS_C007018
--------------------------------------------------------

  CREATE UNIQUE INDEX "HR"."SYS_C007018" ON "HR"."TIENDAS" ("CODIGO") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index SYS_C007016
--------------------------------------------------------

  CREATE UNIQUE INDEX "HR"."SYS_C007016" ON "HR"."TRABAJADORES" ("DNI") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index SYS_C007017
--------------------------------------------------------

  CREATE UNIQUE INDEX "HR"."SYS_C007017" ON "HR"."CLIENTES" ("NUMERO") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  Constraints for Table TIENDAS
--------------------------------------------------------

  ALTER TABLE "HR"."TIENDAS" ADD PRIMARY KEY ("CODIGO")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table TRABAJADORES
--------------------------------------------------------

  ALTER TABLE "HR"."TRABAJADORES" ADD PRIMARY KEY ("DNI")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CLIENTES
--------------------------------------------------------

  ALTER TABLE "HR"."CLIENTES" ADD PRIMARY KEY ("NUMERO")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table TIENDAS
--------------------------------------------------------

  ALTER TABLE "HR"."TIENDAS" ADD FOREIGN KEY ("DNI_TRABAJADOR")
	  REFERENCES "HR"."TRABAJADORES" ("DNI") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table COMPRA
--------------------------------------------------------

  ALTER TABLE "HR"."COMPRA" ADD FOREIGN KEY ("DNI_TRABAJADOR")
	  REFERENCES "HR"."TRABAJADORES" ("DNI") ENABLE;
  ALTER TABLE "HR"."COMPRA" ADD FOREIGN KEY ("CODIGO_TIENDA")
	  REFERENCES "HR"."TIENDAS" ("CODIGO") ENABLE;
  ALTER TABLE "HR"."COMPRA" ADD FOREIGN KEY ("NUMERO_CLIENTE")
	  REFERENCES "HR"."CLIENTES" ("NUMERO") ENABLE;
--------------------------------------------------------
--  DDL for Procedure ADD_JOB_HISTORY
--------------------------------------------------------
set define off;

  CREATE OR REPLACE PROCEDURE "HR"."ADD_JOB_HISTORY" 
  (  p_emp_id          job_history.employee_id%type
   , p_start_date      job_history.start_date%type
   , p_end_date        job_history.end_date%type
   , p_job_id          job_history.job_id%type
   , p_department_id   job_history.department_id%type
   )
IS
BEGIN
  INSERT INTO job_history (employee_id, start_date, end_date,
                           job_id, department_id)
    VALUES(p_emp_id, p_start_date, p_end_date, p_job_id, p_department_id);
END add_job_history;

/
--------------------------------------------------------
--  DDL for Procedure SECURE_DML
--------------------------------------------------------
set define off;

  CREATE OR REPLACE PROCEDURE "HR"."SECURE_DML" 
IS
BEGIN
  IF TO_CHAR (SYSDATE, 'HH24:MI') NOT BETWEEN '08:00' AND '18:00'
        OR TO_CHAR (SYSDATE, 'DY') IN ('SAT', 'SUN') THEN
	RAISE_APPLICATION_ERROR (-20205,
		'You may only make changes during normal office hours');
  END IF;
END secure_dml;

/
