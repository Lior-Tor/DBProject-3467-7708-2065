prompt PL/SQL Developer Export Tables for user SYS
prompt Created by tordj on 02 July 2024
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
alter table INVENTORY disable constraint SYS_C008837;
alter table INVENTORY disable constraint SYS_C008838;
prompt Disabling foreign key constraints for SALES...
alter table SALES disable constraint SYS_C008829;
alter table SALES disable constraint SYS_C008830;
prompt Disabling foreign key constraints for PRODUCTSALES...
alter table PRODUCTSALES disable constraint SYS_C008844;
alter table PRODUCTSALES disable constraint SYS_C008845;
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
values (1, 'John Doe', 'john.doe@example.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (2, 'Jane Smith', 'jane.smith@example.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (3, 'Alice Johnson', 'alice.johnson@example.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (4, 'Bob Brown', 'bob.brown@example.com');
insert into CUSTOMERS (customerid, customername, customeremail)
values (5, 'Charlie Green', 'charlie.green@example.com');
commit;
prompt 5 records loaded
prompt Loading EMPLOYEES...
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (1, 'Emily White', 'Manager', to_date('15-03-2019', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (2, 'David Black', 'Salesperson', to_date('20-06-2020', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (3, 'Susan Blue', 'Clerk', to_date('10-01-2021', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (4, 'Michael Red', 'Salesperson', to_date('25-11-2018', 'dd-mm-yyyy'));
insert into EMPLOYEES (employeeid, employeename, position, hiredate)
values (5, 'Laura Yellow', 'Clerk', to_date('05-02-2022', 'dd-mm-yyyy'));
commit;
prompt 5 records loaded
prompt Loading PRODUCTS...
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (1, 'Laptop', 1000, 'Electronics');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (2, 'Phone', 700, 'Electronics');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (3, 'Desk', 200, 'Furniture');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (4, 'Chair', 100, 'Furniture');
insert into PRODUCTS (productid, productname, price, typeofproduct)
values (5, 'Monitor', 300, 'Electronics');
commit;
prompt 5 records loaded
prompt Loading SUPPLIERS...
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (1, 'Tech Supplies Co.', 'contact@techsupplies.com');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (2, 'Office Essentials Inc.', 'support@officeessentials.com');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (3, 'Furniture World', 'sales@furnitureworld.com');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (4, 'Gadget Pros', 'info@gadgetpros.com');
insert into SUPPLIERS (supplierid, suppliername, supplieremail)
values (5, 'Home Office Solutions', 'service@homeofficesolutions.com');
commit;
prompt 5 records loaded
prompt Loading INVENTORY...
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (1, 50, to_date('01-06-2023', 'dd-mm-yyyy'), 1, 1);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (2, 30, to_date('02-06-2023', 'dd-mm-yyyy'), 2, 2);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (3, 20, to_date('03-06-2023', 'dd-mm-yyyy'), 3, 3);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (4, 40, to_date('04-06-2023', 'dd-mm-yyyy'), 4, 4);
insert into INVENTORY (inventoryid, quantity, lastrestockeddate, productid, supplierid)
values (5, 60, to_date('05-06-2023', 'dd-mm-yyyy'), 5, 5);
commit;
prompt 5 records loaded
prompt Loading SALES...
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (1, to_date('01-01-2023', 'dd-mm-yyyy'), 1300, 1, 1);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (2, to_date('02-01-2023', 'dd-mm-yyyy'), 700, 2, 2);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (3, to_date('03-01-2023', 'dd-mm-yyyy'), 300, 3, 3);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (4, to_date('04-01-2023', 'dd-mm-yyyy'), 100, 4, 4);
insert into SALES (saleid, dateofsale, totalamount, customerid, employeeid)
values (5, to_date('05-01-2023', 'dd-mm-yyyy'), 200, 5, 5);
commit;
prompt 5 records loaded
prompt Loading PRODUCTSALES...
insert into PRODUCTSALES (saleid, customerid, employeeid, productid)
values (1, 1, 1, 1);
insert into PRODUCTSALES (saleid, customerid, employeeid, productid)
values (2, 2, 2, 2);
insert into PRODUCTSALES (saleid, customerid, employeeid, productid)
values (3, 3, 3, 3);
insert into PRODUCTSALES (saleid, customerid, employeeid, productid)
values (4, 4, 4, 4);
insert into PRODUCTSALES (saleid, customerid, employeeid, productid)
values (5, 5, 5, 5);
commit;
prompt 5 records loaded
prompt Enabling foreign key constraints for INVENTORY...
alter table INVENTORY enable constraint SYS_C008837;
alter table INVENTORY enable constraint SYS_C008838;
prompt Enabling foreign key constraints for SALES...
alter table SALES enable constraint SYS_C008829;
alter table SALES enable constraint SYS_C008830;
prompt Enabling foreign key constraints for PRODUCTSALES...
alter table PRODUCTSALES enable constraint SYS_C008844;
alter table PRODUCTSALES enable constraint SYS_C008845;
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
