#+:rbrain
(defmethod robot-link
  (:display-bodies (&optional args)
    (if args (setf (get self :display-bodies) args)
      (get self :display-bodies))
    )
  )

(new-history *history-max*)

(when (substringp "rb" (pathname-name *program-name*))
  (when (unix:getenv "RBRAPPDIR")
    (load (format nil "~A/app/nerve/nerve" (unix:getenv "RBRAPPDIR")))
    (load (format nil "~A/app/viewer/log-viewer.l" (unix:getenv "RBRAPPDIR")))
    )
  )

(when (probe-file "at-first.l")
  (warn ";;now loading \"at-first.l\"~%")
  (load "at-first.l")
  )

