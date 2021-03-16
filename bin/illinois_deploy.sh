
bundle exec jekyll build
rsync -a -e "ssh -i ~/.ssh/id_rsa" ./_site/ negar@negar.web.illinois.edu:~/public_html/
