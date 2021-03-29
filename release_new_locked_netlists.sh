# After committing updates to master, checkout this branch and run this script to release a new set of locked netlists
git merge -X theirs master
./lock_netlists.py
git commit -a -m "Release new locked netlists"
git push
