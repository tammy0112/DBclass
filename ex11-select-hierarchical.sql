/*
계층 쿼리
    트리 구조를 가지는 부모-자식 관계를 쿼리할 떄 사용
    조직도, 계층 데이터, 계층적 주소에 사용
    
START WITH: 계층 쿼리 시작 지점 설정, 최상위 부모 노드
CONNECT WITH: 부모-자식 관계 설정 키워드, PRIOR과 함께 사용
PRIOR: 부모-자식 관계 표현, 자식 칼럼 앞에 사용
NOCYCLE: 사이클 허용하지 않도록 설정, 무한루프 방지
LEVEL: 각 레벨의 깊이를 나타내는 의사 칼럼
SYS_CONNECT_BY_PATH: 계층 구조의 경로를 문자열로 표현
ORDER SIBLINGS BY: 형제 노드들 정렬
*/
SELECT
    e.employee_id,
    e.last_name,
    e.manager_id,
    LEVEL as depth,
    LPAD(' ', LEVEL*2-2) || SYS_CONNECT_BY_PATH(e.last_name, '>') as hierarchy_path
    --LEVEL*2-2의 수만큼 띄어쓰기
FROM employees e
START WITH e.manager_id IS NULL 
--employee_id가 부모노드로 설정됨, NULL인 사원부터 시작
CONNECT BY
    PRIOR e.employee_id=e.manager_id 
    --부모인 manager_id와 employee_id가 같은 사원들이 자식으로 붙는다
ORDER SIBLINGS BY e.employee_id;







