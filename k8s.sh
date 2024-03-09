# Kubernetes


# https://kubernetes.io/docs/reference/kubectl/cheatsheet/
# https://kubernetes.io/docs/reference/generated/kubectl/kubectl-commands
which k
# k: aliased to kubectl

# default alias
# https://github.com/search?q=repo%3Akubernetes%2Fkubernetes+%22ShortNames+implements+the+ShortNamesProvider+interface.+Returns+a+list+of+short+names+for+a+resource%22&type=code&p=1



###################
# kubectl-commands
# 
# annotate
# config
# cp
# delete
# describe
# edit
# exec
# get
# logs
# patch
# rollout
###################



# annotate
# add
k -n ns annotate statefulset sts-name prometheus.io/scrape=true
# remove. Use minus - sign at the end of the annotation
k -n ns annotate statefulset sts-name prometheus.io/scrape-



# config
k config get-contexts | grep abc
k config use-context k8s-abc
k config current-context



# cp
k cp ~/tmp/abc.yaml -n ns cc-podname:/tmp/abc.yaml -c container-name



# delete
k -n ns delete pods pod-name
k -n ns delete hpa obj-name
k -n kube-system delete metrics-server
k delete pods pod-name --force --grace-period=0



# describe
k -n ns describe pod pod-name
k describe ClusterRoleBinding role-tokenreview-binding
k describe clusterrole system:auth-delegator
k -n ns describe serviceaccounts account-name



# edit
export KUBE_EDITOR=vim
k -n ns edit deployments

KUBE_EDITOR=nano k -n ns edit deployments --context=k8s-abc



# exec
k -n ns exec -it pod-name -- /bin/bash
k -n ns exec -it pod-name -- env | grep xzy
k -n ns exec -it pod-name -c container-name -- some-binary some-flag



# get
k -n ns get pods --context=$KCTX
k -n ns get pods -w
k -n ns get pods -owide
k -n ns get pods -oyaml
k -n ns get pods --show-labels
k -n ns get pods --field-selector spec.nodeName=node-xzy

k -n ns get events --context=$KCTX
k -n ns get events -w
k -n ns get events --sort-by='.lastTimestamp'
k -n ns get events --sort-by='.metadata.creationTimestamp'

k get node -l some-label=xyz
k get node node-name -owide --show-labels

k -n ns get serviceaccounts

k -n ns get rolebindings,clusterrolebindings -o custom-columns='KIND:kind,ROLE:metadata.name,SERVICE_ACCOUNT:subjects[?(@.kind=="ServiceAccount")].name'



# log
k -n ns logs pod-name
k -n ns logs pod-name -f --timestamps
k -n ns logs pod-name --tail 10
# use labels to filter the pod
k -n ns logs -l some-labels=xyz



# patch
# goal - verify the patch before apply to the cluster
# 1
k -n ns get cm config-name -o go-template='{{index .data "xyz-config.properties"}}'  > /tmp/k8s-abc.config
# 2
k create configmaps config-name --from-file /tmp/k8s-abc.config -o json --dry-run=client > /tmp/patch.json
# 3 change the patch.json to what you want
# 4
k -n ns patch configmaps config-name --dry-run=client --patch-file /tmp/patch.json
# 5
k -n ns get cm config-name -o yaml > /tmp/original.yaml
# 6
diff /tmp/output.yaml /tmp/original.yaml



# rollout
k -n ns rollout restart deployment
