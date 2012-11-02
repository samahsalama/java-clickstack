plugin_name=java-plugin
java_agent_src=https://s3.amazonaws.com/cloudbees-downloads/appserver/genapp-java.jar
s3_url=s3://cloudbees-downloads/appserver-dev/

all: pkg

clean: clean-deps clean-pkg

deps: lib/genapp-java.jar

clean-deps:
	rm lib/genapp-java.jar

lib/genapp-java.jar:
	mkdir -p lib
	curl -Lo lib/genapp-java.jar $(java_agent_src)

pkg: deps $(plugin_name).zip

clean-pkg:
	rm -rf pkg
	rm -f $(plugin_name).zip

$(plugin_name).zip:
	rm -rf pkg
	mkdir pkg
	cp -a control functions lib LICENSE setup pkg
	cd pkg; zip -r ../$(plugin_name).zip *

publish: pkg
	@if [ ! -e s3cfg ]; then \
	  echo "To publish to s3, copy s3cfg.in to s3cfg and edit" \
               "s3cfg specifying your AWS credentials for s3." | fold -s; \
	  exit 1; \
	fi
	@if [ "$$(which s3cmd)" = "" ]; then \
	  echo "To publish to s3, you must install s3cmd. If a system" \
	       "package isn't available, you can download the source from" \
	       "http://s3tools.org/s3cmd" | fold -s; \
	  exit 1; \
	fi
	s3cmd put -c s3cfg $(plugin_name).zip $(s3_url)
