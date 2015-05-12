(require 'js2-mode)

(defvar dmd:current-file)

(defun dmd:print-detected-message (node message)
  (message "%s:%d: %s" dmd:current-file (js2-node-line node) message))

(defadvice js2-parse-function-closure-body (around detect-expression-closure activate)
  (dmd:print-detected-message (ad-get-arg 0) "expression closure is deprecated")
  ad-do-it)

(defun dmd:detect-moz-dialect (node end-p)
  (unless end-p
    (cond ((js2-let-node-p node)
           (dmd:print-detected-message node "let expression/body is deprecated"))))
  t)

(setq vc-handled-backends nil)
(dolist (file argv)
  (setq dmd:current-file file)
  (with-temp-buffer
    (insert-file-contents-literally file)
    (let ((ast (js2-parse (current-buffer))))
      (js2-visit-ast ast 'dmd:detect-moz-dialect))))
