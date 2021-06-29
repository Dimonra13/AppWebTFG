FROM groovy:2.5
RUN mkdir /home/groovy/scripts
WORKDIR /home/groovy/scripts
COPY . .
CMD ["groovy", "ExploreScript.groovy"]
