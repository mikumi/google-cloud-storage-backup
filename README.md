# google-cloud-storage-backup

In case you are using docker (should probably should!), I created a docker image that runs daily timestamped backups of your Firebase Storage into a specified Google Cloud Storage bucket.

- Create new Google Cloud service account here: https://console.cloud.google.com/iam-admin/serviceaccounts, e.g. `[project-name]-backup`, download the private key in .json format
- Pull docker image from https://www.github.com/mikumi/google-cloud-storage-backup
- Go into the cloned directory and create docker image like this: `docker build -t gs-backup .`
- Copy private key file into google-cloud-storage-backup folder and name it auth_key.json
- For your daily backups deploy the docker image like this: `docker run -d -e "SOURCE_GS_BUCKET=gs://[firebase-bucket].appspot.com" -e "TARGET_GS_BUCKET=gs://[backup-bucket-name]" gs-backup`