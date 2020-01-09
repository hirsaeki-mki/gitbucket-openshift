FROM openjdk:8-jre-alpine

LABEL maintainer="Hiroshi Saeki"

ENV GITBUCKET_HOME=/gitbucket GITBUCKET_TMPDIR=${GITBUCKET_HOME}/tmp

ADD https://github.com/gitbucket/gitbucket/releases/download/4.33.0/gitbucket.war /opt/gitbucket.war

RUN mkdir -p $GITBUCKET_HOME $GITBUCKET_TMPDIR; \
    chmod -R a+rwx $GITBUCKET_HOME /opt $GITBUCKET_TMPDIR
# Port for web page
EXPOSE 8080
# Port for SSH access to git repository (Optional)
EXPOSE 29418

USER 1001

CMD ["sh", "-c", "java -jar /opt/gitbucket.war"]
