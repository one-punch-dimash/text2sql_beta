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

# Text2SQL comprehension

After exploring several scientific papers, I have gotten a solid comprehension upon what model should do. First of all, and in my opinion, most importantly, we need to teach our model to translate natural language questions into SQL queries is to generalize to unseen database schemas. SQL deals with structured relational databases, and authors of "SQL-PALM: Improved Large Language Model Adaptation For Text-To-SQL", Sun et al. gave a decent explanation on how a model should read and analyse databases as functions with independent variables as T (tables), K (keys), and c (columns). This kind of generalisation depends on encoding the database relations in an accessible way and modelling alignment between relevant database columns in the query. So a self-attention mechanism that enables the encoding of schema information, representation of features, and linking of schema elements within the text-to-SQL model should be constructed in order to give the model insights about any database. Besides, the model must understand not only the structure of databases, but also make computations within given tables. 

# Solution

I chose Wikisql database and applied T5 pre-trained model for this task. To be fair, my solution is not ideal due to the fact that I didn't consider a point about model's database comprehension mechanism, because it requires much more time to be done. 

Lack of computational resources is another reason why the results are not satisfying, developing the model on Google Colab's free GPU was a bad decision. You can see my work in text2sql_homework_Aitkali_D.ipynb file. 

To conclude, I was very excited solving the task, and plan to continue researching the field of text2SQL, I think it's one of the most promising way of research.


