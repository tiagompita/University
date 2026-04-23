# BD: Guião 6

## Problema 6.1

### *a)* Todos os tuplos da tabela autores (authors);

```
SELECT * FROM dbo.authors;
```

### *b)* O primeiro nome, o último nome e o telefone dos autores;

```
SELECT au_fname,au_lname,phone FROM authors
```

### *c)* Consulta definida em b) mas ordenada pelo primeiro nome (ascendente) e depois o último nome (ascendente); 

```
SELECT au_fname,au_lname,phone FROM authors ORDER BY au_fname ASC, au_lname DESC;
```

### *d)* Consulta definida em c) mas renomeando os atributos para (first_name, last_name, telephone); 

```
SELECT 
	au_fname AS first_name,
	au_lname AS last_name,
	phone    AS telephone
FROM authors 
ORDER BY 
	first_name ASC, 
	last_name DESC;
```

### *e)* Consulta definida em d) mas só os autores da Califórnia (CA) cujo último nome é diferente de ‘Ringer’; 

```
... Write here your answer ...
```

### *f)* Todas as editoras (publishers) que tenham ‘Bo’ em qualquer parte do nome; 

```
SELECT pub_id FROM publishers WHERE pub_name LIKE '%Bo%';
```

### *g)* Nome das editoras que têm pelo menos uma publicação do tipo ‘Business’; 

```
SELECT DISTINCT 
    pub_name 
FROM publishers
INNER JOIN titles ON titles.pub_id = publishers.pub_id
WHERE titles.type = 'business';
```

### *h)* Número total de vendas de cada editora; 

```
SELECT pub_name, SUM(ytd_sales) FROM publishers JOIN titles ON publishers.pub_id = titles.pub_id GROUP BY pub_name;
```

### *i)* Número total de vendas de cada editora agrupado por título; 

```
SELECT 
    publishers.pub_name, 
    titles.title, 
    titles.ytd_sales 
FROM publishers
INNER JOIN titles ON publishers.pub_id = titles.pub_id
ORDER BY 
    publishers.pub_name, 
    titles.title;
```

### *j)* Nome dos títulos vendidos pela loja ‘Bookbeat’; 

```
SELECT t.title FROM titles AS t JOIN sales AS s ON t.title_id = s.title_id JOIN stores AS st ON s.stor_id = st.stor_id WHERE st.stor_name = 'Bookbeat';
```

### *k)* Nome de autores que tenham publicações de tipos diferentes; 

```
... Write here your answer ...
```

### *l)* Para os títulos, obter o preço médio e o número total de vendas agrupado por tipo (type) e editora (pub_id);

```
... Write here your answer ...
```

### *m)* Obter o(s) tipo(s) de título(s) para o(s) qual(is) o máximo de dinheiro “à cabeça” (advance) é uma vez e meia superior à média do grupo (tipo);

```
... Write here your answer ...
```

### *n)* Obter, para cada título, nome dos autores e valor arrecadado por estes com a sua venda;

```
... Write here your answer ...
```

### *o)* Obter uma lista que incluía o número de vendas de um título (ytd_sales), o seu nome, a faturação total, o valor da faturação relativa aos autores e o valor da faturação relativa à editora;

```
... Write here your answer ...
```

### *p)* Obter uma lista que incluía o número de vendas de um título (ytd_sales), o seu nome, o nome de cada autor, o valor da faturação de cada autor e o valor da faturação relativa à editora;

```
... Write here your answer ...
```

### *q)* Lista de lojas que venderam pelo menos um exemplar de todos os livros;

```
... Write here your answer ...
```

### *r)* Lista de lojas que venderam mais livros do que a média de todas as lojas;

```
... Write here your answer ...
```

### *s)* Nome dos títulos que nunca foram vendidos na loja “Bookbeat”;

```
... Write here your answer ...
```

### *t)* Para cada editora, a lista de todas as lojas que nunca venderam títulos dessa editora; 

```
... Write here your answer ...
```

## Problema 6.2

### ​5.1

#### a) SQL DDL Script
 
[a) SQL DDL File](ex_6_2_1_ddl.sql "SQLFileQuestion")

#### b) Data Insertion Script

[b) SQL Data Insertion File](ex_6_2_1_data.sql "SQLFileQuestion")

#### c) Queries

##### *a)*

```
... Write here your answer ...
```

##### *b)* 

```
... Write here your answer ...
```

##### *c)* 

```
... Write here your answer ...
```

##### *d)* 

```
... Write here your answer ...
```

##### *e)* 

```
... Write here your answer ...
```

##### *f)* 

```
... Write here your answer ...
```

##### *g)* 

```
... Write here your answer ...
```

##### *h)* 

```
... Write here your answer ...
```

##### *i)* 

```
... Write here your answer ...
```

### 5.2

#### a) SQL DDL Script
 
[a) SQL DDL File](ex_6_2_2_ddl.sql "SQLFileQuestion")

#### b) Data Insertion Script

[b) SQL Data Insertion File](ex_6_2_2_data.sql "SQLFileQuestion")

#### c) Queries

##### *a)*

```
... Write here your answer ...
```

##### *b)* 

```
... Write here your answer ...
```


##### *c)* 

```
... Write here your answer ...
```


##### *d)* 

```
... Write here your answer ...
```

### 5.3

#### a) SQL DDL Script
 
[a) SQL DDL File](ex_6_2_3_ddl.sql "SQLFileQuestion")

#### b) Data Insertion Script

[b) SQL Data Insertion File](ex_6_2_3_data.sql "SQLFileQuestion")

#### c) Queries

##### *a)*

```
... Write here your answer ...
```

##### *b)* 

```
... Write here your answer ...
```


##### *c)* 

```
... Write here your answer ...
```


##### *d)* 

```
... Write here your answer ...
```

##### *e)* 

```
... Write here your answer ...
```

##### *f)* 

```
... Write here your answer ...
```
