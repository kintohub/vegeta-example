FROM peterevans/vegeta:6.7.0

COPY config config
CMD ulimit -n 99999

CMD vegeta attack -targets config -format http -rate=50000 -duration=30s | tee results.bin | vegeta report
