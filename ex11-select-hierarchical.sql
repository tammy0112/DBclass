/*
���� ����
    Ʈ�� ������ ������ �θ�-�ڽ� ���踦 ������ �� ���
    ������, ���� ������, ������ �ּҿ� ���
    
START WITH: ���� ���� ���� ���� ����, �ֻ��� �θ� ���
CONNECT WITH: �θ�-�ڽ� ���� ���� Ű����, PRIOR�� �Բ� ���
PRIOR: �θ�-�ڽ� ���� ǥ��, �ڽ� Į�� �տ� ���
NOCYCLE: ����Ŭ ������� �ʵ��� ����, ���ѷ��� ����
LEVEL: �� ������ ���̸� ��Ÿ���� �ǻ� Į��
SYS_CONNECT_BY_PATH: ���� ������ ��θ� ���ڿ��� ǥ��
ORDER SIBLINGS BY: ���� ���� ����
*/
SELECT
    e.employee_id,
    e.last_name,
    e.manager_id,
    LEVEL as depth,
    LPAD(' ', LEVEL*2-2) || SYS_CONNECT_BY_PATH(e.last_name, '>') as hierarchy_path
    --LEVEL*2-2�� ����ŭ ����
FROM employees e
START WITH e.manager_id IS NULL 
--employee_id�� �θ���� ������, NULL�� ������� ����
CONNECT BY
    PRIOR e.employee_id=e.manager_id 
    --�θ��� manager_id�� employee_id�� ���� ������� �ڽ����� �ٴ´�
ORDER SIBLINGS BY e.employee_id;







