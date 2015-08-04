CRAWL_COMMAND="$1 $2 $3"
CRAWL_NAME=$2
NUTCH_PATH=$4
SCREEN_NAME=$STY
OUTPUT_PATH="/mnt/var/lib/hadoop/local_data/"
cd "$NUTCH_PATH/runtime/deploy"

./bin/crawl $CRAWL_COMMAND | tee bashout.txt

DATE=$(date)
TEMP="${DATE// /_}"
OUTPUT_FOLDER="${TEMP//:/_}"
OUTPUT_PATH_FULL="$OUTPUT_PATH$CRAWL_NAME_$OUTPUT_FOLDER"
mkdir $OUTPUT_PATH_FULL


STATUS="The $CRAWL_NAME crawl has concluded on the EMR on the screen $SCREEN_NAME. Find the status in the file bashout.txt in $NUTCH_PATH/runtime/deploy"
SUBJECT="CRAWL STATUS $CRAWL_NAME crawl completed on EMR"
echo $STATUS | mail -s "$SUBJECT" memex-jpl@googlegroups.com

hadoop fs -copyToLocal ./$CRAWL_NAME/* $OUTPUT_PATH_FULL

STATUS="Copying the data to the local folder: $OUTPUT_PATH_FULL"
SUBJECT="DATA TRANSFERRED TO LOCAL for $CRAWL_NAME"
echo $STATUS | mail -s "$SUBJECT" memex-jpl@googlegroups.com