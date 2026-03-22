source ~/miniconda3/bin/activate
conda activate robot37

cd /app

# python /app/scripts/convert/svo_to_mp4.py --lab CLVR --lab_agnostic False
python /app/scripts/convert/svo_to_mp4_right.py
