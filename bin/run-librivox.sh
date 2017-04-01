#!/bin/sh
set -xe
if [ ! -f DeepSpeech.py ]; then
    echo "Please make sure you run this from DeepSpeech's top level directory."
    exit 1
fi;

if [ ! -d "${ds_dataroot}" ]; then
    ds_dataroot = "data"
fi;

python -u DeepSpeech.py \
  --train_files "$ds_dataroot/librivox-train-clean-100.csv" \
                "$ds_dataroot/librivox-train-clean-360.csv" \
                "$ds_dataroot/librivox-train-other-500.csv" \
  --dev_files "$ds_dataroot/librivox-dev-clean.csv" \
              "$ds_dataroot/librivox-dev-other.csv" \
  --test_files "$ds_dataroot/librivox-test-clean.csv" \
               "$ds_dataroot/librivox-test-other.csv" \
  --train_batch_size 12 \
  --dev_batch_size 12 \
  --test_batch_size 12 \
  --learning_rate 0.0001 \
  --epoch 15 \
  --display_step 5 \
  --validation_step 5 \
  --dropout_rate 0.30 \
  --default_stddev 0.046875 \
  "$@"
