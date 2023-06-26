# text2sql_beta
A repository that contains information about my own Text2SQL model (very beta version).

# Database generation

For this specific task I will be using a peronally created dummy marketing agency database on Clickhouse (https://clickhouse.com). Main requirements for this database will be its' ability to answer on these specific questions:

• How many active agency customers did we have on January 1st, 2022?

• When did we get the highest number of users per day in Q1 2023?

• When did we get the maximum of daily visits on the website in 2022?

• What was the average CPC in Google Ads in April 2023?

• How many LinkedIn clicks did we have in 2022?

• Which platform had the highest CPC in 2022: Google or Bing?

• Get the best ad name by clicks from Facebook, Google, and LinkedIn for 2022.

After some brainstroming time, with help of database management knowledge, I made up a dataset that minimally satisfies real-world marketing agency cases and requirements mentioned above. Here are my thoughts on how should my database look structurally:

Table Website containing data of website daily visits, having 3 columns:
1) visit_id - id of a website visit
2) visit_location - location of a visit
3) visit_date - visit date

Table Customer_payments containing data of marketing agency customer payments, having 4 columns:
1) invoice_id - id of a payment invoice
2) customer_id - id of a customer, unique and static for each customer
3) payment_amount - amount of each payment invoice
4) invoice_date - date of each invoice 

Table Platform containing data of ad platforms effectiveness, having 5 columns:
1) platform_name - name of platform (Google, Facebook, LinkedIn and Bing only)
2) ad_name - each ad unique name
3) daily_clicks - number of clicks for each day
4) date - date of ad day
5) ad_cost - cost of ad per day (necessary for CPC calculation)

<img width="1374" alt="Screen Shot 2023-06-27 at 00 10 35" src="https://github.com/one-punch-dimash/text2sql_beta/assets/98669739/f09ffa94-e6f6-4af3-a7b2-48208b4caf5f">


That's it, only 3 table, with no key connections between them (thanks God, otherwise the task could become much more complicated). You can see ClickHouse SQL script executed on my server in marketing_agency.sql file.


