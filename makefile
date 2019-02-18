./data/trump_schedule.json: ./data/trump_schedule.tsv ./scripts/convert_to_minutes.py ./scripts/tojson.py
	python ./scripts/tojson.py < ./data/trump_schedule.tsv | python ./scripts/convert_to_minutes.py > ./data/trump_schedule.json

./data/trump_schedule.tsv: ./data/trump_schedule.txt ./scripts/wrangle.awk ./scripts/wrangle2.py
	tr -d '\f' < ./data/trump_schedule.txt | awk -f ./scripts/wrangle.awk | python ./scripts/wrangle2.py > ./data/trump_schedule.tsv

./data/trump_schedule.txt: ./data/trump_schedule.pdf ./scripts/pdftotext
	./scripts/pdftotext ./data/trump_schedule.pdf ./data/trump_schedule.txt

./data/events.txt: ./data/trump_schedule.tsv
	tail -n +2 < ./data/trump_schedule.tsv | awk -F '\t' '{print $$3}' | sort | uniq > ./data/events.txt
