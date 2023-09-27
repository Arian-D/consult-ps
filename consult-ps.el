(require 'consult)

(defun consult-ps ()
  "Use `pgrep' to select process through consult and return a string
with the PID followed by the path."
  (interactive)
  (consult--read
   (consult--async-command
       (apply-partially #'list "pgrep" "-a"))
   :prompt "Process name: "
   :require-match t))

(defun consult-pkill ()
  "Run `pkill' on a process"
  (interactive)
  (let* ((process (consult-ps))
         (process-info (split-string process))
         (process-id (car process-info))
         (kill-command (format "kill %s" process-id)))
    (shell-command kill-command)))

(provide 'consult-ps)
