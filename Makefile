plugin_name = java-plugin-1.1.1
publish_bucket = cloudbees-clickstack
publish_repo = testing
publish_url = s3://$(publish_bucket)/$(publish_repo)/

deps = lib/genapp-java.jar

pkg_files = control functions lib LICENSE setup

java_agent_ver = 1.2.1
java_agent_src = http://central.maven.org/maven2/com/cloudbees/clickstack/cloudbees-clickstack-javaagent/$(java_agent_ver)/cloudbees-clickstack-javaagent-$(java_agent_ver).jar
java_agent_md5 = e75476b9525c6b00639ef7105bdcef60

include plugin.mk

lib/genapp-java.jar:
	mkdir -p lib
	curl -fLo lib/genapp-java.jar "$(java_agent_src)"
	$(call check-md5,lib/genapp-java.jar,$(java_agent_md5))

