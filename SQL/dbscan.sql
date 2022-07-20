SELECT DISTINCT ST_AsText(avgpoint) FROM grouppoi WHERE typeno=1 or typeno=2

select * from poi where typeno=3
/** 점 좌표 업데이트 문 **/
UPDATE poi SET geom = ST_SetSRID(ST_MakePoint(latitude, longitude), 4326)
/** 데이터 확인 **/
SELECT poino, ST_AsText(geom) FROM poi WHERE typeno=9
/** 클러스터 수행 **/
SELECT poino, ST_ClusterDBSCAN(geom, 0.003, 5) over () AS cid FROM poi where typeno=2 order by cid;

/** 중간점 구하기, 데이터확인 **/
SELECT cid, count(*), ST_AsText(ST_SetSRID(ST_MakePoint(avg(ST_X(geom)), avg(ST_Y(geom))), 4326)) as avgPoint 

FROM poi AS DE   /**geometry형태의 x,y값들을 함수를 이용해서 평균내고 이걸 avgPoint로 표현**/

JOIN (SELECT poino, ST_ClusterDBSCAN(geom, 0.0001, 5) over () AS cid

FROM poi) AS CL 

ON DE.poino = CL.poino WHERE typeno=9 /**join문 이용**/

GROUP BY cid

ORDER BY cid/** cid를 기준으로 그룹화하고 정렬**/

/**기본 : 0.003, 5**/
/**식당, 카페(0.001,5)**/



/**데이터입력**/
INSERT INTO grouppoi (typeno, cid,count,avgpoint)
SELECT 3, cid, count(*), ST_SetSRID(ST_MakePoint(avg(ST_X(geom)), avg(ST_Y(geom))), 4326) as avgPoint 
FROM poi AS DE
JOIN (SELECT poino, ST_ClusterDBSCAN(geom, 0.001, 5) over () AS cid
FROM poi) AS CL
ON DE.poino = CL.poino WHERE typeno=3
GROUP BY cid
ORDER BY cid

select * from grouppoi
SELECT ST_AsText(avgpoint) FROM grouppoi where typeno=1

delete from grouppoi where typeno=3