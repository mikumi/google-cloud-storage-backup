# google-cloud-storage-backup

In case you are using docker (should probably should!), I created a docker image that runs daily timestamped backups of your Firebase Storage into a specified Google Cloud Storage bucket.

- Create new Google Cloud service account here: https://console.cloud.google.com/iam-admin/serviceaccounts, e.g. `[project-name]-backup`, download the private key in .json format
- Create a storage bucket for backups (I use Nearline storage): https://console.cloud.google.com/storage/browser/
- Pull docker image from https://www.github.com/mikumi/google-cloud-storage-backup
- Go into the cloned directory and create docker image like this: `docker build -t gs-backup .`
- Copy private key file into _google-cloud-storage-backup/keys_ folder. Give it a name like `gs-projectname-auth.json`
- For your daily backups deploy the docker image like this: `docker run -d -e "SOURCE_GS_BUCKET=gs://[firebase-bucket].appspot.com" -e "TARGET_GS_BUCKET=gs://[backup-bucket-name]" -e "GS_AUTH_FILE=gs-projectname-auth.json" gs-backup`