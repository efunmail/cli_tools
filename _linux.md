## Set-up

- [debian] Date and Time

```sh
sudo date -s '2024-11-10 22:06'
# == Sun Nov 10 10:06:00 PM GMT 2024
```

- Keyboard

```sh
setxkbmap -option caps:escape
```

- Internet / Network / WiFi

```sh
nmtui
```

## Hardware

- Battery

```sh
upower -i $(upower -e | grep BAT) |less
```
