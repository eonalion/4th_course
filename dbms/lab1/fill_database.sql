--------------------------------------------------------
--  Fill CITIZENS_CATEGORY
--------------------------------------------------------

INSERT INTO "TEST"."CITIZENS_CATEGORY" ("ID", "NAME") VALUES (1, 'no_category');
INSERT INTO "TEST"."CITIZENS_CATEGORY" ("ID", "NAME") VALUES (2, 'category_1');
INSERT INTO "TEST"."CITIZENS_CATEGORY" ("ID", "NAME") VALUES (3, 'category_2');
INSERT INTO "TEST"."CITIZENS_CATEGORY" ("ID", "NAME") VALUES (4, 'category_3');
INSERT INTO "TEST"."CITIZENS_CATEGORY" ("ID", "NAME") VALUES (5, 'category_4');

--------------------------------------------------------
--  Fill CLAIM_STATUS
--------------------------------------------------------

INSERT INTO "TEST"."CLAIM_STATUS" ("ID", "NAME") VALUES (1, 'accepted');
INSERT INTO "TEST"."CLAIM_STATUS" ("ID", "NAME") VALUES (2, 'declined');
INSERT INTO "TEST"."CLAIM_STATUS" ("ID", "NAME") VALUES (3, 'needs changes');
INSERT INTO "TEST"."CLAIM_STATUS" ("ID", "NAME") VALUES (4, 'closed');

--------------------------------------------------------
--  Fill CLAIM_TYPE
--------------------------------------------------------

INSERT INTO "TEST"."CLAIM_TYPE" ("ID", "NAME") VALUES (1, 'type_1');
INSERT INTO "TEST"."CLAIM_TYPE" ("ID", "NAME") VALUES (2, 'type_2');
INSERT INTO "TEST"."CLAIM_TYPE" ("ID", "NAME") VALUES (3, 'type_3');
INSERT INTO "TEST"."CLAIM_TYPE" ("ID", "NAME") VALUES (4, 'type_4');
INSERT INTO "TEST"."CLAIM_TYPE" ("ID", "NAME") VALUES (5, 'type_5');
INSERT INTO "TEST"."CLAIM_TYPE" ("ID", "NAME") VALUES (6, 'type_6');

--------------------------------------------------------
--  Fill PERSON
--------------------------------------------------------

INSERT INTO "TEST"."PERSON" ("ID", "LAST_NAME", "FIRST_NAME", "MIDDLE_NAME", "PHONE") VALUES (1, '???????????', '?????????', '???????', '+375291112334');
INSERT INTO "TEST"."PERSON" ("ID", "LAST_NAME", "FIRST_NAME", "MIDDLE_NAME", "PHONE") VALUES (2, '?????', '????', '????????', '+375445678901');
INSERT INTO "TEST"."PERSON" ("ID", "LAST_NAME", "FIRST_NAME", "MIDDLE_NAME", "PHONE") VALUES (3, '?????', '??????', '????????', '+375299012345');

INSERT INTO "TEST"."PERSON" ("ID", "LAST_NAME", "FIRST_NAME", "MIDDLE_NAME") VALUES (4, '????????', '?????????', '????????');
INSERT INTO "TEST"."PERSON" ("ID", "LAST_NAME", "FIRST_NAME", "MIDDLE_NAME") VALUES (5, '???????', '????', '????????');
INSERT INTO "TEST"."PERSON" ("ID", "LAST_NAME", "FIRST_NAME", "MIDDLE_NAME") VALUES (6, '????????', '??????', '?????????????');
INSERT INTO "TEST"."PERSON" ("ID", "LAST_NAME", "FIRST_NAME", "MIDDLE_NAME") VALUES (7, '?????????', '??????', '??????????');
INSERT INTO "TEST"."PERSON" ("ID", "LAST_NAME", "FIRST_NAME", "MIDDLE_NAME") VALUES (8, '??????', '?????????', '??????????');
INSERT INTO "TEST"."PERSON" ("ID", "LAST_NAME", "FIRST_NAME", "MIDDLE_NAME") VALUES (9, '??????????', '?????', '???????');
INSERT INTO "TEST"."PERSON" ("ID", "LAST_NAME", "FIRST_NAME", "MIDDLE_NAME") VALUES (10, '??????', '????', '????????');
INSERT INTO "TEST"."PERSON" ("ID", "LAST_NAME", "FIRST_NAME", "MIDDLE_NAME") VALUES (11, '??????', '??????????', '??????????');
INSERT INTO "TEST"."PERSON" ("ID", "LAST_NAME", "FIRST_NAME", "MIDDLE_NAME") VALUES (12, '?????', '???????', '???????');
INSERT INTO "TEST"."PERSON" ("ID", "LAST_NAME", "FIRST_NAME", "MIDDLE_NAME") VALUES (13, '?????????', '???????', '??????????');

INSERT INTO "TEST"."PERSON" ("ID", "LAST_NAME", "FIRST_NAME", "MIDDLE_NAME") VALUES (14, '?????', '?????', '????????');
INSERT INTO "TEST"."PERSON" ("ID", "LAST_NAME", "FIRST_NAME", "MIDDLE_NAME") VALUES (15, '?????', '?????', '????????');
INSERT INTO "TEST"."PERSON" ("ID", "LAST_NAME", "FIRST_NAME", "MIDDLE_NAME") VALUES (16, '?????', '????????', '?????????????');
INSERT INTO "TEST"."PERSON" ("ID", "LAST_NAME", "FIRST_NAME", "MIDDLE_NAME") VALUES (17, '?????', '????', '???????');
INSERT INTO "TEST"."PERSON" ("ID", "LAST_NAME", "FIRST_NAME", "MIDDLE_NAME") VALUES (18, '??????', '?????????', '????????');
INSERT INTO "TEST"."PERSON" ("ID", "LAST_NAME", "FIRST_NAME", "MIDDLE_NAME") VALUES (19, '??????', '????????', '???????');
INSERT INTO "TEST"."PERSON" ("ID", "LAST_NAME", "FIRST_NAME", "MIDDLE_NAME") VALUES (20, '??????????', '?????', '????????????');
INSERT INTO "TEST"."PERSON" ("ID", "LAST_NAME", "FIRST_NAME", "MIDDLE_NAME") VALUES (21, '?????????', '??????????', '??????????');
INSERT INTO "TEST"."PERSON" ("ID", "LAST_NAME", "FIRST_NAME", "MIDDLE_NAME") VALUES (22, '??????', '????????', '??????????');
INSERT INTO "TEST"."PERSON" ("ID", "LAST_NAME", "FIRST_NAME", "MIDDLE_NAME") VALUES (23, '???????', '?????', '??????????');

--------------------------------------------------------
--  Fill PLAINTIFF
--------------------------------------------------------

INSERT INTO "TEST"."PLAINTIFF" ("ID", "CATEGORY_ID") VALUES (4, 1);
INSERT INTO "TEST"."PLAINTIFF" ("ID", "CATEGORY_ID") VALUES (5, 1);
INSERT INTO "TEST"."PLAINTIFF" ("ID", "CATEGORY_ID") VALUES (6, 2);
INSERT INTO "TEST"."PLAINTIFF" ("ID", "CATEGORY_ID") VALUES (7, 1);
INSERT INTO "TEST"."PLAINTIFF" ("ID", "CATEGORY_ID") VALUES (8, 1);
INSERT INTO "TEST"."PLAINTIFF" ("ID", "CATEGORY_ID") VALUES (9, 4);
INSERT INTO "TEST"."PLAINTIFF" ("ID", "CATEGORY_ID") VALUES (10, 1);
INSERT INTO "TEST"."PLAINTIFF" ("ID", "CATEGORY_ID") VALUES (11, 3);
INSERT INTO "TEST"."PLAINTIFF" ("ID", "CATEGORY_ID") VALUES (12, 2);
INSERT INTO "TEST"."PLAINTIFF" ("ID", "CATEGORY_ID") VALUES (13, 1);

--------------------------------------------------------
--  Fill DEFENDANT
--------------------------------------------------------

INSERT INTO "TEST"."DEFENDANT" ("ID") VALUES (14);
INSERT INTO "TEST"."DEFENDANT" ("ID") VALUES (15);
INSERT INTO "TEST"."DEFENDANT" ("ID") VALUES (16);
INSERT INTO "TEST"."DEFENDANT" ("ID") VALUES (17);
INSERT INTO "TEST"."DEFENDANT" ("ID") VALUES (18);
INSERT INTO "TEST"."DEFENDANT" ("ID") VALUES (19);
INSERT INTO "TEST"."DEFENDANT" ("ID") VALUES (20);
INSERT INTO "TEST"."DEFENDANT" ("ID") VALUES (21);
INSERT INTO "TEST"."DEFENDANT" ("ID") VALUES (22);
INSERT INTO "TEST"."DEFENDANT" ("ID") VALUES (23);

--------------------------------------------------------
--  Fill CLAIM
--------------------------------------------------------

INSERT INTO "TEST"."CLAIM" ("ID", "STATUS_ID", "APPLY_DATE", "REGISTER_DATE", "PLAINTIFF_ID" , "DEFENDANT_ID", "TYPE_ID") 
VALUES (1, 1, TO_DATE('2017/01/03 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), TO_DATE('2017/05/03 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 13, 14, 1);

INSERT INTO "TEST"."CLAIM" ("ID", "STATUS_ID", "APPLY_DATE", "REGISTER_DATE", "PLAINTIFF_ID" , "DEFENDANT_ID", "TYPE_ID") 
VALUES (2, 1, TO_DATE('2017/01/03 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), TO_DATE('2017/05/03 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 12, 15, 2);

INSERT INTO "TEST"."CLAIM" ("ID", "STATUS_ID", "APPLY_DATE", "REGISTER_DATE", "PLAINTIFF_ID" , "DEFENDANT_ID", "TYPE_ID") 
VALUES (3, 1, TO_DATE('2017/05/03 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), TO_DATE('2017/06/03 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 11, 16, 3);

INSERT INTO "TEST"."CLAIM" ("ID", "STATUS_ID", "APPLY_DATE", "REGISTER_DATE", "PLAINTIFF_ID" , "DEFENDANT_ID", "TYPE_ID") 
VALUES (4, 1, TO_DATE('2017/05/23 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), TO_DATE('2017/05/03 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 10, 17, 1);

INSERT INTO "TEST"."CLAIM" ("ID", "STATUS_ID", "APPLY_DATE", "REGISTER_DATE", "PLAINTIFF_ID" , "DEFENDANT_ID", "TYPE_ID") 
VALUES (5, 1, TO_DATE('2017/09/13 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), TO_DATE('2017/08/03 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 9, 18, 3);

INSERT INTO "TEST"."CLAIM" ("ID", "STATUS_ID", "APPLY_DATE", "REGISTER_DATE", "PLAINTIFF_ID" , "DEFENDANT_ID", "TYPE_ID") 
VALUES (6, 2, TO_DATE('2017/05/20 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), TO_DATE('2017/05/03 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 8, 19, 1);

INSERT INTO "TEST"."CLAIM" ("ID", "STATUS_ID", "APPLY_DATE", "REGISTER_DATE", "PLAINTIFF_ID" , "DEFENDANT_ID", "TYPE_ID") 
VALUES (7, 1, TO_DATE('2017/05/4 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), TO_DATE('2017/05/03 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 7, 20, 2);

INSERT INTO "TEST"."CLAIM" ("ID", "STATUS_ID", "APPLY_DATE", "REGISTER_DATE", "PLAINTIFF_ID" , "DEFENDANT_ID", "TYPE_ID") 
VALUES (8, 1, TO_DATE('2017/05/6 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), TO_DATE('2017/01/13 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 6, 21, 1);

INSERT INTO "TEST"."CLAIM" ("ID", "STATUS_ID", "APPLY_DATE", "REGISTER_DATE", "PLAINTIFF_ID" , "DEFENDANT_ID", "TYPE_ID") 
VALUES (9, 3, TO_DATE('2017/05/03 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), TO_DATE('2017/05/13 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 5, 22, 1);

INSERT INTO "TEST"."CLAIM" ("ID", "STATUS_ID", "APPLY_DATE", "REGISTER_DATE", "PLAINTIFF_ID" , "DEFENDANT_ID", "TYPE_ID") 
VALUES (10, 1, TO_DATE('2017/05/03 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), TO_DATE('2017/05/03 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 4, 23, 1);

--------------------------------------------------------
--  Fill JUDGE
--------------------------------------------------------

INSERT INTO "TEST"."JUDGE" ("ID") VALUES (1);
INSERT INTO "TEST"."JUDGE" ("ID") VALUES (2);
INSERT INTO "TEST"."JUDGE" ("ID") VALUES (3);

--------------------------------------------------------
--  Fill JUDGE_M2M_CLAIM
--------------------------------------------------------

INSERT INTO "TEST"."JUDGE_M2M_CLAIM" ("ID", "JUDGE_ID", "CLAIM_ID") VALUES (1, 1, 1);
INSERT INTO "TEST"."JUDGE_M2M_CLAIM" ("ID", "JUDGE_ID", "CLAIM_ID") VALUES (2, 1, 2);
INSERT INTO "TEST"."JUDGE_M2M_CLAIM" ("ID", "JUDGE_ID", "CLAIM_ID") VALUES (3, 1, 3);
INSERT INTO "TEST"."JUDGE_M2M_CLAIM" ("ID", "JUDGE_ID", "CLAIM_ID") VALUES (4, 2, 4);
INSERT INTO "TEST"."JUDGE_M2M_CLAIM" ("ID", "JUDGE_ID", "CLAIM_ID") VALUES (5, 3, 5);
INSERT INTO "TEST"."JUDGE_M2M_CLAIM" ("ID", "JUDGE_ID", "CLAIM_ID") VALUES (6, 2, 6);
INSERT INTO "TEST"."JUDGE_M2M_CLAIM" ("ID", "JUDGE_ID", "CLAIM_ID") VALUES (7, 3, 7);
INSERT INTO "TEST"."JUDGE_M2M_CLAIM" ("ID", "JUDGE_ID", "CLAIM_ID") VALUES (8, 3, 8);
INSERT INTO "TEST"."JUDGE_M2M_CLAIM" ("ID", "JUDGE_ID", "CLAIM_ID") VALUES (9, 1, 9);
INSERT INTO "TEST"."JUDGE_M2M_CLAIM" ("ID", "JUDGE_ID", "CLAIM_ID") VALUES (10, 2, 10);
