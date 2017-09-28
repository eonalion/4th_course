DROP TABLE "TEST"."CITIZENS_CATEGORY" CASCADE CONSTRAINTS;
DROP TABLE "TEST"."PERSON" CASCADE CONSTRAINTS;
DROP TABLE "TEST"."CLAIM_STATUS" CASCADE CONSTRAINTS;
DROP TABLE "TEST"."CLAIM_TYPE" CASCADE CONSTRAINTS;
DROP TABLE "TEST"."CLAIM" CASCADE CONSTRAINTS;
DROP TABLE "TEST"."JUDGE" CASCADE CONSTRAINTS;
DROP TABLE "TEST"."PLAINTIFF" CASCADE CONSTRAINTS;
DROP TABLE "TEST"."DEFENDANT" CASCADE CONSTRAINTS;
DROP TABLE "TEST"."JUDGE_M2M_CLAIM" CASCADE CONSTRAINTS;

--------------------------------------------------------
-- Table CITIZENS_CATEGORY
--------------------------------------------------------

  CREATE TABLE "TEST"."CITIZENS_CATEGORY" 
   ("ID" NUMBER NOT NULL PRIMARY KEY, 
	"NAME" VARCHAR2(40 CHAR) NOT NULL, 
	"FEE_DISCOUNT" NUMBER(3,2)
   );
   
--------------------------------------------------------
--  Table PERSON
--------------------------------------------------------

  CREATE TABLE "TEST"."PERSON" 
   ("ID" NUMBER NOT NULL PRIMARY KEY, 
	"LAST_NAME" VARCHAR2(40 CHAR),
	"FIRST_NAME" VARCHAR2(40 CHAR), 
	"MIDDLE_NAME" VARCHAR2(40 CHAR),
	"PHONE" VARCHAR2(20 CHAR),
	"PERSONAL_INFO" VARCHAR2(1000 CHAR)
   ); 
   
--------------------------------------------------------
--  Table JUDGE
--------------------------------------------------------

  CREATE TABLE "TEST"."JUDGE" 
   ("ID" NUMBER NOT NULL PRIMARY KEY
   );
   
  ALTER TABLE "TEST"."JUDGE"
   ADD FOREIGN KEY ("ID") 
   REFERENCES "TEST"."PERSON"("ID");
      
--------------------------------------------------------
--  Table PLAINTIFF
--------------------------------------------------------

   CREATE TABLE "TEST"."PLAINTIFF" 
   ("ID" NUMBER NOT NULL PRIMARY KEY, 
    "CATEGORY_ID" NUMBER NOT NULL
   ); 
   
   ALTER TABLE "TEST"."PLAINTIFF"
   ADD FOREIGN KEY ("ID") 
   REFERENCES "TEST"."PERSON"("ID");
   
   ALTER TABLE "TEST"."PLAINTIFF"
   ADD FOREIGN KEY ("CATEGORY_ID") 
   REFERENCES "TEST"."CITIZENS_CATEGORY"("ID");
   
--------------------------------------------------------
--  Table DEFENDANT
--------------------------------------------------------

   CREATE TABLE "TEST"."DEFENDANT" 
   ("ID" NUMBER NOT NULL PRIMARY KEY
   ); 
   
   ALTER TABLE "TEST"."DEFENDANT"
   ADD FOREIGN KEY ("ID") 
   REFERENCES "TEST"."PERSON"("ID");
   
--------------------------------------------------------
--  Table CLAIM_STATUS
--------------------------------------------------------

  CREATE TABLE "TEST"."CLAIM_STATUS" 
   ("ID" NUMBER NOT NULL PRIMARY KEY, 
	"NAME" VARCHAR2(20 CHAR) NOT NULL, 
	"DESCRIPTION" VARCHAR2(1000 CHAR)
   );
   
--------------------------------------------------------
--  Table CLAIM_TYPE
--------------------------------------------------------

  CREATE TABLE "TEST"."CLAIM_TYPE" 
   ("ID" NUMBER NOT NULL PRIMARY KEY, 
	"NAME" VARCHAR2(80 CHAR) NOT NULL
   );

--------------------------------------------------------
-- Table CLAIM
--------------------------------------------------------

  CREATE TABLE "TEST"."CLAIM"
   ("ID" NUMBER NOT NULL PRIMARY KEY, 
	"STATUS_ID" NUMBER NOT NULL, 
	"APPLY_DATE" DATE NOT NULL, 
	"REGISTER_DATE" DATE NOT NULL, 
	"PLAINTIFF_ID" NUMBER NOT NULL, 
	"DEFENDANT_ID" NUMBER NOT NULL, 
	"TYPE_ID" NUMBER NOT NULL
   );
   
   ALTER TABLE "TEST"."CLAIM"
   ADD FOREIGN KEY ("STATUS_ID") 
   REFERENCES "TEST"."CLAIM_STATUS"("ID");
   
   ALTER TABLE "TEST"."CLAIM"
   ADD FOREIGN KEY ("PLAINTIFF_ID") 
   REFERENCES "TEST"."PLAINTIFF"("ID");
   
   ALTER TABLE "TEST"."CLAIM"
   ADD FOREIGN KEY ("DEFENDANT_ID") 
   REFERENCES "TEST"."DEFENDANT"("ID");
   
   ALTER TABLE "TEST"."CLAIM"
   ADD FOREIGN KEY ("TYPE_ID") 
   REFERENCES "TEST"."CLAIM_TYPE"("ID");
   
--------------------------------------------------------
-- Table JUDGE_M2M_CLAIM
--------------------------------------------------------

   CREATE TABLE "TEST"."JUDGE_M2M_CLAIM"
   ("ID" NUMBER NOT NULL PRIMARY KEY, 
    "JUDGE_ID" NUMBER NOT NULL, 
	"CLAIM_ID" NUMBER NOT NULL
   );
   
   ALTER TABLE "TEST"."JUDGE_M2M_CLAIM"
   ADD FOREIGN KEY ("JUDGE_ID") 
   REFERENCES "TEST"."JUDGE"("ID");
   
   ALTER TABLE "TEST"."JUDGE_M2M_CLAIM"
   ADD FOREIGN KEY ("CLAIM_ID") 
   REFERENCES "TEST"."CLAIM"("ID");
   