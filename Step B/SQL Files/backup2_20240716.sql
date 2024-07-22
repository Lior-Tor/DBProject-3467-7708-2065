prompt PL/SQL Developer Export Tables for user SYS@XE
prompt Created by tordj on 16 July 2024
set feedback off
set define off

prompt Creating CUSTOMERS...
create table CUSTOMERS
(
  customerid    INTEGER not null,
  customername  VARCHAR2(100) not null,
  customeremail VARCHAR2(100) not null
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
alter table CUSTOMERS
  add constraint CUSTOMER_EMAIL unique (CUSTOMEREMAIL)
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

prompt Creating EMPLOYEES...
create table EMPLOYEES
(
  employeeid   INTEGER not null,
  employeename VARCHAR2(100) not null,
  position     VARCHAR2(100) not null,
  hiredate     DATE not null
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
alter table EMPLOYEES
  add primary key (EMPLOYEEID)
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
  productid     INTEGER not null,
  productname   VARCHAR2(100) not null,
  price         INTEGER not null,
  typeofproduct VARCHAR2(100) not null
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
alter table PRODUCTS
  add constraint CHK_PRICE
  check (Price > 0);

prompt Creating SUPPLIERS...
create table SUPPLIERS
(
  supplierid    INTEGER not null,
  suppliername  VARCHAR2(100) not null,
  supplieremail VARCHAR2(100) not null
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
  quantity          INTEGER not null,
  lastrestockeddate DATE not null,
  productid         INTEGER not null,
  supplierid        INTEGER not null
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
alter table INVENTORY
  add constraint CHK_QUANTITY
  check (Quantity > 0);

prompt Creating SALES...
create table SALES
(
  saleid      INTEGER not null,
  dateofsale  DATE not null,
  totalamount INTEGER not null,
  customerid  INTEGER not null,
  employeeid  INTEGER not null
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
  add primary key (SALEID, CUSTOMERID, EMPLOYEEID)
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
  add foreign key (EMPLOYEEID)
  references EMPLOYEES (EMPLOYEEID);

prompt Creating PRODUCTSALES...
create table PRODUCTSALES
(
  saleid     INTEGER not null,
  customerid INTEGER not null,
  employeeid INTEGER not null,
  productid  INTEGER not null
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
alter table PRODUCTSALES
  add primary key (SALEID, CUSTOMERID, EMPLOYEEID, PRODUCTID)
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
alter table PRODUCTSALES
  add foreign key (SALEID, CUSTOMERID, EMPLOYEEID)
  references SALES (SALEID, CUSTOMERID, EMPLOYEEID);
alter table PRODUCTSALES
  add foreign key (PRODUCTID)
  references PRODUCTS (PRODUCTID);

prompt Disabling triggers for CUSTOMERS...
alter table CUSTOMERS disable all triggers;
prompt Disabling triggers for EMPLOYEES...
alter table EMPLOYEES disable all triggers;
prompt Disabling triggers for PRODUCTS...
alter table PRODUCTS disable all triggers;
prompt Disabling triggers for SUPPLIERS...
alter table SUPPLIERS disable all triggers;
prompt Disabling triggers for INVENTORY...
alter table INVENTORY disable all triggers;
prompt Disabling triggers for SALES...
alter table SALES disable all triggers;
prompt Disabling triggers for PRODUCTSALES...
alter table PRODUCTSALES disable all triggers;
prompt Disabling foreign key constraints for INVENTORY...
alter table INVENTORY disable constraint SYS_C009250;
alter table INVENTORY disable constraint SYS_C009251;
prompt Disabling foreign key constraints for SALES...
alter table SALES disable constraint SYS_C009242;
alter table SALES disable constraint SYS_C009243;
prompt Disabling foreign key constraints for PRODUCTSALES...
alter table PRODUCTSALES disable constraint SYS_C009257;
alter table PRODUCTSALES disable constraint SYS_C009258;
prompt Deleting PRODUCTSALES...
delete from PRODUCTSALES;
commit;
prompt Deleting SALES...
delete from SALES;
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
prompt Deleting EMPLOYEES...
delete from EMPLOYEES;
commit;
prompt Deleting CUSTOMERS...
delete from CUSTOMERS;
commit;
prompt Loading CUSTOMERS...
insert into CUSTOMERS (customerid, customername, customeremail)
values (1, 'Anne Garner', 'anne.garner@anheuserbusch.uk');
insert into CUSTOMERS (customerid, customername, customeremail)
values (2, 'Joey Bacharach', 'j.bacharach@usainstruments.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (3, 'Julia Callow', 'julia@worldcom.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (4, 'Allan McLean', 'allan.mclean@kingland.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (5, 'Jared Bogguss', 'jared.bogguss@ivorysystems.ch');
insert into CUSTOMERS (customerid, customername, customeremail)
values (6, 'Judd Winwood', 'judd.winwood@seiaarons.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (7, 'Sydney Warden', 'sydney.warden@intel.nz');
insert into CUSTOMERS (customerid, customername, customeremail)
values (8, 'Victoria Lindo', 'victoria.l@shot.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (9, 'Rod Ifans', 'rod.ifans@coadvantageresources.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (10, 'Wade Van Damme', 'wade.v@ait.nl');
insert into CUSTOMERS (customerid, customername, customeremail)
values (11, 'Vonda Aniston', 'vonda@ris.de');
insert into CUSTOMERS (customerid, customername, customeremail)
values (12, 'Chad Sedgwick', 'chad@swi.de');
insert into CUSTOMERS (customerid, customername, customeremail)
values (13, 'Machine Griffiths', 'machine.griffiths@kingland.br');
insert into CUSTOMERS (customerid, customername, customeremail)
values (14, 'Keanu Richter', 'keanu.r@navigatorsystems.ch');
insert into CUSTOMERS (customerid, customername, customeremail)
values (15, 'Kelli Lapointe', 'kelli.lapointe@glmt.br');
insert into CUSTOMERS (customerid, customername, customeremail)
values (16, 'Rupert Drive', 'rupert.drive@grt.fr');
insert into CUSTOMERS (customerid, customername, customeremail)
values (17, 'Harrison Sherman', 'harrison.sherman@nha.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (18, 'Viggo Briscoe', 'viggo@mavericktechnologies.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (19, 'Fats Lucas', 'fats.l@emt.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (20, 'Todd Rodgers', 'todd.rodgers@royalgold.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (21, 'Sona Craddock', 'sona.craddock@gbas.jp');
insert into CUSTOMERS (customerid, customername, customeremail)
values (22, 'Kyra Matthau', 'kyra.matthau@philipmorris.uk');
insert into CUSTOMERS (customerid, customername, customeremail)
values (23, 'Chris Dreyfuss', 'c.dreyfuss@freedommedical.uk');
insert into CUSTOMERS (customerid, customername, customeremail)
values (24, 'Vondie Brickell', 'vondie.brickell@credopetroleum.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (25, 'Lionel Guinness', 'lionel.g@invisioncom.es');
insert into CUSTOMERS (customerid, customername, customeremail)
values (26, 'Taryn Williamson', 'taryn.williamson@freedommedical.jp');
insert into CUSTOMERS (customerid, customername, customeremail)
values (27, 'Remy Jessee', 'remy.jessee@conquest.uk');
insert into CUSTOMERS (customerid, customername, customeremail)
values (28, 'Timothy Salonga', 'timothys@appriss.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (29, 'Night Jones', 'night.jones@kramontrealty.de');
insert into CUSTOMERS (customerid, customername, customeremail)
values (30, 'Tzi Shepard', 'tzi.shepard@ecopy.pe');
insert into CUSTOMERS (customerid, customername, customeremail)
values (31, 'Javon Barry', 'javon.barry@innovativelighting.is');
insert into CUSTOMERS (customerid, customername, customeremail)
values (32, 'Kazem Reynolds', 'kreynolds@progressivemedical.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (33, 'Marley Spader', 'marley.spader@prometheuslaboratories.no');
insert into CUSTOMERS (customerid, customername, customeremail)
values (34, 'Miranda Collette', 'miranda.collette@atxforms.ca');
insert into CUSTOMERS (customerid, customername, customeremail)
values (35, 'Gavin Hurley', 'gavin.h@priorityexpress.uk');
insert into CUSTOMERS (customerid, customername, customeremail)
values (36, 'Faye Garofalo', 'faye.garofalo@usgovernment.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (37, 'Fisher Mueller-Stahl', 'fisherm@kitba.de');
insert into CUSTOMERS (customerid, customername, customeremail)
values (38, 'Katie Weston', 'katie.weston@codykramerimports.fr');
insert into CUSTOMERS (customerid, customername, customeremail)
values (39, 'Andy Holeman', 'aholeman@cardtronics.dk');
insert into CUSTOMERS (customerid, customername, customeremail)
values (40, 'Bruce Makeba', 'brucem@berkshirehathaway.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (41, 'Vondie Eastwood', 'vondiee@cyberthink.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (42, 'Cheech Donovan', 'cheech.donovan@coridiantechnologies.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (43, 'Johnnie Elwes', 'johnnie.e@employerservices.th');
insert into CUSTOMERS (customerid, customername, customeremail)
values (44, 'Ozzy Swayze', 'o.swayze@cmi.uk');
insert into CUSTOMERS (customerid, customername, customeremail)
values (45, 'Fisher Teng', 'fisher.t@valleyoaksystems.sg');
insert into CUSTOMERS (customerid, customername, customeremail)
values (46, 'Willem Crystal', 'wcrystal@surmodics.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (47, 'Grant Teng', 'g.teng@harrison.cn');
insert into CUSTOMERS (customerid, customername, customeremail)
values (48, 'Rich Patton', 'rpatton@dps.ca');
insert into CUSTOMERS (customerid, customername, customeremail)
values (49, 'Tea Pleasence', 't.pleasence@generalmills.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (50, 'Ann Mitchell', 'ann@merck.de');
insert into CUSTOMERS (customerid, customername, customeremail)
values (51, 'Mandy Jane', 'mandy@accesssystems.it');
insert into CUSTOMERS (customerid, customername, customeremail)
values (52, 'Debi Dern', 'debi.dern@servicelink.de');
insert into CUSTOMERS (customerid, customername, customeremail)
values (53, 'Aida Beck', 'aida.beck@usgovernment.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (54, 'Kate Shepard', 'kate@actechnologies.be');
insert into CUSTOMERS (customerid, customername, customeremail)
values (55, 'Rita Levy', 'rita.levy@pscinfogroup.be');
insert into CUSTOMERS (customerid, customername, customeremail)
values (56, 'Lucinda Lauper', 'lucinda.lauper@albertsons.nl');
insert into CUSTOMERS (customerid, customername, customeremail)
values (57, 'Carlos Liu', 'carlosl@dell.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (58, 'Bret Carrington', 'bret.carrington@waltdisney.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (59, 'Gil Conners', 'gil.conners@ipsadvisory.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (60, 'Stewart Simpson', 'stewart@target.no');
insert into CUSTOMERS (customerid, customername, customeremail)
values (61, 'Ned Clinton', 'ned.clinton@ungertechnologies.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (62, 'Davy Scheider', 'davy.scheider@pioneerdatasystems.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (63, 'Anjelica Sanders', 'anjelica.sanders@mindworks.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (64, 'Lindsay Henriksen', 'lhenriksen@younginnovations.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (65, 'Mykelti Barrymore', 'mykelti@slt.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (66, 'Hikaru Dzundza', 'hikaru.dzundza@socketinternet.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (67, 'Jack Oldman', 'jack.oldman@abs.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (68, 'Sal Kershaw', 'sal.kershaw@team.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (69, 'Mykelti Nicholson', 'mykelti.nicholson@prahs.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (70, 'Andie Biel', 'andie.biel@trekequipment.uk');
insert into CUSTOMERS (customerid, customername, customeremail)
values (71, 'Sara Derringer', 'sara@dcgroup.br');
insert into CUSTOMERS (customerid, customername, customeremail)
values (72, 'Vonda Yankovic', 'vonda@doctorsassociates.it');
insert into CUSTOMERS (customerid, customername, customeremail)
values (73, 'Tobey Torino', 'tobey.torino@sbc.dk');
insert into CUSTOMERS (customerid, customername, customeremail)
values (74, 'Dorry Downie', 'dorry.downie@atlanticnet.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (75, 'Rhys Belles', 'rhys.belles@yashtechnologies.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (76, 'Alessandro Aaron', 'alessandro.aaron@capstone.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (77, 'Jared Edmunds', 'jared.edmunds@saksinc.ca');
insert into CUSTOMERS (customerid, customername, customeremail)
values (78, 'Dar Martin', 'dar.m@saksinc.jp');
insert into CUSTOMERS (customerid, customername, customeremail)
values (79, 'Carl Nolte', 'carl.nolte@cardtronics.it');
insert into CUSTOMERS (customerid, customername, customeremail)
values (80, 'Ned Bedelia', 'ned.bedelia@mosaic.de');
insert into CUSTOMERS (customerid, customername, customeremail)
values (81, 'Gailard Mills', 'gailard.m@trekequipment.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (82, 'Breckin Diggs', 'breckin@innovativelighting.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (83, 'Bebe Grier', 'bebe.grier@unicru.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (84, 'Ivan Davidtz', 'i.davidtz@usphysicaltherapy.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (85, 'Oro Valentin', 'orov@sunstream.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (86, 'Mint Bancroft', 'mintb@interfacesoftware.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (87, 'Radney Conroy', 'radney.c@freedommedical.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (88, 'Vincent Choice', 'vincent.choice@sfb.de');
insert into CUSTOMERS (customerid, customername, customeremail)
values (89, 'Jackson Kinski', 'jackson@axis.uk');
insert into CUSTOMERS (customerid, customername, customeremail)
values (90, 'Milla Carrington', 'milla.carrington@profitline.es');
insert into CUSTOMERS (customerid, customername, customeremail)
values (91, 'Judy Jane', 'judy.jane@scripnet.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (92, 'Melba Fisher', 'mfisher@amerisourcefunding.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (93, 'Rodney Venora', 'rodneyv@pioneerdatasystems.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (94, 'Adrien Evans', 'aevans@sds.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (95, 'Ice Robards', 'ice.r@portageenvironmental.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (96, 'Tracy Sarsgaard', 'tracy.sarsgaard@pfizer.cr');
insert into CUSTOMERS (customerid, customername, customeremail)
values (97, 'Bo Steiger', 'bos@investorstitle.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (98, 'Norm Weston', 'norm.weston@seiaarons.mo');
insert into CUSTOMERS (customerid, customername, customeremail)
values (99, 'Arnold Sweeney', 'arnold.sweeney@shot.de');
insert into CUSTOMERS (customerid, customername, customeremail)
values (100, 'Jarvis Mirren', 'jarvis.mirren@jma.uk');
commit;
prompt 100 records committed...
insert into CUSTOMERS (customerid, customername, customeremail)
values (101, 'Garry Guinness', 'garry.guinness@usphysicaltherapy.it');
insert into CUSTOMERS (customerid, customername, customeremail)
values (102, 'Jackie Pleasure', 'jackie.pleasure@wav.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (103, 'Julie Skerritt', 'jskerritt@coldstonecreamery.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (104, 'Brian Yankovic', 'brian.yankovic@nhhc.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (105, 'Curt Davidtz', 'curt.davidtz@knightsbridge.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (106, 'Art Wright', 'art.wright@nrae.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (107, 'Xander Blige', 'xander.blige@generalmotors.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (108, 'Lupe Warren', 'lupew@signalperfection.nl');
insert into CUSTOMERS (customerid, customername, customeremail)
values (109, 'Woody Coyote', 'woody@visionarysystems.de');
insert into CUSTOMERS (customerid, customername, customeremail)
values (110, 'Kay Black', 'kay.black@pfizer.it');
insert into CUSTOMERS (customerid, customername, customeremail)
values (111, 'Burt Hedaya', 'burt.hedaya@mls.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (112, 'Miko Santa Rosa', 'miko.s@trusecure.it');
insert into CUSTOMERS (customerid, customername, customeremail)
values (113, 'Madeline Rhames', 'madeliner@greene.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (114, 'Parker Weisz', 'parker.w@telecheminternational.se');
insert into CUSTOMERS (customerid, customername, customeremail)
values (115, 'Matthew Elwes', 'matthew.elwes@solipsys.ca');
insert into CUSTOMERS (customerid, customername, customeremail)
values (116, 'Dylan McConaughey', 'dylan.mcconaughey@httprint.de');
insert into CUSTOMERS (customerid, customername, customeremail)
values (117, 'Dar Gilliam', 'dar.g@pfizer.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (118, 'Geoffrey Rain', 'geoffrey@restaurantpartners.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (119, 'Allison Spector', 'aspector@prometheuslaboratories.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (120, 'Gavin Young', 'gavin.young@conquestsystems.uk');
insert into CUSTOMERS (customerid, customername, customeremail)
values (121, 'Roscoe Matthau', 'roscoe.matthau@sprint.ca');
insert into CUSTOMERS (customerid, customername, customeremail)
values (122, 'Trace Turner', 'trace.t@toyotamotor.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (123, 'Grant Chao', 'grant.c@onesourceprinting.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (124, 'Hazel Dolenz', 'hazel@telwares.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (125, 'Gilberto urban', 'gilbertou@pib.uk');
insert into CUSTOMERS (customerid, customername, customeremail)
values (126, 'Gordie Brosnan', 'gordie.brosnan@mcdonalds.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (127, 'Stanley Coverdale', 'stanley.coverdale@pharmafab.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (128, 'Coley Jane', 'coley.jane@wav.de');
insert into CUSTOMERS (customerid, customername, customeremail)
values (129, 'Oliver Roundtree', 'oroundtree@multimedialive.br');
insert into CUSTOMERS (customerid, customername, customeremail)
values (130, 'Johnny De Almeida', 'j.dealmeida@younginnovations.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (131, 'Rhea Spears', 'rhea.spears@harrison.de');
insert into CUSTOMERS (customerid, customername, customeremail)
values (132, 'Hookah Sanders', 'hookah.sanders@efcbancorp.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (133, 'Alana Winslet', 'alana.winslet@sfgo.de');
insert into CUSTOMERS (customerid, customername, customeremail)
values (134, 'Allan Gray', 'allan.g@vertexsolutions.au');
insert into CUSTOMERS (customerid, customername, customeremail)
values (135, 'Kevn Venora', 'kvenora@heartlab.mx');
insert into CUSTOMERS (customerid, customername, customeremail)
values (136, 'Zooey Jonze', 'zooey.jonze@abs.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (137, 'Jon LuPone', 'jon.lupone@acsis.it');
insert into CUSTOMERS (customerid, customername, customeremail)
values (138, 'Emma Gellar', 'emma@cima.jp');
insert into CUSTOMERS (customerid, customername, customeremail)
values (139, 'Samuel Speaks', 'samuel.speaks@abs.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (140, 'Sander Parker', 'sander.parker@viacom.jp');
insert into CUSTOMERS (customerid, customername, customeremail)
values (141, 'Andy Caine', 'andy.caine@hotmail.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (142, 'Ralph Rossellini', 'ralph.rossellini@spectrum.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (143, 'Sarah Joli', 'sarah.joli@doraldentalusa.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (144, 'Kenny Barkin', 'kenny@viacom.ca');
insert into CUSTOMERS (customerid, customername, customeremail)
values (145, 'Sona Deschanel', 'sdeschanel@morganresearch.nz');
insert into CUSTOMERS (customerid, customername, customeremail)
values (146, 'Rupert Reinhold', 'rupertr@veritekinternational.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (147, 'Melba Mac', 'mmac@savela.au');
insert into CUSTOMERS (customerid, customername, customeremail)
values (148, 'Ike Drive', 'ike@pragmatechsoftware.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (149, 'Kenny Channing', 'kenny.channing@telepoint.br');
insert into CUSTOMERS (customerid, customername, customeremail)
values (150, 'Maureen Robinson', 'maureen@totalentertainment.ch');
insert into CUSTOMERS (customerid, customername, customeremail)
values (151, 'Edie Byrne', 'edie.b@hcoa.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (152, 'Lily Kramer', 'lily.kramer@smi.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (153, 'Jesse Myles', 'jesse.myles@bis.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (154, 'Christine Vanian', 'christine@zoneperfectnutrition.ca');
insert into CUSTOMERS (customerid, customername, customeremail)
values (155, 'Lizzy Adler', 'lizzy.adler@telwares.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (156, 'Lois Curfman', 'l.curfman@mss.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (157, 'Kay Rhames', 'krhames@dell.jp');
insert into CUSTOMERS (customerid, customername, customeremail)
values (158, 'Merrilee Rauhofer', 'merrilee.rauhofer@ams.il');
insert into CUSTOMERS (customerid, customername, customeremail)
values (159, 'Kiefer Cotton', 'kiefer.cotton@procurementcentre.lt');
insert into CUSTOMERS (customerid, customername, customeremail)
values (160, 'Geoff Lonsdale', 'geoff.lonsdale@atlanticnet.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (161, 'Aimee Diehl', 'aimee.diehl@restaurantpartners.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (162, 'Gordie Holbrook', 'gordie.holbrook@kingston.jp');
insert into CUSTOMERS (customerid, customername, customeremail)
values (163, 'Gina King', 'gina.king@americanexpress.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (164, 'Miles Vanian', 'miles.v@generalmills.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (165, 'Manu Channing', 'm.channing@medsource.de');
insert into CUSTOMERS (customerid, customername, customeremail)
values (166, 'Joey Reubens', 'joey.reubens@primussoftware.no');
insert into CUSTOMERS (customerid, customername, customeremail)
values (167, 'Jeroen Nash', 'jeroen.nash@reckittbenckiser.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (168, 'Carrie Scott', 'carrie.scott@privatebancorp.jp');
insert into CUSTOMERS (customerid, customername, customeremail)
values (169, 'Curt Crewson', 'curt.crewson@stm.jp');
insert into CUSTOMERS (customerid, customername, customeremail)
values (170, 'Mia Dalley', 'mia.d@newhorizons.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (171, 'Roscoe Collette', 'r.collette@fds.de');
insert into CUSTOMERS (customerid, customername, customeremail)
values (172, 'Petula Bergen', 'petula.bergen@socketinternet.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (173, 'Cheech McGoohan', 'cheech.mcgoohan@denaliventures.ch');
insert into CUSTOMERS (customerid, customername, customeremail)
values (174, 'Thora Swayze', 'thora.swayze@sbc.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (175, 'Ritchie Boothe', 'ritchie.b@swi.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (176, 'Harrison Schneider', 'h.schneider@meghasystems.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (177, 'Petula Johansson', 'petula.johansson@unica.tr');
insert into CUSTOMERS (customerid, customername, customeremail)
values (178, 'Al DeVita', 'al.devita@dearbornbancorp.uk');
insert into CUSTOMERS (customerid, customername, customeremail)
values (179, 'Garry Mould', 'garry.m@nat.ca');
insert into CUSTOMERS (customerid, customername, customeremail)
values (180, 'Amy Clayton', 'amy.clayton@millersystems.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (181, 'Lee Albright', 'lee.a@marketbased.uk');
insert into CUSTOMERS (customerid, customername, customeremail)
values (182, 'Mos Herrmann', 'mos.herrmann@aoltimewarner.dk');
insert into CUSTOMERS (customerid, customername, customeremail)
values (183, 'Clive Newton', 'clive@ivci.it');
insert into CUSTOMERS (customerid, customername, customeremail)
values (184, 'Nastassja LaPaglia', 'nastassja.lapaglia@northhighland.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (185, 'Michelle Heche', 'michelle@oss.ca');
insert into CUSTOMERS (customerid, customername, customeremail)
values (186, 'Edie Summer', 'edie.summer@webgroup.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (187, 'Mika Coverdale', 'm.coverdale@parksite.de');
insert into CUSTOMERS (customerid, customername, customeremail)
values (188, 'Lenny Bedelia', 'l.bedelia@fpf.de');
insert into CUSTOMERS (customerid, customername, customeremail)
values (189, 'Wes Brosnan', 'wes.brosnan@ams.uk');
insert into CUSTOMERS (customerid, customername, customeremail)
values (190, 'Giancarlo Tambor', 'giancarlo.tambor@oss.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (191, 'Sal Elliott', 'sal.elliott@fmt.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (192, 'Edward Kline', 'edward.k@prosperitybancshares.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (193, 'Austin Winans', 'a.winans@berkshirehathaway.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (194, 'Ceili MacPherson', 'cmacpherson@base.it');
insert into CUSTOMERS (customerid, customername, customeremail)
values (195, 'Richard Singletary', 'richard.s@mss.ca');
insert into CUSTOMERS (customerid, customername, customeremail)
values (196, 'Vonda Heston', 'vonda.heston@pharmafab.au');
insert into CUSTOMERS (customerid, customername, customeremail)
values (197, 'Tyrone Blaine', 'tyrone.blaine@usainstruments.de');
insert into CUSTOMERS (customerid, customername, customeremail)
values (198, 'Joey Chambers', 'joey.chambers@networkdisplay.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (199, 'Elias Union', 'elias@doraldentalusa.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (200, 'Edwin Singh', 'edwin.singh@denaliventures.br');
commit;
prompt 200 records committed...
insert into CUSTOMERS (customerid, customername, customeremail)
values (201, 'Talvin Valentin', 'talvin.valentin@avr.de');
insert into CUSTOMERS (customerid, customername, customeremail)
values (202, 'Rhys Tinsley', 'rtinsley@softworld.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (203, 'Andie Wincott', 'andie.w@gdi.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (204, 'Cornell Stuermer', 'cstuermer@calence.jp');
insert into CUSTOMERS (customerid, customername, customeremail)
values (205, 'Rade Shatner', 'rade.s@cardtronics.de');
insert into CUSTOMERS (customerid, customername, customeremail)
values (206, 'Chad Gaynor', 'chadg@millersystems.jp');
insert into CUSTOMERS (customerid, customername, customeremail)
values (207, 'Taryn Feuerstein', 'tarynf@inspirationsoftware.ca');
insert into CUSTOMERS (customerid, customername, customeremail)
values (208, 'Dustin Speaks', 'dustin@tmaresources.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (209, 'Rory McCann', 'rory.m@smartronix.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (210, 'Tim Sampson', 'tim.sampson@hencie.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (211, 'Katie Quatro', 'katie.quatro@ipsadvisory.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (212, 'Lenny Astin', 'lenny.astin@bis.id');
insert into CUSTOMERS (customerid, customername, customeremail)
values (213, 'Kim Parm', 'kim.parm@cimalabs.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (214, 'Howie Dourif', 'howie.dourif@fra.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (215, 'Ani Reynolds', 'ani.reynolds@unitedasset.de');
insert into CUSTOMERS (customerid, customername, customeremail)
values (216, 'Lin Myers', 'lin.myers@nissanmotor.ch');
insert into CUSTOMERS (customerid, customername, customeremail)
values (217, 'Quentin Burton', 'quentin.burton@horizon.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (218, 'Ashton Bonneville', 'ashton.bonneville@ceo.fr');
insert into CUSTOMERS (customerid, customername, customeremail)
values (219, 'Leonardo Lyonne', 'leonardo.lyonne@bigyanksports.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (220, 'Joely Harrison', 'joely.h@proclarity.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (221, 'Celia Howard', 'celia.howard@apexsystems.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (222, 'Rodney Apple', 'rodney.a@marketbased.uk');
insert into CUSTOMERS (customerid, customername, customeremail)
values (223, 'Tracy Makowicz', 'tracy.makowicz@printingforlesscom.br');
insert into CUSTOMERS (customerid, customername, customeremail)
values (224, 'Jared Reubens', 'jared.reubens@jsa.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (225, 'Wayne Liotta', 'wayne.liotta@tilsonhr.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (226, 'Stevie Diaz', 'stevie.diaz@younginnovations.uk');
insert into CUSTOMERS (customerid, customername, customeremail)
values (227, 'Marty Cattrall', 'marty.cattrall@evergreenresources.br');
insert into CUSTOMERS (customerid, customername, customeremail)
values (228, 'Miranda Parsons', 'miranda@elite.au');
insert into CUSTOMERS (customerid, customername, customeremail)
values (229, 'George Malkovich', 'george.malkovich@gdi.ch');
insert into CUSTOMERS (customerid, customername, customeremail)
values (230, 'Natacha Dillon', 'natacha.dillon@ceom.de');
insert into CUSTOMERS (customerid, customername, customeremail)
values (231, 'Annette Gatlin', 'a.gatlin@learningvoyage.ca');
insert into CUSTOMERS (customerid, customername, customeremail)
values (232, 'Rickie Potter', 'rickie@sms.au');
insert into CUSTOMERS (customerid, customername, customeremail)
values (233, 'Martha Rhys-Davies', 'mrhysdavies@jsa.de');
insert into CUSTOMERS (customerid, customername, customeremail)
values (234, 'Greg urban', 'greg.urban@prometheuslaboratories.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (235, 'Goldie Morse', 'goldie.morse@wav.yu');
insert into CUSTOMERS (customerid, customername, customeremail)
values (236, 'Jeremy Pacino', 'j.pacino@venoco.uk');
insert into CUSTOMERS (customerid, customername, customeremail)
values (237, 'William Dench', 'wdench@bluffcitysteel.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (238, 'Neneh Matthau', 'neneh.matthau@diageo.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (239, 'Gil Snow', 'gil.snow@greene.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (240, 'Marie English', 'marie.english@bluffcitysteel.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (241, 'Frankie Danes', 'frankie.danes@3tsystems.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (242, 'Mindy Lynskey', 'm.lynskey@yashtechnologies.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (243, 'Hazel Gagnon', 'hazel@emt.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (244, 'Kirsten Bratt', 'kirsten.bratt@signalperfection.de');
insert into CUSTOMERS (customerid, customername, customeremail)
values (245, 'Jean-Luc Weir', 'jweir@serentec.jp');
insert into CUSTOMERS (customerid, customername, customeremail)
values (246, 'LeVar Cozier', 'lcozier@data.pe');
insert into CUSTOMERS (customerid, customername, customeremail)
values (247, 'Ronny Schreiber', 'r.schreiber@bluffcitysteel.es');
insert into CUSTOMERS (customerid, customername, customeremail)
values (248, 'Janeane Winslet', 'janeanew@whitewave.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (249, 'Edwin Laws', 'e.laws@streetglow.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (250, 'Emerson Gooding', 'emerson.g@gcd.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (251, 'Johnnie Taylor', 'jtaylor@tlsservicebureau.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (252, 'Greg Del Toro', 'greg.deltoro@nhhc.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (253, 'Eric Blades', 'eblades@topicsentertainment.ca');
insert into CUSTOMERS (customerid, customername, customeremail)
values (254, 'Glen Richards', 'glen@glacierbancorp.fi');
insert into CUSTOMERS (customerid, customername, customeremail)
values (255, 'Cloris Begley', 'cloris.begley@calence.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (256, 'Pat Malkovich', 'pat.m@conagra.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (257, 'Natasha Crystal', 'natasha.c@jewettcameron.de');
insert into CUSTOMERS (customerid, customername, customeremail)
values (258, 'Cledus Cox', 'cledus.cox@summitenergy.jp');
insert into CUSTOMERS (customerid, customername, customeremail)
values (259, 'Neil McGregor', 'n.mcgregor@genghisgrill.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (260, 'Regina Venora', 'regina@solipsys.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (261, 'Christina Askew', 'christina.askew@nrae.es');
insert into CUSTOMERS (customerid, customername, customeremail)
values (262, 'Sharon Dukakis', 'sharon@fam.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (263, 'Ruth Rispoli', 'ruth@genghisgrill.cr');
insert into CUSTOMERS (customerid, customername, customeremail)
values (264, 'Jimmie Place', 'jimmie.place@kellogg.uk');
insert into CUSTOMERS (customerid, customername, customeremail)
values (265, 'Gina Spacek', 'g.spacek@powerlight.pe');
insert into CUSTOMERS (customerid, customername, customeremail)
values (266, 'Cate Badalucco', 'cate.badalucco@emt.br');
insert into CUSTOMERS (customerid, customername, customeremail)
values (267, 'Isabella Penders', 'isabella.penders@gtp.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (268, 'Carrie-Anne Stills', 'carrieanne.stills@hotmail.dk');
insert into CUSTOMERS (customerid, customername, customeremail)
values (269, 'Sarah Wen', 'sarah.w@socketinternet.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (270, 'Carla Winwood', 'carla.winwood@als.jp');
insert into CUSTOMERS (customerid, customername, customeremail)
values (271, 'Chloe Singh', 'chloes@glaxosmithkline.ca');
insert into CUSTOMERS (customerid, customername, customeremail)
values (272, 'Leo Mahood', 'leo.mahood@servicesource.jp');
insert into CUSTOMERS (customerid, customername, customeremail)
values (273, 'Omar Russell', 'omar.russell@capitolbancorp.de');
insert into CUSTOMERS (customerid, customername, customeremail)
values (274, 'Matthew Manning', 'matthew.manning@mainstreetbanks.za');
insert into CUSTOMERS (customerid, customername, customeremail)
values (275, 'Debi Biel', 'debi@infinity.de');
insert into CUSTOMERS (customerid, customername, customeremail)
values (276, 'Liquid Atkins', 'liquid.atkins@montpelierplastics.de');
insert into CUSTOMERS (customerid, customername, customeremail)
values (277, 'Loreena Fox', 'loreena.f@universalsolutions.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (278, 'Terrence Rodgers', 'terrence.r@dearbornbancorp.no');
insert into CUSTOMERS (customerid, customername, customeremail)
values (279, 'Famke Skaggs', 'famke.skaggs@supplycorecom.jp');
insert into CUSTOMERS (customerid, customername, customeremail)
values (280, 'Hazel Cleary', 'hazel.cleary@jsa.nl');
insert into CUSTOMERS (customerid, customername, customeremail)
values (281, 'Selma Redgrave', 'selma.redgrave@unica.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (282, 'Hope Sossamon', 'hope.sossamon@hatworld.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (283, 'Stellan Pepper', 'stellan.pepper@diageo.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (284, 'Vince Underwood', 'vince.underwood@telwares.ca');
insert into CUSTOMERS (customerid, customername, customeremail)
values (285, 'Solomon Raybon', 'solomon.r@seafoxboat.au');
insert into CUSTOMERS (customerid, customername, customeremail)
values (286, 'Adrien Wright', 'adrien.wright@axis.jp');
insert into CUSTOMERS (customerid, customername, customeremail)
values (287, 'Jason Roy Parnell', 'jason.royparnell@ass.au');
insert into CUSTOMERS (customerid, customername, customeremail)
values (288, 'Eddie Murphy', 'eddie@gagwear.nl');
insert into CUSTOMERS (customerid, customername, customeremail)
values (289, 'Brothers Humphrey', 'brothers.humphrey@gagwear.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (290, 'Brad Parker', 'brad.parker@tigris.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (291, 'Nelly Sanders', 'nellys@myricom.hu');
insert into CUSTOMERS (customerid, customername, customeremail)
values (292, 'Joan Sarsgaard', 'joan.s@bigdoughcom.de');
insert into CUSTOMERS (customerid, customername, customeremail)
values (293, 'Benicio Pearce', 'benicio@diageo.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (294, 'Kathleen Oates', 'kathleen.o@webgroup.nl');
insert into CUSTOMERS (customerid, customername, customeremail)
values (295, 'Merillee De Almeida', 'merillee.dealmeida@campbellsoup.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (296, 'Neve Shelton', 'neve.shelton@newviewgifts.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (297, 'Geoff Dreyfuss', 'geoff.dreyfuss@jsa.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (298, 'Heath Chinlund', 'heath.c@democracydata.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (299, 'Chalee Van Damme', 'chaleev@nbs.br');
insert into CUSTOMERS (customerid, customername, customeremail)
values (300, 'Leon Cozier', 'leon.cozier@networkdisplay.br');
commit;
prompt 300 records committed...
insert into CUSTOMERS (customerid, customername, customeremail)
values (301, 'Manu Gordon', 'manu.gordon@aristotle.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (302, 'Lea Hingle', 'l.hingle@biosite.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (303, 'France Addy', 'france.addy@novartis.de');
insert into CUSTOMERS (customerid, customername, customeremail)
values (304, 'Aimee Day-Lewis', 'aimeed@walmartstores.uk');
insert into CUSTOMERS (customerid, customername, customeremail)
values (305, 'Victor King', 'victor@servicesource.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (306, 'Carrie Frost', 'carrie.frost@curagroup.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (307, 'Cevin Strathairn', 'cevin.strathairn@kingston.nz');
insert into CUSTOMERS (customerid, customername, customeremail)
values (308, 'Kazem Phoenix', 'kphoenix@tps.in');
insert into CUSTOMERS (customerid, customername, customeremail)
values (309, 'Mika Freeman', 'mika.freeman@north.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (310, 'Brooke Sample', 'brooke.sample@csi.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (311, 'Ceili Nash', 'ceili.nash@onstaff.de');
insert into CUSTOMERS (customerid, customername, customeremail)
values (312, 'Joaquim Aglukark', 'joaquim.aglukark@deutschetelekom.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (313, 'Denny Coughlan', 'denny.coughlan@onesourceprinting.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (314, 'Sigourney Pleasence', 'sigourney@glmt.br');
insert into CUSTOMERS (customerid, customername, customeremail)
values (315, 'Fionnula Smith', 'fionnula.smith@usainstruments.nl');
insert into CUSTOMERS (customerid, customername, customeremail)
values (316, 'Liam Cassidy', 'liam.cassidy@usainstruments.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (317, 'Buddy McFadden', 'b.mcfadden@sfgo.au');
insert into CUSTOMERS (customerid, customername, customeremail)
values (318, 'Donal Williamson', 'donal.williamson@nhr.il');
insert into CUSTOMERS (customerid, customername, customeremail)
values (319, 'Jeanne Palminteri', 'jeanne.palminteri@msdw.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (320, 'Gena Noseworthy', 'gnoseworthy@staffone.uk');
insert into CUSTOMERS (customerid, customername, customeremail)
values (321, 'Samantha Jordan', 'samantha@yumbrands.de');
insert into CUSTOMERS (customerid, customername, customeremail)
values (322, 'Javon Moore', 'javonm@hardwoodwholesalers.fr');
insert into CUSTOMERS (customerid, customername, customeremail)
values (323, 'Moe Potter', 'moe.potter@tracertechnologies.at');
insert into CUSTOMERS (customerid, customername, customeremail)
values (324, 'Rickie Feuerstein', 'rickie.f@blueoceansoftware.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (325, 'First Brock', 'f.brock@meridiangold.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (326, 'Frederic Zane', 'frederic@mindiq.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (327, 'Lara Senior', 'lara.senior@air.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (328, 'Miko Ellis', 'mellis@grayhawksystems.uk');
insert into CUSTOMERS (customerid, customername, customeremail)
values (329, 'Delbert Statham', 'delberts@safehomesecurity.pt');
insert into CUSTOMERS (customerid, customername, customeremail)
values (330, 'Derrick Karyo', 'derrick.karyo@timevision.ge');
insert into CUSTOMERS (customerid, customername, customeremail)
values (331, 'Mickey Mueller-Stahl', 'mickey.muellerstahl@actechnologies.uk');
insert into CUSTOMERS (customerid, customername, customeremail)
values (332, 'Freddie Moraz', 'freddie.moraz@ezecastlesoftware.de');
insert into CUSTOMERS (customerid, customername, customeremail)
values (333, 'Quentin Giraldo', 'quentin.giraldo@wci.dk');
insert into CUSTOMERS (customerid, customername, customeremail)
values (334, 'Allan Lynch', 'alynch@amerisourcefunding.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (335, 'Howie Benoit', 'howie.b@bioreliance.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (336, 'Ann Freeman', 'ann.freeman@credopetroleum.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (337, 'France Kapanka', 'france.kapanka@lms.hk');
insert into CUSTOMERS (customerid, customername, customeremail)
values (338, 'Val Arkenstone', 'val@nike.ch');
insert into CUSTOMERS (customerid, customername, customeremail)
values (339, 'Rosie Cole', 'rosie.cole@surmodics.es');
insert into CUSTOMERS (customerid, customername, customeremail)
values (340, 'Lynn Tripplehorn', 'lynn.tripplehorn@meridiangold.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (341, 'CeCe Byrne', 'cece.byrne@profitline.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (342, 'Ice Connery', 'ice.connery@airmethods.br');
insert into CUSTOMERS (customerid, customername, customeremail)
values (343, 'Goldie Bruce', 'goldie.b@capitolbancorp.ca');
insert into CUSTOMERS (customerid, customername, customeremail)
values (344, 'Mos Ryan', 'mos.ryan@ait.uk');
insert into CUSTOMERS (customerid, customername, customeremail)
values (345, 'Liev Adams', 'liev@gbas.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (346, 'Billy Piven', 'billy.piven@bioreliance.fr');
insert into CUSTOMERS (customerid, customername, customeremail)
values (347, 'Ossie Fehr', 'ossie@providentbancorp.nl');
insert into CUSTOMERS (customerid, customername, customeremail)
values (348, 'Garland Quinn', 'gquinn@newhorizons.za');
insert into CUSTOMERS (customerid, customername, customeremail)
values (349, 'Rory Wakeling', 'rwakeling@sears.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (350, 'Nickel Roundtree', 'nickel.roundtree@jcpenney.fr');
insert into CUSTOMERS (customerid, customername, customeremail)
values (351, 'Orlando Firth', 'orlando.f@pioneermortgage.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (352, 'Natascha Keith', 'natascha.k@sony.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (353, 'Ryan Burke', 'ryan.burke@ghrsystems.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (354, 'Geena Ferrell', 'gferrell@sears.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (355, 'Karen Idle', 'karen.idle@cardinalcartridge.ch');
insert into CUSTOMERS (customerid, customername, customeremail)
values (356, 'Jackson Shandling', 'jacksons@ibm.nl');
insert into CUSTOMERS (customerid, customername, customeremail)
values (357, 'Kathy Bedelia', 'kathyb@wellsfinancial.fi');
insert into CUSTOMERS (customerid, customername, customeremail)
values (358, 'Isaiah DiFranco', 'isaiah.difranco@hencie.se');
insert into CUSTOMERS (customerid, customername, customeremail)
values (359, 'Ricardo Luongo', 'ricardo.luongo@unicru.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (360, 'Aida Epps', 'aida.epps@cmi.gr');
insert into CUSTOMERS (customerid, customername, customeremail)
values (361, 'Gordie Skerritt', 'gordie.skerritt@computersource.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (362, 'Juice Singh', 'juices@stiknowledge.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (363, 'Celia Sirtis', 'celia.s@ogi.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (364, 'Ice Donovan', 'ice.donovan@mse.au');
insert into CUSTOMERS (customerid, customername, customeremail)
values (365, 'Loren Gore', 'lgore@ositissoftware.de');
insert into CUSTOMERS (customerid, customername, customeremail)
values (366, 'Taye Sandoval', 'taye@data.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (367, 'Sharon Sandoval', 'ssandoval@networkdisplay.fr');
insert into CUSTOMERS (customerid, customername, customeremail)
values (368, 'Maria Sedgwick', 'maria@arkidata.ca');
insert into CUSTOMERS (customerid, customername, customeremail)
values (369, 'Geraldine Schiavelli', 'geraldine.schiavelli@trinityhomecare.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (370, 'Shirley Amos', 'shirley@simplycertificates.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (371, 'Gaby Gates', 'gaby.gates@bis.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (372, 'Renee Tillis', 'renee.tillis@pinnaclestaffing.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (373, 'Fairuza Easton', 'fairuza.easton@innovateecommerce.it');
insert into CUSTOMERS (customerid, customername, customeremail)
values (374, 'Murray Ness', 'murrayn@esteelauder.id');
insert into CUSTOMERS (customerid, customername, customeremail)
values (375, 'Vince Tennison', 'vince.tennison@kellogg.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (376, 'Sally Bradford', 'sally.bradford@jma.br');
insert into CUSTOMERS (customerid, customername, customeremail)
values (377, 'Nancy Snipes', 'n.snipes@americanvanguard.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (378, 'Blair Dickinson', 'blair.d@gagwear.jp');
insert into CUSTOMERS (customerid, customername, customeremail)
values (379, 'Jennifer Belushi', 'jbelushi@midwestmedia.de');
insert into CUSTOMERS (customerid, customername, customeremail)
values (380, 'Stewart Mulroney', 'stewart.mulroney@ptg.es');
insert into CUSTOMERS (customerid, customername, customeremail)
values (381, 'Clive Thorton', 'clive.thorton@kellogg.it');
insert into CUSTOMERS (customerid, customername, customeremail)
values (382, 'Stellan Franklin', 'stellan.franklin@air.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (383, 'Terry Withers', 'terry.withers@capitolbancorp.ca');
insert into CUSTOMERS (customerid, customername, customeremail)
values (384, 'Rob Vaughan', 'rob.vaughan@ntas.se');
insert into CUSTOMERS (customerid, customername, customeremail)
values (385, 'Oro Phoenix', 'oro.phoenix@telesynthesis.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (386, 'Horace Aiken', 'horace.aiken@speakeasy.ch');
insert into CUSTOMERS (customerid, customername, customeremail)
values (387, 'Donal Moore', 'donal.m@gha.de');
insert into CUSTOMERS (customerid, customername, customeremail)
values (388, 'Jeroen Posey', 'j.posey@connected.at');
insert into CUSTOMERS (customerid, customername, customeremail)
values (389, 'Nicholas Shepherd', 'nicholas@keymark.uk');
insert into CUSTOMERS (customerid, customername, customeremail)
values (390, 'Ryan Raye', 'ryan.raye@canterburypark.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (391, 'Lydia Peebles', 'lydia.peebles@pscinfogroup.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (392, 'Rik Perez', 'rikp@processplus.it');
insert into CUSTOMERS (customerid, customername, customeremail)
values (393, 'Gary Harrison', 'gary.harrison@sbc.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (394, 'Carrie-Anne Morton', 'carrieannem@acsis.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (395, 'Bradley Spader', 'bradley.spader@hcoa.de');
insert into CUSTOMERS (customerid, customername, customeremail)
values (396, 'Sheryl Carter', 'sheryl.carter@manhattanassociates.fr');
insert into CUSTOMERS (customerid, customername, customeremail)
values (397, 'Bill Douglas', 'bill.douglas@chipssolutions.nl');
insert into CUSTOMERS (customerid, customername, customeremail)
values (398, 'Willem MacLachlan', 'w.maclachlan@clorox.ch');
insert into CUSTOMERS (customerid, customername, customeremail)
values (399, 'Pam Shaw', 'pam.shaw@aquickdelivery.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (400, 'Natalie Chung', 'natalie.chung@scheringplough.ch');
commit;
prompt 400 records loaded
prompt Loading EMPLOYEES...
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (401, 'Harvey Kudrow', 'Sales Associate', to_date('04-02-2020', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (402, 'Rebeka Lillard', 'Product Manager', to_date('11-11-2022', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (403, 'Nanci Rudd', 'Sales Associate', to_date('02-10-2022', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (404, 'Stephen Sevenfold', 'Sales Associate', to_date('02-11-2023', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (405, 'Freddy Doucette', 'Cashier', to_date('06-06-2020', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (406, 'Demi Thomas', 'Sales Associate', to_date('30-07-2020', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (407, 'Peabo Janssen', 'Cashier', to_date('18-02-2020', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (408, 'Mekhi Gary', 'Product Manager', to_date('03-08-2022', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (409, 'Geena Mirren', 'Product Manager', to_date('24-11-2020', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (410, 'Gaby Carlton', 'Cashier', to_date('01-06-2022', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (411, 'Lili Doucette', 'Sales Associate', to_date('01-03-2023', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (412, 'Kid Beckinsale', 'Sales Associate', to_date('21-08-2022', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (413, 'Richie Mills', 'Cashier', to_date('28-04-2023', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (414, 'Powers Sheen', 'Manager', to_date('25-01-2020', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (415, 'Jesus Arjona', 'Sales Associate', to_date('01-08-2021', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (416, 'Marty Blair', 'Sales Associate', to_date('13-03-2023', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (417, 'Stewart Adams', 'Cashier', to_date('17-01-2023', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (418, 'Cesar Byrne', 'Product Manager', to_date('08-12-2022', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (419, 'Robert Dench', 'Manager', to_date('12-01-2020', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (420, 'Ming-Na May', 'Manager', to_date('19-07-2020', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (421, 'Charlize Feore', 'Manager', to_date('06-09-2023', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (422, 'Illeana Rydell', 'Product Manager', to_date('18-11-2020', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (423, 'Merle DeVito', 'Sales Associate', to_date('12-10-2020', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (424, 'Janeane Askew', 'Cashier', to_date('25-10-2022', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (425, 'Stockard Wheel', 'Sales Associate', to_date('11-11-2023', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (426, 'Eileen Lindo', 'Product Manager', to_date('23-12-2022', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (427, 'Ving Horton', 'Sales Associate', to_date('06-07-2022', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (428, 'Charlton Giraldo', 'Manager', to_date('12-09-2020', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (429, 'Millie Milsap', 'Cashier', to_date('27-12-2023', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (430, 'Michelle Barnett', 'Product Manager', to_date('28-03-2020', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (431, 'Delroy Hiatt', 'Manager', to_date('14-01-2023', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (432, 'Anne Cara', 'Product Manager', to_date('26-03-2022', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (433, 'Natacha Condition', 'Sales Associate', to_date('25-12-2020', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (434, 'Casey Geldof', 'Cashier', to_date('27-05-2020', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (435, 'Praga Del Toro', 'Product Manager', to_date('26-01-2022', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (436, 'Mira Rowlands', 'Cashier', to_date('14-07-2023', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (437, 'Elizabeth Brandt', 'Cashier', to_date('15-01-2023', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (438, 'Guy Scorsese', 'Sales Associate', to_date('28-08-2022', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (439, 'Davis Lopez', 'Sales Associate', to_date('21-12-2023', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (440, 'Howard Rispoli', 'Sales Associate', to_date('18-07-2023', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (441, 'Emily Lapointe', 'Cashier', to_date('13-05-2020', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (442, 'Larenz Lattimore', 'Manager', to_date('24-05-2020', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (443, 'Ali Richards', 'Cashier', to_date('26-06-2020', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (444, 'Rueben Redford', 'Cashier', to_date('20-10-2022', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (445, 'Latin Imbruglia', 'Product Manager', to_date('10-12-2023', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (446, 'Ritchie Dourif', 'Sales Associate', to_date('20-12-2023', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (447, 'Regina Gallant', 'Product Manager', to_date('08-07-2021', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (448, 'Elias Sainte-Marie', 'Cashier', to_date('01-03-2022', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (449, 'Franz Almond', 'Manager', to_date('07-04-2020', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (450, 'Neve Torn', 'Manager', to_date('09-06-2023', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (451, 'Penelope Sharp', 'Sales Associate', to_date('07-11-2021', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (452, 'Carla Mantegna', 'Product Manager', to_date('29-07-2021', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (453, 'Nancy McDormand', 'Sales Associate', to_date('10-02-2022', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (454, 'Maria Lang', 'Manager', to_date('27-04-2023', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (455, 'Denis Crosby', 'Manager', to_date('04-12-2023', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (456, 'Gladys Lange', 'Sales Associate', to_date('25-10-2022', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (457, 'Arturo Wood', 'Manager', to_date('08-04-2023', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (458, 'Dabney Hobson', 'Cashier', to_date('02-05-2021', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (459, 'Austin Vince', 'Product Manager', to_date('26-07-2020', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (460, 'Terence Adkins', 'Cashier', to_date('27-03-2020', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (461, 'Lauren Orbit', 'Product Manager', to_date('15-04-2021', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (462, 'Ruth Miles', 'Manager', to_date('03-03-2023', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (463, 'Al Duncan', 'Product Manager', to_date('02-10-2021', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (464, 'Darren Myles', 'Manager', to_date('14-07-2023', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (465, 'Jena Tisdale', 'Cashier', to_date('01-04-2020', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (466, 'Angela Scaggs', 'Product Manager', to_date('15-03-2021', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (467, 'Dennis Foster', 'Cashier', to_date('09-05-2021', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (468, 'Juliana Feore', 'Cashier', to_date('22-06-2020', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (469, 'Marlon Adams', 'Product Manager', to_date('04-07-2021', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (470, 'Tara Mould', 'Manager', to_date('14-04-2021', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (471, 'Nicole Gershon', 'Product Manager', to_date('17-11-2023', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (472, 'Gabriel Himmelman', 'Product Manager', to_date('02-09-2023', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (473, 'Alfred Janssen', 'Sales Associate', to_date('03-06-2022', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (474, 'Liquid Snow', 'Product Manager', to_date('20-06-2021', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (475, 'Minnie Studi', 'Sales Associate', to_date('27-03-2023', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (476, 'Adrien Calle', 'Sales Associate', to_date('19-04-2021', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (477, 'Ani Carmen', 'Manager', to_date('17-02-2023', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (478, 'Mel Lloyd', 'Sales Associate', to_date('04-10-2022', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (479, 'Armin Watley', 'Manager', to_date('24-06-2021', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (480, 'Andrae King', 'Cashier', to_date('19-11-2023', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (481, 'Adam Lapointe', 'Sales Associate', to_date('16-04-2021', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (482, 'Lorraine Diffie', 'Cashier', to_date('14-11-2023', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (483, 'Thomas Dorff', 'Product Manager', to_date('22-07-2023', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (484, 'Katie Michaels', 'Product Manager', to_date('09-01-2023', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (485, 'Lindsey Rucker', 'Cashier', to_date('29-10-2022', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (486, 'Don DiFranco', 'Product Manager', to_date('23-12-2023', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (487, 'Terri Gaines', 'Product Manager', to_date('22-01-2020', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (488, 'Lucy Wahlberg', 'Manager', to_date('24-02-2022', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (489, 'Deborah Checker', 'Manager', to_date('07-09-2020', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (490, 'Demi Nunn', 'Cashier', to_date('16-06-2021', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (491, 'Nancy Richter', 'Manager', to_date('20-12-2021', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (492, 'Treat Goldblum', 'Cashier', to_date('12-04-2023', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (493, 'Mekhi Tisdale', 'Product Manager', to_date('30-07-2021', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (494, 'Giancarlo Olyphant', 'Sales Associate', to_date('26-08-2020', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (495, 'Freddie Hart', 'Manager', to_date('04-06-2023', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (496, 'Chad Haggard', 'Sales Associate', to_date('03-10-2021', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (497, 'Claude Paxton', 'Product Manager', to_date('28-09-2020', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (498, 'Annie Pesci', 'Cashier', to_date('08-08-2022', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (499, 'Rene Idle', 'Cashier', to_date('10-06-2020', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (500, 'Chanté Harry', 'Sales Associate', to_date('04-01-2021', 'dd-mm-yyyy'));
commit;
prompt 100 records committed...
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (501, 'Emma Negbaur', 'Sales Associate', to_date('05-09-2020', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (502, 'Tamala Moriarty', 'Sales Associate', to_date('23-10-2023', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (503, 'Holland Rifkin', 'Cashier', to_date('11-09-2021', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (504, 'Nik Rundgren', 'Manager', to_date('20-04-2023', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (505, 'Vonda Michael', 'Product Manager', to_date('29-11-2021', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (506, 'Wayman Venora', 'Cashier', to_date('23-12-2022', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (507, 'Corey Ali', 'Sales Associate', to_date('02-04-2023', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (508, 'Ruth Crouse', 'Sales Associate', to_date('21-06-2020', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (509, 'Darius Garfunkel', 'Cashier', to_date('25-09-2021', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (510, 'Gailard urban', 'Cashier', to_date('10-10-2023', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (511, 'Jennifer Sandler', 'Cashier', to_date('25-04-2023', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (512, 'Darren Nicks', 'Manager', to_date('11-09-2020', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (513, 'Hex Miles', 'Cashier', to_date('16-12-2020', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (514, 'Graham Taha', 'Product Manager', to_date('28-07-2021', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (515, 'Ali Tucci', 'Product Manager', to_date('27-12-2020', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (516, 'Maura Red', 'Sales Associate', to_date('26-03-2023', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (517, 'Pelvic Liu', 'Cashier', to_date('01-09-2022', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (518, 'Harold Flanery', 'Cashier', to_date('14-03-2022', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (519, 'Suzanne Lewis', 'Manager', to_date('09-01-2023', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (520, 'Joaquim Supernaw', 'Manager', to_date('01-03-2021', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (521, 'Ronny McIntosh', 'Cashier', to_date('16-12-2022', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (522, 'Tamala Avital', 'Product Manager', to_date('09-09-2020', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (523, 'Kimberly Ferrer', 'Sales Associate', to_date('24-07-2022', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (524, 'Andy Holm', 'Sales Associate', to_date('03-03-2020', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (525, 'Sheryl Withers', 'Cashier', to_date('15-09-2021', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (526, 'David Kidman', 'Product Manager', to_date('15-01-2020', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (527, 'Gary Pacino', 'Sales Associate', to_date('20-11-2021', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (528, 'Charles Starr', 'Sales Associate', to_date('31-03-2021', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (529, 'Gabriel Osborne', 'Cashier', to_date('19-04-2021', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (530, 'Oded Russo', 'Product Manager', to_date('12-12-2021', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (531, 'Breckin Yankovic', 'Manager', to_date('08-03-2023', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (532, 'Jeremy Blackmore', 'Product Manager', to_date('24-06-2023', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (533, 'Crispin Nolte', 'Sales Associate', to_date('25-05-2021', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (534, 'Jack Blaine', 'Sales Associate', to_date('26-07-2021', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (535, 'Jim Pierce', 'Sales Associate', to_date('10-04-2023', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (536, 'Sinead Hong', 'Cashier', to_date('14-10-2022', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (537, 'Lili Carrey', 'Manager', to_date('05-09-2021', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (538, 'Fred Lucien', 'Cashier', to_date('08-04-2022', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (539, 'Edwin MacIsaac', 'Cashier', to_date('18-05-2020', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (540, 'Celia Ali', 'Manager', to_date('31-08-2022', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (541, 'Wayne Pepper', 'Cashier', to_date('06-08-2020', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (542, 'Tara Ponce', 'Manager', to_date('14-05-2022', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (543, 'Carlene Rhames', 'Product Manager', to_date('13-11-2020', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (544, 'Cameron Simpson', 'Cashier', to_date('12-12-2020', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (545, 'Swoosie LaPaglia', 'Sales Associate', to_date('12-02-2022', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (546, 'Lindsay Mohr', 'Manager', to_date('22-11-2021', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (547, 'Noah Danes', 'Manager', to_date('30-12-2021', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (548, 'Fionnula Woodward', 'Sales Associate', to_date('18-07-2020', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (549, 'Carolyn Kershaw', 'Manager', to_date('23-06-2022', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (550, 'Andrea Weber', 'Product Manager', to_date('01-05-2021', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (551, 'Gene Paltrow', 'Sales Associate', to_date('02-09-2022', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (552, 'Dom Skarsgard', 'Manager', to_date('16-03-2020', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (553, 'Eliza Klugh', 'Cashier', to_date('06-12-2020', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (554, 'Red Fogerty', 'Product Manager', to_date('17-05-2020', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (555, 'Dustin Wagner', 'Manager', to_date('09-03-2022', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (556, 'Yolanda De Almeida', 'Cashier', to_date('02-04-2021', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (557, 'Christopher Lyonne', 'Sales Associate', to_date('07-07-2022', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (558, 'Kiefer Ford', 'Product Manager', to_date('02-09-2020', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (559, 'Debi Atkinson', 'Sales Associate', to_date('27-12-2022', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (560, 'Kitty Mortensen', 'Product Manager', to_date('07-05-2022', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (561, 'Forest Zellweger', 'Manager', to_date('07-10-2020', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (562, 'Mandy Sossamon', 'Cashier', to_date('30-07-2020', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (563, 'Samantha Harrison', 'Manager', to_date('01-06-2021', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (564, 'Colin Harary', 'Cashier', to_date('24-03-2022', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (565, 'Emilio Paxton', 'Sales Associate', to_date('04-07-2020', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (566, 'Julia Diffie', 'Sales Associate', to_date('28-11-2021', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (567, 'Balthazar Belushi', 'Sales Associate', to_date('13-06-2022', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (568, 'Busta Sinatra', 'Product Manager', to_date('20-06-2022', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (569, 'Desmond Cocker', 'Sales Associate', to_date('27-07-2020', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (570, 'Carol Hynde', 'Cashier', to_date('06-09-2020', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (571, 'Lisa Thompson', 'Manager', to_date('18-06-2022', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (572, 'Nikki Marx', 'Cashier', to_date('23-03-2022', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (573, 'Ernie Stevenson', 'Sales Associate', to_date('24-07-2020', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (574, 'Jesse Colon', 'Sales Associate', to_date('16-11-2021', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (575, 'Ellen Pullman', 'Sales Associate', to_date('25-12-2023', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (576, 'Anthony Makowicz', 'Cashier', to_date('25-12-2020', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (577, 'Vin Flatts', 'Sales Associate', to_date('10-08-2023', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (578, 'Rebecca Cumming', 'Manager', to_date('05-03-2022', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (579, 'Natascha Mac', 'Product Manager', to_date('02-06-2022', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (580, 'Gabriel Gugino', 'Product Manager', to_date('24-04-2021', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (581, 'Mia Duke', 'Cashier', to_date('05-02-2023', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (582, 'Eric Kelly', 'Product Manager', to_date('19-09-2020', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (583, 'Jake Pierce', 'Sales Associate', to_date('01-11-2020', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (584, 'Edward Giannini', 'Product Manager', to_date('13-08-2023', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (585, 'Alessandro Warren', 'Cashier', to_date('13-06-2021', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (586, 'Jackie Dupree', 'Product Manager', to_date('09-11-2021', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (587, 'LeVar Briscoe', 'Cashier', to_date('08-09-2020', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (588, 'Maury Sandler', 'Cashier', to_date('15-11-2020', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (589, 'Johnette Diddley', 'Cashier', to_date('04-11-2020', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (590, 'Franco Jonze', 'Cashier', to_date('22-11-2021', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (591, 'Coley Gilley', 'Manager', to_date('29-07-2020', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (592, 'Lucinda Coyote', 'Manager', to_date('26-05-2021', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (593, 'Lesley Shannon', 'Cashier', to_date('27-12-2021', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (594, 'Elias Oates', 'Sales Associate', to_date('05-11-2023', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (595, 'Nils Akins', 'Sales Associate', to_date('27-12-2022', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (596, 'Cliff Garofalo', 'Cashier', to_date('07-08-2023', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (597, 'Jose Hayes', 'Sales Associate', to_date('07-11-2022', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (598, 'Collective Holeman', 'Product Manager', to_date('05-03-2020', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (599, 'Jackie Prinze', 'Product Manager', to_date('25-01-2021', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (600, 'Patti Maguire', 'Product Manager', to_date('09-09-2022', 'dd-mm-yyyy'));
commit;
prompt 200 records committed...
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (601, 'Ivan Spine', 'Cashier', to_date('04-06-2021', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (602, 'Ving Hayek', 'Sales Associate', to_date('26-07-2023', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (603, 'Rip Johnson', 'Product Manager', to_date('06-05-2021', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (604, 'Grant Tobolowsky', 'Manager', to_date('28-06-2021', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (605, 'Austin Lapointe', 'Manager', to_date('21-06-2022', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (606, 'Woody Matarazzo', 'Product Manager', to_date('24-08-2021', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (607, 'Bobby Minogue', 'Cashier', to_date('02-07-2022', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (608, 'Frederic Getty', 'Manager', to_date('22-02-2021', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (609, 'Alfred Cotton', 'Cashier', to_date('09-04-2020', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (610, 'Kristin Hubbard', 'Cashier', to_date('04-10-2023', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (611, 'Martin Fogerty', 'Product Manager', to_date('07-02-2022', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (612, 'Juliana Ticotin', 'Manager', to_date('15-11-2023', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (613, 'Dick Lyonne', 'Sales Associate', to_date('17-05-2021', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (614, 'Corey Byrne', 'Product Manager', to_date('13-09-2023', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (615, 'Gary Krumholtz', 'Manager', to_date('15-05-2023', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (616, 'Rosanne Torino', 'Product Manager', to_date('26-09-2023', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (617, 'Joshua Child', 'Product Manager', to_date('09-05-2023', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (618, 'Grace Osbourne', 'Sales Associate', to_date('23-06-2022', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (619, 'Carlos Chestnut', 'Manager', to_date('29-11-2021', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (620, 'Peter Christie', 'Sales Associate', to_date('16-05-2021', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (621, 'Natascha Potter', 'Sales Associate', to_date('18-07-2021', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (622, 'Maureen Connick', 'Manager', to_date('18-01-2023', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (623, 'Hilary Lipnicki', 'Cashier', to_date('27-06-2020', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (624, 'Melanie Bloch', 'Product Manager', to_date('03-10-2022', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (625, 'Kid Fehr', 'Manager', to_date('23-10-2023', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (626, 'Doug Witherspoon', 'Manager', to_date('31-01-2021', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (627, 'Heather Driver', 'Product Manager', to_date('29-09-2023', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (628, 'Delroy Wayans', 'Product Manager', to_date('07-12-2021', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (629, 'Nickel Hong', 'Cashier', to_date('10-04-2021', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (630, 'Leonardo Speaks', 'Manager', to_date('17-09-2023', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (631, 'Moe Melvin', 'Product Manager', to_date('21-12-2020', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (632, 'April Brown', 'Cashier', to_date('18-10-2023', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (633, 'Kevn Gordon', 'Cashier', to_date('02-02-2023', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (634, 'Ike Coverdale', 'Cashier', to_date('04-04-2020', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (635, 'Marina Mills', 'Cashier', to_date('14-11-2020', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (636, 'Suzy Banderas', 'Sales Associate', to_date('23-10-2022', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (637, 'Deborah DeVita', 'Manager', to_date('04-03-2023', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (638, 'Maggie Costner', 'Product Manager', to_date('07-01-2021', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (639, 'Pam Forrest', 'Manager', to_date('08-04-2022', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (640, 'Deborah Playboys', 'Manager', to_date('10-10-2021', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (641, 'Juliana Estevez', 'Cashier', to_date('15-12-2022', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (642, 'Hikaru Beatty', 'Cashier', to_date('28-12-2023', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (643, 'Courtney Tierney', 'Sales Associate', to_date('20-11-2020', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (644, 'Mark Mitchell', 'Manager', to_date('28-07-2022', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (645, 'Saffron Williams', 'Cashier', to_date('25-02-2022', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (646, 'Rik Colin Young', 'Sales Associate', to_date('16-08-2021', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (647, 'Desmond Vince', 'Cashier', to_date('10-02-2020', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (648, 'Davis Biel', 'Product Manager', to_date('29-11-2020', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (649, 'Bobby Dern', 'Manager', to_date('27-06-2021', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (650, 'Claude Ferry', 'Cashier', to_date('01-08-2023', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (651, 'Marie Lerner', 'Manager', to_date('13-09-2021', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (652, 'Charlton Gaines', 'Sales Associate', to_date('04-02-2021', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (653, 'Ray Mraz', 'Manager', to_date('15-06-2021', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (654, 'Laurie Reno', 'Manager', to_date('25-06-2023', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (655, 'Alex Keener', 'Product Manager', to_date('27-07-2020', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (656, 'Wayman Sayer', 'Product Manager', to_date('01-10-2022', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (657, 'Malcolm Mahood', 'Manager', to_date('26-01-2021', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (658, 'Carlene McLean', 'Product Manager', to_date('23-08-2021', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (659, 'Kimberly Lunch', 'Product Manager', to_date('10-07-2023', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (660, 'Ceili Duvall', 'Sales Associate', to_date('31-07-2023', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (661, 'Swoosie Holden', 'Sales Associate', to_date('14-08-2020', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (662, 'Milla Skarsgard', 'Cashier', to_date('10-11-2023', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (663, 'Andrew McGovern', 'Cashier', to_date('05-01-2020', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (664, 'Gord Zevon', 'Sales Associate', to_date('17-02-2022', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (665, 'Willem Schneider', 'Manager', to_date('28-05-2020', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (666, 'Wendy McGinley', 'Sales Associate', to_date('10-02-2020', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (667, 'Nicolas Rosas', 'Product Manager', to_date('18-11-2020', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (668, 'Busta Addy', 'Cashier', to_date('11-07-2020', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (669, 'Nikka Quinlan', 'Cashier', to_date('03-07-2023', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (670, 'Gil Farina', 'Product Manager', to_date('06-05-2023', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (671, 'Holland Postlethwaite', 'Cashier', to_date('15-02-2021', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (672, 'Benjamin Cook', 'Product Manager', to_date('22-03-2023', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (673, 'Robbie Reiner', 'Manager', to_date('04-07-2022', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (674, 'Talvin Spears', 'Manager', to_date('19-03-2020', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (675, 'Bill Preston', 'Manager', to_date('16-08-2022', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (676, 'Kazem Lorenz', 'Sales Associate', to_date('02-10-2023', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (677, 'Guy Crimson', 'Sales Associate', to_date('11-04-2022', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (678, 'Christine Tippe', 'Product Manager', to_date('31-10-2021', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (679, 'Geoff Wainwright', 'Product Manager', to_date('27-11-2020', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (680, 'Powers Gaynor', 'Manager', to_date('29-06-2023', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (681, 'Elle Gilley', 'Manager', to_date('12-09-2022', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (682, 'Irene Unger', 'Manager', to_date('06-07-2022', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (683, 'Oded McCabe', 'Product Manager', to_date('24-11-2023', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (684, 'Mel Gandolfini', 'Sales Associate', to_date('22-05-2022', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (685, 'Merrilee Mollard', 'Product Manager', to_date('02-06-2021', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (686, 'Burton Johansen', 'Manager', to_date('13-07-2022', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (687, 'Donal Berkley', 'Product Manager', to_date('31-08-2022', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (688, 'Teri Tillis', 'Cashier', to_date('24-09-2021', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (689, 'Dustin Richter', 'Cashier', to_date('13-08-2020', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (690, 'Janeane Estevez', 'Sales Associate', to_date('13-11-2022', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (691, 'Roscoe Donovan', 'Manager', to_date('04-03-2022', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (692, 'Nikki Ferrer', 'Cashier', to_date('18-11-2022', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (693, 'Wesley Arthur', 'Manager', to_date('23-09-2021', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (694, 'Lennie Newman', 'Cashier', to_date('18-12-2023', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (695, 'Milla McGinley', 'Sales Associate', to_date('10-01-2020', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (696, 'Vern Rock', 'Manager', to_date('14-01-2022', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (697, 'Donald Griggs', 'Product Manager', to_date('20-03-2020', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (698, 'Earl Harris', 'Cashier', to_date('16-06-2020', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (699, 'Pelvic Gibson', 'Manager', to_date('23-03-2021', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (700, 'Rosco Schiavelli', 'Manager', to_date('24-12-2020', 'dd-mm-yyyy'));
commit;
prompt 300 records committed...
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (701, 'Jim Morton', 'Product Manager', to_date('24-04-2020', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (702, 'Don Chilton', 'Product Manager', to_date('17-12-2023', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (703, 'Dianne Ramis', 'Manager', to_date('02-12-2020', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (704, 'Claire Evans', 'Product Manager', to_date('27-10-2021', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (705, 'Horace Quinlan', 'Product Manager', to_date('05-10-2021', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (706, 'Mary-Louise Midler', 'Cashier', to_date('10-10-2021', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (707, 'Vin Collins', 'Manager', to_date('24-02-2023', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (708, 'Vincent Paquin', 'Cashier', to_date('04-10-2021', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (709, 'Petula Spine', 'Manager', to_date('02-08-2022', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (710, 'Gilberto McGregor', 'Cashier', to_date('01-09-2023', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (711, 'Richie Hewitt', 'Cashier', to_date('07-08-2023', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (712, 'Pelvic Diehl', 'Product Manager', to_date('24-10-2023', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (713, 'Jonatha Myles', 'Product Manager', to_date('28-10-2021', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (714, 'Marina Franklin', 'Manager', to_date('13-08-2020', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (715, 'Cameron Redgrave', 'Sales Associate', to_date('06-05-2020', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (716, 'Alice Coyote', 'Cashier', to_date('05-08-2023', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (717, 'Dermot Gaynor', 'Manager', to_date('14-04-2022', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (718, 'Heath MacLachlan', 'Product Manager', to_date('19-07-2023', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (719, 'Edward Davison', 'Product Manager', to_date('14-08-2020', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (720, 'Phil Taylor', 'Product Manager', to_date('15-01-2020', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (721, 'Swoosie Belle', 'Sales Associate', to_date('17-04-2021', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (722, 'Nile Schiavelli', 'Cashier', to_date('05-02-2022', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (723, 'Vienna Rundgren', 'Cashier', to_date('15-07-2023', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (724, 'Pierce Berkeley', 'Sales Associate', to_date('06-03-2022', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (725, 'Sylvester Thornton', 'Cashier', to_date('13-06-2021', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (726, 'Emmylou Luongo', 'Cashier', to_date('14-05-2023', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (727, 'Percy Langella', 'Manager', to_date('09-11-2022', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (728, 'Chloe Wagner', 'Manager', to_date('10-11-2023', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (729, 'Pat Condition', 'Cashier', to_date('15-05-2021', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (730, 'Rich Gano', 'Product Manager', to_date('26-08-2022', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (731, 'Jake Plowright', 'Product Manager', to_date('28-09-2021', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (732, 'Rueben Kline', 'Product Manager', to_date('08-07-2022', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (733, 'Harriet Mazzello', 'Manager', to_date('10-06-2022', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (734, 'Herbie Beck', 'Product Manager', to_date('18-03-2022', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (735, 'Johnny Driver', 'Sales Associate', to_date('30-06-2023', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (736, 'Rosanna Lynch', 'Sales Associate', to_date('04-12-2021', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (737, 'Natalie Hanley', 'Cashier', to_date('27-07-2023', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (738, 'Carlene Bridges', 'Sales Associate', to_date('05-01-2022', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (739, 'Kirsten Neuwirth', 'Cashier', to_date('23-04-2022', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (740, 'Rik Blossoms', 'Product Manager', to_date('07-12-2022', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (741, 'Tia Mewes', 'Product Manager', to_date('05-12-2023', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (742, 'Hilton Levert', 'Product Manager', to_date('23-06-2022', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (743, 'Rickie Dean', 'Cashier', to_date('11-01-2022', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (744, 'Juice Flatts', 'Manager', to_date('21-03-2022', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (745, 'Bridget Dorff', 'Manager', to_date('17-09-2021', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (746, 'Gordie Driver', 'Manager', to_date('27-03-2023', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (747, 'Judi Hoffman', 'Sales Associate', to_date('22-11-2022', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (748, 'Bridgette Vaughn', 'Sales Associate', to_date('19-01-2023', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (749, 'Jonny Lee Hunter', 'Product Manager', to_date('21-11-2020', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (750, 'Hugo Franks', 'Manager', to_date('14-11-2021', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (751, 'Dionne Shue', 'Manager', to_date('10-04-2020', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (752, 'Richard Field', 'Manager', to_date('09-01-2022', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (753, 'Vanessa McDowell', 'Manager', to_date('10-12-2021', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (754, 'Lauren von Sydow', 'Sales Associate', to_date('05-09-2020', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (755, 'Mark Lyonne', 'Cashier', to_date('15-06-2023', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (756, 'Bernard McGoohan', 'Product Manager', to_date('25-10-2023', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (757, 'Lili Paymer', 'Cashier', to_date('16-08-2020', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (758, 'Tea Savage', 'Product Manager', to_date('31-05-2021', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (759, 'John Curfman', 'Manager', to_date('08-05-2022', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (760, 'Edwin Bacharach', 'Sales Associate', to_date('09-12-2023', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (761, 'Sinead Hart', 'Product Manager', to_date('16-09-2022', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (762, 'Cary Culkin', 'Sales Associate', to_date('12-01-2020', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (763, 'Ian Elliott', 'Cashier', to_date('11-04-2022', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (764, 'Tori Bates', 'Manager', to_date('26-06-2023', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (765, 'Illeana De Niro', 'Sales Associate', to_date('26-09-2022', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (766, 'Robby Dukakis', 'Cashier', to_date('11-06-2021', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (767, 'Dionne Costello', 'Product Manager', to_date('10-09-2022', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (768, 'Geena Kinski', 'Manager', to_date('16-11-2023', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (769, 'Carla Sinatra', 'Manager', to_date('09-10-2022', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (770, 'Tony Blair', 'Manager', to_date('10-04-2022', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (771, 'Jessica Lucien', 'Sales Associate', to_date('13-12-2023', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (772, 'Robby Redford', 'Cashier', to_date('14-08-2021', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (773, 'Rory Broderick', 'Manager', to_date('22-02-2023', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (774, 'Gordie Vincent', 'Manager', to_date('07-08-2021', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (775, 'Kim Finney', 'Product Manager', to_date('17-01-2022', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (776, 'Ernest Belle', 'Product Manager', to_date('22-01-2023', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (777, 'Maceo Giannini', 'Manager', to_date('17-03-2021', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (778, 'Cole Levert', 'Sales Associate', to_date('17-09-2023', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (779, 'Kathy Wilson', 'Sales Associate', to_date('18-05-2023', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (780, 'Naomi McCann', 'Sales Associate', to_date('09-02-2023', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (781, 'Emmylou MacDowell', 'Sales Associate', to_date('30-01-2022', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (782, 'Denny Bachman', 'Cashier', to_date('05-11-2020', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (783, 'Hal Sartain', 'Sales Associate', to_date('23-06-2023', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (784, 'Gilberto Neuwirth', 'Manager', to_date('09-01-2020', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (785, 'Shannyn Lee', 'Sales Associate', to_date('29-05-2021', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (786, 'Judd Kane', 'Sales Associate', to_date('16-12-2023', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (787, 'Jonatha Van Der Beek', 'Product Manager', to_date('10-10-2021', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (788, 'Jonathan Tomei', 'Sales Associate', to_date('20-02-2022', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (789, 'Thelma Balaban', 'Product Manager', to_date('04-02-2020', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (790, 'Judy Phoenix', 'Cashier', to_date('13-06-2021', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (791, 'Woody Moore', 'Cashier', to_date('08-05-2020', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (792, 'Loretta Martinez', 'Manager', to_date('15-08-2022', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (793, 'Boz Channing', 'Product Manager', to_date('27-01-2023', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (794, 'Rufus Rush', 'Product Manager', to_date('09-12-2021', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (795, 'Hazel Imperioli', 'Sales Associate', to_date('03-09-2022', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (796, 'Tyrone Logue', 'Product Manager', to_date('21-03-2022', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (797, 'Juan De Almeida', 'Manager', to_date('14-01-2022', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (798, 'Liam Beals', 'Cashier', to_date('30-12-2020', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (799, 'Powers Holland', 'Manager', to_date('10-05-2020', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (800, 'Aaron Miller', 'Manager', to_date('05-01-2020', 'dd-mm-yyyy'));
commit;
prompt 400 records loaded
prompt Loading PRODUCTS...
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10000, 'Dog Food', 149, 'Electronics');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10001, 'Dog Food', 406, 'Sports Equipment');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10002, 'Skin Care', 350, 'Pet Supplies');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10003, 'Sports Shoes', 267, 'Sports Equipment');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10004, 'Skin Care', 458, 'Pet Supplies');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10005, 'Phone', 375, 'Sports Equipment');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10006, 'Skin Care', 259, 'Beauty');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10007, 'Skin Care', 326, 'Sports Equipment');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10008, 'Laptop', 68, 'Sports Equipment');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10009, 'Sports Shoes', 78, 'Beauty');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10010, 'Laptop', 431, 'Sports Equipment');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10011, 'Dog Food', 195, 'Sports Equipment');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10012, 'Phone', 201, 'Sports Equipment');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10013, 'Phone', 377, 'Sports Equipment');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10014, 'Skin Care', 320, 'Beauty');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10015, 'Skin Care', 387, 'Beauty');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10016, 'Skin Care', 247, 'Beauty');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10017, 'Laptop', 38, 'Electronics');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10018, 'Dog Food', 149, 'Electronics');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10019, 'Dog Food', 322, 'Sports Equipment');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10020, 'Phone', 477, 'Beauty');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10021, 'Laptop', 80, 'Electronics');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10022, 'Sports Shoes', 316, 'Electronics');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10023, 'Laptop', 147, 'Pet Supplies');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10024, 'Phone', 446, 'Sports Equipment');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10025, 'Skin Care', 408, 'Electronics');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10026, 'Sports Shoes', 153, 'Electronics');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10027, 'Skin Care', 94, 'Electronics');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10028, 'Phone', 196, 'Beauty');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10029, 'Skin Care', 351, 'Pet Supplies');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10030, 'Sports Shoes', 44, 'Pet Supplies');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10031, 'Sports Shoes', 185, 'Sports Equipment');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10032, 'Phone', 206, 'Electronics');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10033, 'Skin Care', 97, 'Sports Equipment');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10034, 'Sports Shoes', 148, 'Pet Supplies');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10035, 'Dog Food', 320, 'Electronics');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10036, 'Laptop', 54, 'Sports Equipment');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10037, 'Phone', 156, 'Beauty');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10038, 'Dog Food', 465, 'Sports Equipment');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10039, 'Phone', 354, 'Sports Equipment');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10040, 'Dog Food', 315, 'Sports Equipment');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10041, 'Dog Food', 14, 'Sports Equipment');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10042, 'Phone', 172, 'Sports Equipment');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10043, 'Skin Care', 445, 'Electronics');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10044, 'Laptop', 52, 'Pet Supplies');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10045, 'Phone', 230, 'Electronics');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10046, 'Sports Shoes', 209, 'Electronics');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10047, 'Sports Shoes', 71, 'Beauty');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10048, 'Dog Food', 89, 'Pet Supplies');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10049, 'Laptop', 60, 'Pet Supplies');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10050, 'Phone', 434, 'Beauty');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10051, 'Phone', 142, 'Electronics');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10052, 'Phone', 223, 'Beauty');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10053, 'Sports Shoes', 11, 'Sports Equipment');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10054, 'Skin Care', 463, 'Electronics');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10055, 'Sports Shoes', 486, 'Sports Equipment');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10056, 'Laptop', 331, 'Pet Supplies');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10057, 'Laptop', 187, 'Sports Equipment');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10058, 'Laptop', 197, 'Beauty');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10059, 'Dog Food', 329, 'Electronics');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10060, 'Skin Care', 170, 'Electronics');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10061, 'Skin Care', 136, 'Electronics');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10062, 'Dog Food', 60, 'Sports Equipment');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10063, 'Phone', 169, 'Sports Equipment');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10064, 'Dog Food', 183, 'Pet Supplies');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10065, 'Sports Shoes', 154, 'Beauty');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10066, 'Skin Care', 132, 'Sports Equipment');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10067, 'Skin Care', 161, 'Pet Supplies');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10068, 'Laptop', 354, 'Pet Supplies');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10069, 'Skin Care', 181, 'Beauty');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10070, 'Dog Food', 431, 'Beauty');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10071, 'Phone', 34, 'Sports Equipment');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10072, 'Sports Shoes', 143, 'Beauty');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10073, 'Dog Food', 406, 'Beauty');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10074, 'Sports Shoes', 281, 'Pet Supplies');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10075, 'Phone', 316, 'Pet Supplies');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10076, 'Dog Food', 219, 'Beauty');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10077, 'Dog Food', 474, 'Sports Equipment');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10078, 'Dog Food', 264, 'Electronics');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10079, 'Phone', 323, 'Pet Supplies');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10080, 'Sports Shoes', 453, 'Beauty');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10081, 'Laptop', 163, 'Electronics');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10082, 'Dog Food', 15, 'Electronics');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10083, 'Skin Care', 294, 'Beauty');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10084, 'Skin Care', 26, 'Pet Supplies');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10085, 'Phone', 148, 'Pet Supplies');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10086, 'Laptop', 25, 'Electronics');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10087, 'Sports Shoes', 431, 'Beauty');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10088, 'Sports Shoes', 254, 'Beauty');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10089, 'Phone', 88, 'Electronics');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10090, 'Phone', 479, 'Pet Supplies');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10091, 'Skin Care', 44, 'Pet Supplies');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10092, 'Skin Care', 30, 'Electronics');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10093, 'Sports Shoes', 242, 'Pet Supplies');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10094, 'Phone', 119, 'Beauty');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10095, 'Sports Shoes', 125, 'Electronics');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10096, 'Laptop', 448, 'Pet Supplies');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10097, 'Skin Care', 188, 'Sports Equipment');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10098, 'Dog Food', 196, 'Beauty');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10099, 'Laptop', 28, 'Pet Supplies');
commit;
prompt 100 records committed...
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10100, 'Dog Food', 405, 'Electronics');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10101, 'Phone', 93, 'Sports Equipment');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10102, 'Phone', 65, 'Electronics');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10103, 'Laptop', 171, 'Electronics');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10104, 'Dog Food', 464, 'Electronics');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10105, 'Skin Care', 335, 'Pet Supplies');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10106, 'Skin Care', 24, 'Electronics');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10107, 'Sports Shoes', 210, 'Electronics');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10108, 'Dog Food', 486, 'Sports Equipment');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10109, 'Phone', 257, 'Beauty');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10110, 'Skin Care', 163, 'Beauty');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10111, 'Sports Shoes', 420, 'Pet Supplies');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10112, 'Laptop', 197, 'Pet Supplies');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10113, 'Dog Food', 437, 'Sports Equipment');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10114, 'Phone', 291, 'Sports Equipment');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10115, 'Dog Food', 421, 'Sports Equipment');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10116, 'Skin Care', 227, 'Sports Equipment');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10117, 'Phone', 186, 'Beauty');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10118, 'Dog Food', 233, 'Pet Supplies');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10119, 'Dog Food', 250, 'Electronics');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10120, 'Skin Care', 269, 'Sports Equipment');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10121, 'Laptop', 284, 'Pet Supplies');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10122, 'Sports Shoes', 422, 'Pet Supplies');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10123, 'Dog Food', 149, 'Electronics');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10124, 'Phone', 484, 'Beauty');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10125, 'Skin Care', 480, 'Sports Equipment');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10126, 'Phone', 364, 'Electronics');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10127, 'Laptop', 393, 'Electronics');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10128, 'Phone', 109, 'Pet Supplies');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10129, 'Laptop', 28, 'Beauty');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10130, 'Dog Food', 56, 'Sports Equipment');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10131, 'Laptop', 197, 'Sports Equipment');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10132, 'Phone', 122, 'Pet Supplies');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10133, 'Laptop', 374, 'Beauty');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10134, 'Sports Shoes', 206, 'Electronics');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10135, 'Sports Shoes', 256, 'Beauty');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10136, 'Skin Care', 236, 'Pet Supplies');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10137, 'Laptop', 331, 'Electronics');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10138, 'Phone', 208, 'Pet Supplies');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10139, 'Dog Food', 320, 'Pet Supplies');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10140, 'Sports Shoes', 279, 'Electronics');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10141, 'Sports Shoes', 297, 'Beauty');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10142, 'Skin Care', 270, 'Pet Supplies');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10143, 'Skin Care', 49, 'Beauty');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10144, 'Phone', 397, 'Beauty');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10145, 'Phone', 210, 'Pet Supplies');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10146, 'Sports Shoes', 32, 'Sports Equipment');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10147, 'Sports Shoes', 205, 'Beauty');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10148, 'Phone', 68, 'Pet Supplies');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10149, 'Laptop', 164, 'Sports Equipment');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10150, 'Laptop', 303, 'Beauty');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10151, 'Dog Food', 375, 'Electronics');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10152, 'Sports Shoes', 442, 'Pet Supplies');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10153, 'Dog Food', 438, 'Pet Supplies');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10154, 'Phone', 498, 'Beauty');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10155, 'Phone', 368, 'Electronics');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10156, 'Laptop', 410, 'Electronics');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10157, 'Laptop', 268, 'Beauty');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10158, 'Laptop', 150, 'Sports Equipment');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10159, 'Phone', 249, 'Pet Supplies');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10160, 'Dog Food', 490, 'Pet Supplies');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10161, 'Dog Food', 220, 'Beauty');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10162, 'Laptop', 232, 'Electronics');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10163, 'Dog Food', 494, 'Pet Supplies');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10164, 'Sports Shoes', 284, 'Sports Equipment');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10165, 'Phone', 375, 'Pet Supplies');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10166, 'Skin Care', 163, 'Pet Supplies');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10167, 'Laptop', 432, 'Sports Equipment');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10168, 'Dog Food', 384, 'Pet Supplies');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10169, 'Dog Food', 413, 'Electronics');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10170, 'Phone', 236, 'Electronics');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10171, 'Sports Shoes', 143, 'Electronics');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10172, 'Laptop', 135, 'Beauty');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10173, 'Skin Care', 435, 'Beauty');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10174, 'Laptop', 159, 'Sports Equipment');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10175, 'Phone', 283, 'Electronics');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10176, 'Phone', 417, 'Sports Equipment');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10177, 'Sports Shoes', 16, 'Sports Equipment');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10178, 'Phone', 285, 'Beauty');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10179, 'Skin Care', 349, 'Electronics');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10180, 'Sports Shoes', 150, 'Electronics');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10181, 'Dog Food', 467, 'Pet Supplies');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10182, 'Phone', 376, 'Beauty');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10183, 'Dog Food', 416, 'Beauty');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10184, 'Skin Care', 355, 'Beauty');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10185, 'Phone', 186, 'Pet Supplies');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10186, 'Phone', 269, 'Pet Supplies');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10187, 'Sports Shoes', 216, 'Electronics');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10188, 'Dog Food', 286, 'Beauty');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10189, 'Phone', 110, 'Beauty');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10190, 'Skin Care', 497, 'Electronics');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10191, 'Phone', 356, 'Sports Equipment');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10192, 'Laptop', 222, 'Pet Supplies');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10193, 'Laptop', 58, 'Sports Equipment');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10194, 'Dog Food', 88, 'Electronics');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10195, 'Skin Care', 288, 'Pet Supplies');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10196, 'Laptop', 84, 'Electronics');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10197, 'Sports Shoes', 287, 'Electronics');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10198, 'Laptop', 176, 'Sports Equipment');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10199, 'Laptop', 21, 'Pet Supplies');
commit;
prompt 200 records committed...
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10200, 'Dog Food', 372, 'Beauty');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10201, 'Skin Care', 84, 'Electronics');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10202, 'Skin Care', 72, 'Pet Supplies');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10203, 'Laptop', 440, 'Electronics');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10204, 'Phone', 231, 'Pet Supplies');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10205, 'Skin Care', 115, 'Sports Equipment');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10206, 'Skin Care', 85, 'Pet Supplies');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10207, 'Sports Shoes', 146, 'Pet Supplies');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10208, 'Sports Shoes', 365, 'Electronics');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10209, 'Laptop', 118, 'Electronics');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10210, 'Dog Food', 447, 'Electronics');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10211, 'Laptop', 122, 'Pet Supplies');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10212, 'Dog Food', 467, 'Electronics');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10213, 'Skin Care', 351, 'Sports Equipment');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10214, 'Skin Care', 51, 'Electronics');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10215, 'Dog Food', 146, 'Beauty');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10216, 'Sports Shoes', 86, 'Beauty');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10217, 'Laptop', 125, 'Sports Equipment');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10218, 'Sports Shoes', 347, 'Sports Equipment');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10219, 'Laptop', 473, 'Pet Supplies');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10220, 'Dog Food', 233, 'Electronics');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10221, 'Dog Food', 114, 'Beauty');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10222, 'Sports Shoes', 160, 'Sports Equipment');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10223, 'Laptop', 310, 'Sports Equipment');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10224, 'Skin Care', 155, 'Pet Supplies');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10225, 'Skin Care', 41, 'Pet Supplies');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10226, 'Dog Food', 284, 'Pet Supplies');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10227, 'Skin Care', 463, 'Electronics');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10228, 'Dog Food', 75, 'Pet Supplies');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10229, 'Phone', 152, 'Beauty');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10230, 'Skin Care', 428, 'Electronics');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10231, 'Phone', 472, 'Beauty');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10232, 'Phone', 161, 'Beauty');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10233, 'Skin Care', 296, 'Electronics');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10234, 'Skin Care', 239, 'Pet Supplies');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10235, 'Phone', 295, 'Pet Supplies');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10236, 'Dog Food', 383, 'Beauty');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10237, 'Laptop', 359, 'Electronics');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10238, 'Sports Shoes', 496, 'Electronics');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10239, 'Laptop', 54, 'Pet Supplies');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10240, 'Skin Care', 114, 'Sports Equipment');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10241, 'Phone', 24, 'Beauty');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10242, 'Dog Food', 230, 'Pet Supplies');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10243, 'Sports Shoes', 301, 'Electronics');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10244, 'Sports Shoes', 408, 'Beauty');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10245, 'Sports Shoes', 401, 'Sports Equipment');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10246, 'Laptop', 346, 'Electronics');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10247, 'Dog Food', 477, 'Pet Supplies');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10248, 'Laptop', 216, 'Pet Supplies');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10249, 'Sports Shoes', 337, 'Beauty');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10250, 'Skin Care', 429, 'Electronics');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10251, 'Laptop', 241, 'Sports Equipment');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10252, 'Skin Care', 500, 'Electronics');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10253, 'Sports Shoes', 492, 'Pet Supplies');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10254, 'Dog Food', 52, 'Electronics');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10255, 'Phone', 115, 'Electronics');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10256, 'Dog Food', 410, 'Pet Supplies');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10257, 'Sports Shoes', 399, 'Electronics');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10258, 'Dog Food', 321, 'Pet Supplies');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10259, 'Laptop', 467, 'Pet Supplies');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10260, 'Sports Shoes', 199, 'Beauty');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10261, 'Sports Shoes', 358, 'Beauty');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10262, 'Dog Food', 69, 'Electronics');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10263, 'Phone', 447, 'Electronics');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10264, 'Dog Food', 209, 'Pet Supplies');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10265, 'Laptop', 17, 'Beauty');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10266, 'Sports Shoes', 347, 'Pet Supplies');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10267, 'Laptop', 53, 'Pet Supplies');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10268, 'Sports Shoes', 46, 'Electronics');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10269, 'Phone', 320, 'Beauty');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10270, 'Skin Care', 68, 'Electronics');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10271, 'Laptop', 335, 'Beauty');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10272, 'Skin Care', 277, 'Beauty');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10273, 'Dog Food', 441, 'Pet Supplies');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10274, 'Phone', 152, 'Electronics');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10275, 'Skin Care', 232, 'Sports Equipment');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10276, 'Dog Food', 229, 'Sports Equipment');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10277, 'Skin Care', 73, 'Beauty');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10278, 'Skin Care', 258, 'Sports Equipment');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10279, 'Skin Care', 31, 'Electronics');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10280, 'Sports Shoes', 347, 'Pet Supplies');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10281, 'Laptop', 392, 'Beauty');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10282, 'Phone', 284, 'Sports Equipment');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10283, 'Phone', 378, 'Beauty');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10284, 'Sports Shoes', 485, 'Beauty');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10285, 'Laptop', 81, 'Beauty');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10286, 'Phone', 293, 'Pet Supplies');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10287, 'Sports Shoes', 181, 'Pet Supplies');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10288, 'Dog Food', 376, 'Beauty');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10289, 'Sports Shoes', 111, 'Pet Supplies');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10290, 'Phone', 14, 'Sports Equipment');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10291, 'Dog Food', 278, 'Beauty');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10292, 'Phone', 288, 'Sports Equipment');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10293, 'Phone', 167, 'Electronics');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10294, 'Skin Care', 159, 'Pet Supplies');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10295, 'Dog Food', 242, 'Pet Supplies');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10296, 'Sports Shoes', 495, 'Electronics');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10297, 'Skin Care', 154, 'Pet Supplies');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10298, 'Phone', 77, 'Sports Equipment');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10299, 'Laptop', 348, 'Beauty');
commit;
prompt 300 records committed...
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10300, 'Phone', 281, 'Electronics');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10301, 'Phone', 236, 'Electronics');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10302, 'Phone', 121, 'Beauty');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10303, 'Phone', 252, 'Sports Equipment');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10304, 'Sports Shoes', 249, 'Electronics');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10305, 'Skin Care', 338, 'Electronics');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10306, 'Skin Care', 63, 'Sports Equipment');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10307, 'Sports Shoes', 280, 'Pet Supplies');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10308, 'Phone', 68, 'Sports Equipment');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10309, 'Phone', 151, 'Beauty');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10310, 'Skin Care', 209, 'Beauty');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10311, 'Skin Care', 45, 'Pet Supplies');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10312, 'Skin Care', 91, 'Electronics');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10313, 'Phone', 325, 'Electronics');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10314, 'Sports Shoes', 240, 'Sports Equipment');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10315, 'Skin Care', 62, 'Electronics');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10316, 'Phone', 207, 'Beauty');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10317, 'Dog Food', 270, 'Pet Supplies');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10318, 'Sports Shoes', 216, 'Sports Equipment');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10319, 'Phone', 343, 'Beauty');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10320, 'Skin Care', 190, 'Pet Supplies');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10321, 'Skin Care', 344, 'Electronics');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10322, 'Phone', 475, 'Sports Equipment');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10323, 'Sports Shoes', 403, 'Electronics');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10324, 'Laptop', 54, 'Beauty');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10325, 'Sports Shoes', 167, 'Sports Equipment');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10326, 'Laptop', 230, 'Pet Supplies');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10327, 'Sports Shoes', 317, 'Electronics');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10328, 'Skin Care', 18, 'Sports Equipment');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10329, 'Sports Shoes', 117, 'Electronics');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10330, 'Dog Food', 158, 'Electronics');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10331, 'Skin Care', 129, 'Sports Equipment');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10332, 'Phone', 311, 'Sports Equipment');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10333, 'Skin Care', 443, 'Sports Equipment');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10334, 'Skin Care', 208, 'Pet Supplies');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10335, 'Sports Shoes', 457, 'Electronics');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10336, 'Phone', 171, 'Pet Supplies');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10337, 'Skin Care', 380, 'Beauty');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10338, 'Skin Care', 128, 'Pet Supplies');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10339, 'Skin Care', 356, 'Electronics');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10340, 'Skin Care', 444, 'Pet Supplies');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10341, 'Dog Food', 289, 'Sports Equipment');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10342, 'Laptop', 71, 'Pet Supplies');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10343, 'Laptop', 442, 'Beauty');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10344, 'Skin Care', 52, 'Beauty');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10345, 'Laptop', 150, 'Pet Supplies');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10346, 'Phone', 202, 'Beauty');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10347, 'Laptop', 226, 'Electronics');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10348, 'Laptop', 308, 'Beauty');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10349, 'Skin Care', 98, 'Sports Equipment');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10350, 'Phone', 325, 'Electronics');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10351, 'Dog Food', 350, 'Beauty');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10352, 'Skin Care', 241, 'Electronics');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10353, 'Skin Care', 32, 'Sports Equipment');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10354, 'Phone', 186, 'Pet Supplies');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10355, 'Phone', 404, 'Sports Equipment');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10356, 'Phone', 81, 'Pet Supplies');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10357, 'Skin Care', 307, 'Sports Equipment');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10358, 'Sports Shoes', 253, 'Sports Equipment');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10359, 'Skin Care', 307, 'Pet Supplies');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10360, 'Skin Care', 245, 'Beauty');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10361, 'Laptop', 277, 'Sports Equipment');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10362, 'Sports Shoes', 409, 'Beauty');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10363, 'Laptop', 106, 'Electronics');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10364, 'Laptop', 475, 'Sports Equipment');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10365, 'Sports Shoes', 396, 'Sports Equipment');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10366, 'Sports Shoes', 69, 'Beauty');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10367, 'Laptop', 45, 'Beauty');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10368, 'Dog Food', 435, 'Electronics');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10369, 'Phone', 469, 'Pet Supplies');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10370, 'Laptop', 335, 'Pet Supplies');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10371, 'Sports Shoes', 413, 'Beauty');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10372, 'Skin Care', 284, 'Pet Supplies');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10373, 'Phone', 491, 'Beauty');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10374, 'Dog Food', 157, 'Sports Equipment');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10375, 'Phone', 328, 'Sports Equipment');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10376, 'Skin Care', 345, 'Pet Supplies');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10377, 'Phone', 348, 'Pet Supplies');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10378, 'Laptop', 146, 'Sports Equipment');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10379, 'Dog Food', 126, 'Electronics');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10380, 'Laptop', 85, 'Beauty');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10381, 'Phone', 173, 'Beauty');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10382, 'Phone', 335, 'Sports Equipment');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10383, 'Dog Food', 360, 'Pet Supplies');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10384, 'Skin Care', 189, 'Sports Equipment');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10385, 'Dog Food', 294, 'Electronics');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10386, 'Phone', 397, 'Sports Equipment');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10387, 'Phone', 375, 'Sports Equipment');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10388, 'Sports Shoes', 342, 'Sports Equipment');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10389, 'Dog Food', 395, 'Sports Equipment');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10390, 'Dog Food', 143, 'Beauty');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10391, 'Sports Shoes', 12, 'Beauty');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10392, 'Dog Food', 192, 'Sports Equipment');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10393, 'Phone', 490, 'Electronics');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10394, 'Dog Food', 225, 'Sports Equipment');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10395, 'Skin Care', 289, 'Sports Equipment');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10396, 'Phone', 260, 'Electronics');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10397, 'Phone', 141, 'Pet Supplies');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10398, 'Laptop', 129, 'Pet Supplies');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10399, 'Laptop', 480, 'Electronics');
commit;
prompt 400 records loaded
prompt Loading SUPPLIERS...
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (801, 'Burton Dourif', 'burtond@ceb.fr');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (802, 'Grant Wiedlin', 'grant.wiedlin@ntas.be');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (803, 'Alana Kenoly', 'akenoly@dbprofessionals.com');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (804, 'Chet Bosco', 'chet@dell.se');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (805, 'Alec Pleasence', 'a.pleasence@signature.no');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (806, 'Loreena Renfro', 'loreenar@progressivedesigns.at');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (807, 'Janeane Blair', 'janeane.blair@staffforce.pl');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (808, 'Max Peniston', 'm.peniston@gbas.com');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (809, 'Nora McConaughey', 'nora@horizonorganic.ch');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (810, 'Cuba Moriarty', 'cuba.moriarty@trc.es');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (811, 'Lari Stampley', 'l.stampley@dell.com');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (812, 'Tamala David', 'tamala.david@ptg.jp');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (813, 'Kristin Ribisi', 'kristin.ribisi@priorityexpress.jp');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (814, 'Brittany McDonald', 'brittany.m@vesta.be');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (815, 'Alessandro Dean', 'alessandro.dean@reckittbenckiser.com');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (816, 'Etta Kweller', 'etta.k@interfacesoftware.com');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (817, 'Jose Stampley', 'jose@tropicaloasis.de');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (818, 'Albert Belle', 'albert.belle@unilever.es');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (819, 'Ceili Reynolds', 'ceili.reynolds@cws.dk');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (820, 'Mike Callow', 'mike.callow@gagwear.it');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (821, 'Lupe Ward', 'lupe.ward@whitewave.uk');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (822, 'Kris Herrmann', 'kherrmann@nestle.ch');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (823, 'Emma Horton', 'emma.horton@at.br');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (824, 'Hector Waite', 'hector@monarchcasino.com');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (825, 'Jay Lonsdale', 'jay.lonsdale@fra.de');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (826, 'Norm Moody', 'norm.moody@aventis.ca');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (827, 'Ray Ripley', 'ray.ripley@apexsystems.ar');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (828, 'Maura Crosby', 'm.crosby@wlt.uk');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (829, 'Hugh Squier', 'hugh.s@accuship.mx');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (830, 'Anthony Thurman', 'anthony.thurman@eagleone.de');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (831, 'Spike Lindo', 'spike.lindo@linacsystems.com');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (832, 'Teri Witherspoon', 'teri.witherspoon@bat.com');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (833, 'Bo Short', 'bo.s@americanhealthways.fi');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (834, 'Jena Russell', 'jena.russell@tracertechnologies.at');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (835, 'Mitchell Schreiber', 'mschreiber@formatech.uk');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (836, 'Stellan Randal', 'stellan@newtoninteractive.de');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (837, 'Chad Keener', 'chad.keener@captechventures.com');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (838, 'Tony Caviezel', 't.caviezel@meridiangold.ca');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (839, 'Jonny Lee Gore', 'jonnylee@pulaskifinancial.au');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (840, 'Todd Carr', 'todd.carr@mathis.br');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (841, 'Kelly Kretschmann', 'kelly.kretschmann@anworthmortgage.com');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (842, 'Diane Foxx', 'diane.foxx@marketbased.com');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (843, 'Ellen Reid', 'ellen@kwraf.se');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (844, 'Liam Martinez', 'liamm@asa.uk');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (845, 'Corey Gore', 'c.gore@staffforce.com');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (846, 'Seth Collins', 'seth.collins@nobrainerblindscom.fr');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (847, 'Michelle Marsden', 'michelle.marsden@lfg.com');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (848, 'Chi Gold', 'chi.gold@aoe.es');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (849, 'Jeffrey Grier', 'jeffrey.grier@smg.com');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (850, 'Machine von Sydow', 'machine@bristolmyers.com');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (851, 'Lara Stigers', 'laras@valleyoaksystems.au');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (852, 'Bob Biehn', 'bobb@dell.fi');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (853, 'Adam Rossellini', 'a.rossellini@irissoftware.de');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (854, 'Terrence Frampton', 'terrence.frampton@slt.com');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (855, 'Hilton Rapaport', 'hilton@aco.pt');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (856, 'Jeroen Holmes', 'jeroen.holmes@wrgservices.it');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (857, 'Jeroen Aglukark', 'jeroen.aglukark@calence.br');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (858, 'Allan Lemmon', 'alemmon@epamsystems.com');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (859, 'Lauren Perrineau', 'lauren.perrineau@ris.com');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (860, 'Karen Richards', 'karen.richards@mls.br');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (861, 'Avril Viterelli', 'a.viterelli@marathonheater.com');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (862, 'Vern Masur', 'vern.m@healthscribe.my');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (863, 'Greg Dean', 'greg.dean@businessplus.jp');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (864, 'Maureen Greene', 'maureen.greene@telepoint.com');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (865, 'Alex Cheadle', 'alex.cheadle@credopetroleum.es');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (866, 'Breckin Farris', 'breckin.farris@csi.si');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (867, 'Brooke Tucker', 'brooket@accessus.de');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (868, 'Maury Barry', 'maury.barry@fab.ca');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (869, 'Ashton Liu', 'ashton.liu@fnb.de');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (870, 'Lonnie Root', 'lonnie.root@palmbeachtan.com');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (871, 'Alicia Esposito', 'alicia.esposito@sps.com');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (872, 'Campbell McGowan', 'campbell@accessus.com');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (873, 'Kenneth Hubbard', 'k.hubbard@pharmacia.jp');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (874, 'Annette Fonda', 'annette.fonda@scripnet.il');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (875, 'Christmas Lorenz', 'christmas.lorenz@generalmotors.com');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (876, 'Shawn Butler', 'shawn.butler@doctorsassociates.il');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (877, 'Jodie Loggins', 'jodie@philipmorris.com');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (878, 'Maura Colon', 'maura.c@wlt.br');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (879, 'Yolanda Epps', 'yolanda.epps@glaxosmithkline.gr');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (880, 'Meredith McDowell', 'meredith.mcdowell@boldtechsystems.de');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (881, 'Rawlins Joli', 'rawlins.joli@glacierbancorp.jp');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (882, 'Nikka Page', 'npage@accessus.com');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (883, 'Jamie Carter', 'jamie.carter@aquascapedesigns.de');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (884, 'Kenny Whitford', 'kenny.whitford@sfgo.com');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (885, 'Andie Uggams', 'andie@enterprise.com');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (886, 'Cornell Lane', 'cornell.lane@ogi.com');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (887, 'Loretta David', 'lorettad@fmb.com');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (888, 'Anthony Evanswood', 'anthony.evanswood@datawarehouse.com');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (889, 'Giovanni Melvin', 'giovanni.melvin@microtek.com');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (890, 'Stewart Madsen', 'smadsen@integramedamerica.it');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (891, 'Chad Ricci', 'chad.ricci@aristotle.de');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (892, 'Jean Cara', 'jean.cara@doctorsassociates.uk');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (893, 'Gran Ryder', 'gran.ryder@homedepot.com');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (894, 'Timothy Sanchez', 'timothy.s@waltdisney.com');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (895, 'Kirk Sobieski', 'kirk@baesch.uk');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (896, 'Sissy Goldberg', 'sissy.goldberg@trx.it');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (897, 'Wally Emmerich', 'w.emmerich@nha.com');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (898, 'Ned Rundgren', 'nedr@marlabs.com');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (899, 'Demi Suchet', 'demi.s@bowman.com');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (900, 'Franz Harrelson', 'franz.harrelson@mwh.com');
commit;
prompt 100 records committed...
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (901, 'Ike Rio', 'ike.r@woronocobancorp.com');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (902, 'Timothy Bragg', 'timothy@career.com');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (903, 'Patty Kudrow', 'patty@innovateecommerce.ca');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (904, 'Bob Speaks', 'bob.speaks@msdw.com');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (905, 'Harvey Isaacs', 'harvey.isaacs@studiobproductions.fr');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (906, 'Chrissie Turner', 'chrissie.turner@tlsservicebureau.uk');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (907, 'Chubby Biel', 'chubby.biel@usgovernment.com');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (908, 'Darren Rain', 'darren.r@merck.com');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (909, 'Albertina Dempsey', 'adempsey@clorox.com');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (910, 'Timothy Hutton', 't.hutton@powerlight.br');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (911, 'Gailard LaMond', 'glamond@gdatechnologies.com');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (912, 'Robby Leto', 'robbyl@adeasolutions.com');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (913, 'Franz Cruz', 'franz.cruz@fmt.it');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (914, 'Hazel O''Keefe', 'hazel@vitacostcom.com');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (915, 'Boz Foley', 'bozf@knightsbridge.il');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (916, 'Night O''Keefe', 'n.okeefe@usenergyservices.li');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (917, 'Liquid Grier', 'liquid.grier@dynacqinternational.ch');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (918, 'Temuera Brooke', 'temuera.b@magnet.com');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (919, 'Mena Green', 'mgreen@waltdisney.com');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (920, 'Gary Gere', 'gary@bestever.uk');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (921, 'Curtis Reed', 'creed@inzone.dk');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (922, 'Temuera Osbourne', 'temuera.osbourne@kellogg.uk');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (923, 'Etta Weston', 'etta.weston@hencie.com');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (924, 'Patrick Brown', 'patrickb@airmethods.com');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (925, 'Gene Houston', 'gene.houston@ibfh.com');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (926, 'Jose Mantegna', 'jose.mantegna@paintedword.com');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (927, 'Humberto Berkley', 'humberto.berkley@nlx.com');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (928, 'Richie Yulin', 'richiey@grayhawksystems.com');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (929, 'Rory Condition', 'roryc@scripnet.br');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (930, 'Rhett Lucas', 'rhett.lucas@ahl.com');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (931, 'Adrien Mortensen', 'adrien.m@nmr.com');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (932, 'Giovanni Keen', 'giovanni.keen@flavorx.ch');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (933, 'Keanu Winger', 'keanu.winger@nissanmotor.de');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (934, 'Terry Rizzo', 'terry.rizzo@wlt.de');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (935, 'Janeane Young', 'j.young@mastercardinternational.com');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (936, 'Miranda Stanton', 'miranda@restaurantpartners.be');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (937, 'Vertical Reubens', 'v.reubens@morganresearch.it');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (938, 'Anna Turner', 'annat@royalgold.com');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (939, 'Elvis Shelton', 'elvis@investorstitle.ca');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (940, 'Marianne Domino', 'marianne.domino@onesourceprinting.ec');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (941, 'Holly Ali', 'holly@operationaltechnologies.cz');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (942, 'Norm Zellweger', 'norm.zellweger@cws.com');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (943, 'Elias Rawls', 'elias.r@parksite.uk');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (944, 'Larnelle Holy', 'larnelle.holy@news.de');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (945, 'Joy O''Neill', 'joy.oneill@linksys.com');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (946, 'Curtis Weaving', 'curtis.weaving@activeservices.com');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (947, 'David Hoffman', 'david.hoffman@epiqsystems.com');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (948, 'Mykelti Hurley', 'mykeltih@astute.com');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (949, 'Maggie Henstridge', 'maggie.henstridge@aldensystems.ca');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (950, 'Juliette Shocked', 'juliette.shocked@sandyspringbancorp.uk');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (951, 'Marianne Robbins', 'marianner@clubone.com');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (952, 'Robbie Flatts', 'rflatts@whitewave.com');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (953, 'Jeanne Heslov', 'jeanne.heslov@verizon.es');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (954, 'First Hanley', 'firsth@freedommedical.com');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (955, 'Wang Tyson', 'wang.tyson@diversitech.ca');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (956, 'Tea Price', 'teap@topicsentertainment.com');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (957, 'Elijah McBride', 'elijah@serentec.com');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (958, 'Val Vannelli', 'val.v@vesta.com');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (959, 'Bryan Skaggs', 'bskaggs@kellogg.com');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (960, 'Fionnula Costello', 'fionnula.costello@unit.com');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (961, 'Veruca Flatts', 'veruca.flatts@knightsbridge.com');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (962, 'Juan Hawn', 'juan.hawn@columbiabancorp.com');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (963, 'Christmas Dysart', 'christmas.dysart@ceo.com');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (964, 'Larenz Squier', 'larenz.squier@newhorizons.nl');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (965, 'Ewan Warden', 'e.warden@ssci.de');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (966, 'Saffron McLean', 'saffron.mclean@nestle.com');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (967, 'Jonatha Warren', 'jonathaw@gillette.es');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (968, 'Val Field', 'val.field@kis.com');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (969, 'Mili Dench', 'mili.dench@mindworks.com');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (970, 'Rhys Wopat', 'rhys@investorstitle.ch');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (971, 'Martin Cara', 'martin@kwraf.com');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (972, 'Dorry Brock', 'dorry.brock@capellaeducation.jp');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (973, 'Emilio Reiner', 'emilio@generalmills.fr');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (974, 'Natascha Hoffman', 'natascha.hoffman@epiqsystems.it');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (975, 'Delroy Purefoy', 'delroy@trekequipment.de');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (976, 'Jill Mewes', 'jill.m@bigyanksports.ca');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (977, 'Leslie McIntosh', 'leslie.m@staffone.com');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (978, 'Sona Clarkson', 'sona.c@emt.ch');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (979, 'Gailard Dunaway', 'gailard.d@mathis.com');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (980, 'Collective Starr', 'collective.starr@ibfh.es');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (981, 'Davy Blaine', 'davyb@mms.uk');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (982, 'Lydia Henstridge', 'lydiah@pds.it');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (983, 'Spike McDormand', 'spike.mcdormand@gbas.il');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (984, 'Benjamin Lee', 'benjamin.l@campbellsoup.com');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (985, 'Cloris Barkin', 'cloris.barkin@ataservices.de');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (986, 'Grace Street', 'grace.street@medamicus.uk');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (987, 'Simon Laurie', 'simon@newviewgifts.de');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (988, 'Dean Ermey', 'dean@tilsonhr.uk');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (989, 'Kelli Union', 'kelli.union@conquestsystems.de');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (990, 'Joan Lavigne', 'joan.lavigne@ctg.com');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (991, 'Simon Loggins', 'simon@monitronicsinternational.com');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (992, 'Chloe Lonsdale', 'c.lonsdale@elite.pk');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (993, 'Kyra Barnett', 'kbarnett@kingland.com');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (994, 'Sheena Lizzy', 'sheena.lizzy@montpelierplastics.de');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (995, 'Jose Vinton', 'jose.vinton@dillards.uk');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (996, 'Adrien Solido', 'adriens@abs.de');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (997, 'Philip Chandler', 'philip.c@webgroup.com');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (998, 'Bill Pantoliano', 'billp@timberlanewoodcrafters.com');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (999, 'Ruth Ruffalo', 'rruffalo@manhattanassociates.uk');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (1000, 'Molly Nelson', 'm.nelson@pis.br');
commit;
prompt 200 records committed...
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (1001, 'Julio Cleary', 'julio@globalwireless.ca');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (1002, 'Seann Young', 'seann.young@staffforce.uk');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (1003, 'Adina Forrest', 'adinaf@typhoon.com');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (1004, 'Stevie Mueller-Stahl', 's.muellerstahl@neogen.ca');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (1005, 'Leon Trejo', 'leon.trejo@refinery.com');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (1006, 'Jesse Bruce', 'jbruce@capitolbancorp.it');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (1007, 'Nicholas Spears', 'nicholas.s@horizon.nc');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (1008, 'Linda Lonsdale', 'linda.lonsdale@priorityexpress.com');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (1009, 'Howie Dench', 'howie.dench@cocacola.de');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (1010, 'Maceo Duncan', 'maceo@mavericktechnologies.com');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (1011, 'Anna Craddock', 'annac@tilsonlandscape.cn');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (1012, 'Wally O''Sullivan', 'wally.osullivan@evergreenresources.com');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (1013, 'Mika Graham', 'mika@cooktek.de');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (1014, 'Cloris Wahlberg', 'cloris.w@wellsfinancial.dk');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (1015, 'Chi Robinson', 'chir@cimalabs.de');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (1016, 'Denise Lovitz', 'denisel@ahl.com');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (1017, 'Fairuza Woodard', 'fwoodard@grt.it');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (1018, 'Andy Emmett', 'andy@studiobproductions.com');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (1019, 'Grace Ferry', 'g.ferry@ungertechnologies.com');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (1020, 'Clea Niven', 'c.niven@grs.com');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (1021, 'Lennie Blackmore', 'lennie.blackmore@investmentscorecard.fr');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (1022, 'Vendetta Ramis', 'vendetta.ramis@marlabs.br');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (1023, 'Carl Kenoly', 'carl.kenoly@shar.ar');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (1024, 'Chet Damon', 'chet.damon@contract.de');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (1025, 'Gerald Reilly', 'g.reilly@cima.com');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (1026, 'Jann Giraldo', 'jann@profitline.com');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (1027, 'Dom Emmerich', 'dom.e@tmaresources.com');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (1028, 'Arnold von Sydow', 'arnold.vonsydow@cimalabs.com');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (1029, 'Freddy Chaykin', 'freddy.chaykin@yumbrands.com');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (1030, 'Stanley Streep', 'stanley@hersheyfoods.com');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (1031, 'Garland Palin', 'g.palin@vitacostcom.se');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (1032, 'Cate Whitman', 'cate.whitman@freedommedical.com');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (1033, 'Gena Duke', 'gena@trx.ec');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (1034, 'Art Payne', 'art.payne@atg.com');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (1035, 'Collective Suchet', 'collective.suchet@clorox.ar');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (1036, 'Ronnie Clooney', 'rclooney@directdata.de');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (1037, 'Lorraine Rock', 'lorraine.r@aci.com');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (1038, 'Tony Mahoney', 'tmahoney@sfmai.com');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (1039, 'Connie Palminteri', 'connie.palminteri@egroup.jp');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (1040, 'Terrence Logue', 'terrencel@firstsouthbancorp.in');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (1041, 'Nick Neill', 'nick.neill@news.hk');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (1042, 'Kate Garcia', 'kateg@grt.dk');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (1043, 'Chi Reed', 'chi.reed@consultants.th');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (1044, 'Phoebe Rankin', 'phoebe.rankin@envisiontelephony.com');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (1045, 'Sophie Phifer', 'sophie.phifer@idas.jp');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (1046, 'Ashley Ricci', 'aricci@cendant.jp');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (1047, 'Donna Williams', 'dwilliams@oneidafinancial.com');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (1048, 'Rufus Meniketti', 'rufus.meniketti@procter.de');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (1049, 'Cledus Hampton', 'cledus@capellaeducation.com');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (1050, 'Lauren Pantoliano', 'lpantoliano@codykramerimports.no');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (1051, 'Ritchie Jessee', 'ritchie.jessee@johnkeeler.pl');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (1052, 'Viggo O''Sullivan', 'viggo.osullivan@surmodics.cn');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (1053, 'Rufus Renfro', 'rrenfro@glaxosmithkline.fr');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (1054, 'Rory Sayer', 'r.sayer@onstaff.com');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (1055, 'Alice Willis', 'alice.willis@talx.com');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (1056, 'Gena Nakai', 'gena.nakai@usainstruments.com');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (1057, 'Tcheky Polito', 'tpolito@volkswagen.com');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (1058, 'Elizabeth Gere', 'elizabeth@faef.com');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (1059, 'Molly Sainte-Marie', 'molly.s@isd.br');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (1060, 'Norm Dafoe', 'n.dafoe@whitewave.com');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (1061, 'Glenn Borgnine', 'glenn.borgnine@vertexsolutions.com');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (1062, 'Leslie Avital', 'leslie.avital@pinnaclestaffing.com');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (1063, 'Harrison Belushi', 'harrison.belushi@aoltimewarner.au');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (1064, 'Jose Tyler', 'jose.tyler@dillards.uk');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (1065, 'Sigourney Zane', 's.zane@stonebrewing.com');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (1066, 'Denny Mollard', 'denny@eastmankodak.ch');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (1067, 'Drew Ranger', 'drew.ranger@proclarity.fr');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (1068, 'Solomon Beals', 'solomon@jsa.ec');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (1069, 'Selma Margolyes', 'selma.margolyes@blueoceansoftware.com');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (1070, 'Maggie Shalhoub', 'maggies@vms.com');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (1071, 'Thomas Mueller-Stahl', 'thomas.muellerstahl@medamicus.br');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (1072, 'Milla Dench', 'milla.dench@savela.de');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (1073, 'Thelma Mandrell', 'thelma.m@genextechnologies.de');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (1074, 'Pat Gellar', 'pat.gellar@datawarehouse.uk');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (1075, 'Daryle Rea', 'daryler@ogi.jp');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (1076, 'Jason Pony', 'jason.p@scriptsave.com');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (1077, 'Cary Sutherland', 'cary@socketinternet.dk');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (1078, 'Joseph Matthau', 'josephm@sm.com');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (1079, 'Dabney Tilly', 'dabney.tilly@qas.de');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (1080, 'Isaac Ruffalo', 'isaac@stm.dk');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (1081, 'Isaiah Root', 'isaiah.root@spectrum.uk');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (1082, 'Kiefer Rossellini', 'k.rossellini@chipssolutions.it');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (1083, 'Grant Joli', 'grant.j@smartdrawcom.jp');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (1084, 'Gord Russo', 'gord.russo@mse.com');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (1085, 'Drew Flanagan', 'drew.f@lynksystems.uk');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (1086, 'Anthony Gilliam', 'anthony.g@creditorsinterchange.es');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (1087, 'Antonio Weaving', 'antonio.weaving@genextechnologies.ar');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (1088, 'Millie McCready', 'millie.mccready@fam.com');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (1089, 'Jared Affleck', 'jared@qssgroup.ca');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (1090, 'Carl Geldof', 'carl.geldof@nha.fr');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (1091, 'Pierce Gertner', 'pierce@vspan.uk');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (1092, 'Beth Secada', 'beth.s@parker.com');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (1093, 'Carrie Armatrading', 'carrie.armatrading@avs.fi');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (1094, 'Terry Steiger', 'terry.s@myricom.de');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (1095, 'Bridgette Amos', 'bridgette.amos@team.com');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (1096, 'Jessica Russell', 'jessica.russell@sunstream.ca');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (1097, 'Patricia O''Hara', 'patricia.ohara@cima.com');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (1098, 'Mary Arthur', 'mary.a@democracydata.com');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (1099, 'Randall Rooker', 'randall.rooker@labradanutrition.ca');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (1100, 'Lou Buscemi', 'lou.b@softworld.si');
commit;
prompt 300 records committed...
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (1101, 'Lois Gunton', 'lois.gunton@consultants.uk');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (1102, 'Fred Gibbons', 'fred@lindin.com');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (1103, 'Rascal Byrd', 'rascal.byrd@tripwire.com');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (1104, 'Quentin Holy', 'quentin.holy@atg.com');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (1105, 'Alice Marsden', 'amarsden@marriottinternational.com');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (1106, 'Elle Lennix', 'elle.lennix@uem.com');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (1107, 'Art Lynn', 'alynn@diversitech.ch');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (1108, 'Rutger Reeve', 'rutger.r@priorityleasing.br');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (1109, 'Lena Christie', 'lena@knightsbridge.com');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (1110, 'Betty Armatrading', 'betty.armatrading@dsp.com');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (1111, 'Ritchie Birch', 'ritchieb@pib.de');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (1112, 'Stephen Aglukark', 'stephena@appriss.de');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (1113, 'Guy Zeta-Jones', 'guy.zetajones@gillette.de');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (1114, 'Sally Getty', 'sally.getty@keith.se');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (1115, 'Corey Joli', 'corey.j@qas.de');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (1116, 'Quentin Springfield', 'quentin.springfield@gillette.com');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (1117, 'Burton Fishburne', 'burton.fishburne@clorox.com');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (1118, 'Bonnie Rundgren', 'brundgren@kwraf.jp');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (1119, 'Nora Nielsen', 'noran@paintedword.es');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (1120, 'Brenda Slater', 'brenda.slater@veritekinternational.de');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (1121, 'Sheena Crow', 's.crow@alogent.jp');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (1122, 'Dabney Burns', 'dabney.burns@tlsservicebureau.com');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (1123, 'Stevie Weisz', 'stevie.weisz@vms.lt');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (1124, 'Hilton Todd', 'hilton.todd@nuinfosystems.ca');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (1125, 'Pamela Sandler', 'pamela.s@fra.uk');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (1126, 'Rhys Gandolfini', 'rhys.gandolfini@refinery.de');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (1127, 'Breckin Romijn-Stamos', 'breckin.romijnstamos@fam.com');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (1128, 'Zooey James', 'zooey.j@smi.de');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (1129, 'Bridgette Rippy', 'b.rippy@ciwservices.de');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (1130, 'Alex Bridges', 'alex.bridges@tps.de');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (1131, 'Glen Brooks', 'glen.brooks@atlanticcredit.de');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (1132, 'Rickie Dern', 'rdern@wrgservices.ca');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (1133, 'Dwight Goldwyn', 'dwight.goldwyn@entelligence.com');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (1134, 'Gilberto Hampton', 'gilberto.hampton@spotfireholdings.de');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (1135, 'Brendan Trevino', 'btrevino@genghisgrill.ca');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (1136, 'Armin Imperioli', 'a.imperioli@smartronix.com');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (1137, 'Ernest Soul', 'ernest.soul@microtek.de');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (1138, 'Carla Cronin', 'carlac@bps.jp');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (1139, 'Lari Ribisi', 'lari.r@anworthmortgage.dk');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (1140, 'Boz Danes', 'bozd@harrison.com');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (1141, 'Taryn Hughes', 't.hughes@cws.com');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (1142, 'Gloria Dooley', 'gloriad@invisioncom.com');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (1143, 'Ned Page', 'ned@bluffcitysteel.com');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (1144, 'Bobbi O''Donnell', 'bodonnell@glmt.de');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (1145, 'Lorraine Place', 'lorraine.place@johnson.it');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (1146, 'Woody Applegate', 'woody.applegate@gdatechnologies.com');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (1147, 'Jean-Luc Moffat', 'jeanluc.m@zoneperfectnutrition.com');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (1148, 'Celia Chandler', 'c.chandler@bigdoughcom.com');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (1149, 'Whoopi Brando', 'whoopi.brando@processplus.it');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (1150, 'John Damon', 'john.damon@usainstruments.jp');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (1151, 'Robbie Perry', 'robbie.perry@manhattanassociates.com');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (1152, 'Rupert Reinhold', 'rupert.reinhold@infopros.de');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (1153, 'Aaron Colon', 'aaron.colon@career.com');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (1154, 'Andie Mazzello', 'andie.mazzello@cws.com');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (1155, 'Tori Pastore', 'tpastore@hospitalsolutions.com');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (1156, 'Nicholas McDonnell', 'nicholas@target.no');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (1157, 'Austin McAnally', 'austin.mcanally@shot.dk');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (1158, 'Viggo Franklin', 'viggof@fam.com');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (1159, 'Lea Milsap', 'lea.milsap@topicsentertainment.uk');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (1160, 'Famke Jessee', 'famke.jessee@dsp.com');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (1161, 'Curtis Neuwirth', 'cneuwirth@diageo.ch');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (1162, 'Ike Wine', 'ike.wine@aco.at');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (1163, 'Treat Giamatti', 't.giamatti@stonebrewing.cn');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (1164, 'Rory Curfman', 'rory.curfman@usgovernment.de');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (1165, 'Phoebe Hall', 'phoebe.h@timberlanewoodcrafters.com');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (1166, 'Delbert Garner', 'delbert.garner@visionarysystems.au');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (1167, 'Queen Carnes', 'qcarnes@globalwireless.com');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (1168, 'Tanya Day', 'tanyad@trekequipment.it');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (1169, 'Miriam Robbins', 'miriam.robbins@bestbuy.no');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (1170, 'April Bale', 'aprilb@stmaryland.ar');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (1171, 'Jason Winans', 'jason.winans@shot.jp');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (1172, 'Sydney Giamatti', 'sydney.giamatti@kingston.dk');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (1173, 'Rosario McDowell', 'rosario@wci.py');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (1174, 'Rade Garber', 'rade.garber@jewettcameron.de');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (1175, 'Fairuza Burrows', 'fairuza.burrows@scjohnson.au');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (1176, 'Cathy Squier', 'cathy@verizon.com');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (1177, 'Miriam McCracken', 'miriam.mccracken@hotmail.com');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (1178, 'Nik Lithgow', 'nikl@aoe.com');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (1179, 'Catherine English', 'catherine.e@telwares.hk');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (1180, 'Brenda Bacharach', 'brenda.b@capitalbank.com');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (1181, 'Busta Gere', 'busta.gere@bioreference.uk');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (1182, 'Albert Washington', 'albert.w@operationaltechnologies.com');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (1183, 'Charlize Krabbe', 'ckrabbe@lindin.com');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (1184, 'Saul Brooke', 'saulb@ogi.br');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (1185, 'Mos Stewart', 'mos@primussoftware.br');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (1186, 'Miles Dale', 'mdale@asapstaffing.com');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (1187, 'Bryan Walken', 'bryanw@gsat.au');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (1188, 'Vanessa Guest', 'vanessa.guest@lloydgroup.jp');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (1189, 'Patty Pitney', 'patty.pitney@anworthmortgage.no');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (1190, 'Louise Leguizamo', 'louisel@abatix.com');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (1191, 'Christmas Nivola', 'christmas@bioanalytical.com');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (1192, 'Greg Phillippe', 'gregp@daimlerchrysler.com');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (1193, 'Tia De Almeida', 'tia.d@nbs.de');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (1194, 'Chi Kingsley', 'chi.kingsley@prahs.br');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (1195, 'Leelee Hutton', 'leelee.h@mcdonalds.fr');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (1196, 'Morgan Wagner', 'morgan.w@infovision.com');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (1197, 'Marc Dafoe', 'marc.dafoe@ach.be');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (1198, 'Nik Tolkan', 'ntolkan@proclarity.com');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (1199, 'Tilda Leigh', 'tilda@lloydgroup.se');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (1200, 'Ahmad Goodall', 'ahmad.goodall@httprint.be');
commit;
prompt 400 records loaded
prompt Loading INVENTORY...
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20000, 420, to_date('27-08-2021', 'dd-mm-yyyy'), 10366, 967);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20001, 45, to_date('17-12-2023', 'dd-mm-yyyy'), 10287, 1149);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20002, 873, to_date('06-12-2022', 'dd-mm-yyyy'), 10293, 1090);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20003, 358, to_date('20-07-2023', 'dd-mm-yyyy'), 10088, 857);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20004, 347, to_date('24-10-2021', 'dd-mm-yyyy'), 10326, 893);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20005, 877, to_date('28-08-2023', 'dd-mm-yyyy'), 10068, 888);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20006, 534, to_date('08-11-2020', 'dd-mm-yyyy'), 10315, 887);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20007, 713, to_date('08-11-2020', 'dd-mm-yyyy'), 10084, 1171);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20008, 554, to_date('29-05-2022', 'dd-mm-yyyy'), 10216, 1152);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20009, 633, to_date('12-01-2022', 'dd-mm-yyyy'), 10172, 843);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20010, 681, to_date('06-03-2021', 'dd-mm-yyyy'), 10391, 920);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20011, 888, to_date('20-01-2021', 'dd-mm-yyyy'), 10081, 1148);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20012, 586, to_date('18-01-2021', 'dd-mm-yyyy'), 10007, 990);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20013, 361, to_date('12-09-2021', 'dd-mm-yyyy'), 10344, 1161);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20014, 889, to_date('11-02-2022', 'dd-mm-yyyy'), 10170, 962);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20015, 31, to_date('01-11-2022', 'dd-mm-yyyy'), 10064, 1137);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20016, 21, to_date('01-01-2022', 'dd-mm-yyyy'), 10173, 902);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20017, 738, to_date('08-11-2021', 'dd-mm-yyyy'), 10229, 1084);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20018, 409, to_date('31-05-2023', 'dd-mm-yyyy'), 10072, 1024);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20019, 268, to_date('08-05-2020', 'dd-mm-yyyy'), 10155, 966);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20020, 960, to_date('09-12-2023', 'dd-mm-yyyy'), 10394, 1007);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20021, 755, to_date('18-01-2020', 'dd-mm-yyyy'), 10246, 923);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20022, 863, to_date('09-02-2020', 'dd-mm-yyyy'), 10158, 930);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20023, 382, to_date('25-12-2020', 'dd-mm-yyyy'), 10287, 1122);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20024, 708, to_date('10-09-2021', 'dd-mm-yyyy'), 10031, 1029);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20025, 410, to_date('05-12-2021', 'dd-mm-yyyy'), 10060, 832);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20026, 916, to_date('08-04-2020', 'dd-mm-yyyy'), 10206, 1091);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20027, 507, to_date('31-01-2023', 'dd-mm-yyyy'), 10281, 1121);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20028, 469, to_date('04-01-2020', 'dd-mm-yyyy'), 10200, 1062);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20029, 395, to_date('28-12-2022', 'dd-mm-yyyy'), 10265, 1185);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20030, 977, to_date('02-10-2022', 'dd-mm-yyyy'), 10187, 883);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20031, 812, to_date('22-09-2021', 'dd-mm-yyyy'), 10317, 1089);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20032, 29, to_date('17-04-2023', 'dd-mm-yyyy'), 10246, 1154);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20033, 780, to_date('28-04-2022', 'dd-mm-yyyy'), 10049, 950);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20034, 883, to_date('11-12-2022', 'dd-mm-yyyy'), 10340, 1019);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20035, 190, to_date('16-06-2022', 'dd-mm-yyyy'), 10213, 930);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20036, 445, to_date('08-05-2021', 'dd-mm-yyyy'), 10220, 877);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20037, 701, to_date('14-05-2020', 'dd-mm-yyyy'), 10075, 864);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20038, 582, to_date('11-07-2022', 'dd-mm-yyyy'), 10047, 1123);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20039, 945, to_date('18-01-2023', 'dd-mm-yyyy'), 10298, 1107);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20040, 730, to_date('01-03-2023', 'dd-mm-yyyy'), 10152, 904);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20041, 51, to_date('30-08-2020', 'dd-mm-yyyy'), 10158, 1009);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20042, 826, to_date('15-03-2023', 'dd-mm-yyyy'), 10307, 910);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20043, 480, to_date('30-03-2023', 'dd-mm-yyyy'), 10286, 1015);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20044, 544, to_date('12-08-2022', 'dd-mm-yyyy'), 10129, 983);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20045, 166, to_date('06-08-2023', 'dd-mm-yyyy'), 10132, 1186);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20046, 854, to_date('21-06-2020', 'dd-mm-yyyy'), 10210, 955);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20047, 984, to_date('03-07-2022', 'dd-mm-yyyy'), 10154, 953);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20048, 880, to_date('30-03-2020', 'dd-mm-yyyy'), 10366, 1111);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20049, 510, to_date('22-02-2020', 'dd-mm-yyyy'), 10333, 888);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20050, 84, to_date('13-05-2021', 'dd-mm-yyyy'), 10216, 1074);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20051, 118, to_date('08-10-2021', 'dd-mm-yyyy'), 10215, 904);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20052, 752, to_date('05-01-2021', 'dd-mm-yyyy'), 10085, 1114);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20053, 365, to_date('22-08-2021', 'dd-mm-yyyy'), 10071, 880);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20054, 798, to_date('13-03-2022', 'dd-mm-yyyy'), 10227, 1092);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20055, 708, to_date('15-03-2021', 'dd-mm-yyyy'), 10392, 908);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20056, 880, to_date('12-01-2020', 'dd-mm-yyyy'), 10386, 1015);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20057, 519, to_date('07-07-2021', 'dd-mm-yyyy'), 10102, 1169);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20058, 828, to_date('26-04-2022', 'dd-mm-yyyy'), 10063, 826);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20059, 425, to_date('08-12-2021', 'dd-mm-yyyy'), 10297, 1034);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20060, 382, to_date('29-04-2020', 'dd-mm-yyyy'), 10326, 1014);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20061, 951, to_date('16-01-2021', 'dd-mm-yyyy'), 10309, 983);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20062, 247, to_date('12-11-2021', 'dd-mm-yyyy'), 10334, 853);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20063, 477, to_date('28-10-2023', 'dd-mm-yyyy'), 10100, 960);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20064, 458, to_date('31-07-2022', 'dd-mm-yyyy'), 10190, 1061);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20065, 518, to_date('04-02-2023', 'dd-mm-yyyy'), 10172, 1143);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20066, 55, to_date('06-07-2023', 'dd-mm-yyyy'), 10120, 888);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20067, 298, to_date('12-03-2023', 'dd-mm-yyyy'), 10210, 1145);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20068, 77, to_date('22-11-2022', 'dd-mm-yyyy'), 10371, 831);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20069, 650, to_date('23-11-2021', 'dd-mm-yyyy'), 10046, 838);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20070, 865, to_date('18-03-2022', 'dd-mm-yyyy'), 10244, 962);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20071, 229, to_date('08-08-2022', 'dd-mm-yyyy'), 10147, 804);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20072, 670, to_date('06-07-2022', 'dd-mm-yyyy'), 10240, 899);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20073, 27, to_date('05-10-2020', 'dd-mm-yyyy'), 10033, 804);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20074, 591, to_date('15-12-2022', 'dd-mm-yyyy'), 10144, 989);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20075, 213, to_date('25-07-2020', 'dd-mm-yyyy'), 10215, 1084);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20076, 808, to_date('11-08-2021', 'dd-mm-yyyy'), 10223, 1118);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20077, 273, to_date('10-11-2021', 'dd-mm-yyyy'), 10060, 895);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20078, 138, to_date('10-07-2022', 'dd-mm-yyyy'), 10354, 1150);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20079, 477, to_date('03-05-2021', 'dd-mm-yyyy'), 10382, 1040);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20080, 900, to_date('04-01-2021', 'dd-mm-yyyy'), 10276, 989);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20081, 643, to_date('15-12-2023', 'dd-mm-yyyy'), 10354, 857);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20082, 88, to_date('24-03-2023', 'dd-mm-yyyy'), 10172, 1063);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20083, 224, to_date('18-08-2020', 'dd-mm-yyyy'), 10352, 807);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20084, 872, to_date('13-12-2023', 'dd-mm-yyyy'), 10362, 838);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20085, 707, to_date('28-02-2020', 'dd-mm-yyyy'), 10314, 1108);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20086, 386, to_date('29-08-2022', 'dd-mm-yyyy'), 10141, 956);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20087, 316, to_date('24-05-2023', 'dd-mm-yyyy'), 10038, 1177);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20088, 860, to_date('27-10-2021', 'dd-mm-yyyy'), 10122, 993);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20089, 40, to_date('06-09-2023', 'dd-mm-yyyy'), 10188, 1108);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20090, 29, to_date('16-06-2023', 'dd-mm-yyyy'), 10121, 849);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20091, 964, to_date('14-07-2021', 'dd-mm-yyyy'), 10042, 1173);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20092, 894, to_date('07-12-2023', 'dd-mm-yyyy'), 10153, 957);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20093, 913, to_date('29-07-2021', 'dd-mm-yyyy'), 10349, 939);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20094, 755, to_date('13-01-2023', 'dd-mm-yyyy'), 10164, 923);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20095, 416, to_date('11-09-2023', 'dd-mm-yyyy'), 10126, 826);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20096, 590, to_date('02-04-2023', 'dd-mm-yyyy'), 10082, 983);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20097, 973, to_date('01-07-2020', 'dd-mm-yyyy'), 10168, 874);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20098, 726, to_date('07-05-2023', 'dd-mm-yyyy'), 10191, 1096);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20099, 643, to_date('25-12-2020', 'dd-mm-yyyy'), 10089, 1148);
commit;
prompt 100 records committed...
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20100, 831, to_date('25-02-2022', 'dd-mm-yyyy'), 10240, 849);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20101, 936, to_date('15-06-2020', 'dd-mm-yyyy'), 10089, 957);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20102, 218, to_date('18-08-2020', 'dd-mm-yyyy'), 10064, 1000);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20103, 26, to_date('24-09-2020', 'dd-mm-yyyy'), 10241, 907);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20104, 459, to_date('04-03-2022', 'dd-mm-yyyy'), 10140, 1035);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20105, 272, to_date('18-07-2020', 'dd-mm-yyyy'), 10107, 975);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20106, 313, to_date('27-02-2023', 'dd-mm-yyyy'), 10063, 1156);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20107, 48, to_date('30-03-2020', 'dd-mm-yyyy'), 10278, 1004);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20108, 964, to_date('04-10-2021', 'dd-mm-yyyy'), 10149, 1094);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20109, 895, to_date('17-09-2020', 'dd-mm-yyyy'), 10239, 835);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20110, 578, to_date('27-12-2020', 'dd-mm-yyyy'), 10161, 945);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20111, 976, to_date('20-07-2020', 'dd-mm-yyyy'), 10158, 846);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20112, 165, to_date('06-01-2022', 'dd-mm-yyyy'), 10363, 831);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20113, 847, to_date('04-07-2023', 'dd-mm-yyyy'), 10201, 937);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20114, 759, to_date('19-09-2023', 'dd-mm-yyyy'), 10098, 988);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20115, 548, to_date('25-02-2020', 'dd-mm-yyyy'), 10174, 1122);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20116, 905, to_date('19-06-2020', 'dd-mm-yyyy'), 10287, 1076);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20117, 990, to_date('26-10-2023', 'dd-mm-yyyy'), 10285, 953);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20118, 464, to_date('20-03-2022', 'dd-mm-yyyy'), 10258, 1119);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20119, 668, to_date('07-10-2020', 'dd-mm-yyyy'), 10233, 976);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20120, 731, to_date('12-10-2020', 'dd-mm-yyyy'), 10100, 860);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20121, 686, to_date('21-08-2022', 'dd-mm-yyyy'), 10228, 996);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20122, 857, to_date('28-05-2022', 'dd-mm-yyyy'), 10140, 1158);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20123, 85, to_date('05-02-2021', 'dd-mm-yyyy'), 10325, 1185);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20124, 591, to_date('20-07-2022', 'dd-mm-yyyy'), 10342, 989);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20125, 495, to_date('20-10-2020', 'dd-mm-yyyy'), 10094, 1200);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20126, 336, to_date('23-12-2022', 'dd-mm-yyyy'), 10038, 891);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20127, 88, to_date('23-07-2022', 'dd-mm-yyyy'), 10204, 933);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20128, 511, to_date('09-01-2023', 'dd-mm-yyyy'), 10379, 819);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20129, 855, to_date('02-10-2020', 'dd-mm-yyyy'), 10344, 891);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20130, 229, to_date('03-03-2021', 'dd-mm-yyyy'), 10313, 838);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20131, 185, to_date('15-01-2023', 'dd-mm-yyyy'), 10259, 986);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20132, 290, to_date('08-11-2022', 'dd-mm-yyyy'), 10085, 1031);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20133, 768, to_date('08-04-2020', 'dd-mm-yyyy'), 10314, 966);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20134, 479, to_date('03-07-2022', 'dd-mm-yyyy'), 10267, 1036);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20135, 798, to_date('28-08-2022', 'dd-mm-yyyy'), 10390, 864);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20136, 185, to_date('11-11-2023', 'dd-mm-yyyy'), 10311, 807);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20137, 496, to_date('26-03-2022', 'dd-mm-yyyy'), 10289, 1067);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20138, 328, to_date('13-07-2022', 'dd-mm-yyyy'), 10222, 1006);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20139, 947, to_date('01-07-2021', 'dd-mm-yyyy'), 10084, 821);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20140, 598, to_date('11-10-2022', 'dd-mm-yyyy'), 10165, 1006);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20141, 240, to_date('16-05-2020', 'dd-mm-yyyy'), 10377, 1153);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20142, 8, to_date('03-08-2020', 'dd-mm-yyyy'), 10391, 935);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20143, 938, to_date('14-05-2021', 'dd-mm-yyyy'), 10090, 1018);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20144, 763, to_date('25-12-2020', 'dd-mm-yyyy'), 10286, 934);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20145, 834, to_date('06-01-2021', 'dd-mm-yyyy'), 10184, 1077);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20146, 430, to_date('21-07-2021', 'dd-mm-yyyy'), 10155, 846);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20147, 49, to_date('21-07-2023', 'dd-mm-yyyy'), 10093, 1095);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20148, 436, to_date('13-04-2022', 'dd-mm-yyyy'), 10117, 1125);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20149, 424, to_date('01-11-2020', 'dd-mm-yyyy'), 10092, 964);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20150, 867, to_date('02-08-2021', 'dd-mm-yyyy'), 10137, 976);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20151, 224, to_date('20-07-2022', 'dd-mm-yyyy'), 10387, 952);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20152, 582, to_date('18-08-2022', 'dd-mm-yyyy'), 10379, 913);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20153, 166, to_date('10-08-2020', 'dd-mm-yyyy'), 10130, 1180);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20154, 644, to_date('17-11-2021', 'dd-mm-yyyy'), 10279, 949);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20155, 751, to_date('05-11-2023', 'dd-mm-yyyy'), 10356, 1118);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20156, 58, to_date('24-11-2023', 'dd-mm-yyyy'), 10352, 806);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20157, 908, to_date('12-12-2022', 'dd-mm-yyyy'), 10052, 1112);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20158, 826, to_date('31-05-2022', 'dd-mm-yyyy'), 10314, 952);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20159, 956, to_date('19-08-2021', 'dd-mm-yyyy'), 10143, 1130);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20160, 307, to_date('12-08-2023', 'dd-mm-yyyy'), 10343, 864);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20161, 874, to_date('27-01-2022', 'dd-mm-yyyy'), 10210, 1140);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20162, 904, to_date('14-09-2023', 'dd-mm-yyyy'), 10244, 912);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20163, 887, to_date('02-08-2020', 'dd-mm-yyyy'), 10328, 1106);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20164, 41, to_date('18-09-2020', 'dd-mm-yyyy'), 10165, 1072);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20165, 358, to_date('20-07-2021', 'dd-mm-yyyy'), 10031, 1014);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20166, 483, to_date('20-07-2020', 'dd-mm-yyyy'), 10013, 864);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20167, 4, to_date('07-08-2021', 'dd-mm-yyyy'), 10002, 921);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20168, 933, to_date('20-04-2021', 'dd-mm-yyyy'), 10012, 914);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20169, 411, to_date('16-01-2020', 'dd-mm-yyyy'), 10089, 1028);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20170, 972, to_date('16-10-2023', 'dd-mm-yyyy'), 10381, 937);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20171, 869, to_date('18-07-2023', 'dd-mm-yyyy'), 10043, 982);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20172, 295, to_date('19-05-2020', 'dd-mm-yyyy'), 10133, 952);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20173, 522, to_date('20-01-2021', 'dd-mm-yyyy'), 10183, 1195);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20174, 266, to_date('15-01-2022', 'dd-mm-yyyy'), 10203, 918);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20175, 825, to_date('01-01-2021', 'dd-mm-yyyy'), 10389, 1001);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20176, 780, to_date('17-08-2023', 'dd-mm-yyyy'), 10105, 1196);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20177, 313, to_date('14-09-2022', 'dd-mm-yyyy'), 10212, 823);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20178, 440, to_date('17-06-2023', 'dd-mm-yyyy'), 10101, 1034);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20179, 691, to_date('17-01-2022', 'dd-mm-yyyy'), 10116, 1174);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20180, 54, to_date('11-02-2021', 'dd-mm-yyyy'), 10112, 1082);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20181, 222, to_date('09-06-2023', 'dd-mm-yyyy'), 10245, 886);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20182, 431, to_date('27-06-2021', 'dd-mm-yyyy'), 10139, 1125);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20183, 446, to_date('16-12-2021', 'dd-mm-yyyy'), 10310, 952);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20184, 497, to_date('01-02-2021', 'dd-mm-yyyy'), 10218, 1048);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20185, 193, to_date('24-10-2023', 'dd-mm-yyyy'), 10205, 806);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20186, 728, to_date('07-08-2020', 'dd-mm-yyyy'), 10298, 1019);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20187, 921, to_date('28-12-2020', 'dd-mm-yyyy'), 10145, 1018);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20188, 883, to_date('10-09-2023', 'dd-mm-yyyy'), 10041, 905);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20189, 361, to_date('23-03-2020', 'dd-mm-yyyy'), 10334, 822);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20190, 60, to_date('22-01-2022', 'dd-mm-yyyy'), 10153, 906);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20191, 478, to_date('19-02-2022', 'dd-mm-yyyy'), 10154, 862);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20192, 64, to_date('28-09-2022', 'dd-mm-yyyy'), 10031, 1016);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20193, 742, to_date('06-09-2022', 'dd-mm-yyyy'), 10076, 1168);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20194, 82, to_date('30-08-2021', 'dd-mm-yyyy'), 10146, 913);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20195, 708, to_date('02-11-2020', 'dd-mm-yyyy'), 10307, 1155);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20196, 672, to_date('14-06-2023', 'dd-mm-yyyy'), 10340, 1069);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20197, 918, to_date('09-07-2020', 'dd-mm-yyyy'), 10148, 847);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20198, 65, to_date('28-06-2023', 'dd-mm-yyyy'), 10060, 1084);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20199, 107, to_date('11-10-2022', 'dd-mm-yyyy'), 10088, 926);
commit;
prompt 200 records committed...
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20200, 788, to_date('16-03-2020', 'dd-mm-yyyy'), 10104, 852);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20201, 727, to_date('11-03-2020', 'dd-mm-yyyy'), 10216, 806);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20202, 580, to_date('27-08-2021', 'dd-mm-yyyy'), 10300, 945);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20203, 777, to_date('07-08-2021', 'dd-mm-yyyy'), 10163, 1133);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20204, 643, to_date('18-04-2022', 'dd-mm-yyyy'), 10310, 1028);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20205, 951, to_date('26-12-2022', 'dd-mm-yyyy'), 10168, 1110);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20206, 186, to_date('23-01-2022', 'dd-mm-yyyy'), 10358, 1090);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20207, 98, to_date('05-09-2020', 'dd-mm-yyyy'), 10063, 1044);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20208, 300, to_date('02-09-2023', 'dd-mm-yyyy'), 10278, 1112);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20209, 998, to_date('14-10-2022', 'dd-mm-yyyy'), 10193, 921);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20210, 123, to_date('25-02-2020', 'dd-mm-yyyy'), 10097, 1149);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20211, 432, to_date('10-11-2022', 'dd-mm-yyyy'), 10253, 1006);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20212, 343, to_date('08-09-2020', 'dd-mm-yyyy'), 10132, 1044);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20213, 595, to_date('01-11-2023', 'dd-mm-yyyy'), 10054, 867);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20214, 992, to_date('22-08-2022', 'dd-mm-yyyy'), 10222, 964);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20215, 795, to_date('16-03-2020', 'dd-mm-yyyy'), 10211, 823);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20216, 564, to_date('14-11-2021', 'dd-mm-yyyy'), 10077, 1162);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20217, 477, to_date('19-06-2022', 'dd-mm-yyyy'), 10361, 1021);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20218, 445, to_date('15-04-2021', 'dd-mm-yyyy'), 10356, 965);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20219, 556, to_date('06-10-2023', 'dd-mm-yyyy'), 10100, 933);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20220, 649, to_date('27-08-2021', 'dd-mm-yyyy'), 10071, 983);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20221, 66, to_date('09-11-2020', 'dd-mm-yyyy'), 10249, 878);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20222, 876, to_date('21-08-2022', 'dd-mm-yyyy'), 10313, 947);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20223, 118, to_date('15-04-2021', 'dd-mm-yyyy'), 10044, 1177);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20224, 870, to_date('15-02-2022', 'dd-mm-yyyy'), 10304, 1171);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20225, 169, to_date('17-10-2020', 'dd-mm-yyyy'), 10251, 923);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20226, 103, to_date('07-10-2021', 'dd-mm-yyyy'), 10175, 840);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20227, 609, to_date('06-01-2023', 'dd-mm-yyyy'), 10205, 1181);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20228, 766, to_date('14-10-2022', 'dd-mm-yyyy'), 10070, 1119);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20229, 657, to_date('26-05-2021', 'dd-mm-yyyy'), 10376, 1012);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20230, 63, to_date('14-01-2020', 'dd-mm-yyyy'), 10369, 1090);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20231, 567, to_date('28-05-2023', 'dd-mm-yyyy'), 10056, 1125);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20232, 837, to_date('19-04-2022', 'dd-mm-yyyy'), 10244, 917);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20233, 155, to_date('26-11-2020', 'dd-mm-yyyy'), 10179, 1146);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20234, 489, to_date('05-11-2022', 'dd-mm-yyyy'), 10137, 1028);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20235, 630, to_date('20-11-2022', 'dd-mm-yyyy'), 10055, 922);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20236, 225, to_date('26-03-2020', 'dd-mm-yyyy'), 10156, 932);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20237, 736, to_date('17-05-2022', 'dd-mm-yyyy'), 10040, 1044);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20238, 606, to_date('17-05-2021', 'dd-mm-yyyy'), 10013, 850);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20239, 219, to_date('11-08-2021', 'dd-mm-yyyy'), 10122, 992);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20240, 410, to_date('29-10-2022', 'dd-mm-yyyy'), 10065, 981);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20241, 596, to_date('26-06-2023', 'dd-mm-yyyy'), 10039, 918);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20242, 817, to_date('07-05-2022', 'dd-mm-yyyy'), 10301, 1187);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20243, 234, to_date('16-03-2021', 'dd-mm-yyyy'), 10114, 1036);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20244, 889, to_date('17-09-2020', 'dd-mm-yyyy'), 10036, 1107);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20245, 753, to_date('01-04-2022', 'dd-mm-yyyy'), 10028, 1052);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20246, 385, to_date('05-10-2021', 'dd-mm-yyyy'), 10346, 1088);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20247, 731, to_date('09-07-2022', 'dd-mm-yyyy'), 10299, 812);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20248, 867, to_date('13-09-2022', 'dd-mm-yyyy'), 10014, 1153);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20249, 728, to_date('15-10-2022', 'dd-mm-yyyy'), 10108, 973);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20250, 130, to_date('29-08-2022', 'dd-mm-yyyy'), 10212, 1184);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20251, 618, to_date('16-05-2023', 'dd-mm-yyyy'), 10231, 908);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20252, 945, to_date('02-07-2021', 'dd-mm-yyyy'), 10299, 1137);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20253, 235, to_date('22-01-2021', 'dd-mm-yyyy'), 10306, 1026);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20254, 108, to_date('11-11-2020', 'dd-mm-yyyy'), 10353, 873);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20255, 335, to_date('21-04-2020', 'dd-mm-yyyy'), 10024, 1121);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20256, 808, to_date('26-06-2023', 'dd-mm-yyyy'), 10020, 827);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20257, 867, to_date('19-08-2022', 'dd-mm-yyyy'), 10245, 1150);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20258, 302, to_date('25-09-2022', 'dd-mm-yyyy'), 10093, 1090);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20259, 552, to_date('03-05-2022', 'dd-mm-yyyy'), 10032, 829);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20260, 911, to_date('08-06-2022', 'dd-mm-yyyy'), 10014, 919);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20261, 786, to_date('28-05-2020', 'dd-mm-yyyy'), 10023, 856);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20262, 311, to_date('29-11-2022', 'dd-mm-yyyy'), 10098, 1081);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20263, 845, to_date('14-09-2020', 'dd-mm-yyyy'), 10116, 965);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20264, 165, to_date('18-04-2021', 'dd-mm-yyyy'), 10094, 1007);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20265, 407, to_date('23-05-2020', 'dd-mm-yyyy'), 10287, 1196);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20266, 34, to_date('28-01-2022', 'dd-mm-yyyy'), 10052, 1182);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20267, 389, to_date('15-08-2022', 'dd-mm-yyyy'), 10127, 1196);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20268, 630, to_date('01-12-2021', 'dd-mm-yyyy'), 10331, 1160);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20269, 89, to_date('12-06-2023', 'dd-mm-yyyy'), 10309, 1142);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20270, 360, to_date('11-09-2020', 'dd-mm-yyyy'), 10329, 1192);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20271, 649, to_date('07-01-2021', 'dd-mm-yyyy'), 10376, 1094);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20272, 197, to_date('25-10-2022', 'dd-mm-yyyy'), 10326, 1098);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20273, 821, to_date('06-01-2023', 'dd-mm-yyyy'), 10057, 1162);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20274, 855, to_date('06-10-2020', 'dd-mm-yyyy'), 10073, 1146);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20275, 58, to_date('22-04-2020', 'dd-mm-yyyy'), 10109, 913);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20276, 278, to_date('30-11-2020', 'dd-mm-yyyy'), 10084, 968);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20277, 907, to_date('25-11-2022', 'dd-mm-yyyy'), 10275, 1191);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20278, 447, to_date('29-07-2023', 'dd-mm-yyyy'), 10071, 894);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20279, 716, to_date('10-02-2022', 'dd-mm-yyyy'), 10384, 1165);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20280, 492, to_date('18-04-2021', 'dd-mm-yyyy'), 10090, 916);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20281, 658, to_date('31-12-2022', 'dd-mm-yyyy'), 10156, 1008);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20282, 119, to_date('08-06-2023', 'dd-mm-yyyy'), 10026, 873);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20283, 66, to_date('14-01-2023', 'dd-mm-yyyy'), 10147, 991);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20284, 355, to_date('14-12-2022', 'dd-mm-yyyy'), 10186, 1063);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20285, 77, to_date('20-01-2021', 'dd-mm-yyyy'), 10214, 1012);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20286, 593, to_date('17-06-2021', 'dd-mm-yyyy'), 10234, 881);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20287, 592, to_date('29-05-2020', 'dd-mm-yyyy'), 10303, 942);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20288, 965, to_date('15-07-2020', 'dd-mm-yyyy'), 10040, 1080);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20289, 547, to_date('30-05-2022', 'dd-mm-yyyy'), 10366, 997);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20290, 14, to_date('14-04-2023', 'dd-mm-yyyy'), 10059, 858);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20291, 498, to_date('08-01-2022', 'dd-mm-yyyy'), 10196, 946);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20292, 691, to_date('12-02-2022', 'dd-mm-yyyy'), 10030, 966);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20293, 517, to_date('04-10-2021', 'dd-mm-yyyy'), 10399, 925);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20294, 647, to_date('01-11-2020', 'dd-mm-yyyy'), 10008, 853);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20295, 401, to_date('23-11-2023', 'dd-mm-yyyy'), 10078, 1093);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20296, 859, to_date('30-11-2022', 'dd-mm-yyyy'), 10111, 1018);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20297, 193, to_date('17-11-2020', 'dd-mm-yyyy'), 10051, 902);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20298, 553, to_date('27-01-2022', 'dd-mm-yyyy'), 10204, 1005);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20299, 17, to_date('09-01-2020', 'dd-mm-yyyy'), 10390, 801);
commit;
prompt 300 records committed...
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20300, 442, to_date('24-01-2023', 'dd-mm-yyyy'), 10294, 1008);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20301, 223, to_date('01-06-2022', 'dd-mm-yyyy'), 10284, 1154);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20302, 285, to_date('28-09-2020', 'dd-mm-yyyy'), 10064, 1115);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20303, 848, to_date('14-02-2020', 'dd-mm-yyyy'), 10233, 1195);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20304, 746, to_date('12-05-2021', 'dd-mm-yyyy'), 10320, 961);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20305, 383, to_date('07-08-2023', 'dd-mm-yyyy'), 10158, 1199);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20306, 575, to_date('16-02-2022', 'dd-mm-yyyy'), 10372, 1023);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20307, 866, to_date('19-05-2023', 'dd-mm-yyyy'), 10245, 1083);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20308, 96, to_date('03-01-2021', 'dd-mm-yyyy'), 10135, 1125);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20309, 268, to_date('02-01-2022', 'dd-mm-yyyy'), 10107, 1028);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20310, 14, to_date('15-10-2020', 'dd-mm-yyyy'), 10155, 981);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20311, 209, to_date('15-03-2020', 'dd-mm-yyyy'), 10275, 930);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20312, 526, to_date('16-05-2023', 'dd-mm-yyyy'), 10364, 1149);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20313, 978, to_date('26-04-2021', 'dd-mm-yyyy'), 10013, 1073);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20314, 750, to_date('01-05-2022', 'dd-mm-yyyy'), 10356, 828);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20315, 864, to_date('24-12-2021', 'dd-mm-yyyy'), 10258, 829);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20316, 466, to_date('22-09-2021', 'dd-mm-yyyy'), 10390, 859);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20317, 805, to_date('21-01-2021', 'dd-mm-yyyy'), 10083, 985);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20318, 167, to_date('20-02-2021', 'dd-mm-yyyy'), 10314, 1168);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20319, 347, to_date('25-10-2022', 'dd-mm-yyyy'), 10291, 885);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20320, 427, to_date('02-01-2023', 'dd-mm-yyyy'), 10023, 1028);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20321, 919, to_date('09-05-2022', 'dd-mm-yyyy'), 10124, 811);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20322, 577, to_date('19-02-2022', 'dd-mm-yyyy'), 10232, 942);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20323, 407, to_date('14-04-2021', 'dd-mm-yyyy'), 10307, 1180);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20324, 693, to_date('21-07-2021', 'dd-mm-yyyy'), 10379, 957);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20325, 61, to_date('03-09-2021', 'dd-mm-yyyy'), 10013, 967);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20326, 905, to_date('11-07-2022', 'dd-mm-yyyy'), 10056, 1002);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20327, 698, to_date('12-03-2022', 'dd-mm-yyyy'), 10150, 956);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20328, 4, to_date('16-11-2020', 'dd-mm-yyyy'), 10356, 848);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20329, 225, to_date('01-08-2020', 'dd-mm-yyyy'), 10179, 1012);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20330, 379, to_date('20-07-2021', 'dd-mm-yyyy'), 10353, 892);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20331, 474, to_date('24-04-2022', 'dd-mm-yyyy'), 10052, 984);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20332, 248, to_date('25-05-2023', 'dd-mm-yyyy'), 10305, 975);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20333, 347, to_date('05-07-2023', 'dd-mm-yyyy'), 10075, 824);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20334, 217, to_date('28-03-2022', 'dd-mm-yyyy'), 10379, 815);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20335, 275, to_date('21-02-2020', 'dd-mm-yyyy'), 10303, 1143);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20336, 143, to_date('06-03-2020', 'dd-mm-yyyy'), 10106, 867);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20337, 994, to_date('15-06-2023', 'dd-mm-yyyy'), 10251, 977);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20338, 312, to_date('23-02-2021', 'dd-mm-yyyy'), 10158, 814);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20339, 617, to_date('23-08-2021', 'dd-mm-yyyy'), 10133, 1193);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20340, 930, to_date('18-09-2020', 'dd-mm-yyyy'), 10047, 874);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20341, 47, to_date('14-10-2023', 'dd-mm-yyyy'), 10031, 1111);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20342, 922, to_date('17-02-2022', 'dd-mm-yyyy'), 10158, 1143);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20343, 674, to_date('06-01-2022', 'dd-mm-yyyy'), 10181, 1153);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20344, 54, to_date('25-08-2022', 'dd-mm-yyyy'), 10095, 950);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20345, 398, to_date('18-12-2023', 'dd-mm-yyyy'), 10389, 1114);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20346, 357, to_date('25-01-2022', 'dd-mm-yyyy'), 10164, 1047);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20347, 970, to_date('03-06-2023', 'dd-mm-yyyy'), 10173, 869);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20348, 863, to_date('16-07-2021', 'dd-mm-yyyy'), 10371, 1021);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20349, 627, to_date('16-04-2021', 'dd-mm-yyyy'), 10023, 1090);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20350, 666, to_date('16-08-2020', 'dd-mm-yyyy'), 10153, 1130);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20351, 63, to_date('29-09-2020', 'dd-mm-yyyy'), 10196, 1199);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20352, 280, to_date('07-08-2020', 'dd-mm-yyyy'), 10027, 966);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20353, 695, to_date('03-09-2020', 'dd-mm-yyyy'), 10228, 939);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20354, 323, to_date('03-01-2022', 'dd-mm-yyyy'), 10370, 938);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20355, 241, to_date('09-05-2023', 'dd-mm-yyyy'), 10374, 1178);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20356, 503, to_date('16-06-2020', 'dd-mm-yyyy'), 10120, 989);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20357, 629, to_date('15-05-2020', 'dd-mm-yyyy'), 10175, 1129);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20358, 922, to_date('12-09-2020', 'dd-mm-yyyy'), 10204, 927);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20359, 195, to_date('26-10-2020', 'dd-mm-yyyy'), 10143, 801);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20360, 688, to_date('25-11-2020', 'dd-mm-yyyy'), 10088, 1193);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20361, 212, to_date('21-09-2021', 'dd-mm-yyyy'), 10181, 1072);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20362, 850, to_date('24-03-2023', 'dd-mm-yyyy'), 10258, 841);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20363, 720, to_date('15-09-2020', 'dd-mm-yyyy'), 10322, 992);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20364, 633, to_date('16-08-2022', 'dd-mm-yyyy'), 10222, 1157);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20365, 672, to_date('08-12-2022', 'dd-mm-yyyy'), 10191, 1101);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20366, 992, to_date('23-11-2021', 'dd-mm-yyyy'), 10032, 889);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20367, 395, to_date('16-04-2022', 'dd-mm-yyyy'), 10396, 1184);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20368, 474, to_date('26-12-2020', 'dd-mm-yyyy'), 10144, 1112);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20369, 362, to_date('18-10-2020', 'dd-mm-yyyy'), 10245, 841);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20370, 403, to_date('20-07-2020', 'dd-mm-yyyy'), 10389, 915);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20371, 273, to_date('26-04-2022', 'dd-mm-yyyy'), 10182, 890);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20372, 363, to_date('02-10-2023', 'dd-mm-yyyy'), 10081, 1112);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20373, 456, to_date('15-06-2020', 'dd-mm-yyyy'), 10158, 1188);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20374, 6, to_date('26-04-2020', 'dd-mm-yyyy'), 10039, 1179);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20375, 569, to_date('05-10-2020', 'dd-mm-yyyy'), 10312, 881);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20376, 163, to_date('06-11-2020', 'dd-mm-yyyy'), 10142, 1014);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20377, 631, to_date('24-02-2021', 'dd-mm-yyyy'), 10394, 1080);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20378, 276, to_date('13-05-2021', 'dd-mm-yyyy'), 10007, 1126);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20379, 346, to_date('29-07-2022', 'dd-mm-yyyy'), 10301, 1158);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20380, 132, to_date('11-02-2022', 'dd-mm-yyyy'), 10389, 846);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20381, 757, to_date('20-12-2021', 'dd-mm-yyyy'), 10142, 1075);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20382, 925, to_date('20-08-2020', 'dd-mm-yyyy'), 10110, 965);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20383, 201, to_date('02-06-2023', 'dd-mm-yyyy'), 10229, 929);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20384, 610, to_date('18-01-2023', 'dd-mm-yyyy'), 10113, 1192);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20385, 584, to_date('06-08-2023', 'dd-mm-yyyy'), 10189, 927);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20386, 592, to_date('13-08-2021', 'dd-mm-yyyy'), 10235, 844);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20387, 960, to_date('09-06-2023', 'dd-mm-yyyy'), 10008, 986);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20388, 708, to_date('22-07-2022', 'dd-mm-yyyy'), 10313, 1158);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20389, 430, to_date('25-01-2022', 'dd-mm-yyyy'), 10194, 1157);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20390, 532, to_date('29-01-2020', 'dd-mm-yyyy'), 10009, 823);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20391, 354, to_date('29-12-2020', 'dd-mm-yyyy'), 10265, 874);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20392, 994, to_date('14-09-2020', 'dd-mm-yyyy'), 10166, 1150);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20393, 867, to_date('08-07-2022', 'dd-mm-yyyy'), 10367, 1030);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20394, 301, to_date('27-10-2021', 'dd-mm-yyyy'), 10079, 849);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20395, 717, to_date('04-06-2022', 'dd-mm-yyyy'), 10011, 872);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20396, 183, to_date('22-06-2020', 'dd-mm-yyyy'), 10305, 851);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20397, 409, to_date('01-12-2020', 'dd-mm-yyyy'), 10341, 931);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20398, 444, to_date('08-06-2020', 'dd-mm-yyyy'), 10183, 1134);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20399, 666, to_date('16-10-2023', 'dd-mm-yyyy'), 10320, 1165);
commit;
prompt 400 records loaded
prompt Loading SALES...
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100000, to_date('19-04-2023', 'dd-mm-yyyy'), 1885, 394, 586);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100001, to_date('29-06-2020', 'dd-mm-yyyy'), 4240, 74, 705);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100002, to_date('08-04-2020', 'dd-mm-yyyy'), 1564, 319, 462);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100003, to_date('10-01-2020', 'dd-mm-yyyy'), 2755, 394, 584);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100004, to_date('20-12-2020', 'dd-mm-yyyy'), 4201, 282, 424);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100005, to_date('18-12-2021', 'dd-mm-yyyy'), 2544, 42, 407);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100006, to_date('04-08-2021', 'dd-mm-yyyy'), 1060, 143, 567);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100007, to_date('10-10-2020', 'dd-mm-yyyy'), 4506, 376, 769);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100008, to_date('29-08-2021', 'dd-mm-yyyy'), 477, 155, 711);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100009, to_date('18-05-2023', 'dd-mm-yyyy'), 1445, 338, 694);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100010, to_date('15-06-2020', 'dd-mm-yyyy'), 3273, 382, 667);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100011, to_date('14-07-2022', 'dd-mm-yyyy'), 1766, 345, 717);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100012, to_date('10-01-2023', 'dd-mm-yyyy'), 404, 162, 732);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100013, to_date('06-07-2021', 'dd-mm-yyyy'), 3578, 312, 589);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100014, to_date('15-06-2021', 'dd-mm-yyyy'), 870, 89, 406);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100015, to_date('24-12-2021', 'dd-mm-yyyy'), 4039, 202, 407);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100016, to_date('26-05-2023', 'dd-mm-yyyy'), 43, 120, 534);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100017, to_date('23-02-2023', 'dd-mm-yyyy'), 4024, 287, 769);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100018, to_date('06-11-2023', 'dd-mm-yyyy'), 3211, 210, 477);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100019, to_date('02-03-2020', 'dd-mm-yyyy'), 3130, 357, 757);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100020, to_date('28-02-2020', 'dd-mm-yyyy'), 4508, 271, 699);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100021, to_date('16-10-2021', 'dd-mm-yyyy'), 4962, 230, 538);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100022, to_date('29-04-2022', 'dd-mm-yyyy'), 1101, 255, 794);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100023, to_date('05-04-2023', 'dd-mm-yyyy'), 2781, 4, 601);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100024, to_date('30-06-2022', 'dd-mm-yyyy'), 2694, 360, 519);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100025, to_date('13-06-2022', 'dd-mm-yyyy'), 388, 28, 406);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100026, to_date('02-10-2023', 'dd-mm-yyyy'), 1416, 170, 669);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100027, to_date('12-04-2023', 'dd-mm-yyyy'), 3386, 195, 467);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100028, to_date('20-02-2020', 'dd-mm-yyyy'), 1910, 308, 568);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100029, to_date('10-05-2022', 'dd-mm-yyyy'), 759, 165, 659);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100030, to_date('02-12-2023', 'dd-mm-yyyy'), 1832, 221, 586);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100031, to_date('12-11-2022', 'dd-mm-yyyy'), 1677, 113, 745);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100032, to_date('13-02-2020', 'dd-mm-yyyy'), 2601, 88, 484);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100033, to_date('26-09-2023', 'dd-mm-yyyy'), 2731, 396, 737);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100034, to_date('15-04-2020', 'dd-mm-yyyy'), 500, 58, 777);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100035, to_date('09-01-2020', 'dd-mm-yyyy'), 398, 152, 670);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100036, to_date('11-07-2023', 'dd-mm-yyyy'), 3040, 2, 735);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100037, to_date('23-07-2022', 'dd-mm-yyyy'), 3825, 20, 610);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100038, to_date('02-10-2020', 'dd-mm-yyyy'), 722, 200, 595);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100039, to_date('11-11-2020', 'dd-mm-yyyy'), 2998, 187, 489);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100040, to_date('30-03-2022', 'dd-mm-yyyy'), 3994, 150, 404);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100041, to_date('11-04-2021', 'dd-mm-yyyy'), 2112, 158, 551);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100042, to_date('20-05-2020', 'dd-mm-yyyy'), 658, 301, 691);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100043, to_date('14-05-2020', 'dd-mm-yyyy'), 3339, 253, 443);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100044, to_date('17-09-2023', 'dd-mm-yyyy'), 3432, 313, 555);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100045, to_date('31-07-2021', 'dd-mm-yyyy'), 892, 28, 511);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100046, to_date('04-03-2022', 'dd-mm-yyyy'), 2996, 235, 787);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100047, to_date('16-02-2023', 'dd-mm-yyyy'), 357, 18, 537);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100048, to_date('31-08-2023', 'dd-mm-yyyy'), 1199, 221, 412);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100049, to_date('23-02-2021', 'dd-mm-yyyy'), 3395, 15, 694);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100050, to_date('15-10-2021', 'dd-mm-yyyy'), 4658, 359, 655);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100051, to_date('06-02-2020', 'dd-mm-yyyy'), 2742, 257, 720);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100052, to_date('21-11-2022', 'dd-mm-yyyy'), 3692, 233, 735);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100053, to_date('27-05-2022', 'dd-mm-yyyy'), 2479, 353, 533);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100054, to_date('28-04-2020', 'dd-mm-yyyy'), 1478, 201, 686);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100055, to_date('07-05-2021', 'dd-mm-yyyy'), 3669, 329, 653);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100056, to_date('24-12-2023', 'dd-mm-yyyy'), 3592, 9, 794);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100057, to_date('31-03-2021', 'dd-mm-yyyy'), 292, 196, 465);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100058, to_date('19-01-2021', 'dd-mm-yyyy'), 2867, 323, 471);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100059, to_date('23-10-2020', 'dd-mm-yyyy'), 450, 50, 691);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100060, to_date('27-01-2020', 'dd-mm-yyyy'), 4500, 386, 544);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100061, to_date('29-10-2023', 'dd-mm-yyyy'), 2961, 292, 505);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100062, to_date('03-03-2022', 'dd-mm-yyyy'), 1549, 204, 572);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100063, to_date('10-01-2021', 'dd-mm-yyyy'), 4208, 372, 455);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100064, to_date('10-08-2023', 'dd-mm-yyyy'), 664, 53, 796);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100065, to_date('10-04-2023', 'dd-mm-yyyy'), 319, 62, 422);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100066, to_date('19-07-2021', 'dd-mm-yyyy'), 3201, 113, 699);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100067, to_date('29-11-2021', 'dd-mm-yyyy'), 4622, 53, 604);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100068, to_date('29-01-2023', 'dd-mm-yyyy'), 1624, 226, 601);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100069, to_date('16-06-2020', 'dd-mm-yyyy'), 532, 272, 714);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100070, to_date('26-06-2021', 'dd-mm-yyyy'), 1181, 181, 682);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100071, to_date('24-06-2021', 'dd-mm-yyyy'), 4556, 333, 616);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100072, to_date('10-10-2023', 'dd-mm-yyyy'), 1950, 123, 618);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100073, to_date('28-09-2020', 'dd-mm-yyyy'), 4829, 107, 780);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100074, to_date('15-06-2021', 'dd-mm-yyyy'), 1175, 282, 652);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100075, to_date('14-08-2020', 'dd-mm-yyyy'), 4776, 14, 560);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100076, to_date('17-07-2020', 'dd-mm-yyyy'), 895, 39, 488);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100077, to_date('22-09-2022', 'dd-mm-yyyy'), 2202, 250, 700);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100078, to_date('09-11-2022', 'dd-mm-yyyy'), 918, 302, 408);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100079, to_date('30-10-2023', 'dd-mm-yyyy'), 3632, 129, 468);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100080, to_date('10-07-2022', 'dd-mm-yyyy'), 2086, 20, 615);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100081, to_date('28-12-2022', 'dd-mm-yyyy'), 4026, 354, 607);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100082, to_date('06-10-2021', 'dd-mm-yyyy'), 4859, 16, 800);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100083, to_date('20-12-2023', 'dd-mm-yyyy'), 1742, 218, 518);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100084, to_date('29-11-2021', 'dd-mm-yyyy'), 3227, 141, 737);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100085, to_date('11-11-2020', 'dd-mm-yyyy'), 3826, 117, 463);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100086, to_date('07-09-2021', 'dd-mm-yyyy'), 3881, 165, 699);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100087, to_date('06-01-2023', 'dd-mm-yyyy'), 1678, 205, 799);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100088, to_date('15-09-2022', 'dd-mm-yyyy'), 780, 377, 501);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100089, to_date('26-02-2023', 'dd-mm-yyyy'), 1915, 359, 631);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100090, to_date('15-04-2022', 'dd-mm-yyyy'), 4935, 328, 771);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100091, to_date('21-10-2020', 'dd-mm-yyyy'), 2663, 275, 694);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100092, to_date('12-06-2021', 'dd-mm-yyyy'), 4623, 82, 440);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100093, to_date('01-12-2020', 'dd-mm-yyyy'), 92, 94, 455);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100094, to_date('07-03-2020', 'dd-mm-yyyy'), 787, 1, 459);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100095, to_date('16-10-2023', 'dd-mm-yyyy'), 262, 342, 650);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100096, to_date('27-12-2023', 'dd-mm-yyyy'), 2807, 258, 545);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100097, to_date('12-03-2022', 'dd-mm-yyyy'), 1332, 8, 433);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100098, to_date('22-08-2021', 'dd-mm-yyyy'), 4637, 67, 549);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100099, to_date('14-10-2021', 'dd-mm-yyyy'), 1038, 331, 758);
commit;
prompt 100 records committed...
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100100, to_date('21-03-2022', 'dd-mm-yyyy'), 1165, 239, 444);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100101, to_date('02-10-2020', 'dd-mm-yyyy'), 4481, 332, 789);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100102, to_date('16-05-2023', 'dd-mm-yyyy'), 4893, 273, 551);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100103, to_date('19-09-2020', 'dd-mm-yyyy'), 2281, 49, 523);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100104, to_date('05-11-2022', 'dd-mm-yyyy'), 3040, 358, 773);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100105, to_date('13-11-2020', 'dd-mm-yyyy'), 3944, 318, 452);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100106, to_date('03-04-2021', 'dd-mm-yyyy'), 4784, 309, 471);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100107, to_date('19-05-2023', 'dd-mm-yyyy'), 1672, 262, 640);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100108, to_date('11-02-2020', 'dd-mm-yyyy'), 3982, 225, 553);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100109, to_date('16-01-2022', 'dd-mm-yyyy'), 4348, 115, 430);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100110, to_date('04-02-2023', 'dd-mm-yyyy'), 2085, 75, 591);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100111, to_date('05-03-2022', 'dd-mm-yyyy'), 1971, 167, 772);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100112, to_date('27-07-2020', 'dd-mm-yyyy'), 1419, 203, 565);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100113, to_date('07-10-2023', 'dd-mm-yyyy'), 265, 239, 783);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100114, to_date('16-05-2021', 'dd-mm-yyyy'), 3777, 364, 435);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100115, to_date('15-11-2023', 'dd-mm-yyyy'), 713, 73, 522);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100116, to_date('28-10-2023', 'dd-mm-yyyy'), 4322, 81, 726);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100117, to_date('09-04-2022', 'dd-mm-yyyy'), 854, 257, 401);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100118, to_date('31-12-2021', 'dd-mm-yyyy'), 783, 331, 553);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100119, to_date('08-05-2022', 'dd-mm-yyyy'), 4878, 69, 410);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100120, to_date('08-04-2023', 'dd-mm-yyyy'), 2954, 150, 661);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100121, to_date('10-04-2023', 'dd-mm-yyyy'), 4595, 252, 777);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100122, to_date('19-01-2021', 'dd-mm-yyyy'), 2589, 172, 692);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100123, to_date('10-05-2023', 'dd-mm-yyyy'), 628, 304, 445);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100124, to_date('10-11-2022', 'dd-mm-yyyy'), 3490, 280, 680);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100125, to_date('25-09-2022', 'dd-mm-yyyy'), 3969, 304, 582);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100126, to_date('19-07-2021', 'dd-mm-yyyy'), 2000, 196, 768);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100127, to_date('31-03-2021', 'dd-mm-yyyy'), 2903, 58, 705);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100128, to_date('07-11-2021', 'dd-mm-yyyy'), 2752, 189, 753);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100129, to_date('06-08-2023', 'dd-mm-yyyy'), 117, 366, 641);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100130, to_date('01-03-2022', 'dd-mm-yyyy'), 4769, 304, 649);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100131, to_date('28-09-2023', 'dd-mm-yyyy'), 215, 22, 706);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100132, to_date('19-07-2023', 'dd-mm-yyyy'), 2869, 126, 686);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100133, to_date('17-07-2020', 'dd-mm-yyyy'), 2531, 134, 508);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100134, to_date('05-01-2022', 'dd-mm-yyyy'), 4334, 260, 722);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100135, to_date('03-09-2020', 'dd-mm-yyyy'), 4242, 169, 781);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100136, to_date('19-01-2020', 'dd-mm-yyyy'), 986, 340, 692);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100137, to_date('01-10-2020', 'dd-mm-yyyy'), 3784, 126, 639);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100138, to_date('20-05-2021', 'dd-mm-yyyy'), 1465, 365, 472);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100139, to_date('29-09-2020', 'dd-mm-yyyy'), 4594, 30, 656);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100140, to_date('05-01-2021', 'dd-mm-yyyy'), 3921, 156, 772);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100141, to_date('16-08-2020', 'dd-mm-yyyy'), 4174, 355, 571);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100142, to_date('27-06-2022', 'dd-mm-yyyy'), 3960, 139, 657);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100143, to_date('06-04-2020', 'dd-mm-yyyy'), 3444, 169, 420);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100144, to_date('27-05-2022', 'dd-mm-yyyy'), 2901, 253, 485);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100145, to_date('27-07-2022', 'dd-mm-yyyy'), 1430, 205, 691);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100146, to_date('17-03-2022', 'dd-mm-yyyy'), 1371, 187, 681);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100147, to_date('26-11-2023', 'dd-mm-yyyy'), 242, 58, 705);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100148, to_date('20-03-2023', 'dd-mm-yyyy'), 3195, 136, 725);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100149, to_date('18-09-2023', 'dd-mm-yyyy'), 385, 306, 419);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100150, to_date('11-11-2020', 'dd-mm-yyyy'), 4623, 83, 772);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100151, to_date('13-06-2021', 'dd-mm-yyyy'), 1379, 354, 458);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100152, to_date('06-04-2022', 'dd-mm-yyyy'), 3837, 12, 695);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100153, to_date('09-09-2020', 'dd-mm-yyyy'), 2677, 8, 774);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100154, to_date('11-12-2022', 'dd-mm-yyyy'), 783, 237, 553);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100155, to_date('22-07-2020', 'dd-mm-yyyy'), 4910, 370, 718);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100156, to_date('26-11-2022', 'dd-mm-yyyy'), 2308, 264, 484);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100157, to_date('11-05-2022', 'dd-mm-yyyy'), 1449, 58, 556);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100158, to_date('10-11-2021', 'dd-mm-yyyy'), 2656, 174, 422);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100159, to_date('28-06-2023', 'dd-mm-yyyy'), 237, 354, 789);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100160, to_date('17-10-2021', 'dd-mm-yyyy'), 4202, 130, 441);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100161, to_date('28-07-2022', 'dd-mm-yyyy'), 1002, 72, 518);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100162, to_date('15-09-2020', 'dd-mm-yyyy'), 3559, 10, 522);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100163, to_date('14-11-2023', 'dd-mm-yyyy'), 2737, 160, 417);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100164, to_date('26-08-2021', 'dd-mm-yyyy'), 2955, 371, 547);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100165, to_date('01-12-2020', 'dd-mm-yyyy'), 1507, 14, 742);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100166, to_date('31-12-2020', 'dd-mm-yyyy'), 1958, 325, 518);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100167, to_date('10-06-2023', 'dd-mm-yyyy'), 3538, 328, 763);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100168, to_date('24-12-2023', 'dd-mm-yyyy'), 4484, 352, 597);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100169, to_date('24-06-2023', 'dd-mm-yyyy'), 3686, 65, 414);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100170, to_date('07-06-2023', 'dd-mm-yyyy'), 1161, 36, 575);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100171, to_date('21-10-2020', 'dd-mm-yyyy'), 4144, 353, 579);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100172, to_date('04-11-2021', 'dd-mm-yyyy'), 1920, 316, 768);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100173, to_date('27-07-2023', 'dd-mm-yyyy'), 3511, 106, 795);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100174, to_date('15-08-2020', 'dd-mm-yyyy'), 4010, 277, 729);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100175, to_date('08-03-2020', 'dd-mm-yyyy'), 1152, 167, 784);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100176, to_date('09-08-2020', 'dd-mm-yyyy'), 255, 55, 596);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100177, to_date('29-06-2022', 'dd-mm-yyyy'), 1868, 385, 605);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100178, to_date('11-11-2021', 'dd-mm-yyyy'), 2594, 272, 661);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100179, to_date('25-02-2020', 'dd-mm-yyyy'), 912, 7, 638);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100180, to_date('06-09-2022', 'dd-mm-yyyy'), 1054, 391, 755);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100181, to_date('17-04-2022', 'dd-mm-yyyy'), 4253, 199, 588);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100182, to_date('15-11-2021', 'dd-mm-yyyy'), 2885, 7, 677);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100183, to_date('29-05-2022', 'dd-mm-yyyy'), 4241, 294, 716);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100184, to_date('12-04-2020', 'dd-mm-yyyy'), 2142, 246, 426);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100185, to_date('03-07-2022', 'dd-mm-yyyy'), 490, 163, 494);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100186, to_date('20-07-2021', 'dd-mm-yyyy'), 4466, 109, 679);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100187, to_date('02-07-2020', 'dd-mm-yyyy'), 1122, 309, 684);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100188, to_date('02-03-2020', 'dd-mm-yyyy'), 2286, 120, 676);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100189, to_date('21-11-2020', 'dd-mm-yyyy'), 4348, 90, 449);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100190, to_date('18-09-2020', 'dd-mm-yyyy'), 220, 119, 742);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100191, to_date('11-08-2020', 'dd-mm-yyyy'), 336, 63, 676);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100192, to_date('30-05-2020', 'dd-mm-yyyy'), 881, 365, 630);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100193, to_date('20-03-2022', 'dd-mm-yyyy'), 3323, 61, 736);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100194, to_date('13-11-2022', 'dd-mm-yyyy'), 967, 369, 488);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100195, to_date('07-04-2022', 'dd-mm-yyyy'), 4198, 179, 665);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100196, to_date('16-02-2023', 'dd-mm-yyyy'), 2632, 258, 451);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100197, to_date('22-12-2022', 'dd-mm-yyyy'), 3240, 304, 765);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100198, to_date('06-12-2023', 'dd-mm-yyyy'), 224, 253, 462);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100199, to_date('10-02-2023', 'dd-mm-yyyy'), 3250, 159, 639);
commit;
prompt 200 records committed...
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100200, to_date('26-03-2023', 'dd-mm-yyyy'), 2264, 280, 710);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100201, to_date('24-02-2020', 'dd-mm-yyyy'), 2988, 270, 447);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100202, to_date('30-12-2020', 'dd-mm-yyyy'), 3832, 105, 703);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100203, to_date('29-08-2023', 'dd-mm-yyyy'), 907, 266, 781);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100204, to_date('12-03-2021', 'dd-mm-yyyy'), 4179, 389, 561);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100205, to_date('18-12-2023', 'dd-mm-yyyy'), 4192, 101, 776);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100206, to_date('04-02-2021', 'dd-mm-yyyy'), 4692, 275, 528);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100207, to_date('12-01-2020', 'dd-mm-yyyy'), 3165, 197, 437);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100208, to_date('13-10-2023', 'dd-mm-yyyy'), 2176, 294, 720);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100209, to_date('18-08-2022', 'dd-mm-yyyy'), 916, 115, 796);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100210, to_date('05-12-2021', 'dd-mm-yyyy'), 2416, 201, 695);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100211, to_date('18-09-2020', 'dd-mm-yyyy'), 3309, 154, 693);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100212, to_date('25-10-2020', 'dd-mm-yyyy'), 4099, 131, 439);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100213, to_date('05-02-2023', 'dd-mm-yyyy'), 4309, 271, 581);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100214, to_date('13-08-2020', 'dd-mm-yyyy'), 3017, 285, 789);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100215, to_date('25-04-2023', 'dd-mm-yyyy'), 1572, 325, 555);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100216, to_date('30-11-2021', 'dd-mm-yyyy'), 1572, 339, 476);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100217, to_date('20-10-2023', 'dd-mm-yyyy'), 2362, 51, 608);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100218, to_date('20-06-2022', 'dd-mm-yyyy'), 3620, 172, 590);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100219, to_date('15-04-2023', 'dd-mm-yyyy'), 4822, 355, 716);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100220, to_date('01-04-2021', 'dd-mm-yyyy'), 4632, 332, 476);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100221, to_date('04-06-2023', 'dd-mm-yyyy'), 4517, 333, 734);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100222, to_date('16-09-2021', 'dd-mm-yyyy'), 2138, 216, 650);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100223, to_date('16-09-2022', 'dd-mm-yyyy'), 1289, 22, 537);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100224, to_date('18-04-2022', 'dd-mm-yyyy'), 1484, 378, 744);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100225, to_date('15-08-2021', 'dd-mm-yyyy'), 1427, 65, 767);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100226, to_date('28-03-2022', 'dd-mm-yyyy'), 1945, 165, 471);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100227, to_date('08-01-2023', 'dd-mm-yyyy'), 191, 313, 620);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100228, to_date('27-07-2022', 'dd-mm-yyyy'), 3109, 271, 420);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100229, to_date('20-10-2023', 'dd-mm-yyyy'), 4572, 141, 646);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100230, to_date('23-05-2022', 'dd-mm-yyyy'), 1587, 228, 674);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100231, to_date('11-10-2021', 'dd-mm-yyyy'), 1466, 97, 583);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100232, to_date('26-05-2022', 'dd-mm-yyyy'), 3023, 8, 452);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100233, to_date('07-11-2021', 'dd-mm-yyyy'), 1026, 74, 612);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100234, to_date('01-09-2023', 'dd-mm-yyyy'), 4449, 157, 778);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100235, to_date('24-05-2021', 'dd-mm-yyyy'), 460, 3, 434);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100236, to_date('29-08-2021', 'dd-mm-yyyy'), 1925, 60, 574);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100237, to_date('27-11-2022', 'dd-mm-yyyy'), 3058, 276, 583);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100238, to_date('03-07-2023', 'dd-mm-yyyy'), 3470, 316, 576);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100239, to_date('25-11-2021', 'dd-mm-yyyy'), 2581, 292, 749);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100240, to_date('09-07-2020', 'dd-mm-yyyy'), 2387, 53, 679);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100241, to_date('28-01-2022', 'dd-mm-yyyy'), 2902, 328, 735);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100242, to_date('01-01-2020', 'dd-mm-yyyy'), 798, 359, 706);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100243, to_date('09-09-2021', 'dd-mm-yyyy'), 3026, 334, 442);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100244, to_date('19-03-2020', 'dd-mm-yyyy'), 3556, 239, 597);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100245, to_date('22-03-2023', 'dd-mm-yyyy'), 2385, 55, 469);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100246, to_date('10-09-2020', 'dd-mm-yyyy'), 2483, 304, 431);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100247, to_date('07-04-2022', 'dd-mm-yyyy'), 1445, 80, 546);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100248, to_date('06-10-2023', 'dd-mm-yyyy'), 842, 173, 665);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100249, to_date('07-09-2023', 'dd-mm-yyyy'), 2639, 206, 590);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100250, to_date('17-04-2023', 'dd-mm-yyyy'), 3195, 10, 608);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100251, to_date('31-12-2020', 'dd-mm-yyyy'), 1621, 342, 784);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100252, to_date('28-09-2020', 'dd-mm-yyyy'), 575, 183, 707);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100253, to_date('18-01-2023', 'dd-mm-yyyy'), 3788, 323, 683);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100254, to_date('05-06-2020', 'dd-mm-yyyy'), 886, 248, 669);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100255, to_date('15-11-2023', 'dd-mm-yyyy'), 1186, 263, 544);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100256, to_date('14-01-2020', 'dd-mm-yyyy'), 4724, 54, 604);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100257, to_date('18-11-2023', 'dd-mm-yyyy'), 4633, 220, 483);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100258, to_date('30-05-2020', 'dd-mm-yyyy'), 1464, 181, 791);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100259, to_date('26-03-2022', 'dd-mm-yyyy'), 1283, 396, 656);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100260, to_date('28-07-2022', 'dd-mm-yyyy'), 602, 96, 474);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100261, to_date('29-06-2020', 'dd-mm-yyyy'), 2344, 257, 459);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100262, to_date('24-12-2023', 'dd-mm-yyyy'), 3514, 36, 476);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100263, to_date('15-07-2021', 'dd-mm-yyyy'), 1268, 177, 766);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100264, to_date('28-01-2022', 'dd-mm-yyyy'), 482, 219, 445);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100265, to_date('08-09-2023', 'dd-mm-yyyy'), 2128, 13, 779);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100266, to_date('15-01-2021', 'dd-mm-yyyy'), 2973, 177, 721);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100267, to_date('09-02-2022', 'dd-mm-yyyy'), 3387, 199, 711);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100268, to_date('30-10-2021', 'dd-mm-yyyy'), 1357, 213, 428);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100269, to_date('27-06-2021', 'dd-mm-yyyy'), 1943, 165, 690);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100270, to_date('09-06-2023', 'dd-mm-yyyy'), 2802, 185, 595);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100271, to_date('20-11-2023', 'dd-mm-yyyy'), 2481, 88, 693);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100272, to_date('02-06-2023', 'dd-mm-yyyy'), 4591, 18, 695);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100273, to_date('04-12-2023', 'dd-mm-yyyy'), 2171, 359, 696);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100274, to_date('03-09-2021', 'dd-mm-yyyy'), 2691, 330, 616);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100275, to_date('01-03-2023', 'dd-mm-yyyy'), 649, 380, 657);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100276, to_date('20-06-2023', 'dd-mm-yyyy'), 636, 1, 453);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100277, to_date('05-10-2023', 'dd-mm-yyyy'), 313, 287, 725);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100278, to_date('11-09-2021', 'dd-mm-yyyy'), 3740, 247, 524);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100279, to_date('10-05-2021', 'dd-mm-yyyy'), 1947, 393, 463);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100280, to_date('01-06-2022', 'dd-mm-yyyy'), 3655, 33, 418);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100281, to_date('29-03-2021', 'dd-mm-yyyy'), 658, 362, 711);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100282, to_date('13-08-2021', 'dd-mm-yyyy'), 3153, 7, 656);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100283, to_date('27-09-2021', 'dd-mm-yyyy'), 2087, 104, 461);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100284, to_date('29-03-2021', 'dd-mm-yyyy'), 1303, 159, 590);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100285, to_date('10-11-2020', 'dd-mm-yyyy'), 3993, 394, 766);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100286, to_date('21-06-2020', 'dd-mm-yyyy'), 3911, 1, 519);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100287, to_date('14-03-2022', 'dd-mm-yyyy'), 3107, 22, 468);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100288, to_date('27-03-2022', 'dd-mm-yyyy'), 4323, 78, 431);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100289, to_date('03-02-2020', 'dd-mm-yyyy'), 2296, 261, 556);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100290, to_date('26-12-2022', 'dd-mm-yyyy'), 4475, 4, 572);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100291, to_date('29-12-2023', 'dd-mm-yyyy'), 3069, 264, 743);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100292, to_date('22-09-2021', 'dd-mm-yyyy'), 1312, 216, 637);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100293, to_date('24-02-2022', 'dd-mm-yyyy'), 3382, 188, 675);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100294, to_date('16-04-2020', 'dd-mm-yyyy'), 3469, 259, 791);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100295, to_date('25-06-2020', 'dd-mm-yyyy'), 745, 33, 559);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100296, to_date('08-11-2022', 'dd-mm-yyyy'), 3337, 399, 511);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100297, to_date('27-09-2020', 'dd-mm-yyyy'), 641, 221, 421);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100298, to_date('17-09-2022', 'dd-mm-yyyy'), 4355, 148, 454);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100299, to_date('24-11-2021', 'dd-mm-yyyy'), 291, 287, 782);
commit;
prompt 300 records committed...
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100300, to_date('21-04-2020', 'dd-mm-yyyy'), 3684, 132, 546);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100301, to_date('20-10-2020', 'dd-mm-yyyy'), 2679, 102, 769);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100302, to_date('27-06-2020', 'dd-mm-yyyy'), 152, 67, 707);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100303, to_date('30-01-2020', 'dd-mm-yyyy'), 954, 18, 441);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100304, to_date('23-01-2021', 'dd-mm-yyyy'), 2511, 71, 590);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100305, to_date('09-04-2023', 'dd-mm-yyyy'), 3053, 342, 549);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100306, to_date('16-07-2020', 'dd-mm-yyyy'), 3067, 100, 747);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100307, to_date('26-03-2021', 'dd-mm-yyyy'), 1754, 128, 510);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100308, to_date('04-03-2021', 'dd-mm-yyyy'), 1536, 300, 428);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100309, to_date('21-10-2021', 'dd-mm-yyyy'), 4917, 100, 619);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100310, to_date('20-03-2023', 'dd-mm-yyyy'), 4254, 298, 791);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100311, to_date('05-09-2022', 'dd-mm-yyyy'), 1168, 100, 476);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100312, to_date('20-06-2022', 'dd-mm-yyyy'), 3734, 203, 754);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100313, to_date('27-07-2023', 'dd-mm-yyyy'), 748, 255, 442);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100314, to_date('11-01-2023', 'dd-mm-yyyy'), 3455, 149, 654);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100315, to_date('06-08-2021', 'dd-mm-yyyy'), 1814, 276, 519);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100316, to_date('04-05-2021', 'dd-mm-yyyy'), 3036, 343, 548);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100317, to_date('14-12-2021', 'dd-mm-yyyy'), 1975, 80, 657);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100318, to_date('07-06-2021', 'dd-mm-yyyy'), 3687, 57, 724);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100319, to_date('14-10-2023', 'dd-mm-yyyy'), 150, 132, 483);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100320, to_date('24-06-2021', 'dd-mm-yyyy'), 3985, 333, 448);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100321, to_date('05-05-2021', 'dd-mm-yyyy'), 3736, 320, 457);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100322, to_date('19-07-2023', 'dd-mm-yyyy'), 957, 17, 533);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100323, to_date('24-05-2020', 'dd-mm-yyyy'), 1143, 151, 454);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100324, to_date('18-08-2022', 'dd-mm-yyyy'), 1458, 315, 529);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100325, to_date('10-11-2021', 'dd-mm-yyyy'), 4525, 267, 566);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100326, to_date('01-12-2022', 'dd-mm-yyyy'), 3909, 284, 540);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100327, to_date('15-09-2020', 'dd-mm-yyyy'), 2977, 99, 535);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100328, to_date('30-04-2021', 'dd-mm-yyyy'), 319, 32, 473);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100329, to_date('11-02-2020', 'dd-mm-yyyy'), 894, 31, 609);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100330, to_date('09-04-2022', 'dd-mm-yyyy'), 3566, 56, 698);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100331, to_date('06-11-2020', 'dd-mm-yyyy'), 1738, 102, 619);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100332, to_date('03-09-2023', 'dd-mm-yyyy'), 134, 302, 549);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100333, to_date('12-12-2021', 'dd-mm-yyyy'), 2108, 20, 490);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100334, to_date('03-04-2022', 'dd-mm-yyyy'), 2969, 145, 634);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100335, to_date('29-07-2020', 'dd-mm-yyyy'), 1081, 117, 565);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100336, to_date('20-01-2022', 'dd-mm-yyyy'), 4841, 99, 585);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100337, to_date('15-03-2023', 'dd-mm-yyyy'), 4884, 12, 566);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100338, to_date('13-03-2022', 'dd-mm-yyyy'), 1885, 52, 620);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100339, to_date('29-12-2023', 'dd-mm-yyyy'), 1933, 211, 772);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100340, to_date('02-12-2023', 'dd-mm-yyyy'), 2476, 21, 543);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100341, to_date('14-06-2022', 'dd-mm-yyyy'), 3058, 230, 625);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100342, to_date('05-11-2020', 'dd-mm-yyyy'), 1491, 241, 553);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100343, to_date('29-04-2020', 'dd-mm-yyyy'), 2190, 34, 758);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100344, to_date('06-07-2020', 'dd-mm-yyyy'), 4783, 169, 696);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100345, to_date('04-10-2021', 'dd-mm-yyyy'), 2245, 17, 456);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100346, to_date('17-02-2021', 'dd-mm-yyyy'), 4061, 19, 526);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100347, to_date('01-09-2020', 'dd-mm-yyyy'), 1386, 293, 529);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100348, to_date('18-08-2023', 'dd-mm-yyyy'), 1991, 20, 602);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100349, to_date('04-06-2023', 'dd-mm-yyyy'), 4556, 115, 426);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100350, to_date('26-11-2022', 'dd-mm-yyyy'), 2672, 203, 604);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100351, to_date('19-09-2022', 'dd-mm-yyyy'), 387, 228, 759);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100352, to_date('14-05-2022', 'dd-mm-yyyy'), 2424, 305, 477);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100353, to_date('25-09-2022', 'dd-mm-yyyy'), 3297, 134, 459);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100354, to_date('11-09-2023', 'dd-mm-yyyy'), 854, 204, 599);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100355, to_date('15-07-2023', 'dd-mm-yyyy'), 1079, 290, 561);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100356, to_date('14-11-2023', 'dd-mm-yyyy'), 2246, 79, 573);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100357, to_date('19-09-2020', 'dd-mm-yyyy'), 2616, 30, 604);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100358, to_date('15-06-2023', 'dd-mm-yyyy'), 2299, 293, 646);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100359, to_date('21-04-2020', 'dd-mm-yyyy'), 1063, 10, 466);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100360, to_date('03-02-2022', 'dd-mm-yyyy'), 122, 201, 551);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100361, to_date('22-11-2020', 'dd-mm-yyyy'), 2222, 379, 416);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100362, to_date('24-04-2021', 'dd-mm-yyyy'), 567, 284, 577);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100363, to_date('23-01-2023', 'dd-mm-yyyy'), 3324, 278, 595);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100364, to_date('13-07-2022', 'dd-mm-yyyy'), 1896, 8, 459);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100365, to_date('05-01-2022', 'dd-mm-yyyy'), 2062, 256, 726);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100366, to_date('30-04-2020', 'dd-mm-yyyy'), 3726, 205, 498);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100367, to_date('20-06-2023', 'dd-mm-yyyy'), 950, 19, 436);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100368, to_date('26-12-2022', 'dd-mm-yyyy'), 315, 385, 502);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100369, to_date('27-10-2022', 'dd-mm-yyyy'), 2011, 303, 620);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100370, to_date('26-03-2020', 'dd-mm-yyyy'), 4098, 170, 558);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100371, to_date('15-07-2023', 'dd-mm-yyyy'), 1773, 65, 616);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100372, to_date('22-04-2022', 'dd-mm-yyyy'), 4663, 49, 421);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100373, to_date('17-10-2022', 'dd-mm-yyyy'), 1558, 209, 413);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100374, to_date('08-03-2022', 'dd-mm-yyyy'), 2897, 262, 733);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100375, to_date('24-05-2020', 'dd-mm-yyyy'), 3100, 230, 681);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100376, to_date('21-02-2021', 'dd-mm-yyyy'), 524, 214, 466);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100377, to_date('27-11-2022', 'dd-mm-yyyy'), 4486, 184, 624);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100378, to_date('06-07-2021', 'dd-mm-yyyy'), 4933, 1, 593);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100379, to_date('17-01-2023', 'dd-mm-yyyy'), 1388, 388, 464);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100380, to_date('14-09-2022', 'dd-mm-yyyy'), 4367, 75, 774);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100381, to_date('11-05-2022', 'dd-mm-yyyy'), 3588, 35, 547);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100382, to_date('24-06-2020', 'dd-mm-yyyy'), 3321, 222, 681);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100383, to_date('02-02-2021', 'dd-mm-yyyy'), 1907, 345, 668);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100384, to_date('27-06-2021', 'dd-mm-yyyy'), 3344, 276, 739);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100385, to_date('09-05-2023', 'dd-mm-yyyy'), 318, 236, 433);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100386, to_date('07-01-2021', 'dd-mm-yyyy'), 4126, 149, 689);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100387, to_date('03-07-2021', 'dd-mm-yyyy'), 3464, 116, 635);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100388, to_date('18-01-2020', 'dd-mm-yyyy'), 4887, 391, 790);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100389, to_date('26-10-2023', 'dd-mm-yyyy'), 4479, 210, 461);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100390, to_date('28-06-2021', 'dd-mm-yyyy'), 1097, 72, 429);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100391, to_date('14-05-2021', 'dd-mm-yyyy'), 3073, 199, 523);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100392, to_date('27-09-2021', 'dd-mm-yyyy'), 1461, 393, 569);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100393, to_date('06-03-2022', 'dd-mm-yyyy'), 3963, 199, 513);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100394, to_date('07-06-2021', 'dd-mm-yyyy'), 310, 17, 412);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100395, to_date('17-08-2020', 'dd-mm-yyyy'), 641, 251, 682);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100396, to_date('21-06-2023', 'dd-mm-yyyy'), 198, 133, 699);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100397, to_date('04-02-2022', 'dd-mm-yyyy'), 4374, 343, 749);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100398, to_date('21-04-2022', 'dd-mm-yyyy'), 4881, 29, 420);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100399, to_date('07-11-2022', 'dd-mm-yyyy'), 3643, 159, 627);
commit;
prompt 400 records loaded
prompt Loading PRODUCTSALES...
prompt Table is empty
prompt Enabling foreign key constraints for INVENTORY...
alter table INVENTORY enable constraint SYS_C009250;
alter table INVENTORY enable constraint SYS_C009251;
prompt Enabling foreign key constraints for SALES...
alter table SALES enable constraint SYS_C009242;
alter table SALES enable constraint SYS_C009243;
prompt Enabling foreign key constraints for PRODUCTSALES...
alter table PRODUCTSALES enable constraint SYS_C009257;
alter table PRODUCTSALES enable constraint SYS_C009258;
prompt Enabling triggers for CUSTOMERS...
alter table CUSTOMERS enable all triggers;
prompt Enabling triggers for EMPLOYEES...
alter table EMPLOYEES enable all triggers;
prompt Enabling triggers for PRODUCTS...
alter table PRODUCTS enable all triggers;
prompt Enabling triggers for SUPPLIERS...
alter table SUPPLIERS enable all triggers;
prompt Enabling triggers for INVENTORY...
alter table INVENTORY enable all triggers;
prompt Enabling triggers for SALES...
alter table SALES enable all triggers;
prompt Enabling triggers for PRODUCTSALES...
alter table PRODUCTSALES enable all triggers;

set feedback on
set define on
prompt Done
