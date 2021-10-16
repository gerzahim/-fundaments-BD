-- LEFT JOIN
-- traer todos los usuarios que (TENGAN o NO TENGAN) posts
SELECT *
FROM usuarios
LEFT JOIN posts
 ON posts.usuario_id = usuarios.id
+--------+----------+--------+------------------------------------------+
| userID | nickname | postID | post_titulo                              |
+--------+----------+--------+------------------------------------------+
|      5 | Oso Prez |   NULL | NULL                                     |  NO TIENE POST
|      4 | Ed       |     46 | Los mejores vestidos en la alfombra roja |  TIENE POST
|      4 | Ed       |     47 | Los paparatzi captan escndalo en cmara   |  TIENE POST
|      4 | Ed       |     57 | Escndalo con el boxeador del momento     |  TIENE POST
|      4 | Ed       |     61 | Escndalo en el mundo de la moda          |  TIENE POST
+--------+----------+--------+------------------------------------------+



-- LEFT JOIN
-- traer todos los usuarios que obligatoriamente (NO TENGAN) posts 
SELECT * 
FROM usuarios
LEFT JOIN posts
 ON posts.usuario_id = usuarios.id
WHERE posts.usuario_id IS NULL 
+--------+----------+--------+------------------------------------------+
| userID | nickname | postID | post_titulo                              |
+--------+----------+--------+------------------------------------------+
|      5 | Oso Prez |   NULL | NULL                                     | NO TIENE POST
+--------+----------+--------+------------------------------------------+


-- LEFT JOIN
-- traer todos los usuarios que obligatoriamente (TENGAN) posts 

SELECT * 
FROM usuarios
LEFT JOIN posts
 ON posts.usuario_id = usuarios.id
WHERE posts.usuario_id IS NOT NULL 
+--------+----------+--------+------------------------------------------+
| userID | nickname | postID | post_titulo                              |
+--------+----------+--------+------------------------------------------+
|      4 | Ed       |     46 | Los mejores vestidos en la alfombra roja | TIENE POST
|      4 | Ed       |     47 | Los paparatzi captan escndalo en cmara   | TIENE POST
|      4 | Ed       |     57 | Escndalo con el boxeador del momento     | TIENE POST
|      4 | Ed       |     61 | Escndalo en el mundo de la moda          | TIENE POST
+--------+----------+--------+------------------------------------------+



-- INNER JOIN
-- traer todos los usuarios que obligatoriamente (TENGAN) posts y 
-- y todos los posts obligatoriamente (TENGAN) usuarios
SELECT * 
FROM usuarios
INNER JOIN posts
 ON posts.usuario_id = usuarios.id
+--------+----------+--------+------------------------------------------+
| userID | nickname | postID | post_titulo                              |
+--------+----------+--------+------------------------------------------+
|      4 | Ed       |     46 | Los mejores vestidos en la alfombra roja | TIENE POST
|      4 | Ed       |     47 | Los paparatzi captan escndalo en cmara   | TIENE POST
|      4 | Ed       |     57 | Escndalo con el boxeador del momento     | TIENE POST
|      4 | Ed       |     61 | Escndalo en el mundo de la moda          | TIENE POST
+--------+----------+--------+------------------------------------------+



-- OUTER JOIN
-- traer todos los usuarios y post que (TENGAN o NO TENGAN) relacion entre ellos 
SELECT *
FROM usuarios
LEFT JOIN posts
 ON posts.usuario_id = usuarios.id
UNION
SELECT *
FROM usuarios
RIGHT JOIN posts
 ON posts.usuario_id = usuarios.id;
+--------+----------+--------+------------------------------------------+
| userID | nickname | postID | post_titulo                              |
+--------+----------+--------+------------------------------------------+
|      4 | Ed       |     46 | Los mejores vestidos en la alfombra roja |
|      4 | Ed       |     47 | Los paparatzi captan escndalo en cmara   |
|      4 | Ed       |     57 | Escndalo con el boxeador del momento     |
|      4 | Ed       |     61 | Escndalo en el mundo de la moda          |
|      5 | Oso Prez |   NULL | NULL                                     | NO TIENE POST
|   NULL | NULL     |     64 | El post que se qued hurfano              | NO TIENE USUARIO
+--------+----------+--------+------------------------------------------+




-- OUTER JOIN
-- traer todos los usuarios y post que NO(TENGAN) relacion entre ellos 
SELECT *
FROM usuarios
LEFT JOIN posts
 ON posts.usuario_id = usuarios.id
 WHERE posts.usuario_id IS NULL 
UNION
SELECT *
FROM usuarios
RIGHT JOIN posts
 ON posts.usuario_id = usuarios.id
 WHERE posts.usuario_id IS NULL;

 +--------+----------+--------+-----------------------------+
| userID | nickname | postID | post_titulo                 |
+--------+----------+--------+-----------------------------+
|      5 | Oso Prez |   NULL | NULL                        | NO TIENE POST
|   NULL | NULL     |     64 | El post que se qued hurfano | NO TIENE USUARIO
+--------+----------+--------+-----------------------------+




-- EXTRA

SELECT usuarios.id as userID, usuarios.nickname, posts.id as postID, posts.titulo as post_titulo
FROM usuarios
LEFT JOIN posts
 ON posts.usuario_id = usuarios.id
 ORDER BY usuarios.id DESC
 LIMIT 5;
