FROM google/cloud-sdk:latest
MAINTAINER Michael Kuck <me@michael-kuck.com>

# Install cron
RUN \
	apt-get update && \
	apt-get -y install cron && \
	apt-get autoremove && \
	apt-get clean

# Setup cron job
ADD crontab /etc/cron.d/gs-backup-cron
RUN chmod 0644 /etc/cron.d/gs-backup-cron
RUN touch /var/log/cron.log

# Install backup scripts
ADD entrypoint.sh /backup/entrypoint.sh
RUN chmod 0744 /backup/entrypoint.sh
ADD backup.sh /backup/backup.sh
RUN chmod 0744 /backup/backup.sh

# Install & configure google cloud
ADD keys /backup/keys

# Expose ENV
ENV SOURCE_GS_BUCKET gs://sourcebucket
ENV TARGET_GS_BUCKET gs://targetbucket

# Configure runtime
WORKDIR /backup
CMD ["sh", "/backup/entrypoint.sh"]