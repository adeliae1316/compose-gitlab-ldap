# GitLab CE and LDAP server on local machine with docker

Compose file to launch GitLab CE and LDAP server on the local machine.  

***[caution]***

- this provides HTTP(non-tls) environment.
- arm64 version of gitlab docker image is not provided. checking with amd64 version.

## Configuration Changes

Only special notes should be noted.

- GitLab
    - Enable LFS.
    - Enable LDAP.
    - Enable Pages.
    - Disable TLS.
- LDAP
    - Disable TLS.

## Usage

1. Edit [env](.env) file.

2. Launch the container.

    Execute the following command.

    ```bash
    docker-compose up -d
    ```

    Wait a little until the following log is output.  
    Check log with `docker-compose logs -f web` .

    ```plain
    gitlab-ce       | 
    gitlab-ce       | ==> /var/log/gitlab/nginx/gitlab_error.log <==
    gitlab-ce       | 
    gitlab-ce       | ==> /var/log/gitlab/nginx/access.log <==
    gitlab-ce       | 
    gitlab-ce       | ==> /var/log/gitlab/nginx/current <==
    gitlab-ce       | 
    gitlab-ce       | ==> /var/log/gitlab/nginx/gitlab_pages_error.log <==
    gitlab-ce       | 
    gitlab-ce       | ==> /var/log/gitlab/nginx/error.log <==
    gitlab-ce       | 
    ```

3. Open in browser.

- GitLab

    http://192.168.XXX.YYY:20080

- phpLDAPadmin

    http://192.168.XXX.YYY:20081

## When in trouble 

- When you don't know the initial root password for GitLab.
    - see `./gitlab/config/initial_root_password` .
- When you want to apply a sample DIF.
    - execute `docker exec openldap ldapmodify -Y EXTERNAL -H ldapi:/// -f /tmp/init.ldif` .
- When you want to reset all data.
    1. execute `docker-compose down && docker-compose rm` .
    2. execute `sudo rm -r gitlab/config/ gitlab/data/ gitlab/logs/ openldap/ldap/ openldap/slapd/` .

## Thanks

- [gitlab/gitlab-ce](https://hub.docker.com/r/gitlab/gitlab-ce)
- [osixia/phpldapadmin](https://hub.docker.com/r/osixia/phpldapadmin)
- [osixia/openldap](https://hub.docker.com/r/osixia/openldap)
