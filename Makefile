IS_NAMESPACE=openshift
NAMESPACE=test

pre-deploy:
	oc create -f sample-secret.yml
	oc create -f sample-configmap.yml

deploy:
	mvn clean fabric8:deploy -Dfabric8.generator.from=$(IS_NAMESPACE)/fuse7-java-openshift:1.6

test:
	mvn test -Dtest=*KT -Dnamespace.use.existing=$(NAMESPACE) -Dnamespace.cleanup.enabled=false -Denv.init.enabled=false
