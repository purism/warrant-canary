# Brief instructions for Purism warrant canary
#
# The below steps are used for reference as long as Purism can comply
# with the Warrant Canary, follow the below steps to update
# the warrant canary file
#
# Step 1
# create new warranty canary
cp purism-warrant-canary-<last>.txt purism-warrant-canary-<current>.txt

# Step 2
# edit the warranty canary to reflect the updated date information
# and remove news feed
vi purism-warrant-canary-<current>.txt

# Step 3
# append current news feed:
curl --silent "http://feeds.reuters.com/reuters/scienceNews" | xmllint --xpath //item//title - | sed "s/<title>//g" | sed "s/<\/title>/\n/g" >> purism-warrant-canary-<current>.txt

# Step 4
# GPG Sign
gpg --output file.sig.todd --clearsign file.txt

# Step 5
# git add
git add purism-warrant-canary-<current>.txt

# Step 6
# git commit
git commit

# Step 7
# git push
git push

