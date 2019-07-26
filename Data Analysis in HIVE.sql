CREATE DATABASE loan_prediction;

USE loan_prediction;
CREATE TABLE Loan(Loan_ID string, gender string, married string, dependents string, education string,self_employed string,applicant_income int,co_applicant_income double,loan_amount int,loan_amt_term int,credit_history int,property_area string,loan_status string)
ROW FORMAT DELIMITED 
FIELDS TERMINATED BY ",";

USE loan_prediction;
LOAD DATA INPATH "/user/maria_dev/train_Loan.csv" OVERWRITE INTO TABLE Loan;

USE loan_prediction;
select * from Loan;

USE loan_prediction;
select count(*)
from Loan
where gender="Male" and loan_status='Y';

USE loan_prediction;
select max(loan_amt_term) as max_loan_amt_term
from Loan
where loan_status='Y';

USE loan_prediction;
select property_area,max(loan_amount) as Highest_Loan_Amount_Approved
from Loan
where loan_status='Y'
group by property_area;

USE loan_prediction;
select married,count(*) as Number_of_rows
from Loan
where loan_status='Y'
group by married;

USE loan_prediction;
select education,count(*) as Number_of_rows
from Loan
where loan_status='Y'
group by education

USE loan_prediction;
select self_employed,count(*) as Number_of_rows
from Loan
where loan_status='Y'
group by self_employed;

USE loan_prediction;
select property_area,count(*) as Number_of_rows
from Loan
where loan_status='Y'
group by property_area;

USE loan_prediction;
select credit_history,count(*) as Number_of_rows
from Loan
where loan_status='Y'
group by credit_history;

USE loan_prediction;
select min(applicant_income),min(co_applicant_income)
from Loan
group by loan_status
having loan_status='Y';

USE loan_prediction;
select applicant_income,loan_amount,loan_amount/applicant_income as min_ratio
from loan 
where loan_amount in (select min(loan_amount)
from Loan
group by loan_status
having loan_status='Y');

USE loan_prediction;
select applicant_income,loan_amount,loan_amount/applicant_income as max_ratio
from loan 
where loan_amount in (select max(loan_amount)
from Loan
group by loan_status
having loan_status='Y');

USE loan_prediction;
select avg(loan_amount)
from Loan
group by loan_status
having loan_status='Y';
having loan_status='Y';