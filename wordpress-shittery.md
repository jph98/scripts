# Wordpress Shittery 

Scripts/notes for Wordpress shittery.

## User Data

Getting user data:

    https://codex.wordpress.org/Function_Reference/get_userdata

## Checking user events

Is the user logged in?

    is_user_logged_in
    
## Functions firing

Firing a function before a page loads:

    function check_page() {	
      if (is_page('shittery') && is_user_logged_in()) {
        $user = wp_get_current_user();
        wp_redirect(home_url('/nonshittery/' . $user->user_nicename));
        die;
      } elseif (is_page('shittery')) {
        wp_redirect(home_url('/'));
      }
    }
    add_action('template_redirect', 'check_page');
    
## Writing a very basic Wordpress plugin

It's really quite easy and quite shit:

https://www.sitepoint.com/real-world-example-wordpress-plugin-development/

## Misc

* Template shittery - https://premium.wpmudev.org/blog/developer-super-cheat-sheet/
* Functions shittery - https://startbloggingonline.com/wordpress-cheat-sheet/
