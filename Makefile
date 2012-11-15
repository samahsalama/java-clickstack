plugin_name = java-plugin
publish_repo = testing
publish_url = s3://cloudbees-clickstack/$(publish_repo)/

deps = lib/genapp-java.jar

pkg_files = control functions lib LICENSE setup

java_agent_ver = 20121113
java_agent_src = https://s3.amazonaws.com/cloudbees-downloads/appserver/genapp-java-$(java_agent_ver).jar
java_agent_md5 = 12e7dfa53fc066374a6a92e4a51fd06e

include plugin.mk

lib/genapp-java.jar:
	mkdir -p lib
	curl -fLo lib/genapp-java.jar "$(java_agent_src)"
	echo "$(java_agent_md5)  lib/genapp-java.jar" | md5sum --check
