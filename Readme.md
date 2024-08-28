### SQL
_SQL_- stands for Structured Query Language.It is used to communicate with database management systems. 
It is used to update data on a database, or retrieve data from a database.
* The most common SQL commands are: _INSERT, UPDATE, DROP, SELECT, ALTER_

## SELECT
* Used in retrieving data from database tables.
* It can be used to retrieve the whole data or partial data.
* Syntax:
	SELECT * FROM <tableName>;

The above syntax is used to retrieve the whole data from a database table.
The syntax below is used to retrieve partial data from the database table.
	SELECT <colum_1, column_2, ...> FROM <tableName>;

## WHERE
* The _WHERE_ keyword is used to retrieve data that meets a given criteria from the database table.
* It is used together with other keywords.
* Syntax:
	SELECT * FROM <tableName> WHERE columnName = '<creteria>';

#### Logical Symbols
* _<_ : Less than
* _>_ : Greater than
* _<=_ : Less than or equal to
* _>=_ : Greater than or equal to
* _==_ : Equals

This logical symbols are supported in SQL.

### AND
* AND used to search for multiple attributes when combined with the WHERE keyword.
* Returns all records that meet both criteria as specified, otherwise returns no record.

* Syntax:
	SELECT * FROM <tableName> WHERE column_1 = '<criteria>' AND column_2 > <creteria_2>;

### OR
* OR is also used to search for multiple criteria from a database table.
* Returns all records where either of the criteria is true.
* Syntax:
	SELECT * FROM <tableName> WHERE column_1 = '<criteria1>' OR column_2 > criteria2;

### IN
* The IN keyword is used to find rows where a value is in a list of several possible values.
* Syntax:
	SELECT * FROM <tableName> WHERE column_1 IN ('value1', 'value2');

* NOT IN is used to find a values that is not in the list of values. Simply reverses what IN does.

## DISTINCT
* Used after the SELECT keyword to prevent returning of duplicates.
* Syntax:
	SELECT DISTINCT columnName from <tableName>;

## ORDER BY
* Used to sort rows by a given attribute or column.
* By default it sorts the rows in ascending order. To sort in descending order you specify using the DESC keyword.
* Syntax:
	SELECT * FROM <tableName> ORDER BY <column_x> DESC;

## LIMIT
* Used to return a few number of row as specified by the LIMIT keyword. 
* It comes after the ORDER BY ... DESC keywords.
* Some versions of SQL do not support LIMIT keyword.
* Syntax:
	SELECT * FROM <tableName> ORDER BY <columnName> DESC LIMIT #;
