JAVA_AGENT_SRC=https://s3.amazonaws.com/cloudbees-downloads/appserver/genapp-java.jar

deps: java_agent

java_agent:
	mkdir -p lib
	curl -Lo lib/genapp-java.jar $(JAVA_AGENT_SRC)
