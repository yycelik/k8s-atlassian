# k8s atlassian jira installation
before u start your installation, each worker node should have nfs-common

apt-get install -y nfs-common


#useful links

https://artifacthub.io/packages/helm/atlassian-data-center/jira/1.16.5 

https://github.com/atlassian/data-center-helm-charts 

https://bitbucket.org/atlassian-docker/docker-atlassian-jira/src/master/


https://atlassian.github.io/data-center-helm-charts/userguide/INSTALLATION

https://atlassian.github.io/data-center-helm-charts/examples/external_libraries/EXTERNAL_LIBS/ 




Note: persistent storage created automatically using longhorn
