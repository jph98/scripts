Maintenance Page .htaccess Rewrite Rule

    Options +FollowSymlinks
    RewriteEngine on
    RewriteCond %{REMOTE_ADDR} !^128\.0\.0\.1$
    RewriteRule .* http://maintenance.page.com [R=301,L]
