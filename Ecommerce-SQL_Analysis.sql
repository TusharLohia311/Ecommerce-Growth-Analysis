-- ====================================================================================================================================================
-- SECTION 01:Time Horizon & Business Totals
-- ====================================================================================================================================================
-- This query establishes the exact date range of my Data set 
-- and Total volume across traffic,sales,and Revenue. 
  use mavenfuzzyfactory;
select 
	min(date(created_at)) as First_record_Date,
    max(date(created_at)) as Last_record_Date,
    count(distinct order_id) as total_orders,
    round(sum(price_usd),2) as Total_revenue
from orders;

-- ===========================================--=========================================================================================================
-- SECTION 02: Overall Website Conversion rate (CRV)
-- ===========================================--=========================================================================================================

-- in ecommerce,Conversion rate 
-- CRV=(orders/sessions)*100 is the most critical North star metric.

select 
	count(distinct s.website_session_id ) as Total_sessions,
    count(distinct order_id ) as total_orders,
    round(count(distinct order_id )/count(distinct s.website_session_id )*100,2) as overall_conversion_rate_pct
from website_sessions s 
left join orders o 
	on s.website_session_id=o.website_session_id;
    
-- ====================================================================================================================================================
-- SECTION 03 : Traffic Channel Breakdown
-- ===========================================--=========================================================================================================

-- where are the site visitors coming from,
-- and which marketing sources are actually bringing in paying customers   
select 
	coalesce(s.utm_source, 'Direct/organic') as utm_source,
    coalesce(s.utm_campaign,'None') as utm_campaign,
	count(distinct s.website_session_id) as website_session,
    count(distinct order_id) as total_orders,
	round(count(distinct order_id )/count(distinct s.website_session_id )*100,2) as conversion_rate_pct
from website_sessions s
left join orders o 
	on s.website_session_id=o.website_session_id
group by 1,2 
order by website_session desc;

-- ====================================================================================================================================================
--  SECTION 04 : Monthly Orders profit & Revenue Trend
--  ===========================================--=========================================================================================================
-- Lets see how Sales & profit Growth looks month-over-month. 

select
	year(created_at) as yr,
    Month(created_at) as Mo,
    count(distinct(order_id))as Total_orders ,
    Round(sum(price_usd-cogs_usd),2) as Total_profit,
    Round(sum(price_usd),2) as Total_revenue,
    Round(avg(price_usd),2) as avg_order_value
from orders 
Group by 1,2
order by 1,2;

-- ====================================================================================================================================================
--  SECTION 05 : Product Expansion and cross selling 
-- ====================================================================================================================================================
-- 05 (A)
-- Product Launch Timeline & Revenue Mix Shift
-- ====================================================================================================================================================
-- Lets  see how sales shifted over time as new 
-- products were introduced to the catalog(primary_product_id).
select 
	year(o.created_at) as yr,
    p.product_name as primary_product,
    count(distinct o.order_id) as Total_orders,
	Round(sum(price_usd-cogs_usd),2) as Total_profit,
    Round(sum(price_usd),2) as Total_revenue
from orders o 
join products p 
	on o.primary_product_id=p.product_id
group by 1,2
order by  2;

-- ====================================================================================================================================================
-- 05(B)
-- Multi-item Order Growth & AOV Expansion
-- ====================================================================================================================================================
-- when cross-selling is added to am e-commerce checkout flow,
-- the percentage of Multi-item orders should increase , driving up average order value 
-- (AOV) and items per order. 
 select 
	year(created_at) as Yr,
    count(distinct order_id) as Total_orders,
    count(distinct case when items_purchased = 1 then order_id end) as single_item_orders,
    count(distinct case when items_purchased > 1 then order_id end) as Multi_item_orders,
    Round(count(distinct case when items_purchased > 1 Then Order_id end )/count(distinct order_id)*100,2) as Multi_item_order_pct,
    round(avg(items_purchased),2) as avg_item_per_order,
	round(avg(price_usd),2) as avg_order_value
from orders 
group by 1 
order by 1;
 
 -- ===================================================================================================================================================
 -- 05(C)
 -- Primary Product Vs. cross-sell pair analysis
 -- ====================================================================================================================================================

 select
	p.product_name as primary_product,
    count(distinct o.order_id) as Total_primary_orders,
    count(distinct case when oi.is_primary_item=0 Then oi.order_id end ) as Total_cross_sold_orders,
    round(count(distinct case when oi.is_primary_item=0 Then oi.order_id end )/count(distinct o.order_id)*100,2) as cross_sell_attach_rate_Pct,
    count(distinct case when oi.is_primary_item=0  and oi.product_id= 1 Then oi.order_id end ) as Xsell_product_1,
    count(distinct case when oi.is_primary_item=0  and oi.product_id= 2 Then oi.order_id end ) as Xsell_product_2,
	count(distinct case when oi.is_primary_item=0  and oi.product_id= 3 Then oi.order_id end ) as Xsell_product_3,
    count(distinct case when oi.is_primary_item=0  and oi.product_id= 4 Then oi.order_id end ) as Xsell_product_4
from orders o 
join products p
	on o.primary_product_id=p.product_id
left join order_items oi 
	on o.order_id=oi.order_id
group by 1 
order by Total_primary_orders desc;

-- ====================================================================================================================================================

-- ====================================================================================================================================================
-- SECTION 6 : Refund Analysis
-- ====================================================================================================================================================
-- 06(A)
-- Overall Refund rate By Product
-- ====================================================================================================================================================

select 
	p.product_name,
    count(distinct oi.order_item_id) as Total_items_sold,
    count(distinct r.order_item_id) as Total_items_Refunded,
    round(count(distinct r.order_item_id)/count(distinct oi.order_item_id)*100,2) as Refund_rate_pct,
    round(sum(r.refund_amount_usd)) as Total_Refund_amount
from order_items oi
join products p 
	on p.product_id=oi.product_id
left join order_item_refunds r 
	on r.order_item_id=oi.order_item_id
group by 1
order by Total_items_sold Desc;

-- ====================================================================================================================================================
-- 06(B)
-- Refund Rate Trends Over Time 
-- ====================================================================================================================================================

select 
	year(oi.created_at) as yr,
    p.product_name,
    count(distinct oi.order_item_id) as Total_items_sold,
    count(distinct r.order_item_id) as Total_items_Refunded,
    round(count(distinct r.order_item_id)/count(distinct oi.order_item_id)*100,2) as Refund_rate_pct 
from order_items oi
join products p 
	on p.product_id=oi.product_id
left join order_item_refunds r 
	on r.order_item_id=oi.order_item_id
group by 1,2
order by 2;

-- =====================================================================================================================================================
-- =====================================================================================================================================================
-- SECTION 07 : Website Conversion Funnel 
-- ====================================================================================================================================================

 with funnel_flags as(
	select
		website_session_id,
        max(case when pageview_url= '/products' then 1 else 0 end ) as product_page,
        max(case when pageview_url= '/cart' then 1 else 0 end ) as cart_page,
        max(case when pageview_url= '/shipping' then 1 else 0 end ) as shipping_page,
        -- catching both billing page
        max(case when pageview_url in  ('/billing','/billing-2') then 1 else 0 end ) as billing_page,
        max(case when pageview_url= '/thank-you-for-your-order' then 1 else 0 end ) as receipt_page
	from website_pageviews
    group by website_session_id
)
select 
	-- 1 absolute numbers
    count(website_session_id) as total_sessions,
    sum(product_page) as to_products,
    sum(cart_page) as to_cart,
    sum(shipping_page) as to_shipping,
    sum(billing_page) as to_billing,
    sum(receipt_page) as to_receipt,
    
    -- Click-through Rates
	round(sum(product_page)/ count(website_session_id)*100,2) as Lander_to_products_pct,
	round( sum(cart_page)/sum(product_page)*100,2) as product_to_cart,
	round( sum(shipping_page)/ sum(cart_page)*100,2) as cart_to_shipping,
	round(sum(billing_page)/sum(shipping_page)*100,2) as shipping_to_billing,
	round(sum(receipt_page)/ sum(billing_page)*100,2) as billing_to_receipt_pct
from funnel_flags;   
 
 -- ===================================================================================================================================================
 -- ===================================================================================================================================================
--  SECTION 08 : Billing Page A/B Test
 -- ===================================================================================================================================================
-- Compare conversion performance of the original and redesigned billing pages.
 
SELECT
    wp.pageview_url AS billing_version,
    COUNT(DISTINCT wp.website_session_id) AS billing_sessions,
    COUNT(DISTINCT o.order_id) AS orders,
    ROUND(
        COUNT(DISTINCT o.order_id) /
        COUNT(DISTINCT wp.website_session_id) * 100,
        2
    ) AS billing_conversion_rate_pct
FROM website_pageviews wp
LEFT JOIN orders o
    ON wp.website_session_id = o.website_session_id
WHERE wp.pageview_url IN ('/billing', '/billing-2')
GROUP BY wp.pageview_url
ORDER BY billing_conversion_rate_pct DESC;

 -- ===================================================================================================================================================
 -- SECTION 09 : Device Conversion Rates
 -- ===================================================================================================================================================
 
 select 
	s.device_type,
    count(distinct s.website_session_id ) as Total_sessions,
    count(distinct order_id ) as total_orders,
    round(count(distinct o.order_id)/ count(distinct s.website_session_id )*100,2)as conversion_rate_pct,
    round(sum(o.price_usd),2) as total_revenue
from website_sessions s 
left join orders o 
	on o.website_session_id=s.website_session_id
group by s.device_type;  

 -- ===================================================================================================================================================
