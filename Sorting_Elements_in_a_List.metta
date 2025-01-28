; Function to swap adjacent elements if they are out of order
(= (bubble-pass $list $sorted)
    (if (empty? (tail $list))
        (cons (head $list) $sorted)  ; Add the last element to the sorted part
        (if (> (head $list) (head (tail $list)))
            ; Swap if the current element is greater than the next
            (bubble-pass 
                (cons (head (tail $list)) (cons (head $list) (tail (tail $list))))
                $sorted
            )
            ; Keep the current order and move to the next element
            (bubble-pass (cons (head (tail $list)) (tail (tail $list))) 
                (cons (head $list) $sorted)
            )
        )
    )
)

; Function to sort the list using Bubble Sort
(= (bubble-sort $list)
    (if (empty? $list)
        ()  ; Return an empty list if the input is empty
        ; Perform one pass and repeat until fully sorted
        (let $result (bubble-pass $list ())
            ; If no swaps were needed, the result is sorted
            (if (== $result $list)
                $list
                (bubble-sort (init $result))
            )
        )
    )
)

; Function to collect user input for creating a list
(= (get-user-list)
    ; Prompt the user to enter numbers
    (println "Enter numbers separated by spaces, then press Enter:")
    (let $input (read-line)  ; Read user input as a string
        ; Convert the input string into a list of numbers
        (map (lambda $x (to-number $x)) (split $input " "))
    )
)

; Main function to execute the sorting
(= (main)
    (let $user-list (get-user-list)  ; Get the user-provided list
        (let $sorted-list (bubble-sort $user-list)  ; Sort the list
            (println "Sorted List:" $sorted-list)  ; Print the sorted list
        )
    )
)

; Run the main function
(! (main))