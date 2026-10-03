Prepared By: Arsenio B. Nicolas Jr.

Date: October 2026

Tools: PostgreSQL \| Tableau Public

# **Executive Summary**

This analysis includes more than 100,000 real e-commerce transactions
from Olist, Brazil\'s biggest e-commerce marketplace aggregator, between
September 2016 and October 2018. This report leverages 9 relational
tables of data, including orders, customers, products, sellers,
payments, reviews, and more, to reveal actionable insights into revenue
performance, customer geography, product category trends, payment
behavior, customer satisfaction and more -- giving a comprehensive view
of Olist\'s operational performance during a critical growth period.

# **Introduction**

## **Background**

> Olist is an eCommerce solution from Brazil that links small and medium
> businesses with the big marketplaces in Brazil. As a marketplace
> aggregator, Olist allows thousands of merchants nationwide to sell
> through a single contract, across multiple marketplaces.

## **Objectives**

> In this analysis, the following business questions are attempted to be
> answered:

- How has the business performed overall, and what are its key business
  indicators?

- Which states in Brazil earn the most money and orders?

- What are the top categories of products in terms of sales?

- How will revenue change on a month-by-month and seasonal basis?

- What are most customers\' preferred payment methods?

- Which product categories are most and least satisfied with?

- Who are the best sellers and where??

# **Data & Methodology**

## **Data Sources**

  -------------------------------------------------------------------
         Table         Description          Records
  -------------------- -------------------- -------------------------
         orders        Order status and     99,441
                       timestamps           

       customers       Customer location    99,441
                       data                 

      order_items      Product and pricing  112,650
                       details              

     order_payments    Payment method and   103,886
                       value                

     order_reviews     Customer review      99,224
                       scores               

        products       Product catalog      32,951

        sellers        Seller location data 3,095

      geolocation      Geographic           1,000,163
                       coordinates          

    product_category   Portugese to English 71
                       Translation          
  -------------------------------------------------------------------

## **Data Processing**

1.  **Loading** --- All 9 CSV files loaded into PostgreSQL using Python
    (SQLAlchemy)

2.  **Cleaning** --- Removed 3 not_defined payment records, translated
    Portuguese category names to English.

3.  **Filtering** --- Analysis limited to delivered orders (96,478
    orders) to ensure the data integrity.

4.  **Analysis** --- 8 structured SQL queries written to answer each of
    the business queries.

5.  **Loading** --- Data is stored in PostgreSQL for structured queries
    and analysis.

# **Findings**

## **Overall Business Performance**

  ---------------------------------------------------------------
           Metric          Value
  ------------------------ --------------------------------------
       Total Revenue       \$13,221,498

        Total Orders       96,478

    Average Order Value    \$119.98

    Average Review Score   4.09/5.00

      Total Customers      96,478

    Total Active Sellers   2,970
  ---------------------------------------------------------------

## **Revenue by State**

  ------------------------------------------------------------------
        State        Revenue                 Share of Total
  ------------------ ----------------------- -----------------------
    São Paulo (SP)   \$5,067,633             38.3%

    Rio de Janeiro   \$1,759,651             13.3%
         (RJ)                                

  Minas Gerais (MG)  \$1,552,482             11.7%

  Rio Grande do Sul  \$728,897               5.5%
         (RS)                                

     Paraná (PR)     \$666,064               5.0%
  ------------------------------------------------------------------

> **Key Insight:** São Paulo (SP) alone holds for 38% of the total
> revenue -- reflecting its dominance as Brazil's largest economic hub.
> The top 5 states collectively represents 74% of the total revenue,
> which signifies geographic concentration

## **Regional Economic Performance**

  ------------------------------------------------------------------
              Category             Revenue
  -------------------------------- ---------------------------------
          Health & Beauty          \$1,233,132

          Watches & Gifts          \$1,166,177

         Bed, Bath & Table         \$1,023,435

          Sports & Leisure         \$954,853

      Computers & Accessories      \$888,725
  ------------------------------------------------------------------

> **Key Insight:** Health & Beauty leads revenue despite ranking 4^th^
> in product count -- indicating higher average selling prices and
> stronger consumer demand. Watches & Gifts ranks 2^nd^ in revenue with
> relatively fewer products, suggesting premium pricing.

## **Regional Economic Performance**

> **Key Observations:**

- Revenue grew steadily from \$40,325 in October 2016 to a peak of
  \$987,765 in November 2017

- The highest revenue occurred in **November 2017**, due to promotions
  on Black Friday.

- Revenue plateaued between \$820,000--\$977,000 per month throughout
  2018

- The November 2017 Black Friday peak was 52% higher than the October
  2017 figure.

## **Payment Methods**

  -------------------------------------------------------------------
  Payment Type  Orders             Revenue         Share
  ------------- ------------------ --------------- ------------------
   Credit Card  74,586             \$12,101,095    91.5%

     Boleto     19,191             \$2,769,933     20.9%

     Voucher    5,493              \$343,013       2.6%

   Debit Card   1,486              \$208,421       1.6%
  -------------------------------------------------------------------

> **Key Insight:** Credit card accounts for 91.5% of the total revenue.
> The Brazilian payment slip method boleto represents 21% of orders and
> a much smaller revenue, indicative of lower average order values for
> boleto orders..

## **Customer Satisfaction by Category**

> Highest Rated Categories

  ------------------------------------------------------------------
         Category        Avg. Review Score  Reviews
  ---------------------- ------------------ ------------------------
   CDs, DVDs & Musicals  4.64               14

    Books --- General    4.51               533
         Interest                           

    Books --- Imported   4.51               57

       Food & Drink      4.37               271
  ------------------------------------------------------------------

> Lowest Rated Categories

  ------------------------------------------------------------------
         Category        Avg. Review Score  Reviews
  ---------------------- ------------------ ------------------------
     Office Furniture    3.52               1,664

     Fashion --- Male    3.76               124
         Clothing                           

     Fixed Telephony     3.76               253

          Audio          3.83               359
  ------------------------------------------------------------------

> **Key Insight:** The lowest reliable review score, at 3.52 and based
> on 1,664 reviews, is Office Furniture. The review score of Office
> Furniture is 3.52, which points to a solid score or some reliability
> problems. Media products have a very high rating with customers in all
> subcategories of books.

## **Top Sellers**

  -----------------------------------------------------------------------
     Seller City    State              Revenue         Orders
  ----------------- ------------------ --------------- ------------------
       Guariba      SP                 \$226,988       1,148

  Lauro de Freitas  BA                 \$217,940       400

      Ibitinga      SP                 \$196,882       1,949

       Sumaré       SP                 \$190,917       579

   Itaquaquecetuba  SP                 \$186,570       1,355
  -----------------------------------------------------------------------

> **Key Insight:** 8 of 10 top sellers are in the state of São Paulo, in
> line with the fact that most sellers and customers are also in the
> state. The Bahia seller has only 400 orders and generated 2nd of all
> revenue, meaning orders have much higher average value.

# **Recommendations**

> **For Olist Management**

- **Optimize for seller acquisition in the São Paulo region** --- There
  are strong network effects in the region of São Paulo since most of
  the top sellers are there. Increasing payment programs for sellers
  here would have the greatest return on investment.

- **Avoid problems with Address Office Furniture** --- its rating is
  3.52 on 1,664 reviews is a big risk for customer satisfaction. Seller
  quality standards and tougher logistics conditions for large/heavy
  items should be implemented.

- **Leverage the power of Black Friday** -- it\'s evident that plenty of
  consumers are reacting to promotional events, as evidenced by the
  November surge. This impact could be prolonged and reinforced with a
  carefully designed promotional calendar and pre-arranged inventory and
  logistics..

> **For Sellers**

- The highest revenue-per-product ratio is in Health & Beauty and
  Watches & Gifts; other categories with a large inventory of products
  may want to investigate these markets.

- Sellers that provide installment payment options are more likely to
  draw in greater sales revenue since 91.5% of all revenue is generated
  with credit cards.

> **For Logistics Partners**

- The Southeast accounts for 63% of revenue, with the state of São
  Paulo, Rio de Janeiro and Minas Gerais all contributing. These states
  should be the focus of logistics infrastructure investment to enhance
  delivery times and mitigate risk of low review scores

# **Limitations**

- **Data is limited to 2016-2018 only** --- the landscape of e-commerce
  in Brazil has changed considerably since then and may not be
  representative of the current market.

- **Only delivered orders** --- this means only orders that have been
  delivered will be included in the analysis, and will not include
  canceled or unavailable or in-transit orders, which could also show
  other patterns.

- **Review score discrepancy** -- The join on orders and reviews creates
  a bit of duplication in scores, with the average review score being
  4.16, compared to the raw average of 4.09.

- **Anonymization of sellers** --- seller IDs are anonymized, so that
  the pattern of performances by individual merchants can only be
  determined by city and state, but not by the individual seller ID

# **Conclusion**

> From 2016 to 2018, Olist\'s eCommerce business experienced robust
> growth, with a focus on its customer and seller base in the city of
> São Paulo. During this time, the platform has managed to generate
> Delivered Revenue of \$13.2 million based on 96,478 orders, and Black
> Friday 2017 was a pivotal moment in Brazil\'s e-commerce growth.
>
> The analysis shows that the platform has solid fundamentals, including
> a 97% delivery rate, an average review score of 4.09, and that credit
> cards are the main payment method used, indicating that the platform
> is possibly a relatively high-income platform. There is room for
> improvement in several areas, though, such as the Southeast\'s
> geographic concentration, and persistent satisfaction problems in
> categories such as Office Furniture and Male Fashion.
>
> The future of the nation\'s small businesses and the way they can
> access large marketplaces with their products is being redefined by a
> new generation of platforms that make e-commerce more accessible for
> sellers nationwide, especially in Brazil.Platforms such as Olist,
> which have managed to connect the small sellers to the large
> marketplaces, will assume a more and more critical role in
> democratizing e-commerce in a country with a diverse economy.
