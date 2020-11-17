--创建guidemessage
 create table guidemessage(
    guideno varchar2(8) not null,
    guideposution number(10),
    guidename varchar2(20),
    guideSex varchar2(2),
    guideAge number(2),
    languageList varchar2(100),
    way varchar2(500),
    leaddate date);
--修改列名guideposution 为 guideposition
alter table guidemessage rename column guideposution to guideposition;
--给guideposition,guidename列增加不为空的属性
alter table guidemessage modify guideposition varchar2(10) not null;
--为guidesex列增加默认值为"女"的设置
alter table guidemessage modify(guidesex default '女');
--为leadDate增加使用系统当前日期
alter table guidemessage modify(leaddate default sysdate);
--修改表空间为system
alter table guidemessage move tablespace system;
--将表名重命名为guideinfo
alter table guidemessage rename to guideinfos;
--删除表
drop table guidemessage;