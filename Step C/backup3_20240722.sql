prompt PL/SQL Developer Export Tables for user SYS@XE
prompt Created by tordj on 22 July 2024
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
alter table INVENTORY disable constraint SYS_C009294;
alter table INVENTORY disable constraint SYS_C009295;
prompt Disabling foreign key constraints for SALES...
alter table SALES disable constraint SYS_C009286;
alter table SALES disable constraint SYS_C009287;
prompt Disabling foreign key constraints for PRODUCTSALES...
alter table PRODUCTSALES disable constraint SYS_C009301;
alter table PRODUCTSALES disable constraint SYS_C009302;
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
values (1, 'Ozzy Rourke', 'ozzy.r@ibfh.br');
insert into CUSTOMERS (customerid, customername, customeremail)
values (2, 'Christmas Loveless', 'christmas.loveless@yes.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (3, 'Nile Lennox', 'nile.lennox@vitacostcom.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (4, 'Kasey Rock', 'kasey.r@wellsfinancial.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (5, 'Ving Sossamon', 'ving.sossamon@younginnovations.fr');
insert into CUSTOMERS (customerid, customername, customeremail)
values (6, 'Sheryl Brown', 'sheryl.brown@epamsystems.uk');
insert into CUSTOMERS (customerid, customername, customeremail)
values (7, 'Joseph Imbruglia', 'joseph.imbruglia@tilsonlandscape.uk');
insert into CUSTOMERS (customerid, customername, customeremail)
values (8, 'Aidan Hoskins', 'aidan@quicksilverresources.il');
insert into CUSTOMERS (customerid, customername, customeremail)
values (9, 'Tilda Finn', 't.finn@walmartstores.se');
insert into CUSTOMERS (customerid, customername, customeremail)
values (10, 'Drew Conway', 'drew@invisioncom.gr');
insert into CUSTOMERS (customerid, customername, customeremail)
values (11, 'Salma Latifah', 'salma.latifah@yashtechnologies.de');
insert into CUSTOMERS (customerid, customername, customeremail)
values (12, 'Emm urban', 'emm.urban@solutionbuilders.jp');
insert into CUSTOMERS (customerid, customername, customeremail)
values (13, 'Orlando Duncan', 'orlando.duncan@campbellsoup.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (14, 'Rutger Himmelman', 'rutger.himmelman@sunstream.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (15, 'Tyrone Baez', 'tyrone.baez@catamount.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (16, 'Christine Gleeson', 'christine.gleeson@efcbancorp.ca');
insert into CUSTOMERS (customerid, customername, customeremail)
values (17, 'Juliana Idle', 'juliana.idle@vertexsolutions.de');
insert into CUSTOMERS (customerid, customername, customeremail)
values (18, 'Rueben MacLachlan', 'rueben.maclachlan@ssci.au');
insert into CUSTOMERS (customerid, customername, customeremail)
values (19, 'Azucar Chao', 'achao@novartis.se');
insert into CUSTOMERS (customerid, customername, customeremail)
values (20, 'Caroline Skerritt', 'caroline.skerritt@envisiontelephony.ca');
insert into CUSTOMERS (customerid, customername, customeremail)
values (21, 'Connie Vaughan', 'connie.v@webgroup.be');
insert into CUSTOMERS (customerid, customername, customeremail)
values (22, 'Danny Katt', 'danny.katt@worldcom.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (23, 'Carlos Sylvian', 'csylvian@qssgroup.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (24, 'Remy Mattea', 'r.mattea@fnb.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (25, 'Matt Mirren', 'matt.mirren@fds.nl');
insert into CUSTOMERS (customerid, customername, customeremail)
values (26, 'Colin Lynch', 'colinl@smartdrawcom.au');
insert into CUSTOMERS (customerid, customername, customeremail)
values (27, 'Toni Stuart', 'toni.stuart@fmb.de');
insert into CUSTOMERS (customerid, customername, customeremail)
values (28, 'Cheech Hatchet', 'cheech.hatchet@maverick.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (29, 'Wally Pleasure', 'wally.p@yumbrands.li');
insert into CUSTOMERS (customerid, customername, customeremail)
values (30, 'Robby Ranger', 'robby.ranger@sears.de');
insert into CUSTOMERS (customerid, customername, customeremail)
values (31, 'Omar Malone', 'omar.malone@jlphor.de');
insert into CUSTOMERS (customerid, customername, customeremail)
values (32, 'Brittany Feore', 'brittany@comglobalsystems.de');
insert into CUSTOMERS (customerid, customername, customeremail)
values (33, 'Frederic Stills', 'f.stills@smartronix.dk');
insert into CUSTOMERS (customerid, customername, customeremail)
values (34, 'Emm McCabe', 'emm@simplycertificates.se');
insert into CUSTOMERS (customerid, customername, customeremail)
values (35, 'Trick Horizon', 'trick@faef.hu');
insert into CUSTOMERS (customerid, customername, customeremail)
values (36, 'Hookah Lemmon', 'hookahl@mathis.de');
insert into CUSTOMERS (customerid, customername, customeremail)
values (37, 'Brendan Hoffman', 'brendan@aventis.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (38, 'Maxine Malone', 'maxine@paintedword.es');
insert into CUSTOMERS (customerid, customername, customeremail)
values (39, 'Ashton Gill', 'ashton.gill@ccb.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (40, 'Gabriel Speaks', 'gabriel.speaks@eagleone.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (41, 'Dwight Robinson', 'drobinson@printcafesoftware.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (42, 'Patrick Lloyd', 'plloyd@cardtronics.jp');
insert into CUSTOMERS (customerid, customername, customeremail)
values (43, 'Aidan Bugnon', 'aidan.bugnon@genghisgrill.lt');
insert into CUSTOMERS (customerid, customername, customeremail)
values (44, 'Danny Howard', 'danny.howard@waltdisney.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (45, 'Amanda DiBiasio', 'amanda.dibiasio@newmedia.de');
insert into CUSTOMERS (customerid, customername, customeremail)
values (46, 'Daryle Shorter', 'daryle.shorter@ibm.it');
insert into CUSTOMERS (customerid, customername, customeremail)
values (47, 'Emerson Curtis-Hall', 'emerson.c@ceb.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (48, 'Manu Connick', 'manuc@alternativetechnology.dk');
insert into CUSTOMERS (customerid, customername, customeremail)
values (49, 'Stewart Paxton', 'stewart.paxton@mwp.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (50, 'Holland Yorn', 'holland.yorn@at.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (51, 'Sonny Jessee', 's.jessee@cynergydata.ch');
insert into CUSTOMERS (customerid, customername, customeremail)
values (52, 'Donal Ticotin', 'd.ticotin@gagwear.de');
insert into CUSTOMERS (customerid, customername, customeremail)
values (53, 'Burton Jackson', 'burton.jackson@perfectorder.ca');
insert into CUSTOMERS (customerid, customername, customeremail)
values (54, 'Samantha Collins', 'samantha.collins@ris.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (55, 'Glen Walker', 'glen@studiobproductions.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (56, 'Melanie Bright', 'melanieb@saksinc.de');
insert into CUSTOMERS (customerid, customername, customeremail)
values (57, 'Doug Kahn', 'd.kahn@monitronicsinternational.it');
insert into CUSTOMERS (customerid, customername, customeremail)
values (58, 'Dylan Roundtree', 'droundtree@airmethods.pt');
insert into CUSTOMERS (customerid, customername, customeremail)
values (59, 'Saffron Kotto', 'saffron.kotto@ris.dk');
insert into CUSTOMERS (customerid, customername, customeremail)
values (60, 'Meryl Holeman', 'meryl.holeman@digitalmotorworks.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (61, 'Gordie Martinez', 'gordie.martinez@computersource.it');
insert into CUSTOMERS (customerid, customername, customeremail)
values (62, 'Emmylou Hall', 'emmylouh@asapstaffing.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (63, 'Natacha Bacharach', 'natacha.bacharach@unitedasset.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (64, 'Gene Scott', 'g.scott@savela.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (65, 'Oliver Janney', 'oliver.j@ciwservices.jp');
insert into CUSTOMERS (customerid, customername, customeremail)
values (66, 'Wesley Green', 'wesley.green@abatix.ch');
insert into CUSTOMERS (customerid, customername, customeremail)
values (67, 'Chalee Tambor', 'chalee@tilsonhr.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (68, 'Roddy Viterelli', 'roddy.viterelli@navigatorsystems.id');
insert into CUSTOMERS (customerid, customername, customeremail)
values (69, 'France Briscoe', 'franceb@nhr.au');
insert into CUSTOMERS (customerid, customername, customeremail)
values (70, 'Rupert Cale', 'rupert.cale@greenmountain.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (71, 'Ed Tate', 'ed49@democracydata.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (72, 'Aaron Farrow', 'a.farrow@stm.my');
insert into CUSTOMERS (customerid, customername, customeremail)
values (73, 'Todd Franks', 'tfranks@jsa.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (74, 'Gina Satriani', 'gina.satriani@mathis.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (75, 'Remy Farrow', 'remy.farrow@blueoceansoftware.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (76, 'Eileen Sandler', 'eileen.sandler@angieslist.de');
insert into CUSTOMERS (customerid, customername, customeremail)
values (77, 'Dave Atkins', 'dave@vesta.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (78, 'Tara Butler', 'tara.butler@cimalabs.br');
insert into CUSTOMERS (customerid, customername, customeremail)
values (79, 'Kelli Lewis', 'kelli.lewis@timevision.uk');
insert into CUSTOMERS (customerid, customername, customeremail)
values (80, 'Janeane Gryner', 'janeane@bashen.de');
insert into CUSTOMERS (customerid, customername, customeremail)
values (81, 'Junior Crowell', 'j.crowell@gci.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (82, 'Johnnie Hughes', 'johnnie@employerservices.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (83, 'Cherry Candy', 'cherry.candy@merck.ch');
insert into CUSTOMERS (customerid, customername, customeremail)
values (84, 'Louise Walsh', 'louise@flavorx.jp');
insert into CUSTOMERS (customerid, customername, customeremail)
values (85, 'Dar Harrison', 'dar.h@httprint.de');
insert into CUSTOMERS (customerid, customername, customeremail)
values (86, 'Madeline Brando', 'madeline.brando@innovativelighting.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (87, 'Christian Kinney', 'christian.kinney@activeservices.it');
insert into CUSTOMERS (customerid, customername, customeremail)
values (88, 'Terrence Borgnine', 'tborgnine@providenceservice.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (89, 'Minnie Osment', 'minnie.osment@catamount.de');
insert into CUSTOMERS (customerid, customername, customeremail)
values (90, 'Debi Cornell', 'debi.cornell@medamicus.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (91, 'Joey Clark', 'joey@efcbancorp.de');
insert into CUSTOMERS (customerid, customername, customeremail)
values (92, 'Albert Frost', 'albert@viacom.it');
insert into CUSTOMERS (customerid, customername, customeremail)
values (93, 'Remy Sellers', 'remy.sellers@totalentertainment.uk');
insert into CUSTOMERS (customerid, customername, customeremail)
values (94, 'Thelma Curry', 'thelmac@gateway.jp');
insert into CUSTOMERS (customerid, customername, customeremail)
values (95, 'Mary Driver', 'mary.driver@ahl.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (96, 'Teri Idle', 'teri.idle@circuitcitystores.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (97, 'Colleen Torn', 'colleen@fam.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (98, 'Mandy Dunn', 'mandy.dunn@bigdoughcom.ca');
insert into CUSTOMERS (customerid, customername, customeremail)
values (99, 'Harris Dawson', 'harris@venoco.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (100, 'Lucy Mills', 'l.mills@esteelauder.com');
commit;
prompt 100 records committed...
insert into CUSTOMERS (customerid, customername, customeremail)
values (101, 'Bill Frost', 'bill.frost@diageo.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (102, 'Curtis Hauser', 'curtis.hauser@lemproducts.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (103, 'Roger Firth', 'roger.firth@pulaskifinancial.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (104, 'Shannon Kane', 'shannon.kane@eastmankodak.se');
insert into CUSTOMERS (customerid, customername, customeremail)
values (105, 'Talvin Winger', 'talvin.winger@swi.mo');
insert into CUSTOMERS (customerid, customername, customeremail)
values (106, 'Eugene Woodard', 'ewoodard@infopros.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (107, 'Trick Isaacs', 'tricki@ivorysystems.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (108, 'Miki LaMond', 'miki@hps.uk');
insert into CUSTOMERS (customerid, customername, customeremail)
values (109, 'Crystal Coward', 'crystal@dell.ch');
insert into CUSTOMERS (customerid, customername, customeremail)
values (110, 'Taryn Prowse', 'taryn.prowse@fiberlink.es');
insert into CUSTOMERS (customerid, customername, customeremail)
values (111, 'Lili Heald', 'lili.heald@networkdisplay.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (112, 'Lois DiFranco', 'l.difranco@capellaeducation.de');
insert into CUSTOMERS (customerid, customername, customeremail)
values (113, 'Candice Fiennes', 'candicef@cws.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (114, 'Gin Arden', 'gin.arden@conquest.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (115, 'Will Lynch', 'will.l@kimberlyclark.ca');
insert into CUSTOMERS (customerid, customername, customeremail)
values (116, 'Jack Perez', 'jack.perez@linacsystems.ch');
insert into CUSTOMERS (customerid, customername, customeremail)
values (117, 'Kate Price', 'kate.price@verizon.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (118, 'Sal Belles', 'sal.belles@ungertechnologies.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (119, 'Wally Joli', 'wally@fsffinancial.nz');
insert into CUSTOMERS (customerid, customername, customeremail)
values (120, 'Milla Easton', 'millae@esoftsolutions.de');
insert into CUSTOMERS (customerid, customername, customeremail)
values (121, 'Dermot McLean', 'dermot.m@campbellsoup.it');
insert into CUSTOMERS (customerid, customername, customeremail)
values (122, 'Merrilee Rizzo', 'merrilee.rizzo@signature.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (123, 'Earl Bassett', 'earl@solutionbuilders.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (124, 'Mili Perlman', 'mili.perlman@newmedia.de');
insert into CUSTOMERS (customerid, customername, customeremail)
values (125, 'Natacha Crewson', 'natacha@pra.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (126, 'Kieran Loeb', 'kloeb@air.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (127, 'Cloris Simpson', 'cloris@ibm.si');
insert into CUSTOMERS (customerid, customername, customeremail)
values (128, 'Kitty Lane', 'kitty.lane@ptg.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (129, 'Cloris Davis', 'cloris@telepoint.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (130, 'Neneh Travolta', 'neneh.travolta@ads.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (131, 'Chad Paquin', 'cpaquin@oriservices.uk');
insert into CUSTOMERS (customerid, customername, customeremail)
values (132, 'Elle Lindo', 'elle.lindo@unilever.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (133, 'Andrae Twilley', 'andrae.twilley@viacom.fr');
insert into CUSTOMERS (customerid, customername, customeremail)
values (134, 'Ernest Cooper', 'ernest.cooper@insurmark.de');
insert into CUSTOMERS (customerid, customername, customeremail)
values (135, 'Jose Caan', 'jose.caan@bashen.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (136, 'Heath Holeman', 'heath.holeman@tarragonrealty.uk');
insert into CUSTOMERS (customerid, customername, customeremail)
values (137, 'Rosanne Haslam', 'rosanne.h@alternativetechnology.li');
insert into CUSTOMERS (customerid, customername, customeremail)
values (138, 'Bette Duke', 'bette@zaiqtechnologies.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (139, 'Mia Peniston', 'mia.peniston@tama.in');
insert into CUSTOMERS (customerid, customername, customeremail)
values (140, 'Bill Lizzy', 'blizzy@ceb.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (141, 'Anjelica Snipes', 'anjelica.snipes@grs.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (142, 'Philip Gyllenhaal', 'philip.gyllenhaal@educationaldevelopment.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (143, 'Frank Guzman', 'frank.g@bestbuy.nl');
insert into CUSTOMERS (customerid, customername, customeremail)
values (144, 'James Lewis', 'jlewis@smg.au');
insert into CUSTOMERS (customerid, customername, customeremail)
values (145, 'Seann Cube', 'seann@pib.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (146, 'Miki Leguizamo', 'miki.l@esteelauder.de');
insert into CUSTOMERS (customerid, customername, customeremail)
values (147, 'Rachel Glover', 'rglover@mqsoftware.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (148, 'Christian Hampton', 'christian.hampton@pscinfogroup.ch');
insert into CUSTOMERS (customerid, customername, customeremail)
values (149, 'Toni Rowlands', 'toni.rowlands@vspan.jp');
insert into CUSTOMERS (customerid, customername, customeremail)
values (150, 'Phil Benson', 'phil.b@3tsystems.se');
insert into CUSTOMERS (customerid, customername, customeremail)
values (151, 'Murray Roth', 'murray@wav.de');
insert into CUSTOMERS (customerid, customername, customeremail)
values (152, 'Rik Burton', 'r.burton@usgovernment.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (153, 'Penelope Coleman', 'penelopec@interfacesoftware.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (154, 'Lucy Heald', 'l.heald@granitesystems.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (155, 'Xander Gunton', 'xander.gunton@bayer.de');
insert into CUSTOMERS (customerid, customername, customeremail)
values (156, 'Phoebe Johnson', 'phoebe.johnson@ahl.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (157, 'Shannon Burns', 'shannon.burns@ezecastlesoftware.ar');
insert into CUSTOMERS (customerid, customername, customeremail)
values (158, 'Johnny Purefoy', 'johnny@fiberlink.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (159, 'Omar Berkoff', 'omar@onstaff.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (160, 'Frankie LaSalle', 'frankie.lasalle@restaurantpartners.br');
insert into CUSTOMERS (customerid, customername, customeremail)
values (161, 'Jean-Claude Squier', 'jeanclaude@bioreliance.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (162, 'Milla Webb', 'milla.webb@staffforce.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (163, 'Goran Rawls', 'grawls@alogent.fr');
insert into CUSTOMERS (customerid, customername, customeremail)
values (164, 'Fisher Kramer', 'fisher.kramer@aoe.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (165, 'Kathleen Cara', 'kathleen.cara@servicelink.uk');
insert into CUSTOMERS (customerid, customername, customeremail)
values (166, 'Rick Getty', 'rick.getty@wyeth.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (167, 'Chrissie Grier', 'chrissie.grier@gdatechnologies.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (168, 'Jeff Gatlin', 'jeff@providentbancorp.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (169, 'Jeffery Weaving', 'jeffery.weaving@mms.ch');
insert into CUSTOMERS (customerid, customername, customeremail)
values (170, 'Dean Copeland', 'dean.copeland@proclarity.ch');
insert into CUSTOMERS (customerid, customername, customeremail)
values (171, 'Maury Cusack', 'maury@investmentscorecard.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (172, 'Phil Gandolfini', 'phil.gandolfini@ppr.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (173, 'Gloria Frakes', 'gloria.frakes@outsourcegroup.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (174, 'Mekhi Kershaw', 'mekhi@wlt.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (175, 'Ashton Lerner', 'ashtonl@kroger.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (176, 'Tcheky Chaykin', 'tcheky.chaykin@marathonheater.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (177, 'Debi Brosnan', 'debi.brosnan@calence.fi');
insert into CUSTOMERS (customerid, customername, customeremail)
values (178, 'Tracy Barkin', 'tracy.barkin@sfmai.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (179, 'Mel Dysart', 'mel.dysart@efcbancorp.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (180, 'Carole Emmett', 'carolee@gha.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (181, 'Embeth Rizzo', 'embeth.rizzo@ach.ch');
insert into CUSTOMERS (customerid, customername, customeremail)
values (182, 'Garland Perlman', 'garland.p@solutionbuilders.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (183, 'Thomas Balin', 't.balin@qssgroup.ch');
insert into CUSTOMERS (customerid, customername, customeremail)
values (184, 'Dionne Craddock', 'dionne.craddock@americanmegacom.uk');
insert into CUSTOMERS (customerid, customername, customeremail)
values (185, 'Curt Waits', 'curt.waits@sfb.jp');
insert into CUSTOMERS (customerid, customername, customeremail)
values (186, 'Roger Schwimmer', 'roger.s@efcbancorp.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (187, 'Josh McElhone', 'josh@jewettcameron.dk');
insert into CUSTOMERS (customerid, customername, customeremail)
values (188, 'Martha Diesel', 'martha.diesel@typhoon.gr');
insert into CUSTOMERS (customerid, customername, customeremail)
values (189, 'Tori Gallagher', 'tori.gallagher@mwh.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (190, 'Matt Winstone', 'matt.w@seiaarons.de');
insert into CUSTOMERS (customerid, customername, customeremail)
values (191, 'Howie Wen', 'howie.wen@data.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (192, 'Pierce Berry', 'pierce.berry@hudsonriverbancorp.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (193, 'Vince Pfeiffer', 'vince.pfeiffer@swp.se');
insert into CUSTOMERS (customerid, customername, customeremail)
values (194, 'Emilio Sheen', 'esheen@grs.ch');
insert into CUSTOMERS (customerid, customername, customeremail)
values (195, 'Marley Azaria', 'marley.azaria@coadvantageresources.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (196, 'Nile Stowe', 'nile.stowe@logisticare.ca');
insert into CUSTOMERS (customerid, customername, customeremail)
values (197, 'Fionnula Summer', 'fionnula.summer@horizonorganic.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (198, 'Domingo Kelly', 'domingok@wrgservices.ar');
insert into CUSTOMERS (customerid, customername, customeremail)
values (199, 'Harold Harrison', 'haroldh@ppr.jp');
insert into CUSTOMERS (customerid, customername, customeremail)
values (200, 'Wallace Stone', 'wallace.stone@solipsys.com');
commit;
prompt 200 records committed...
insert into CUSTOMERS (customerid, customername, customeremail)
values (201, 'Andre Rhames', 'andre@oss.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (202, 'Matt Jay', 'matt@als.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (203, 'Daryl Wolf', 'daryl.w@accessus.de');
insert into CUSTOMERS (customerid, customername, customeremail)
values (204, 'Gladys Sobieski', 'gladys.sobieski@refinery.nl');
insert into CUSTOMERS (customerid, customername, customeremail)
values (205, 'Madeline Swinton', 'madeline.swinton@marathonheater.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (206, 'Molly Holliday', 'molly.holliday@shirtfactory.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (207, 'Graham Swayze', 'g.swayze@bps.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (208, 'Ricardo Adler', 'radler@lms.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (209, 'Gin Coughlan', 'gin.c@qestrel.it');
insert into CUSTOMERS (customerid, customername, customeremail)
values (210, 'Teri Fender', 'teri.fender@tropicaloasis.de');
insert into CUSTOMERS (customerid, customername, customeremail)
values (211, 'Kathleen Yulin', 'kathleen.yulin@fpf.it');
insert into CUSTOMERS (customerid, customername, customeremail)
values (212, 'Rickie DiCaprio', 'r.dicaprio@gdi.ch');
insert into CUSTOMERS (customerid, customername, customeremail)
values (213, 'Vertical Brando', 'vertical.brando@homedepot.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (214, 'Gary Skerritt', 'gskerritt@contract.uk');
insert into CUSTOMERS (customerid, customername, customeremail)
values (215, 'Jim Knight', 'jimk@gentrasystems.de');
insert into CUSTOMERS (customerid, customername, customeremail)
values (216, 'Thelma Fraser', 'thelmaf@grt.it');
insert into CUSTOMERS (customerid, customername, customeremail)
values (217, 'Kid Douglas', 'kid.douglas@aoe.it');
insert into CUSTOMERS (customerid, customername, customeremail)
values (218, 'Max Arden', 'max.arden@usphysicaltherapy.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (219, 'Helen McGoohan', 'helen.mcgoohan@spd.ch');
insert into CUSTOMERS (customerid, customername, customeremail)
values (220, 'Julie Barkin', 'julieb@providenceservice.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (221, 'Michael McDowell', 'michael.mcdowell@trm.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (222, 'Al Gibson', 'al.g@mission.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (223, 'Remy Coughlan', 'remy.c@taycorfinancial.ch');
insert into CUSTOMERS (customerid, customername, customeremail)
values (224, 'Rhona Jane', 'rhona.j@sears.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (225, 'Johnette Rodgers', 'johnette.rodgers@mcdonalds.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (226, 'Timothy Page', 'timothy.page@bigyanksports.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (227, 'Alannah Flanagan', 'alannah.flanagan@visainternational.it');
insert into CUSTOMERS (customerid, customername, customeremail)
values (228, 'Hank Glover', 'hank.glover@operationaltechnologies.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (229, 'Oliver Wilkinson', 'o.wilkinson@officedepot.ca');
insert into CUSTOMERS (customerid, customername, customeremail)
values (230, 'Ice Pitney', 'ice.pitney@stonebrewing.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (231, 'Bobby Jackman', 'bobby.j@genextechnologies.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (232, 'George Gayle', 'george@trafficmanagement.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (233, 'Kirsten Vannelli', 'kirsten.vannelli@clubone.pl');
insert into CUSTOMERS (customerid, customername, customeremail)
values (234, 'Vince Palmieri', 'vince.palmieri@americanvanguard.th');
insert into CUSTOMERS (customerid, customername, customeremail)
values (235, 'Selma Mac', 'selma.mac@biosite.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (236, 'Terry Dillon', 'terry.dillon@telwares.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (237, 'Dom Gershon', 'dom.gershon@curagroup.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (238, 'Cyndi Payton', 'cyndi.payton@pis.ar');
insert into CUSTOMERS (customerid, customername, customeremail)
values (239, 'Natascha Hersh', 'natascha.hersh@banfeproducts.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (240, 'Joaquim LaSalle', 'joaquim.lasalle@netnumina.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (241, 'Daniel Del Toro', 'd.deltoro@infovision.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (242, 'Jaime Kelly', 'jaime.kelly@amerisourcefunding.nl');
insert into CUSTOMERS (customerid, customername, customeremail)
values (243, 'Michelle Berry', 'michelle.b@formatech.it');
insert into CUSTOMERS (customerid, customername, customeremail)
values (244, 'Lynn Brothers', 'lynn.brothers@reckittbenckiser.de');
insert into CUSTOMERS (customerid, customername, customeremail)
values (245, 'Leonardo Griggs', 'l.griggs@3tsystems.li');
insert into CUSTOMERS (customerid, customername, customeremail)
values (246, 'Kimberly Ford', 'kimberly.ford@fds.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (247, 'Caroline Berkeley', 'caroline.berkeley@cendant.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (248, 'Barbara Bentley', 'barbara@microtek.ca');
insert into CUSTOMERS (customerid, customername, customeremail)
values (249, 'Liev Roy Parnell', 'liev.r@amerisourcefunding.es');
insert into CUSTOMERS (customerid, customername, customeremail)
values (250, 'Vincent Edmunds', 'vincent.edmunds@appriss.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (251, 'Micky Houston', 'm.houston@connected.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (252, 'Parker Collie', 'parker.collie@unicru.br');
insert into CUSTOMERS (customerid, customername, customeremail)
values (253, 'Pierce Dempsey', 'pierce.dempsey@wav.si');
insert into CUSTOMERS (customerid, customername, customeremail)
values (254, 'Harris Diddley', 'harris@data.es');
insert into CUSTOMERS (customerid, customername, customeremail)
values (255, 'James Robinson', 'james.robinson@shufflemaster.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (256, 'Geggy Wilder', 'geggy.wilder@dillards.br');
insert into CUSTOMERS (customerid, customername, customeremail)
values (257, 'Ani Blackwell', 'anib@topicsentertainment.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (258, 'Vivica Hatfield', 'vivica.hatfield@meridiangold.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (259, 'Bradley Cagle', 'bcagle@timberlanewoodcrafters.ca');
insert into CUSTOMERS (customerid, customername, customeremail)
values (260, 'Marc urban', 'marc.urban@smi.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (261, 'Lizzy Harmon', 'l.harmon@netnumina.ch');
insert into CUSTOMERS (customerid, customername, customeremail)
values (262, 'Jackie Lapointe', 'jlapointe@sears.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (263, 'Tommy Salt', 'tommy.salt@vspan.br');
insert into CUSTOMERS (customerid, customername, customeremail)
values (264, 'Sydney Frampton', 'sydney.frampton@sunstream.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (265, 'Jeffrey Roth', 'jeffrey.roth@capellaeducation.nl');
insert into CUSTOMERS (customerid, customername, customeremail)
values (266, 'Edgar Barry', 'edgar.barry@usainstruments.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (267, 'Betty Phillippe', 'betty.phillippe@midwestmedia.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (268, 'Janice Buckingham', 'janice.buckingham@healthscribe.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (269, 'Eliza Gellar', 'eliza.g@walmartstores.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (270, 'Rebecca Collins', 'rebecca@thinktanksystems.dk');
insert into CUSTOMERS (customerid, customername, customeremail)
values (271, 'Busta Austin', 'busta@cooktek.nl');
insert into CUSTOMERS (customerid, customername, customeremail)
values (272, 'Emilio Koyana', 'emilio.koyana@pfizer.de');
insert into CUSTOMERS (customerid, customername, customeremail)
values (273, 'Winona Napolitano', 'w.napolitano@printingforlesscom.it');
insert into CUSTOMERS (customerid, customername, customeremail)
values (274, 'Sydney Kier', 's.kier@prosperitybancshares.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (275, 'Sheryl Hector', 'sheryl.hector@cynergydata.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (276, 'Christian Rush', 'crush@baesch.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (277, 'Ray Satriani', 'rays@advancedneuromodulation.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (278, 'Harrison Edmunds', 'hedmunds@sweetproductions.ca');
insert into CUSTOMERS (customerid, customername, customeremail)
values (279, 'Embeth Wright', 'embeth.wright@primussoftware.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (280, 'Crystal Farrow', 'crystal.farrow@ccfholding.tr');
insert into CUSTOMERS (customerid, customername, customeremail)
values (281, 'Bernard Saucedo', 'bernard.saucedo@smi.ch');
insert into CUSTOMERS (customerid, customername, customeremail)
values (282, 'Jonathan Domino', 'j.domino@lydiantrust.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (283, 'Bernie Sweeney', 'bernie.sweeney@at.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (284, 'Gilberto Keitel', 'g.keitel@nike.es');
insert into CUSTOMERS (customerid, customername, customeremail)
values (285, 'Drew Spine', 'dspine@newviewgifts.ca');
insert into CUSTOMERS (customerid, customername, customeremail)
values (286, 'Lizzy Gallagher', 'lizzy.gallagher@younginnovations.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (287, 'Merle Ferrer', 'merle.f@ufs.de');
insert into CUSTOMERS (customerid, customername, customeremail)
values (288, 'David Maguire', 'david.m@sms.de');
insert into CUSTOMERS (customerid, customername, customeremail)
values (289, 'Bridget Winger', 'bwinger@ssi.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (290, 'Ruth Vinton', 'ruth.vinton@mindworks.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (291, 'Ving Mattea', 'v.mattea@hfg.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (292, 'Praga Watley', 'praga.watley@innovateecommerce.de');
insert into CUSTOMERS (customerid, customername, customeremail)
values (293, 'Raul Wiest', 'raul.w@kellogg.ch');
insert into CUSTOMERS (customerid, customername, customeremail)
values (294, 'Courtney Whitwam', 'courtneyw@kroger.ch');
insert into CUSTOMERS (customerid, customername, customeremail)
values (295, 'Jerry McDowell', 'jerry.mcdowell@smartronix.es');
insert into CUSTOMERS (customerid, customername, customeremail)
values (296, 'Rachid Stamp', 'rachids@ceo.it');
insert into CUSTOMERS (customerid, customername, customeremail)
values (297, 'Terrence Guilfoyle', 'terrence.g@marsinc.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (298, 'Andrea Rains', 'andrea@ait.fr');
insert into CUSTOMERS (customerid, customername, customeremail)
values (299, 'Michael Paltrow', 'michael.paltrow@powerlight.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (300, 'Arnold Potter', 'arnold.potter@irissoftware.ar');
commit;
prompt 300 records committed...
insert into CUSTOMERS (customerid, customername, customeremail)
values (301, 'Dylan Cummings', 'dcummings@datawarehouse.de');
insert into CUSTOMERS (customerid, customername, customeremail)
values (302, 'Avril LaPaglia', 'avril.lapaglia@marathonheater.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (303, 'Roddy Vaughan', 'r.vaughan@toyotamotor.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (304, 'Elijah El-Saher', 'elijah.elsaher@teamstudio.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (305, 'Desmond Smith', 'desmond.smith@horizonorganic.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (306, 'Delbert Gano', 'delbert.gano@granitesystems.nl');
insert into CUSTOMERS (customerid, customername, customeremail)
values (307, 'Rawlins Nicholas', 'rawlins.nicholas@onstaff.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (308, 'Colin Kweller', 'colin.k@dbprofessionals.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (309, 'Lennie Remar', 'lennie.remar@allstar.jp');
insert into CUSTOMERS (customerid, customername, customeremail)
values (310, 'Kelly Irons', 'kelly.irons@universalsolutions.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (311, 'Kiefer Lofgren', 'kiefer.lofgren@atlanticcredit.jp');
insert into CUSTOMERS (customerid, customername, customeremail)
values (312, 'Miriam Bullock', 'miriam@doraldentalusa.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (313, 'Jared Bridges', 'jared.bridges@spotfireholdings.de');
insert into CUSTOMERS (customerid, customername, customeremail)
values (314, 'Isabella Bedelia', 'isabella.bedelia@bigdoughcom.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (315, 'Gin Eat World', 'gin.eatworld@gdatechnologies.ar');
insert into CUSTOMERS (customerid, customername, customeremail)
values (316, 'Ricky Meyer', 'ricky.meyer@yes.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (317, 'Isabella Cooper', 'isabella.cooper@gapinc.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (318, 'Kyle Sellers', 'kyle@pds.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (319, 'Frederic Marin', 'frederic.marin@aco.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (320, 'Lindsay McDowell', 'lindsay.mcdowell@ssci.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (321, 'Joe Shocked', 'joe.shocked@americanland.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (322, 'Trick Head', 'trick.head@invisioncom.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (323, 'Mike Ammons', 'mike.ammons@mercantilebank.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (324, 'Tramaine Vega', 't.vega@ezecastlesoftware.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (325, 'Shawn Beck', 'shawn.b@fiberlink.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (326, 'Shirley Robbins', 'shirley@pds.ch');
insert into CUSTOMERS (customerid, customername, customeremail)
values (327, 'Jason Rain', 'jrain@infinity.br');
insert into CUSTOMERS (customerid, customername, customeremail)
values (328, 'Rich Patton', 'rich.p@yashtechnologies.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (329, 'Elisabeth Firth', 'elisabeth.firth@pulaskifinancial.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (330, 'Cloris McCready', 'cmccready@allegiantbancorp.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (331, 'Lloyd D''Onofrio', 'lloyd.donofrio@blueoceansoftware.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (332, 'Lonnie Lillard', 'lonnie.lillard@marketbased.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (333, 'Lesley Foster', 'lesley.foster@anheuserbusch.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (334, 'Lionel Snider', 'lionel.snider@kimberlyclark.uk');
insert into CUSTOMERS (customerid, customername, customeremail)
values (335, 'Terri Field', 't.field@techrx.ca');
insert into CUSTOMERS (customerid, customername, customeremail)
values (336, 'Judy Everett', 'judy.everett@fam.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (337, 'Terrence Jeter', 'terrence.j@tlsservicebureau.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (338, 'Chely Willard', 'chely.willard@caliber.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (339, 'Patrick Bratt', 'patrick.bratt@stonebrewing.de');
insert into CUSTOMERS (customerid, customername, customeremail)
values (340, 'Nicole Whitaker', 'nicole.whitaker@horizonorganic.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (341, 'Jeremy Olyphant', 'jolyphant@cowlitzbancorp.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (342, 'Martha Goldwyn', 'martha@ssi.de');
insert into CUSTOMERS (customerid, customername, customeremail)
values (343, 'Jena Kretschmann', 'jkretschmann@infopros.ca');
insert into CUSTOMERS (customerid, customername, customeremail)
values (344, 'Jessica Gallagher', 'jessicag@bestbuy.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (345, 'Colin Nicholson', 'colin@softworld.nl');
insert into CUSTOMERS (customerid, customername, customeremail)
values (346, 'Sylvester Zevon', 'szevon@kitba.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (347, 'Ernest Magnuson', 'ernestm@allstar.fr');
insert into CUSTOMERS (customerid, customername, customeremail)
values (348, 'Freda Nicks', 'freda@saralee.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (349, 'Raymond Alda', 'ralda@safehomesecurity.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (350, 'Davy Himmelman', 'davy.himmelman@innovativelighting.lt');
insert into CUSTOMERS (customerid, customername, customeremail)
values (351, 'Lila Ryan', 'lila@airmethods.za');
insert into CUSTOMERS (customerid, customername, customeremail)
values (352, 'Kris Craddock', 'kris.craddock@allstar.ca');
insert into CUSTOMERS (customerid, customername, customeremail)
values (353, 'Chazz Warburton', 'chazz.warburton@accucode.mx');
insert into CUSTOMERS (customerid, customername, customeremail)
values (354, 'Arnold Gaynor', 'arnoldg@nike.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (355, 'Faye Preston', 'faye@ogi.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (356, 'Terrence Hersh', 'terrence.hersh@conquestsystems.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (357, 'Robert Noseworthy', 'robert.n@progressivemedical.uk');
insert into CUSTOMERS (customerid, customername, customeremail)
values (358, 'Veruca Ranger', 'veruca.ranger@spas.jp');
insert into CUSTOMERS (customerid, customername, customeremail)
values (359, 'Barbara Henriksen', 'barbarah@sfb.de');
insert into CUSTOMERS (customerid, customername, customeremail)
values (360, 'Melanie Durning', 'melanie.durning@inzone.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (361, 'Stephen Van Shelton', 'stephen.vanshelton@trc.ca');
insert into CUSTOMERS (customerid, customername, customeremail)
values (362, 'Regina Epps', 'r.epps@hardwoodwholesalers.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (363, 'Phil Westerberg', 'p.westerberg@creditorsinterchange.it');
insert into CUSTOMERS (customerid, customername, customeremail)
values (364, 'Ray Matheson', 'ray.matheson@infinity.ca');
insert into CUSTOMERS (customerid, customername, customeremail)
values (365, 'Wayne Osborne', 'wayne.osborne@albertsons.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (366, 'Joely Whitford', 'joely.whitford@air.de');
insert into CUSTOMERS (customerid, customername, customeremail)
values (367, 'Scarlett Lange', 'slange@linacsystems.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (368, 'Walter Bedelia', 'walter.bedelia@pib.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (369, 'Keith Diaz', 'keith.diaz@kmart.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (370, 'Harold Ford', 'harold.f@teoco.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (371, 'Jena Rippy', 'jenar@wrgservices.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (372, 'Bill Rauhofer', 'bill.rauhofer@greenmountain.id');
insert into CUSTOMERS (customerid, customername, customeremail)
values (373, 'Ned Osborne', 'ned.osborne@aco.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (374, 'Ralph Bloch', 'ralph.bloch@quakercitybancorp.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (375, 'Penelope Haggard', 'penelopeh@baesch.nc');
insert into CUSTOMERS (customerid, customername, customeremail)
values (376, 'Emily Marsden', 'emily@ads.cn');
insert into CUSTOMERS (customerid, customername, customeremail)
values (377, 'Cyndi Perry', 'c.perry@ctg.uk');
insert into CUSTOMERS (customerid, customername, customeremail)
values (378, 'Angie Walken', 'angie.w@anworthmortgage.lk');
insert into CUSTOMERS (customerid, customername, customeremail)
values (379, 'Rosanne Mulroney', 'rosanne@staffforce.br');
insert into CUSTOMERS (customerid, customername, customeremail)
values (380, 'Nancy Meyer', 'nancy.meyer@cyberthink.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (381, 'Rachid Kinski', 'rkinski@americanexpress.ar');
insert into CUSTOMERS (customerid, customername, customeremail)
values (382, 'Dennis Craddock', 'dennis@hiltonhotels.ch');
insert into CUSTOMERS (customerid, customername, customeremail)
values (383, 'Diamond Jane', 'djane@ibm.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (384, 'Lin Carlyle', 'l.carlyle@networkdisplay.de');
insert into CUSTOMERS (customerid, customername, customeremail)
values (385, 'Colin Walken', 'colin.walken@spectrum.cy');
insert into CUSTOMERS (customerid, customername, customeremail)
values (386, 'Nicole Camp', 'ncamp@unicru.dk');
insert into CUSTOMERS (customerid, customername, customeremail)
values (387, 'Viggo Tempest', 'viggo.t@envisiontelephony.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (388, 'Maceo Hiatt', 'maceo.hiatt@amerisourcefunding.ca');
insert into CUSTOMERS (customerid, customername, customeremail)
values (389, 'Rachael Craven', 'rachael.c@swi.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (390, 'Bernie Newton', 'bernie@priorityleasing.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (391, 'Lily Eat World', 'lily.eatworld@biosite.uk');
insert into CUSTOMERS (customerid, customername, customeremail)
values (392, 'Tanya Dushku', 'tanya.dushku@spectrum.at');
insert into CUSTOMERS (customerid, customername, customeremail)
values (393, 'Brendan Winstone', 'brendan.winstone@httprint.li');
insert into CUSTOMERS (customerid, customername, customeremail)
values (394, 'Sarah Koyana', 'skoyana@midwestmedia.it');
insert into CUSTOMERS (customerid, customername, customeremail)
values (395, 'Goran Pitney', 'goran.pitney@spenser.uk');
insert into CUSTOMERS (customerid, customername, customeremail)
values (396, 'Andrea Pearce', 'andreap@ipsadvisory.ch');
insert into CUSTOMERS (customerid, customername, customeremail)
values (397, 'Terry Cobbs', 'terry.cobbs@its.gr');
insert into CUSTOMERS (customerid, customername, customeremail)
values (398, 'Colm Snow', 'colm.s@spotfireholdings.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (399, 'Kim Gunton', 'kgunton@trc.nl');
insert into CUSTOMERS (customerid, customername, customeremail)
values (400, 'Holly Herrmann', 'h.herrmann@shar.com');
commit;
prompt 400 records loaded
prompt Loading EMPLOYEES...
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (401, 'April Lapointe', 'Product Manager', to_date('01-12-2022', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (402, 'Spike Duchovny', 'Sales Associate', to_date('21-10-2020', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (403, 'Jet Goldberg', 'Manager', to_date('07-09-2021', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (404, 'Campbell Fox', 'Product Manager', to_date('10-11-2020', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (405, 'Courtney Dreyfuss', 'Cashier', to_date('18-07-2021', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (406, 'Faye Biggs', 'Manager', to_date('22-01-2023', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (407, 'Bebe Burke', 'Sales Associate', to_date('16-04-2022', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (408, 'James Pollak', 'Sales Associate', to_date('10-11-2022', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (409, 'Janice Saucedo', 'Product Manager', to_date('21-05-2023', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (410, 'Burt Zappacosta', 'Cashier', to_date('09-05-2021', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (411, 'Nile Blanchett', 'Sales Associate', to_date('14-12-2021', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (412, 'Chi O''Neill', 'Sales Associate', to_date('19-05-2022', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (413, 'Stockard Kier', 'Product Manager', to_date('06-01-2023', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (414, 'Elisabeth Knight', 'Sales Associate', to_date('25-11-2021', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (415, 'Carole Ticotin', 'Product Manager', to_date('29-12-2021', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (416, 'Denis Scheider', 'Sales Associate', to_date('08-08-2021', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (417, 'Roberta Raitt', 'Product Manager', to_date('13-06-2023', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (418, 'Emmylou Presley', 'Sales Associate', to_date('15-10-2022', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (419, 'Tal Klugh', 'Manager', to_date('23-01-2020', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (420, 'Thomas Remar', 'Sales Associate', to_date('18-06-2020', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (421, 'Lindsey Arjona', 'Manager', to_date('22-11-2023', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (422, 'Swoosie Burstyn', 'Sales Associate', to_date('24-09-2021', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (423, 'Chubby Hatosy', 'Cashier', to_date('11-11-2021', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (424, 'Mandy Lopez', 'Product Manager', to_date('24-05-2020', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (425, 'Jon Chestnut', 'Cashier', to_date('01-07-2023', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (426, 'Raymond Owen', 'Cashier', to_date('29-10-2023', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (427, 'Emm Ford', 'Sales Associate', to_date('04-12-2020', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (428, 'Jay Bailey', 'Cashier', to_date('03-02-2020', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (429, 'Gin Santa Rosa', 'Sales Associate', to_date('08-02-2021', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (430, 'Darren Lee', 'Product Manager', to_date('20-04-2021', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (431, 'Keith LaSalle', 'Manager', to_date('05-05-2022', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (432, 'Wesley Hunter', 'Manager', to_date('31-03-2023', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (433, 'First Tennison', 'Cashier', to_date('31-12-2022', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (434, 'Remy De Niro', 'Cashier', to_date('03-04-2021', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (435, 'Nina Crimson', 'Product Manager', to_date('09-07-2022', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (436, 'Alicia Mitra', 'Cashier', to_date('23-04-2022', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (437, 'Hikaru Broderick', 'Product Manager', to_date('26-08-2022', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (438, 'Bernard Hannah', 'Manager', to_date('02-06-2021', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (439, 'Anna Berkoff', 'Sales Associate', to_date('08-12-2020', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (440, 'Carla O''Neal', 'Cashier', to_date('27-03-2022', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (441, 'Ellen Crowe', 'Sales Associate', to_date('22-06-2020', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (442, 'Geoffrey Thurman', 'Sales Associate', to_date('29-11-2021', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (443, 'Martha Nivola', 'Manager', to_date('20-11-2023', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (444, 'Harry DeVita', 'Manager', to_date('25-03-2020', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (445, 'Victoria McGriff', 'Manager', to_date('30-07-2023', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (446, 'Coley Maguire', 'Cashier', to_date('18-12-2020', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (447, 'Denzel Sandoval', 'Product Manager', to_date('21-03-2020', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (448, 'Brent Barrymore', 'Cashier', to_date('03-07-2021', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (449, 'Jesse Perez', 'Sales Associate', to_date('04-07-2021', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (450, 'Ernie Gosdin', 'Manager', to_date('14-09-2022', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (451, 'Alannah Breslin', 'Sales Associate', to_date('13-02-2021', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (452, 'Julianna El-Saher', 'Cashier', to_date('08-01-2023', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (453, 'Ivan Guzman', 'Sales Associate', to_date('01-01-2022', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (454, 'Ashton Arjona', 'Cashier', to_date('15-11-2020', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (455, 'Carolyn Finn', 'Cashier', to_date('28-10-2023', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (456, 'Gerald Avital', 'Product Manager', to_date('02-04-2021', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (457, 'Tommy Haynes', 'Sales Associate', to_date('29-09-2022', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (458, 'Geena Hawn', 'Manager', to_date('08-08-2022', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (459, 'Jonathan Senior', 'Sales Associate', to_date('23-05-2023', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (460, 'Neil Richardson', 'Sales Associate', to_date('02-12-2023', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (461, 'Charlize Stuart', 'Product Manager', to_date('08-02-2023', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (462, 'Antonio Tarantino', 'Product Manager', to_date('22-02-2020', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (463, 'Gladys Bogguss', 'Product Manager', to_date('10-06-2020', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (464, 'Lizzy Pleasure', 'Sales Associate', to_date('30-09-2021', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (465, 'Tzi Pitt', 'Sales Associate', to_date('25-11-2023', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (466, 'Vivica Walsh', 'Cashier', to_date('19-08-2022', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (467, 'Christian Arjona', 'Cashier', to_date('02-12-2020', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (468, 'Meryl Glenn', 'Cashier', to_date('21-03-2020', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (469, 'Miranda Wilkinson', 'Sales Associate', to_date('17-02-2023', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (470, 'Gene Huston', 'Cashier', to_date('02-11-2023', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (471, 'Brian Leguizamo', 'Sales Associate', to_date('31-10-2023', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (472, 'Swoosie Sedaka', 'Manager', to_date('27-04-2023', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (473, 'Red Howard', 'Product Manager', to_date('29-09-2023', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (474, 'Leelee Bryson', 'Sales Associate', to_date('22-11-2021', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (475, 'Rose Rucker', 'Manager', to_date('30-12-2020', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (476, 'George Gilley', 'Sales Associate', to_date('13-04-2021', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (477, 'Lena Thomas', 'Sales Associate', to_date('18-05-2021', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (478, 'Ted Ball', 'Cashier', to_date('28-01-2023', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (479, 'Christine Stuermer', 'Sales Associate', to_date('23-10-2020', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (480, 'Natacha Postlethwaite', 'Product Manager', to_date('09-05-2022', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (481, 'Remy Rebhorn', 'Sales Associate', to_date('11-02-2020', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (482, 'Dick Botti', 'Product Manager', to_date('15-07-2021', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (483, 'Renee Borgnine', 'Cashier', to_date('23-12-2023', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (484, 'Benicio Perrineau', 'Cashier', to_date('11-07-2020', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (485, 'Jessica Evanswood', 'Cashier', to_date('21-03-2020', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (486, 'Martin Dunn', 'Sales Associate', to_date('20-01-2023', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (487, 'Sydney Gooding', 'Cashier', to_date('08-04-2023', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (488, 'Nanci Jackman', 'Product Manager', to_date('21-04-2023', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (489, 'Ian DiBiasio', 'Product Manager', to_date('27-11-2021', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (490, 'Anne Dolenz', 'Manager', to_date('13-10-2020', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (491, 'Toni Rossellini', 'Sales Associate', to_date('09-04-2023', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (492, 'Julio Wolf', 'Manager', to_date('09-06-2023', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (493, 'Betty Close', 'Sales Associate', to_date('29-01-2021', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (494, 'Caroline Rosas', 'Sales Associate', to_date('06-01-2023', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (495, 'Desmond Yankovic', 'Cashier', to_date('21-02-2020', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (496, 'Tori Nakai', 'Product Manager', to_date('08-09-2022', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (497, 'Chet Supernaw', 'Cashier', to_date('30-01-2021', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (498, 'Red Brothers', 'Manager', to_date('29-11-2020', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (499, 'Petula Mortensen', 'Product Manager', to_date('08-05-2021', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (500, 'Lloyd Iglesias', 'Cashier', to_date('24-07-2023', 'dd-mm-yyyy'));
commit;
prompt 100 records committed...
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (501, 'Dylan Wagner', 'Manager', to_date('14-06-2020', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (502, 'Tcheky Himmelman', 'Sales Associate', to_date('09-04-2020', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (503, 'Nick Redford', 'Sales Associate', to_date('10-06-2021', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (504, 'Rupert McGregor', 'Cashier', to_date('28-01-2021', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (505, 'Mena Avital', 'Sales Associate', to_date('31-08-2020', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (506, 'Bret Esposito', 'Product Manager', to_date('08-04-2021', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (507, 'Ernie Elliott', 'Sales Associate', to_date('05-10-2021', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (508, 'Marty Tyler', 'Sales Associate', to_date('04-07-2022', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (509, 'Solomon Hunt', 'Sales Associate', to_date('22-11-2021', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (510, 'Ewan Campbell', 'Manager', to_date('15-03-2022', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (511, 'Hazel Joli', 'Cashier', to_date('28-03-2022', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (512, 'Bob Driver', 'Cashier', to_date('13-02-2023', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (513, 'Kyle Iglesias', 'Sales Associate', to_date('28-09-2022', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (514, 'Juliana McConaughey', 'Product Manager', to_date('04-04-2023', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (515, 'Clive Driver', 'Sales Associate', to_date('06-02-2021', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (516, 'Donald Visnjic', 'Product Manager', to_date('11-12-2021', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (517, 'Stewart Shalhoub', 'Cashier', to_date('06-01-2020', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (518, 'Jann Arkenstone', 'Sales Associate', to_date('29-03-2022', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (519, 'Tramaine Solido', 'Sales Associate', to_date('29-08-2022', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (520, 'Pamela Crowe', 'Sales Associate', to_date('07-07-2021', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (521, 'Lorraine Diesel', 'Manager', to_date('15-06-2020', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (522, 'Dwight Uggams', 'Product Manager', to_date('05-05-2022', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (523, 'Max Adkins', 'Product Manager', to_date('12-01-2021', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (524, 'Jake Neil', 'Product Manager', to_date('12-08-2023', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (525, 'Gin Pitney', 'Product Manager', to_date('01-07-2020', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (526, 'Elisabeth Gleeson', 'Cashier', to_date('19-11-2023', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (527, 'Melba Macy', 'Product Manager', to_date('28-11-2023', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (528, 'Chanté Neill', 'Manager', to_date('09-01-2021', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (529, 'Maureen Winslet', 'Cashier', to_date('07-01-2022', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (530, 'Larry Gryner', 'Manager', to_date('23-01-2020', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (531, 'Jeroen Shaw', 'Sales Associate', to_date('14-04-2020', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (532, 'Ike Sedaka', 'Manager', to_date('20-04-2021', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (533, 'Gran Belles', 'Cashier', to_date('01-02-2020', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (534, 'Mena Kurtz', 'Manager', to_date('12-09-2020', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (535, 'Forest Bogguss', 'Cashier', to_date('26-03-2020', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (536, 'Alex Ifans', 'Product Manager', to_date('25-06-2022', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (537, 'Lisa Masur', 'Manager', to_date('16-09-2022', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (538, 'Freda Camp', 'Sales Associate', to_date('02-01-2020', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (539, 'Vincent Vaughn', 'Product Manager', to_date('23-08-2022', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (540, 'Rosco Taha', 'Sales Associate', to_date('14-11-2020', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (541, 'Celia Dillane', 'Product Manager', to_date('01-08-2022', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (542, 'Christine Wills', 'Sales Associate', to_date('22-04-2020', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (543, 'Geoffrey Shawn', 'Manager', to_date('18-12-2022', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (544, 'Harry Brando', 'Manager', to_date('10-10-2022', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (545, 'Ivan Garber', 'Manager', to_date('08-11-2020', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (546, 'Grace Lopez', 'Manager', to_date('29-10-2023', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (547, 'Chet Hudson', 'Cashier', to_date('17-12-2020', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (548, 'Marina Vaughan', 'Manager', to_date('31-03-2020', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (549, 'Uma Avital', 'Manager', to_date('08-11-2022', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (550, 'Fats Kershaw', 'Sales Associate', to_date('26-05-2020', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (551, 'Oded Bridges', 'Manager', to_date('21-06-2020', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (552, 'Lindsay Rain', 'Manager', to_date('08-11-2022', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (553, 'Curtis Weisberg', 'Product Manager', to_date('09-11-2021', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (554, 'France Bridges', 'Product Manager', to_date('01-04-2023', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (555, 'Kurtwood Fender', 'Sales Associate', to_date('24-02-2021', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (556, 'Anna Numan', 'Cashier', to_date('30-05-2021', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (557, 'Chi Mandrell', 'Product Manager', to_date('30-10-2022', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (558, 'Gary Rowlands', 'Manager', to_date('20-09-2020', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (559, 'Alfie Benson', 'Sales Associate', to_date('18-03-2022', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (560, 'Ernest Chinlund', 'Manager', to_date('26-09-2023', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (561, 'Bobbi Magnuson', 'Product Manager', to_date('06-03-2022', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (562, 'Machine Horton', 'Cashier', to_date('18-01-2020', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (563, 'Crystal Holiday', 'Sales Associate', to_date('10-03-2022', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (564, 'Nigel Hidalgo', 'Product Manager', to_date('29-05-2022', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (565, 'Collin Haggard', 'Manager', to_date('02-07-2023', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (566, 'Gwyneth Spears', 'Manager', to_date('01-02-2023', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (567, 'Harold Schneider', 'Manager', to_date('06-09-2022', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (568, 'Kurtwood Robards', 'Cashier', to_date('02-07-2022', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (569, 'Ewan McLachlan', 'Sales Associate', to_date('04-05-2021', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (570, 'Kirsten Ferrell', 'Product Manager', to_date('26-01-2022', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (571, 'Roscoe Mann', 'Cashier', to_date('11-02-2020', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (572, 'King Cooper', 'Manager', to_date('06-05-2021', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (573, 'Lena Herrmann', 'Product Manager', to_date('02-12-2020', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (574, 'Graham Rudd', 'Product Manager', to_date('15-05-2023', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (575, 'Junior Feuerstein', 'Cashier', to_date('17-06-2021', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (576, 'Merillee Neil', 'Manager', to_date('13-04-2020', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (577, 'Carlos Williamson', 'Cashier', to_date('04-12-2021', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (578, 'Colm Moffat', 'Cashier', to_date('22-03-2023', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (579, 'Morgan Hawkins', 'Product Manager', to_date('09-01-2020', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (580, 'Petula Michael', 'Product Manager', to_date('26-05-2020', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (581, 'Samantha Whitmore', 'Product Manager', to_date('18-03-2022', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (582, 'Beverley Sanchez', 'Sales Associate', to_date('03-07-2023', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (583, 'Natasha Hatosy', 'Cashier', to_date('05-03-2023', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (584, 'Eric Khan', 'Manager', to_date('16-04-2022', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (585, 'Tyrone Wagner', 'Product Manager', to_date('01-08-2021', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (586, 'Kieran Irons', 'Sales Associate', to_date('20-06-2023', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (587, 'Louise Jovovich', 'Sales Associate', to_date('02-02-2020', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (588, 'Viggo Weisz', 'Manager', to_date('20-10-2021', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (589, 'Owen Rucker', 'Product Manager', to_date('17-07-2021', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (590, 'Carlos Drive', 'Manager', to_date('30-06-2023', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (591, 'Roy Shatner', 'Cashier', to_date('08-07-2021', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (592, 'Joan McNeice', 'Cashier', to_date('14-10-2021', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (593, 'Dennis Cleary', 'Manager', to_date('10-01-2021', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (594, 'Ernie Watson', 'Manager', to_date('03-11-2020', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (595, 'Wade Cruz', 'Cashier', to_date('13-07-2023', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (596, 'Benicio Cherry', 'Sales Associate', to_date('07-11-2023', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (597, 'Tzi Warburton', 'Cashier', to_date('01-03-2020', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (598, 'Teri Parsons', 'Product Manager', to_date('26-05-2021', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (599, 'Greg DiFranco', 'Sales Associate', to_date('03-04-2023', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (600, 'Johnny Arjona', 'Manager', to_date('06-02-2020', 'dd-mm-yyyy'));
commit;
prompt 200 records committed...
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (601, 'Kathy Page', 'Cashier', to_date('11-01-2020', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (602, 'Bill Kravitz', 'Sales Associate', to_date('09-06-2023', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (603, 'Rosanne Wells', 'Sales Associate', to_date('20-08-2022', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (604, 'Franz Quatro', 'Sales Associate', to_date('24-11-2020', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (605, 'Gene Weaving', 'Product Manager', to_date('18-05-2022', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (606, 'Nora Price', 'Cashier', to_date('06-05-2021', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (607, 'Garth Conners', 'Cashier', to_date('12-03-2020', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (608, 'Wang Gibson', 'Manager', to_date('14-08-2022', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (609, 'Heath Van Damme', 'Cashier', to_date('02-06-2021', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (610, 'Frederic Leoni', 'Cashier', to_date('28-05-2021', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (611, 'Nicky Weaving', 'Product Manager', to_date('05-10-2022', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (612, 'Dianne Thomas', 'Product Manager', to_date('17-05-2023', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (613, 'Rebeka Peebles', 'Cashier', to_date('20-07-2023', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (614, 'Maggie Collins', 'Manager', to_date('09-07-2021', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (615, 'Gaby Ball', 'Sales Associate', to_date('25-03-2021', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (616, 'Victoria Slater', 'Manager', to_date('17-10-2022', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (617, 'Lauren Redford', 'Product Manager', to_date('07-02-2023', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (618, 'Dick Neville', 'Cashier', to_date('21-12-2022', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (619, 'Radney Feuerstein', 'Manager', to_date('25-04-2022', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (620, 'Rachel Koyana', 'Product Manager', to_date('04-10-2021', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (621, 'Eileen Hughes', 'Cashier', to_date('09-02-2022', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (622, 'Karen Webb', 'Manager', to_date('03-03-2022', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (623, 'Lara Chapman', 'Product Manager', to_date('19-04-2020', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (624, 'Ossie Holy', 'Sales Associate', to_date('22-02-2022', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (625, 'Rebeka Glover', 'Manager', to_date('13-01-2022', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (626, 'Tracy Murray', 'Product Manager', to_date('30-05-2022', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (627, 'Patricia Zahn', 'Sales Associate', to_date('11-10-2020', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (628, 'Bobby Whitman', 'Cashier', to_date('06-08-2022', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (629, 'Selma Shocked', 'Cashier', to_date('19-07-2023', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (630, 'Cary Choice', 'Cashier', to_date('11-08-2021', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (631, 'Peabo Pearce', 'Manager', to_date('30-05-2020', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (632, 'Taryn Molina', 'Cashier', to_date('01-04-2022', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (633, 'Terri Gleeson', 'Product Manager', to_date('30-03-2022', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (634, 'Frances Hall', 'Manager', to_date('26-01-2020', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (635, 'Terri Wahlberg', 'Cashier', to_date('07-09-2022', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (636, 'Ramsey Kattan', 'Cashier', to_date('01-07-2020', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (637, 'Naomi Weiland', 'Product Manager', to_date('01-06-2020', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (638, 'Ben Wilson', 'Cashier', to_date('19-03-2020', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (639, 'Embeth Rivers', 'Cashier', to_date('21-08-2021', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (640, 'Joely Mould', 'Sales Associate', to_date('28-09-2020', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (641, 'Suzanne Rea', 'Cashier', to_date('22-10-2022', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (642, 'Beth Thorton', 'Product Manager', to_date('08-05-2022', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (643, 'Courtney Utada', 'Manager', to_date('21-08-2021', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (644, 'Morgan Puckett', 'Cashier', to_date('19-02-2022', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (645, 'Viggo Dooley', 'Cashier', to_date('04-05-2020', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (646, 'Noah Rourke', 'Product Manager', to_date('01-06-2020', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (647, 'Barbara Gosdin', 'Cashier', to_date('10-02-2021', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (648, 'Nancy Emmerich', 'Product Manager', to_date('02-05-2023', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (649, 'Nicole Valentin', 'Sales Associate', to_date('18-11-2021', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (650, 'Roberta Haslam', 'Manager', to_date('22-09-2021', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (651, 'Alicia Mollard', 'Product Manager', to_date('20-04-2020', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (652, 'Allan Clayton', 'Sales Associate', to_date('30-03-2022', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (653, 'Will MacLachlan', 'Cashier', to_date('28-12-2021', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (654, 'Ernie Belushi', 'Cashier', to_date('20-09-2022', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (655, 'Madeleine Garcia', 'Product Manager', to_date('08-01-2021', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (656, 'Courtney Azaria', 'Manager', to_date('13-10-2023', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (657, 'Jeffrey Paltrow', 'Product Manager', to_date('02-09-2020', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (658, 'Susan Chappelle', 'Cashier', to_date('21-09-2020', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (659, 'Jesse McGovern', 'Sales Associate', to_date('27-05-2022', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (660, 'Geraldine Salt', 'Product Manager', to_date('14-08-2023', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (661, 'Carole Borgnine', 'Manager', to_date('11-02-2023', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (662, 'Salma Janney', 'Manager', to_date('07-09-2021', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (663, 'Vivica Jeter', 'Product Manager', to_date('19-08-2020', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (664, 'Toni Zevon', 'Product Manager', to_date('02-12-2023', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (665, 'Domingo Condition', 'Product Manager', to_date('15-06-2023', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (666, 'Larnelle Navarro', 'Manager', to_date('09-12-2023', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (667, 'Beth Flanagan', 'Sales Associate', to_date('22-09-2020', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (668, 'Judd Folds', 'Cashier', to_date('11-02-2021', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (669, 'Rosco Kattan', 'Sales Associate', to_date('06-07-2020', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (670, 'Dustin Presley', 'Product Manager', to_date('08-12-2021', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (671, 'Rosanna Hagar', 'Product Manager', to_date('05-04-2020', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (672, 'Coley Van Der Beek', 'Cashier', to_date('19-08-2021', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (673, 'Harrison Wills', 'Product Manager', to_date('23-07-2021', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (674, 'Robbie Judd', 'Cashier', to_date('09-01-2022', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (675, 'Buffy Buckingham', 'Product Manager', to_date('15-02-2021', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (676, 'Melba Austin', 'Product Manager', to_date('28-08-2021', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (677, 'Marianne Pitney', 'Cashier', to_date('19-01-2022', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (678, 'Diamond Saucedo', 'Sales Associate', to_date('01-03-2022', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (679, 'Hilton Nash', 'Sales Associate', to_date('15-04-2021', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (680, 'Lari Curfman', 'Manager', to_date('16-11-2022', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (681, 'Catherine Balaban', 'Cashier', to_date('22-05-2021', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (682, 'Lea Giannini', 'Cashier', to_date('14-09-2023', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (683, 'Gailard Dean', 'Manager', to_date('08-07-2022', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (684, 'George Torino', 'Sales Associate', to_date('25-03-2020', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (685, 'Brendan Cruz', 'Sales Associate', to_date('30-08-2022', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (686, 'Geggy Raybon', 'Product Manager', to_date('10-02-2023', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (687, 'Juice Parm', 'Sales Associate', to_date('27-02-2022', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (688, 'Tracy Stiller', 'Sales Associate', to_date('31-08-2021', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (689, 'Terry Pigott-Smith', 'Product Manager', to_date('27-05-2020', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (690, 'Juan Collette', 'Sales Associate', to_date('01-10-2023', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (691, 'Austin Scheider', 'Manager', to_date('14-11-2020', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (692, 'Ivan Madsen', 'Manager', to_date('18-11-2023', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (693, 'Veruca Remar', 'Product Manager', to_date('03-05-2020', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (694, 'Stewart Raybon', 'Manager', to_date('06-08-2023', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (695, 'Kathy Sherman', 'Sales Associate', to_date('20-05-2022', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (696, 'Melanie McDiarmid', 'Cashier', to_date('29-01-2020', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (697, 'Dan Plimpton', 'Manager', to_date('16-02-2023', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (698, 'Carol Weir', 'Manager', to_date('05-01-2023', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (699, 'Drew Squier', 'Manager', to_date('25-03-2021', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (700, 'Angie Crow', 'Product Manager', to_date('18-09-2023', 'dd-mm-yyyy'));
commit;
prompt 300 records committed...
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (701, 'Veruca Llewelyn', 'Sales Associate', to_date('17-02-2020', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (702, 'Burton Cervine', 'Product Manager', to_date('27-06-2020', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (703, 'Ivan Feuerstein', 'Sales Associate', to_date('11-07-2022', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (704, 'Delroy Ontiveros', 'Sales Associate', to_date('02-04-2020', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (705, 'Kylie Coolidge', 'Cashier', to_date('21-02-2021', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (706, 'Ruth Stevens', 'Manager', to_date('24-05-2020', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (707, 'Jackson Feuerstein', 'Manager', to_date('11-09-2021', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (708, 'Oded Quinlan', 'Sales Associate', to_date('27-11-2022', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (709, 'Tony Buffalo', 'Sales Associate', to_date('25-02-2022', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (710, 'Alfie Holiday', 'Sales Associate', to_date('23-09-2020', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (711, 'Petula Cozier', 'Cashier', to_date('23-03-2020', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (712, 'Marina Benson', 'Manager', to_date('23-05-2020', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (713, 'Latin Myers', 'Sales Associate', to_date('04-02-2021', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (714, 'Robby Crimson', 'Manager', to_date('12-11-2020', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (715, 'Martin Vai', 'Cashier', to_date('05-06-2021', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (716, 'Emma O''Sullivan', 'Cashier', to_date('07-09-2020', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (717, 'Robin Jackson', 'Cashier', to_date('04-08-2021', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (718, 'Jodie Coverdale', 'Sales Associate', to_date('25-04-2021', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (719, 'Meryl Leachman', 'Sales Associate', to_date('04-03-2022', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (720, 'Armand Gryner', 'Product Manager', to_date('06-10-2022', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (721, 'Tony Wincott', 'Manager', to_date('13-09-2020', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (722, 'Anjelica Harry', 'Product Manager', to_date('16-06-2023', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (723, 'Larry Hutton', 'Manager', to_date('27-08-2020', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (724, 'Stockard Conway', 'Cashier', to_date('09-05-2020', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (725, 'Lindsay Thewlis', 'Product Manager', to_date('07-09-2020', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (726, 'Bryan Davidson', 'Product Manager', to_date('23-04-2021', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (727, 'Roberta Carter', 'Cashier', to_date('16-02-2020', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (728, 'Brothers Scott', 'Sales Associate', to_date('10-09-2021', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (729, 'Julio Leary', 'Cashier', to_date('25-09-2020', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (730, 'Hikaru Ammons', 'Sales Associate', to_date('05-04-2021', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (731, 'Jamie Hershey', 'Sales Associate', to_date('31-08-2020', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (732, 'Allan Bergen', 'Manager', to_date('07-04-2021', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (733, 'Fionnula Cummings', 'Sales Associate', to_date('26-09-2020', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (734, 'Jonny Hidalgo', 'Manager', to_date('01-11-2021', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (735, 'Keanu Soda', 'Manager', to_date('28-11-2022', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (736, 'Morgan Elizabeth', 'Sales Associate', to_date('28-07-2023', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (737, 'Bob Trejo', 'Manager', to_date('08-01-2021', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (738, 'Keanu Scheider', 'Manager', to_date('07-06-2021', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (739, 'Barry Fonda', 'Cashier', to_date('23-10-2023', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (740, 'Karen Ripley', 'Sales Associate', to_date('06-11-2022', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (741, 'Chalee Ledger', 'Manager', to_date('11-02-2022', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (742, 'Steve Sartain', 'Product Manager', to_date('30-01-2022', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (743, 'Marc Freeman', 'Sales Associate', to_date('24-05-2020', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (744, 'Yolanda Duvall', 'Product Manager', to_date('06-11-2022', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (745, 'Merrilee Edmunds', 'Product Manager', to_date('21-06-2020', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (746, 'Tea Moorer', 'Manager', to_date('10-03-2021', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (747, 'Steven Lewis', 'Cashier', to_date('03-07-2021', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (748, 'Joanna Gunton', 'Cashier', to_date('30-07-2020', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (749, 'Gene Galecki', 'Sales Associate', to_date('31-03-2020', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (750, 'Kazem Maxwell', 'Sales Associate', to_date('19-04-2023', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (751, 'Lee Burrows', 'Cashier', to_date('16-07-2023', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (752, 'Marina Walker', 'Product Manager', to_date('16-01-2022', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (753, 'Curt Belle', 'Manager', to_date('13-01-2021', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (754, 'Tea Keith', 'Sales Associate', to_date('25-10-2023', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (755, 'Scott Ermey', 'Cashier', to_date('21-03-2022', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (756, 'Guy McNarland', 'Sales Associate', to_date('03-01-2022', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (757, 'Cledus Matarazzo', 'Sales Associate', to_date('16-08-2021', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (758, 'Gene Belles', 'Manager', to_date('16-10-2020', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (759, 'Gilbert Ontiveros', 'Sales Associate', to_date('03-05-2020', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (760, 'Janeane Bullock', 'Product Manager', to_date('25-09-2023', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (761, 'Rutger Capshaw', 'Manager', to_date('28-09-2023', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (762, 'Ming-Na Koteas', 'Sales Associate', to_date('26-08-2022', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (763, 'King Reeve', 'Product Manager', to_date('02-07-2023', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (764, 'Allison Shepherd', 'Manager', to_date('28-09-2022', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (765, 'Austin Magnuson', 'Product Manager', to_date('21-10-2023', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (766, 'Claude Pleasure', 'Product Manager', to_date('11-12-2023', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (767, 'Lizzy Gano', 'Manager', to_date('15-11-2023', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (768, 'Mary Cornell', 'Manager', to_date('22-07-2022', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (769, 'Patricia Pryce', 'Product Manager', to_date('03-09-2020', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (770, 'Chris Weaver', 'Cashier', to_date('07-02-2021', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (771, 'Andie Warden', 'Product Manager', to_date('11-12-2023', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (772, 'LeVar Belushi', 'Manager', to_date('15-06-2022', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (773, 'Jesus Whitmore', 'Product Manager', to_date('27-05-2023', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (774, 'Molly Cassidy', 'Product Manager', to_date('10-03-2020', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (775, 'Jeanne Garfunkel', 'Cashier', to_date('07-04-2020', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (776, 'Ramsey Dreyfuss', 'Product Manager', to_date('20-03-2021', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (777, 'Cheech Lawrence', 'Sales Associate', to_date('24-12-2022', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (778, 'Cyndi Fisher', 'Manager', to_date('22-08-2020', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (779, 'Bette Secada', 'Product Manager', to_date('19-03-2023', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (780, 'Jean-Luc Vicious', 'Manager', to_date('16-11-2020', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (781, 'Stanley Ticotin', 'Manager', to_date('04-02-2020', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (782, 'Gabrielle Boyle', 'Cashier', to_date('10-01-2023', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (783, 'Mickey Sampson', 'Cashier', to_date('19-09-2020', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (784, 'Nora Bancroft', 'Cashier', to_date('24-06-2022', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (785, 'Jaime Lachey', 'Product Manager', to_date('14-11-2020', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (786, 'Jared Browne', 'Manager', to_date('16-10-2020', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (787, 'Vertical Cleary', 'Cashier', to_date('13-01-2022', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (788, 'James Reilly', 'Product Manager', to_date('23-10-2021', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (789, 'Wayne Sherman', 'Cashier', to_date('17-08-2020', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (790, 'Hugo Idol', 'Sales Associate', to_date('07-01-2020', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (791, 'Lili Quaid', 'Manager', to_date('26-06-2021', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (792, 'Mint Thompson', 'Product Manager', to_date('03-03-2021', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (793, 'Tony Bush', 'Sales Associate', to_date('15-08-2023', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (794, 'Fionnula Bassett', 'Cashier', to_date('26-02-2023', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (795, 'Kyra Peniston', 'Product Manager', to_date('15-03-2022', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (796, 'Mary-Louise Humphrey', 'Sales Associate', to_date('08-02-2021', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (797, 'Jill Moraz', 'Cashier', to_date('20-10-2022', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (798, 'April Davis', 'Sales Associate', to_date('14-10-2020', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (799, 'Bill Banderas', 'Sales Associate', to_date('20-11-2023', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (800, 'Cheech Sharp', 'Cashier', to_date('06-03-2020', 'dd-mm-yyyy'));
commit;
prompt 400 records loaded
prompt Loading PRODUCTS...
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10000, 'Sports Shoes', 481, 'Sports Equipment');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10001, 'Phone', 294, 'Beauty');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10002, 'Phone', 346, 'Pet Supplies');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10003, 'Sports Shoes', 88, 'Sports Equipment');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10004, 'Sports Shoes', 79, 'Electronics');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10005, 'Dog Food', 319, 'Pet Supplies');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10006, 'Phone', 141, 'Electronics');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10007, 'Dog Food', 209, 'Beauty');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10008, 'Skin Care', 483, 'Electronics');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10009, 'Phone', 309, 'Beauty');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10010, 'Skin Care', 299, 'Pet Supplies');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10011, 'Skin Care', 64, 'Beauty');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10012, 'Dog Food', 464, 'Pet Supplies');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10013, 'Laptop', 87, 'Beauty');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10014, 'Skin Care', 110, 'Sports Equipment');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10015, 'Skin Care', 269, 'Beauty');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10016, 'Phone', 20, 'Pet Supplies');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10017, 'Dog Food', 18, 'Sports Equipment');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10018, 'Phone', 118, 'Beauty');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10019, 'Sports Shoes', 111, 'Sports Equipment');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10020, 'Laptop', 393, 'Pet Supplies');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10021, 'Dog Food', 52, 'Pet Supplies');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10022, 'Phone', 406, 'Electronics');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10023, 'Sports Shoes', 250, 'Pet Supplies');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10024, 'Dog Food', 393, 'Sports Equipment');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10025, 'Skin Care', 483, 'Beauty');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10026, 'Laptop', 190, 'Sports Equipment');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10027, 'Sports Shoes', 310, 'Electronics');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10028, 'Sports Shoes', 218, 'Sports Equipment');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10029, 'Dog Food', 154, 'Sports Equipment');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10030, 'Laptop', 205, 'Beauty');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10031, 'Dog Food', 197, 'Electronics');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10032, 'Skin Care', 74, 'Beauty');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10033, 'Dog Food', 258, 'Beauty');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10034, 'Sports Shoes', 158, 'Pet Supplies');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10035, 'Skin Care', 321, 'Beauty');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10036, 'Skin Care', 174, 'Beauty');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10037, 'Phone', 397, 'Pet Supplies');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10038, 'Phone', 335, 'Electronics');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10039, 'Dog Food', 457, 'Beauty');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10040, 'Phone', 460, 'Electronics');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10041, 'Sports Shoes', 175, 'Sports Equipment');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10042, 'Laptop', 379, 'Sports Equipment');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10043, 'Dog Food', 43, 'Sports Equipment');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10044, 'Laptop', 492, 'Beauty');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10045, 'Phone', 132, 'Electronics');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10046, 'Sports Shoes', 149, 'Sports Equipment');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10047, 'Laptop', 390, 'Electronics');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10048, 'Laptop', 58, 'Beauty');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10049, 'Skin Care', 311, 'Sports Equipment');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10050, 'Skin Care', 346, 'Electronics');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10051, 'Skin Care', 53, 'Electronics');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10052, 'Skin Care', 203, 'Electronics');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10053, 'Laptop', 319, 'Sports Equipment');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10054, 'Phone', 198, 'Beauty');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10055, 'Skin Care', 296, 'Sports Equipment');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10056, 'Phone', 104, 'Pet Supplies');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10057, 'Phone', 424, 'Sports Equipment');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10058, 'Laptop', 454, 'Electronics');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10059, 'Dog Food', 359, 'Beauty');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10060, 'Phone', 500, 'Pet Supplies');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10061, 'Dog Food', 413, 'Beauty');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10062, 'Sports Shoes', 386, 'Pet Supplies');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10063, 'Sports Shoes', 190, 'Electronics');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10064, 'Sports Shoes', 36, 'Pet Supplies');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10065, 'Dog Food', 418, 'Pet Supplies');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10066, 'Sports Shoes', 234, 'Pet Supplies');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10067, 'Laptop', 420, 'Pet Supplies');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10068, 'Sports Shoes', 405, 'Beauty');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10069, 'Sports Shoes', 199, 'Pet Supplies');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10070, 'Phone', 497, 'Sports Equipment');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10071, 'Dog Food', 314, 'Beauty');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10072, 'Skin Care', 472, 'Pet Supplies');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10073, 'Dog Food', 347, 'Electronics');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10074, 'Dog Food', 428, 'Beauty');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10075, 'Phone', 406, 'Beauty');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10076, 'Sports Shoes', 448, 'Sports Equipment');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10077, 'Sports Shoes', 179, 'Beauty');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10078, 'Phone', 134, 'Electronics');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10079, 'Dog Food', 467, 'Pet Supplies');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10080, 'Laptop', 463, 'Beauty');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10081, 'Dog Food', 451, 'Electronics');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10082, 'Phone', 58, 'Pet Supplies');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10083, 'Laptop', 297, 'Sports Equipment');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10084, 'Laptop', 114, 'Electronics');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10085, 'Skin Care', 24, 'Pet Supplies');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10086, 'Skin Care', 36, 'Sports Equipment');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10087, 'Skin Care', 87, 'Beauty');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10088, 'Skin Care', 292, 'Beauty');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10089, 'Dog Food', 240, 'Pet Supplies');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10090, 'Sports Shoes', 279, 'Pet Supplies');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10091, 'Laptop', 234, 'Electronics');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10092, 'Laptop', 347, 'Beauty');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10093, 'Laptop', 13, 'Beauty');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10094, 'Skin Care', 364, 'Pet Supplies');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10095, 'Dog Food', 91, 'Beauty');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10096, 'Phone', 497, 'Electronics');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10097, 'Laptop', 64, 'Beauty');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10098, 'Laptop', 282, 'Beauty');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10099, 'Sports Shoes', 157, 'Pet Supplies');
commit;
prompt 100 records committed...
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10100, 'Laptop', 325, 'Electronics');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10101, 'Phone', 31, 'Electronics');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10102, 'Phone', 365, 'Sports Equipment');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10103, 'Dog Food', 84, 'Sports Equipment');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10104, 'Dog Food', 77, 'Beauty');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10105, 'Phone', 257, 'Electronics');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10106, 'Skin Care', 471, 'Pet Supplies');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10107, 'Dog Food', 220, 'Sports Equipment');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10108, 'Laptop', 278, 'Beauty');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10109, 'Dog Food', 89, 'Pet Supplies');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10110, 'Sports Shoes', 393, 'Electronics');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10111, 'Dog Food', 255, 'Sports Equipment');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10112, 'Dog Food', 237, 'Pet Supplies');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10113, 'Phone', 317, 'Sports Equipment');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10114, 'Dog Food', 150, 'Beauty');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10115, 'Dog Food', 499, 'Pet Supplies');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10116, 'Phone', 35, 'Beauty');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10117, 'Dog Food', 368, 'Electronics');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10118, 'Skin Care', 414, 'Pet Supplies');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10119, 'Phone', 113, 'Pet Supplies');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10120, 'Sports Shoes', 441, 'Sports Equipment');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10121, 'Dog Food', 73, 'Pet Supplies');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10122, 'Phone', 20, 'Sports Equipment');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10123, 'Sports Shoes', 479, 'Beauty');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10124, 'Laptop', 186, 'Beauty');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10125, 'Phone', 323, 'Pet Supplies');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10126, 'Laptop', 368, 'Electronics');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10127, 'Dog Food', 456, 'Electronics');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10128, 'Dog Food', 17, 'Beauty');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10129, 'Phone', 398, 'Sports Equipment');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10130, 'Phone', 174, 'Electronics');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10131, 'Sports Shoes', 294, 'Sports Equipment');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10132, 'Phone', 448, 'Electronics');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10133, 'Dog Food', 266, 'Sports Equipment');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10134, 'Laptop', 450, 'Electronics');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10135, 'Phone', 201, 'Beauty');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10136, 'Skin Care', 406, 'Beauty');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10137, 'Sports Shoes', 19, 'Beauty');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10138, 'Phone', 451, 'Pet Supplies');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10139, 'Phone', 282, 'Pet Supplies');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10140, 'Sports Shoes', 151, 'Electronics');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10141, 'Phone', 38, 'Electronics');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10142, 'Laptop', 314, 'Beauty');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10143, 'Sports Shoes', 371, 'Pet Supplies');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10144, 'Phone', 196, 'Electronics');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10145, 'Sports Shoes', 224, 'Electronics');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10146, 'Dog Food', 204, 'Beauty');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10147, 'Laptop', 320, 'Electronics');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10148, 'Laptop', 344, 'Sports Equipment');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10149, 'Laptop', 161, 'Pet Supplies');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10150, 'Laptop', 145, 'Electronics');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10151, 'Phone', 15, 'Pet Supplies');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10152, 'Sports Shoes', 137, 'Beauty');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10153, 'Skin Care', 255, 'Sports Equipment');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10154, 'Laptop', 434, 'Sports Equipment');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10155, 'Skin Care', 421, 'Electronics');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10156, 'Skin Care', 174, 'Pet Supplies');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10157, 'Skin Care', 81, 'Beauty');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10158, 'Dog Food', 170, 'Electronics');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10159, 'Phone', 251, 'Sports Equipment');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10160, 'Dog Food', 446, 'Beauty');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10161, 'Dog Food', 112, 'Sports Equipment');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10162, 'Dog Food', 434, 'Electronics');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10163, 'Phone', 130, 'Pet Supplies');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10164, 'Skin Care', 281, 'Beauty');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10165, 'Phone', 366, 'Sports Equipment');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10166, 'Dog Food', 77, 'Electronics');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10167, 'Sports Shoes', 245, 'Pet Supplies');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10168, 'Laptop', 234, 'Beauty');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10169, 'Phone', 430, 'Pet Supplies');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10170, 'Skin Care', 226, 'Pet Supplies');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10171, 'Skin Care', 168, 'Electronics');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10172, 'Phone', 457, 'Pet Supplies');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10173, 'Dog Food', 28, 'Electronics');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10174, 'Laptop', 304, 'Sports Equipment');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10175, 'Skin Care', 340, 'Beauty');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10176, 'Laptop', 32, 'Sports Equipment');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10177, 'Laptop', 433, 'Sports Equipment');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10178, 'Phone', 456, 'Electronics');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10179, 'Laptop', 412, 'Sports Equipment');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10180, 'Laptop', 415, 'Pet Supplies');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10181, 'Laptop', 250, 'Sports Equipment');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10182, 'Laptop', 291, 'Sports Equipment');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10183, 'Sports Shoes', 54, 'Pet Supplies');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10184, 'Laptop', 46, 'Sports Equipment');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10185, 'Phone', 328, 'Sports Equipment');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10186, 'Phone', 233, 'Pet Supplies');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10187, 'Dog Food', 130, 'Sports Equipment');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10188, 'Laptop', 201, 'Beauty');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10189, 'Phone', 303, 'Pet Supplies');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10190, 'Skin Care', 76, 'Electronics');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10191, 'Laptop', 291, 'Beauty');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10192, 'Skin Care', 50, 'Beauty');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10193, 'Laptop', 300, 'Sports Equipment');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10194, 'Laptop', 272, 'Beauty');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10195, 'Phone', 443, 'Beauty');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10196, 'Dog Food', 288, 'Sports Equipment');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10197, 'Laptop', 351, 'Electronics');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10198, 'Laptop', 326, 'Sports Equipment');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10199, 'Phone', 422, 'Beauty');
commit;
prompt 200 records committed...
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10200, 'Phone', 401, 'Pet Supplies');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10201, 'Laptop', 23, 'Pet Supplies');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10202, 'Phone', 59, 'Electronics');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10203, 'Phone', 196, 'Beauty');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10204, 'Laptop', 339, 'Pet Supplies');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10205, 'Skin Care', 371, 'Beauty');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10206, 'Skin Care', 318, 'Beauty');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10207, 'Skin Care', 59, 'Electronics');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10208, 'Phone', 270, 'Pet Supplies');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10209, 'Phone', 170, 'Electronics');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10210, 'Sports Shoes', 322, 'Pet Supplies');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10211, 'Dog Food', 451, 'Electronics');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10212, 'Dog Food', 87, 'Beauty');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10213, 'Skin Care', 77, 'Sports Equipment');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10214, 'Phone', 232, 'Beauty');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10215, 'Sports Shoes', 130, 'Beauty');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10216, 'Skin Care', 444, 'Beauty');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10217, 'Skin Care', 27, 'Sports Equipment');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10218, 'Dog Food', 498, 'Pet Supplies');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10219, 'Sports Shoes', 421, 'Sports Equipment');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10220, 'Sports Shoes', 376, 'Electronics');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10221, 'Skin Care', 357, 'Sports Equipment');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10222, 'Dog Food', 426, 'Pet Supplies');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10223, 'Dog Food', 295, 'Electronics');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10224, 'Sports Shoes', 388, 'Beauty');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10225, 'Skin Care', 39, 'Electronics');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10226, 'Laptop', 43, 'Beauty');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10227, 'Laptop', 53, 'Electronics');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10228, 'Skin Care', 423, 'Pet Supplies');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10229, 'Skin Care', 312, 'Beauty');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10230, 'Sports Shoes', 107, 'Pet Supplies');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10231, 'Dog Food', 83, 'Beauty');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10232, 'Skin Care', 372, 'Sports Equipment');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10233, 'Dog Food', 469, 'Beauty');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10234, 'Skin Care', 131, 'Sports Equipment');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10235, 'Phone', 448, 'Beauty');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10236, 'Skin Care', 140, 'Electronics');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10237, 'Dog Food', 224, 'Electronics');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10238, 'Dog Food', 348, 'Sports Equipment');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10239, 'Laptop', 295, 'Pet Supplies');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10240, 'Phone', 310, 'Pet Supplies');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10241, 'Laptop', 81, 'Sports Equipment');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10242, 'Dog Food', 358, 'Sports Equipment');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10243, 'Phone', 123, 'Pet Supplies');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10244, 'Sports Shoes', 160, 'Electronics');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10245, 'Laptop', 134, 'Beauty');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10246, 'Sports Shoes', 125, 'Electronics');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10247, 'Laptop', 274, 'Beauty');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10248, 'Laptop', 232, 'Sports Equipment');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10249, 'Phone', 260, 'Electronics');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10250, 'Skin Care', 262, 'Pet Supplies');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10251, 'Laptop', 397, 'Pet Supplies');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10252, 'Dog Food', 53, 'Beauty');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10253, 'Dog Food', 414, 'Beauty');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10254, 'Sports Shoes', 128, 'Sports Equipment');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10255, 'Phone', 358, 'Electronics');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10256, 'Dog Food', 418, 'Electronics');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10257, 'Sports Shoes', 316, 'Sports Equipment');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10258, 'Sports Shoes', 263, 'Beauty');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10259, 'Laptop', 246, 'Pet Supplies');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10260, 'Skin Care', 124, 'Beauty');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10261, 'Laptop', 406, 'Electronics');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10262, 'Dog Food', 84, 'Beauty');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10263, 'Laptop', 183, 'Pet Supplies');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10264, 'Skin Care', 204, 'Sports Equipment');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10265, 'Skin Care', 195, 'Pet Supplies');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10266, 'Laptop', 45, 'Pet Supplies');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10267, 'Dog Food', 278, 'Beauty');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10268, 'Dog Food', 429, 'Pet Supplies');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10269, 'Phone', 39, 'Electronics');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10270, 'Laptop', 425, 'Electronics');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10271, 'Laptop', 224, 'Beauty');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10272, 'Skin Care', 386, 'Beauty');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10273, 'Phone', 266, 'Electronics');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10274, 'Dog Food', 301, 'Electronics');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10275, 'Sports Shoes', 102, 'Electronics');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10276, 'Dog Food', 431, 'Beauty');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10277, 'Laptop', 492, 'Sports Equipment');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10278, 'Laptop', 409, 'Sports Equipment');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10279, 'Sports Shoes', 157, 'Beauty');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10280, 'Dog Food', 377, 'Pet Supplies');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10281, 'Phone', 161, 'Pet Supplies');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10282, 'Skin Care', 438, 'Pet Supplies');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10283, 'Phone', 397, 'Sports Equipment');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10284, 'Sports Shoes', 277, 'Beauty');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10285, 'Dog Food', 471, 'Sports Equipment');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10286, 'Skin Care', 91, 'Electronics');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10287, 'Laptop', 457, 'Electronics');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10288, 'Dog Food', 425, 'Electronics');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10289, 'Sports Shoes', 98, 'Beauty');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10290, 'Laptop', 134, 'Electronics');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10291, 'Phone', 350, 'Beauty');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10292, 'Skin Care', 278, 'Pet Supplies');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10293, 'Skin Care', 372, 'Pet Supplies');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10294, 'Laptop', 227, 'Pet Supplies');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10295, 'Sports Shoes', 336, 'Sports Equipment');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10296, 'Dog Food', 53, 'Beauty');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10297, 'Skin Care', 273, 'Beauty');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10298, 'Skin Care', 305, 'Sports Equipment');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10299, 'Phone', 274, 'Electronics');
commit;
prompt 300 records committed...
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10300, 'Dog Food', 32, 'Pet Supplies');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10301, 'Dog Food', 93, 'Electronics');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10302, 'Laptop', 128, 'Pet Supplies');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10303, 'Dog Food', 383, 'Electronics');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10304, 'Skin Care', 97, 'Sports Equipment');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10305, 'Laptop', 281, 'Pet Supplies');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10306, 'Dog Food', 50, 'Electronics');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10307, 'Laptop', 87, 'Sports Equipment');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10308, 'Sports Shoes', 178, 'Sports Equipment');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10309, 'Phone', 308, 'Beauty');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10310, 'Sports Shoes', 335, 'Pet Supplies');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10311, 'Skin Care', 71, 'Pet Supplies');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10312, 'Laptop', 471, 'Pet Supplies');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10313, 'Phone', 42, 'Beauty');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10314, 'Laptop', 380, 'Pet Supplies');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10315, 'Dog Food', 31, 'Pet Supplies');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10316, 'Laptop', 356, 'Sports Equipment');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10317, 'Skin Care', 346, 'Beauty');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10318, 'Sports Shoes', 282, 'Electronics');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10319, 'Laptop', 458, 'Sports Equipment');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10320, 'Sports Shoes', 56, 'Pet Supplies');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10321, 'Laptop', 266, 'Electronics');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10322, 'Laptop', 496, 'Electronics');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10323, 'Sports Shoes', 191, 'Pet Supplies');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10324, 'Phone', 277, 'Electronics');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10325, 'Laptop', 15, 'Electronics');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10326, 'Skin Care', 295, 'Beauty');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10327, 'Skin Care', 285, 'Sports Equipment');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10328, 'Phone', 176, 'Electronics');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10329, 'Sports Shoes', 495, 'Pet Supplies');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10330, 'Laptop', 346, 'Electronics');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10331, 'Dog Food', 295, 'Pet Supplies');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10332, 'Laptop', 453, 'Pet Supplies');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10333, 'Phone', 484, 'Sports Equipment');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10334, 'Skin Care', 57, 'Pet Supplies');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10335, 'Skin Care', 209, 'Beauty');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10336, 'Dog Food', 368, 'Sports Equipment');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10337, 'Phone', 118, 'Beauty');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10338, 'Skin Care', 153, 'Electronics');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10339, 'Skin Care', 279, 'Pet Supplies');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10340, 'Phone', 134, 'Sports Equipment');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10341, 'Skin Care', 284, 'Pet Supplies');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10342, 'Laptop', 420, 'Sports Equipment');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10343, 'Dog Food', 437, 'Sports Equipment');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10344, 'Skin Care', 205, 'Beauty');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10345, 'Phone', 402, 'Electronics');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10346, 'Skin Care', 342, 'Beauty');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10347, 'Skin Care', 144, 'Sports Equipment');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10348, 'Sports Shoes', 308, 'Sports Equipment');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10349, 'Dog Food', 176, 'Sports Equipment');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10350, 'Dog Food', 215, 'Beauty');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10351, 'Sports Shoes', 109, 'Electronics');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10352, 'Skin Care', 287, 'Beauty');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10353, 'Laptop', 172, 'Beauty');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10354, 'Phone', 382, 'Sports Equipment');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10355, 'Skin Care', 94, 'Beauty');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10356, 'Laptop', 474, 'Electronics');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10357, 'Laptop', 193, 'Beauty');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10358, 'Sports Shoes', 334, 'Pet Supplies');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10359, 'Skin Care', 394, 'Electronics');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10360, 'Laptop', 437, 'Sports Equipment');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10361, 'Laptop', 354, 'Beauty');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10362, 'Skin Care', 10, 'Electronics');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10363, 'Laptop', 453, 'Electronics');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10364, 'Skin Care', 473, 'Pet Supplies');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10365, 'Skin Care', 154, 'Beauty');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10366, 'Skin Care', 356, 'Pet Supplies');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10367, 'Dog Food', 499, 'Beauty');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10368, 'Sports Shoes', 15, 'Pet Supplies');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10369, 'Phone', 209, 'Sports Equipment');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10370, 'Phone', 342, 'Sports Equipment');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10371, 'Phone', 392, 'Electronics');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10372, 'Phone', 24, 'Beauty');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10373, 'Sports Shoes', 205, 'Sports Equipment');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10374, 'Laptop', 480, 'Sports Equipment');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10375, 'Phone', 336, 'Pet Supplies');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10376, 'Skin Care', 355, 'Pet Supplies');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10377, 'Sports Shoes', 464, 'Sports Equipment');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10378, 'Sports Shoes', 491, 'Pet Supplies');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10379, 'Phone', 362, 'Beauty');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10380, 'Sports Shoes', 376, 'Sports Equipment');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10381, 'Laptop', 406, 'Sports Equipment');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10382, 'Sports Shoes', 422, 'Pet Supplies');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10383, 'Sports Shoes', 26, 'Electronics');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10384, 'Laptop', 475, 'Sports Equipment');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10385, 'Skin Care', 97, 'Pet Supplies');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10386, 'Phone', 462, 'Pet Supplies');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10387, 'Laptop', 393, 'Beauty');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10388, 'Laptop', 213, 'Electronics');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10389, 'Dog Food', 358, 'Sports Equipment');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10390, 'Laptop', 181, 'Pet Supplies');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10391, 'Sports Shoes', 176, 'Sports Equipment');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10392, 'Skin Care', 309, 'Electronics');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10393, 'Skin Care', 26, 'Electronics');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10394, 'Phone', 36, 'Electronics');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10395, 'Dog Food', 133, 'Pet Supplies');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10396, 'Laptop', 75, 'Pet Supplies');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10397, 'Phone', 323, 'Electronics');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10398, 'Sports Shoes', 230, 'Beauty');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (10399, 'Dog Food', 461, 'Electronics');
commit;
prompt 400 records loaded
prompt Loading SUPPLIERS...
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (801, 'Curtis Conley', 'curtis.conley@air.com');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (802, 'Sharon Overstreet', 'sharon.overstreet@usainstruments.br');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (803, 'Alec Judd', 'alecj@ogi.ca');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (804, 'Tea Napolitano', 'tea.napolitano@dynacqinternational.com');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (805, 'Jeremy Botti', 'j.botti@montpelierplastics.dk');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (806, 'Lee Reno', 'lreno@nuinfosystems.de');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (807, 'Marisa Rickman', 'marisa.rickman@dynacqinternational.de');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (808, 'Jack Fogerty', 'jack.fogerty@data.lt');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (809, 'Lois Kimball', 'lois.kimball@iss.fr');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (810, 'Pam McLean', 'pam.mclean@microsoft.se');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (811, 'Embeth Garfunkel', 'egarfunkel@walmartstores.com');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (812, 'Wallace Creek', 'wallace.creek@arkidata.com');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (813, 'Hal Nelligan', 'hal.n@mqsoftware.com');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (814, 'Timothy Osbourne', 't.osbourne@printtech.uk');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (815, 'Mira Hewett', 'mira@lms.uk');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (816, 'Gil Cale', 'gcale@ach.com');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (817, 'Debbie Hayek', 'debbie.hayek@owm.de');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (818, 'Jodie McCabe', 'jodiem@sfmai.com');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (819, 'Natasha Stamp', 'natasha.s@lynksystems.com');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (820, 'Keanu Platt', 'keanu.platt@cooktek.br');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (821, 'Brendan Rooker', 'brendan.rooker@angieslist.jp');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (822, 'Kathy Burmester', 'kathy.b@datawarehouse.au');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (823, 'Miko Conley', 'mikoc@dps.de');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (824, 'Hal Ryder', 'hal.r@sps.com');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (825, 'Keith Browne', 'kbrowne@telepoint.com');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (826, 'Diane Diggs', 'dianed@randomwalk.com');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (827, 'Lou Kotto', 'lou.kotto@jlphor.com');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (828, 'Jeffery Vaughn', 'jeffery.vaughn@cardtronics.de');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (829, 'Kirk Dukakis', 'kirk.dukakis@merck.au');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (830, 'Spencer Rosas', 'spencer.rosas@maverick.br');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (831, 'Fairuza Channing', 'fchanning@horizon.de');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (832, 'Cuba Preston', 'cuba.preston@newviewgifts.com');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (833, 'Sara McGoohan', 'sara.mcgoohan@bis.es');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (834, 'James Pollack', 'james@codykramerimports.com');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (835, 'Melanie Walken', 'melanie@mqsoftware.com');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (836, 'Eric Rickman', 'erickman@unit.jp');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (837, 'Winona Coward', 'winona.coward@shar.il');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (838, 'Garry Suchet', 'garry.suchet@cws.uk');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (839, 'Jodie Quatro', 'jodieq@cis.com');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (840, 'Patricia Hirsch', 'patricia.h@tracertechnologies.com');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (841, 'Neneh Bell', 'neneh@ntas.com');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (842, 'Chris Beals', 'chris.b@wlt.de');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (843, 'Angela LaSalle', 'a.lasalle@loreal.au');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (844, 'Brittany Vince', 'brittany.vince@kitba.com');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (845, 'Courtney Balin', 'courtney@priorityexpress.com');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (846, 'Jonny Kattan', 'jonny.kattan@cascadebancorp.ca');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (847, 'Paula Moss', 'paula.moss@authoria.com');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (848, 'Stanley Minogue', 'stanley.minogue@acsis.com');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (849, 'Amy Franks', 'a.franks@wellsfinancial.com');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (850, 'Rick Bale', 'rick.b@isd.de');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (851, 'Sarah Gayle', 'sarah@mls.za');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (852, 'Ethan MacNeil', 'ethan.macneil@fmb.jp');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (853, 'Benicio Swayze', 'benicio.swayze@usgovernment.com');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (854, 'Dwight LaPaglia', 'dwight.lapaglia@venoco.uk');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (855, 'Chrissie Pleasure', 'chrissie.pleasure@airmethods.jp');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (856, 'Barbara Blackwell', 'barbara.blackwell@sht.br');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (857, 'Sharon Pollack', 'sharon.pollack@doctorsassociates.com');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (858, 'Andrae Jones', 'andrae.jones@creditorsinterchange.uk');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (859, 'Clarence Curry', 'ccurry@bat.com');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (860, 'Miriam Romijn-Stamos', 'miriam.romijnstamos@sht.fr');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (861, 'Robbie Avital', 'r.avital@base.ch');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (862, 'Elisabeth Bryson', 'e.bryson@maverick.jp');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (863, 'Meg Getty', 'meg.getty@sht.ch');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (864, 'Max Bassett', 'max.bassett@sysconmedia.es');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (865, 'Kylie Hornsby', 'kylie.hornsby@wav.ch');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (866, 'Colin Tyson', 'colint@fra.com');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (867, 'Albertina McKennitt', 'a.mckennitt@epamsystems.de');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (868, 'Adam Alda', 'adama@hencie.ch');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (869, 'Hal Sherman', 'hal.sherman@cws.jp');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (870, 'Kyle Utada', 'kyleu@innovativelighting.com');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (871, 'Chazz Logue', 'chazz.logue@ipsadvisory.de');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (872, 'Edward Law', 'edward.law@codykramerimports.ca');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (873, 'Todd Ramirez', 'toddr@capitalautomotive.de');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (874, 'Mindy Torino', 'mindy.torino@abs.de');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (875, 'Nickel Bale', 'nickel.bale@safehomesecurity.br');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (876, 'Ceili Bridges', 'ceili.bridges@royalgold.com');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (877, 'Gabriel Cartlidge', 'gabriel@firstsouthbancorp.de');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (878, 'Jude Rispoli', 'jude@efcbancorp.com');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (879, 'Eric Furtado', 'efurtado@authoria.de');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (880, 'Rod Shawn', 'rod.shawn@shirtfactory.com');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (881, 'Willie Swinton', 'willie@gdatechnologies.com');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (882, 'Donna Bergen', 'dbergen@proclarity.de');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (883, 'Remy Heche', 'remyh@walmartstores.ch');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (884, 'Nathan Idol', 'nathan.i@spectrum.com');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (885, 'Ray Deejay', 'ray.deejay@intraspheretechnologies.com');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (886, 'Wang Jay', 'wang.jay@vitacostcom.ca');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (887, 'Chely Dalton', 'c.dalton@oss.ca');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (888, 'Greg Weisberg', 'g.weisberg@dsp.de');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (889, 'Nelly Marie', 'nelly.marie@spotfireholdings.uk');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (890, 'Alana Russell', 'alanar@mosaic.com');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (891, 'Boz Dillane', 'b.dillane@diamondgroup.com');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (892, 'Jimmie Tanon', 'jimmie.t@scriptsave.com');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (893, 'Dar Winger', 'd.winger@keymark.com');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (894, 'Caroline Rea', 'caroline.rea@nestle.uk');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (895, 'Pelvic Bates', 'pelvic.bates@marlabs.dk');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (896, 'Ani Gertner', 'ani.gertner@ahl.com');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (897, 'Lupe Richter', 'l.richter@pragmatechsoftware.com');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (898, 'Faye Cromwell', 'faye.cromwell@ptg.br');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (899, 'Carrie-Anne Ryan', 'cryan@ads.com');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (900, 'Julie McDowall', 'juliem@its.com');
commit;
prompt 100 records committed...
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (901, 'Mary Margulies', 'm.margulies@telecheminternational.com');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (902, 'Ann Rea', 'ann.rea@toyotamotor.ar');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (903, 'Kazem Sample', 'kazem@anheuserbusch.nl');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (904, 'Marianne Boone', 'marianne.boone@keymark.uk');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (905, 'Treat Nightingale', 'tnightingale@americanexpress.com');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (906, 'Sander Elizondo', 'sander.elizondo@interfacesoftware.ec');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (907, 'Wes Romijn-Stamos', 'wesr@nrae.dk');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (908, 'Barry Nielsen', 'barry.n@profitline.nl');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (909, 'Clint Wright', 'clint@elite.com');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (910, 'Janeane Nugent', 'janeane.n@marriottinternational.com');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (911, 'Rose Eat World', 'reatworld@americanhealthways.com');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (912, 'Will Allen', 'will.allen@businessplus.com');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (913, 'Susan Turturro', 'susan@vivendiuniversal.uk');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (914, 'Fiona Brando', 'fiona.brando@scooterstore.com');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (915, 'Famke McIntosh', 'famke.mcintosh@ccb.uk');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (916, 'Julio Holland', 'julio.holland@3tsystems.com');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (917, 'Trace Creek', 'trace.creek@totalentertainment.it');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (918, 'Mykelti Adkins', 'madkins@daimlerchrysler.com');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (919, 'Joshua Waite', 'joshua.waite@multimedialive.ar');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (920, 'Lupe Berkley', 'lupeb@speakeasy.com');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (921, 'Swoosie Washington', 'swoosie.washington@bmm.com');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (922, 'Elizabeth Pastore', 'e.pastore@angieslist.de');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (923, 'Junior Rhys-Davies', 'j.rhysdavies@ptg.au');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (924, 'Chris LaPaglia', 'chris.lapaglia@progressivedesigns.fi');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (925, 'Maxine Costa', 'maxine@alternativetechnology.be');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (926, 'Willie Feuerstein', 'willie.feuerstein@veritekinternational.com');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (927, 'Brenda Nash', 'brenda.nash@techrx.com');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (928, 'Nicole Krieger', 'nicole.krieger@unit.com');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (929, 'Thin Whitman', 'thin.whitman@solipsys.nl');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (930, 'Rhea Reilly', 'rhea.r@drinkmorewater.de');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (931, 'Allison Conners', 'allison.c@seafoxboat.uk');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (932, 'Kathy McFerrin', 'kmcferrin@mse.in');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (933, 'Rhea Vaughn', 'rhea@apexsystems.de');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (934, 'Edward Tankard', 'etankard@trainersoft.com');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (935, 'Heather Baldwin', 'heather.baldwin@eagleone.es');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (936, 'Mae Briscoe', 'mae.briscoe@pragmatechsoftware.com');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (937, 'CeCe Cage', 'c.cage@cns.de');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (938, 'Marty Lindley', 'marty.lindley@mre.com');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (939, 'Al Garr', 'al.garr@powerlight.com');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (940, 'Nikki Coyote', 'nikki.coyote@saksinc.ch');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (941, 'Tom Stowe', 'tom.stowe@veritekinternational.jp');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (942, 'Roberta Flatts', 'robertaf@ach.jp');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (943, 'Renee Barry', 'r.barry@meghasystems.br');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (944, 'Judd Macht', 'judd.m@marriottinternational.uk');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (945, 'Wang Cattrall', 'wang.cattrall@americanpan.com');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (946, 'Nils Rickles', 'nils@career.uk');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (947, 'Robbie Pitney', 'robbie.pitney@enterprise.com');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (948, 'Isaac Atlas', 'isaac.atlas@doctorsassociates.de');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (949, 'Ice Potter', 'ice.potter@mastercardinternational.pt');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (950, 'Queen Rollins', 'q.rollins@gapinc.es');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (951, 'Howard Colman', 'howard.colman@limitedbrands.br');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (952, 'Chely Walsh', 'c.walsh@sandyspringbancorp.br');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (953, 'Susan Flack', 'sflack@wci.fr');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (954, 'Bobby Shue', 'bobby.shue@usdairyproducers.dk');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (955, 'Philip May', 'pmay@sweetproductions.uk');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (956, 'Roscoe Biel', 'roscoe.b@credopetroleum.dk');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (957, 'Domingo Biggs', 'domingo@conagra.tw');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (958, 'Jamie Secada', 'j.secada@wlt.com');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (959, 'Belinda Cassidy', 'belinda.c@gna.com');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (960, 'Kyle LaPaglia', 'k.lapaglia@electricalsolutions.br');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (961, 'Parker Coolidge', 'parker@actechnologies.dk');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (962, 'Lionel Woodward', 'lionel.woodward@limitedbrands.it');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (963, 'Janice Playboys', 'janice@elitemedical.uk');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (964, 'Alan Dayne', 'a.dayne@stm.uk');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (965, 'Chanté Rock', 'chant.rock@kroger.it');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (966, 'Crystal Warwick', 'crystal@primussoftware.jp');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (967, 'Kelly Nugent', 'kelly.nugent@evinco.ch');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (968, 'Marc Crowe', 'marc.c@perfectorder.com');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (969, 'Patrick Tucker', 'patrickt@httprint.com');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (970, 'Rickie Soul', 'rickie.soul@simplycertificates.nl');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (971, 'Michael Weller', 'michael.weller@digitalmotorworks.at');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (972, 'Frances Rodriguez', 'frances.rodriguez@meghasystems.au');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (973, 'Bobbi Streep', 'bobbi@dvdt.de');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (974, 'Oded Biggs', 'oded@ositissoftware.br');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (975, 'Denis Silverman', 'deniss@ibfh.nl');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (976, 'Rosie Bates', 'rosie.b@multimedialive.br');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (977, 'Austin Gates', 'austin.gates@gentrasystems.com');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (978, 'Frank Gertner', 'frank@ogiointernational.es');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (979, 'Tara Belle', 't.belle@whitewave.com');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (980, 'Ian Burmester', 'ian.burmester@mms.br');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (981, 'Yaphet Moss', 'yaphet.moss@efcbancorp.com');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (982, 'Lili Jovovich', 'lili.jovovich@prp.br');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (983, 'Jerry Maguire', 'jmaguire@mainstreetbanks.br');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (984, 'Antonio Root', 'antonio.root@ass.com');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (985, 'Vendetta Blige', 'vendetta.blige@saltgroup.com');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (986, 'Frederic Eckhart', 'frederic.eckhart@mds.se');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (987, 'Maura McDiarmid', 'm.mcdiarmid@firstsouthbancorp.uk');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (988, 'Gord Mars', 'gordm@qas.com');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (989, 'Rachel Presley', 'rachelp@dcgroup.au');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (990, 'Dennis Tippe', 'd.tippe@kramontrealty.au');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (991, 'Forest Danes', 'forestd@mathis.uk');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (992, 'Jared Rea', 'j.rea@procter.com');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (993, 'Liquid Curfman', 'liquid@blueoceansoftware.uk');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (994, 'Bryan Reeve', 'bryan.r@marlabs.cz');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (995, 'Rhona Biehn', 'rhona.biehn@nlx.br');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (996, 'Joe Reno', 'joe.reno@outsourcegroup.com');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (997, 'Pablo Berenger', 'pberenger@onesourceprinting.hu');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (998, 'Buddy Gilley', 'buddy.gilley@tilia.it');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (999, 'Thelma Weaving', 'thelma.weaving@wlt.br');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (1000, 'Nicholas Heche', 'nicholas.heche@wrgservices.com');
commit;
prompt 200 records committed...
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (1001, 'Dwight Pleasure', 'dwight.pleasure@conagra.com');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (1002, 'Allan Lewis', 'allan.lewis@walmartstores.au');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (1003, 'Willem Levy', 'willem.levy@priorityexpress.com');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (1004, 'Edgar Chinlund', 'edgar.chinlund@circuitcitystores.com');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (1005, 'Tzi Phoenix', 'tzi.phoenix@aristotle.jp');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (1006, 'Gerald Kier', 'geraldk@advancedneuromodulation.com');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (1007, 'Elisabeth Ramis', 'e.ramis@ccb.fr');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (1008, 'Thomas Kier', 'thomas@sm.at');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (1009, 'Delroy Reed', 'delroy.reed@aquascapedesigns.com');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (1010, 'Mia Singletary', 'mia.s@spinnakerexploration.com');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (1011, 'Xander Dolenz', 'xander.dolenz@vivendiuniversal.com');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (1012, 'Toshiro Reno', 'toshiro.r@mindworks.uk');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (1013, 'Wallace Tarantino', 'wallace.tarantino@powerlight.com');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (1014, 'Debra Overstreet', 'debra.overstreet@gdi.jp');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (1015, 'Phoebe Colon', 'phoebec@innovateecommerce.es');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (1016, 'Juice Easton', 'juice.easton@ivorysystems.de');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (1017, 'Saffron Jay', 'saffron.jay@jma.com');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (1018, 'Christine Tippe', 'christine.t@mindiq.com');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (1019, 'Sal Daniels', 's.daniels@curagroup.it');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (1020, 'Hazel Carrack', 'hazel.carrack@linacsystems.fr');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (1021, 'Marina Kutcher', 'm.kutcher@cardtronics.mo');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (1022, 'Vickie Wopat', 'vickiew@reckittbenckiser.com');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (1023, 'Gil Skerritt', 'gil.skerritt@thinktanksystems.uk');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (1024, 'Jude Raybon', 'jude.r@mattel.uk');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (1025, 'Rodney Nakai', 'rodney.nakai@trx.com');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (1026, 'Alfie Kutcher', 'alfie.kutcher@comglobalsystems.com');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (1027, 'John Noseworthy', 'john.n@team.it');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (1028, 'Devon McGregor', 'dmcgregor@mattel.com');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (1029, 'Angela McGriff', 'angela.mcgriff@pds.it');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (1030, 'Anjelica Lawrence', 'anjelica.lawrence@democracydata.com');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (1031, 'Phoebe Ojeda', 'phoebe.ojeda@ibm.ca');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (1032, 'Tara Butler', 'tara.butler@veritekinternational.nl');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (1033, 'Harris Burton', 'harris@hondamotor.de');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (1034, 'Debby Bailey', 'debby.bailey@sht.ca');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (1035, 'Demi Danes', 'demi.danes@gulfmarkoffshore.com');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (1036, 'Ashton Hart', 'ashton@nuinfosystems.com');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (1037, 'Karen Assante', 'kassante@anworthmortgage.jp');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (1038, 'Vin Fariq', 'vin@verizon.de');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (1039, 'Bernard Hobson', 'b.hobson@adeasolutions.in');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (1040, 'Leon Matheson', 'l.matheson@dynacqinternational.com');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (1041, 'Hal Turturro', 'hal@gentrasystems.com');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (1042, 'Loren Byrne', 'loren.byrne@wrgservices.com');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (1043, 'Ming-Na Underwood', 'mingna.underwood@clorox.za');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (1044, 'Delroy Creek', 'delroy.creek@nrae.lt');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (1045, 'Steven Hynde', 'steven.hynde@gtp.uk');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (1046, 'Junior Vinton', 'jvinton@capitalbank.de');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (1047, 'Robin Pressly', 'rpressly@homedepot.com');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (1048, 'Gerald Ojeda', 'gerald@integramedamerica.com');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (1049, 'Quentin Huston', 'qhuston@kellogg.com');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (1050, 'Sona Schreiber', 'sona.schreiber@nhr.com');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (1051, 'Greg Tomei', 'greg.tomei@oriservices.es');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (1052, 'Chalee Quinn', 'cquinn@generalmotors.com');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (1053, 'Johnnie Clarkson', 'johnnie.clarkson@tilsonlandscape.com');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (1054, 'Nils Rooker', 'nilsr@officedepot.com');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (1055, 'Christine Himmelman', 'christine.himmelman@virbac.au');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (1056, 'Fairuza Herndon', 'fairuza.herndon@outsourcegroup.de');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (1057, 'Victor Dunn', 'victor.d@chipssolutions.de');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (1058, 'Ivan Feuerstein', 'ifeuerstein@progressivedesigns.com');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (1059, 'Crystal Pressly', 'crystal.pressly@nuinfosystems.fi');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (1060, 'Kirk Dalley', 'kirk.d@ecopy.it');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (1061, 'Susan DeVita', 'susan.devita@eagleone.cz');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (1062, 'Tara Rydell', 'tara@ultimus.com');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (1063, 'Lucinda Karyo', 'l.karyo@fmi.nl');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (1064, 'Joaquin Byrd', 'joaquin.byrd@mwh.dk');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (1065, 'Gil McGovern', 'gil.mcgovern@globalwireless.de');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (1066, 'Gil Alda', 'gila@hfn.it');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (1067, 'Nelly Mahoney', 'nelly.mahoney@paisley.de');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (1068, 'Andie Barnett', 'andie.barnett@biosite.jp');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (1069, 'Desmond Supernaw', 'desmond.supernaw@solipsys.com');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (1070, 'Anita Torres', 'anita.t@mre.il');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (1071, 'Maura Weiland', 'maura.w@pis.jp');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (1072, 'Tim Squier', 'tim@palmbeachtan.de');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (1073, 'Ellen Martinez', 'ellen.martinez@sourcegear.com');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (1074, 'Jonny Lee Scott', 'jonnylee.scott@qas.au');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (1075, 'Vivica Morrison', 'vivica.morrison@tama.com');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (1076, 'Kristin McIntosh', 'kristin@prosperitybancshares.ch');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (1077, 'Alfie Patton', 'apatton@fmt.ch');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (1078, 'Rosie Posey', 'rosiep@sensortechnologies.za');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (1079, 'Shannon Springfield', 'sspringfield@newmedia.fr');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (1080, 'Samantha Ammons', 'samantha.ammons@linacsystems.cz');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (1081, 'Bernie Farina', 'bernie.farina@learningvoyage.com');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (1082, 'Maria Shearer', 'marias@gdatechnologies.de');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (1083, 'Edie DiFranco', 'edifranco@carboceramics.com');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (1084, 'Night Leachman', 'nightl@naturescure.uk');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (1085, 'Tobey Santana', 'tobey.santana@worldcom.br');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (1086, 'Russell Bridges', 'russell.bridges@kingland.ar');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (1087, 'Reese Zappacosta', 'rzappacosta@computersource.com');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (1088, 'Anjelica Beckham', 'a.beckham@marathonheater.ch');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (1089, 'Penelope Kidman', 'penelope.k@idas.com');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (1090, 'Cheryl Burke', 'cheryl.burke@securitycheck.com');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (1091, 'Natacha Visnjic', 'nvisnjic@wci.com');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (1092, 'Karon Tisdale', 'karon.tisdale@keith.com');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (1093, 'Chazz Kingsley', 'chazz.kingsley@sis.com');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (1094, 'Julianne Redgrave', 'julianne.redgrave@sfmai.de');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (1095, 'Crispin Deejay', 'crispin@meridiangold.com');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (1096, 'Rick Brando', 'rbrando@priorityexpress.es');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (1097, 'Miki Rodgers', 'm.rodgers@pra.com');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (1098, 'Elle Weaving', 'eweaving@savela.yu');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (1099, 'Carlos Osment', 'carlos.osment@spd.com');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (1100, 'Kid Cooper', 'kid.c@y2marketing.uk');
commit;
prompt 300 records committed...
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (1101, 'Saffron Street', 'saffron.street@prometheuslaboratories.il');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (1102, 'Ivan Holliday', 'i.holliday@3tsystems.com');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (1103, 'Darius Bedelia', 'darius.b@conquest.ch');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (1104, 'Pat Shocked', 'pat.shocked@arkidata.com');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (1105, 'Jody Ferry', 'jferry@trinityhomecare.com');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (1106, 'Eliza Postlethwaite', 'eliza.postlethwaite@entelligence.com');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (1107, 'Julianne Harrelson', 'julianne@mattel.com');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (1108, 'Harvey Lang', 'harveyl@greene.com');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (1109, 'Campbell Heslov', 'campbell.heslov@sony.uk');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (1110, 'Jason Lange', 'jason@nuinfosystems.com');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (1111, 'Emily Ford', 'emily.ford@kelmooreinvestment.jp');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (1112, 'Fisher Shaye', 'fisher.shaye@coldstonecreamery.com');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (1113, 'Kurt Gaines', 'kurt.gaines@grt.ch');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (1114, 'Gran Kinski', 'gkinski@sfb.mx');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (1115, 'Ronny Dooley', 'rdooley@generalmotors.com');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (1116, 'Colin Neil', 'c.neil@hersheyfoods.br');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (1117, 'Elijah Thomson', 'elijah.thomson@larkinenterprises.jp');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (1118, 'Hope Romijn-Stamos', 'hope.romijnstamos@kmart.au');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (1119, 'Davey Brandt', 'davey.b@myricom.hu');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (1120, 'Kate Berkeley', 'kate.berkeley@unilever.uk');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (1121, 'Patty Deschanel', 'patty.deschanel@entelligence.com');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (1122, 'Matthew Botti', 'mbotti@entelligence.ca');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (1123, 'Frankie Tripplehorn', 'frankie.tripplehorn@msdw.de');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (1124, 'Bo Conway', 'bo.conway@lynksystems.au');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (1125, 'Chloe McCready', 'chloe@idlabel.fi');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (1126, 'Kris Nivola', 'kris.nivola@comnetinternational.com');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (1127, 'Rosco Levy', 'rosco.levy@integramedamerica.com');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (1128, 'Martha Posener', 'martha.posener@gateway.uk');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (1129, 'Connie Weiss', 'connie.weiss@grs.uk');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (1130, 'Seth Drive', 'seth.drive@portageenvironmental.at');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (1131, 'Johnny Heslov', 'johnny.h@advertisingventures.za');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (1132, 'Albertina Cube', 'albertinac@logisticare.com');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (1133, 'Trini Charles', 'trini@jewettcameron.com');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (1134, 'Larenz DiBiasio', 'larenz@infovision.nz');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (1135, 'Gaby Rauhofer', 'gaby.rauhofer@signalperfection.dk');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (1136, 'Doug Bentley', 'doug.bentley@maverick.com');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (1137, 'Harvey Laws', 'harvey.laws@insurmark.uk');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (1138, 'Cary Nelligan', 'cary.nelligan@capellaeducation.uk');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (1139, 'Davy Rizzo', 'davy.rizzo@tilsonlandscape.com');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (1140, 'Gino Cruise', 'gino.cruise@capitolbancorp.com');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (1141, 'Amanda Witherspoon', 'amanda.w@infinity.com');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (1142, 'Kelli Broadbent', 'k.broadbent@younginnovations.com');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (1143, 'Trey Janney', 'treyj@circuitcitystores.br');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (1144, 'Andie Schreiber', 'andie.s@kramontrealty.mx');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (1145, 'Geoffrey Coolidge', 'geoffrey.coolidge@gtp.ca');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (1146, 'Millie Camp', 'millie.camp@magnet.fr');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (1147, 'Veruca Goodall', 'veruca.goodall@actechnologies.de');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (1148, 'Anna Levy', 'a.levy@sourcegear.com');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (1149, 'Nathan Keitel', 'nathank@ccb.ca');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (1150, 'Regina Arkin', 'regina.arkin@msdw.com');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (1151, 'Rodney Griffiths', 'rodney.griffiths@kroger.com');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (1152, 'Phil Woods', 'phil.w@max.com');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (1153, 'Trick Hughes', 'trick.h@perfectorder.de');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (1154, 'Randy Arnold', 'randy.arnold@bluffcitysteel.uk');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (1155, 'Carrie-Anne Kennedy', 'carrieannek@democracydata.com');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (1156, 'Donal Parish', 'd.parish@gdatechnologies.com');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (1157, 'Deborah Hubbard', 'deborah.hubbard@asa.uk');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (1158, 'Nikki Bradford', 'nikki.bradford@bestbuy.de');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (1159, 'Martin Fierstein', 'martin@ssci.at');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (1160, 'Rawlins Aniston', 'raniston@bashen.in');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (1161, 'Meryl Ruiz', 'meryl.ruiz@acsis.hu');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (1162, 'Taye Cockburn', 'tcockburn@invisioncom.de');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (1163, 'Hilary Tate', 'hilary@sci.com');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (1164, 'Halle Applegate', 'halle.applegate@tastefullysimple.com');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (1165, 'Clarence Parm', 'clarence.parm@softworld.com');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (1166, 'Alec Meniketti', 'alecm@allstar.br');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (1167, 'Jeanne Paul', 'jeanne@seiaarons.com');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (1168, 'Bryan Waits', 'bryanw@air.com');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (1169, 'Rascal Cockburn', 'rascal@nlx.ch');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (1170, 'Jody Idol', 'jidol@oriservices.fr');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (1171, 'Mika Weisberg', 'mika.w@capellaeducation.it');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (1172, 'Ike Spiner', 'ikes@ivci.dk');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (1173, 'Val Russo', 'valr@credopetroleum.de');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (1174, 'Miki Doucette', 'm.doucette@millersystems.com');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (1175, 'Amanda Davies', 'amandad@canterburypark.com');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (1176, 'Timothy Griffith', 'timothy.griffith@jma.com');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (1177, 'Courtney Romijn-Stamos', 'courtney@scripnet.it');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (1178, 'Mike Li', 'mike.li@mindworks.br');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (1179, 'Julie Tierney', 'julie.tierney@adeasolutions.com');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (1180, 'Mickey Vannelli', 'mickey.v@dis.de');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (1181, 'Davy Vassar', 'dvassar@apexsystems.gr');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (1182, 'Trey Zeta-Jones', 'trey.zetajones@apexsystems.jp');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (1183, 'Geoff Summer', 'geoff@pioneerdatasystems.com');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (1184, 'Lou Hartnett', 'lou.h@msdw.com');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (1185, 'Scott Crowell', 's.crowell@alohanysystems.au');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (1186, 'Faye Davidson', 'faye.davidson@lfg.com');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (1187, 'Rhett Overstreet', 'rhett.overstreet@glaxosmithkline.com');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (1188, 'Hazel Moriarty', 'hazel.moriarty@stonetechprofessional.com');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (1189, 'Juliana Forrest', 'juliana.forrest@jewettcameron.de');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (1190, 'Forest Gugino', 'fgugino@irissoftware.com');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (1191, 'Betty Andrews', 'betty@aop.br');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (1192, 'Rebecca Neeson', 'rebeccan@microsoft.com');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (1193, 'Daniel Scott', 'daniel.scott@datawarehouse.fr');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (1194, 'Stockard O''Neal', 'stockard.oneal@prometheuslaboratories.ch');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (1195, 'Christina Boothe', 'christinab@mercantilebank.de');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (1196, 'Nils Greenwood', 'nils@unit.nl');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (1197, 'Lynn Gill', 'lynn.g@techbooks.com');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (1198, 'Jean-Claude Duke', 'jeanclaude.d@sourcegear.com');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (1199, 'Regina Milsap', 'regina.milsap@uem.ca');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (1200, 'Shirley Mahood', 'shirley.mahood@comnetinternational.com');
commit;
prompt 400 records loaded
prompt Loading INVENTORY...
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20000, 89, to_date('30-03-2021', 'dd-mm-yyyy'), 10130, 1009);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20001, 599, to_date('15-01-2020', 'dd-mm-yyyy'), 10258, 879);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20002, 284, to_date('08-12-2020', 'dd-mm-yyyy'), 10393, 827);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20003, 218, to_date('24-03-2020', 'dd-mm-yyyy'), 10333, 1185);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20004, 686, to_date('21-12-2020', 'dd-mm-yyyy'), 10209, 1097);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20005, 898, to_date('27-10-2020', 'dd-mm-yyyy'), 10253, 1053);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20006, 389, to_date('30-08-2021', 'dd-mm-yyyy'), 10096, 963);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20007, 618, to_date('08-05-2023', 'dd-mm-yyyy'), 10114, 835);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20008, 127, to_date('14-09-2020', 'dd-mm-yyyy'), 10398, 825);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20009, 882, to_date('23-12-2023', 'dd-mm-yyyy'), 10260, 1135);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20010, 633, to_date('11-12-2023', 'dd-mm-yyyy'), 10060, 1116);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20011, 429, to_date('06-11-2023', 'dd-mm-yyyy'), 10046, 1055);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20012, 628, to_date('06-05-2021', 'dd-mm-yyyy'), 10210, 1007);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20013, 50, to_date('03-09-2020', 'dd-mm-yyyy'), 10037, 1152);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20014, 891, to_date('14-03-2020', 'dd-mm-yyyy'), 10364, 1030);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20015, 248, to_date('25-07-2021', 'dd-mm-yyyy'), 10019, 1135);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20016, 374, to_date('01-08-2023', 'dd-mm-yyyy'), 10055, 835);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20017, 506, to_date('10-02-2021', 'dd-mm-yyyy'), 10049, 1078);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20018, 396, to_date('23-01-2022', 'dd-mm-yyyy'), 10291, 865);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20019, 890, to_date('24-09-2020', 'dd-mm-yyyy'), 10119, 955);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20020, 883, to_date('03-09-2022', 'dd-mm-yyyy'), 10033, 1158);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20021, 260, to_date('02-04-2021', 'dd-mm-yyyy'), 10049, 911);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20022, 683, to_date('12-02-2023', 'dd-mm-yyyy'), 10104, 876);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20023, 326, to_date('25-09-2020', 'dd-mm-yyyy'), 10005, 1051);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20024, 937, to_date('22-03-2023', 'dd-mm-yyyy'), 10113, 955);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20025, 803, to_date('31-07-2021', 'dd-mm-yyyy'), 10046, 1151);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20026, 518, to_date('27-08-2021', 'dd-mm-yyyy'), 10018, 1084);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20027, 625, to_date('06-11-2022', 'dd-mm-yyyy'), 10284, 1100);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20028, 523, to_date('24-11-2021', 'dd-mm-yyyy'), 10301, 1009);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20029, 226, to_date('07-11-2021', 'dd-mm-yyyy'), 10086, 868);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20030, 842, to_date('07-06-2023', 'dd-mm-yyyy'), 10377, 955);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20031, 884, to_date('27-12-2020', 'dd-mm-yyyy'), 10284, 1189);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20032, 771, to_date('21-03-2022', 'dd-mm-yyyy'), 10022, 1183);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20033, 120, to_date('02-11-2023', 'dd-mm-yyyy'), 10024, 982);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20034, 706, to_date('27-05-2020', 'dd-mm-yyyy'), 10229, 1068);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20035, 172, to_date('21-06-2020', 'dd-mm-yyyy'), 10231, 1089);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20036, 887, to_date('10-04-2021', 'dd-mm-yyyy'), 10290, 897);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20037, 517, to_date('29-01-2022', 'dd-mm-yyyy'), 10101, 1139);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20038, 209, to_date('25-06-2021', 'dd-mm-yyyy'), 10300, 1199);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20039, 466, to_date('04-10-2020', 'dd-mm-yyyy'), 10223, 1136);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20040, 95, to_date('27-06-2020', 'dd-mm-yyyy'), 10288, 1198);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20041, 822, to_date('22-08-2022', 'dd-mm-yyyy'), 10316, 980);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20042, 435, to_date('17-04-2023', 'dd-mm-yyyy'), 10370, 1190);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20043, 587, to_date('14-03-2022', 'dd-mm-yyyy'), 10005, 1100);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20044, 577, to_date('15-05-2020', 'dd-mm-yyyy'), 10336, 842);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20045, 754, to_date('07-11-2021', 'dd-mm-yyyy'), 10205, 1023);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20046, 392, to_date('28-11-2020', 'dd-mm-yyyy'), 10247, 1025);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20047, 137, to_date('16-10-2020', 'dd-mm-yyyy'), 10345, 1062);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20048, 399, to_date('04-04-2023', 'dd-mm-yyyy'), 10072, 1161);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20049, 284, to_date('25-01-2021', 'dd-mm-yyyy'), 10210, 1133);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20050, 947, to_date('16-08-2022', 'dd-mm-yyyy'), 10342, 906);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20051, 439, to_date('05-12-2022', 'dd-mm-yyyy'), 10008, 1091);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20052, 462, to_date('25-01-2020', 'dd-mm-yyyy'), 10227, 945);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20053, 573, to_date('28-05-2021', 'dd-mm-yyyy'), 10262, 999);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20054, 764, to_date('04-09-2020', 'dd-mm-yyyy'), 10245, 927);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20055, 474, to_date('24-02-2020', 'dd-mm-yyyy'), 10331, 916);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20056, 431, to_date('20-01-2021', 'dd-mm-yyyy'), 10394, 913);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20057, 905, to_date('05-07-2022', 'dd-mm-yyyy'), 10350, 1011);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20058, 244, to_date('07-01-2022', 'dd-mm-yyyy'), 10101, 1152);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20059, 816, to_date('18-11-2023', 'dd-mm-yyyy'), 10199, 804);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20060, 677, to_date('23-07-2022', 'dd-mm-yyyy'), 10010, 989);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20061, 627, to_date('13-04-2021', 'dd-mm-yyyy'), 10296, 1130);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20062, 462, to_date('20-01-2023', 'dd-mm-yyyy'), 10382, 885);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20063, 570, to_date('14-03-2020', 'dd-mm-yyyy'), 10217, 831);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20064, 210, to_date('26-09-2021', 'dd-mm-yyyy'), 10127, 1177);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20065, 90, to_date('30-08-2022', 'dd-mm-yyyy'), 10335, 967);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20066, 100, to_date('25-05-2020', 'dd-mm-yyyy'), 10062, 1148);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20067, 316, to_date('31-07-2020', 'dd-mm-yyyy'), 10091, 960);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20068, 623, to_date('07-05-2023', 'dd-mm-yyyy'), 10389, 836);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20069, 584, to_date('05-05-2022', 'dd-mm-yyyy'), 10085, 1057);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20070, 392, to_date('15-08-2021', 'dd-mm-yyyy'), 10398, 1156);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20071, 35, to_date('19-08-2020', 'dd-mm-yyyy'), 10396, 1118);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20072, 20, to_date('18-06-2022', 'dd-mm-yyyy'), 10003, 1156);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20073, 269, to_date('17-07-2021', 'dd-mm-yyyy'), 10323, 933);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20074, 52, to_date('02-01-2020', 'dd-mm-yyyy'), 10295, 1192);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20075, 58, to_date('15-11-2022', 'dd-mm-yyyy'), 10356, 864);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20076, 965, to_date('02-04-2023', 'dd-mm-yyyy'), 10321, 831);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20077, 126, to_date('01-10-2021', 'dd-mm-yyyy'), 10363, 804);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20078, 223, to_date('12-04-2021', 'dd-mm-yyyy'), 10091, 1081);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20079, 995, to_date('13-06-2023', 'dd-mm-yyyy'), 10016, 1071);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20080, 409, to_date('15-09-2021', 'dd-mm-yyyy'), 10208, 937);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20081, 882, to_date('22-06-2023', 'dd-mm-yyyy'), 10227, 824);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20082, 403, to_date('23-05-2022', 'dd-mm-yyyy'), 10125, 1065);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20083, 675, to_date('28-11-2022', 'dd-mm-yyyy'), 10020, 1199);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20084, 635, to_date('27-05-2020', 'dd-mm-yyyy'), 10223, 1001);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20085, 955, to_date('27-12-2020', 'dd-mm-yyyy'), 10022, 1175);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20086, 391, to_date('27-03-2022', 'dd-mm-yyyy'), 10116, 1080);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20087, 87, to_date('12-12-2020', 'dd-mm-yyyy'), 10183, 967);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20088, 190, to_date('03-04-2023', 'dd-mm-yyyy'), 10387, 1085);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20089, 385, to_date('04-02-2021', 'dd-mm-yyyy'), 10115, 935);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20090, 219, to_date('02-06-2020', 'dd-mm-yyyy'), 10135, 829);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20091, 315, to_date('26-02-2023', 'dd-mm-yyyy'), 10067, 831);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20092, 829, to_date('31-03-2022', 'dd-mm-yyyy'), 10365, 1053);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20093, 782, to_date('09-11-2021', 'dd-mm-yyyy'), 10109, 957);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20094, 95, to_date('03-01-2020', 'dd-mm-yyyy'), 10383, 1056);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20095, 471, to_date('05-10-2023', 'dd-mm-yyyy'), 10357, 860);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20096, 50, to_date('15-03-2020', 'dd-mm-yyyy'), 10037, 1049);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20097, 251, to_date('11-05-2023', 'dd-mm-yyyy'), 10213, 1143);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20098, 336, to_date('08-04-2022', 'dd-mm-yyyy'), 10164, 826);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20099, 641, to_date('23-05-2020', 'dd-mm-yyyy'), 10235, 807);
commit;
prompt 100 records committed...
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20100, 11, to_date('13-07-2021', 'dd-mm-yyyy'), 10075, 1174);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20101, 340, to_date('16-06-2022', 'dd-mm-yyyy'), 10226, 917);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20102, 305, to_date('06-06-2021', 'dd-mm-yyyy'), 10060, 1194);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20103, 817, to_date('26-10-2020', 'dd-mm-yyyy'), 10356, 989);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20104, 518, to_date('20-12-2022', 'dd-mm-yyyy'), 10116, 1157);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20105, 969, to_date('11-07-2023', 'dd-mm-yyyy'), 10103, 905);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20106, 353, to_date('06-06-2023', 'dd-mm-yyyy'), 10106, 882);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20107, 835, to_date('17-09-2021', 'dd-mm-yyyy'), 10221, 1156);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20108, 910, to_date('01-05-2020', 'dd-mm-yyyy'), 10138, 835);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20109, 374, to_date('17-03-2021', 'dd-mm-yyyy'), 10135, 1004);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20110, 752, to_date('26-08-2020', 'dd-mm-yyyy'), 10368, 1157);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20111, 312, to_date('17-05-2023', 'dd-mm-yyyy'), 10354, 973);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20112, 21, to_date('10-04-2023', 'dd-mm-yyyy'), 10235, 1021);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20113, 41, to_date('04-03-2023', 'dd-mm-yyyy'), 10322, 862);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20114, 634, to_date('13-09-2022', 'dd-mm-yyyy'), 10313, 1102);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20115, 589, to_date('07-07-2020', 'dd-mm-yyyy'), 10077, 887);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20116, 518, to_date('09-01-2022', 'dd-mm-yyyy'), 10393, 1186);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20117, 646, to_date('05-11-2020', 'dd-mm-yyyy'), 10150, 1148);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20118, 932, to_date('17-02-2023', 'dd-mm-yyyy'), 10188, 893);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20119, 660, to_date('24-12-2020', 'dd-mm-yyyy'), 10082, 1011);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20120, 832, to_date('25-02-2022', 'dd-mm-yyyy'), 10263, 1131);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20121, 989, to_date('09-03-2020', 'dd-mm-yyyy'), 10364, 832);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20122, 311, to_date('15-03-2022', 'dd-mm-yyyy'), 10392, 1073);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20123, 115, to_date('08-07-2020', 'dd-mm-yyyy'), 10210, 1191);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20124, 96, to_date('22-04-2023', 'dd-mm-yyyy'), 10137, 1060);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20125, 933, to_date('31-05-2020', 'dd-mm-yyyy'), 10344, 859);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20126, 110, to_date('20-08-2021', 'dd-mm-yyyy'), 10054, 1028);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20127, 78, to_date('07-07-2021', 'dd-mm-yyyy'), 10024, 1086);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20128, 90, to_date('16-12-2021', 'dd-mm-yyyy'), 10323, 860);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20129, 344, to_date('08-10-2020', 'dd-mm-yyyy'), 10280, 1019);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20130, 279, to_date('11-05-2023', 'dd-mm-yyyy'), 10006, 1062);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20131, 141, to_date('03-10-2023', 'dd-mm-yyyy'), 10185, 1040);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20132, 170, to_date('06-03-2022', 'dd-mm-yyyy'), 10122, 970);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20133, 27, to_date('08-04-2023', 'dd-mm-yyyy'), 10146, 829);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20134, 316, to_date('01-04-2020', 'dd-mm-yyyy'), 10159, 872);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20135, 303, to_date('28-02-2023', 'dd-mm-yyyy'), 10225, 959);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20136, 207, to_date('08-05-2022', 'dd-mm-yyyy'), 10398, 862);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20137, 661, to_date('08-06-2023', 'dd-mm-yyyy'), 10277, 805);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20138, 202, to_date('27-11-2022', 'dd-mm-yyyy'), 10076, 820);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20139, 908, to_date('24-07-2022', 'dd-mm-yyyy'), 10323, 1186);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20140, 529, to_date('16-12-2021', 'dd-mm-yyyy'), 10158, 1111);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20141, 739, to_date('27-01-2021', 'dd-mm-yyyy'), 10340, 934);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20142, 344, to_date('16-05-2022', 'dd-mm-yyyy'), 10350, 814);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20143, 582, to_date('01-06-2022', 'dd-mm-yyyy'), 10282, 975);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20144, 855, to_date('20-04-2020', 'dd-mm-yyyy'), 10324, 1073);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20145, 504, to_date('03-01-2023', 'dd-mm-yyyy'), 10316, 1154);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20146, 507, to_date('25-11-2020', 'dd-mm-yyyy'), 10377, 1177);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20147, 173, to_date('05-08-2023', 'dd-mm-yyyy'), 10100, 966);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20148, 231, to_date('12-04-2023', 'dd-mm-yyyy'), 10310, 959);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20149, 891, to_date('27-10-2021', 'dd-mm-yyyy'), 10268, 1026);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20150, 754, to_date('16-09-2022', 'dd-mm-yyyy'), 10132, 1126);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20151, 683, to_date('03-02-2022', 'dd-mm-yyyy'), 10150, 859);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20152, 973, to_date('07-02-2022', 'dd-mm-yyyy'), 10194, 1109);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20153, 455, to_date('17-08-2022', 'dd-mm-yyyy'), 10118, 1012);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20154, 385, to_date('16-09-2020', 'dd-mm-yyyy'), 10342, 844);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20155, 210, to_date('25-10-2023', 'dd-mm-yyyy'), 10150, 1094);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20156, 597, to_date('30-01-2020', 'dd-mm-yyyy'), 10098, 870);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20157, 322, to_date('19-10-2021', 'dd-mm-yyyy'), 10226, 943);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20158, 873, to_date('13-04-2023', 'dd-mm-yyyy'), 10265, 1159);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20159, 885, to_date('23-04-2023', 'dd-mm-yyyy'), 10142, 918);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20160, 765, to_date('08-05-2023', 'dd-mm-yyyy'), 10358, 1068);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20161, 112, to_date('27-09-2021', 'dd-mm-yyyy'), 10358, 905);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20162, 798, to_date('02-01-2021', 'dd-mm-yyyy'), 10260, 815);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20163, 808, to_date('05-07-2022', 'dd-mm-yyyy'), 10263, 867);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20164, 215, to_date('16-08-2023', 'dd-mm-yyyy'), 10101, 884);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20165, 890, to_date('13-08-2021', 'dd-mm-yyyy'), 10267, 902);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20166, 792, to_date('04-06-2021', 'dd-mm-yyyy'), 10366, 949);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20167, 986, to_date('02-07-2021', 'dd-mm-yyyy'), 10124, 838);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20168, 704, to_date('14-12-2020', 'dd-mm-yyyy'), 10222, 1129);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20169, 89, to_date('12-02-2020', 'dd-mm-yyyy'), 10266, 941);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20170, 469, to_date('13-10-2023', 'dd-mm-yyyy'), 10075, 1165);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20171, 271, to_date('06-04-2021', 'dd-mm-yyyy'), 10183, 964);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20172, 940, to_date('21-06-2022', 'dd-mm-yyyy'), 10354, 1120);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20173, 463, to_date('11-03-2022', 'dd-mm-yyyy'), 10203, 1101);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20174, 368, to_date('13-10-2021', 'dd-mm-yyyy'), 10108, 810);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20175, 297, to_date('02-06-2022', 'dd-mm-yyyy'), 10320, 889);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20176, 525, to_date('20-02-2021', 'dd-mm-yyyy'), 10247, 1153);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20177, 12, to_date('28-10-2021', 'dd-mm-yyyy'), 10032, 811);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20178, 888, to_date('03-05-2022', 'dd-mm-yyyy'), 10189, 1048);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20179, 420, to_date('26-12-2023', 'dd-mm-yyyy'), 10012, 1044);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20180, 889, to_date('03-07-2022', 'dd-mm-yyyy'), 10344, 979);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20181, 930, to_date('03-10-2020', 'dd-mm-yyyy'), 10397, 921);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20182, 224, to_date('24-04-2020', 'dd-mm-yyyy'), 10021, 937);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20183, 649, to_date('14-02-2022', 'dd-mm-yyyy'), 10110, 1121);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20184, 229, to_date('12-06-2023', 'dd-mm-yyyy'), 10353, 1080);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20185, 529, to_date('04-04-2023', 'dd-mm-yyyy'), 10399, 983);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20186, 310, to_date('15-04-2021', 'dd-mm-yyyy'), 10259, 1102);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20187, 590, to_date('20-11-2020', 'dd-mm-yyyy'), 10210, 948);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20188, 447, to_date('01-12-2022', 'dd-mm-yyyy'), 10221, 1143);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20189, 191, to_date('10-11-2022', 'dd-mm-yyyy'), 10174, 921);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20190, 750, to_date('16-04-2020', 'dd-mm-yyyy'), 10289, 1010);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20191, 382, to_date('25-12-2022', 'dd-mm-yyyy'), 10031, 965);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20192, 85, to_date('18-09-2020', 'dd-mm-yyyy'), 10313, 934);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20193, 298, to_date('11-02-2021', 'dd-mm-yyyy'), 10268, 1110);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20194, 759, to_date('24-07-2020', 'dd-mm-yyyy'), 10398, 1045);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20195, 633, to_date('01-07-2020', 'dd-mm-yyyy'), 10390, 1098);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20196, 265, to_date('19-03-2020', 'dd-mm-yyyy'), 10385, 1175);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20197, 167, to_date('08-05-2022', 'dd-mm-yyyy'), 10211, 845);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20198, 98, to_date('18-04-2020', 'dd-mm-yyyy'), 10354, 985);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20199, 357, to_date('06-09-2021', 'dd-mm-yyyy'), 10175, 834);
commit;
prompt 200 records committed...
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20200, 626, to_date('13-02-2023', 'dd-mm-yyyy'), 10158, 819);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20201, 995, to_date('29-05-2020', 'dd-mm-yyyy'), 10294, 824);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20202, 18, to_date('26-05-2023', 'dd-mm-yyyy'), 10377, 876);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20203, 916, to_date('31-08-2021', 'dd-mm-yyyy'), 10122, 897);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20204, 258, to_date('19-03-2020', 'dd-mm-yyyy'), 10296, 1121);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20205, 789, to_date('27-05-2021', 'dd-mm-yyyy'), 10143, 817);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20206, 190, to_date('24-03-2022', 'dd-mm-yyyy'), 10115, 1104);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20207, 950, to_date('23-03-2021', 'dd-mm-yyyy'), 10191, 922);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20208, 649, to_date('15-02-2022', 'dd-mm-yyyy'), 10177, 919);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20209, 310, to_date('19-06-2022', 'dd-mm-yyyy'), 10092, 941);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20210, 644, to_date('07-05-2020', 'dd-mm-yyyy'), 10021, 876);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20211, 321, to_date('14-07-2021', 'dd-mm-yyyy'), 10135, 1130);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20212, 609, to_date('18-01-2022', 'dd-mm-yyyy'), 10069, 1106);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20213, 6, to_date('01-07-2022', 'dd-mm-yyyy'), 10161, 940);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20214, 710, to_date('16-04-2023', 'dd-mm-yyyy'), 10326, 1088);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20215, 49, to_date('01-12-2022', 'dd-mm-yyyy'), 10083, 804);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20216, 220, to_date('09-07-2022', 'dd-mm-yyyy'), 10110, 1102);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20217, 952, to_date('03-12-2020', 'dd-mm-yyyy'), 10229, 1055);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20218, 953, to_date('12-04-2021', 'dd-mm-yyyy'), 10013, 806);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20219, 247, to_date('30-07-2023', 'dd-mm-yyyy'), 10310, 1163);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20220, 765, to_date('27-02-2022', 'dd-mm-yyyy'), 10076, 937);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20221, 784, to_date('07-06-2020', 'dd-mm-yyyy'), 10212, 901);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20222, 109, to_date('03-01-2020', 'dd-mm-yyyy'), 10197, 939);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20223, 62, to_date('19-05-2022', 'dd-mm-yyyy'), 10214, 1037);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20224, 668, to_date('29-05-2022', 'dd-mm-yyyy'), 10360, 916);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20225, 642, to_date('25-09-2021', 'dd-mm-yyyy'), 10232, 1143);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20226, 28, to_date('14-05-2023', 'dd-mm-yyyy'), 10292, 1110);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20227, 609, to_date('28-07-2021', 'dd-mm-yyyy'), 10088, 942);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20228, 436, to_date('19-04-2022', 'dd-mm-yyyy'), 10144, 903);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20229, 102, to_date('23-04-2022', 'dd-mm-yyyy'), 10000, 1168);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20230, 605, to_date('18-03-2020', 'dd-mm-yyyy'), 10195, 940);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20231, 911, to_date('20-07-2021', 'dd-mm-yyyy'), 10100, 1157);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20232, 590, to_date('11-03-2021', 'dd-mm-yyyy'), 10380, 1189);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20233, 119, to_date('28-02-2023', 'dd-mm-yyyy'), 10182, 1163);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20234, 721, to_date('06-02-2023', 'dd-mm-yyyy'), 10052, 913);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20235, 835, to_date('10-08-2023', 'dd-mm-yyyy'), 10064, 996);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20236, 603, to_date('15-07-2021', 'dd-mm-yyyy'), 10358, 973);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20237, 959, to_date('21-07-2023', 'dd-mm-yyyy'), 10184, 989);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20238, 178, to_date('19-01-2023', 'dd-mm-yyyy'), 10042, 857);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20239, 31, to_date('04-09-2020', 'dd-mm-yyyy'), 10016, 885);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20240, 845, to_date('09-08-2023', 'dd-mm-yyyy'), 10284, 832);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20241, 137, to_date('11-10-2023', 'dd-mm-yyyy'), 10317, 1055);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20242, 644, to_date('13-04-2020', 'dd-mm-yyyy'), 10145, 819);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20243, 870, to_date('02-02-2020', 'dd-mm-yyyy'), 10390, 835);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20244, 510, to_date('03-04-2020', 'dd-mm-yyyy'), 10256, 1198);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20245, 362, to_date('21-11-2023', 'dd-mm-yyyy'), 10380, 1194);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20246, 579, to_date('24-12-2022', 'dd-mm-yyyy'), 10319, 1136);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20247, 377, to_date('26-04-2022', 'dd-mm-yyyy'), 10191, 920);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20248, 561, to_date('05-09-2023', 'dd-mm-yyyy'), 10039, 836);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20249, 465, to_date('21-06-2022', 'dd-mm-yyyy'), 10230, 1138);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20250, 180, to_date('11-01-2022', 'dd-mm-yyyy'), 10278, 916);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20251, 175, to_date('25-09-2023', 'dd-mm-yyyy'), 10374, 949);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20252, 50, to_date('23-02-2020', 'dd-mm-yyyy'), 10037, 912);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20253, 341, to_date('14-05-2023', 'dd-mm-yyyy'), 10361, 993);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20254, 318, to_date('09-10-2021', 'dd-mm-yyyy'), 10061, 905);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20255, 418, to_date('07-05-2023', 'dd-mm-yyyy'), 10012, 943);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20256, 131, to_date('05-10-2020', 'dd-mm-yyyy'), 10270, 1074);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20257, 888, to_date('11-06-2022', 'dd-mm-yyyy'), 10073, 915);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20258, 475, to_date('07-10-2022', 'dd-mm-yyyy'), 10214, 1171);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20259, 728, to_date('26-07-2021', 'dd-mm-yyyy'), 10080, 810);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20260, 846, to_date('18-03-2020', 'dd-mm-yyyy'), 10152, 1126);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20261, 939, to_date('05-05-2022', 'dd-mm-yyyy'), 10055, 1180);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20262, 678, to_date('06-07-2020', 'dd-mm-yyyy'), 10359, 1172);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20263, 136, to_date('12-12-2022', 'dd-mm-yyyy'), 10022, 817);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20264, 213, to_date('08-07-2023', 'dd-mm-yyyy'), 10259, 1100);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20265, 206, to_date('19-03-2023', 'dd-mm-yyyy'), 10152, 1067);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20266, 440, to_date('25-03-2020', 'dd-mm-yyyy'), 10174, 1035);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20267, 19, to_date('07-12-2022', 'dd-mm-yyyy'), 10330, 871);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20268, 90, to_date('10-10-2020', 'dd-mm-yyyy'), 10110, 936);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20269, 213, to_date('25-06-2021', 'dd-mm-yyyy'), 10346, 928);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20270, 700, to_date('06-08-2023', 'dd-mm-yyyy'), 10362, 827);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20271, 33, to_date('14-08-2022', 'dd-mm-yyyy'), 10318, 987);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20272, 730, to_date('02-12-2021', 'dd-mm-yyyy'), 10341, 950);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20273, 236, to_date('06-08-2020', 'dd-mm-yyyy'), 10129, 1061);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20274, 754, to_date('25-06-2023', 'dd-mm-yyyy'), 10033, 1037);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20275, 57, to_date('27-06-2023', 'dd-mm-yyyy'), 10299, 967);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20276, 708, to_date('19-06-2023', 'dd-mm-yyyy'), 10077, 1117);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20277, 239, to_date('09-10-2021', 'dd-mm-yyyy'), 10277, 991);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20278, 197, to_date('23-09-2022', 'dd-mm-yyyy'), 10073, 1042);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20279, 125, to_date('03-03-2022', 'dd-mm-yyyy'), 10157, 876);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20280, 871, to_date('04-04-2023', 'dd-mm-yyyy'), 10311, 1140);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20281, 811, to_date('27-09-2022', 'dd-mm-yyyy'), 10224, 1141);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20282, 860, to_date('17-11-2020', 'dd-mm-yyyy'), 10124, 1190);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20283, 365, to_date('12-03-2021', 'dd-mm-yyyy'), 10322, 1114);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20284, 268, to_date('23-03-2023', 'dd-mm-yyyy'), 10074, 927);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20285, 105, to_date('03-07-2020', 'dd-mm-yyyy'), 10243, 906);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20286, 744, to_date('07-12-2020', 'dd-mm-yyyy'), 10354, 869);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20287, 941, to_date('22-09-2023', 'dd-mm-yyyy'), 10348, 893);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20288, 91, to_date('15-02-2020', 'dd-mm-yyyy'), 10217, 1067);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20289, 777, to_date('01-02-2022', 'dd-mm-yyyy'), 10012, 1133);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20290, 965, to_date('06-02-2020', 'dd-mm-yyyy'), 10036, 986);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20291, 983, to_date('30-04-2020', 'dd-mm-yyyy'), 10287, 1109);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20292, 611, to_date('21-04-2020', 'dd-mm-yyyy'), 10379, 904);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20293, 918, to_date('15-04-2023', 'dd-mm-yyyy'), 10398, 990);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20294, 683, to_date('17-07-2020', 'dd-mm-yyyy'), 10120, 841);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20295, 529, to_date('20-09-2023', 'dd-mm-yyyy'), 10061, 823);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20296, 112, to_date('09-06-2022', 'dd-mm-yyyy'), 10366, 1012);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20297, 998, to_date('29-05-2023', 'dd-mm-yyyy'), 10025, 846);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20298, 45, to_date('19-02-2020', 'dd-mm-yyyy'), 10213, 1001);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20299, 463, to_date('28-06-2023', 'dd-mm-yyyy'), 10041, 930);
commit;
prompt 300 records committed...
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20300, 839, to_date('12-04-2020', 'dd-mm-yyyy'), 10325, 868);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20301, 798, to_date('14-01-2020', 'dd-mm-yyyy'), 10253, 1142);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20302, 121, to_date('17-03-2023', 'dd-mm-yyyy'), 10346, 974);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20303, 450, to_date('23-11-2020', 'dd-mm-yyyy'), 10019, 1037);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20304, 921, to_date('02-06-2021', 'dd-mm-yyyy'), 10120, 933);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20305, 351, to_date('10-10-2023', 'dd-mm-yyyy'), 10151, 869);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20306, 841, to_date('16-04-2023', 'dd-mm-yyyy'), 10356, 889);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20307, 877, to_date('30-07-2023', 'dd-mm-yyyy'), 10185, 1137);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20308, 320, to_date('09-01-2022', 'dd-mm-yyyy'), 10304, 1120);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20309, 881, to_date('27-12-2020', 'dd-mm-yyyy'), 10273, 842);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20310, 932, to_date('17-11-2021', 'dd-mm-yyyy'), 10059, 1164);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20311, 784, to_date('26-04-2020', 'dd-mm-yyyy'), 10101, 884);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20312, 766, to_date('08-08-2021', 'dd-mm-yyyy'), 10297, 873);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20313, 733, to_date('28-07-2020', 'dd-mm-yyyy'), 10033, 973);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20314, 858, to_date('05-03-2023', 'dd-mm-yyyy'), 10224, 988);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20315, 810, to_date('22-10-2023', 'dd-mm-yyyy'), 10077, 869);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20316, 690, to_date('26-09-2021', 'dd-mm-yyyy'), 10160, 842);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20317, 319, to_date('08-09-2020', 'dd-mm-yyyy'), 10279, 1150);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20318, 753, to_date('30-10-2020', 'dd-mm-yyyy'), 10346, 1189);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20319, 123, to_date('12-05-2021', 'dd-mm-yyyy'), 10144, 1095);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20320, 166, to_date('03-11-2020', 'dd-mm-yyyy'), 10371, 955);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20321, 51, to_date('06-07-2023', 'dd-mm-yyyy'), 10272, 908);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20322, 366, to_date('18-09-2020', 'dd-mm-yyyy'), 10029, 1115);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20323, 364, to_date('15-09-2021', 'dd-mm-yyyy'), 10231, 1050);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20324, 849, to_date('01-12-2020', 'dd-mm-yyyy'), 10398, 897);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20325, 281, to_date('27-12-2021', 'dd-mm-yyyy'), 10252, 1109);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20326, 990, to_date('25-08-2023', 'dd-mm-yyyy'), 10349, 1107);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20327, 578, to_date('14-09-2021', 'dd-mm-yyyy'), 10340, 984);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20328, 907, to_date('18-04-2022', 'dd-mm-yyyy'), 10074, 982);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20329, 234, to_date('05-08-2022', 'dd-mm-yyyy'), 10024, 809);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20330, 403, to_date('27-02-2020', 'dd-mm-yyyy'), 10041, 971);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20331, 156, to_date('12-02-2021', 'dd-mm-yyyy'), 10320, 1183);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20332, 964, to_date('22-05-2022', 'dd-mm-yyyy'), 10175, 1030);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20333, 952, to_date('23-01-2020', 'dd-mm-yyyy'), 10325, 942);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20334, 811, to_date('23-03-2021', 'dd-mm-yyyy'), 10065, 858);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20335, 773, to_date('08-05-2021', 'dd-mm-yyyy'), 10039, 844);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20336, 33, to_date('10-06-2022', 'dd-mm-yyyy'), 10192, 840);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20337, 222, to_date('25-02-2020', 'dd-mm-yyyy'), 10203, 1189);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20338, 773, to_date('18-01-2021', 'dd-mm-yyyy'), 10187, 935);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20339, 319, to_date('13-03-2020', 'dd-mm-yyyy'), 10368, 952);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20340, 463, to_date('12-04-2022', 'dd-mm-yyyy'), 10108, 1067);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20341, 527, to_date('22-05-2022', 'dd-mm-yyyy'), 10390, 855);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20342, 151, to_date('10-10-2023', 'dd-mm-yyyy'), 10349, 1063);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20343, 847, to_date('10-08-2022', 'dd-mm-yyyy'), 10146, 1151);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20344, 863, to_date('22-01-2023', 'dd-mm-yyyy'), 10170, 896);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20345, 972, to_date('27-10-2022', 'dd-mm-yyyy'), 10277, 943);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20346, 41, to_date('03-04-2022', 'dd-mm-yyyy'), 10049, 869);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20347, 501, to_date('31-05-2023', 'dd-mm-yyyy'), 10360, 1023);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20348, 47, to_date('10-01-2022', 'dd-mm-yyyy'), 10267, 916);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20349, 224, to_date('05-10-2020', 'dd-mm-yyyy'), 10093, 1033);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20350, 714, to_date('22-10-2020', 'dd-mm-yyyy'), 10111, 1025);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20351, 458, to_date('04-02-2022', 'dd-mm-yyyy'), 10320, 960);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20352, 974, to_date('04-04-2023', 'dd-mm-yyyy'), 10105, 1197);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20353, 455, to_date('21-07-2021', 'dd-mm-yyyy'), 10273, 949);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20354, 545, to_date('15-12-2021', 'dd-mm-yyyy'), 10065, 918);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20355, 866, to_date('15-07-2021', 'dd-mm-yyyy'), 10234, 1043);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20356, 678, to_date('24-05-2020', 'dd-mm-yyyy'), 10180, 964);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20357, 272, to_date('18-04-2023', 'dd-mm-yyyy'), 10038, 844);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20358, 964, to_date('03-03-2021', 'dd-mm-yyyy'), 10318, 1128);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20359, 778, to_date('02-10-2022', 'dd-mm-yyyy'), 10181, 1110);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20360, 211, to_date('09-06-2023', 'dd-mm-yyyy'), 10355, 1072);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20361, 661, to_date('12-08-2023', 'dd-mm-yyyy'), 10370, 865);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20362, 381, to_date('21-08-2021', 'dd-mm-yyyy'), 10331, 1104);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20363, 92, to_date('31-08-2023', 'dd-mm-yyyy'), 10288, 839);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20364, 582, to_date('13-06-2021', 'dd-mm-yyyy'), 10032, 881);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20365, 918, to_date('26-05-2022', 'dd-mm-yyyy'), 10185, 836);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20366, 133, to_date('31-12-2020', 'dd-mm-yyyy'), 10393, 836);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20367, 493, to_date('29-10-2021', 'dd-mm-yyyy'), 10102, 1019);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20368, 688, to_date('01-05-2021', 'dd-mm-yyyy'), 10330, 1131);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20369, 593, to_date('27-07-2020', 'dd-mm-yyyy'), 10108, 1129);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20370, 416, to_date('07-02-2022', 'dd-mm-yyyy'), 10197, 934);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20371, 378, to_date('13-03-2021', 'dd-mm-yyyy'), 10371, 823);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20372, 255, to_date('26-07-2022', 'dd-mm-yyyy'), 10261, 818);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20373, 422, to_date('23-10-2022', 'dd-mm-yyyy'), 10250, 1140);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20374, 222, to_date('04-10-2023', 'dd-mm-yyyy'), 10215, 1097);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20375, 806, to_date('16-11-2022', 'dd-mm-yyyy'), 10013, 1088);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20376, 780, to_date('21-12-2023', 'dd-mm-yyyy'), 10101, 867);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20377, 270, to_date('27-04-2020', 'dd-mm-yyyy'), 10381, 962);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20378, 280, to_date('21-06-2023', 'dd-mm-yyyy'), 10271, 994);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20379, 431, to_date('09-11-2023', 'dd-mm-yyyy'), 10293, 1184);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20380, 457, to_date('11-06-2022', 'dd-mm-yyyy'), 10366, 1008);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20381, 62, to_date('28-07-2021', 'dd-mm-yyyy'), 10105, 1065);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20382, 992, to_date('19-03-2020', 'dd-mm-yyyy'), 10119, 1136);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20383, 437, to_date('10-10-2023', 'dd-mm-yyyy'), 10200, 1097);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20384, 129, to_date('16-09-2023', 'dd-mm-yyyy'), 10390, 1052);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20385, 728, to_date('23-01-2023', 'dd-mm-yyyy'), 10238, 1166);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20386, 369, to_date('01-03-2021', 'dd-mm-yyyy'), 10017, 953);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20387, 479, to_date('01-09-2023', 'dd-mm-yyyy'), 10218, 1095);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20388, 213, to_date('30-01-2021', 'dd-mm-yyyy'), 10098, 964);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20389, 132, to_date('17-01-2020', 'dd-mm-yyyy'), 10178, 1106);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20390, 973, to_date('14-06-2020', 'dd-mm-yyyy'), 10099, 864);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20391, 619, to_date('15-09-2020', 'dd-mm-yyyy'), 10106, 1010);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20392, 645, to_date('16-03-2022', 'dd-mm-yyyy'), 10180, 940);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20393, 17, to_date('21-04-2021', 'dd-mm-yyyy'), 10086, 924);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20394, 847, to_date('03-12-2021', 'dd-mm-yyyy'), 10154, 1160);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20395, 264, to_date('20-12-2022', 'dd-mm-yyyy'), 10267, 1108);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20396, 813, to_date('21-10-2023', 'dd-mm-yyyy'), 10266, 1080);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20397, 939, to_date('22-11-2023', 'dd-mm-yyyy'), 10255, 934);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20398, 459, to_date('14-11-2021', 'dd-mm-yyyy'), 10200, 870);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (20399, 102, to_date('02-03-2020', 'dd-mm-yyyy'), 10329, 970);
commit;
prompt 400 records loaded
prompt Loading SALES...
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100000, to_date('30-12-2021', 'dd-mm-yyyy'), 3046, 266, 788);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100001, to_date('20-11-2020', 'dd-mm-yyyy'), 2490, 256, 781);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100002, to_date('03-08-2022', 'dd-mm-yyyy'), 3059, 18, 642);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100003, to_date('02-03-2021', 'dd-mm-yyyy'), 4486, 326, 524);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100004, to_date('15-05-2023', 'dd-mm-yyyy'), 2903, 323, 711);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100005, to_date('04-10-2022', 'dd-mm-yyyy'), 2569, 205, 518);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100006, to_date('15-04-2021', 'dd-mm-yyyy'), 320, 62, 698);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100007, to_date('03-04-2022', 'dd-mm-yyyy'), 1285, 54, 469);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100008, to_date('18-08-2022', 'dd-mm-yyyy'), 582, 149, 792);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100009, to_date('23-08-2021', 'dd-mm-yyyy'), 1729, 176, 417);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100010, to_date('19-08-2023', 'dd-mm-yyyy'), 4004, 237, 499);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100011, to_date('29-12-2021', 'dd-mm-yyyy'), 2039, 16, 533);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100012, to_date('18-04-2020', 'dd-mm-yyyy'), 2230, 31, 797);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100013, to_date('18-05-2023', 'dd-mm-yyyy'), 1953, 383, 639);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100014, to_date('09-06-2020', 'dd-mm-yyyy'), 3527, 221, 425);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100015, to_date('19-01-2023', 'dd-mm-yyyy'), 1432, 101, 655);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100016, to_date('28-12-2021', 'dd-mm-yyyy'), 2247, 246, 688);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100017, to_date('20-11-2023', 'dd-mm-yyyy'), 3339, 283, 769);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100018, to_date('24-07-2021', 'dd-mm-yyyy'), 2249, 79, 794);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100019, to_date('20-01-2021', 'dd-mm-yyyy'), 217, 230, 533);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100020, to_date('27-03-2021', 'dd-mm-yyyy'), 4452, 42, 509);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100021, to_date('12-12-2022', 'dd-mm-yyyy'), 45, 154, 485);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100022, to_date('19-08-2021', 'dd-mm-yyyy'), 3435, 239, 541);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100023, to_date('12-05-2022', 'dd-mm-yyyy'), 1161, 330, 695);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100024, to_date('18-03-2021', 'dd-mm-yyyy'), 3060, 19, 652);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100025, to_date('06-12-2021', 'dd-mm-yyyy'), 1183, 267, 636);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100026, to_date('28-10-2021', 'dd-mm-yyyy'), 1216, 266, 688);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100027, to_date('19-10-2021', 'dd-mm-yyyy'), 4988, 309, 780);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100028, to_date('08-07-2020', 'dd-mm-yyyy'), 3576, 103, 539);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100029, to_date('24-07-2021', 'dd-mm-yyyy'), 1817, 62, 719);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100030, to_date('05-08-2023', 'dd-mm-yyyy'), 1479, 39, 623);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100031, to_date('03-06-2020', 'dd-mm-yyyy'), 1333, 35, 610);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100032, to_date('28-11-2022', 'dd-mm-yyyy'), 3773, 320, 492);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100033, to_date('28-08-2023', 'dd-mm-yyyy'), 3859, 123, 749);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100034, to_date('07-06-2022', 'dd-mm-yyyy'), 2847, 125, 771);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100035, to_date('03-04-2023', 'dd-mm-yyyy'), 4617, 103, 463);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100036, to_date('18-01-2023', 'dd-mm-yyyy'), 4604, 370, 411);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100037, to_date('17-11-2020', 'dd-mm-yyyy'), 2029, 155, 737);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100038, to_date('13-08-2021', 'dd-mm-yyyy'), 2601, 153, 475);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100039, to_date('13-01-2021', 'dd-mm-yyyy'), 78, 217, 554);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100040, to_date('07-04-2020', 'dd-mm-yyyy'), 1161, 6, 446);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100041, to_date('02-07-2022', 'dd-mm-yyyy'), 4759, 155, 568);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100042, to_date('16-12-2021', 'dd-mm-yyyy'), 2611, 391, 664);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100043, to_date('29-12-2023', 'dd-mm-yyyy'), 4604, 363, 502);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100044, to_date('17-04-2020', 'dd-mm-yyyy'), 3571, 204, 478);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100045, to_date('16-02-2020', 'dd-mm-yyyy'), 193, 389, 668);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100046, to_date('22-07-2023', 'dd-mm-yyyy'), 284, 119, 534);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100047, to_date('26-07-2023', 'dd-mm-yyyy'), 2779, 383, 412);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100048, to_date('10-01-2021', 'dd-mm-yyyy'), 2996, 342, 785);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100049, to_date('20-06-2021', 'dd-mm-yyyy'), 2035, 170, 686);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100050, to_date('17-07-2023', 'dd-mm-yyyy'), 4478, 4, 620);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100051, to_date('02-03-2022', 'dd-mm-yyyy'), 2728, 350, 746);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100052, to_date('11-04-2022', 'dd-mm-yyyy'), 2515, 172, 726);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100053, to_date('01-02-2020', 'dd-mm-yyyy'), 581, 226, 568);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100054, to_date('30-10-2021', 'dd-mm-yyyy'), 1498, 79, 671);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100055, to_date('07-12-2022', 'dd-mm-yyyy'), 2107, 146, 600);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100056, to_date('04-07-2023', 'dd-mm-yyyy'), 3089, 197, 610);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100057, to_date('16-02-2021', 'dd-mm-yyyy'), 3582, 283, 428);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100058, to_date('16-11-2022', 'dd-mm-yyyy'), 952, 113, 724);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100059, to_date('24-06-2023', 'dd-mm-yyyy'), 4021, 232, 777);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100060, to_date('03-08-2021', 'dd-mm-yyyy'), 4491, 46, 773);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100061, to_date('07-02-2023', 'dd-mm-yyyy'), 2241, 234, 428);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100062, to_date('01-06-2021', 'dd-mm-yyyy'), 1751, 386, 583);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100063, to_date('18-08-2021', 'dd-mm-yyyy'), 2977, 26, 466);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100064, to_date('25-07-2020', 'dd-mm-yyyy'), 1256, 48, 653);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100065, to_date('10-08-2023', 'dd-mm-yyyy'), 2093, 116, 649);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100066, to_date('23-03-2020', 'dd-mm-yyyy'), 3023, 68, 490);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100067, to_date('12-03-2021', 'dd-mm-yyyy'), 803, 279, 709);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100068, to_date('19-05-2021', 'dd-mm-yyyy'), 3581, 7, 666);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100069, to_date('01-02-2021', 'dd-mm-yyyy'), 3984, 86, 569);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100070, to_date('11-11-2023', 'dd-mm-yyyy'), 61, 393, 603);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100071, to_date('13-09-2021', 'dd-mm-yyyy'), 2583, 248, 687);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100072, to_date('24-08-2023', 'dd-mm-yyyy'), 3320, 378, 479);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100073, to_date('05-08-2020', 'dd-mm-yyyy'), 4997, 395, 535);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100074, to_date('31-05-2020', 'dd-mm-yyyy'), 232, 231, 466);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100075, to_date('25-02-2020', 'dd-mm-yyyy'), 2629, 72, 786);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100076, to_date('15-05-2023', 'dd-mm-yyyy'), 4868, 241, 485);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100077, to_date('08-07-2023', 'dd-mm-yyyy'), 4388, 163, 442);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100078, to_date('08-04-2023', 'dd-mm-yyyy'), 3945, 64, 492);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100079, to_date('07-10-2020', 'dd-mm-yyyy'), 381, 345, 476);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100080, to_date('26-09-2022', 'dd-mm-yyyy'), 1143, 76, 482);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100081, to_date('06-05-2021', 'dd-mm-yyyy'), 4517, 155, 404);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100082, to_date('29-10-2020', 'dd-mm-yyyy'), 603, 365, 629);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100083, to_date('28-09-2020', 'dd-mm-yyyy'), 1352, 95, 583);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100084, to_date('30-10-2023', 'dd-mm-yyyy'), 4464, 140, 741);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100085, to_date('02-06-2021', 'dd-mm-yyyy'), 1800, 353, 631);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100086, to_date('20-04-2022', 'dd-mm-yyyy'), 4467, 368, 644);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100087, to_date('30-12-2023', 'dd-mm-yyyy'), 3080, 354, 771);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100088, to_date('26-05-2022', 'dd-mm-yyyy'), 2573, 38, 689);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100089, to_date('03-09-2020', 'dd-mm-yyyy'), 2623, 335, 504);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100090, to_date('02-06-2023', 'dd-mm-yyyy'), 697, 44, 789);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100091, to_date('03-12-2022', 'dd-mm-yyyy'), 1067, 139, 607);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100092, to_date('07-08-2021', 'dd-mm-yyyy'), 4485, 302, 776);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100093, to_date('25-05-2023', 'dd-mm-yyyy'), 4311, 47, 451);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100094, to_date('12-03-2020', 'dd-mm-yyyy'), 1188, 79, 483);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100095, to_date('17-02-2020', 'dd-mm-yyyy'), 4677, 21, 646);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100096, to_date('02-10-2021', 'dd-mm-yyyy'), 1500, 364, 756);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100097, to_date('18-12-2022', 'dd-mm-yyyy'), 1054, 180, 617);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100098, to_date('09-09-2022', 'dd-mm-yyyy'), 585, 245, 585);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100099, to_date('18-03-2022', 'dd-mm-yyyy'), 3141, 103, 697);
commit;
prompt 100 records committed...
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100100, to_date('31-01-2022', 'dd-mm-yyyy'), 3071, 131, 762);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100101, to_date('09-08-2023', 'dd-mm-yyyy'), 4808, 145, 747);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100102, to_date('27-09-2020', 'dd-mm-yyyy'), 2174, 179, 467);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100103, to_date('20-06-2021', 'dd-mm-yyyy'), 1430, 395, 504);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100104, to_date('25-06-2022', 'dd-mm-yyyy'), 2810, 362, 774);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100105, to_date('23-02-2022', 'dd-mm-yyyy'), 1311, 45, 453);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100106, to_date('20-09-2021', 'dd-mm-yyyy'), 3846, 153, 690);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100107, to_date('08-09-2021', 'dd-mm-yyyy'), 1221, 389, 420);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100108, to_date('30-03-2021', 'dd-mm-yyyy'), 4368, 239, 504);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100109, to_date('07-10-2021', 'dd-mm-yyyy'), 932, 253, 696);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100110, to_date('16-04-2020', 'dd-mm-yyyy'), 4023, 255, 481);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100111, to_date('16-11-2023', 'dd-mm-yyyy'), 1841, 234, 481);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100112, to_date('30-10-2020', 'dd-mm-yyyy'), 2420, 147, 463);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100113, to_date('26-09-2021', 'dd-mm-yyyy'), 4664, 186, 456);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100114, to_date('23-02-2020', 'dd-mm-yyyy'), 2595, 358, 406);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100115, to_date('01-01-2020', 'dd-mm-yyyy'), 1196, 309, 679);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100116, to_date('11-08-2021', 'dd-mm-yyyy'), 3552, 43, 638);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100117, to_date('04-03-2023', 'dd-mm-yyyy'), 75, 281, 607);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100118, to_date('07-10-2023', 'dd-mm-yyyy'), 1854, 101, 644);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100119, to_date('09-10-2022', 'dd-mm-yyyy'), 1701, 1, 442);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100120, to_date('11-08-2023', 'dd-mm-yyyy'), 2252, 238, 772);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100121, to_date('16-10-2022', 'dd-mm-yyyy'), 2166, 369, 598);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100122, to_date('01-03-2022', 'dd-mm-yyyy'), 2439, 57, 467);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100123, to_date('10-05-2023', 'dd-mm-yyyy'), 1235, 79, 504);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100124, to_date('08-04-2020', 'dd-mm-yyyy'), 1804, 166, 631);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100125, to_date('29-08-2022', 'dd-mm-yyyy'), 4403, 48, 720);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100126, to_date('23-08-2020', 'dd-mm-yyyy'), 4275, 116, 507);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100127, to_date('23-02-2021', 'dd-mm-yyyy'), 4054, 266, 785);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100128, to_date('09-03-2020', 'dd-mm-yyyy'), 252, 363, 686);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100129, to_date('10-12-2023', 'dd-mm-yyyy'), 4601, 264, 786);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100130, to_date('15-07-2020', 'dd-mm-yyyy'), 2513, 253, 639);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100131, to_date('08-07-2021', 'dd-mm-yyyy'), 1768, 20, 659);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100132, to_date('15-11-2020', 'dd-mm-yyyy'), 1320, 38, 781);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100133, to_date('23-08-2020', 'dd-mm-yyyy'), 874, 79, 405);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100134, to_date('20-12-2020', 'dd-mm-yyyy'), 3442, 108, 651);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100135, to_date('22-07-2021', 'dd-mm-yyyy'), 4222, 104, 438);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100136, to_date('01-07-2022', 'dd-mm-yyyy'), 370, 254, 417);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100137, to_date('18-05-2021', 'dd-mm-yyyy'), 2552, 250, 456);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100138, to_date('04-08-2020', 'dd-mm-yyyy'), 469, 156, 519);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100139, to_date('28-10-2023', 'dd-mm-yyyy'), 498, 163, 439);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100140, to_date('21-08-2021', 'dd-mm-yyyy'), 316, 295, 618);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100141, to_date('05-02-2023', 'dd-mm-yyyy'), 1169, 3, 565);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100142, to_date('07-05-2023', 'dd-mm-yyyy'), 10, 88, 686);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100143, to_date('08-02-2022', 'dd-mm-yyyy'), 4780, 297, 462);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100144, to_date('13-01-2021', 'dd-mm-yyyy'), 2577, 49, 612);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100145, to_date('09-11-2020', 'dd-mm-yyyy'), 1346, 209, 576);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100146, to_date('17-03-2020', 'dd-mm-yyyy'), 2460, 380, 734);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100147, to_date('01-03-2023', 'dd-mm-yyyy'), 2378, 241, 467);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100148, to_date('05-05-2023', 'dd-mm-yyyy'), 3017, 378, 502);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100149, to_date('22-07-2021', 'dd-mm-yyyy'), 1761, 158, 432);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100150, to_date('10-12-2022', 'dd-mm-yyyy'), 3133, 275, 458);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100151, to_date('22-06-2020', 'dd-mm-yyyy'), 583, 134, 447);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100152, to_date('10-11-2020', 'dd-mm-yyyy'), 2869, 295, 745);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100153, to_date('10-09-2021', 'dd-mm-yyyy'), 1080, 332, 444);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100154, to_date('02-11-2021', 'dd-mm-yyyy'), 3176, 149, 543);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100155, to_date('30-12-2023', 'dd-mm-yyyy'), 4641, 97, 703);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100156, to_date('26-04-2021', 'dd-mm-yyyy'), 4676, 137, 425);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100157, to_date('10-02-2021', 'dd-mm-yyyy'), 3880, 385, 771);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100158, to_date('26-06-2023', 'dd-mm-yyyy'), 522, 294, 440);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100159, to_date('24-11-2021', 'dd-mm-yyyy'), 3721, 209, 517);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100160, to_date('04-08-2021', 'dd-mm-yyyy'), 3247, 343, 726);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100161, to_date('05-10-2020', 'dd-mm-yyyy'), 1621, 314, 492);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100162, to_date('29-06-2020', 'dd-mm-yyyy'), 813, 89, 637);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100163, to_date('03-05-2022', 'dd-mm-yyyy'), 1792, 78, 432);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100164, to_date('21-06-2021', 'dd-mm-yyyy'), 1562, 226, 410);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100165, to_date('05-06-2020', 'dd-mm-yyyy'), 3530, 35, 679);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100166, to_date('09-04-2021', 'dd-mm-yyyy'), 3359, 376, 539);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100167, to_date('07-03-2023', 'dd-mm-yyyy'), 3589, 22, 524);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100168, to_date('30-05-2021', 'dd-mm-yyyy'), 1733, 350, 492);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100169, to_date('03-07-2020', 'dd-mm-yyyy'), 2599, 158, 679);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100170, to_date('01-10-2023', 'dd-mm-yyyy'), 2072, 235, 738);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100171, to_date('09-10-2021', 'dd-mm-yyyy'), 577, 238, 675);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100172, to_date('08-04-2020', 'dd-mm-yyyy'), 939, 105, 512);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100173, to_date('23-09-2023', 'dd-mm-yyyy'), 1475, 362, 782);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100174, to_date('24-02-2021', 'dd-mm-yyyy'), 1381, 159, 492);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100175, to_date('05-09-2020', 'dd-mm-yyyy'), 1828, 381, 453);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100176, to_date('24-01-2021', 'dd-mm-yyyy'), 2355, 81, 413);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100177, to_date('05-12-2020', 'dd-mm-yyyy'), 3413, 172, 500);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100178, to_date('27-09-2023', 'dd-mm-yyyy'), 2188, 28, 798);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100179, to_date('11-06-2021', 'dd-mm-yyyy'), 24, 337, 583);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100180, to_date('25-09-2020', 'dd-mm-yyyy'), 1103, 43, 416);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100181, to_date('16-10-2020', 'dd-mm-yyyy'), 3233, 129, 439);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100182, to_date('18-07-2020', 'dd-mm-yyyy'), 2808, 287, 668);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100183, to_date('29-04-2022', 'dd-mm-yyyy'), 2337, 199, 422);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100184, to_date('13-11-2023', 'dd-mm-yyyy'), 172, 106, 492);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100185, to_date('07-08-2023', 'dd-mm-yyyy'), 3225, 171, 577);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100186, to_date('27-02-2021', 'dd-mm-yyyy'), 4895, 315, 602);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100187, to_date('22-01-2020', 'dd-mm-yyyy'), 1421, 242, 636);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100188, to_date('17-06-2020', 'dd-mm-yyyy'), 1364, 311, 640);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100189, to_date('21-12-2022', 'dd-mm-yyyy'), 4107, 4, 538);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100190, to_date('08-06-2021', 'dd-mm-yyyy'), 4395, 9, 465);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100191, to_date('09-08-2023', 'dd-mm-yyyy'), 1299, 96, 676);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100192, to_date('06-09-2023', 'dd-mm-yyyy'), 1241, 201, 760);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100193, to_date('23-08-2023', 'dd-mm-yyyy'), 966, 277, 667);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100194, to_date('10-04-2021', 'dd-mm-yyyy'), 2465, 149, 564);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100195, to_date('20-11-2023', 'dd-mm-yyyy'), 3328, 324, 649);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100196, to_date('06-08-2023', 'dd-mm-yyyy'), 2045, 391, 531);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100197, to_date('06-03-2023', 'dd-mm-yyyy'), 4159, 159, 702);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100198, to_date('12-05-2022', 'dd-mm-yyyy'), 1417, 381, 716);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100199, to_date('25-07-2023', 'dd-mm-yyyy'), 2145, 396, 796);
commit;
prompt 200 records committed...
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100200, to_date('09-12-2020', 'dd-mm-yyyy'), 2648, 149, 482);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100201, to_date('30-09-2021', 'dd-mm-yyyy'), 321, 115, 456);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100202, to_date('28-11-2021', 'dd-mm-yyyy'), 662, 388, 532);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100203, to_date('04-10-2022', 'dd-mm-yyyy'), 1574, 263, 565);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100204, to_date('08-11-2020', 'dd-mm-yyyy'), 4483, 167, 670);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100205, to_date('16-11-2023', 'dd-mm-yyyy'), 3213, 277, 483);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100206, to_date('05-06-2022', 'dd-mm-yyyy'), 2639, 267, 483);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100207, to_date('25-10-2020', 'dd-mm-yyyy'), 589, 333, 490);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100208, to_date('23-08-2022', 'dd-mm-yyyy'), 2494, 139, 552);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100209, to_date('03-03-2020', 'dd-mm-yyyy'), 4744, 21, 761);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100210, to_date('13-06-2021', 'dd-mm-yyyy'), 3766, 99, 583);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100211, to_date('24-01-2022', 'dd-mm-yyyy'), 4232, 244, 460);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100212, to_date('08-07-2021', 'dd-mm-yyyy'), 1048, 333, 466);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100213, to_date('07-02-2021', 'dd-mm-yyyy'), 864, 343, 562);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100214, to_date('20-04-2021', 'dd-mm-yyyy'), 371, 334, 659);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100215, to_date('18-07-2021', 'dd-mm-yyyy'), 4586, 44, 799);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100216, to_date('07-05-2022', 'dd-mm-yyyy'), 4885, 367, 697);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100217, to_date('24-09-2022', 'dd-mm-yyyy'), 2480, 234, 731);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100218, to_date('04-11-2022', 'dd-mm-yyyy'), 4595, 154, 627);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100219, to_date('08-10-2022', 'dd-mm-yyyy'), 1674, 159, 540);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100220, to_date('02-06-2021', 'dd-mm-yyyy'), 95, 386, 561);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100221, to_date('17-06-2020', 'dd-mm-yyyy'), 1459, 251, 756);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100222, to_date('20-03-2023', 'dd-mm-yyyy'), 415, 258, 768);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100223, to_date('24-06-2023', 'dd-mm-yyyy'), 4392, 174, 498);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100224, to_date('04-03-2020', 'dd-mm-yyyy'), 4959, 233, 674);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100225, to_date('19-10-2022', 'dd-mm-yyyy'), 1505, 99, 647);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100226, to_date('07-08-2021', 'dd-mm-yyyy'), 4467, 30, 403);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100227, to_date('20-05-2021', 'dd-mm-yyyy'), 1504, 4, 745);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100228, to_date('18-12-2022', 'dd-mm-yyyy'), 1012, 230, 430);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100229, to_date('07-02-2021', 'dd-mm-yyyy'), 4124, 199, 410);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100230, to_date('16-12-2020', 'dd-mm-yyyy'), 2101, 319, 567);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100231, to_date('03-12-2023', 'dd-mm-yyyy'), 2502, 273, 488);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100232, to_date('21-10-2022', 'dd-mm-yyyy'), 3857, 347, 673);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100233, to_date('28-04-2023', 'dd-mm-yyyy'), 4569, 69, 720);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100234, to_date('17-10-2021', 'dd-mm-yyyy'), 3218, 212, 684);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100235, to_date('29-12-2021', 'dd-mm-yyyy'), 3607, 284, 742);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100236, to_date('12-02-2023', 'dd-mm-yyyy'), 4201, 178, 776);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100237, to_date('04-10-2023', 'dd-mm-yyyy'), 2758, 294, 401);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100238, to_date('21-11-2023', 'dd-mm-yyyy'), 3276, 206, 443);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100239, to_date('26-09-2023', 'dd-mm-yyyy'), 3675, 399, 605);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100240, to_date('26-06-2023', 'dd-mm-yyyy'), 3736, 120, 513);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100241, to_date('20-10-2020', 'dd-mm-yyyy'), 4208, 103, 693);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100242, to_date('24-01-2020', 'dd-mm-yyyy'), 4193, 190, 473);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100243, to_date('30-03-2020', 'dd-mm-yyyy'), 147, 10, 733);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100244, to_date('27-05-2021', 'dd-mm-yyyy'), 1096, 146, 735);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100245, to_date('14-09-2022', 'dd-mm-yyyy'), 1009, 146, 737);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100246, to_date('03-12-2021', 'dd-mm-yyyy'), 306, 213, 615);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100247, to_date('07-05-2023', 'dd-mm-yyyy'), 4951, 315, 415);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100248, to_date('09-01-2022', 'dd-mm-yyyy'), 2775, 175, 445);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100249, to_date('21-04-2021', 'dd-mm-yyyy'), 2704, 66, 640);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100250, to_date('10-08-2021', 'dd-mm-yyyy'), 4265, 62, 603);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100251, to_date('05-05-2023', 'dd-mm-yyyy'), 525, 296, 649);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100252, to_date('29-11-2023', 'dd-mm-yyyy'), 4106, 57, 673);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100253, to_date('16-10-2021', 'dd-mm-yyyy'), 2290, 74, 558);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100254, to_date('17-07-2021', 'dd-mm-yyyy'), 3048, 38, 732);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100255, to_date('29-09-2022', 'dd-mm-yyyy'), 639, 290, 415);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100256, to_date('15-10-2020', 'dd-mm-yyyy'), 167, 337, 752);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100257, to_date('15-06-2020', 'dd-mm-yyyy'), 2107, 128, 566);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100258, to_date('09-03-2020', 'dd-mm-yyyy'), 3816, 129, 540);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100259, to_date('18-01-2022', 'dd-mm-yyyy'), 1426, 366, 553);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100260, to_date('18-04-2023', 'dd-mm-yyyy'), 1702, 241, 590);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100261, to_date('07-06-2022', 'dd-mm-yyyy'), 4791, 302, 535);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100262, to_date('14-10-2021', 'dd-mm-yyyy'), 4904, 388, 676);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100263, to_date('22-06-2021', 'dd-mm-yyyy'), 2280, 300, 435);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100264, to_date('20-09-2020', 'dd-mm-yyyy'), 1109, 40, 549);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100265, to_date('14-06-2023', 'dd-mm-yyyy'), 4230, 366, 407);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100266, to_date('14-02-2022', 'dd-mm-yyyy'), 1746, 103, 780);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100267, to_date('15-09-2022', 'dd-mm-yyyy'), 1801, 349, 640);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100268, to_date('08-10-2022', 'dd-mm-yyyy'), 3331, 234, 515);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100269, to_date('05-08-2023', 'dd-mm-yyyy'), 1474, 160, 470);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100270, to_date('05-04-2022', 'dd-mm-yyyy'), 2786, 176, 557);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100271, to_date('27-08-2022', 'dd-mm-yyyy'), 3718, 27, 433);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100272, to_date('22-04-2021', 'dd-mm-yyyy'), 1831, 321, 579);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100273, to_date('14-01-2021', 'dd-mm-yyyy'), 674, 365, 432);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100274, to_date('20-04-2022', 'dd-mm-yyyy'), 465, 297, 452);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100275, to_date('15-03-2023', 'dd-mm-yyyy'), 2859, 79, 435);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100276, to_date('10-02-2020', 'dd-mm-yyyy'), 4483, 378, 508);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100277, to_date('24-10-2021', 'dd-mm-yyyy'), 43, 85, 497);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100278, to_date('18-02-2023', 'dd-mm-yyyy'), 2106, 120, 721);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100279, to_date('15-12-2020', 'dd-mm-yyyy'), 1054, 59, 502);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100280, to_date('11-08-2020', 'dd-mm-yyyy'), 4566, 228, 420);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100281, to_date('16-07-2021', 'dd-mm-yyyy'), 2768, 14, 439);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100282, to_date('05-03-2020', 'dd-mm-yyyy'), 901, 35, 514);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100283, to_date('29-12-2020', 'dd-mm-yyyy'), 3082, 299, 796);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100284, to_date('28-08-2023', 'dd-mm-yyyy'), 1659, 221, 661);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100285, to_date('10-03-2023', 'dd-mm-yyyy'), 2975, 20, 679);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100286, to_date('18-02-2021', 'dd-mm-yyyy'), 1804, 346, 542);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100287, to_date('14-08-2022', 'dd-mm-yyyy'), 2634, 291, 463);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100288, to_date('02-04-2023', 'dd-mm-yyyy'), 2580, 10, 478);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100289, to_date('30-10-2022', 'dd-mm-yyyy'), 1641, 310, 558);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100290, to_date('03-10-2023', 'dd-mm-yyyy'), 2500, 44, 557);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100291, to_date('06-02-2021', 'dd-mm-yyyy'), 3213, 256, 709);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100292, to_date('23-04-2020', 'dd-mm-yyyy'), 2358, 119, 697);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100293, to_date('18-05-2023', 'dd-mm-yyyy'), 2533, 214, 613);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100294, to_date('22-07-2021', 'dd-mm-yyyy'), 4327, 384, 426);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100295, to_date('10-06-2021', 'dd-mm-yyyy'), 4094, 323, 671);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100296, to_date('29-05-2020', 'dd-mm-yyyy'), 136, 326, 793);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100297, to_date('07-05-2020', 'dd-mm-yyyy'), 3165, 154, 452);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100298, to_date('10-08-2021', 'dd-mm-yyyy'), 3226, 58, 403);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100299, to_date('09-02-2020', 'dd-mm-yyyy'), 1264, 103, 495);
commit;
prompt 300 records committed...
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100300, to_date('15-07-2023', 'dd-mm-yyyy'), 118, 32, 771);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100301, to_date('09-08-2023', 'dd-mm-yyyy'), 726, 22, 627);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100302, to_date('04-04-2022', 'dd-mm-yyyy'), 661, 372, 610);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100303, to_date('15-10-2022', 'dd-mm-yyyy'), 3329, 263, 410);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100304, to_date('31-10-2021', 'dd-mm-yyyy'), 2509, 239, 636);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100305, to_date('07-02-2023', 'dd-mm-yyyy'), 2994, 354, 512);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100306, to_date('17-11-2022', 'dd-mm-yyyy'), 4554, 18, 505);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100307, to_date('25-02-2022', 'dd-mm-yyyy'), 2502, 101, 603);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100308, to_date('11-05-2021', 'dd-mm-yyyy'), 4464, 326, 669);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100309, to_date('26-08-2022', 'dd-mm-yyyy'), 4321, 306, 577);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100310, to_date('24-08-2021', 'dd-mm-yyyy'), 274, 253, 762);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100311, to_date('03-08-2023', 'dd-mm-yyyy'), 497, 323, 696);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100312, to_date('31-10-2023', 'dd-mm-yyyy'), 1015, 21, 506);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100313, to_date('27-08-2021', 'dd-mm-yyyy'), 1539, 27, 662);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100314, to_date('06-04-2021', 'dd-mm-yyyy'), 1484, 71, 745);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100315, to_date('12-12-2022', 'dd-mm-yyyy'), 4472, 216, 416);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100316, to_date('16-05-2020', 'dd-mm-yyyy'), 983, 177, 607);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100317, to_date('13-11-2020', 'dd-mm-yyyy'), 4879, 235, 654);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100318, to_date('18-09-2022', 'dd-mm-yyyy'), 1168, 179, 783);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100319, to_date('27-04-2020', 'dd-mm-yyyy'), 3009, 23, 676);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100320, to_date('09-04-2021', 'dd-mm-yyyy'), 2957, 347, 537);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100321, to_date('20-02-2020', 'dd-mm-yyyy'), 3968, 192, 759);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100322, to_date('08-01-2023', 'dd-mm-yyyy'), 2509, 170, 441);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100323, to_date('04-10-2021', 'dd-mm-yyyy'), 1990, 121, 647);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100324, to_date('22-09-2021', 'dd-mm-yyyy'), 1226, 362, 434);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100325, to_date('29-02-2020', 'dd-mm-yyyy'), 3706, 81, 579);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100326, to_date('29-12-2020', 'dd-mm-yyyy'), 4856, 104, 403);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100327, to_date('15-01-2021', 'dd-mm-yyyy'), 573, 190, 431);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100328, to_date('04-08-2023', 'dd-mm-yyyy'), 1680, 301, 492);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100329, to_date('27-03-2020', 'dd-mm-yyyy'), 243, 178, 587);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100330, to_date('23-12-2022', 'dd-mm-yyyy'), 4657, 74, 738);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100331, to_date('02-06-2021', 'dd-mm-yyyy'), 2114, 394, 539);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100332, to_date('17-02-2021', 'dd-mm-yyyy'), 2788, 69, 429);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100333, to_date('03-01-2020', 'dd-mm-yyyy'), 1878, 27, 403);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100334, to_date('05-08-2020', 'dd-mm-yyyy'), 1387, 191, 784);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100335, to_date('12-05-2021', 'dd-mm-yyyy'), 130, 154, 568);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100336, to_date('12-10-2022', 'dd-mm-yyyy'), 1522, 171, 567);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100337, to_date('18-03-2021', 'dd-mm-yyyy'), 55, 17, 666);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100338, to_date('07-07-2020', 'dd-mm-yyyy'), 3475, 149, 615);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100339, to_date('26-04-2020', 'dd-mm-yyyy'), 4185, 121, 670);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100340, to_date('13-11-2020', 'dd-mm-yyyy'), 4276, 88, 503);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100341, to_date('08-06-2021', 'dd-mm-yyyy'), 235, 157, 511);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100342, to_date('09-03-2022', 'dd-mm-yyyy'), 4284, 9, 521);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100343, to_date('16-06-2020', 'dd-mm-yyyy'), 903, 154, 630);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100344, to_date('26-05-2021', 'dd-mm-yyyy'), 2847, 252, 588);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100345, to_date('15-11-2023', 'dd-mm-yyyy'), 2879, 50, 644);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100346, to_date('04-08-2023', 'dd-mm-yyyy'), 3011, 167, 481);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100347, to_date('02-06-2020', 'dd-mm-yyyy'), 4811, 93, 544);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100348, to_date('11-10-2021', 'dd-mm-yyyy'), 322, 20, 598);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100349, to_date('18-01-2023', 'dd-mm-yyyy'), 4374, 66, 416);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100350, to_date('29-12-2022', 'dd-mm-yyyy'), 632, 133, 438);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100351, to_date('25-01-2021', 'dd-mm-yyyy'), 4376, 135, 689);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100352, to_date('28-07-2020', 'dd-mm-yyyy'), 2039, 47, 412);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100353, to_date('07-08-2022', 'dd-mm-yyyy'), 2966, 122, 501);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100354, to_date('15-09-2020', 'dd-mm-yyyy'), 839, 105, 575);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100355, to_date('29-03-2023', 'dd-mm-yyyy'), 2864, 8, 601);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100356, to_date('05-04-2023', 'dd-mm-yyyy'), 1543, 267, 686);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100357, to_date('01-01-2021', 'dd-mm-yyyy'), 4684, 52, 765);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100358, to_date('24-10-2020', 'dd-mm-yyyy'), 991, 144, 790);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100359, to_date('29-06-2021', 'dd-mm-yyyy'), 4311, 147, 548);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100360, to_date('24-12-2023', 'dd-mm-yyyy'), 1489, 263, 728);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100361, to_date('02-05-2021', 'dd-mm-yyyy'), 4314, 386, 549);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100362, to_date('09-12-2020', 'dd-mm-yyyy'), 3034, 149, 570);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100363, to_date('09-11-2021', 'dd-mm-yyyy'), 4468, 69, 609);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100364, to_date('12-04-2023', 'dd-mm-yyyy'), 4596, 42, 773);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100365, to_date('07-01-2021', 'dd-mm-yyyy'), 1305, 321, 535);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100366, to_date('31-12-2021', 'dd-mm-yyyy'), 4455, 230, 466);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100367, to_date('04-08-2023', 'dd-mm-yyyy'), 1724, 347, 543);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100368, to_date('12-11-2021', 'dd-mm-yyyy'), 4601, 13, 657);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100369, to_date('31-07-2021', 'dd-mm-yyyy'), 707, 100, 630);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100370, to_date('06-12-2021', 'dd-mm-yyyy'), 4208, 288, 768);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100371, to_date('01-12-2020', 'dd-mm-yyyy'), 3033, 186, 469);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100372, to_date('11-05-2022', 'dd-mm-yyyy'), 2164, 161, 494);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100373, to_date('21-05-2022', 'dd-mm-yyyy'), 4123, 185, 634);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100374, to_date('19-06-2021', 'dd-mm-yyyy'), 3648, 384, 583);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100375, to_date('16-10-2020', 'dd-mm-yyyy'), 4884, 199, 740);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100376, to_date('14-01-2023', 'dd-mm-yyyy'), 819, 19, 549);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100377, to_date('28-05-2022', 'dd-mm-yyyy'), 665, 30, 518);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100378, to_date('15-11-2021', 'dd-mm-yyyy'), 2480, 319, 505);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100379, to_date('18-08-2020', 'dd-mm-yyyy'), 4217, 377, 614);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100380, to_date('05-08-2023', 'dd-mm-yyyy'), 2913, 247, 716);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100381, to_date('13-12-2021', 'dd-mm-yyyy'), 2826, 61, 701);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100382, to_date('12-09-2022', 'dd-mm-yyyy'), 4682, 6, 492);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100383, to_date('30-01-2022', 'dd-mm-yyyy'), 4355, 71, 535);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100384, to_date('14-11-2022', 'dd-mm-yyyy'), 566, 206, 788);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100385, to_date('07-06-2020', 'dd-mm-yyyy'), 2495, 46, 720);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100386, to_date('13-07-2023', 'dd-mm-yyyy'), 4471, 246, 544);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100387, to_date('05-10-2020', 'dd-mm-yyyy'), 963, 363, 405);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100388, to_date('19-08-2020', 'dd-mm-yyyy'), 1553, 331, 737);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100389, to_date('12-02-2022', 'dd-mm-yyyy'), 1841, 273, 708);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100390, to_date('26-09-2021', 'dd-mm-yyyy'), 2209, 303, 573);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100391, to_date('05-01-2020', 'dd-mm-yyyy'), 2948, 41, 658);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100392, to_date('18-04-2023', 'dd-mm-yyyy'), 305, 107, 587);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100393, to_date('10-11-2021', 'dd-mm-yyyy'), 4267, 325, 470);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100394, to_date('23-03-2022', 'dd-mm-yyyy'), 348, 278, 682);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100395, to_date('23-08-2020', 'dd-mm-yyyy'), 3450, 374, 538);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100396, to_date('09-09-2021', 'dd-mm-yyyy'), 3788, 48, 687);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100397, to_date('11-11-2022', 'dd-mm-yyyy'), 371, 252, 556);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100398, to_date('08-03-2023', 'dd-mm-yyyy'), 4369, 286, 639);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100399, to_date('11-09-2022', 'dd-mm-yyyy'), 742, 289, 769);
commit;
prompt 400 records committed...
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (100400, to_date('22-07-2024 18:24:53', 'dd-mm-yyyy hh24:mi:ss'), 100, 197, 572);
commit;
prompt 401 records loaded
prompt Loading PRODUCTSALES...
prompt Table is empty
prompt Enabling foreign key constraints for INVENTORY...
alter table INVENTORY enable constraint SYS_C009294;
alter table INVENTORY enable constraint SYS_C009295;
prompt Enabling foreign key constraints for SALES...
alter table SALES enable constraint SYS_C009286;
alter table SALES enable constraint SYS_C009287;
prompt Enabling foreign key constraints for PRODUCTSALES...
alter table PRODUCTSALES enable constraint SYS_C009301;
alter table PRODUCTSALES enable constraint SYS_C009302;
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
