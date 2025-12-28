--find Odd or even 

With OddEven as (
select 10 as number
union all
select 9 as number
union all
select 23 as number
union all
select 30 as number
union all
select 201 as number
),oddeve as (
select number,ROW_NUMBER() over(order by number) as rn from OddEven)
select number,case when number%2=0 then 'Even' else 'Odd' end as OddEven from oddeve

--Now without this % opt

With OddEven as (
select 10 as number
union all
select 9 as number
union all
select 23 as number
union all
select 30 as number
union all
select 201 as number
)
select number,case when number=(number/2)*2 then 'Even' else 'Odd' end as OddEven from OddEven

--Now without % and / opt

With OddEven as (
select 10 as number
union all
select 9 as number
union all
select 23 as number
union all
select 30 as number
union all
select 201 as number
)
select number,case when (number & 1)=0 then 'Even' else 'Odd' end as oddEven from OddEven

--Now without using &,%,/

With OddEven as (
select 10 as number
union all
select 9 as number
union all
select 23 as number
union all
select 30 as number
union all
select 201 as number union all
select 10 as number
union all
select 902 as number
union all
select 203 as number
union all
select 301 as number
union all
select 202 as number
)
select number,iif((number & 1)=0,'Even','Odd') as oddEven from OddEven

--but i use & So

With OddEven as (
select 10 as number
union all
select 902 as number
union all
select 203 as number
union all
select 301 as number
union all
select 202 as number
)
select number,case when right(number,1) in (0,2,4,6,8) then 'Even' else 'Odd' end as OddEven from OddEven

print 'Thank you'



