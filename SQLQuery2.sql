SELECT * FROM bank_loan_data;

SELECT count(id) as Total_Loan_Applications  FROM bank_loan_data; 

SELECT count(id) as mtd_Total_Loan_Applications  FROM bank_loan_data
 WHERE MONTH(issue_date)=12 AND YEAR(issue_date)= 2021 ;
 
 SELECT count(id) as previousmtd_Total_Loan_Applications  FROM bank_loan_data
 WHERE MONTH(issue_date)=11 AND YEAR(issue_date)= 2021 ; 

SELECT sum(loan_amount) as Total_Funded_Loan_amount  FROM bank_loan_data ; 

SELECT sum(loan_amount) as mtd_Total_Funded_Loan_amount  FROM bank_loan_data
WHERE MONTH(issue_date)=12 AND YEAR(issue_date)= 2021; 

SELECT sum(loan_amount) as prev_mtd_Total_Funded_Loan_amount  FROM bank_loan_data
WHERE MONTH(issue_date)=11 AND YEAR(issue_date)= 2021; 

SELECT SUM(total_payment) as total_amount_collected FROM bank_loan_data;

SELECT sum(total_payment) as mtd_Total_amount_collected  FROM bank_loan_data
WHERE MONTH(issue_date)=12 AND YEAR(issue_date)= 2021; 


SELECT sum(total_payment) as prev_mtd_Total_amount_collected  FROM bank_loan_data
WHERE MONTH(issue_date)=11 AND YEAR(issue_date)= 2021; 

SELECT avg(int_rate)*100 as avg_int_rate  FROM bank_loan_data; --here we did *100 to convert value into percentage interest rate

SELECT avg(int_rate)*100 as mtd_avg_rate  FROM bank_loan_data
WHERE MONTH(issue_date)=12 AND YEAR(issue_date)= 2021; 

SELECT avg(int_rate)*100 as prev_mtd_avg_rate  FROM bank_loan_data
WHERE MONTH(issue_date)=11 AND YEAR(issue_date)= 2021; 


SELECT avg(dti)*100 as avg_dti FROM bank_loan_data;  --debt to income ratio

SELECT avg(dti)*100 as mtd_dti  FROM bank_loan_data
WHERE MONTH(issue_date)=12 AND YEAR(issue_date)= 2021; 

SELECT avg(dti)*100 as prev_mtd_dti  FROM bank_loan_data
WHERE MONTH(issue_date)=11 AND YEAR(issue_date)= 2021; 

Select 
      (COUNT(case when loan_status = 'Fully Paid' or loan_status = 'Current' then id end )*100.0)
	  /
	  count(id) as Good_loan_percentage from bank_loan_data;

SELECT COUNT(ID) AS TOTAL_NO_GOOD_LOAN FROM bank_loan_data WHERE loan_status='Fully Paid ' OR loan_status = 'Current';

SELECT SUM(loan_amount) AS GOOD_LOAN_amount FROM bank_loan_data WHERE loan_status='Fully Paid ' OR loan_status = 'Current';

SELECT SUM(total_payment) AS GOOD_LOAN_amount_paid FROM bank_loan_data WHERE loan_status='Fully Paid ' OR loan_status = 'Current';

Select 
      (COUNT(case when loan_status = 'Charged off' then id end )*100.0)
	  /
	  count(id) as bad_loan_percentage from bank_loan_data;

SELECT COUNT(ID) AS TOTAL_NO_Bad_LOAN FROM bank_loan_data WHERE loan_status = 'Charged off';

SELECT SUM(loan_amount) AS Bad_LOAN_amount FROM bank_loan_data WHERE loan_status = 'Charged off';

SELECT SUM(total_payment) AS GOOD_LOAN_amount_paid FROM bank_loan_data  Where loan_status =  'Charged off';

SELECT loan_status,COUNT(id) as loan_count_per,SUM(total_payment) as total_payment,sum(loan_amount) as loan_amount,avg(int_rate *100) as avg_intrest_rate,avg(dti *100) as avg_dti from bank_loan_data group by loan_status;


SELECT loan_status,sum(total_payment) as mtd_total_payment,sum(loan_amount) as mtd_loan_amount from bank_loan_data WHERE month(issue_date) = 12   AND YEAR(issue_date)=2021 GROUP BY loan_status ;


SELECT MONTH(issue_date) as month_num,DATENAME( Month ,issue_date) as month_name,count(id) as total_applications,sum(total_payment) as total_payment,sum(loan_amount) as loan_amount FROM bank_loan_data GROUP BY MONTH(issue_date) , DATENAME( Month ,issue_date) ORDER BY MONTH(issue_date);

SELECT address_state as state_name , count(id) as total_applicants,sum(total_payment) as total_payment,sum(loan_amount) as total_loan_amount FROM bank_loan_data GROUP BY address_state ORDER BY address_state;

SELECT term as Term , count(id) as total_applicants,sum(total_payment) as total_payment,sum(loan_amount) as total_loan_amount FROM bank_loan_data GROUP BY term ORDER BY term;

SELECT emp_length as employee_length , count(id) as total_applicants,sum(total_payment) as total_payment,sum(loan_amount) as total_loan_amount FROM bank_loan_data GROUP BY emp_length ORDER BY emp_length;

SELECT purpose as purpose_of_loan , count(id) as total_applicants,sum(total_payment) as total_payment,sum(loan_amount) as total_loan_amount FROM bank_loan_data GROUP BY purpose ORDER BY purpose;

SELECT home_ownership as ownership_of_home , count(id) as total_applicants,sum(total_payment) as total_payment,sum(loan_amount) as total_loan_amount FROM bank_loan_data GROUP BY home_ownership ORDER BY home_ownership;

SELECT purpose as purpose_of_loan , count(id) as total_applicants,sum(total_payment) as total_payment,sum(loan_amount) as total_loan_amount FROM bank_loan_data WHERE grade='A' GROUP BY purpose ORDER BY purpose;

