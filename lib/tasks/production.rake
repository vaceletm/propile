desc "Get the production database to local development"
task "get_prod_db" do
  sh 'scp agilesystems@propile.xpday.net:propile-prod/data/production.sqlite3 data/development.sqlite3'
end

desc "Get the production database to remote test"
task "get_prod_db_to_test" do
  sh 'ssh agilesystems@propile.xpday.net cp -v propile-test/data/development.sqlite3 propile-test/data/development.sqlite3.backup'
  sh 'ssh agilesystems@propile.xpday.net cp -v propile-prod/data/production.sqlite3 propile-test/data/development.sqlite3'
end

desc "extract public program from propile.xpday.net as static pages to publish on xpdays.net"
task "extract_public_program" do
  sh 'ssh agilesystems@propile.xpday.net  rm -rf tmp/public_program'
  sh 'ssh agilesystems@propile.xpday.net  wget -E -m -nH -k -P tmp/public_program http://localhost:3000/programs/public '
  sh 'ssh agilesystems@propile.xpday.net  rm -rf public/public_program'
  sh 'ssh agilesystems@propile.xpday.net  mv tmp/public_program public'
end

