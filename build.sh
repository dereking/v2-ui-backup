#!/usr/bin/env bash

pip install -r requirements.txt

pyinstaller v2-ui.py -y \
  --clean \
  --workpath build \
  --distpath dist \
  --add-data templates:templates \
  --add-data static:static \
  --add-data translations:translations \
  --add-data bin:bin \
  --add-data template_config.json:. \
  --add-data v2-ui.service:. \
  --specpath .

cd dist

cp -r v2-ui/_internal/bin ./v2-ui/
cp v2-ui/_internal/v2-ui.service ./v2-ui/v2-ui.service

tar zcvf v2-ui-linux.tar.gz v2-ui