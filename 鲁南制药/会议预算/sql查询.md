## 优化sql

```sql
if object_id('tempdb.dbo.#hyinfo_1') is not null drop table #hyinfo_1
select 
--费用项目 会议时间 会议名称 
P.ID,S.XH,P.NY,
P.memo,
--金额 
(select max(je) from CRM.dbo.Schedule_S where ID=p.ID) ZJE
into #hyinfo_1
from CRM.dbo.Schedule_P p inner join CRM.dbo.Schedule_S0 s on p.ID=s.ID
where 
p.NY>'2021-05-21' and p.NY<'2021-05-30'
and s.XH=1
and isnull(p.Memo,'') like '%DataTable%'

--定义变量
declare @id int
declare @memo varchar
--创建临时表
if object_id('tempdb.dbo.#hyinfo_2') is not null drop table #hyinfo_2
    create table #hyinfo_2(
        ID varchar(255),
        XH varchar(255),
        NY datetime,
        lx varchar(255),
        name varchar(255),
        ZJE varchar(255)
    )
--定义游标
declare c cursor static
for select id,memo from #hyinfo_1
open c
fetch next from c into @id,@memo
while(@@FETCH_STATUS=0)
 begin
        BEGIN TRY
            insert into #hyinfo_2 select id,xh,ny, 
            convert(varchar(max),convert(XML,memo).query('data(//会议类型)')) lx, 
            convert(varchar(max),convert(XML,memo).query('data(//会议名称)')) name,
            ZJE
            from #hyinfo_1 where id=@id
        END TRY
        BEGIN CATCH
            declare @Mess varchar(max)
            set @Mess=''
            select @Mess='ID:'+convert(varchar(20),@id)+'错误信息:'+ERROR_MESSAGE()
            print @mess
        END CATCH; 
        fetch next from c into @id,@memo
 end
close c
deallocate c
```

