# Brief instructions for Purism warrant canary
#
# The below steps are used for reference as long as Purism can comply
# with the Warrant Canary, follow the below steps to update
# the warrant canary file

export WCDATE='20180401'

# Step 1
# create new warranty canary
cp purism-warrant-canary-<last>.txt purism-warrant-canary-$WCDATE.txt

# Step 2
# edit the warranty canary to reflect the updated date information
# and remove news feed
vi purism-warrant-canary-$WCDATE.txt

# Step 3
# append current news feed:
curl --silent "http://feeds.reuters.com/reuters/scienceNews" | xmllint --xpath //item//title - | sed "s/<title>//g" | sed "s/<\/title>/\n/g" >> purism-warrant-canary-$WCDATE.txt

# Step 4
# GPG Sign
gpg --output purism-warrant-canary-$WCDATE.txt.sig.todd --clearsign purism-warrant-canary-$WCDATE.txt
gpg --output librem-hardware-warrant-canary-$WCDATE.txt.sig.todd --clearsign librem-hardware-warrant-canary-$WCDATE.txt
gpg --output pureos-software-warrant-canary-$WCDATE.txt.sig.todd --clearsign pureos-software-warrant-canary-$WCDATE.txt
gpg --output purist-services-warrant-canary-$WCDATE.txt.sig.todd --clearsign purist-services-warrant-canary-$WCDATE.txt

# Step 5
# git add
git add *$WCDATE*

# Step 6
# git commit
git commit

# Step 7
# git push
git push

