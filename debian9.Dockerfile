FROM debian:stretch
MAINTAINER Jacopo Mauro

RUN apt-get update && \
	apt-get install -y \
		openjdk-8-jre-headless \
 		wget \
		git && \
  mkdir -p /tool/choco && \
	cd /tool/choco && \
	# fetch the compiled version of choco-parser-4.0.5
	git clone --depth=1 https://github.com/lteu/choco-parsers-4.0.5 && \
	mv choco-parsers-4.0.5/choco-parsers-4.0.5-with-dependencies.jar choco-parsers.jar && \
	# retreive last global constraints redefinitions
	git clone --depth=1 https://github.com/chocoteam/choco-parsers.git && \
	mv /tool/choco/choco-parsers/src/main/mzn_lib /tool/choco/mzn-lib && \
	mv /tool/choco/choco-parsers/src/main/bash/fzn-exec.sh /tool/choco/fzn-choco && \
    sed -i 's&DIR=.*&DIR=/tool/choco&g' /tool/choco/fzn-choco && \
	rm -rf /tool/choco/choco-parsers

ENV PATH "$PATH:/tool/choco/"

# minizinc lib files in /tool/choco/mzn-lib
