#!/usr/bin/env sh

# docker inspect --format='{{.Config.Entrypoint}}' image_id
# docker inspect --format='{{.Config.Cmd}}' image_id

head -n -2 /assets/wrapper > /assets/wrapper_ep
chmod 744 /assets/wrapper_ep

# https://gitlab.com/gitlab-org/omnibus-gitlab/-/issues/2837#note_898446295
echo 'echo "UPDATE application_settings SET signup_enabled = false" | gitlab-psql' >> /assets/wrapper_ep
# echo 'gitlab-ctl reconfigure' >> /assets/wrapper_ep

echo '# Wait for SIGTERM' >> /assets/wrapper_ep
echo 'wait' >> /assets/wrapper_ep

/assets/wrapper_ep
