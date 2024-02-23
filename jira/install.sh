# install k8s-node
apt install nfs-common
apt install cifs-utils

#create namespace
kubectl create namespace atlas

# add secrets
kubectl create -n atlas -f secret-certificate.yaml
kubectl create -n atlas -f secret-database.yaml
kubectl create -n atlas -f certificate.yaml
#kubectl create -n atlas -f license.yaml



# add helm repo
helm repo add atlassian-data-center https://atlassian.github.io/data-center-helm-charts

#update helm repo
helm repo update



# download values.yaml to compare values.example.yaml
#
# add jira license secret to the k8s
# https://atlassian.github.io/data-center-helm-charts/userguide/INSTALLATION/#7-configure-license
helm show values atlassian-data-center/jira > values.yaml

# https://artifacthub.io/packages/helm/atlassian-data-center/jira/1.16.5
# intall jira
helm install jira atlassian-data-center/jira --namespace atlas --version 1.16.5 --values values.yaml



# after installation enter jira pod 

# remove directory on the pod
cd /var/atlassian/application-data/shared-home/libraries/
rm -r /var/atlassian/application-data/shared-home/libraries/mysql-connector-j-8.1.0.jar

# download mysql jar
# that should be on the values.yaml >> additionalLibraries
# https://atlassian.github.io/data-center-helm-charts/examples/external_libraries/EXTERNAL_LIBS/#3-update-valuesyaml
# on pod, you can download jar using wget
wget https://repo1.maven.org/maven2/com/mysql/mysql-connector-j/8.1.0/mysql-connector-j-8.1.0.jar
# or copy local to pod using kubectl
# kubectl cp <local-path> <namespace>/<pod-name>:<pod-path>
kubectl cp mysql-connector-j-8.1.0.jar atlas/jira-0:/var/atlassian/application-data/shared-home/libraries/



# uninstall jira 
helm uninstall jira --namespace atlas
