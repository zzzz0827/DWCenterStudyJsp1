CREATE TABLE TBL_PIZZA_01(
    pcode char(4) NOT NULL,
    pname VARCHAR2(20),
    cost NUMBER(7),
    CONSTRAINT pk_pizza PRIMARY KEY (pcode)
);

CREATE TABLE TBL_SHOP_01 (
    scode CHAR(4) NOT NULL,
    sname VARCHAR(20),
    CONSTRAINT pk_shop PRIMARY KEY (scode)
);

CREATE TABLE TBL_SALELIST_01 (
    saleno NUMBER(7) NOT NULL,
    scode CHAR(4) NOT NULL,
    saledate DATE,
    pcode CHAR(4) NOT NULL,
    amount NUMBER(5),
    CONSTRAINT pk_salelist PRIMARY KEY (saleno)
);