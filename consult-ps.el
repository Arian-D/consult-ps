(require 'consult)

(defun read-process ()
  "Use `pgrep' to select process through consult"
  (interactive)
  (consult--read
   (consult--async-command
       (lambda (x) (list "pgrep" "-a" x))
     :prompt "Process: "
     :require-match t)))

(defun consult-pkill ()
  "Run `pkill' on a process"
  (interactive)
  (let* ((process (read-process))
         (process-info (split-string process))
         (process-id (car process-info))
         (kill-command (format "kill %s" process-id)))
    (pp process-id)
    (pp kill-command)
    (shell-command kill-command)))
