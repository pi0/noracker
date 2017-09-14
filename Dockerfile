FROM node

ENV DEBIAN_FRONTEND=noninteractive \
    PATH=/opt/oracle/instantclient:$PATH \
    ORACLE_HOME=/opt/oracle/instantclient \
    DYLD_FALLBACK_LIBRARY_PATH=/opt/oracle/instantclient \
    DYLD_LIBRARY_PATH=/opt/oracle/instantclient \
    LD_LIBRARY_PATH=/opt/oracle/instantclient:$LD_LIBRARY_PATH \
    OCI_LIB_DIR=/opt/oracle/instantclient \
    OCI_INC_DIR=/opt/oracle/instantclient/sdk/include

RUN apt-get update && \
    apt-get install -y libaio1 && \
    rm -rf /var/lib/apt/lists/* && apt-get purge -y --auto-remove && \    
    mkdir -p /opt/oracle && \
    cd /opt/oracle && \
    curl -#L https://github.com/pi0/noracker/raw/resources/instantclient_11_2.tgz | tar -xvzf- && \
    mv -v instantclient* instantclient && \
    cd instantclient && \
    ln -vs libclntsh.so.* libclntsh.so

