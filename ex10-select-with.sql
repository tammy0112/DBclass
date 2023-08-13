/*
WITH
    : 서브쿼리 결과 임시 정의(CTE: Common Table Expression) 및 사용
      주로 복잡합 쿼리를 간결하게 표현하거나 가독성을 높일 때 사용
*/
--부서별 평균 급여 계산
WITH AvgSalByDept as (
    SELECT
        department_id,
        AVG(salary) as avg_salary
    FROM employees
    GROUP BY department_id) --부서별 평균 급여를 CTE로 만들어두기
SELECT
    d.department_name,
    AvgSalByDept.avg_salary
FROM departments d
JOIN AvgSalByDept
ON d.department_id=AvgSalByDept.department_id;
--JOIN()으로 묶어 가져오는 것과 같은 결과지만 해당 table을 여러번 사용해야 할 경우 편하다

WITH RecrusiveCTE(id, name, manager_id, depth) as (
    SELECT
        employee_id,
        last_name,
        manager_id,
        0
        --employee_id를 id, last_name을 name...으로 저장
    FROM employees
    WHERE manager_id is NULL --사원 King
    --RecrusiveCTE table에 100 / king / 100 / 0이 저장
    UNION ALL
    SELECT
        e.employee_id,
        e.last_name,
        e.manager_id,
        rc.depth+1
    FROM employees e
    INNER JOIN RecrusiveCTE rc
    ON e.manager_id=rc.id)
    --manager_id가 100인 사원들, 101인 사원들이 계속 탐색됨
    --100, 101...로 manager_id가 넘어갈 때 마다 depth가 1씩 증가
SELECT
    id,
    name,
    manager_id,
    depth
FROM RecrusiveCTE;














