### SQL
* _SQL_- stands for Structured Query Language.It is a programming language used to communicate with Relational Database Management Systems(RDBMS).
* It is used to update data on a database, or retrieve data from a database.
* SQL is defined by:

    1. *Data Definition Language (DDL)* which deals with schema creation and modification. Forexample; CREATE TABLE, ALTER TABLE...
    2. *Data Manipulation Language (DML) provides the constructs to query data  such as SELECT statement and to update the data such as INSERT, UPDATE, and DELETE statements.
    3. *Data Control Language (DCL) has statements dealing with user authorization and security. They include GRANT and REVOKE.
##### SQL Standard
The SQL standard formalizes SQL syntax structures and behaviors across database products.This makes it more important to the open-source databases such as MYSQL and POstgreSQL where the RDBMS are mainly developed by communities.

##### SQL Dialects
* Dialects result from requests of new features that do not exist in SQL standard yet.
* The dialects include: PL/SQL (Procedural Language SQL), Transact-SQL/T-SQL, PL/pgSQL, MySQL.

##### SQL Syntax
* SQL is a declarative language and therefore, its syntax reads like a natural language.
* An SQL statement starts with  a verb that describes the action example INSERT.
* It is then followed by a subject and a predicate. A predicate specifies conditions which can be evaluated as TRUE, FALSE or UNKNOWN.
* Easy to use and understand mainly because it was designed for the non-technical people. However, lately it being used by highly technical people like Data Analysts/Scientists.
#### Note
* To make SQL commands more readable use *uppercase* for _SQL keywords_ and *lowercase* for _SQL identifiers_.
## SELECT
* Used in retrieving data from database tables.
* It can be used to retrieve the whole data or partial data.
* Syntax:
	    SELECT * FROM <tableName>;

The above syntax is used to retrieve the whole data from a database table.
The syntax below is used to retrieve partial data from the database table.
	    SELECT <colum_1, column_2, ...> FROM <tableName>;
* When evaluating the _SELECT_ statement , the database system evaluates the _FROM_ clause first and then the _SELECT_ clause.

## WHERE
* The _WHERE_ keyword is used to retrieve data that meets a given criteria from the database table.
* It is used in the SELECT statement, and it comes immediately after the _FROM_ clause.
* _WHERE_ clause contains one or more logical expressions that evaluate each row in a table.
* If a row that causes the condition evaluates to true, it will be included in the result set; otherwise, it will be excluded.
* Syntax:
	    SELECT * FROM <tableName> WHERE columnName = creteria;
	
######## Note
* Note that SQL has three-valued logic which are TRUE, FALSE, and UNKNOWN. It means that if a row causes the condition to evaluate to FALSE or NULL, the row will not be returned.
* The logical expression that follows the WHERE clause is also known as a predicate. You can use various operators to form the row selection criteria used in the WHERE clause.


###### SQL Logical/Comparison Operators
*a. Comparison Operators*

* _<_ : Less than
* _>_ : Greater than
* _<=_ : Less than or equal to
* _>=_ : Greater than or equal to
* _==_ : Equals
* <>(!=) : Not equal to

*b. Logical Operators*
* _ALL_ : Returns true if all comparisons are true.
* _AND_: Returns true if both expressions are true.
* _ANY_: Return true if any one of the comparisons is true.
* _BETWEEN_: Returns true if the operand is within range.
* _EXISTS_: Returns true if a sub-query contains any rows.
* _IN_: return true if the operand is equal to one of the value in the list.
* _LIKE_: Return true if the operand matches a pattern.
* _NOT_: Reverse the result of any other boolean operator.
* _OR_: Return true if either of the expression is true.
* _SOME_: Return true if some of the expression are true.

These comparison and logical operators are supported in SQL.

##### AND
* AND used to search for multiple attributes or conditions in the WHERE clause.
* Allows you to construct multiple conditions in the _WHERE_ clause of an SQL statement such as _DELETE_, _UPDATE_, and _DELETE_.
* Returns all records that meet both criteria as specified otherwise returns no record.

* Syntax:
	    SELECT * FROM <tableName> WHERE column_1 = criteria AND column_2 > creteria_2;

*SQL AND operator and the short-circuit evaluation*
* The feature allows the system to stop evaluating the remaining parts of a logical expression as it can determine the result.
_How it works_
        1 = 0 AND 1 = 1;
- The database system processes the two comparisons first and uses the _AND_ operator to evaluate the two results. Though, with the short-circuit the db has to evaluate the left part of the expression because the left part (1=0) returns false it cause the whole condition return false regardless of the right part of the condition. This decrease the CPU computation time and in sometimes helps prevent runtime error e.g (1 = 0 AND 1/0; , if the database system supports the short-circuit feature, it will not evaluate the right part of the expression (1/0) that causes division by zero error.
* The short-circuit operator can be used in forming complex conditions in your queries.

##### OR
* OR is also used to search for multiple criteria from a database table.
* Like the _AND_ operator, it is used in the WHERE clause of the SELECT, DELETE, UPDATE statements of a query.
* Returns all records where either of the criteria is true.
* Syntax:
	        SELECT * FROM <tableName> WHERE column_1 = criteria1 OR column_2 > criteria2;
* If the database system supports the short-circuit feature, the OR operator stops evaluating the remaining parts of the condition as soon as one expression is true.
* If the OR operator is used together with the AND operator, the AND operator is evaluated before the OR operator. This is called the operator precedence.

##### IS NULL
* The _IS NULL_ operator compares a value with a null value and returns true if the compared value is null; otherwise it returns false.

##### BETWEEN
* The operator searches for values that are within a set of values, given the minimum value and maximum value. The Maximum and Minimum values are included as part of the conditional set.
* Syntax:

        exprs BETWEEN low AND high;
* The BETWEEN operator returns true if the expression is greater than or equal to ( >=) the low value and less than or equal to ( <=) the high value.
* It technically works as the following:
        exprs >= low AND exprs <= high;
* _NOT BETWEEN_ negate the result of the _BETWEEN_ operator.
* The NOT BETWEEN returns true if the expression is less than low or greater than (>) high; otherwise, it returns false.

##### IN
* The IN operator compares a value to a list of specified values. The IN operator returns true if the compared value matches at least one value in the list; otherwise, it returns false.
* Syntax:
	    SELECT * FROM <tableName> WHERE column_1 IN ('value1', 'value2');
* You can substitute the IN operator with _=_ and _OR_ operator. Thus can be rewritten as:
        exprs = value1 OR exprs = value2 OR ...
* NOT IN is used to find a values that is not in the list of values. Simply reverses what IN does.
* To substitute the _IN_ operator, you can use the _!=_ and _AND_ operators as follows:
        exprs != value1 AND exprs != value2


##### LIKE
* The LIKE operator compares a value to similar values using a wildcard operator. SQL provides two wildcards used in conjunction with the LIKE operator:
        * The percent sign(%) represents zero, one or multiple characters eg 'jo%' shows that a word must start with jo as its first two characters then followed by the rest of the characters.
        * The underscore(_) sign represents a single character. Example '_h' implying the second character.

##### ALL
* The ALL operator compares a value to all values in another value set. The ALL operator must be preceded by a comparison operator and followed by a sub-query.
* Syntax: 
        comparison_operator ALL (subquery)
Example:
        SELECT 
            first_name, last_name, salary
        FROM
            employees
        WHERE
            salary >= ALL (SELECT 
                                salary
                            FROM
                                employees
                             WHERE
                            department_id = 8)
        ORDER BY salary DESC;
        
##### ANY
* The ANY operator compares a value to any value in a set according to the condition as shown below:
        comparison_operator ANY(subquery)
        
##### EXISTS
* The EXISTS operator tests if a subquery contains any rows:

        EXISTS (subquery)
* If the subquery returns one or more rows, the result of the EXISTS is true; otherwise, the result is false.

## DISTINCT
* Used after the SELECT keyword to prevent returning of duplicates.
* Syntax:
	    SELECT DISTINCT columnName from <tableName>;
##### DISTINCT Operator and NULL
* The DISTINCT operator treats all NULL the same. Therefore, the DISTINCT operator keeps only one NULL in the result set.

## ORDER BY
* Used to sort rows by a given attribute or column. Also, it is an option statement of the SELECT statement.
* By default it sorts the rows in ascending order. To sort in descending order you specify using the DESC keyword.
* It supports sorting using multiple columns to sort data, you separate the columns in the ORDER BY clause using a comma.
* Syntax:
	    SELECT * FROM <tableName> ORDER BY <column_x> DESC;

## LIMIT AND OFFSET
* Use _LIMIT & OFFSET_ clauses to limit the number of rows returned by a query.
* Used to return a few number of row as specified by the LIMIT keyword. 
* It comes after the ORDER BY ... DESC keywords. It is good to use the _ORDER BY_ when using _LIMIT_ clause to ensure rows are in order in the result set.
* Some versions of SQL do not support LIMIT keyword.
* Syntax:
	SELECT * FROM <tableName> ORDER BY <columnName> DESC LIMIT #;
* The _OFFSET offset_ clause skips the _offset_ rows before beginning to return the rows. The clause is optional and the query will return the row_count from the first row returned by the SELECT clause.

### SQL FETCH
* Though the _LIMIT_ keyword being supported by many database systems it is not an SQL Standard.
* _SQL FETCH_ which has a similar function as _LIMIT_ allows you to skip _N_ first rows before  starting to return any rows.
* Syntax:

        OFFSET offset_rows { ROW | ROWS }
        FETCH { FIRST | NEXT } [ fetch_rows ] { ROW | ROWS } ONLY
        
* Explanation
    1. The _ROW_ and _ROWS_, _FIRST_ and _NEXT_ are the synonyms thus, interchangeable.
    2. The _offset_rows_ is an integer number which must be zero or positive. In case the _offset_rows_ is greater than the number of rows in the result set, no rows will be returned.
    3. The _fetch_rows_ is also an integer number that determines the number of rows to be returned. The value of _fetch_rows_ is equal to or greater than one.
    
* You should always use the _FETCH_ clause with the _ORDER BY_ clause to get consistent output.
* The _OFFSET FETCH_ clause is supported by many different database system. However, with different implementations for each system.
* The _OFFSET FETCH_ clause is typically used in the client or web applications that require pagination. For example, if each page has ten rows, to get the rows of the second page, you can skip the first ten rows and returns the next ten rows.

### LIKE 
* The _LIKE_ operator returns true is a value matches a pattern or false otherwise.
* Syntax:
        expression LIKE pattern
* SQL standard provides you with two wildcard characters to make a pattern.

    1. % percent wildcard matches zero, one, or more characters.
    2. _ underscore wildcard matches a single character
    
Examples:

LIKE 'Kim%' matches a string that starts with Kim.
LIKE '%er' Matches a string that ends with er.
LIKE '%ch%' matches a string that has a ch
LIKE 'Ke_' match a string that starts with Le and is followed by one character e.g. Ken, Kes....
LIKE '_uy' Matches a string that ends with uy and is precede by one character e.g buy
LIKE '%are_' match a string that contains are and ends with one character.

*Note:* Besides the % and _ wildcards, some database systems may have other wildcard characters that are specific to those databases.

##### NOT LIKE
* The _NOT LIKE_ operator returns true if the expression doesn’t match the pattern or false otherwise.
* Used to negate the LIKE operator.
* To match a string that contains a wildcard for example 10%, you need to instruct the LIKE operator to treat the % in 10% as a regular character.
* To do that, you need to explicitly specify an escape character after the ESCAPE clause:
        expression LIKE pattern ESCAPE escape_character
* Example:
        value LIKE '%10!%%' ESCAPE '!'
* In this example, the ! is an escape character. It instructs the LIKE operator to treat the % in the 10% as a regular character.
* LIKE operator is used in  WHERE clause of the SELECT, UPDATE, and DELETE statements.

### SQL JOINS
The SELECT statement is not only used to query data from a single table but also, can be used in linking multiple tables and the process id known as *joining*.
##### INNER JOINS
* Returns rows if there is at least one row in both tables that matches the join condition. The inner join eliminates rows that do not match with a row of the other table.
* The INNER JOIN clause appears after the FROM clause. The condition to match between table A and table B is specified after the ON keyword. This condition is called join condition i.e., B.n = A.n
* The INNER JOIN clause can join three or more tables as long as they have relationships, typically foreign key relationships.
* For example, the following statement illustrates how to join 3 tables: A, B, and C:
        SELECT
        A.n
        FROM A
        INNER JOIN B ON B.n = A.n
        INNER JOIN C ON C.n = A.n;

##### LEFT JOIN
* The LEFT JOIN returns all rows from the left table whether they have matching rows in the right table or not.
* For example if you have table A with rows 1, 2, 3, 4,and 5 and table B with rows 4, 5, 6, 7, 8. When we join table A  with table B, all the rows in table A(the left table) are included in the result set whether there is a matching row in table B or not. So the result set is 1, 2, 3, 4,and 5.
* Syntax: The LEFT JOIN clause appears immediately after the FROM clause. The condition that follows the ON keyword is called the join condition B.n = A.n.
        SELECT
            A.n
        FROM
            A
        LEFT JOIN B ON B.n = A.n;
        
* Returning the query without a WHERE clause it returns all rows from the LEFT table with their NULLS from the right table.

##### SELF JOIN
* We join a table to itself to evaluate the rows with other rows in the same table. To perform the self-join, we use either an inner join or left join clause.
* Because the same table appears twice in a single query, we have to use the table aliases. The following statement illustrates how to join a table to itself.

        SELECT
	        column1,
	        column2,
	        column3,
        FROM
	        table1 A
        INNER JOIN table1 B ON B.column1 = A.column2;

##### RIGHT JOIN
        




