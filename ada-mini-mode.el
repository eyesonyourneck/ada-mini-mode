(defvar ada-mini-mode-syntax-table
  (let ((table (make-syntax-table)))
    (modify-syntax-entry ?- ". 12" table)
    (modify-syntax-entry ?\n ">" table)

    (modify-syntax-entry ?< "." table)
    (modify-syntax-entry ?> "." table)

    (modify-syntax-entry ?\" "\"" table)
    (modify-syntax-entry ?' "." table)
    table))

(defconst ada-mini-types
  '("Boolean" "Integer" "Natural" "Positive"
    "Float" "Long_Float" "Short_Float"
    "Character" "Wide_Character" "Wide_Wide_Character"
    "String" "Wide_String" "Wide_Wide_String"
    "Duration"))

(defconst ada-mini-keywords
  '("abort" "abs" "abstract" "accept" "access" "aliased" "all" "and" "array" "at"
    "begin" "body"
    "case" "constant"
    "declare" "delay" "delta" "digits" "do"
    "else" "elsif" "end" "entry" "exception" "exit"
    "for" "function"
    "generic" "goto"
    "if" "in" "interface" "is"
    "limited" "loop"
    "mod"
    "new" "not" "null"
    "of" "or" "others" "out" "overriding"
    "package" "parallel" "pragma" "private" "procedure" "protected"
    "raise" "range" "record" "rem" "renames" "requeue" "return" "reverse"
    "select" "separate" "some" "subtype" "synchronized"
    "tagged" "task" "terminate" "then" "type"
    "until" "use"
    "when" "while" "with"
    "xor"))

(defconst ada-mini-constants
  '("True" "False" "null"))

(defvar ada-mini-font-lock-keywords
  `((,(regexp-opt (append ada-mini-keywords ada-mini-types ada-mini-constants) 'symbols)
     . font-lock-keyword-face)))

(define-derived-mode ada-mini-mode prog-mode "ada-mini"
  "Minimal major mode for Ada."
  :syntax-table ada-mini-mode-syntax-table
  (setq-local font-lock-defaults '(ada-mini-font-lock-keywords nil t))
  (setq-local comment-start "-- ")
  (setq-local comment-end ""))

(add-to-list 'auto-mode-alist '("\\.\\(adb\\|ads\\|ada\\)\\'" . ada-mini-mode))

(provide 'ada-mini-mode)
