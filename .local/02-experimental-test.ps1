git add -A
git commit -m "Experimental Update"
git push -u origin experimental

ssh root@192.168.31.6 "cd /root/admin && git fetch origin experimental && git switch -C experimental FETCH_HEAD"