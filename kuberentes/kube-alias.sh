alias ll='ls -al'

alias k='kubectl'

alias kgpo='kubectl get po'
alias kgcm='kubectl get cm'
alias kgsv='kubectl get svc'

alias kdpo='kubectl describe po'
alias kdcm='kubectl describe cm'
alias kdsv='kubectl describe svc'

kbash() {
  kubectl exec --stdin --tty "$1" -- /bin/bash
}

kexec() {
  kubectl exec --stdin --tty "$3" -- "$1" "$2"
}

kexec4() {
  kubectl exec --stdin --tty "$4" -- "$1" "$2" "$3"
}

ktoken() {
  kubectl exec --stdin --tty "$1" -- cat /var/run/secrets/eks.amazonaws.com/serviceaccount/token
}
