REPOSITORY_PATH = /mnt/altair/repository/deadline/DeadlineRepository10

docker run -ti --rm \
	-v $(pwd)/installers:/installers \
	-v $REPOSITORY_PATH:/installdir \
	-w /installers \
	ubuntu:latest bash -c "
		echo Installing Deadline Repository 10.0 into $REPOSITORY_PATH..;\
		./DeadlineRepository-10.*-linux-x64-installer.run \
	    --mode unattended \
		--dbLicenseAcceptance accept \
		--requireSSL false \
	    --dbhost vega \
	    --dbport 27017 \
	    --prefix /installdir \
	    --installmongodb false \
	    --prepackagedDB false; \
	echo Finished successfully"