FROM peterevans/vegeta:6.7.0

ARG RATE_PER_SECOND
ARG DURATION
ARG MAX_CONNECTIONS

COPY config config

CMD ulimit -n 99999
CMD vegeta attack -targets config -format http -rate=${RATE_PER_SECOND} -duration=${DURATION} -connections ${MAX_CONNECTIONS} | tee results.bin | vegeta report
