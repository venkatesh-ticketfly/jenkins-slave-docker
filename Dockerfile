FROM java:openjdk-6

COPY bin/gvm-exec.sh /usr/local/bin/gvm-exec.sh
ENTRYPOINT ["/usr/local/bin/gvm-exec.sh"]

# # gvm requires curl and unzip
# RUN apt-get update && \
#     apt-get install -yqq --no-install-recommends curl unzip && \
#     apt-get clean && \
#     rm -rf /var/lib/apt/lists/*
