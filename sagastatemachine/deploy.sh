docker service update --with-registry-auth=true \
--env-add=TZ=Asia/Bangkok \
--env-add=RABBIT_SETTINGS:host=rabbitmq://rabbitmq/ \
--env-add=RABBIT_SETTINGS:username=admin \
--env-add=RABBIT_SETTINGS:password=1234 \
--replicas 1 \
--image='dockerhiscis/sagastatemachine:demo-latest' \
--update-parallelism 2 \
--update-order='start-first' \
--update-failure-action='rollback' \
--update-delay 5s \
--rollback-parallelism 0 \
--rollback-order=stop-first \
--restart-condition='any' \
--restart-delay 5s \
--restart-max-attempts 3 \
--restart-window 120s \
--health-cmd='curl --fail http://localhost:80/health || exit 1' \
--health-interval 5s \
--health-retries 2 \
--health-start-period 2s \
--health-timeout 10s \
his_sagastatemachine
