prompt PL/SQL Developer Export Tables for user SYS
prompt Created by tordj on 27 May 2024
set feedback off
set define off

prompt Creating CUSTOMERS...
create table CUSTOMERS
(
  customerid    INTEGER not null,
  customername  VARCHAR2(100),
  customeremail VARCHAR2(100)
)
tablespace SYSTEM
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table CUSTOMERS
  add primary key (CUSTOMERID)
  using index 
  tablespace SYSTEM
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt Creating PRODUCTS...
create table PRODUCTS
(
  productid   INTEGER not null,
  productname VARCHAR2(100),
  price       INTEGER
)
tablespace SYSTEM
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table PRODUCTS
  add primary key (PRODUCTID)
  using index 
  tablespace SYSTEM
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt Creating SUPPLIERS...
create table SUPPLIERS
(
  supplierid    INTEGER not null,
  suppliername  VARCHAR2(100),
  supplieremail VARCHAR2(100)
)
tablespace SYSTEM
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table SUPPLIERS
  add primary key (SUPPLIERID)
  using index 
  tablespace SYSTEM
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt Creating INVENTORY...
create table INVENTORY
(
  inventoryid       INTEGER not null,
  productid         INTEGER,
  quantityinstock   INTEGER,
  lastrestockeddate DATE,
  supplierid        INTEGER
)
tablespace SYSTEM
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table INVENTORY
  add primary key (INVENTORYID)
  using index 
  tablespace SYSTEM
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table INVENTORY
  add foreign key (PRODUCTID)
  references PRODUCTS (PRODUCTID);
alter table INVENTORY
  add foreign key (SUPPLIERID)
  references SUPPLIERS (SUPPLIERID);

prompt Creating STAFF...
create table STAFF
(
  staffid   INTEGER not null,
  staffname VARCHAR2(100),
  position  VARCHAR2(50),
  hiredate  DATE
)
tablespace SYSTEM
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table STAFF
  add primary key (STAFFID)
  using index 
  tablespace SYSTEM
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt Creating SALES...
create table SALES
(
  saleid      INTEGER not null,
  dateofsale  DATE,
  totalamount INTEGER,
  customerid  INTEGER,
  staffid     INTEGER
)
tablespace SYSTEM
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table SALES
  add primary key (SALEID)
  using index 
  tablespace SYSTEM
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table SALES
  add foreign key (CUSTOMERID)
  references CUSTOMERS (CUSTOMERID);
alter table SALES
  add foreign key (STAFFID)
  references STAFF (STAFFID);

prompt Creating INVENTORYUSAGE...
create table INVENTORYUSAGE
(
  saleid      INTEGER not null,
  inventoryid INTEGER not null
)
tablespace SYSTEM
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table INVENTORYUSAGE
  add primary key (SALEID, INVENTORYID)
  using index 
  tablespace SYSTEM
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table INVENTORYUSAGE
  add foreign key (SALEID)
  references SALES (SALEID);
alter table INVENTORYUSAGE
  add foreign key (INVENTORYID)
  references INVENTORY (INVENTORYID);

prompt Disabling triggers for CUSTOMERS...
alter table CUSTOMERS disable all triggers;
prompt Disabling triggers for PRODUCTS...
alter table PRODUCTS disable all triggers;
prompt Disabling triggers for SUPPLIERS...
alter table SUPPLIERS disable all triggers;
prompt Disabling triggers for INVENTORY...
alter table INVENTORY disable all triggers;
prompt Disabling triggers for STAFF...
alter table STAFF disable all triggers;
prompt Disabling triggers for SALES...
alter table SALES disable all triggers;
prompt Disabling triggers for INVENTORYUSAGE...
alter table INVENTORYUSAGE disable all triggers;
prompt Disabling foreign key constraints for INVENTORY...
alter table INVENTORY disable constraint SYS_C008444;
alter table INVENTORY disable constraint SYS_C008445;
prompt Disabling foreign key constraints for SALES...
alter table SALES disable constraint SYS_C008441;
alter table SALES disable constraint SYS_C008442;
prompt Disabling foreign key constraints for INVENTORYUSAGE...
alter table INVENTORYUSAGE disable constraint SYS_C008447;
alter table INVENTORYUSAGE disable constraint SYS_C008448;
prompt Deleting INVENTORYUSAGE...
delete from INVENTORYUSAGE;
commit;
prompt Deleting SALES...
delete from SALES;
commit;
prompt Deleting STAFF...
delete from STAFF;
commit;
prompt Deleting INVENTORY...
delete from INVENTORY;
commit;
prompt Deleting SUPPLIERS...
delete from SUPPLIERS;
commit;
prompt Deleting PRODUCTS...
delete from PRODUCTS;
commit;
prompt Deleting CUSTOMERS...
delete from CUSTOMERS;
commit;
prompt Loading CUSTOMERS...
insert into CUSTOMERS (customerid, customername, customeremail)
values (1, 'John Doe', 'johndoe@example.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (2, 'Jane Smith', 'janesmith@example.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (3, 'Brendan Rhames', 'brendan@cynergydata.pk');
insert into CUSTOMERS (customerid, customername, customeremail)
values (4, 'Liev von Sydow', 'liev.vonsydow@microtek.de');
insert into CUSTOMERS (customerid, customername, customeremail)
values (5, 'Seth Snipes', 'seth.snipes@slt.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (6, 'George Bandy', 'g.bandy@spenser.fr');
insert into CUSTOMERS (customerid, customername, customeremail)
values (7, 'Thin Whitwam', 'thin@nbs.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (8, 'Franz Russell', 'franz@mcdonalds.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (9, 'Nigel Solido', 'nigel.solido@eagleone.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (10, 'Randall Hunter', 'randallh@swp.mx');
insert into CUSTOMERS (customerid, customername, customeremail)
values (11, 'Josh Rains', 'joshr@jma.de');
insert into CUSTOMERS (customerid, customername, customeremail)
values (12, 'Lou Chappelle', 'lou.chappelle@formatech.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (13, 'Denny Henstridge', 'denny@spectrum.de');
insert into CUSTOMERS (customerid, customername, customeremail)
values (14, 'Maury Blair', 'maury.b@acsis.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (15, 'Goldie Coburn', 'goldie.coburn@servicelink.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (16, 'Holland Neuwirth', 'hollandn@heritagemicrofilm.ch');
insert into CUSTOMERS (customerid, customername, customeremail)
values (17, 'Debra Dern', 'debra.dern@parker.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (18, 'Thelma Farrell', 't.farrell@microsoft.de');
insert into CUSTOMERS (customerid, customername, customeremail)
values (19, 'Jason Whitman', 'jason.whitman@pepsico.jp');
insert into CUSTOMERS (customerid, customername, customeremail)
values (20, 'Jason Oszajca', 'jasono@newviewgifts.it');
insert into CUSTOMERS (customerid, customername, customeremail)
values (21, 'Julio Twilley', 'julio.twilley@campbellsoup.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (22, 'Arnold Beckinsale', 'arnold.beckinsale@pra.se');
insert into CUSTOMERS (customerid, customername, customeremail)
values (23, 'Goran Strathairn', 'goran.strathairn@thinktanksystems.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (24, 'Boyd Lewin', 'boyd.lewin@stmaryland.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (25, 'Goran Chung', 'goran.chung@topicsentertainment.br');
insert into CUSTOMERS (customerid, customername, customeremail)
values (26, 'Christine Charles', 'christine.charles@knightsbridge.il');
insert into CUSTOMERS (customerid, customername, customeremail)
values (27, 'Sharon Daniels', 'sharon.daniels@fsffinancial.jp');
insert into CUSTOMERS (customerid, customername, customeremail)
values (28, 'Treat McCready', 't.mccready@enterprise.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (29, 'Bridget Begley', 'b.begley@banfeproducts.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (30, 'Fionnula Dreyfuss', 'fionnula.d@pharmafab.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (31, 'Rita Collie', 'rita.collie@electricalsolutions.ca');
insert into CUSTOMERS (customerid, customername, customeremail)
values (32, 'Fred Ford', 'fred@newtoninteractive.mo');
insert into CUSTOMERS (customerid, customername, customeremail)
values (33, 'Bernard Palin', 'bpalin@pepsico.uk');
insert into CUSTOMERS (customerid, customername, customeremail)
values (34, 'Mary-Louise Howard', 'mhoward@ceo.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (35, 'Herbie Cassel', 'herbie.cassel@benecongroup.uk');
insert into CUSTOMERS (customerid, customername, customeremail)
values (36, 'Julianne Crimson', 'julianne.crimson@surmodics.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (37, 'Stellan Gellar', 'stellan@ibfh.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (38, 'Mary Beth Ceasar', 'mceasar@solipsys.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (39, 'Jane Carr', 'jane.carr@sms.es');
insert into CUSTOMERS (customerid, customername, customeremail)
values (40, 'Kurtwood Patillo', 'kurtwood@mainstreetbanks.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (41, 'Pat Rourke', 'pat.rourke@mindworks.au');
insert into CUSTOMERS (customerid, customername, customeremail)
values (42, 'Emily Scaggs', 'emily.scaggs@kellogg.ca');
insert into CUSTOMERS (customerid, customername, customeremail)
values (43, 'Denzel Jamal', 'denzel.jamal@mds.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (44, 'Guy Westerberg', 'gwesterberg@stonetechprofessional.de');
insert into CUSTOMERS (customerid, customername, customeremail)
values (45, 'Dean David', 'dean.david@dearbornbancorp.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (46, 'Adam Wagner', 'adam.wagner@sm.fr');
insert into CUSTOMERS (customerid, customername, customeremail)
values (47, 'Jackson Gough', 'jacksong@gagwear.ca');
insert into CUSTOMERS (customerid, customername, customeremail)
values (48, 'Zooey Nielsen', 'zooey.nielsen@innovateecommerce.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (49, 'Jack Cartlidge', 'j.cartlidge@universalsolutions.fr');
insert into CUSTOMERS (customerid, customername, customeremail)
values (50, 'Jeroen Oldman', 'joldman@mavericktechnologies.de');
insert into CUSTOMERS (customerid, customername, customeremail)
values (51, 'Carol Hector', 'carol@gdi.de');
insert into CUSTOMERS (customerid, customername, customeremail)
values (52, 'Hilton Sizemore', 'hilton.sizemore@actechnologies.gr');
insert into CUSTOMERS (customerid, customername, customeremail)
values (53, 'Busta Roth', 'busta.roth@gha.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (54, 'Kenneth Klein', 'kklein@unitedasset.de');
insert into CUSTOMERS (customerid, customername, customeremail)
values (55, 'Coley Rodgers', 'coley.rodgers@kis.br');
insert into CUSTOMERS (customerid, customername, customeremail)
values (56, 'Yolanda Turturro', 'yolanda@powerlight.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (57, 'Brian Vincent', 'brian@wyeth.br');
insert into CUSTOMERS (customerid, customername, customeremail)
values (58, 'Juliana Blades', 'juliana.b@pra.ca');
insert into CUSTOMERS (customerid, customername, customeremail)
values (59, 'Sonny Lauper', 'sonnyl@hondamotor.au');
insert into CUSTOMERS (customerid, customername, customeremail)
values (60, 'Owen Parish', 'owen.parish@bigdoughcom.ca');
insert into CUSTOMERS (customerid, customername, customeremail)
values (61, 'Hank David', 'hank@heartlab.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (62, 'Frankie Donelly', 'frankie.donelly@dis.uk');
insert into CUSTOMERS (customerid, customername, customeremail)
values (63, 'Martha Popper', 'martha.popper@thinktanksystems.uk');
insert into CUSTOMERS (customerid, customername, customeremail)
values (64, 'Daryl Swayze', 'daryl.swayze@kimberlyclark.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (65, 'Garth Sharp', 'g.sharp@infovision.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (66, 'Sonny McBride', 'sonnym@spectrum.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (67, 'Emily Waits', 'emily.waits@infovision.fr');
insert into CUSTOMERS (customerid, customername, customeremail)
values (68, 'Sarah Kirkwood', 'sarah.k@bps.uk');
insert into CUSTOMERS (customerid, customername, customeremail)
values (69, 'Sharon Sandler', 'sharon@hudsonriverbancorp.il');
insert into CUSTOMERS (customerid, customername, customeremail)
values (70, 'Bernie Jackman', 'bernie.j@zoneperfectnutrition.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (71, 'Jackie Prinze', 'j.prinze@atlanticcredit.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (72, 'Charlton Field', 'charlton.field@loreal.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (73, 'Arnold Chambers', 'arnold.chambers@toyotamotor.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (74, 'Curt Holiday', 'choliday@generalmotors.de');
insert into CUSTOMERS (customerid, customername, customeremail)
values (75, 'Joseph Reed', 'joseph.reed@fab.ca');
insert into CUSTOMERS (customerid, customername, customeremail)
values (76, 'Alicia Danes', 'alicia@dynacqinternational.ch');
insert into CUSTOMERS (customerid, customername, customeremail)
values (77, 'Murray Cromwell', 'murray@profitline.de');
insert into CUSTOMERS (customerid, customername, customeremail)
values (78, 'Bruce Askew', 'bruce.askew@scriptsave.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (79, 'Thelma Hayes', 'thelmah@jcpenney.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (80, 'Billy Forster', 'billy.forster@jewettcameron.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (81, 'Vondie Easton', 'vondie@north.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (82, 'Goran O''Keefe', 'goran.okeefe@bestbuy.jp');
insert into CUSTOMERS (customerid, customername, customeremail)
values (83, 'Kay Cleese', 'kay@kimberlyclark.it');
insert into CUSTOMERS (customerid, customername, customeremail)
values (84, 'Giancarlo Hyde', 'giancarlo.h@ris.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (85, 'Fats Edmunds', 'fats.e@tlsservicebureau.de');
insert into CUSTOMERS (customerid, customername, customeremail)
values (86, 'Jimmie Kudrow', 'jimmie@bmm.at');
insert into CUSTOMERS (customerid, customername, customeremail)
values (87, 'Rebecca Cazale', 'rebecca.cazale@studiobproductions.uk');
insert into CUSTOMERS (customerid, customername, customeremail)
values (88, 'Clive Woods', 'clivew@ibm.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (89, 'Joshua Heatherly', 'joshua.heatherly@softworld.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (90, 'Beth Ramis', 'beth.ramis@capitalbank.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (91, 'Aidan Carrack', 'aidan.carrack@hospitalsolutions.br');
insert into CUSTOMERS (customerid, customername, customeremail)
values (92, 'Jena Perez', 'jenap@sandyspringbancorp.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (93, 'Rory Weaver', 'rory.weaver@bradleypharmaceuticals.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (94, 'Horace Eat World', 'horacee@nrae.ch');
insert into CUSTOMERS (customerid, customername, customeremail)
values (95, 'Roberta Brown', 'roberta.brown@telesynthesis.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (96, 'Benicio Overstreet', 'benicio.overstreet@trc.ca');
insert into CUSTOMERS (customerid, customername, customeremail)
values (97, 'Miranda Ferrell', 'mferrell@paisley.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (98, 'Earl Sepulveda', 'earl.sepulveda@abs.jp');
insert into CUSTOMERS (customerid, customername, customeremail)
values (99, 'Madeline Lofgren', 'madeline.lofgren@cws.es');
insert into CUSTOMERS (customerid, customername, customeremail)
values (100, 'Nanci Numan', 'nancin@educationaldevelopment.com');
commit;
prompt 100 records committed...
insert into CUSTOMERS (customerid, customername, customeremail)
values (101, 'Sheryl Stuart', 'sstuart@vitacostcom.uk');
insert into CUSTOMERS (customerid, customername, customeremail)
values (102, 'Loreena Chaplin', 'loreena.chaplin@bowman.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (103, 'Tara Mandrell', 'tara.mandrell@noodles.de');
insert into CUSTOMERS (customerid, customername, customeremail)
values (104, 'Edwin Hopkins', 'edwin.h@inspirationsoftware.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (105, 'Eliza Niven', 'eliza.niven@allstar.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (106, 'Carla Quinones', 'carla.quinones@knightsbridge.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (107, 'Will Rowlands', 'will.rowlands@mds.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (108, 'Kyle Reeves', 'kyle.reeves@restaurantpartners.se');
insert into CUSTOMERS (customerid, customername, customeremail)
values (109, 'Mindy Heslov', 'm.heslov@knightsbridge.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (110, 'Kirsten Ratzenberger', 'kirsten.ratzenberger@randomwalk.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (111, 'Breckin Atkins', 'breckina@escalade.ca');
insert into CUSTOMERS (customerid, customername, customeremail)
values (112, 'Millie Harris', 'millie@vms.lt');
insert into CUSTOMERS (customerid, customername, customeremail)
values (113, 'Holly Iglesias', 'higlesias@qls.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (114, 'Mos Judd', 'mos.judd@sysconmedia.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (115, 'Treat Wainwright', 'treat.wainwright@unitedasset.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (116, 'Goldie McCready', 'goldiem@extremepizza.ca');
insert into CUSTOMERS (customerid, customername, customeremail)
values (117, 'Roddy Sylvian', 'roddy.s@tastefullysimple.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (118, 'Jeremy Lavigne', 'jeremy.lavigne@floorgraphics.br');
insert into CUSTOMERS (customerid, customername, customeremail)
values (119, 'Jonny Lee Vaughan', 'jonnylee.vaughan@spinnakerexploration.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (120, 'Chloe Jackman', 'c.jackman@primussoftware.ca');
insert into CUSTOMERS (customerid, customername, customeremail)
values (121, 'Daryl Bloch', 'dbloch@faef.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (122, 'Mickey Greenwood', 'mickey.greenwood@ufs.cn');
insert into CUSTOMERS (customerid, customername, customeremail)
values (123, 'Latin Soul', 'latin.soul@microsoft.jp');
insert into CUSTOMERS (customerid, customername, customeremail)
values (124, 'Lauren Keener', 'lauren.keener@cws.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (125, 'Swoosie Perry', 's.perry@commworks.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (126, 'Rebecca Cohn', 'rebecca.c@gci.hk');
insert into CUSTOMERS (customerid, customername, customeremail)
values (127, 'Russell Dorff', 'rdorff@pragmatechsoftware.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (128, 'Davis Suchet', 'davis.suchet@vesta.uk');
insert into CUSTOMERS (customerid, customername, customeremail)
values (129, 'Debby Swank', 'd.swank@amerisourcefunding.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (130, 'Naomi Dalley', 'ndalley@investorstitle.uk');
insert into CUSTOMERS (customerid, customername, customeremail)
values (131, 'Stellan Weber', 'stellan.weber@oneidafinancial.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (132, 'Danni Ali', 'dali@palmbeachtan.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (133, 'Olympia Keaton', 'olympiak@randomwalk.se');
insert into CUSTOMERS (customerid, customername, customeremail)
values (134, 'Wayman Rudd', 'wayman.r@spectrum.at');
insert into CUSTOMERS (customerid, customername, customeremail)
values (135, 'Ice Blige', 'ice@nestle.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (136, 'Lizzy Cross', 'lizzy@ahl.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (137, 'Michelle Todd', 'michelle.todd@staffforce.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (138, 'Victor Kelly', 'victor@ccfholding.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (139, 'Toni Connelly', 'toni.c@sweetproductions.ca');
insert into CUSTOMERS (customerid, customername, customeremail)
values (140, 'Denise Bacon', 'denise.bacon@atxforms.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (141, 'Rickie Davison', 'rickie@ubp.it');
insert into CUSTOMERS (customerid, customername, customeremail)
values (142, 'Kevin Scheider', 'k.scheider@heartlab.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (143, 'LeVar Rebhorn', 'levar@kellogg.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (144, 'Dennis Lucien', 'dennis.lucien@learningvoyage.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (145, 'Trace Pryce', 'trace.pryce@providentbancorp.nl');
insert into CUSTOMERS (customerid, customername, customeremail)
values (146, 'Natacha Hunt', 'natacha.hunt@totalentertainment.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (147, 'Vincent Goldwyn', 'vincent.goldwyn@balchem.ca');
insert into CUSTOMERS (customerid, customername, customeremail)
values (148, 'Brian Almond', 'briana@venoco.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (149, 'Patti Speaks', 'patti.speaks@coadvantageresources.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (150, 'Bernie Kelly', 'bernie.kelly@diamondtechnologies.de');
insert into CUSTOMERS (customerid, customername, customeremail)
values (151, 'Rosco Johnson', 'rjohnson@capstone.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (152, 'Jimmie Neville', 'jneville@dynacqinternational.de');
insert into CUSTOMERS (customerid, customername, customeremail)
values (153, 'Michael Dutton', 'michael.dutton@linersdirect.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (154, 'Vanessa Baez', 'v.baez@calence.uk');
insert into CUSTOMERS (customerid, customername, customeremail)
values (155, 'Forest Moraz', 'forest.moraz@comglobalsystems.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (156, 'Kristin Curtis', 'kristin.curtis@fnb.hu');
insert into CUSTOMERS (customerid, customername, customeremail)
values (157, 'Joaquim Macy', 'jmacy@techbooks.nl');
insert into CUSTOMERS (customerid, customername, customeremail)
values (158, 'Kenneth Hiatt', 'kenneth.hiatt@sunstream.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (159, 'Jimmie Barkin', 'jimmie.barkin@heritagemicrofilm.at');
insert into CUSTOMERS (customerid, customername, customeremail)
values (160, 'Dick Byrne', 'dick.byrne@kramontrealty.au');
insert into CUSTOMERS (customerid, customername, customeremail)
values (161, 'Powers Winslet', 'powers.winslet@jewettcameron.ar');
insert into CUSTOMERS (customerid, customername, customeremail)
values (162, 'Dan Aiken', 'dan.aiken@maverick.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (163, 'William Connick', 'williamc@fnb.jp');
insert into CUSTOMERS (customerid, customername, customeremail)
values (164, 'Candice Keener', 'candice.keener@scjohnson.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (165, 'Daryl Miles', 'daryl.m@marriottinternational.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (166, 'Morgan Vance', 'morgan@pra.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (167, 'Chloe Porter', 'chloe.porter@trm.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (168, 'Kurtwood Plimpton', 'kurtwood.p@fam.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (169, 'Belinda Ribisi', 'b.ribisi@sony.jp');
insert into CUSTOMERS (customerid, customername, customeremail)
values (170, 'Ronny Beckinsale', 'ronny.b@medsource.it');
insert into CUSTOMERS (customerid, customername, customeremail)
values (171, 'Nancy Robinson', 'nancyr@conquest.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (172, 'Chalee Makowicz', 'chalee.makowicz@base.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (173, 'Karon Curtis-Hall', 'karon.curtishall@bioreliance.jp');
insert into CUSTOMERS (customerid, customername, customeremail)
values (174, 'Lea Gibbons', 'lea.gibbons@cyberthink.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (175, 'Leelee Trevino', 'leelee.trevino@unitedasset.be');
insert into CUSTOMERS (customerid, customername, customeremail)
values (176, 'Christmas Lennox', 'christmas.lennox@sunstream.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (177, 'Isaiah Beatty', 'isaiah.beatty@ntas.it');
insert into CUSTOMERS (customerid, customername, customeremail)
values (178, 'Allison Horton', 'allison.horton@lindin.uk');
insert into CUSTOMERS (customerid, customername, customeremail)
values (179, 'Darren Quinn', 'darren.quinn@providenceservice.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (180, 'Cloris Culkin', 'cloris.culkin@firstsouthbancorp.ca');
insert into CUSTOMERS (customerid, customername, customeremail)
values (181, 'Olga Boone', 'olga.boone@callhenry.ca');
insert into CUSTOMERS (customerid, customername, customeremail)
values (182, 'Ceili Patton', 'ceili.patton@linersdirect.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (183, 'Carla Danger', 'carla.danger@lydiantrust.au');
insert into CUSTOMERS (customerid, customername, customeremail)
values (184, 'Lydia Solido', 'l.solido@colgatepalmolive.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (185, 'Jerry Carnes', 'jerry.carnes@neogen.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (186, 'Elias Avalon', 'elias.avalon@ctg.dk');
insert into CUSTOMERS (customerid, customername, customeremail)
values (187, 'Joseph Barrymore', 'joseph.barrymore@envisiontelephony.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (188, 'Christine Carrere', 'christinec@newtoninteractive.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (189, 'Daryl Hunter', 'daryl.hunter@zoneperfectnutrition.ch');
insert into CUSTOMERS (customerid, customername, customeremail)
values (190, 'Irene McCoy', 'i.mccoy@nhr.at');
insert into CUSTOMERS (customerid, customername, customeremail)
values (191, 'Dave Gaynor', 'dave.gaynor@dsp.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (192, 'Edie Fichtner', 'edie.fichtner@educationaldevelopment.jp');
insert into CUSTOMERS (customerid, customername, customeremail)
values (193, 'Liv Lunch', 'liv.l@providenceservice.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (194, 'Jody Harper', 'jody.harper@netnumina.br');
insert into CUSTOMERS (customerid, customername, customeremail)
values (195, 'Jon Heron', 'jonh@generalmotors.si');
insert into CUSTOMERS (customerid, customername, customeremail)
values (196, 'Woody Garner', 'woody.garner@ciwservices.fr');
insert into CUSTOMERS (customerid, customername, customeremail)
values (197, 'Adrien Bentley', 'adrienb@career.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (198, 'Kasey Drive', 'kasey.drive@walmartstores.nl');
insert into CUSTOMERS (customerid, customername, customeremail)
values (199, 'Phil Boyle', 'philb@aldensystems.jp');
insert into CUSTOMERS (customerid, customername, customeremail)
values (200, 'Buffy Evans', 'buffy.evans@commworks.fr');
commit;
prompt 200 records committed...
insert into CUSTOMERS (customerid, customername, customeremail)
values (201, 'Nigel Red', 'nigel.red@monarchcasino.ca');
insert into CUSTOMERS (customerid, customername, customeremail)
values (202, 'Eileen Schwimmer', 'eileens@dynacqinternational.il');
insert into CUSTOMERS (customerid, customername, customeremail)
values (203, 'Kelly Holden', 'kelly.holden@hewlettpackard.de');
insert into CUSTOMERS (customerid, customername, customeremail)
values (204, 'Kasey Woodward', 'kasey.woodward@saksinc.ca');
insert into CUSTOMERS (customerid, customername, customeremail)
values (205, 'Elias Glenn', 'elias@visionarysystems.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (206, 'Helen MacDowell', 'helen.m@mainstreetbanks.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (207, 'Nicholas Utada', 'nicholas.utada@jsa.uk');
insert into CUSTOMERS (customerid, customername, customeremail)
values (208, 'Joaquin Borden', 'joaquin.b@kimberlyclark.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (209, 'Marina Tempest', 'marina.tempest@meritagetechnologies.ch');
insert into CUSTOMERS (customerid, customername, customeremail)
values (210, 'Betty Duke', 'bettyd@eastmankodak.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (211, 'Carl Blanchett', 'carl.blanchett@servicelink.br');
insert into CUSTOMERS (customerid, customername, customeremail)
values (212, 'Nastassja McPherson', 'nastassja.mcpherson@jlphor.de');
insert into CUSTOMERS (customerid, customername, customeremail)
values (213, 'Dorry Makeba', 'dorry.makeba@dearbornbancorp.be');
insert into CUSTOMERS (customerid, customername, customeremail)
values (214, 'Natalie Potter', 'natalie.potter@sweetproductions.br');
insert into CUSTOMERS (customerid, customername, customeremail)
values (215, 'Vertical Willis', 'vertical.willis@pra.no');
insert into CUSTOMERS (customerid, customername, customeremail)
values (216, 'Campbell Borden', 'c.borden@yumbrands.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (217, 'Domingo Irons', 'domingo.irons@balchem.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (218, 'Giancarlo Rosas', 'giancarlo.rosas@allegiantbancorp.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (219, 'Lenny Greenwood', 'lenny.greenwood@kelmooreinvestment.de');
insert into CUSTOMERS (customerid, customername, customeremail)
values (220, 'Rodney Bachman', 'rodney@conquest.ca');
insert into CUSTOMERS (customerid, customername, customeremail)
values (221, 'Ashley Ward', 'ashley.ward@authoria.br');
insert into CUSTOMERS (customerid, customername, customeremail)
values (222, 'Armin Cox', 'armin.cox@wci.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (223, 'Talvin Patton', 'talvin.patton@gillani.uk');
insert into CUSTOMERS (customerid, customername, customeremail)
values (224, 'James Sandler', 'james.sandler@tmt.it');
insert into CUSTOMERS (customerid, customername, customeremail)
values (225, 'Davis Shocked', 'davis.s@gra.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (226, 'Mika Mollard', 'mikam@democracydata.ec');
insert into CUSTOMERS (customerid, customername, customeremail)
values (227, 'Tom Linney', 'tom.linney@fflcbancorp.in');
insert into CUSTOMERS (customerid, customername, customeremail)
values (228, 'Chuck Wilson', 'c.wilson@trc.ca');
insert into CUSTOMERS (customerid, customername, customeremail)
values (229, 'Christmas Rauhofer', 'crauhofer@calence.nl');
insert into CUSTOMERS (customerid, customername, customeremail)
values (230, 'Anjelica McFadden', 'anjelica.mcfadden@lifelinesystems.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (231, 'Kazem Skaggs', 'kskaggs@codykramerimports.fi');
insert into CUSTOMERS (customerid, customername, customeremail)
values (232, 'Carlos Amos', 'c.amos@mai.ch');
insert into CUSTOMERS (customerid, customername, customeremail)
values (233, 'Woody Gano', 'woody.gano@fpf.de');
insert into CUSTOMERS (customerid, customername, customeremail)
values (234, 'Harris Latifah', 'harris@escalade.uk');
insert into CUSTOMERS (customerid, customername, customeremail)
values (235, 'Kyle Belushi', 'kbelushi@progressivemedical.ca');
insert into CUSTOMERS (customerid, customername, customeremail)
values (236, 'King Sedgwick', 'ksedgwick@intraspheretechnologies.fr');
insert into CUSTOMERS (customerid, customername, customeremail)
values (237, 'Embeth Hynde', 'embeth.hynde@logisticare.ca');
insert into CUSTOMERS (customerid, customername, customeremail)
values (238, 'Crystal Patillo', 'crystalp@mosaic.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (239, 'Geoffrey Ledger', 'geoffrey.ledger@insurmark.ch');
insert into CUSTOMERS (customerid, customername, customeremail)
values (240, 'Timothy Crosby', 'timothy@bigyanksports.de');
insert into CUSTOMERS (customerid, customername, customeremail)
values (241, 'Albert Broadbent', 'albert@ibfh.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (242, 'Rachel Kudrow', 'rachel@capellaeducation.de');
insert into CUSTOMERS (customerid, customername, customeremail)
values (243, 'Joy Bandy', 'j.bandy@capitolbancorp.au');
insert into CUSTOMERS (customerid, customername, customeremail)
values (244, 'Debby Morton', 'debby.morton@ccfholding.ca');
insert into CUSTOMERS (customerid, customername, customeremail)
values (245, 'Kris Salt', 'kris.salt@epiqsystems.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (246, 'Cliff Walken', 'cliff.walken@spas.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (247, 'Susan Lorenz', 'susan.lorenz@profitline.it');
insert into CUSTOMERS (customerid, customername, customeremail)
values (248, 'Liam Fiennes', 'liam.f@berkshirehathaway.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (249, 'Buddy Postlethwaite', 'buddy@printingforlesscom.de');
insert into CUSTOMERS (customerid, customername, customeremail)
values (250, 'Chloe Rhymes', 'chloe.rhymes@coadvantageresources.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (251, 'Remy Gere', 'remy.g@bat.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (252, 'Xander Shepard', 'xander.shepard@portageenvironmental.fr');
insert into CUSTOMERS (customerid, customername, customeremail)
values (253, 'Carol Torino', 'carol.torino@oneidafinancial.de');
insert into CUSTOMERS (customerid, customername, customeremail)
values (254, 'Catherine Gilliam', 'catherine.gilliam@its.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (255, 'Burton Colon', 'b.colon@apexsystems.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (256, 'Glenn Tisdale', 'gtisdale@printcafesoftware.ca');
insert into CUSTOMERS (customerid, customername, customeremail)
values (257, 'Bruce Weaving', 'bruce.w@dsp.hu');
insert into CUSTOMERS (customerid, customername, customeremail)
values (258, 'Frederic Flanery', 'frederic.flanery@ubp.at');
insert into CUSTOMERS (customerid, customername, customeremail)
values (259, 'Nickel Pleasure', 'npleasure@alohanysystems.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (260, 'Latin Frampton', 'latin.frampton@dsp.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (261, 'Geggy Child', 'geggy.child@fordmotor.de');
insert into CUSTOMERS (customerid, customername, customeremail)
values (262, 'Mac McElhone', 'mac@trinityhomecare.dk');
insert into CUSTOMERS (customerid, customername, customeremail)
values (263, 'Deborah von Sydow', 'deborah.v@eagleone.uk');
insert into CUSTOMERS (customerid, customername, customeremail)
values (264, 'Loreena Thornton', 'loreena@tilsonlandscape.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (265, 'Anthony McLachlan', 'a.mclachlan@socketinternet.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (266, 'Clive Farina', 'clive@y2marketing.br');
insert into CUSTOMERS (customerid, customername, customeremail)
values (267, 'Stellan Langella', 'stellan.langella@tracertechnologies.uk');
insert into CUSTOMERS (customerid, customername, customeremail)
values (268, 'Tcheky Coburn', 'tcheky.c@generalmills.ch');
insert into CUSTOMERS (customerid, customername, customeremail)
values (269, 'Cheryl Browne', 'cheryl@conquest.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (270, 'Cuba Dayne', 'c.dayne@ogi.it');
insert into CUSTOMERS (customerid, customername, customeremail)
values (271, 'Warren Law', 'warrenl@nat.jp');
insert into CUSTOMERS (customerid, customername, customeremail)
values (272, 'Tori Short', 'tori.short@lloydgroup.ca');
insert into CUSTOMERS (customerid, customername, customeremail)
values (273, 'Joaquin Wolf', 'j.wolf@astafunding.ca');
insert into CUSTOMERS (customerid, customername, customeremail)
values (274, 'Kate Houston', 'kate.houston@newhorizons.es');
insert into CUSTOMERS (customerid, customername, customeremail)
values (275, 'Betty Blades', 'b.blades@medamicus.es');
insert into CUSTOMERS (customerid, customername, customeremail)
values (276, 'Alannah McCormack', 'alannahm@curagroup.jp');
insert into CUSTOMERS (customerid, customername, customeremail)
values (277, 'Garry Whitford', 'garry.whitford@gillette.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (278, 'Garry Snipes', 'gsnipes@nha.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (279, 'Lari Brody', 'lari.b@stiknowledge.de');
insert into CUSTOMERS (customerid, customername, customeremail)
values (280, 'Melanie MacIsaac', 'mmacisaac@gagwear.be');
insert into CUSTOMERS (customerid, customername, customeremail)
values (281, 'Greg Nelligan', 'greg@tracertechnologies.de');
insert into CUSTOMERS (customerid, customername, customeremail)
values (282, 'Boyd Belle', 'b.belle@safeway.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (283, 'Bob Beckinsale', 'bob.beckinsale@timberlanewoodcrafters.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (284, 'Yaphet Stiller', 'yaphet@ntas.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (285, 'Jude Wolf', 'jude.w@securitycheck.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (286, 'Tia Rivers', 'tia.rivers@ecopy.es');
insert into CUSTOMERS (customerid, customername, customeremail)
values (287, 'Marty Firth', 'marty.f@virbac.hu');
insert into CUSTOMERS (customerid, customername, customeremail)
values (288, 'Isabella Orlando', 'isabella.orlando@jma.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (289, 'Bridgette Uggams', 'bridgette.uggams@safehomesecurity.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (290, 'Jimmy Belle', 'jimmy.belle@knightsbridge.nz');
insert into CUSTOMERS (customerid, customername, customeremail)
values (291, 'Natacha Gosdin', 'n.gosdin@vfs.it');
insert into CUSTOMERS (customerid, customername, customeremail)
values (292, 'Stevie Elliott', 'stevie.elliott@sears.uk');
insert into CUSTOMERS (customerid, customername, customeremail)
values (293, 'Larenz Ricci', 'larenz.ricci@bestbuy.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (294, 'Jane Dupree', 'jane.dupree@mre.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (295, 'Carl Cattrall', 'carl@callhenry.nl');
insert into CUSTOMERS (customerid, customername, customeremail)
values (296, 'Hope Dickinson', 'hope.dickinson@adolph.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (297, 'Gabrielle Coburn', 'gabrielle.coburn@hcoa.se');
insert into CUSTOMERS (customerid, customername, customeremail)
values (298, 'Rolando Moore', 'rolando.moore@unica.it');
insert into CUSTOMERS (customerid, customername, customeremail)
values (299, 'Juan Botti', 'juan.b@alohanysystems.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (300, 'Alice Guinness', 'alice.guinness@sandyspringbancorp.ca');
commit;
prompt 300 records committed...
insert into CUSTOMERS (customerid, customername, customeremail)
values (301, 'Joaquim Pitney', 'joaquim.pitney@dcgroup.pt');
insert into CUSTOMERS (customerid, customername, customeremail)
values (302, 'Jesse Willis', 'jesse.w@trc.ch');
insert into CUSTOMERS (customerid, customername, customeremail)
values (303, 'Wally Boyle', 'wally.boyle@connected.jp');
insert into CUSTOMERS (customerid, customername, customeremail)
values (304, 'Teena Caine', 'teena.c@questarcapital.jp');
insert into CUSTOMERS (customerid, customername, customeremail)
values (305, 'Ed Stiller', 'ed.s@mse.be');
insert into CUSTOMERS (customerid, customername, customeremail)
values (306, 'Clive Nugent', 'clive.nugent@at.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (307, 'Janeane Atlas', 'janeane.atlas@axis.si');
insert into CUSTOMERS (customerid, customername, customeremail)
values (308, 'Liev Gore', 'liev.g@vfs.ca');
insert into CUSTOMERS (customerid, customername, customeremail)
values (309, 'Allison Swinton', 'allison.swinton@gra.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (310, 'Delbert Secada', 'delberts@democracydata.fr');
insert into CUSTOMERS (customerid, customername, customeremail)
values (311, 'Jared Capshaw', 'jared.capshaw@epamsystems.uk');
insert into CUSTOMERS (customerid, customername, customeremail)
values (312, 'Benicio Jonze', 'b.jonze@coldstonecreamery.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (313, 'Treat Love', 'treat@virbac.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (314, 'Maxine Cochran', 'maxine@gsat.uk');
insert into CUSTOMERS (customerid, customername, customeremail)
values (315, 'Carl Olin', 'carl@capital.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (316, 'Bret Krabbe', 'bret.k@sds.fi');
insert into CUSTOMERS (customerid, customername, customeremail)
values (317, 'Stanley Mould', 'stanley.m@mag.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (318, 'Jonathan Guinness', 'jonathan@sci.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (319, 'Rosco Leto', 'rosco@gapinc.uk');
insert into CUSTOMERS (customerid, customername, customeremail)
values (320, 'Merrilee Foley', 'merrilee@webgroup.jp');
insert into CUSTOMERS (customerid, customername, customeremail)
values (321, 'Donal Ford', 'donal.ford@linersdirect.lt');
insert into CUSTOMERS (customerid, customername, customeremail)
values (322, 'Alfie Coolidge', 'alfie.coolidge@stonetechprofessional.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (323, 'Charles Englund', 'charles.englund@profitline.de');
insert into CUSTOMERS (customerid, customername, customeremail)
values (324, 'Lara Iglesias', 'liglesias@integratelecom.jp');
insert into CUSTOMERS (customerid, customername, customeremail)
values (325, 'Ruth Boothe', 'ruth.boothe@pharmafab.fr');
insert into CUSTOMERS (customerid, customername, customeremail)
values (326, 'Harvey Weiland', 'harveyw@priorityexpress.jp');
insert into CUSTOMERS (customerid, customername, customeremail)
values (327, 'Gran Spall', 'gran.spall@nuinfosystems.fr');
insert into CUSTOMERS (customerid, customername, customeremail)
values (328, 'Suzi Loveless', 'suzi@venoco.fr');
insert into CUSTOMERS (customerid, customername, customeremail)
values (329, 'Lili DeGraw', 'lili@nrae.ca');
insert into CUSTOMERS (customerid, customername, customeremail)
values (330, 'Kelly Gertner', 'kelly@swp.de');
insert into CUSTOMERS (customerid, customername, customeremail)
values (331, 'Cheech Mirren', 'cheech.mirren@its.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (332, 'Cheech Spears', 'cheech.spears@magnet.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (333, 'Alex Francis', 'alex.francis@aquickdelivery.uk');
insert into CUSTOMERS (customerid, customername, customeremail)
values (334, 'Nik Griffiths', 'nik.griffiths@scripnet.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (335, 'Clint Dunn', 'clint.dunn@mindiq.nl');
insert into CUSTOMERS (customerid, customername, customeremail)
values (336, 'Dick Shorter', 'dick.shorter@gsat.au');
insert into CUSTOMERS (customerid, customername, customeremail)
values (337, 'Eliza Baranski', 'eliza.b@elite.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (338, 'Jackie McAnally', 'jackie.mcanally@gha.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (339, 'Mary-Louise Cassidy', 'mcassidy@advancedneuromodulation.ch');
insert into CUSTOMERS (customerid, customername, customeremail)
values (340, 'Stephanie Thewlis', 'stephanie.t@sourcegear.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (341, 'Merrill Sinise', 'merrill@pearllawgroup.fr');
insert into CUSTOMERS (customerid, customername, customeremail)
values (342, 'Burton Lemmon', 'burton.lemmon@usenergyservices.uk');
insert into CUSTOMERS (customerid, customername, customeremail)
values (343, 'Rowan Lerner', 'rowan.lerner@techbooks.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (344, 'Sal Lang', 'sal.l@granitesystems.fi');
insert into CUSTOMERS (customerid, customername, customeremail)
values (345, 'Buddy Crowe', 'buddy.crowe@career.pt');
insert into CUSTOMERS (customerid, customername, customeremail)
values (346, 'Olympia Sample', 'olympia.sample@safeway.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (347, 'Simon Gray', 'simon.gray@netnumina.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (348, 'Albertina Douglas', 'albertina.douglas@air.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (349, 'Luis Kingsley', 'luis.kingsley@pulaskifinancial.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (350, 'Davey Hurley', 'davey.hurley@wellsfinancial.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (351, 'Woody Aglukark', 'woody.aglukark@jlphor.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (352, 'Ricky Cromwell', 'r.cromwell@callhenry.ch');
insert into CUSTOMERS (customerid, customername, customeremail)
values (353, 'Chrissie Arden', 'chrissie.a@bat.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (354, 'Dabney Torino', 'dabney.torino@lydiantrust.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (355, 'Terrence Osmond', 'tosmond@technica.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (356, 'Aimee Herrmann', 'aimee@speakeasy.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (357, 'Bryan Cocker', 'b.cocker@printcafesoftware.de');
insert into CUSTOMERS (customerid, customername, customeremail)
values (358, 'Wang McKennitt', 'wang@vfs.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (359, 'Edie Streep', 'edie.s@sunstream.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (360, 'Phoebe Chaplin', 'pchaplin@homedepot.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (361, 'Micky Northam', 'm.northam@ositissoftware.de');
insert into CUSTOMERS (customerid, customername, customeremail)
values (362, 'Albert Squier', 'albert.squier@evergreenresources.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (363, 'Toshiro Dolenz', 't.dolenz@tripwire.ch');
insert into CUSTOMERS (customerid, customername, customeremail)
values (364, 'Shawn Darren', 'shawn.darren@gcd.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (365, 'Teena Thurman', 'teena.thurman@ois.br');
insert into CUSTOMERS (customerid, customername, customeremail)
values (366, 'Lydia Satriani', 'lydia.satriani@spectrum.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (367, 'Morgan Briscoe', 'morgan.briscoe@mqsoftware.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (368, 'Tori Danger', 'tori.danger@accessus.nl');
insert into CUSTOMERS (customerid, customername, customeremail)
values (369, 'Fred Carrere', 'fred.carrere@fab.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (370, 'Oliver Overstreet', 'oliver.overstreet@reckittbenckiser.it');
insert into CUSTOMERS (customerid, customername, customeremail)
values (371, 'Alfred Blossoms', 'alfred.blossoms@dillards.br');
insert into CUSTOMERS (customerid, customername, customeremail)
values (372, 'Quentin Lindo', 'quentin.lindo@anheuserbusch.au');
insert into CUSTOMERS (customerid, customername, customeremail)
values (373, 'Gilbert Hingle', 'gilbert.hingle@capitalautomotive.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (374, 'Merrilee Isaak', 'merrilee.i@manhattanassociates.be');
insert into CUSTOMERS (customerid, customername, customeremail)
values (375, 'Rich Coyote', 'rich.coyote@tripwire.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (376, 'Eddie Devine', 'eddie.devine@fmb.za');
insert into CUSTOMERS (customerid, customername, customeremail)
values (377, 'Willem Phillips', 'willem@callhenry.dk');
insert into CUSTOMERS (customerid, customername, customeremail)
values (378, 'Suzy Torres', 'suzy.t@data.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (379, 'Rolando LaPaglia', 'rolando.lapaglia@datawarehouse.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (380, 'Jackson Busey', 'jbusey@gentrasystems.fi');
insert into CUSTOMERS (customerid, customername, customeremail)
values (381, 'Rachael Hector', 'rachael.hector@idas.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (382, 'Fionnula Harry', 'fionnula.h@spenser.br');
insert into CUSTOMERS (customerid, customername, customeremail)
values (383, 'Carole McIntyre', 'carole@onstaff.de');
insert into CUSTOMERS (customerid, customername, customeremail)
values (384, 'Stevie Stanton', 'stevie@hencie.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (385, 'Jesse Numan', 'jnuman@valleyoaksystems.si');
insert into CUSTOMERS (customerid, customername, customeremail)
values (386, 'Charles Mitchell', 'charles.mitchell@oriservices.uk');
insert into CUSTOMERS (customerid, customername, customeremail)
values (387, 'Ramsey Rooker', 'ramseyr@accesssystems.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (388, 'Eileen Berry', 'eberry@americanexpress.uk');
insert into CUSTOMERS (customerid, customername, customeremail)
values (389, 'Christine Gertner', 'c.gertner@sbc.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (390, 'Simon Nugent', 'simon.n@trinityhomecare.br');
insert into CUSTOMERS (customerid, customername, customeremail)
values (391, 'Alicia Schiavelli', 'alicia.schiavelli@usphysicaltherapy.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (392, 'Lonnie Robards', 'lonnie.robards@saralee.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (393, 'Olympia Farrow', 'olympia.farrow@prp.de');
insert into CUSTOMERS (customerid, customername, customeremail)
values (394, 'Rosco Cornell', 'rosco@bristolmyers.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (395, 'Chet Trevino', 'chet@ezecastlesoftware.ca');
insert into CUSTOMERS (customerid, customername, customeremail)
values (396, 'Thomas Berry', 'thomas.berry@grt.jp');
insert into CUSTOMERS (customerid, customername, customeremail)
values (397, 'Owen Starr', 'owen.starr@mathis.mx');
insert into CUSTOMERS (customerid, customername, customeremail)
values (398, 'Jaime Tobolowsky', 'jtobolowsky@horizonorganic.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (399, 'Rosie Dorn', 'rosied@air.br');
insert into CUSTOMERS (customerid, customername, customeremail)
values (400, 'Colm Garber', 'colm.garber@tastefullysimple.de');
commit;
prompt 400 records loaded
prompt Loading PRODUCTS...
insert into PRODUCTS (productid, productname, price)
values (1, 'Laptop', 999);
insert into PRODUCTS (productid, productname, price)
values (2, 'Smartphone', 499);
commit;
prompt 2 records loaded
prompt Loading SUPPLIERS...
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (1, 'Tech Supplies Inc.', 'contact@techsupplies.com');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (2, 'Gadget Wholesale', 'info@gadgetwholesale.com');
commit;
prompt 2 records loaded
prompt Loading INVENTORY...
insert into INVENTORY (inventoryid, productid, quantityinstock, lastrestockeddate, supplierid)
values (1, 1, 50, to_date('01-04-2024', 'dd-mm-yyyy'), 1);
insert into INVENTORY (inventoryid, productid, quantityinstock, lastrestockeddate, supplierid)
values (2, 2, 30, to_date('10-04-2024', 'dd-mm-yyyy'), 2);
commit;
prompt 2 records loaded
prompt Loading STAFF...
insert into STAFF (staffid, staffname, position, hiredate)
values (1, 'Alice Johnson', 'Cashier', to_date('15-01-2020', 'dd-mm-yyyy'));
insert into STAFF (staffid, staffname, position, hiredate)
values (2, 'Bob Brown', 'Manager', to_date('10-03-2019', 'dd-mm-yyyy'));
commit;
prompt 2 records loaded
prompt Loading SALES...
insert into SALES (saleid, dateofsale, totalamount, customerid, staffid)
values (1, to_date('01-05-2024', 'dd-mm-yyyy'), 1500, 1, 1);
insert into SALES (saleid, dateofsale, totalamount, customerid, staffid)
values (2, to_date('02-05-2024', 'dd-mm-yyyy'), 750, 2, 2);
commit;
prompt 2 records loaded
prompt Loading INVENTORYUSAGE...
insert into INVENTORYUSAGE (saleid, inventoryid)
values (1, 1);
insert into INVENTORYUSAGE (saleid, inventoryid)
values (2, 2);
commit;
prompt 2 records loaded
prompt Enabling foreign key constraints for INVENTORY...
alter table INVENTORY enable constraint SYS_C008444;
alter table INVENTORY enable constraint SYS_C008445;
prompt Enabling foreign key constraints for SALES...
alter table SALES enable constraint SYS_C008441;
alter table SALES enable constraint SYS_C008442;
prompt Enabling foreign key constraints for INVENTORYUSAGE...
alter table INVENTORYUSAGE enable constraint SYS_C008447;
alter table INVENTORYUSAGE enable constraint SYS_C008448;
prompt Enabling triggers for CUSTOMERS...
alter table CUSTOMERS enable all triggers;
prompt Enabling triggers for PRODUCTS...
alter table PRODUCTS enable all triggers;
prompt Enabling triggers for SUPPLIERS...
alter table SUPPLIERS enable all triggers;
prompt Enabling triggers for INVENTORY...
alter table INVENTORY enable all triggers;
prompt Enabling triggers for STAFF...
alter table STAFF enable all triggers;
prompt Enabling triggers for SALES...
alter table SALES enable all triggers;
prompt Enabling triggers for INVENTORYUSAGE...
alter table INVENTORYUSAGE enable all triggers;

set feedback on
set define on
prompt Done
