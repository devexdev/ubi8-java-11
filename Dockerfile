FROM registry.access.redhat.com/ubi8/openjdk-11

USER root
RUN microdnf update -y \
  && cd / \
  && JAVA_SECURITY_FILE=$(find . -name java.security 2> /dev/null) \
  && sed -i 's/jdk.tls.disabledAlgorithms=/jdk.tls.disabledAlgorithms=SSLv2Hello, DES40_CBC, RC4_40, SSLv2, TLSv1, TLSv1.1, /g' $JAVA_SECURITY_FILE \
  && microdnf clean -y all

USER jboss
WORKDIR /home/jboss
