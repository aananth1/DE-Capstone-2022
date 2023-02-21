# export $(grep -v '^#' .env | xargs)
# export $(grep -v '^#' .env | sed -e 's/[\r\n]//g')
# export $(grep -v '^#' aws s3 cp s3://traffic-monitor-env-s3-bucket/.env | sed -e 's/[\r\n]//g')
eval $(aws s3 cp s3://traffic-monitor-env-s3-bucket/.env - | sed 's/^/export /')
echo $server
echo $username
echo $password
python producer.py -f confluent.config -t traffic-monitor-topic -d 1