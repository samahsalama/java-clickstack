java_agent_src=https://s3.amazonaws.com/cloudbees-downloads/appserver/genapp-java.jar

all: pkg

clean: clean-deps clean-pkg

deps: lib/genapp-java.jar

clean-deps:
	rm lib/genapp-java.jar

lib/genapp-java.jar:
	mkdir -p lib
	curl -Lo lib/genapp-java.jar $(java_agent_src)

pkg: deps java-plugin.zip

clean-pkg:
	rm -rf pkg
	rm -f java-plugin.zip

java-plugin.zip:
	rm -rf pkg
	mkdir pkg
	cp -a control functions lib LICENSE setup pkg
	cd pkg; zip -r ../java-plugin.zip *

publish:
ifndef publish_plugin_cmd
	$(error "export publish_plugin_cmd first")
endif
	@eval "$(publish_plugin_cmd) `pwd`/java-plugin.zip"
