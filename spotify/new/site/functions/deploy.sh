cp $2$3 ./$3
echo "deploying $1"

eval "gcloud functions deploy $1 --runtime nodejs8 --trigger-http"

sleep 1

echo "removing $3"

rm -f ./$3