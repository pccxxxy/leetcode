# Write your MySQL query statement below
SELECT 

    visited_on, 

    c_sum AS amount,

    ROUND((c_sum*1.00)/7,2) AS average_amount 

FROM 

(

SELECT 

    

    C1.visited_on

    -- *

    , SUM(total) 

        OVER(

                

                ORDER BY C1.visited_on

                ROWS BETWEEN 6 PRECEDING AND CURRENT ROW

            ) AS c_sum

    ,ROW_NUMBER() OVER(ORDER BY C1.visited_on) AS row_num

    -- , SUM(people) 

    --     OVER(

                

    --             ORDER BY C1.visited_on

    --             ROWS BETWEEN 6 PRECEDING AND CURRENT ROW

    --         ) AS people


FROM 

    (SELECT 

        *

        , SUM(amount) AS total

        , COUNT(*) AS people

        -- , RANK() OVER(ORDER BY C2.visited_on) AS day_num

        FROM 

            Customer C2 

        GROUP BY 

        C2.visited_on

    ) AS C1

) AS TF


WHERE row_num >= 7