--����guidemessage
 create table guidemessage(
    guideno varchar2(8) not null,
    guideposution number(10),
    guidename varchar2(20),
    guideSex varchar2(2),
    guideAge number(2),
    languageList varchar2(100),
    way varchar2(500),
    leaddate date);
--�޸�����guideposution Ϊ guideposition
alter table guidemessage rename column guideposution to guideposition;
--��guideposition,guidename�����Ӳ�Ϊ�յ�����
alter table guidemessage modify guideposition varchar2(10) not null;
--Ϊguidesex������Ĭ��ֵΪ"Ů"������
alter table guidemessage modify(guidesex default 'Ů');
--ΪleadDate����ʹ��ϵͳ��ǰ����
alter table guidemessage modify(leaddate default sysdate);
--�޸ı�ռ�Ϊsystem
alter table guidemessage move tablespace system;
--������������Ϊguideinfo
alter table guidemessage rename to guideinfos;
--ɾ����
drop table guidemessage;