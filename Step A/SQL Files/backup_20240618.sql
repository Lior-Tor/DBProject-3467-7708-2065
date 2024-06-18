prompt PL/SQL Developer Export Tables for user SYSTEM@XE
prompt Created by tordj on 18 June 2024
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

prompt Creating EMPLOYEES...
create table EMPLOYEES
(
  employeeid   INTEGER not null,
  employeename VARCHAR2(100),
  position     VARCHAR2(100),
  hiredate     DATE
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
  productname   VARCHAR2(100),
  typeofproduct VARCHAR2(100),
  price         INTEGER
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
  quantity          INTEGER,
  lastrestockeddate DATE,
  productid         INTEGER,
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

prompt Creating SALES...
create table SALES
(
  saleid      INTEGER not null,
  dateofsale  DATE,
  totalamount INTEGER,
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

prompt Creating SALESPRODUCTS...
create table SALESPRODUCTS
(
  salesproductsid INTEGER not null,
  saleid          INTEGER,
  customerid      INTEGER,
  employeeid      INTEGER,
  productid       INTEGER,
  quantity        INTEGER
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
alter table SALESPRODUCTS
  add primary key (SALESPRODUCTSID)
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
alter table SALESPRODUCTS
  add foreign key (SALEID, CUSTOMERID, EMPLOYEEID)
  references SALES (SALEID, CUSTOMERID, EMPLOYEEID);
alter table SALESPRODUCTS
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
prompt Disabling triggers for SALESPRODUCTS...
alter table SALESPRODUCTS disable all triggers;
prompt Disabling foreign key constraints for INVENTORY...
alter table INVENTORY disable constraint SYS_C008570;
alter table INVENTORY disable constraint SYS_C008571;
prompt Disabling foreign key constraints for SALES...
alter table SALES disable constraint SYS_C008573;
alter table SALES disable constraint SYS_C008574;
prompt Disabling foreign key constraints for SALESPRODUCTS...
alter table SALESPRODUCTS disable constraint SYS_C008576;
alter table SALESPRODUCTS disable constraint SYS_C008577;
prompt Deleting SALESPRODUCTS...
delete from SALESPRODUCTS;
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
values (1, 'John Doe', 'john.doe@example.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (2, 'Jane Smith', 'jane.smith@example.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (3, 'Alice Johnson', 'alice.johnson@example.com');
commit;
prompt 3 records loaded
prompt Loading EMPLOYEES...
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (1, 'Michael Brown', 'Manager', to_date('15-01-2020', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (2, 'Emily Davis', 'Sales Associate', to_date('23-05-2019', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (3, 'Robert Wilson', 'Cashier', to_date('10-08-2021', 'dd-mm-yyyy'));
commit;
prompt 3 records loaded
prompt Loading PRODUCTS...
insert into PRODUCTS (productid, productname, typeofproduct, price)
values (1, 'Laptop', 'Electronics', 1000);
insert into PRODUCTS (productid, productname, typeofproduct, price)
values (2, 'Smartphone', 'Electronics', 700);
insert into PRODUCTS (productid, productname, typeofproduct, price)
values (3, 'Tablet', 'Electronics', 300);
commit;
prompt 3 records loaded
prompt Loading SUPPLIERS...
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (1, 'Tech Supplies Co.', 'contact@techsupplies.com');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (2, 'Gadget World', 'info@gadgetworld.com');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (3, 'Device Hub', 'support@devicehub.com');
commit;
prompt 3 records loaded
prompt Loading INVENTORY...
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (1, 50, to_date('20-01-2024', 'dd-mm-yyyy'), 1, 1);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (2, 100, to_date('10-02-2024', 'dd-mm-yyyy'), 2, 2);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (3, 200, to_date('05-03-2024', 'dd-mm-yyyy'), 3, 3);
commit;
prompt 3 records loaded
prompt Loading SALES...
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (1, to_date('25-01-2024', 'dd-mm-yyyy'), 1000, 1, 1);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (2, to_date('15-02-2024', 'dd-mm-yyyy'), 700, 2, 2);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (3, to_date('10-03-2024', 'dd-mm-yyyy'), 300, 3, 3);
commit;
prompt 3 records loaded
prompt Loading SALESPRODUCTS...
insert into SALESPRODUCTS (salesproductsid, saleid, customerid, employeeid, productid, quantity)
values (1, 1, 1, 1, 1, 1);
insert into SALESPRODUCTS (salesproductsid, saleid, customerid, employeeid, productid, quantity)
values (2, 1, 1, 1, 2, 2);
insert into SALESPRODUCTS (salesproductsid, saleid, customerid, employeeid, productid, quantity)
values (3, 2, 2, 2, 1, 1);
insert into SALESPRODUCTS (salesproductsid, saleid, customerid, employeeid, productid, quantity)
values (4, 3, 3, 3, 3, 3);
commit;
prompt 4 records loaded
prompt Enabling foreign key constraints for INVENTORY...
alter table INVENTORY enable constraint SYS_C008570;
alter table INVENTORY enable constraint SYS_C008571;
prompt Enabling foreign key constraints for SALES...
alter table SALES enable constraint SYS_C008573;
alter table SALES enable constraint SYS_C008574;
prompt Enabling foreign key constraints for SALESPRODUCTS...
alter table SALESPRODUCTS enable constraint SYS_C008576;
alter table SALESPRODUCTS enable constraint SYS_C008577;
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
prompt Enabling triggers for SALESPRODUCTS...
alter table SALESPRODUCTS enable all triggers;

set feedback on
set define on
prompt Done
