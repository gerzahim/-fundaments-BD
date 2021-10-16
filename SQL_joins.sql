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



-- EXTRA

SELECT usuarios.id as userID, usuarios.nickname, posts.id as postID, posts.titulo as post_titulo
FROM usuarios
LEFT JOIN posts
 ON posts.usuario_id = usuarios.id
 ORDER BY usuarios.id DESC
 LIMIT 5;
