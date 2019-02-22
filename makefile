./data/trump_schedule.json: ./venv/lib/python2.7/site-packages/sklearn ./data/trump_schedule.tsv ./scripts/convert_to_minutes.py ./scripts/tojson.py ./scripts/make_tfidf_groups.py
	python ./scripts/tojson.py < ./data/trump_schedule.tsv | venv/bin/python ./scripts/convert_to_minutes.py | venv/bin/python ./scripts/make_tfidf_groups.py 9 > ./data/trump_schedule.json

./data/trump_schedule.tsv: ./data/trump_schedule.txt ./scripts/wrangle.awk ./scripts/wrangle2.py
	tr -d '\f' < ./data/trump_schedule.txt | awk -f ./scripts/wrangle.awk | venv/bin/python ./scripts/wrangle2.py > ./data/trump_schedule.tsv

./data/trump_schedule.txt: ./data/trump_schedule.pdf ./scripts/pdftotext
	bash ./scripts/make_into_text.bash

./data/events.txt: ./data/trump_schedule.tsv
	tail -n +2 < ./data/trump_schedule.tsv | awk -F '\t' '{print $$3}' | sort | uniq > ./data/events.txt

./venv/bin/activate: /usr/local/bin/virtualenv
	virtualenv venv

./venv/lib/python2.7/site-packages/sklearn: ./venv/bin/activate requirements.txt
	venv/bin/pip install -r requirements.txt

/usr/local/bin/virtualenv: 
	pip install virtualenv
