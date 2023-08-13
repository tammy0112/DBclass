/*Q1.
각 직원의 성(last_name)과 해당 직원의 매니저인 직원의 성(last_name) 조회*/
--A1.
SELECT
    w.last_name,
    m.last_name
FROM employees w
LEFT OUTER JOIN employees m
ON w.manager_id=m.employee_id
ORDER BY w.last_name;

--AA1.
SELECT
    e.last_name,
    m.last_name
FROM employees e
JOIN employees m
ON e.manager_id=m.employee_id;

/*Q2.
각 직원의 성(last_name)과 해당 직원의 부서 이름(department_name) 조회*/
--A2.
SELECT
    e.last_name,
    d.department_name
FROM employees e
LEFT OUTER JOIN departments d
ON e.department_id=d.department_id
ORDER BY e.last_name;

--AA2.
SELECT
    e.last_name,
    d.department_name
FROM employees e
JOIN departments d
ON e.department_id=d.department_id;

/*Q3.
각 부서의 이름(department_name)과 해당 부서의 평균 급여(avg_salary) 조회하기*/
--A3.
SELECT
    d.department_name,
    AVG(NVL(e.salary, 0)) as avg_salary
FROM departments d
JOIN employees e
ON e.department_id=d.department_id
GROUP BY department_name
ORDER BY d.department_name;
/*풀이 과정
1. departments에서 department_name 가져오기
2. e.department_id=d.department_id인 e.salary 가져오기
3. department_name으로 그룹화(id가 아닌 name으로 해야한다)
4. e.salary들의 평균 구하기
*/
--AA3.
SELECT
    d.department_name,
    AVG(e.salary) as avg_salary
FROM departments d
JOIN employees e
ON d.department_id=e.department_id
GROUP BY d.department_name;

/*Q4.
각 부서의 이름(department_name)과 해당 부서의 최대 급여(max_salary) 조회*/
--A4.
SELECT
    d.department_name,
    MAX(NVL(e.salary,0)) as max_salary
FROM departments d
JOIN employees e
ON e.department_id=d.department_id
GROUP BY d.department_name
ORDER BY max_salary;

--AA4.
SELECT
    d.department_name,
    MAX(e.salary) as max_salary
FROM departments d
JOIN employees e
ON e.department_id=d.department_id
GROUP BY d.department_name;

/*Q5.
각 직원의 성(last_name)과 해당 직원이 속한 부서의 최소 급여(min_salary) 조회*/
--A5.
SELECT
    e.last_name,
    MIN(s.salary) as min_salary
FROM employees e
JOIN employees s
ON s.department_id=e.department_id
GROUP BY e.last_name
ORDER BY min_salary, e.last_name;
--Q. 왜 GROUP BY에 e.department_id만 넣어도 오류가 없는가?
--A. 일단 self join을 할 이유 없음. 
--그리고 정답과 비슷해 보이지만 GROUP BY e.last_name은 이름이 같은 사람들끼리 그룹화 한 결과로 전혀 다르다.

SELECT
    last_name,
    MIN(salary) as min_salary
FROM employees
GROUP BY department_id, last_name
ORDER BY min_salary, last_name;
--Q. 왜 위에는 맞고 아래는 틀린가?

--AA5.
SELECT
    e.last_name,
    d.min_salary
FROM employees e
JOIN (
    SELECT
        d.department_id,
        MIN(e.salary) as min_salary
    FROM departments d
    JOIN employees e
    ON d.department_id=e.department_id
    GROUP BY d.department_id) d --()를 하나의 table로 인식
ON e.department_id=d.department_id
ORDER BY d.min_salary, e.last_name;
    

/*Q6.
각 부서의 이름(department_name)과 해당 부서에 속한 직원 중 가장 높은 급여(highest_salary) 조회*/
--A6.
SELECT
    d.department_name,
    MAX(e.salary) as max_salary
FROM departments d
JOIN employees e
ON d.department_id=e.department_id
GROUP BY d.department_id, d.department_name
ORDER BY max_salary;

--AA6. AA5참고

/*Q7.
각 직원의 성(last_name)과 해당 직원의 매니저의 성(last_name) 및 부서 이름(department_name) 조회*/
--A7.
SELECT
    emp.last_name as worker,
    man.last_name as manager_id,
    d.department_name
FROM employees emp
LEFT OUTER JOIN employees man
ON emp.manager_id=man.employee_id
JOIN departments d
ON emp.department_id=d.department_id
ORDER BY worker;

--AA7.
SELECT
    e.last_name,
    m.last_name,
    d.department_name
FROM employees e
JOIN employees m
ON e.manager_id=m.employee_id
JOIN departments d
ON e.department_id=d.department_id;

/*Q8.
각 직원의 성(last_name)과 해당 직원이 속한 부서의 매니저의 성(last_name) 조회*/
--A8.
SELECT
    emp.last_name as worker,
    man.last_name as department_manager
FROM employees emp
LEFT OUTER JOIN departments d
ON emp.department_id=d.department_id
JOIN employees man
ON d.manager_id=man.employee_id
ORDER BY worker;

--AA8. 뭔가 이상하다. 184행 m.manager_id > m.employee_id 바꾸자
SELECT
    e.last_name as w_lastname,
    m.last_name as m_lastname
FROM employees e
JOIN departments d
ON e.department_id=d.department_id
JOIN employees m
ON d.manager_id=m.manager_id;

/*Q9.
각 직원의 성(last_name)과 해당 직원의 보고 상사가 있는 경우 보고 상사의 성(last_name) 조회*/
--A9.
SELECT
    emp.last_name as worker,
    NVL2(emp.manager_id, man.last_name, 'none') as manager
FROM employees emp
LEFT OUTER JOIN employees man
ON emp.manager_id=man.employee_id
ORDER BY worker;

--AA9. AA8 참고

/*Q10.
직원들 중에서 급여(salary)가 10000 이상인 직원들의 성(last_name)과 해당 직원의 부서 이름(department_name) 조회*/
--A10.
SELECT
    e.last_name,
    e.salary,
    d.department_name
FROM employees e
LEFT OUTER  JOIN departments d
ON e.department_id=d.department_id
WHERE e.salary>=10000
ORDER BY e.last_name;

--AA10.
SELECT
    e.last_name,
    d.department_name
FROM employees e
JOIN departments d
ON e.department_id=d.department_id
WHERE e.salary>=10000;

/*Q11.
1) 각 부서의 이름(department_name), 해당 부서의 매니저의 ID(manager_id)와 매니저의 성(last_name),
    직원의 ID(employee_id), 직원의 성(last_name), 그리고 해당 직원의 급여(salary) 조회
2) 직원들의 급여(salary)가 해당 부서의 평균 급여보다 높은 직원들을 조회
3) 결과는 부서 이름과 직원의 급여가 높은 순으로 정렬*/
--A11. 실패!
SELECT
    d.department_name,
    d.manager_id,
    man.last_name,
    emp.employee_id,
    emp.last_name,
    emp.salary
FROM departments d
JOIN employees man
ON d.manager_id=man.employee_id
JOIN(
    SELECT
        e.employee_id,
        e.last_name,
        e.salary,
        dd.department_name
    FROM employees e
    LEFT OUTER JOIN departments dd
    ON e.department_id=dd.department_id) emp
ON emp.department_name=d.department_name
JOIN (
    SELECT
        d.department_name,
        AVG(e.salary)
    FROM departments d
    JOIN employees e
    ON d.department_id=e.department_id
    GROUP BY d.department_name) aa
ON aa.department_name=emp.department_name
WHERE emp.salary>=aa.salary
ORDER BY d.department_name, emp.salary;

--AA11.
SELECT
    d.department_name,
    d.manager_id,
    m.last_name,
    e.employee_id,
    e.last_name,
    e.salary
FROM departments d
JOIN employees m
ON d.manager_id=m.employee_id
JOIN employees e
ON d.department_id=e.department_id
WHERE e.salary>(
                --각 부서의 평균 급여
                SELECT
                    AVG(ee.salary)
                FROM employees ee
                WHERE ee.department_id=d.department_id)
ORDER BY d.department_name, e.salary;
