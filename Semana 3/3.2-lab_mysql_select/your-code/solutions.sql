-- Challenge 1 - Who Have Published What At Where?

SELECT A.au_id as "AUTHOR ID",
       au_lname as "LAST NAME",
       au_fname as "FIRST NAME", 
       T.title as 'TITLE',
       P.pub_name as 'PUBLISHER'FROM authors as A
       
LEFT JOIN titleauthor as TA
			on A.au_id = TA.au_id

INNER JOIN titles as T
			on T.title_id = TA.title_id

LEFT JOIN publishers as P
			on P.pub_id = T.pub_id;
            
-- Challenge 2 - Who Have Published How Many At Where?

SELECT A.au_id as "AUTHOR ID",
       au_lname as "LAST NAME",
       au_fname as "FIRST NAME", 
       P.pub_name as 'PUBLISHER',
       COUNT(T.title) as 'COUNT' FROM authors as A
       
LEFT JOIN titleauthor as TA
			on A.au_id = TA.au_id

INNER JOIN titles as T
			on T.title_id = TA.title_id

LEFT JOIN publishers as P
			on P.pub_id = T.pub_id

group by A.au_id, P.pub_name

order by `AUTHOR ID` desc;

-- Challenge 3 - Best Selling Authors

SELECT A.au_id as "AUTHOR ID",
       au_lname as "LAST NAME",
       au_fname as "FIRST NAME",
       sum(qty) as 'TOTAL'
       
       FROM authors as A
       
LEFT JOIN titleauthor as TA
			on A.au_id = TA.au_id
            
RIGHT JOIN sales as S
			on S.title_id = TA.title_id

group by A.au_id

order by `TOTAL` desc 

LIMIT 3;

-- Challenge 4 - Best Selling Authors Ranking

SELECT A.au_id as "AUTHOR ID",
       au_lname as "LAST NAME",
       au_fname as "FIRST NAME",
       coalesce(sum(qty),0) as 'TOTAL'
       
       FROM authors as A
       
LEFT JOIN titleauthor as TA
			on A.au_id = TA.au_id
            
LEFT JOIN sales as S
			on S.title_id = TA.title_id

group by A.au_id

order by `TOTAL` desc;