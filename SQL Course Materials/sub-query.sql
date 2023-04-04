use sql_invoicing;

-- here is the subquery 
create table invoices_archived as
-- this code run at the first the head to subquery 
select i.invoice_id, c.name as client, i.invoice_total,i.payment_total,i.invoice_date,i.due_date, i.payment_date 
from invoices i
left join clients c 
using (client_id)
where payment_date is not null;