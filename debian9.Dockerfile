FROM debian:stretch
MAINTAINER Jacopo Mauro

RUN apt-get update && \
	apt-get install -y \
		openjdk-8-jre-headless \
 		wget \
		git && \
  mkdir -p /tool/choco && \
	cd /tool/choco && \
	wget https://github.com/chocoteam/choco-parsers/releases/download/choco-parsers-4.0.4/choco-parsers-4.0.4-with-dependencies.jar && \
	mv choco-parsers-4.0.4-with-dependencies.jar choco-parsers.jar && \
	# retreive last global constraints redefinitions
	git clone --depth=1 https://github.com/chocoteam/choco-parsers.git && \
	mv /tool/choco/choco-parsers/src/main/mzn_lib /tool/choco/mzn-lib && \
	mv /tool/choco/choco-parsers/src/main/bash/fzn-exec.sh /tool/choco/fzn-choco && \
  sed -i 's&DIR=.*&DIR=/tool/choco&g' /tool/choco/fzn-choco && \
	rm -rf /tool/choco/choco-parsers

ENV PATH "$PATH:/tool/choco/"

# minizinc lib files in /tool/choco/mzn-lib
