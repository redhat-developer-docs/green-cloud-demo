echo ============================================
echo Deploying Green Cloud Demo Documentation
echo ============================================

cd doc && \
mvn -Phtml,pdf package && \
git clone -b gh-pages https://kameshsampath:${GITHUB_TOKEN}@github.com/redhat-developer-docs/green-cloud-demo.git gh-pages && \
git config --global user.email "kamesh.sampath@hotmail.com" && \
git config --global user.name "Red Hat Developers" && \
cp -rv target/generated-docs/* gh-pages/ && \
cd gh-pages && \
mv index.pdf green-cloud-demo.pdf && \
git add --ignore-errors * && \
git commit -m "generated documentation" && \
git push origin gh-pages && \
cd .. && \
rm -rf gh-pages target
