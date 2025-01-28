; Function to check if a number is a multiple of 3 or 5
(= (is-multiple-of-3-or-5 $x)
    ; The "or" condition checks two cases:
    ; 1. Is $x divisible by 3 (remainder = 0)?
    ; 2. Is $x divisible by 5 (remainder = 0)?
    ; If either is true, the number is a multiple of 3 or 5.
    (or (== (% $x 3) 0) (== (% $x 5) 0))
)

; Recursive function to calculate the sum of multiples below a given limit
(= (sum-multiples-below $n $current $sum)
    ; Check if the current number ($current) is still less than the limit ($n)
    (if (< $current $n)
        ; If $current is less thn $n, continue the recursion:
        (sum-multiples-below $n 
                             (+ $current 1) ; Increment $current by 1
                             ; Check if $current is a multiple of 3 or 5
                             (if (is-multiple-of-3-or-5 $current)
                                 (+ $sum $current) ; Add $current to $sum if true
                                 $sum ; Otherwise, keep $sum unchanged
                             )
        )
        ; Base case: If $current is not less than $n, return the final sum
        $sum
    )-
)

; Main function to calculate the sum of multiples of 3 or 5 below the given limit
(= (sum-of-multiples $n)
    ; Start the recursive process with:
    ; - $n as the limit
    ; - Initial value of $current = 0
    ; - Initial value of $sum = 0
    (sum-multiples-below $n 0 0)
)

; Prompt the user to input the limit
(= ($limit (input "Enter the limit: ")))

; Convert the user input to a number and calculate the sum
(! (sum-of-multiples (to-number $limit)))