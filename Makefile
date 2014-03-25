plugin_name = java-plugin-1.1.0
publish_bucket = cloudbees-clickstack
publish_repo = testing
publish_url = s3://$(publish_bucket)/$(publish_repo)/

deps = lib/genapp-java.jar

pkg_files = control functions lib LICENSE setup

java_agent_ver = 20130313
java_agent_src = https://s3.amazonaws.com/cloudbees-downloads/appserver/genapp-java-$(java_agent_ver).jar
java_agent_md5 = 44cd511782ea1924449bdb833c036762

include plugin.mk

lib/genapp-java.jar:
	mkdir -p lib
	curl -fLo lib/genapp-java.jar "$(java_agent_src)"
	$(call check-md5,lib/genapp-java.jar,$(java_agent_md5))

