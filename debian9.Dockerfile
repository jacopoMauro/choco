FROM debian:stretch
MAINTAINER Jacopo Mauro

RUN apt-get update && \
	apt-get install -y \
		openjdk-8-jre-headless \
 		wget \
		git && \
	rm -rf /var/lib/apt/lists/* && \
  mkdir -p /tool/choco && \
	cd /tool/choco && \
	# fetch the compiled version of choco-parser-4.10.3
	wget https://github.com/chocoteam/choco-solver/releases/download/4.10.3/choco-parsers-4.10.3-jar-with-dependencies.jar && \
	mv choco-parsers-4.10.3-jar-with-dependencies.jar choco-parsers.jar && \
	# retreive last global constraints redefinitions
	git clone --depth=1 https://github.com/chocoteam/choco-parsers.git && \
	mv /tool/choco/choco-parsers/src/main/mzn_lib /tool/choco/mzn-lib && \
	mv /tool/choco/choco-parsers/src/main/bash/fzn-exec.sh /tool/choco/fzn-choco && \
    sed -i 's&DIR=.*&DIR=/tool/choco&g' /tool/choco/fzn-choco && \
  # temp fix to remove the -tl option
  	sed -i 's/\-tl \$TIME_LIMIT/ /g' fzn-choco /tool/choco/fzn-choco && \
	rm -rf /tool/choco/choco-parsers

ENV PATH "$PATH:/tool/choco/"

# minizinc lib files in /tool/choco/mzn-lib
