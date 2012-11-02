plugin_name = java-plugin
publis_repo = dev
publish_url = s3://cloudbees-clickstack/$(publish_repo)/

deps = lib/genapp-java.jar

pkg_files = control functions lib LICENSE setup

java_agent_src  = \
  https://s3.amazonaws.com/cloudbees-downloads/appserver/genapp-java.jar

include plugin.mk

lib/genapp-java.jar:
	mkdir -p lib
	curl -fLo lib/genapp-java.jar "$(java_agent_src)"
