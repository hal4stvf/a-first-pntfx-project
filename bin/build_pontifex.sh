#!/bin/bash
# run this from the basedir of the hugo folder

PONTIFEX_BASEDIR=`pwd`
# use local bin folder 
if [ ! -n "${PONTIFEX_BIN}" ]; then
    PONTIFEX_BIN=`pwd`/bin
fi
echo "Using Preprocessing routines from PONTIFEX_BIN=${PONTIFEX_BIN}"

BUILD_DIR=${PONTIFEX_BASEDIR}/content
INPUT_JSON="${PONTIFEX_BASEDIR}/nodes/graph.json"
jsonconverter="python3 ${PONTIFEX_BIN}/build_json.py"
hugoconverter="python3 ${PONTIFEX_BIN}/build_md.py"

# Preprocessing
preproc_nodes() {
  echo "Creating files for nodes..."
  local lang=$1
  cd ${PONTIFEX_BASEDIR}/nodes/$lang
  for i in ???
  do 
      ## Pandoc
      mkdir -p $i
      touch $i/$i.tex #delete this line once all nodes have texfiles
      cp -f packs.tex $i/. #needed for pandoc processing
      pandoc -f latex -t html $i/$i.tex -o $i/$i-snippet.html --mathjax 
      rm -f $i/packs.tex #cleanup

      ## JSON Files and HUGO
      $jsonconverter $INPUT_JSON $i > $i/$i.json
      $hugoconverter $i
  done
}

# Copy preprocessing results to destination
copy_nodes() {
  echo "Copying files to HUGO..."
  local lang=$1
  if [ $lang = 'en' ] 
  then
    cd ${PONTIFEX_BASEDIR}/nodes/
  else
    cd ${PONTIFEX_BASEDIR}/nodes/$lang
  fi
  pwd
  for i in ???
  do
    first=${i:0:1}
    mkdir -p ${BUILD_DIR}/$lang/docs/chapter$first/$i
    cp $i/$i.json ${BUILD_DIR}/$lang/docs/chapter$first/$i
    cp $i.md ${BUILD_DIR}/$lang/docs/chapter$first/
    cp $i/*.jpg ${BUILD_DIR}/$lang/docs/chapter$first/$i
  done
}

preproc_nodes
copy_nodes 'en'
# check for german language nodes
if [ -d ${PONTIFEX_BASEDIR}/nodes/de ]
then
  preproc_nodes 'de'
  copy_nodes 'de'
fi

# Run Hugo
echo "Running HUGO..."
cd ${PONTIFEX_BASEDIR}

npm install 
./node_modules/.bin/hugo/hugo

echo "Done!"
echo "Run 

docker run -it --rm --name apache-server -p 8080:80 -v \`pwd\`/public:/usr/local/apache2/htdocs/ httpd:2.4-alpine

and open up 

http://localhost:8080/

in order to view the webpage.
"
