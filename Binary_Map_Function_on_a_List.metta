; Define a binary map function that applies a binary function to each element of a list and a constant.
; Base case: If the list is empty, return an empty list.
(= (binary-map $f $constant $list)
    (if (empty? $list)
        ()
        ; Recursive case: Apply the function to the head of the list and the constant,
        ; then recurse on the tail of the list.
        (cons ($f (head $list) $constant) (binary-map $f $constant (tail $list)))
    )
)

; Define a binary function to add two numbrs.
(= (addTwo $x $y)
    (+ $x $y)  ; Add the two arguments.
)

; Function to collect user input for the list.
(= (get-user-list)
    (println "Enter numbers separated by spaces for the list:")
    (let $input (read-line)  ; Read user input as a string.
        ; Convert the input string into a list of numbers.
        (map (lambda $x (to-number $x)) (split $input " "))
    )
)

; Function to collect user input for the constant value.
(= (get-constant)
    (println "Enter a constant value:")
    (to-number (read-line))  ; Convert the input string into a number.
)

; Main function to execute the binary map operation.
(= (main)
    (let $user-list (get-user-list)  ; Get the list of numbers from the user.
        (let $constant (get-constant)  ; Get the constant value from the user.
            ; Apply the binary map with the addTwo function, the constant, and the user-provided list.
            (let $result (binary-map addTwo $constant $user-list)
                (println "Resulting list:" $result)  ; Print the resulting list.
            )
        )
    )
)

; Run the main function.
(! (main))