## RESTART the Display Manager

AIM: in a TEXT Console, **RESTART** the Display Manager...

### Find the 'display manager'

https://unix.stackexchange.com/questions/20370/is-there-a-simple-linux-command-that-will-tell-me-what-my-display-manager-is


```sh
# // On Debian/Ubuntu
cat /etc/X11/default-display-manager

# == /usr/sbin/lightdm  # // for MX Linux (Debian)
```

- `lightdm` (on MX Linux (Debian))

### `sudo service ...`

"system has NOT been booted with **systemd** as init system"
https://linuxgenie.net/fix-system-not-booted-with-systemd/

> You can look at the error output stating that the “system has not been booted with systemd as the init system.”
>
> To fix this, you must use the **correct init system** on WSL. For example, if you have to start the SSH server on the WSL, then use the following command:
>
> **`sudo service ssh start`**

Also:
- WSL: https://askubuntu.com/questions/1379425/system-has-not-been-booted-with-systemd-as-init-system-pid-1-cant-operate


### `sudo service lightdm RESTART` - in TEXT Console 

- In a 'TEXT Console' (e.g. `Ctrl-Alt-F1`)

```sh
# !! NOTE: in a TEXT console (e.g. Ctrl-Alt-F1)
sudo service lightdm restart
```
