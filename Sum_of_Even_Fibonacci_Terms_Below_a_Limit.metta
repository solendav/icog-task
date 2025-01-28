; Function to check if a number is even
(= (is-even $number)
    ; Check if the remainder of $number divided by 2 is 0 (i.e., $number is even)
    (== (% $number 2) 0)
)

; Recursive function to calculate the sum of even Fibonacci numbers
(= (calculate-even-fibonacci-sum $limit $previous $current $total-sum)
    ; Base case: if the current Fibonacci number exceeds or equals the limit
    (if (>= $current $limit)
        ; Retrn the accumulated total sum
        $total-sum
        ; Recursive case: continue with the next Fibonacci number
        (calculate-even-fibonacci-sum $limit $current (+ $previous $current)
            ; If the current Fibonacci number is even, add it to the total sum
            (if (is-even $current)
                (+ $total-sum $current)  ; Add to the sum if even
                $total-sum              ; Otherwise, keep the sum unchanged
            )
        )
    )
)

; Main function to start the calculation with the initial Fibonacci numbers and sum
(= (sum-even-fibonacci $limit)
    ; Start the recursion with initial values: first Fibonacci number = 1, second = 2, sum = 0
    (calculate-even-fibonacci-sum $limit 1 2 0)
)

; Get user input for the limit
(= ($user-limit (input "Enter the limit for Fibonacci terms: ")))

; Call the main function to compute the sum of even Fibonacci numbers below the user-provided limit
(! (sum-even-fibonacci (to-number $user-limit)))