(setf *random-state* (make-random-state t))
(defvar ans (+ (random 100) 1))
(defvar guess 0)
(defvar guesses 0)
(loop
	(format t "
Guess a number: ")
 	(force-output)
 	(setq guess (read))
 	(setq guesses (+ guesses 1))
	(if (< guess ans) 
		(format t "~D is too low!" guess)
		(if (> guess ans) 
			(format t "~D is too high!" guess)
			(return)
		)
	)
)
(format t "~D is correct! 
" guess)
(format t "Got it in ~D guesses! 
" guesses)

(quit)

