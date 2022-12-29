# Purpose: Unzip raw data files and copy to s3
# Author: Gary A. Stafford
# Date: 2022-12-29
# sh ./raw_date_to_s3.sh

# ** REPLACE ME! **
s3_bucket="<your_s3_bucket_name>"

pushd raw_tickit_data/
unzip tickit_data.zip
popd

declare -a TableArray=("category" "date" "event" "listing" "sale" "user" "venue")

for table in "${TableArray[@]}"; do
    aws s3 cp ./raw_tickit_data/$table.txt s3://$s3_bucket/raw_tickit_data/$table/
done